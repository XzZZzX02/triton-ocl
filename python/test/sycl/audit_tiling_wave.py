"""Audit archived tiling-wave evidence; fail on missing or mismatched coverage."""
import argparse
import hashlib
import itertools
import json
import pathlib
import runpy

from analyze_tiling_wave import analyze


def audit(directory, repository):
    def read(name):
        return json.loads((directory / (name + '.json')).read_text())

    provenance = read('tile-wave-final-provenance')
    binary_hash = provenance['python/triton/_C/libtriton.so']
    for name, expected in provenance.items():
        if name == 'python/triton/_C/libtriton.so':
            continue  # The build binary is verified in every device log.
        assert hashlib.sha256((repository / name).read_bytes()).hexdigest() == expected, name

    perf_ids = (22688636, 22688637, 22688638, 22688639, 22688640, 22688642)
    layout_manifest = read('tile-wave-layout-jobs')
    ieee_manifest = read('tile-wave-ieee-jobs')
    assert len(layout_manifest) == 8 and len(ieee_manifest) == 8
    assert {(r['size'], r['shard']) for r in layout_manifest} == set(
        itertools.product(('small', 'wide'), range(4)))
    all_ids = set(perf_ids) | {r['job'] for r in layout_manifest + ieee_manifest}
    assert len(all_ids) == 22
    states = {}
    for line in (directory / 'tile-wave-jobs.txt').read_text().splitlines():
        fields = line.strip().split('|')
        assert len(fields) >= 5 and fields[0].isdigit(), fields
        job = int(fields[0])
        assert job not in states and fields[1] == 'COMPLETED' and fields[3] == '0:0', fields
        states[job] = fields
    assert set(states) == all_ids
    for prefix, ids in (('sycl-tile-wave', perf_ids),
                        ('sycl-wave-layout', [r['job'] for r in layout_manifest]),
                        ('sycl-wave-ieee', [r['job'] for r in ieee_manifest])):
        for job in ids:
            log = (directory / f'{prefix}-{job}.log').read_text()
            assert 'gfx906:sramecc-:xnack-' in log and binary_hash in log, (prefix, job)

    contracts = {}
    for suite, expected in (('pass_contracts', 150), ('ordered_unroll_contracts', 71),
                            ('accumulator_init_contracts', 55)):
        rows = read('tile-wave-' + suite)
        assert len(rows) == expected and all(r['status'] == 'PASS' for r in rows), suite
        assert len({r['case'] for r in rows}) == expected, suite
        contracts[suite] = expected
    source_checks = {}
    for label, expected in (('initial', 56), ('boundary', 40)):
        rows = read('tile-wave-source-invariants-' + label)
        assert len(rows) == expected
        keys = {(tuple(r['shape']), r['layout'], r['dtype'], r['special'],
                 r['tiled'], r['unroll'], r['enabled']) for r in rows}
        assert len(keys) == expected
        assert all(r['status'] == 'PASS' and r['source_sha256'] == r['expected_sha256']
                   for r in rows), label
        assert sum(r['tile_fallback'] for r in rows) == 4, label
        source_checks[label] = dict(count=expected, changed=sum(r['changed'] for r in rows))

    cases = set(runpy.run_path(str(repository / 'python/test/sycl/model_layout_semantics.py'),
                              run_name='case_catalog')['CASES'])
    assert len(cases) == 44
    harness_hash = provenance['python/test/sycl/model_layout_semantics.py']
    layouts = {}
    for size in ('small', 'wide'):
        cpu = read('tile-wave-layout-cpu-' + size)
        gpu = []
        for shard in sorted((r for r in layout_manifest if r['size'] == size),
                            key=lambda r: r['shard']):
            rows = read(f'tile-wave-layout-{size}-{shard["job"]}')
            assert len(rows) == 11, shard
            gpu.extend(rows)
        assert len(cpu) == len(gpu) == 44
        assert {r['case'] for r in cpu} == {r['case'] for r in gpu} == cases
        cpu_by_case = {r['case']: r for r in cpu}
        active_tiles = 0
        for row in cpu + gpu:
            assert row['status'] == 'PASS' and row['harness_match'] is True, row['case']
            assert row['harness_sha256'] == row['expected_harness_sha256'] == harness_hash
            assert row['max_abs_error'] == 0 and row['elements_checked'] > 0
            assert row['tile_shape'] == size and row['local_shapes'] == [48, [3, 5]]
            assert row['logical_tile'] == ([8, 16, 16] if size == 'small' else [16, 16, 32])
            assert [s['schedule'] for s in row['schedules']] == ['optimized', 'forwarded']
            assert sum(s['elements_checked'] for s in row['schedules']) == row['elements_checked']
            for schedule in row['schedules']:
                expected_tile = size == 'wide' and row['precision'] == 'f16'
                expected = {'sycl.register_accumulator': True,
                            'sycl.register_tile =': expected_tile,
                            'sycl.register_tile_composed_accumulator': expected_tile,
                            'sycl.ordered_reduction_unroll': True,
                            'sycl.accumulator_init_forwarded': schedule['schedule'] == 'forwarded'}
                assert schedule['markers'] == expected, (row['case'], size, schedule)
                assert schedule['elements_checked'] > 0
        for row in gpu:
            other = cpu_by_case[row['case']]
            assert row['shape'] == other['shape'] and row['elements_checked'] == other['elements_checked']
            for got, want in zip(row['schedules'], other['schedules']):
                assert got == want, (size, row['case'], got, want)
                active_tiles += int(got['markers']['sycl.register_tile ='])
        assert active_tiles == (44 if size == 'wide' else 0), (size, active_tiles)
        layouts[size] = dict(cpu_cases=44, gpu_cases=44, active_gpu_tile_schedules=active_tiles,
                            elements_per_device=sum(r['elements_checked'] for r in cpu))

    initials = {'zero', 'negative_zero', 'finite', 'positive_inf', 'negative_inf',
                'nan', 'subnormal', 'negative_subnormal'}
    ieee = {}
    for dtype in ('f32', 'f16'):
        cpu = read('tile-wave-ieee-cpu-' + dtype)
        gpu = []
        for manifest in (r for r in ieee_manifest if r['dtype'] == dtype):
            rows = read(f'tile-wave-ieee-dcu-{manifest["job"]}')
            assert len(rows) == 4 and {r['initial'] for r in rows} == set(manifest['initials'])
            gpu.extend(rows)
        assert len(cpu) == len(gpu) == 16
        key = lambda r: (r['initial'], r['enabled'])
        expected = set(itertools.product(initials, (False, True)))
        assert {key(r) for r in cpu} == {key(r) for r in gpu} == expected
        by_key = {key(r): r for r in cpu}
        for row in cpu + gpu:
            assert row['status'] == 'PASS' and row['dtype'] == dtype
            assert row['factor'] == 4 and row['tiled'] == (dtype == 'f16')
            assert row['elements_checked'] == 2 * (3 * 16 * 16 + 7)
        for row in gpu:
            assert row == by_key[key(row)], (dtype, key(row))
        ieee[dtype] = dict(cpu_cases=16, gpu_cases=16,
                           elements_per_device=sum(r['elements_checked'] for r in cpu))
    jobs = [analyze(directory / f'tile-wave-dcu-{job}.json') for job in perf_ids]
    active = [c for job in jobs for c in job['comparisons'] if c['active']]
    assert len(active) == 12 and all(c['nonregressing_rounds'] == 3 for c in active)
    return dict(status='PASS', completed_gpu_jobs=22, contracts=contracts,
                source_invariants=source_checks, layouts=layouts, ieee=ieee,
                performance_rows=sum(j['rows'] for j in jobs),
                performance_elements=sum(j.get('elements_checked', 0) for j in jobs),
                active_tiling_comparisons=len(active),
                active_speedup_range=[min(c['speedup'] for c in active),
                                      max(c['speedup'] for c in active)],
                active_nonregressing_rounds=sum(c['nonregressing_rounds'] for c in active))


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory', type=pathlib.Path)
    p.add_argument('--repository', type=pathlib.Path, default=pathlib.Path(__file__).resolve().parents[3])
    p.add_argument('--output', required=True)
    args = p.parse_args()
    result = audit(args.directory, args.repository)
    pathlib.Path(args.output).write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()
