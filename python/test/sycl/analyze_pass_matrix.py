"""Summarize paired pass measurements without treating no-op noise as speedup."""
import argparse
import collections
import json
import math
import pathlib
import statistics


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    rows = json.loads(pathlib.Path(args.input).read_text())
    assert all(row["status"] == "PASS" for row in rows)
    summary = []
    options = ("fuse", "reuse", "group")
    for option in options:
        grouped = collections.defaultdict(list)
        others = [key for key in options if key != option]
        lookup = {(r["kind"], r["n"], r["round"], *(r[k] for k in others), r[option]): r for r in rows}
        for key, before in lookup.items():
            if key[-1]:
                continue
            after = lookup[key[:-1] + (True,)]
            grouped[key[:2]].append((before, after))
        for (kind, size), pairs in grouped.items():
            speedups = [a["median_ns"] / b["median_ns"] for a, b in pairs]
            summary.append(dict(
                option=option, kind=kind, n=size, pairs=len(pairs),
                median_speedup=statistics.median(speedups),
                min_speedup=min(speedups), max_speedup=max(speedups),
                geomean_speedup=math.exp(statistics.mean(math.log(v) for v in speedups)),
                identical_source_pairs=sum(a["source_sha256"] == b["source_sha256"] for a, b in pairs),
                local_bytes_before=sorted(set(a["local_bytes_after"] for a, _ in pairs)),
                local_bytes_after=sorted(set(b["local_bytes_after"] for _, b in pairs)),
                source_bytes_delta=sorted(set(b["source_bytes"]-a["source_bytes"] for a, b in pairs)),
                compile_seconds_before=statistics.median(a["compile_seconds"] for a, _ in pairs),
                compile_seconds_after=statistics.median(b["compile_seconds"] for _, b in pairs)))
    pathlib.Path(args.output).write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
