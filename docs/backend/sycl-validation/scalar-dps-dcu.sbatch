#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH -t 00:15:00
#SBATCH -J sycl-scalar-dps
#SBATCH -o /public/home/dtune/zzx/triton/gap-validation/scalar-dps-dcu-%j.log
set -e
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export PYTHONPATH="$base/gap-validation/scalar-dps-python" TRITON_CACHE_DIR="$base/gap-validation/cache-scalar-dps-dcu"
export ACPP_VISIBILITY_MASK=hip TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1 TMPDIR=/tmp/dtune-sycl-scalar-$SLURM_JOB_ID ACPP_APPDB_DIR=/tmp/dtune-sycl-scalar-dps-appdb-$SLURM_JOB_ID
unset LD_PRELOAD
mkdir -p "$TMPDIR"
hostname
"$base/bin/python-triton" "$base/gap-validation/scalar_pointer_final.py"
"$base/bin/python-triton" "$base/gap-validation/semantics.py" --all --group memory --mode run --jobs 4 --python "$base/bin/python-triton" --output "$base/gap-validation/scalar-dps-memory-dcu.json"
echo SCALAR_FINAL_COMPLETE
