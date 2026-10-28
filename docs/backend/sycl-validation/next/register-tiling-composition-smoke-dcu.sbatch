#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:15:00
#SBATCH -J triton-sycl-tiling-compose
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/triton-sycl-tiling-compose-%j.log
set -eo pipefail
ulimit -c 0

base=/public/home/dtune/zzx/triton
repo=/work1/dtune/zzx/triton/triton-ocl
script=/work1/dtune/zzx/triton/gap-validation/next/register_accumulator.py
expected_sha256=652bf296e92f46f2b6f506f4557a0e39ca9c5c9f1a6b2ca12a757541e05e93be
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
node_tmp="/tmp/triton-sycl-compose-${SLURM_JOB_ID}"
export TMPDIR="$node_tmp/tmp"
export ACPP_APPDB_DIR="$node_tmp/appdb"
export TRITON_CACHE_DIR="$node_tmp/triton-cache"
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"

cd "$repo"
actual_sha256=$(sha256sum "$script" | awk '{print $1}')
test "$actual_sha256" = "$expected_sha256"
printf 'composition smoke harness sha256: %s\n' "$actual_sha256"
"$base/bin/python-triton" "$script" --shape 32 64 64 --tiling \
  --layout NN --dtype f32 --config-index 3 \
  --output "$base/gap-validation/next/register-tiling-composition-${SLURM_JOB_ID}.json"
