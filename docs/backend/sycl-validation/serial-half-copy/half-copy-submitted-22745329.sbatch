#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-half-stack
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-half-stack-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-half-stack-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check <<'SHA'
1a6310a64f0a982c5a17b52515276a2428c23e1cda5a5918e9eaf39d65fed456  python/triton/_C/libtriton.so
4521f01b70d1d3ebdac6f90fb57ef237e069d1c1c6be727d2a3fbeb36498f837  python/triton/_C/triton-sycl-translate
0d77c90838358e5b722fe55ff48e0838fb36b7e1d563e286b0c6804aced0e237  third_party/sycl/backend/compiler.py
e16a7ec98b74f4134a21722983ab0f84eb3cbee3a47a68001d9ce6a7411575c7  python/test/sycl/full_stack_ablation.py
SHA
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
if test "$1" = bits; then
  "$base/bin/python-triton" python/test/sycl/serial_half_copy_bits.py \
    --output "$base/gap-validation/next/half-copy-bits-dcu-$SLURM_JOB_ID.json"
else
  "$base/bin/python-triton" python/test/sycl/full_stack_ablation.py "$@" \
    --rounds 3 --repeats 31 \
    --dump-dir "$base/gap-validation/next/half-stack-$SLURM_JOB_ID-sources" \
    --output "$base/gap-validation/next/half-stack-dcu-$SLURM_JOB_ID.json"
fi
