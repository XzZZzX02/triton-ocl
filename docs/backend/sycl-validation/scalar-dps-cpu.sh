set -e
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export PYTHONPATH="$base/gap-validation/scalar-dps-python" TRITON_CACHE_DIR="$base/gap-validation/cache-scalar-dps-cpu"
export ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4 TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1 TMPDIR=/tmp/dtune-sycl-scalar ACPP_APPDB_DIR=/tmp/dtune-sycl-scalar-dps-appdb
mkdir -p "$TMPDIR"
"$base/bin/python-triton" "$base/gap-validation/scalar_pointer_final.py"
"$base/bin/python-triton" "$base/gap-validation/semantics.py" --all --group memory --mode run --jobs 4 --python "$base/bin/python-triton" --output "$base/gap-validation/scalar-dps-memory-cpu.json"
echo SCALAR_FINAL_COMPLETE
