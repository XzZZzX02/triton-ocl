#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-init-layout
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-init-layout-%j.log
# Current compiler rerun; historical timings require their archived compiler/harness.
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-init-layout-${SLURM_JOB_ID}/tmp
export ACPP_APPDB_DIR=/tmp/sycl-init-layout-${SLURM_JOB_ID}/appdb
export TRITON_CACHE_DIR=/tmp/sycl-init-layout-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/model_layout_semantics.py | cut -d ' ' -f1)" = 0c979ebae5737e58299ce0d828132fe4d07f310898778c546a4d5720e4f79982
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/AccumulatorInitForwarding.cpp python/triton/_C/libtriton.so
"$base/bin/python-triton" python/test/sycl/model_layout_semantics.py --cases "$@" --schedule init-pair --timeout 480 --python "$base/bin/python-triton" --output "$base/gap-validation/next/init-layout-dcu-${SLURM_JOB_ID}.json"
