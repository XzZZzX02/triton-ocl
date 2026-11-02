#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:15:00
#SBATCH -J sycl-integer-extrema-final
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-integer-extrema-final-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-integer-extrema-final-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check "$base/gap-validation/next/integer-extrema-final-sha256.txt"
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
dtype=$1
for kind in min max; do
  "$base/bin/python-triton" python/test/sycl/integer_extrema.py \
    --dtype "$dtype" --kind "$kind" --conditional --grid 1 --stack full --epoch after \
    --output "$base/gap-validation/next/integer-extrema-final-dcu-$SLURM_JOB_ID-$kind-conditional.json"
done
"$base/bin/python-triton" python/test/sycl/integer_extrema.py \
  --dtype "$dtype" --kind max --data boundary --stack full --epoch after \
  --output "$base/gap-validation/next/integer-extrema-final-dcu-$SLURM_JOB_ID-boundary.json"
"$base/bin/python-triton" python/test/sycl/integer_extrema.py \
  --dtype "$dtype" --kind max --block 512 --stack full --epoch after \
  --output "$base/gap-validation/next/integer-extrema-final-dcu-$SLURM_JOB_ID-short.json"
