"""Audit complete frozen two-column evidence, including no-op controls."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import runpy
import statistics


def audit(directory):
    def read(name):
        return json.loads((directory / name).read_text())

    jobs = read('two-column-v2-jobs.json')
    assert len(jobs) == 20 and len({j['jobid'] for j in jobs}) == 20
    states = {}
    for line in (directory / 'two-column-v2-jobs.txt').read_text().splitlines():
        fields = line.split('|')
        assert len(fields) >= 4 and fields[0] not in states, fields
        states[fields[0]] = fields
    assert set(states) == {j['jobid'] for j in jobs}
    fingerprints = {}
    for line in (directory / 'two-column-v2-sha256.txt').read_text().splitlines():
        digest, name = line.split(None, 1)
        name = name.strip()
        assert re.fullmatch('[0-9a-f]{64}', digest) and name not in fingerprints
        fingerprints[name] = digest
        if not name.startswith('python/triton/_C/'):
            assert hashlib.sha256((directory / 'measured-source' / name).read_bytes()).hexdigest() == digest, name
    assert len(fingerprints) == 9
    harness = directory / 'measured-source/python/test/sycl/model_layout_semantics.py'
    cases = set(runpy.run_path(str(harness), run_name='case_catalog')['CASES'])
    assert len(cases) == 44
    harness_hash = fingerprints['python/test/sycl/model_layout_semantics.py']
    performance = []
    totals = dict(dot_records=0, layout_cases=0, layout_schedules=0,
                  elements_checked=0, device_event_samples=0, no_op_pairs=0)
    observed_cases = []

    def timing(row, repeats):
        samples = row['samples_ns']
        assert len(samples) == repeats and all(isinstance(x, (int,float)) and x > 0 for x in samples)
        assert row['median_ns'] == (statistics.median(samples) if repeats else None)
        totals['device_event_samples'] += repeats

    for job in jobs:
        jobid = job['jobid']
        assert states[jobid][1] == 'COMPLETED' and states[jobid][3] == '0:0', states[jobid]
        log = (directory / 'logs' / f'sycl-two-column-v2-{jobid}.log').read_text()
        assert 'gfx906' in log and 'Traceback' not in log and 'FAILED' not in log, jobid
        for name in fingerprints:
            assert name + ': OK' in log, (jobid, name)
        argv = job['args']
        if argv[0] == 'layouts':
            expected = argv[argv.index('--cases')+1:]
            rows = read(f'two-column-v2-layouts-{jobid}.json')
            assert [r['case'] for r in rows] == expected
            for row in rows:
                assert row['status'] == 'PASS' and row['harness_match'] is True
                assert row['harness_sha256'] == row['expected_harness_sha256'] == harness_hash
                assert row['elements_checked'] > 0 and row['max_abs_error'] == 0
                assert row['logical_tile'] == [8,16,16] and row['local_shapes'] == [48,[3,5]]
                d = {(v['round'],v['schedule']):v for v in row['schedules']}
                assert len(d) == len(row['schedules']) == 6
                assert set(d) == set(itertools.product(range(3), ('stored','two-column')))
                assert row['elements_checked'] == sum(v['elements_checked'] for v in d.values())
                ratios = []
                for r in range(3):
                    off,on = d[r,'stored'],d[r,'two-column']
                    for v in (off,on):
                        timing(v,31)
                        assert v['cooperative_stages'] == 1 and v['terminal_stores'] == 0
                        assert v['markers']['sycl.accumulator_init_forwarded'] is True
                        assert v['markers']['sycl.register_accumulator'] is True
                    active = row['precision'] == 'f16'
                    assert off['markers']['sycl.register_tile ='] is False
                    assert on['markers']['sycl.register_tile ='] == active
                    assert off['markers']['sycl.ordered_reduction_unroll'] is True
                    assert on['markers']['sycl.ordered_reduction_unroll'] == (not active)
                    if active:
                        ratios.append(off['median_ns']/on['median_ns'])
                    else:
                        assert off['source_sha256'] == on['source_sha256']
                        totals['no_op_pairs'] += 1
                if ratios:
                    performance.append(dict(kind='layout',case=row['case'],ratios=ratios,
                                            speedup=statistics.median([d[r,'stored']['median_ns'] for r in range(3)])/
                                                    statistics.median([d[r,'two-column']['median_ns'] for r in range(3)])))
                observed_cases.append(row['case'])
                totals['elements_checked'] += row['elements_checked']
                totals['layout_schedules'] += 6
            totals['layout_cases'] += len(rows)
        else:
            rounds = int(argv[argv.index('--rounds')+1]) if '--rounds' in argv else 3
            repeats = int(argv[argv.index('--repeats')+1]) if '--repeats' in argv else 31
            plans = argv[argv.index('--configs')+1:] if '--configs' in argv else ['base','full']
            rows = read(f'two-column-v2-dcu-{jobid}.json')
            assert len(rows) == len(plans)*2*rounds
            d = {(v['round'],v['plan'],v['enabled']):v for v in rows}
            assert len(d) == len(rows) and set(d) == set(itertools.product(range(rounds),plans,(False,True)))
            for v in rows:
                assert v['status'] == 'PASS' and not v['compile_only'] and v['check_blocks'] == 'all'
                assert v['elements_checked'] == v['output_elements']*(5+int(repeats > 0))
                assert v['options']['matmul_register_tiling_2col'] == v['enabled']
                timing(v,repeats)
                totals['elements_checked'] += v['elements_checked']
            for plan in plans:
                ratios = []
                for r in range(rounds):
                    off,on = d[r,plan,False],d[r,plan,True]
                    assert off['tile'] in (0,4) and on['tile'] in (0,2,4)
                    if on['tile'] == 2:
                        assert off['tile'] == 0 and off['source_sha256'] != on['source_sha256']
                        if repeats:
                            ratios.append(off['median_ns']/on['median_ns'])
                    else:
                        assert off['source_sha256'] == on['source_sha256']
                        totals['no_op_pairs'] += 1
                if ratios:
                    performance.append(dict(kind='dot',jobid=jobid,plan=plan,ratios=ratios,
                                            speedup=statistics.median([d[r,plan,False]['median_ns'] for r in range(rounds)])/
                                                    statistics.median([d[r,plan,True]['median_ns'] for r in range(rounds)])))
            totals['dot_records'] += len(rows)
    assert set(observed_cases) == cases and len(observed_cases) == 44
    assert totals['dot_records'] == 94 and totals['layout_schedules'] == 264
    contracts = {}
    for name, expected in [('contracts',123),('two_column_extended_contracts',480),
                           ('pass_contracts',None),('ordered_unroll_contracts',None),
                           ('accumulator_init_contracts',None),('cooperative_staging_contracts',None),
                           ('fusion_destination_contracts',None),('terminal_store_contracts',None),
                           ('half_store_contracts',None),('integer_extrema_contracts',None)]:
        rows = read(f'two-column-v2-{name}.json')
        assert rows and all(r['status'] == 'PASS' for r in rows), name
        if expected is not None:
            assert len(rows) == expected, (name,len(rows),expected)
        contracts[name] = len(rows)
    host = dict(cpu_records=0,cpu_elements_checked=0,cold_compilations=0)
    for data in ('rounding','special'):
        rows = read(f'two-column-v2-cpu-{data}.json')
        assert len(rows) == 4
        assert {(v['plan'],v['enabled']) for v in rows} == set(itertools.product(('base','full'),(False,True)))
        for v in rows:
            assert v['status'] == 'PASS' and not v['compile_only'] and v['round'] == 0
            assert v['rounding'] == (data=='rounding') and v['special'] == (data=='special')
            assert v['shape'] == [8,16,32] and v['dtype'] == 'f16'
            assert v['tile'] == (2 if v['enabled'] else 0)
            assert v['elements_checked'] == 5*v['output_elements'] == 1955
            assert v['samples_ns'] == [] and v['median_ns'] is None
            host['cpu_records'] += 1
            host['cpu_elements_checked'] += v['elements_checked']
    cold = read('two-column-v2-compile-cost.json')
    assert len(cold) == 36
    assert {(v['shape'][2],v['plan'],v['enabled'],v['round']) for v in cold} == set(
        itertools.product((16,32,128),('base','full'),(False,True),range(3)))
    for v in cold:
        assert v['status'] == 'PASS' and v['seconds'] > 0 and v['source_bytes'] > 0
        assert v['stage'] == 'cold Triton-to-SYCL, excluding imports and C++ compilation'
    host['cold_compilations'] = len(cold)
    regressions = [p for p in performance if p['speedup'] < 1 or any(x < 1 for x in p['ratios'])]
    return dict(status='PASS' if not regressions else 'PERFORMANCE_REVIEW_REQUIRED',
                completed_jobs=len(jobs), totals=totals, contracts=contracts,
                host=host,
                active_contexts=len(performance), comparisons=performance, regressions=regressions)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=pathlib.Path)
    parser.add_argument('--output', type=pathlib.Path, required=True)
    args = parser.parse_args()
    result = audit(args.directory)
    args.output.write_text(json.dumps(result,indent=2)+chr(10))
    print(json.dumps(result))
    raise SystemExit(result['status'] != 'PASS')


if __name__ == '__main__':
    main()
