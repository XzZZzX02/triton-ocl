set -e
base=/public/home/dtune/zzx/triton
source "$base/env.sh"
export ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4 TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1
export PYTHONPATH="$base/gap-validation/gated-python" TRITON_CACHE_DIR="$base/gap-validation/cache-gated-cpu-local" ACPP_APPDB_DIR="/tmp/dtune-sycl-appdb-gated" TMPDIR="/tmp/dtune-sycl-gated"
mkdir -p "$TMPDIR" "$ACPP_APPDB_DIR"
"$base/bin/python-triton" "$base/gap-validation/optimization_semantics.py"
"$base/bin/python-triton" "$base/gap-validation/semantics.py" --all --mode run --jobs 4 --python "$base/bin/python-triton" --timeout 120 --output "$base/gap-validation/gated-cpu-local.json"
"$base/bin/python-triton" "$base/gap-validation/optimized_reductions.py"
