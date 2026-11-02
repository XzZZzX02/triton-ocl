#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:20:00
#SBATCH -J sycl-integer-extrema-special
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-integer-extrema-special-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-integer-extrema-special-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check "$base/gap-validation/next/integer-extrema-sha256.txt"
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
dtype=$1
kind=$2
for data in boundary identity high empty one; do
  "$base/bin/python-triton" python/test/sycl/integer_extrema.py \
    --dtype "$dtype" --kind "$kind" --data "$data" --stack full --epoch after \
    --output "$base/gap-validation/next/integer-extrema-special-dcu-$SLURM_JOB_ID-$data.json"
done
"$base/bin/python-triton" python/test/sycl/integer_extrema.py \
  --dtype "$dtype" --kind "$kind" --conditional --grid 1 --stack full --epoch after \
  --output "$base/gap-validation/next/integer-extrema-special-dcu-$SLURM_JOB_ID-conditional.json"
