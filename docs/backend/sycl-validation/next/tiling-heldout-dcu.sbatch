#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:25:00
#SBATCH -J sycl-tiling-heldout
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-tiling-heldout-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
export TMPDIR=/tmp/sycl-tiling-heldout-${SLURM_JOB_ID}/tmp ACPP_APPDB_DIR=/tmp/sycl-tiling-heldout-${SLURM_JOB_ID}/appdb TRITON_CACHE_DIR=/tmp/sycl-tiling-heldout-${SLURM_JOB_ID}/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
script=$base/gap-validation/next/register_accumulator_pre_gate.py
test "$(sha256sum "$script" | cut -d " " -f1)" = 7048375bebb3c2867d8ff24e2488f03bbd2270b62e1d72c033ab6d94c8701dac
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" "$script" --shape "$1" "$2" "$3" --layout "$4" --tiling --repeats 31 --rounds 3 --output "$base/gap-validation/next/tiling-heldout-${SLURM_JOB_ID}.json"
