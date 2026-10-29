#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-unroll-semantics
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-unroll-semantics-%j.log
set -eo pipefail
ulimit -c 0
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
node_tmp=/tmp/sycl-unroll-semantics-${SLURM_JOB_ID}
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
script=python/test/sycl/ordered_unroll_semantics.py
test "$(sha256sum "$script" | cut -d " " -f1)" = 5dc3a50c8a7315dd5ee7831aa1558f705fad1e8b754e9c4a0afff6b2f01fd54c
hostname
"$base/bin/python-triton" "$script" "$@" \
  --output "$base/gap-validation/next/ordered-unroll-semantics-dcu-${SLURM_JOB_ID}.json"
