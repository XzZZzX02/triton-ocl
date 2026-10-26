"""Generic SYCL memory semantics, run via semantics.py isolation wrapper."""
import ctypes
import math
import triton
import triton.language as tl


class HostTensor:
    def __init__(self, values, integer=False):
        self.dtype = tl.int32 if integer else tl.float32
        self.c_array = ((ctypes.c_int32 if integer else ctypes.c_float)*len(values))(*values)
    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=['n','stride','shift','loops'])
def memory_kernel(x, indices, y, n, stride, shift, loops,
                  BLOCK: tl.constexpr, KIND: tl.constexpr):
    lane = tl.program_id(0)*BLOCK + tl.arange(0, BLOCK)
    if KIND == 'grid':
        lane = (tl.program_id(2)*2 + tl.program_id(1))*3*BLOCK + lane
    valid = lane < n
    if KIND == 'holes':
        valid = valid & ((lane % 3) != 1)
    elif KIND == 'or':
        valid = valid & ((lane < 5) | (lane >= 17))
    elif KIND == 'lower':
        valid = valid & (lane >= shift)
    elif KIND == 'negative':
        lane = lane - shift
        valid = (lane >= 0) & (lane < n)
    if KIND == 'stride':
        address = lane*stride+shift
    elif KIND == 'modulo':
        address = ((lane+shift)*3) % n
    elif KIND == 'gather':
        address = tl.load(indices+lane, valid, 0)
    else:
        address = lane
    value = tl.load(x+address, valid, -7.)
    if KIND == 'other':
        value = tl.load(x+address, valid & (lane%2 == 0), lane.to(tl.float32)+100.)
    if KIND == 'loops':
        for i in range(loops):
            for j in range(2):
                value += tl.load(x+((address+i+j)%n), valid, 0.)
    if KIND == 'ptrloop':
        pointer = x + address
        for i in range(loops):
            for j in range(2):
                value += tl.load(pointer, valid, 0.)
                pointer += stride
    if KIND == 'masked_scalar':
        flag = tl.program_id(0) < loops
        position = tl.where(flag, tl.program_id(0), 268435456)
        scalar = tl.load(x+position, flag, -9.)
        tl.store(y+position, scalar, flag)
    elif KIND == 'negative':
        tl.store(y+lane, value, valid)
    elif KIND == 'holes' or KIND == 'or' or KIND == 'lower':
        tl.store(y+lane, value+1., valid)
    else:
        tl.store(y+lane, value, lane < n)


def run(name, mode, repeats):
    kind = name.removeprefix('memory_')
    n, block, stride, shift, loops = 37, 16, 3, 5, 3
    if kind == "masked_scalar": loops = 1
    if kind == "empty": n = 0
    if kind == "tail": n = 1
    if kind == 'grid':
        n = 2*2*3*block-7
    size = n*stride+shift+4
    vals = [float(i%23-11) for i in range(size)]
    gather = [(i*7+3)%n for i in range(n)]
    x, ind, out = HostTensor(vals), HostTensor(gather or [0],True), HostTensor([-99.]*max(n,1))
    grid = (3,2,2) if kind=='grid' else (max(1,triton.cdiv(n,block)),)
    kwargs = dict(BLOCK=block,KIND=kind)
    args = [x,ind,out,n,stride,shift,loops]
    compiled=memory_kernel.warmup(*args,grid=grid,**kwargs)
    if mode=='compile':
        return {'source_bytes':len(compiled.asm['sycl'])}
    memory_kernel[grid](*args,**kwargs)
    expected=[-99.]*max(n,1)
    for i in range(n):
        if kind=='masked_scalar':
            if i<loops:expected[i]=vals[i]
            continue
        if kind=='negative':
            if i<grid[0]*block-shift:expected[i]=vals[i]
            continue
        if kind=='holes' and i%3==1:continue
        if kind=='or' and not(i<5 or i>=17):continue
        if kind=='lower' and i<shift:continue
        address=i*stride+shift if kind=='stride' else (((i+shift)*3)%n if kind=='modulo' else (gather[i] if kind=='gather' else i))
        value=vals[address]
        if kind=='other' and i%2:value=i+100.
        if kind=='loops':value+=sum(vals[(address+a+b)%n] for a in range(loops) for b in range(2))
        if kind=='ptrloop':value+=sum(vals[address+a*stride] for a in range(loops*2))
        if kind in ('holes','or','lower'):value+=1.
        expected[i]=value
    if list(out.c_array)!=expected:
        bad=[(i,a,b) for i,(a,b) in enumerate(zip(out.c_array,expected)) if a!=b]
        raise AssertionError(f'{kind}: mismatch {bad[:12]}')
    return {'max_abs_error':0}


CASES=['memory_'+kind for kind in ('holes','or','lower','negative','stride','modulo','gather','other','loops','ptrloop','masked_scalar','grid','empty','tail')]
