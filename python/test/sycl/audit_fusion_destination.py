"""Audit exact fusion-destination coverage, provenance and paired device samples."""
import argparse
import hashlib
import itertools
import json
import pathlib
import statistics


def audit(directory, repository):
    def read(name):
        return json.loads((directory / (name + '.json')).read_text())

    provenance = read('fusion-destination-provenance')
    binary = provenance['python/triton/_C/libtriton.so']
    for name, expected in provenance.items():
        if name == 'python/triton/_C/libtriton.so':
            continue
        assert hashlib.sha256((repository / name).read_bytes()).hexdigest() == expected, name
        if name.endswith('.py'):
            frozen = directory / 'frozen-harnesses' / pathlib.Path(name).name
            assert hashlib.sha256(frozen.read_bytes()).hexdigest() == expected, frozen

    manifest = read('fusion-destination-jobs')
    cases = {'single', 'chain', 'nested', 'ieee', 'sum'}
    assert len(manifest) == 5 and {r['case'] for r in manifest} == cases
    jobs = {r['job'] for r in manifest}
    assert len(jobs) == 5
    states = {}
    for line in (directory / 'fusion-destination-status.txt').read_text().splitlines():
        fields = line.strip().split('|')
        assert len(fields) >= 5 and fields[0].isdigit(), fields
        job = int(fields[0])
        assert job not in states and fields[1] == 'COMPLETED' and fields[3] == '0:0', fields
        states[job] = fields
    assert set(states) == jobs

    contracts = read('fusion-destination-contracts')
    expected_contracts = set(itertools.product((False, True), (False, True), (False, True), (1, 2)))
    assert len(contracts) == 16
    assert {(r['chain'], r['nested'], r['read_output'], r['repeats']) for r in contracts} == expected_contracts
    assert all(r['status'] == 'PASS' for r in contracts)
    regressions = {}
    for suite, count in (('pass_contracts', 150), ('ordered_unroll_contracts', 71), ('accumulator_init_contracts', 55)):
        rows = read('fusion-destination-regression-' + suite)
        assert len(rows) == count and all(r['status'] == 'PASS' for r in rows), suite
        assert len({r['case'] for r in rows}) == count, suite
        regressions[suite] = count

    historical = repository / 'docs/backend/sycl-validation/cooperative-staging'
    layouts = read('fusion-destination-layout-invariants')
    expected_layouts = {}
    for size in ('small', 'wide'):
        old = json.loads((historical / f'staging-layout-cpu-{size}.json').read_text())
        assert len(old) == 44 and all(r['status'] == 'PASS' for r in old)
        for row in old:
            for schedule in row['schedules']:
                expected_layouts[size, row['case'], schedule['schedule']] = schedule['source_sha256']
    assert len(layouts) == len(expected_layouts) == 176
    seen = set()
    for row in layouts:
        key = row['tile_shape'], row['case'], row['schedule']
        assert key not in seen and row['status'] == 'PASS', key
        seen.add(key)
        assert row['source_sha256'] == row['expected_sha256'] == expected_layouts[key], key
    assert seen == set(expected_layouts)

    comparisons = read('fusion-fixed-source-compare')
    assert len(comparisons) == 24
    assert {(r['case'], r['stage'], r['fuse'], r['reuse']) for r in comparisons} == set(
        itertools.product(('sum', 'indirect', 'rank3'), (False, True), (False, True), (False, True)))
    for case in ('sum', 'indirect', 'rank3'):
        old = json.loads((historical / f'staging-boundary-cpu-{case}.json').read_text())
        lookup = {(r['stage'], r['fuse'], r['reuse']): r for r in old}
        for row in (r for r in comparisons if r['case'] == case):
            ref = lookup[row['stage'], row['fuse'], row['reuse']]
            assert row['source_equal'] and row['old_source'] == row['new_source'] == ref['source_sha256']
            assert row['old_generics'] == row['new_generics'] == ref['linalg_generics']

    original_failure = json.loads((historical / 'staging-boundary-cpu-loop.json').read_text())
    assert len(original_failure) == 8
    assert sum(r['status'] == 'EXPECTED_COMPILE_FAILURE' for r in original_failure) == 4
    repaired = read('fusion-destination-loop-compile')
    assert len(repaired) == 8 and all(r['status'] == 'PASS' for r in repaired)
    assert {(r['stage'], r['fuse'], r['reuse']) for r in repaired} == set(itertools.product((False, True), repeat=3))
    assert all(r['elements_checked'] == 0 and not r['samples_ns'] for r in repaired)

    cpu_by_case = {}
    for case in ('single', 'chain', 'nested', 'ieee'):
        rows = read('fusion-destination-cpu-' + case)
        assert len(rows) == 8
        lookup = {(r['fuse'], r['stage'], r['reuse']): r for r in rows}
        assert set(lookup) == set(itertools.product((False, True), repeat=3))
        for row in rows:
            assert row['status'] == 'PASS' and row['case'] == case and row['count'] == 3
            assert row['elements_checked'] == 4632 and row['samples_ns'] == [] and row['median_ns'] is None
            assert row['linalg_generics'] == (2 if case == 'chain' else 1)
        cpu_by_case[case] = lookup

    performance = []
    gpu_rows = gpu_elements = timed_rows = 0
    for spec in manifest:
        case, job = spec['case'], spec['job']
        expected_count = 8 if case == 'ieee' else 24
        assert spec['expected_rows'] == expected_count
        rows = read(f'fusion-destination-dcu-{job}')
        assert len(rows) == expected_count
        log = (directory / f'sycl-fusion-destination-{job}.log').read_text()
        script = (directory / 'submitted-scripts' / f'{job}.sbatch').read_text()
        assert 'gfx906:sramecc-:xnack-' in log and binary in log
        assert 'set -eo pipefail' in script and binary + '  python/triton/_C/libtriton.so' in script
        assert 'python/triton/_C/libtriton.so: OK' in log
        for name in ('third_party/sycl/lib/Conversion/LinalgToAffineLoops/ElementwiseFusion.cpp',
                     'python/test/sycl/fusion_destination_semantics.py'):
            assert provenance[name] + '  ' + name in script and name + ': OK' in log
        lookup = {}
        rounds = 1 if case == 'ieee' else 3
        for row in rows:
            key = row['round'], row['fuse'], row['stage'], row['reuse']
            assert key not in lookup
            lookup[key] = row
            assert row['case'] == case and row['status'] == 'PASS'
            expected_elements = 30 if case == 'sum' else 4632
            assert row['elements_checked'] == expected_elements
            if case != 'sum':
                cpu = cpu_by_case[case][row['fuse'], row['stage'], row['reuse']]
                for field in ('source_sha256', 'linalg_generics', 'elements_checked', 'count'):
                    assert row[field] == cpu[field], (case, key, field)
            else:
                assert row['collectives'] == 1 and row['stages'] == int(row['stage'])
                assert row['linalg_generics'] == (2 if row['fuse'] else 3)
                assert row['local_bytes'] == (2052 if row['fuse'] else 3076)
            samples = row['samples_ns']
            if case == 'ieee':
                assert samples == [] and row['median_ns'] is None
            else:
                assert len(samples) == 31 and all(isinstance(x, int) and x > 0 for x in samples)
                assert statistics.median(samples) == row['median_ns']
                timed_rows += 1
            gpu_rows += 1
            gpu_elements += expected_elements
        assert set(lookup) == set(itertools.product(range(rounds), (False, True), (False, True), (False, True)))
        for stage, reuse in itertools.product((False, True), repeat=2):
            before = [lookup[r, False, stage, reuse] for r in range(rounds)]
            after = [lookup[r, True, stage, reuse] for r in range(rounds)]
            for side in (before, after):
                assert len({r['source_sha256'] for r in side}) == 1
            if case in ('single', 'nested', 'ieee'):
                assert before[0]['source_sha256'] == after[0]['source_sha256']
            if case == 'ieee':
                continue
            ratios = [a['median_ns'] / b['median_ns'] for a, b in zip(before, after)]
            performance.append(dict(case=case, stage=stage, reuse=reuse,
                identical_source=before[0]['source_sha256'] == after[0]['source_sha256'],
                speedup=statistics.median(r['median_ns'] for r in before) / statistics.median(r['median_ns'] for r in after),
                round_ratios=ratios))
    assert gpu_rows == 104 and gpu_elements == 371280 and timed_rows == 96
    active = [r for r in performance if not r['identical_source']]
    assert len(active) == 8
    return dict(status='PASS', jobs=5, contracts=16, regressions=regressions,
        historical_failures_repaired=4, layout_source_invariants=176, other_source_invariants=24,
        cpu_runtime_configurations=32, cpu_elements_checked=148224,
        gpu_runtime_configurations=gpu_rows, gpu_elements_checked=gpu_elements,
        timed_configurations=timed_rows, timing_samples=timed_rows * 31,
        performance=performance, active_comparisons=len(active),
        active_speedup_range=[min(r['speedup'] for r in active), max(r['speedup'] for r in active)],
        active_improved_rounds=sum(x > 1 for r in active for x in r['round_ratios']))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=pathlib.Path)
    parser.add_argument('--output', type=pathlib.Path, required=True)
    args = parser.parse_args()
    result = audit(args.directory, pathlib.Path(__file__).resolve().parents[3])
    args.output.write_text(json.dumps(result, indent=2) + chr(10))
    print(json.dumps({k: v for k, v in result.items() if k != 'performance'}))


if __name__ == '__main__':
    main()
