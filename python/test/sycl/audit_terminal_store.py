"""Fail closed on missing terminal-store proof, runtime, or performance evidence."""
import argparse
import ast
import hashlib
import itertools
import json
import pathlib
import runpy
import statistics

from analyze_terminal_store import analyze


def audit(directory, repository):
    def read(name):
        return json.loads((directory / (name + '.json')).read_text())

    provenance = read('terminal-final-provenance')
    binary = provenance['python/triton/_C/libtriton.so']
    for name, digest in provenance.items():
        if name == 'python/triton/_C/libtriton.so':
            continue
        assert hashlib.sha256((repository / name).read_bytes()).hexdigest() == digest, name
        if name.endswith('.py'):
            frozen = directory / 'frozen-harnesses' / pathlib.Path(name).name
            assert hashlib.sha256(frozen.read_bytes()).hexdigest() == digest, frozen

    manifests = {label: read(label + '-jobs') for label in ('terminal-final', 'terminal-layout', 'terminal-layout-perf')}
    assert {k:len(v) for k,v in manifests.items()} == {'terminal-final':9, 'terminal-layout':7, 'terminal-layout-perf':10}
    ids = {r['job'] for group in manifests.values() for r in group}
    assert len(ids) == 26
    states = {}
    for line in (directory / 'terminal-final-all-status.txt').read_text().splitlines():
        parts = line.strip().split('|')
        assert len(parts) >= 5 and parts[0].isdigit(), parts
        job = int(parts[0])
        assert job not in states and parts[1] == 'COMPLETED' and parts[3] == '0:0', parts
        states[job] = parts
    assert set(states) == ids
    for label, specs in manifests.items():
        for spec in specs:
            job = spec['job']
            log = (directory / f'sycl-{label}-{job}.log').read_text()
            script = (directory / 'submitted-scripts' / f'{job}.sbatch').read_text()
            assert 'gfx906:sramecc-:xnack-' in log and binary in log, job
            assert 'set -eo pipefail' in script and 'python/triton/_C/libtriton.so: OK' in log
            for name in ('third_party/sycl/lib/Conversion/LinalgToAffineLoops/TerminalStoreDistribution.cpp',
                         'third_party/sycl/lib/Conversion/LinalgToAffineLoops/WorkDistribution.cpp',
                         'third_party/sycl/backend/compiler.py'):
                assert provenance[name] + '  ' + name in script and name + ': OK' in log, (job, name)
            rows = read(f'{label}-dcu-{job}')
            assert len(rows) == spec['expected_rows'] and all(r['status'] == 'PASS' for r in rows), job

    contracts = read('terminal-store-contracts')
    assert len(contracts) == 241 and all(r['status'] == 'PASS' for r in contracts)
    assert len({(r['case'], tuple(r['pipeline'])) for r in contracts}) == 241
    enums = [r for r in contracts if r['case'].startswith('enumerated_')]
    assert len(enums) == 45
    for row in enums:
        modulus = 1 << min(row['bits'], 62)
        addresses = [sum(i*c for i,c in zip(coords, row['coefficients'])) % modulus
                     for coords in itertools.product(*(range(n) for n in row['shape']))]
        independent = len(addresses) == len(set(addresses))
        assert row['enumerated_unique'] == independent and (not row['transformed'] or independent)
    assert sum(r['case'] == 'forged_collision' for r in contracts) == 3
    assert all(not r['transformed'] for r in contracts if r['case'] == 'forged_collision')
    regressions = {}
    for name, count in (('pass_contracts', 150), ('ordered_unroll_contracts', 71),
                        ('accumulator_init_contracts', 55), ('cooperative_staging_contracts', 66),
                        ('fusion_destination_contracts', 16)):
        rows = read('terminal-final-' + name)
        assert len(rows) == count and all(r['status'] == 'PASS' for r in rows), name
        regressions[name] = count

    # Dynamic output strides deliberately keep the exact serial source. These
    # are compile-only fallback checks, not runtime layout or speedup claims.
    catalog = runpy.run_path(str(repository / 'python/test/sycl/model_layout_semantics.py'), run_name='catalog')['CASES']
    assert len(catalog) == 44
    fallback = read('terminal-layout-compile-wide-fixed')
    assert len(fallback) == 44 and {r['case'] for r in fallback} == set(catalog)
    for row in fallback:
        assert row['status'] == 'PASS' and row['elements_checked'] == 0 and row['harness_match']
        assert row['harness_sha256'] == provenance['python/test/sycl/model_layout_semantics.py']
        assert row['tile_shape'] == 'wide'
        variants = {v['schedule']: v for v in row['schedules']}
        assert set(variants) == {'staged', 'stored'}
        a,b = variants['staged'], variants['stored']
        for field in ('source_sha256', 'source_bytes', 'markers', 'cooperative_stages'):
            assert a[field] == b[field], (row['case'], field)
        assert a['terminal_stores'] == b['terminal_stores'] == 0

    memory_cases = {'dense', 'transpose', 'padded', 'negative', 'stride2', 'reverse_cols', 'rank3'}
    dot_cases = {a+'_'+b+'_'+c for a,b,c in itertools.product(('f32','f16'), ('NN','NT','TN','TT'), ('transpose','negative'))}
    fallback_cases = {'dynamic','collision','scatter','small'}
    all_cases = {'memory': memory_cases, 'dot': dot_cases, 'fallback': fallback_cases}
    cpu_lookup = {}
    cpu_elements = 0
    for suite, cases in all_cases.items():
        rows = read('terminal-merged-cpu-' + suite)
        assert len(rows) == 4*len(cases)
        assert {(r['case'], r['enabled'], r['optimized']) for r in rows} == set(itertools.product(cases, (False,True), (False,True)))
        for row in rows:
            assert row['suite'] == suite and row['round'] == 0 and row['status'] == 'PASS'
            assert row['elements_checked'] > 0 and row['samples_ns'] == [] and row['median_ns'] is None
            assert row['stores'] == int(row['enabled'] and suite != 'fallback')
            cpu_lookup[suite, row['case'], row['enabled'], row['optimized']] = row
            cpu_elements += row['elements_checked']
        for case, optimized in itertools.product(cases, (False,True)):
            a = cpu_lookup[suite, case, False, optimized]
            b = cpu_lookup[suite, case, True, optimized]
            assert a['markers'] == b['markers'] and a['elements_checked'] == b['elements_checked']
            if suite == 'fallback':
                assert a['source_sha256'] == b['source_sha256']
        if suite == 'dot':
            for case in cases:
                markers = cpu_lookup[suite, case, True, True]['markers']
                assert markers['sycl.register_accumulator'] > 0
                assert markers['sycl.ordered_reduction_unroll'] > 0
                assert markers['sycl.accumulator_init_forwarded'] > 0
                assert markers['sycl.cooperative_load_staging'] == 2
                assert (markers['sycl.register_tile ='] > 0) == case.startswith('f16')
    assert len(cpu_lookup) == 108
    # Merge records must be reproducible from explicitly named raw CPU files.
    # The original sequential runner may have produced additional rows after
    # the merge snapshot; only listed origins belong to this acceptance set.
    merge = read('terminal-cpu-merge-provenance')
    assert merge['status'] == 'PASS' and merge['unique_configurations'] == 108
    origin_keys = set()
    duplicate_count = 0
    raw_cache = {}
    for text_key, names in merge['origins'].items():
        key = ast.literal_eval(text_key)
        assert isinstance(key, tuple) and len(key) == 4 and key in cpu_lookup
        assert key not in origin_keys and names and len(names) == len(set(names))
        origin_keys.add(key)
        for name in names:
            assert pathlib.Path(name).name == name and name.startswith('terminal-static-cpu-') and name.endswith('.json')
            if name not in raw_cache:
                raw_cache[name] = json.loads((directory / name).read_text())
            matches = [r for r in raw_cache[name]
                       if (r['suite'], r['case'], r['enabled'], r['optimized']) == key]
            assert len(matches) == 1 and matches[0] == cpu_lookup[key], (key, name)
        duplicate_count += len(names) - 1
    assert origin_keys == set(cpu_lookup)
    assert duplicate_count == merge['identical_duplicates'] == 19
    gpu_keys = set()
    gpu_elements = 0
    for spec in manifests['terminal-layout']:
        suite = spec['suite']
        rows = read(f'terminal-layout-dcu-{spec["job"]}')
        assert {r['case'] for r in rows} == set(spec['cases'])
        for row in rows:
            key = suite, row['case'], row['enabled'], row['optimized']
            assert key not in gpu_keys
            gpu_keys.add(key)
            # These jobs carry no device events: exact entire record equality
            # checks source, output-count, actual markers and options together.
            assert row == cpu_lookup[key], key
            gpu_elements += row['elements_checked']
    assert gpu_keys == set(cpu_lookup) and gpu_elements == cpu_elements

    layout_perf = []
    expected_perf_cases = {'transpose','padded','negative','stride2','reverse_cols','rank3',
                           'f32_NN_transpose','f32_TT_negative','f16_TN_transpose','f16_NT_negative'}
    assert {c for spec in manifests['terminal-layout-perf'] for c in spec['cases']} == expected_perf_cases
    layout_timing_elements = 0
    for spec in manifests['terminal-layout-perf']:
        assert spec['expected_rows'] == 12 and len(spec['cases']) == 1
        suite, case = spec['suite'], spec['cases'][0]
        rows = read(f'terminal-layout-perf-dcu-{spec["job"]}')
        assert len(rows) == 12
        bykey = {}
        for row in rows:
            key = row['round'], row['enabled'], row['optimized']
            assert key not in bykey and row['status'] == 'PASS' and row['case'] == case
            bykey[key] = row
            cpu = cpu_lookup[suite, case, row['enabled'], row['optimized']]
            for field in ('source_sha256','stores','elements_checked','markers','dtype'):
                assert row[field] == cpu[field], (case,field)
            samples = row['samples_ns']
            assert len(samples) == 31 and all(type(x) is int and x > 0 for x in samples)
            assert statistics.median(samples) == row['median_ns']
            layout_timing_elements += row['elements_checked']
        assert set(bykey) == set(itertools.product(range(3),(False,True),(False,True)))
        for optimized in (False,True):
            before = [bykey[r,False,optimized] for r in range(3)]
            after = [bykey[r,True,optimized] for r in range(3)]
            ratios = [a['median_ns']/b['median_ns'] for a,b in zip(before,after)]
            layout_perf.append(dict(case=case,optimized=optimized,
                ratio=statistics.median(r['median_ns'] for r in before)/statistics.median(r['median_ns'] for r in after),
                round_ratios=ratios))
    assert len(layout_perf) == 20
    assert all(r['ratio'] > 1 for r in layout_perf)
    assert all(x > 1 for r in layout_perf for x in r['round_ratios'])

    perf_paths = [directory / f'terminal-final-dcu-{r["job"]}.json' for r in manifests['terminal-final']]
    perf = analyze(perf_paths)
    assert perf['rows'] == 216 and perf['elements_checked'] == 961704
    assert perf['active_comparisons'] == perf['active_improved'] == 28
    assert perf['active_improved_rounds'] == 84
    return dict(status='PASS', completed_gpu_jobs=26, contracts=241, regressions=regressions,
                dynamic_stride_compile_fallbacks=44,
                cpu_static_configurations=108, gpu_static_configurations=108,
                static_elements_per_device=cpu_elements, performance=perf,
                timed_configurations=336, timing_samples=336*31,
                layout_performance=layout_perf, layout_timing_elements=layout_timing_elements,
                active_comparisons=48, active_improved_rounds=144)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory', type=pathlib.Path)
    p.add_argument('--output', type=pathlib.Path, required=True)
    args = p.parse_args()
    result = audit(args.directory, pathlib.Path(__file__).resolve().parents[3])
    args.output.write_text(json.dumps(result, indent=2) + chr(10))
    print(json.dumps({k:v for k,v in result.items() if k not in ('performance', 'layout_performance')}))


if __name__ == '__main__': main()
