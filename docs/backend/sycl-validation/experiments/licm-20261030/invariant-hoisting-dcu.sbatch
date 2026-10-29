#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-invariant
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-invariant-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-invariant-${SLURM_JOB_ID}/tmp
export ACPP_APPDB_DIR=/tmp/sycl-invariant-${SLURM_JOB_ID}/appdb
export TRITON_CACHE_DIR=/tmp/sycl-invariant-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum python/test/sycl/invariant_hoisting_semantics.py third_party/sycl/lib/Conversion/LinalgToAffineLoops/LoopInvariantComputeHoisting.cpp python/triton/_C/libtriton.so
"$base/bin/python-triton" python/test/sycl/invariant_hoisting_semantics.py --rows "${1:-16}" --columns "${2:-128}" --rounds 3 --repeats 31 --output "$base/gap-validation/next/invariant-dcu-${SLURM_JOB_ID}.json"
