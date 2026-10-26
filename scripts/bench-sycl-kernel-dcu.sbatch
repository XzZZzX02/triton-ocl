#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --gres=dcu:1
#SBATCH -t 00:15:00
#SBATCH -J triton-sycl-kernel
#SBATCH -D /public/home/dtune/zzx/triton
#SBATCH -o /public/home/dtune/zzx/triton/logs/triton-sycl-kernel-%j.log
set -eo pipefail
ulimit -c 0

base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=hip
unset LD_PRELOAD
: "${TRITON_SYCL_BLOCK_LIST:=32,64,128,256,512,1024}"
: "${TRITON_SYCL_BENCH_REPEATS:=15}"
: "${TRITON_SYCL_BENCH_WARMUPS:=5}"
: "${TRITON_SYCL_BENCH_SIZE:=1048576}"
export TRITON_SYCL_BLOCK_LIST TRITON_SYCL_BENCH_REPEATS
export TRITON_SYCL_BENCH_WARMUPS TRITON_SYCL_BENCH_SIZE

hostname
/public/home/dtune/zzx/acpp-build/hip_probe
"$base/bin/python-triton" /work1/dtune/zzx/triton/triton-ocl/python/bench_sycl_runtime.py
