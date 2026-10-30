#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-fusion-destination
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-fusion-destination-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-fusion-destination-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check <<'SHA'
8d0bf9233c848dce5383fb87c2694955f14f0e4c9edbf532f81c2cef703bb6af  third_party/sycl/lib/Conversion/LinalgToAffineLoops/ElementwiseFusion.cpp
a1cb7b5bc54808dfbcc98edd4eeb7e3f7724fbf436fa11a2d0df2f6647f80563  python/test/sycl/fusion_destination_semantics.py
3306bbe8187af253ca01af44c534132496832f1a38e1ccf1368b047d2a66ecfd  python/test/sycl/fusion_destination_contracts.py
d37092d2c29009346dd5e9e692d4f4b03b5a4e14f474d3fa6d0b4e85a8803dc8  python/test/sycl/cooperative_staging_boundaries.py
b2f52ad003966ce501f84c961b3bb546e53f0ff7ddd66263d2c924b0b719fba6  third_party/sycl/lib/Conversion/LinalgToAffineLoops/CooperativeLoadStaging.cpp
7072a844dec03f82a4098ef3fad0511245004006858b63c6fe0f419bff439e0f  third_party/sycl/backend/compiler.py
e14c680cd52fc2106aa4fc80cf80c653b54c1cd65fb50766f42839a098049254  python/triton/_C/libtriton.so
SHA
sha256sum python/triton/_C/libtriton.so
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
suite=$1
shift
if test "$suite" = sum; then
 "$base/bin/python-triton" python/test/sycl/cooperative_staging_boundaries.py --case sum "$@" --output "$base/gap-validation/next/fusion-destination-dcu-$SLURM_JOB_ID.json"
else
 "$base/bin/python-triton" python/test/sycl/fusion_destination_semantics.py --case "$suite" "$@" --output "$base/gap-validation/next/fusion-destination-dcu-$SLURM_JOB_ID.json"
fi
