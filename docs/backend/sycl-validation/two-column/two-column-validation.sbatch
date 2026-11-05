#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:25:00
#SBATCH -J sycl-two-column-v2
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-two-column-v2-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source $base/env.sh
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-two-column-v2-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p $TMPDIR $ACPP_APPDB_DIR $TRITON_CACHE_DIR
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check $base/gap-validation/next/two-column-v2-sha256.txt
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
mode=$1
shift
if test $mode = layouts; then
  $base/bin/python-triton python/test/sycl/model_layout_semantics.py --mode run --schedule two-column-pair --rounds 3 --repeats 31 --timeout 600 --python $base/bin/python-triton "$@" --output $base/gap-validation/next/two-column-v2-layouts-$SLURM_JOB_ID.json
elif test $mode = dot; then
  $base/bin/python-triton python/test/sycl/two_column_semantics.py --rounds 3 --repeats 31 "$@" --dump-dir $base/gap-validation/next/two-column-v2-$SLURM_JOB_ID-sources --output $base/gap-validation/next/two-column-v2-dcu-$SLURM_JOB_ID.json
else
  echo Unknown-validation-mode
  exit 2
fi
