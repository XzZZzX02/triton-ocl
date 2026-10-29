#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-init-forward
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-init-forward-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-init-${SLURM_JOB_ID}/tmp
export ACPP_APPDB_DIR=/tmp/sycl-init-${SLURM_JOB_ID}/appdb
export TRITON_CACHE_DIR=/tmp/sycl-init-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/accumulator_init_semantics.py | cut -d ' ' -f1)" = 0a91bc5588b0463897f3ed0b78249971e8aec14eecfe1524fa8a478a7f8743d3
test "$(sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/AccumulatorInitForwarding.cpp | cut -d ' ' -f1)" = 7385025e2f87f3263d508c9e8d13c828c0e633c828318f550008a38d4e434a03
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum python/triton/_C/libtriton.so third_party/sycl/backend/compiler.py
"$base/bin/python-triton" python/test/sycl/accumulator_init_semantics.py "$@" --output "$base/gap-validation/next/accumulator-init-dcu-${SLURM_JOB_ID}.json"
