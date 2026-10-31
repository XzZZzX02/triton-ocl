#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 01:00:00
#SBATCH -J sycl-half-copy
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-half-copy-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-half-copy-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check <<'SHA'
1a6310a64f0a982c5a17b52515276a2428c23e1cda5a5918e9eaf39d65fed456  python/triton/_C/libtriton.so
4521f01b70d1d3ebdac6f90fb57ef237e069d1c1c6be727d2a3fbeb36498f837  python/triton/_C/triton-sycl-translate
e88c3e4f55cbc6440c74d3a8c3ec30dcd5983fb1cac11b32b4f86a67969d117a  third_party/sycl/lib/Conversion/LinalgToAffineLoops/SerialHalfCopyGuard.cpp
48347e610030b3f5f40d3b901bd935c4227ab338a65a4e56ad8d33d2b1affce6  third_party/sycl/tool/triton-sycl-translate/EmitSYCL.cpp
0d77c90838358e5b722fe55ff48e0838fb36b7e1d563e286b0c6804aced0e237  third_party/sycl/backend/compiler.py
SHA
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
for layout in TT NN NT TN; do
  "$base/bin/python-triton" python/test/sycl/serial_half_copy_semantics.py \
    --layout "$layout" --output "$base/gap-validation/next/half-copy-$SLURM_JOB_ID-$layout.json" \
    --dump-dir "$base/gap-validation/next/half-copy-$SLURM_JOB_ID-sources"
done
