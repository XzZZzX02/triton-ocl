#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH -t 00:25:00
#SBATCH -J triton-sycl-ieee-red
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/triton-sycl-ieee-red-%j.log
set -eo pipefail
ulimit -c 0

base=/public/home/dtune/zzx/triton
repo=/work1/dtune/zzx/triton/triton-ocl
script=/work1/dtune/zzx/triton/gap-validation/next/dtype_semantics_ieee_reduction_0f9de798.py
expected_sha256=0f9de798f62da6e75828c542535abb667bcaadbf6bba8048c8ea88a0c21b275a
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
export TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1
unset LD_PRELOAD
node_tmp="/tmp/triton-sycl-ieee-red-${SLURM_JOB_ID}"
export TMPDIR="$node_tmp/tmp"
export ACPP_APPDB_DIR="$node_tmp/appdb"
export TRITON_CACHE_DIR="$node_tmp/triton-cache"
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"

cd "$repo"
actual_sha256=$(sha256sum "$script" | awk '{print $1}')
test "$actual_sha256" = "$expected_sha256"
printf 'dtype harness sha256: %s\n' "$actual_sha256"
"$base/bin/python-triton" "$script" \
  --cases ieee_reduction:float16 ieee_reduction:bfloat16 \
          ieee_reduction:float32 ieee_reduction:float64 \
  --mode run --jobs 1 --timeout 240 --python "$base/bin/python-triton" \
  --output "$base/gap-validation/next/ieee-reduction-dcu-${SLURM_JOB_ID}.json"
