#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:25:00
#SBATCH -J sycl-wave64-extended
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-wave64-extended-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-wave64-extended-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check "$base/gap-validation/next/wave64-extended-sha256.txt"
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
mode=$1
shift
case $mode in
launch)
 "$base/bin/python-triton" python/test/sycl/two_column_launch_performance.py "$@" --capture-codegen --dump-dir "$base/gap-validation/next/wave64-$SLURM_JOB_ID-sources" --output "$base/gap-validation/next/wave64-launch-$SLURM_JOB_ID.json"
 ;;
dot)
 "$base/bin/python-triton" python/test/sycl/two_column_semantics.py "$@" --dump-dir "$base/gap-validation/next/wave64-$SLURM_JOB_ID-sources" --output "$base/gap-validation/next/wave64-dot-$SLURM_JOB_ID.json"
 ;;
layouts)
 "$base/bin/python-triton" python/test/sycl/model_layout_semantics.py --mode run --schedule two-column-pair --timeout 600 --python "$base/bin/python-triton" "$@" --output "$base/gap-validation/next/wave64-layouts-$SLURM_JOB_ID.json"
 ;;
*)
 exit 2
 ;;
esac
