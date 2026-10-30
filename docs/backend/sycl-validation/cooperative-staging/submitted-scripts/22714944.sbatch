#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-staging
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-staging-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-staging-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/CooperativeLoadStaging.cpp | cut -d ' ' -f1)" = b2f52ad003966ce501f84c961b3bb546e53f0ff7ddd66263d2c924b0b719fba6
test "$(sha256sum third_party/sycl/include/Conversion/TritonToLinalg/ScalarMemory.hpp | cut -d ' ' -f1)" = fd6067e8fc78cef398c6ed4ee0a08bc3f8dcb8ec225eefa20b1dec20120ebd43
test "$(sha256sum python/test/sycl/cooperative_staging_semantics.py | cut -d ' ' -f1)" = c7b7b64e756ffe1ddb68009400bcb0713fcb353da212344ce7ce750f5ce101f0
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum third_party/sycl/backend/compiler.py python/triton/_C/libtriton.so
"$base/bin/python-triton" python/test/sycl/cooperative_staging_semantics.py "$@" --output "$base/gap-validation/next/staging-dcu-$SLURM_JOB_ID.json"
