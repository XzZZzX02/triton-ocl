#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:15:00
#SBATCH -J sycl-half-final-bits
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-half-final-bits-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-half-final-bits-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check "$base/gap-validation/next/half-copy-extended-sha256.txt"
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
if test "$1" = cost; then
  shift
  "$base/bin/python-triton" python/test/sycl/half_copy_output_cost.py "$@" \
    --output "$base/gap-validation/next/half-output-cost-$SLURM_JOB_ID.json"
else
  "$base/bin/python-triton" python/test/sycl/serial_half_copy_bits.py "$@" \
    --dump-dir "$base/gap-validation/next/half-final-bits-$SLURM_JOB_ID-sources" \
    --output "$base/gap-validation/next/half-final-bits-$SLURM_JOB_ID.json"
fi
