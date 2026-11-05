"""Compare frozen fallback LLVM modules, retaining instructions and metadata.

This deliberately bounded reader accepts the single-kernel text emitted by
AdaptiveCpp's ACPP_S2_DUMP_IR_FINAL. It is not an LLVM semantic-equivalence
solver. Equality means textual identity after bijective renaming of the entry,
local SSA/block names, attribute groups and metadata graph IDs.
"""
import argparse
import difflib
import hashlib
import json
import pathlib
import re


IDENT = r'(?:[-a-zA-Z$._0-9]+|"(?:[^"\\]|\\.)*")'
TOKEN = re.compile(
    rf'(?P<local>%{IDENT})|(?P<global>@{IDENT})|'
    r'(?P<metadata>!\d+)|(?P<attribute>#\d+)|'
    r'(?P<string>"(?:[^"\\]|\\.)*")')


def without_comment(line):
    # A semicolon inside a quoted symbol or string is significant.
    return re.split(r';(?=(?:[^"]*"[^"]*")*[^"]*$)', line, maxsplit=1)[0].strip()


def canonicalize(path):
    lines = [without_comment(s) for s in path.read_text().splitlines()]
    lines = [s for s in lines if s and not s.startswith('source_filename =')]
    entries = [s for s in lines if s.startswith('define ')]
    assert len(entries) == 1 and entries[0].startswith('define amdgpu_kernel '), path
    entry = re.search(rf'@{IDENT}(?=\()', entries[0])[0]
    types = {re.match(rf'%{IDENT}', s)[0]
             for s in lines if re.match(rf'%{IDENT} = type ', s)}
    metadata, attributes, named, body = {}, {}, [], []
    for line in lines:
        if match := re.match(r'(!\d+) = (.*)', line):
            metadata[match[1]] = match[2]
        elif match := re.match(r'attributes (#\d+) = (.*)', line):
            attributes[match[1]] = match[2]
        elif re.match(r'![a-zA-Z]', line):
            named.append(line)
        else:
            body.append(line)

    # AdaptiveCpp retains null/undef dimension annotations for kernels removed
    # from this final module. Record that difference explicitly; never drop
    # instruction-attached alias, loop, TBAA or other metadata.
    ignored = set()
    ignored_annotations = []
    roots = []
    for line in named:
        if line.startswith('!hipsycl.sscp.annotations = '):
            refs = re.findall(r'!\d+', line)
            for ref in refs:
                value = metadata[ref]
                assert re.fullmatch(
                    r'(?:distinct )?!\{(?:ptr undef|null), '
                    r'!"hipsycl_kernel_dimension", i32 3\}', value), (path, value)
                ignored.add(ref)
                ignored_annotations.append(value)
        else:
            roots.append(line)

    local_ids, meta_ids, attr_ids = {}, {}, {}

    def rename(match):
        token = match[0]
        kind = match.lastgroup
        if kind == 'local':
            if token in types:
                return token
            return local_ids.setdefault(token, f'%v{len(local_ids)}')
        if kind == 'global':
            return '@ENTRY' if token == entry else token
        if kind == 'metadata':
            assert token in metadata, (path, token)
            return meta_ids.setdefault(token, f'!m{len(meta_ids)}')
        if kind == 'attribute':
            assert token in attributes, (path, token)
            return attr_ids.setdefault(token, f'#a{len(attr_ids)}')
        return token

    normalized = []
    for line in body:
        if match := re.match(rf'^({IDENT}):', line):
            assert match.end() == len(line), (path, 'unexpected block-label suffix', line)
            line = '%' + match[1] + ':'
        normalized.append(TOKEN.sub(rename, line))
    normalized += [TOKEN.sub(rename, s) for s in roots]

    def drain(definitions, mapping, prefix):
        out = []
        index = 0
        while index < len(mapping):
            key = list(mapping)[index]
            value = TOKEN.sub(rename, definitions[key])
            out.append(f'{prefix}{index} = {value}')
            index += 1
        return out

    # Preserve even unused attribute groups.
    for key in attributes:
        attr_ids.setdefault(key, f'#a{len(attr_ids)}')
    attr_lines = drain(attributes, attr_ids, '#a')
    drain(metadata, meta_ids, '!m')
    assert not (set(meta_ids) & ignored), (path, 'excluded annotation is live')
    # Preserve all other metadata, even if no instruction currently refers to it.
    for key in metadata:
        if key not in ignored:
            meta_ids.setdefault(key, f'!m{len(meta_ids)}')
    meta_lines = drain(metadata, meta_ids, '!m')
    normalized += attr_lines + meta_lines
    return '\n'.join(normalized) + '\n', dict(
        local_identifiers=len(local_ids), attribute_groups=len(attr_ids),
        metadata_nodes=len(meta_ids), excluded_dead_kernel_annotations=ignored_annotations)


def compare(left, right):
    a, info_a = canonicalize(left)
    b, info_b = canonicalize(right)
    return dict(
        equal=a == b,
        left_sha256=hashlib.sha256(left.read_bytes()).hexdigest(),
        right_sha256=hashlib.sha256(right.read_bytes()).hexdigest(),
        canonical_left_sha256=hashlib.sha256(a.encode()).hexdigest(),
        canonical_right_sha256=hashlib.sha256(b.encode()).hexdigest(),
        left=info_a, right=info_b,
        difference=[] if a == b else list(difflib.unified_diff(
            a.splitlines(), b.splitlines(), n=2))[:60])


def audit(directories):
    rows = []
    for directory in directories:
        for left in sorted(directory.glob('*-sources/*-enabledFalse.ll')):
            stem = left.name.removesuffix('-enabledFalse.ll')
            block = stem.rsplit('-', 1)[1]
            if block in ('64', '4x4x4'):
                continue
            right = left.with_name(stem + '-enabledTrue.ll')
            assert right.exists(), right
            rows.append(dict(directory=directory.name, source=left.parent.name,
                             configuration=stem, **compare(left, right)))
    assert rows, 'no fallback pairs'
    return dict(status='PASS' if all(r['equal'] for r in rows) else 'DIFFERENCES',
                pairs=len(rows), equal_pairs=sum(r['equal'] for r in rows), results=rows)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('directories', nargs='+', type=pathlib.Path)
    p.add_argument('--output', required=True, type=pathlib.Path)
    args = p.parse_args()
    result = audit(args.directories)
    args.output.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k: v for k, v in result.items() if k != 'results'}))
    raise SystemExit(result['status'] != 'PASS')


if __name__ == '__main__':
    main()
