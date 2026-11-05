"""Audit the accepted exact-wave64 study, keeping fallback timing visible."""
import argparse
import collections
import hashlib
import itertools
import json
import math
import pathlib
import re
import runpy
import statistics

from compare_two_column_llvm import audit as audit_llvm


def values(argv, flag, default):
    if flag not in argv:
        return default
    tail = argv[argv.index(flag) + 1:]
    return list(itertools.takewhile(lambda x: not x.startswith('--'), tail))


def read(path):
    return json.loads(path.read_text())


def fingerprint(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def audit(root, repo=None):
    main, extra = root/'wave64-matrix', root/'wave64-extended'
    totals = collections.Counter()
    performance = []
    fallback_evidence = {}
    manifests = {}
    for directory, prefix, count in ((main, 'wave64', 22), (extra, 'wave64-extended', 15)):
        manifest = {}
        for line in (directory/f'{prefix}-sha256.txt').read_text().splitlines():
            digest, name = line.split()
            assert name not in manifest and re.fullmatch('[0-9a-f]{64}', digest)
            manifest[name] = digest
            if not name.startswith('python/triton/_C/'):
                assert fingerprint(directory/'measured-source'/name) == digest, name
                if repo and name.startswith('third_party/'):
                    assert fingerprint(repo/name) == digest, ('unmeasured production change', name)
        assert len(manifest) == count
        manifests[directory] = manifest
    assert all(manifests[main][key] == value for key, value in manifests[extra].items()
               if key != 'python/test/sycl/two_column_launch_performance.py')

    def timed(row, samples):
        actual = row['samples_ns']
        assert len(actual) == samples and all(
            isinstance(x, (float, int)) and math.isfinite(x) and x > 0 for x in actual)
        assert row['median_ns'] == (statistics.median(actual) if actual else None)
        totals['device_event_samples'] += samples
        totals['runtime_records'] += 1
        totals['timed_records'] += bool(samples)
        totals['device_elements_checked'] += row['elements_checked']

    def comparison(kind, label, off, on, **info):
        ratios = [a['median_ns']/b['median_ns'] for a, b in zip(off, on)]
        return dict(kind=kind, label=label, **info, ratios=ratios,
                    speedup=statistics.median(a['median_ns'] for a in off) /
                            statistics.median(b['median_ns'] for b in on))

    jobs = []
    for phase in ('pilot','main'):
        recorded = read(main/f'wave64-{phase}-jobs.json')
        expected = read(main/f'wave64-{phase}-specs.json')
        assert [{k:v for k,v in row.items() if k != 'jobid'} for row in recorded] == expected
    for directory, prefix, expected in ((main, 'wave64', 34), (extra, 'wave64-extended', 3)):
        local_jobs = (read(directory/'wave64-pilot-jobs.json') + read(directory/'wave64-main-jobs.json')
                      if directory == main else read(directory/'wave64-extended-jobs.json'))
        assert len(local_jobs) == expected
        states = {}
        for line in (directory/f'{prefix}-jobs.txt').read_text().splitlines():
            row = line.split('|')
            assert row[0] not in states and row[1] == 'COMPLETED' and row[3] == '0:0'
            states[row[0]] = row
        assert set(states) == {j['jobid'] for j in local_jobs}
        for job in local_jobs:
            log = (directory/'logs'/f'sycl-{prefix}-{job["jobid"]}.log').read_text()
            assert 'gfx906' in log and 'Traceback' not in log and 'FAILED' not in log
            assert all(name + ': OK' in log for name in manifests[directory])
            jobs.append((directory, job))
    assert len({job['jobid'] for _, job in jobs}) == 37
    totals['completed_device_jobs'] = len(jobs)

    harness = main/'measured-source/python/test/sycl/model_layout_semantics.py'
    catalog = set(runpy.run_path(str(harness), run_name='case_catalog')['CASES'])
    observed_layouts = set()
    for directory, job in jobs:
        argv, mode, jobid = job['args'], job['mode'], job['jobid']
        rows = read(directory/f'wave64-{mode}-{jobid}.json')
        if mode == 'layouts':
            assert [r['case'] for r in rows] == values(argv, '--cases', [])
            for row in rows:
                assert row['case'] not in observed_layouts and row['status'] == 'PASS'
                observed_layouts.add(row['case'])
                assert row['harness_match'] and row['max_abs_error'] == 0
                assert row['harness_sha256'] == row['expected_harness_sha256'] == fingerprint(harness)
                assert row['logical_tile'] == [8,16,16] and row['local_shapes'] == [48,[3,5]]
                d = {(r['round'], r['schedule']): r for r in row['schedules']}
                assert len(d) == len(row['schedules']) == 6
                assert set(d) == set(itertools.product(range(3), ('stored', 'two-column')))
                active = row['precision'] == 'f16'
                for r in range(3):
                    off, on = d[r, 'stored'], d[r, 'two-column']
                    for entry in (off, on):
                        timed(entry, 31)
                        assert entry['cooperative_stages'] == 1 and entry['terminal_stores'] == 0
                        assert entry['markers']['sycl.accumulator_init_forwarded']
                        assert entry['markers']['sycl.ordered_reduction_unroll']
                        assert entry['markers']['sycl.register_accumulator']
                        assert entry['unrolled_loops'] == 1
                    assert not off['two_column_guard'] and on['two_column_guard'] == active
                    assert not off['markers']['sycl.register_tile =']
                    assert on['markers']['sycl.register_tile ='] == active
                    if not active:
                        assert off['source_sha256'] == on['source_sha256']
                        totals['inert_source_pairs'] += 1
                assert row['elements_checked'] == sum(x['elements_checked'] for x in d.values())
                if active:
                    performance.append(comparison('layout', row['case'],
                        [d[r,'stored'] for r in range(3)], [d[r,'two-column'] for r in range(3)]))
            continue

        rounds = int(values(argv, '--rounds', ['3'])[0])
        repeats = int(values(argv, '--repeats', ['31'])[0])
        layout = values(argv, '--layout', [None])[0]
        if mode == 'launch':
            plans = values(argv, '--plans', ['base','full'])
            blocks = values(argv, '--blocks', ['64','128','256'])
            k = int(values(argv, '--k', [None])[0])
            d = {(x['round'], x['plan'], x['block'], x['enabled']): x for x in rows}
            assert len(d) == len(rows) == rounds*len(plans)*len(blocks)*2
            assert set(d) == set(itertools.product(range(rounds), plans, blocks, (False,True)))
            for entry in rows:
                assert entry['status'] == 'PASS' and entry['elements_checked'] == 391
                assert entry['shape'] == [8,16,k] and entry['layout'] == layout
                assert entry['options']['matmul_register_tiling_2col'] == entry['enabled']
                assert entry['guarded'] == entry['host_multiversion'] == entry['enabled']
                size = math.prod(map(int, entry['block'].split('x')))
                assert entry['selected_path'] == ('tiled' if size == 64 and entry['enabled'] else 'untiled')
                source = directory/f'wave64-{jobid}-sources'/f'{entry["plan"]}-enabled{entry["enabled"]}.sycl'
                assert fingerprint(source) == entry['source_sha256']
                assert source.stat().st_size == entry['source_bytes']
                timed(entry, repeats)
            for plan, block in itertools.product(plans, blocks):
                off = [d[r, plan, block, False] for r in range(rounds)]
                on = [d[r, plan, block, True] for r in range(rounds)]
                item = comparison('launch', job['label'], off, on, plan=plan, block=block)
                if math.prod(map(int, block.split('x'))) == 64:
                    performance.append(item)
                else:
                    left = directory/f'wave64-{jobid}-sources'/f'{plan}-{block}-enabledFalse.ll'
                    right = left.with_name(f'{plan}-{block}-enabledTrue.ll')
                    ir_stem = f'{plan}-{block}'
                    if not left.exists() or not right.exists():
                        # Identical generated sources can hit the persistent
                        # JIT cache, yielding no new dump. Reuse a same-job,
                        # same-block pair only after both SYCL hashes match.
                        candidates = []
                        for candidate in left.parent.glob(f'*-{block}-enabledFalse.ll'):
                            candidate_plan = candidate.name.removesuffix(f'-{block}-enabledFalse.ll')
                            partner = candidate.with_name(f'{candidate_plan}-{block}-enabledTrue.ll')
                            if partner.exists() and all(
                                fingerprint(left.parent/f'{candidate_plan}-enabled{enabled}.sycl') ==
                                d[0,plan,block,enabled]['source_sha256'] for enabled in (False,True)):
                                candidates.append((candidate, partner, f'{candidate_plan}-{block}'))
                        assert candidates, ('missing fallback IR', left)
                        left, right, ir_stem = sorted(candidates)[0]
                        item['ir_reused_from_identical_source'] = ir_stem
                    fallback_evidence.setdefault(
                        (directory.name, left.parent.name, ir_stem), []).append(item)
            totals['launch_records'] += len(rows)
        else:
            assert mode == 'dot'
            plans = values(argv, '--configs', ['base','full'])
            shape = list(map(int, values(argv, '--shape', ['8','16','32'])))
            dtype = values(argv, '--dtype', ['f16'])[0]
            d = {(x['round'], x['plan'], x['enabled']): x for x in rows}
            assert len(d) == len(rows) == rounds*len(plans)*2
            assert set(d) == set(itertools.product(range(rounds), plans, (False,True)))
            for entry in rows:
                assert entry['status'] == 'PASS' and not entry['compile_only']
                assert entry['shape'] == shape and entry['layout'] == layout and entry['dtype'] == dtype
                assert entry['rounding'] == ('--rounding' in argv)
                assert entry['special'] == ('--special' in argv)
                assert entry['bounds'] == values(argv, '--bounds', ['tail'])[0]
                assert entry['check_blocks'] == 'all'
                assert entry['elements_checked'] == entry['output_elements']*(8+bool(repeats))
                assert entry['options']['matmul_register_tiling_2col'] == entry['enabled']
                source = directory/f'wave64-{jobid}-sources'/f'{entry["plan"]}-enabled{entry["enabled"]}.sycl'
                assert fingerprint(source) == entry['source_sha256']
                timed(entry, repeats)
            for plan in plans:
                for r in range(rounds):
                    off, on = d[r,plan,False], d[r,plan,True]
                    if on['tile'] != 2:
                        assert off['source_sha256'] == on['source_sha256']
                        totals['inert_source_pairs'] += 1
                    else:
                        assert off['tile'] == 0 and on['guarded'] and not off['guarded']
                        # Branch-local initializer markers double, staging and stores do not.
                        for marker, value in off['markers'].items():
                            if marker != 'sycl.accumulator_init_forwarded':
                                assert on['markers'][marker] == value
                if repeats and d[0,plan,True]['tile'] == 2:
                    performance.append(comparison('dot', job['label'],
                        [d[r,plan,False] for r in range(rounds)], [d[r,plan,True] for r in range(rounds)], plan=plan))
            totals['dot_records'] += len(rows)
    assert observed_layouts == catalog and len(catalog) == 44
    assert totals['launch_records'] == 504 and totals['dot_records'] == 134
    assert totals['runtime_records'] == 902 and totals['timed_records'] == 870
    assert totals['device_event_samples'] == 26970
    totals['layout_cases'] = len(catalog)
    totals['layout_schedule_records'] = 264

    llvm = audit_llvm([main, extra])
    assert llvm['pairs'] == len(fallback_evidence) == 59
    for row in llvm['results']:
        key = row['directory'], row['source'], row['configuration']
        evidence = fallback_evidence[key]
        row['timing'] = evidence
        if not row['equal']:
            # Do not relabel a different fallback as code equality. In this
            # ablation tiling enables SSA promotion even when its separate
            # option is off; require a gain in every measured paired round.
            assert row['configuration'] in ('no_accumulator-48','no_accumulator-128','no_accumulator-256')
            assert all(all(r > 1 for r in item['ratios']) and item['speedup'] > 1 for item in evidence)
    assert llvm['equal_pairs'] == 56

    contract_counts = {
        'two_column_contracts':123, 'two_column_extended_contracts':480,
        'two_column_guard_contracts':218, 'two_column_template_contracts':33,
        'pass_contracts':150, 'ordered_unroll_contracts':71,
        'accumulator_init_contracts':55, 'cooperative_staging_contracts':66,
        'fusion_destination_contracts':16, 'terminal_store_contracts':241,
        'half_store_contracts':482, 'integer_extrema_contracts':620}
    for name, count in contract_counts.items():
        rows = read(main/f'wave64-regression-{name}.json')
        assert len(rows) == count and all(x['status'] == 'PASS' for x in rows), name
    totals['structural_contracts'] = sum(contract_counts.values())
    clean = read(extra/'wave64-clean-diagnostics.json')
    assert len(clean) == 33 and all(x['status'] == 'PASS' for x in clean)
    assert sum(x.get('rejected',False) for x in clean) == 4
    clean_source = extra/'clean-diagnostics-source.py'
    assert "assert 'failed (exit 1):' in message" in clean_source.read_text()
    for line in (extra/'clean-diagnostics-sha256.txt').read_text().splitlines():
        digest, name = line.split()
        assert fingerprint(extra/name) == digest
    clean_log = (extra/'wave64-clean-diagnostics.log').read_text()
    assert '"status": "PASS", "count": 33' in clean_log and 'Traceback' not in clean_log
    for name in ('python/triton/_C/libtriton.so','python/triton/_C/triton-sycl-translate'):
        assert manifests[main][name] + '  ' + name in clean_log
    assert fingerprint(clean_source) + '  python/test/sycl/two_column_template_contracts.py' in clean_log
    if repo:
        assert fingerprint(clean_source) == fingerprint(repo/'python/test/sycl/two_column_template_contracts.py')

    for data in ('rounding','special'):
        rows = read(extra/f'wave64-cpu-{data}.json')
        assert len(rows) == 4
        assert {(r['plan'],r['enabled']) for r in rows} == set(itertools.product(('base','full'),(False,True)))
        for row in rows:
            assert row['status'] == 'PASS' and row['elements_checked'] == row['output_elements']*8 == 3128
            assert row['rounding'] == (data == 'rounding') and row['special'] == (data == 'special')
            assert row['samples_ns'] == [] and row['median_ns'] is None
            totals['cpu_records'] += 1
            totals['cpu_elements_checked'] += row['elements_checked']
    cold = read(extra/'wave64-compile-cost.json')
    assert len(cold) == 36
    assert {(r['shape'][2],r['plan'],r['enabled'],r['round']) for r in cold} == set(
        itertools.product((16,32,128),('base','full'),(False,True),range(3)))
    costs = []
    for k, plan in itertools.product((16,32,128),('base','full')):
        off, on = [statistics.median(r['seconds'] for r in cold if
                   r['shape'][2] == k and r['plan'] == plan and r['enabled'] == enabled)
                   for enabled in (False,True)]
        costs.append(dict(k=k, plan=plan, baseline_seconds=off, enabled_seconds=on, ratio=on/off))
    assert all(r['status'] == 'PASS' and r['seconds'] > 0 for r in cold)
    totals['cold_triton_to_sycl_compilations'] = len(cold)

    preservation = read(main/'wave64-preservation.json')
    assert len(preservation) == 15
    assert all(r['status'] == 'PASS' and r['source_sha256'] == r['expected_sha256'] for r in preservation)
    for layout in ('NN','NT','TN','TT'):
        rows = read(main/f'wave64-compile-{layout}.json')
        assert len(rows) == 20 and all(r['status'] == 'PASS' and r['compile_only'] for r in rows)
    layout_compile = read(main/'wave64-layout-compile.json')
    assert len(layout_compile) == 44 and {r['case'] for r in layout_compile} == catalog
    assert all(r['status'] == 'PASS' and r['elements_checked'] == 0 for r in layout_compile)
    regressions = [r for r in performance if r['speedup'] <= 1 or any(v <= 1 for v in r['ratios'])]
    return dict(status='PASS' if not regressions else 'PERFORMANCE_REVIEW_REQUIRED',
                totals=dict(totals), active_contexts=len(performance),
                active_paired_rounds=sum(len(r['ratios']) for r in performance),
                active_speedup_range=[min(r['speedup'] for r in performance),
                                      max(r['speedup'] for r in performance)],
                comparisons=performance, active_regressions=regressions,
                fallback_llvm=llvm, compile_cost=costs,
                preservation_source_hashes=len(preservation),
                clean_diagnostics=dict(cases=4, required_exit=1, source_sha256=fingerprint(clean_source)),
                acceptance_scope='gfx906 device events and exact outputs; fallback timing is retained, '
                'with LLVM equality or measured SSA-enabling evidence, not a universal performance claim')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory', type=pathlib.Path)
    p.add_argument('--repo', type=pathlib.Path)
    p.add_argument('--output', type=pathlib.Path, required=True)
    args = p.parse_args()
    result = audit(args.directory, args.repo)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({key:value for key,value in result.items()
                      if key not in ('comparisons','fallback_llvm')}))
    raise SystemExit(result['status'] != 'PASS')


if __name__ == '__main__':
    main()
