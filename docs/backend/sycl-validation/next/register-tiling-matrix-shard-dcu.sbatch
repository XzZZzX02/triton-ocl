#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-tiling-shard
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-tiling-shard-%j.log
set -eo pipefail
ulimit -c 0
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
node_tmp=/tmp/sycl-tiling-shard-${SLURM_JOB_ID}
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
script=$base/gap-validation/next/register_accumulator_matrix_baseline.py
test "$(sha256sum "$script" | cut -d " " -f1)" = 652bf296e92f46f2b6f506f4557a0e39ca9c5c9f1a6b2ca12a757541e05e93be
hostname
"$base/bin/python-triton" "$script" --shape "$1" "$2" "$3" --layout "$4" \
  --tiling --repeats 31 --rounds 3 \
  --output "$base/gap-validation/next/register-tiling-shard-dcu-${SLURM_JOB_ID}.json"
