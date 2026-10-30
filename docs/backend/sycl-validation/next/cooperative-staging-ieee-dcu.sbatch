#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-staging-ieee
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-staging-ieee-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-staging-ieee-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check <<'SHA'
b2f52ad003966ce501f84c961b3bb546e53f0ff7ddd66263d2c924b0b719fba6  third_party/sycl/lib/Conversion/LinalgToAffineLoops/CooperativeLoadStaging.cpp
fd6067e8fc78cef398c6ed4ee0a08bc3f8dcb8ec225eefa20b1dec20120ebd43  third_party/sycl/include/Conversion/TritonToLinalg/ScalarMemory.hpp
7072a844dec03f82a4098ef3fad0511245004006858b63c6fe0f419bff439e0f  third_party/sycl/backend/compiler.py
f8a9229baf259e9d9a7a4827b84981e324f946e0f4ec0bc6caaebb518523c56a  python/test/sycl/cooperative_staging_ieee.py
e2e2983c2e8cc7927fca131fca1351339b99d206a4bc56d582adb5bbacc6d700  python/triton/_C/libtriton.so
SHA
sha256sum python/triton/_C/libtriton.so
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/cooperative_staging_ieee.py "$@" --output "$base/gap-validation/next/staging-ieee-$SLURM_JOB_ID.json"
