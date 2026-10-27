#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH -t 00:30:00
#SBATCH -J sycl-gated-final
#SBATCH -o /public/home/dtune/zzx/triton/gap-validation/gated-dcu-%j.log
set -e
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1
unset LD_PRELOAD
export TMPDIR=/tmp/dtune-sycl-gated-$SLURM_JOB_ID
mkdir -p "$TMPDIR"
hostname
command -v acpp-info && acpp-info || true
export PYTHONPATH="$base/gap-validation/gated-python" TRITON_CACHE_DIR="$base/gap-validation/cache-gated-dcu" ACPP_APPDB_DIR="/tmp/dtune-sycl-appdb-$SLURM_JOB_ID-gated-dcu"
"$base/bin/python-triton" "$base/gap-validation/optimization_semantics.py"
"$base/bin/python-triton" "$base/gap-validation/semantics.py" --all --mode run --jobs 4 --python "$base/bin/python-triton" --timeout 120 --output "$base/gap-validation/gated-dcu.json"
"$base/bin/python-triton" "$base/gap-validation/optimized_reductions.py"
export PYTHONPATH="$base/gap-validation/functional-python" TRITON_CACHE_DIR="$base/gap-validation/cache-gated-perf-before" ACPP_APPDB_DIR="/tmp/dtune-sycl-appdb-$SLURM_JOB_ID-gated-perf-before"
"$base/bin/python-triton" "$base/gap-validation/performance-next.py" --output "$base/gap-validation/performance-default-before.json"
export PYTHONPATH="$base/gap-validation/gated-python" TRITON_CACHE_DIR="$base/gap-validation/cache-gated-perf-after" ACPP_APPDB_DIR="/tmp/dtune-sycl-appdb-$SLURM_JOB_ID-gated-perf-after"
"$base/bin/python-triton" "$base/gap-validation/performance-next.py" --output "$base/gap-validation/performance-default-after.json"
