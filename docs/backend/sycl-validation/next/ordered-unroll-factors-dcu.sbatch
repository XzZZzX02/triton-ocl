#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:20:00
#SBATCH -J sycl-unroll-factors
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-unroll-factors-%j.log
# Current compiler rerun; historical timings require their archived compiler/harness.
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-unroll-factors-${SLURM_JOB_ID}/tmp ACPP_APPDB_DIR=/tmp/sycl-unroll-factors-${SLURM_JOB_ID}/appdb TRITON_CACHE_DIR=/tmp/sycl-unroll-factors-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
test "$(sha256sum python/test/sycl/register_accumulator.py | cut -d " " -f1)" = a8547790edac1809116467b32c1326d824e4530c2abbb70b131bdca2f380b191
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/register_accumulator.py --shape 16 32 32 --layout NN --dtype f32 --tiling --accumulated-only --unroll 1 2 8 --special --output "$base/gap-validation/next/ordered-unroll-factors-${SLURM_JOB_ID}.json"
