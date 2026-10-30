#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-tiling-guard
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-tiling-guard-%j.log
# Current compiler rerun; historical timings require their archived compiler/harness.
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-tiling-guard-${SLURM_JOB_ID}/tmp ACPP_APPDB_DIR=/tmp/sycl-tiling-guard-${SLURM_JOB_ID}/appdb TRITON_CACHE_DIR=/tmp/sycl-tiling-guard-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/register_accumulator.py | cut -d " " -f1)" = a8547790edac1809116467b32c1326d824e4530c2abbb70b131bdca2f380b191
test "$(sha256sum third_party/sycl/lib/Conversion/LinalgToAffineLoops/MatmulRegisterTiling.cpp | cut -d " " -f1)" = 35acace7304cd55e4002232049f39c4979c014dde82ddd5f4a4e8d45baec5fe8
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/register_accumulator.py --shape "$1" "$2" "$3" --layout "$4" --tiling --accumulated-only --unroll 1 4 --rounds 3 --repeats 31 --output "$base/gap-validation/next/tiling-guard-${SLURM_JOB_ID}.json"
