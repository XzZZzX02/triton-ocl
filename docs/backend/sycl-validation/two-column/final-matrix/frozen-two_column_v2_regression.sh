set -eo pipefail
base=/public/home/dtune/zzx/triton
source $base/env.sh
unset LD_PRELOAD
cd /work1/dtune/zzx/triton/triton-ocl
export TRITON_CACHE_DIR=/tmp/two-column-v2-host-contracts-20261102
for suite in two_column_extended_contracts pass_contracts ordered_unroll_contracts accumulator_init_contracts cooperative_staging_contracts fusion_destination_contracts terminal_store_contracts half_store_contracts integer_extrema_contracts; do
 $base/bin/python-triton python/test/sycl/$suite.py --output $base/gap-validation/next/two-column-v2-$suite.json > $base/gap-validation/next/two-column-v2-$suite.log 2>&1 || { tail -12 $base/gap-validation/next/two-column-v2-$suite.log | cut -c1-900;exit 1; }
 echo PASS-$suite
done
