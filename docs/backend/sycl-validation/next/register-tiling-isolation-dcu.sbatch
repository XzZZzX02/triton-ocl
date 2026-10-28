#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J triton-sycl-tiling-isolation
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/triton-sycl-tiling-isolation-%j.log
set -eo pipefail
ulimit -c 0

base=/public/home/dtune/zzx/triton
repo=/work1/dtune/zzx/triton/triton-ocl
script=/work1/dtune/zzx/triton/gap-validation/next/register_accumulator.py
expected_sha256=d4f6cc6639759de9e86e7c925221b22b95816bf853825727d73caf2be6b67d3c
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
node_tmp="/tmp/triton-sycl-tiling-${SLURM_JOB_ID}"
export TMPDIR="$node_tmp/tmp"
export ACPP_APPDB_DIR="$node_tmp/appdb"
export TRITON_CACHE_DIR="$node_tmp/triton-cache"
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"

cd "$repo"
actual_sha256=$(sha256sum "$script" | awk '{print $1}')
test "$actual_sha256" = "$expected_sha256"
printf 'tiling benchmark harness sha256: %s\n' "$actual_sha256"
"$base/bin/python-triton" "$script" --tiling --layout NN --dtype f32 \
  --repeats 31 --rounds 3 \
  --output "$base/gap-validation/next/register-tiling-isolation-${SLURM_JOB_ID}.json"
