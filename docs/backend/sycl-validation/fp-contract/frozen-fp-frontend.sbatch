#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:20:00
#SBATCH -J sycl-fp-frontend
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-fp-frontend-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-fp-frontend-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check "$base/gap-validation/next/fp-frontend-sha256.txt"
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
for layout in "$@"; do
 for data in rounding special; do
  "$base/bin/python-triton" python/test/sycl/fp_contract_dot.py --shape 8 16 32 --layout "$layout" --dtype f32 --data "$data" --bounds full --plans raw full --blocks 1 64 3x5 --output "$base/gap-validation/next/fp-frontend-$SLURM_JOB_ID-$layout-$data.json" --dump-dir "$base/gap-validation/next/fp-frontend-$SLURM_JOB_ID-$layout-$data-sources"
 done
done
