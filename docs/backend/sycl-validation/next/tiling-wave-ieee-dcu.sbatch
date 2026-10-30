#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-wave-ieee
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-wave-ieee-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-wave-ieee-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/accumulator_init_ieee.py | cut -d ' ' -f1)" = 1428aeb52a9400e4d865c6445d5b436871b45a38013143261a99fa17714eef16
test "$(sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/MatmulRegisterTiling.cpp | cut -d ' ' -f1)" = 35acace7304cd55e4002232049f39c4979c014dde82ddd5f4a4e8d45baec5fe8
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum python/triton/_C/libtriton.so
"$base/bin/python-triton" python/test/sycl/accumulator_init_ieee.py --dtype "$1" --initials "$2" "$3" --output "$base/gap-validation/next/tile-wave-ieee-dcu-$SLURM_JOB_ID.json"
