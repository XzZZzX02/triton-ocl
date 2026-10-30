#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH --exclusive
#SBATCH -t 00:30:00
#SBATCH -J sycl-terminal-store
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/sycl-terminal-store-%j.log
set -eo pipefail
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=hip
node_tmp=/tmp/sycl-terminal-store-$SLURM_JOB_ID
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR" "$TRITON_CACHE_DIR"
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check <<'SHA'
5afce414635a59881ed9483c1359d4facb39c10b2b91c8c2e4ac5d246cc60c51  third_party/sycl/lib/Conversion/LinalgToAffineLoops/TerminalStoreDistribution.cpp
8d0bf9233c848dce5383fb87c2694955f14f0e4c9edbf532f81c2cef703bb6af  third_party/sycl/lib/Conversion/LinalgToAffineLoops/ElementwiseFusion.cpp
b2f52ad003966ce501f84c961b3bb546e53f0ff7ddd66263d2c924b0b719fba6  third_party/sycl/lib/Conversion/LinalgToAffineLoops/CooperativeLoadStaging.cpp
1bbb93dd9219eec62fe082d152fdfdfa9d6d95b444d83bcadcd7f318a3f076c0  third_party/sycl/backend/compiler.py
25039303c59103296fafa1b08cc7ad8239135950ffeac1b09c9c6af646157b78  python/test/sycl/terminal_store_semantics.py
c7b7b64e756ffe1ddb68009400bcb0713fcb353da212344ce7ce750f5ce101f0  python/test/sycl/cooperative_staging_semantics.py
a8547790edac1809116467b32c1326d824e4530c2abbb70b131bdca2f380b191  python/test/sycl/register_accumulator.py
89e3dd0c6d0b2e87e03e6aa55b0ceab07153ae16f0ef014566868a2ed7402b6f  python/triton/_C/libtriton.so
SHA
sha256sum python/triton/_C/libtriton.so
hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" python/test/sycl/terminal_store_semantics.py "$@" --output "$base/gap-validation/next/terminal-store-dcu-$SLURM_JOB_ID.json"
