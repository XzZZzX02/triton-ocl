#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:15:00
#SBATCH -J sycl-half-dist-probe
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-half-dist-probe-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/half-dist-probe-$SLURM_JOB_ID/tmp
export ACPP_APPDB_DIR=/tmp/half-dist-probe-$SLURM_JOB_ID/appdb
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/half_copy_distributed_probe.py \
  --output "$base/gap-validation/next/half-dist-probe-$SLURM_JOB_ID.json"
