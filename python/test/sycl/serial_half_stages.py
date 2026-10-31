"""Dump exact-kernel half input stages before dot, comparing independent indices."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace

from cooperative_staging_semantics import prepare, fbits
from register_accumulator import Tensor
from triton.backends.sycl.sycl_utils import run_standalone


def owner_blocks(body):
    pattern=r'if \(item\.get_local_id\(0\) == 0 && item\.get_local_id\(1\) == 0 && item\.get_local_id\(2\) == 0\) \{'
    result=[]
    for match in re.finditer(pattern,body):
        start=body.index('{',match.start()); depth=1; end=start+1
        while depth:
            if body[end]=='{':depth+=1
            if body[end]=='}':depth-=1
            end+=1
        result.append((match.start(),end))
    return result


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True)
    p.add_argument('--dump-dir',required=True)
    args=p.parse_args()
    fixture=SimpleNamespace(kind='dot',shape=[16,32,32],layout='TT',dtype='f16')
    kernel,warm,kw,bound,oldout,expected,grid=prepare(fixture)
    c=kernel.warmup(*warm,grid=(grid,),**kw,distribute_work=False,
        register_accumulator=True,reduction_unroll=4,fuse_elementwise=True,
        reuse_local_memory=True,matmul_register_tiling=True,group_reduction=True,
        cooperative_load_staging=True,terminal_store_distribution=True,accumulator_init_forwarding=True)
    source=c.asm['sycl'];source=source.decode() if isinstance(source,bytes) else source
    begin=source.index('inline void '+c.name+'(')
    end=source.index('extern "C" void launch_',begin)
    body=source[begin:end];blocks=owner_blocks(body)
    assert len(blocks)==7,len(blocks)
    local=re.findall(r'sycl::local_accessor<triton_sycl_float16, 2> (\w+)',body)
    assert len(local)==4,local
    pointers=re.findall(r'(?:triton_sycl_float16|float)\* (\w+)',body[:body.index(') {')])
    assert len(pointers)==3,pointers
    out=pointers[2]
    specs=[('A_loaded',local[0],32,16),('A_transposed',local[1],16,32),
           ('B_loaded',local[2],32,32),('B_transposed',local[3],32,32)]
    av=[(i%11-5)/4 for i in range(3*512)]
    bv=[(i%13-6)/4 for i in range(3*1024)]
    dump=pathlib.Path(args.dump_dir);dump.mkdir(exist_ok=True,parents=True)
    rows=[]
    for stage,array,R,C in specs:
        reference=[]
        for batch in range(3):
            for r in range(R):
                for col in range(C):
                    if stage=='A_loaded':v=av[batch*512+r*16+col] if r<31 and col<15 else 0.
                    elif stage=='A_transposed':v=av[batch*512+col*16+r] if col<31 and r<15 else 0.
                    elif stage=='B_loaded':v=bv[batch*1024+r*32+col] if r<29 and col<31 else 0.
                    else:v=bv[batch*1024+col*32+r] if col<29 and r<31 else 0.
                    reference.append(v)
        reference += [-999.]*7
        prefix=body[:blocks[4][1]]
        code=source[:begin]+prefix+f'''
  item.barrier(sycl::access::fence_space::local_space);
  if (item.get_local_linear_id()==0) {{
    #pragma clang loop vectorize(disable) interleave(disable)
    for (int dr=0;dr<{R};++dr) {{
      #pragma clang loop vectorize(disable) interleave(disable)
      for (int dc=0;dc<{C};++dc)
        {out}[item.get_group(0)*{R*C}+dr*{C}+dc]=static_cast<float>(static_cast<double>({array}[dr][dc]));
    }}
  }}
}}

'''+source[end:]
        (dump/(stage+'.sycl')).write_text(code)
        for block in (1,3,48):
            z=Tensor([-999.]*len(reference));argsbound=list(bound);argsbound[2]=z
            error=None
            try:
                run_standalone(grid,1,1,c.name,code,argsbound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                diff=[dict(index=i,got=a,want=b) for i,(a,b) in enumerate(zip(z.c_array,reference)) if fbits(a)!=fbits(b)]
            except Exception as e:diff=[];error=repr(e)
            row=dict(stage=stage,block=block,status='EXECUTION_ERROR' if error else 'MISMATCH' if diff else 'PASS',
                mismatch_count=len(diff),mismatches=diff[:16],error=error,elements_checked=len(reference) if not error else 0,
                source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
