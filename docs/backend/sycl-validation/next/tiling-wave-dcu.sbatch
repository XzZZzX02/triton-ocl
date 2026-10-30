#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-tile-wave
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-tile-wave-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-tile-wave-${SLURM_JOB_ID}/tmp
export ACPP_APPDB_DIR=/tmp/sycl-tile-wave-${SLURM_JOB_ID}/appdb
export TRITON_CACHE_DIR=/tmp/sycl-tile-wave-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/MatmulRegisterTiling.cpp | cut -d ' ' -f1)" = 35acace7304cd55e4002232049f39c4979c014dde82ddd5f4a4e8d45baec5fe8
test "$(sha256sum python/test/sycl/accumulator_init_semantics.py | cut -d ' ' -f1)" = 73dc98b12bbc95e939a77046a18a3b5b5a9e6f88e862b09e9a3726cc6d67962a
test "$(sha256sum python/test/sycl/register_accumulator.py | cut -d ' ' -f1)" = a8547790edac1809116467b32c1326d824e4530c2abbb70b131bdca2f380b191
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
sha256sum python/triton/_C/libtriton.so third_party/sycl/backend/compiler.py
mode=$1
shift
if test "$mode" = standalone; then
 "$base/bin/python-triton" python/test/sycl/register_accumulator.py --tiling --rounds 3 --repeats 31 "$@" --output "$base/gap-validation/next/tile-wave-dcu-${SLURM_JOB_ID}.json"
else
 test "$mode" = combined
 "$base/bin/python-triton" python/test/sycl/accumulator_init_semantics.py --rounds 3 --repeats 31 "$@" --output "$base/gap-validation/next/tile-wave-dcu-${SLURM_JOB_ID}.json"
fi
