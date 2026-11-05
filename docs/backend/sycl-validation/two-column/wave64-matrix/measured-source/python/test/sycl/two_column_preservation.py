"""Replay measured disabled/inert dot sources with the current compiler."""
import argparse
import hashlib
import json
import pathlib
from types import SimpleNamespace

from cooperative_staging_semantics import prepare


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('historical', type=pathlib.Path)
    p.add_argument('--output', type=pathlib.Path, required=True)
    args = p.parse_args()
    selected = {}
    for f in sorted(args.historical.glob('two-column-v2-dcu-*.json')):
        for row in json.loads(f.read_text()):
            if row['enabled'] and row['tile'] == 2:
                continue
            key = (tuple(row['shape']), row['layout'], row['dtype'],
                   row['plan'], row['enabled'], row['special'], row['rounding'],
                   row['bounds'])
            if key in selected:
                assert selected[key]['source_sha256'] == row['source_sha256']
            selected[key] = row
    rows = []
    for key, old in selected.items():
        if old['special'] or old['rounding'] or old['bounds'] != 'tail':
            continue
        kernel, warm, kw, *_ = prepare(
            SimpleNamespace(kind='dot', shape=old['shape'],
                            layout=old['layout'], dtype=old['dtype']))
        compiled = kernel.warmup(*warm, grid=(3,), **kw, **old['options'])
        code = compiled.asm['sycl']
        code = code.decode() if isinstance(code, bytes) else code
        digest = hashlib.sha256(code.encode()).hexdigest()
        assert digest == old['source_sha256'], (key, digest, old['source_sha256'])
        assert len(code) == old['source_bytes']
        rows.append(dict(shape=old['shape'], layout=old['layout'],
                         dtype=old['dtype'], plan=old['plan'],
                         enabled=old['enabled'], status='PASS',
                         source_sha256=digest, expected_sha256=old['source_sha256'],
                         source_bytes=len(code), options=old['options']))
    assert rows
    args.output.write_text(json.dumps(rows, indent=2) + chr(10))
    print(json.dumps(dict(status='PASS', count=len(rows))))


if __name__ == '__main__':
    main()
