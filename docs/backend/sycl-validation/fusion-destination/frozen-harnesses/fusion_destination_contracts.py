"""Fusion must preserve loop-carried DPS destinations and actual fusion."""
import argparse
import json
import pathlib
import tempfile


def source(chain, nested=False, read_output=False):
    def generic(result, inputs, output, operation):
        names=inputs.split(',')
        maps=', '.join(['affine_map<(d0) -> (d0)>']*(len(names)+1))
        types=', '.join(['tensor<256xf32>']*len(names))
        args=', '.join(f'%a{i}: f32' for i in range(len(names)))
        value='%old' if read_output else '%a0'
        return f'''%{result} = linalg.generic {{indexing_maps = [{maps}], iterator_types = ["parallel"]}}
          ins({inputs} : {types}) outs({output} : tensor<256xf32>) {{
          ^bb0({args}, %old: f32):
            %v = arith.{operation} {value}, %a1 : f32
            linalg.yield %v : f32
          }} -> tensor<256xf32>'''
    update=generic('p','%carry,%input','%carry','addf')
    if chain: update+='\n'+generic('q','%p,%input','%carry','mulf')
    result='%q' if chain else '%p'
    if nested:
        body=f'''%inner = scf.for %j = %zero to %count step %one iter_args(%carry = %outer) -> (tensor<256xf32>) {{
          {update}
          scf.yield {result} : tensor<256xf32>
        }}
        scf.yield %inner : tensor<256xf32>'''
        outer='%outer'
    else:
        body=update+f'\nscf.yield {result} : tensor<256xf32>'
        outer='%carry'
    return f'''module {{
      func.func @recurrence(%storage: memref<256xf32>, %input_storage: memref<256xf32>, %count: index) {{
        %zero = arith.constant 0 : index
        %one = arith.constant 1 : index
        %initial = bufferization.to_tensor %storage restrict writable : memref<256xf32> to tensor<256xf32>
        %input = bufferization.to_tensor %input_storage restrict writable : memref<256xf32> to tensor<256xf32>
        %result = scf.for %i = %zero to %count step %one iter_args({outer} = %initial) -> (tensor<256xf32>) {{
          {body}
        }}
        %keep = tensor.extract %result[%zero] : tensor<256xf32>
        memref.store %keep,%storage[%zero] : memref<256xf32>
        return
      }}
    }}'''


def main():
    from triton._C.libtriton import ir, sycl
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True)
    args=p.parse_args()
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]
    for chain in (False,True):
        for nested in (False,True):
            for read_output in (False,True):
                for repeats in (1,2):
                    text=source(chain,nested,read_output)
                    with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                        f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
                    pm=ir.pass_manager(ctx)
                    for _ in range(repeats):sycl.passes.lair.elementwise_fusion(pm)
                    pm.run(mod);out=str(mod)
                    assert 'tensor.empty' not in out,out
                    assert out.count('linalg.generic')==1,out
                    assert 'outs(%' in out,out
                    pm=ir.pass_manager(ctx);sycl.passes.memir.one_shot_bufferize(pm);pm.run(mod)
                    assert 'tensor<' not in str(mod),str(mod)
                    rows.append(dict(chain=chain,nested=nested,read_output=read_output,repeats=repeats,status='PASS'))
    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
