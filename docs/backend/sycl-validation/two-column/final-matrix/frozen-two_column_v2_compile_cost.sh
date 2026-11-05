set -eo pipefail
base=/public/home/dtune/zzx/triton
source $base/env.sh
unset LD_PRELOAD
export ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4
cd /work1/dtune/zzx/triton/triton-ocl
$base/bin/python-triton - <<'REMOTE'
import pathlib,subprocess,json,itertools,statistics
p=pathlib.Path('/public/home/dtune/zzx/triton/gap-validation/next');rows=[]
for r in range(3):
 plans=list(itertools.product((16,32,128),('base','full'),(False,True)))
 for k,plan,enabled in (plans if r%2==0 else reversed(plans)):
  name='two-column-v2-compile-cost-'+str(k)+'-'+plan+'-'+str(int(enabled))+'-'+str(r)
  with (p/(name+'.log')).open('w') as log:
   subprocess.run(['/public/home/dtune/zzx/triton/bin/python-triton','python/test/sycl/two_column_compile_cost.py','--enabled',str(int(enabled)),'--plan',plan,'--k',str(k),'--round',str(r),'--output',str(p/(name+'.json'))],stdout=log,stderr=subprocess.STDOUT,check=True)
  rows.append(json.loads((p/(name+'.json')).read_text()))
  (p/'two-column-v2-compile-cost.json').write_text(json.dumps(rows,indent=2))
for k,plan in itertools.product((16,32,128),('base','full')):
 print('cold-compile',k,plan,{str(enabled):round(statistics.median(x['seconds'] for x in rows if x['shape'][2]==k and x['plan']==plan and x['enabled']==enabled),4) for enabled in (False,True)})
REMOTE
