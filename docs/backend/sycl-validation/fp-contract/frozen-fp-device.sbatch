#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:15:00
#SBATCH -J sycl-fp-contract
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-fp-contract-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-fp-contract-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check "$base/gap-validation/next/fp-device-sha256.txt"
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/fp_contract_semantics.py "$@" --guards 0 1 --blocks 1 3 48 64 3x5 --rounds 3 --repeats 31 --output "$base/gap-validation/next/fp-device-$SLURM_JOB_ID.json" --dump-dir "$base/gap-validation/next/fp-device-$SLURM_JOB_ID-sources"
