#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH -t 00:30:00
#SBATCH -J triton-sycl-layout
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/triton-sycl-layout-%j.log
set -eo pipefail
ulimit -c 0

base=/public/home/dtune/zzx/triton
repo=/work1/dtune/zzx/triton/triton-ocl
script=/work1/dtune/zzx/triton/gap-validation/next/model_layout_semantics.py
expected_sha256=7b8db1a566c827c848e26e82bea541ee131252206356622ce2a19c852ef8da78
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
node_tmp="/tmp/triton-sycl-layout-${SLURM_JOB_ID}"
export TMPDIR="$node_tmp/tmp"
export ACPP_APPDB_DIR="$node_tmp/appdb"
export TRITON_CACHE_DIR="$node_tmp/triton-cache"
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"

cd "$repo"
actual_sha256=$(sha256sum "$script" | awk '{print $1}')
test "$actual_sha256" = "$expected_sha256"
printf 'model layout harness sha256: %s\n' "$actual_sha256"
if [[ $# -gt 0 ]]; then
  "$base/bin/python-triton" "$script" --case "$1" --mode run
  exit $?
fi
"$base/bin/python-triton" "$script" --all --mode run --jobs 1 --timeout 240 \
  --python "$base/bin/python-triton" \
  --output "$base/gap-validation/next/model-layout-dcu-${SLURM_JOB_ID}.json"
