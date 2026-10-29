#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-layout-optimized
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-layout-optimized-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-layout-optimized-${SLURM_JOB_ID}/tmp ACPP_APPDB_DIR=/tmp/sycl-layout-optimized-${SLURM_JOB_ID}/appdb TRITON_CACHE_DIR=/tmp/sycl-layout-optimized-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/model_layout_semantics.py | cut -d " " -f1)" = 06c0b7823259f3f8f18f0b8d12f04dd8b8b0dcfd1e87947be674aa506b17dcbe
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/model_layout_semantics.py --cases "$@" --schedule both --timeout 480 --python "$base/bin/python-triton" --output "$base/gap-validation/next/layout-optimized-${SLURM_JOB_ID}.json"
