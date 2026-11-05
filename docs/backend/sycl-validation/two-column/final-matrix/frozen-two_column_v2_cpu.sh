set -eo pipefail
base=/public/home/dtune/zzx/triton
source $base/env.sh
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4
node_tmp=/tmp/sycl-two-column-v2-cpu-20261102
export TMPDIR=$node_tmp/tmp ACPP_APPDB_DIR=$node_tmp/appdb TRITON_CACHE_DIR=$node_tmp/cache
mkdir -p $TMPDIR $ACPP_APPDB_DIR $TRITON_CACHE_DIR
cd /work1/dtune/zzx/triton/triton-ocl
sha256sum --check $base/gap-validation/next/two-column-v2-sha256.txt
nice -n 10 timeout -k 10s 1200 $base/bin/python-triton python/test/sycl/two_column_semantics.py --layout NN --rounding --bounds full --rounds 1 --repeats 0 --output $base/gap-validation/next/two-column-v2-cpu-rounding.json > $base/gap-validation/next/two-column-v2-cpu-rounding.log 2>&1
echo PASS-CPU-rounding
nice -n 10 timeout -k 10s 1200 $base/bin/python-triton python/test/sycl/two_column_semantics.py --layout TT --special --rounds 1 --repeats 0 --output $base/gap-validation/next/two-column-v2-cpu-special.json > $base/gap-validation/next/two-column-v2-cpu-special.log 2>&1
echo PASS-CPU-special
