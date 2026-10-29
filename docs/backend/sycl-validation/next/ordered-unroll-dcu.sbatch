#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-ordered-unroll
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-ordered-unroll-%j.log
set -eo pipefail
ulimit -c 0
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
node_tmp=/tmp/sycl-ordered-unroll-${SLURM_JOB_ID}
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
script=python/test/sycl/register_accumulator.py
test "$(sha256sum "$script" | cut -d " " -f1)" = 7048375bebb3c2867d8ff24e2488f03bbd2270b62e1d72c033ab6d94c8701dac
hostname
"$base/bin/python-triton" "$script" --shape "${3:-16}" "${4:-32}" "${5:-32}" --tiling --accumulated-only \
  --unroll 1 4 --layout "${1:-NN}" --dtype "${2:-f32}" --repeats 31 --rounds 3 \
  --output "$base/gap-validation/next/ordered-unroll-dcu-${SLURM_JOB_ID}.json"
