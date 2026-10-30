#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-wave-layout
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-wave-layout-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-wave-layout-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/model_layout_semantics.py | cut -d ' ' -f1)" = 0c979ebae5737e58299ce0d828132fe4d07f310898778c546a4d5720e4f79982
test "$(sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/MatmulRegisterTiling.cpp | cut -d ' ' -f1)" = 35acace7304cd55e4002232049f39c4979c014dde82ddd5f4a4e8d45baec5fe8
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum python/triton/_C/libtriton.so
tile_shape=$1
shift
"$base/bin/python-triton" python/test/sycl/model_layout_semantics.py --tile-shape "$tile_shape" --cases "$@" --schedule init-pair --timeout 480 --python "$base/bin/python-triton" --output "$base/gap-validation/next/tile-wave-layout-$tile_shape-$SLURM_JOB_ID.json"
