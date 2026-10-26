"""Small deterministic dot layout/precision probes; no array dependencies."""
import ctypes
import struct
import triton
import triton.language as tl


class Tensor:
    def __init__(self, values, half=False):
        self.dtype = tl.float16 if half else tl.float32
        if half:
            values = [struct.unpack('<H', struct.pack('<e', x))[0] for x in values]
        self.c_array = ((ctypes.c_uint16 if half else ctypes.c_float)*len(values))(*values)
    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=['m','n','k'])
def dot_kernel(x, y, z, m, n, k, TA:tl.constexpr, TB:tl.constexpr,
               BATCH:tl.constexpr, STRIDE:tl.constexpr):
    r=tl.arange(0,4)
    c=tl.arange(0,8)
    h=tl.arange(0,8)
    if BATCH:
        b=tl.arange(0,2)
        if TA:
            a=tl.load(x+(b[:,None,None]*32+h[None,:,None]*4+r[None,None,:])*STRIDE,
                      (h[None,:,None]<k)&(r[None,None,:]<m),0.)
            a=tl.trans(a,0,2,1)
        else:
            a=tl.load(x+(b[:,None,None]*32+r[None,:,None]*8+h[None,None,:])*STRIDE,
                      (r[None,:,None]<m)&(h[None,None,:]<k),0.)
        if TB:
            d=tl.load(y+(b[:,None,None]*64+c[None,:,None]*8+h[None,None,:])*STRIDE,
                      (c[None,:,None]<n)&(h[None,None,:]<k),0.)
            d=tl.trans(d,0,2,1)
        else:
            d=tl.load(y+(b[:,None,None]*64+h[None,:,None]*8+c[None,None,:])*STRIDE,
                      (h[None,:,None]<k)&(c[None,None,:]<n),0.)
        result=tl.dot(a,d)
        tl.store(z+b[:,None,None]*32+r[None,:,None]*8+c[None,None,:],result,
                 (r[None,:,None]<m)&(c[None,None,:]<n))
    else:
        if TA:
            a=tl.load(x+(h[:,None]*4+r[None,:])*STRIDE,(h[:,None]<k)&(r[None,:]<m),0.)
            a=tl.trans(a)
        else:
            a=tl.load(x+(r[:,None]*8+h[None,:])*STRIDE,(r[:,None]<m)&(h[None,:]<k),0.)
        if TB:
            d=tl.load(y+(c[:,None]*8+h[None,:])*STRIDE,(c[:,None]<n)&(h[None,:]<k),0.)
            d=tl.trans(d)
        else:
            d=tl.load(y+(h[:,None]*8+c[None,:])*STRIDE,(h[:,None]<k)&(c[None,:]<n),0.)
        result=tl.dot(a,d)
        tl.store(z+r[:,None]*8+c[None,:],result,(r[:,None]<m)&(c[None,:]<n))


def run(name, mode, repeats):
    _,rank,layout,precision=name.split('_')
    batch=rank=='3d';ta=layout[0]=='t';tb=layout[1]=='t'
    half=precision=='fp16';stride=2 if precision=='stride' else 1
    bs=2 if batch else 1
    m,n,k=3,5,7
    av=[float((i*3)%11-5)/4 for i in range(bs*32*stride)]
    bv=[float((i*5)%13-6)/4 for i in range(bs*64*stride)]
    x,y,z=Tensor(av,half),Tensor(bv,half),Tensor([-99.]*(bs*32))
    kw=dict(TA=ta,TB=tb,BATCH=batch,STRIDE=stride)
    compiled=dot_kernel.warmup(x,y,z,m,n,k,grid=(1,),**kw)
    if mode=='compile':return dict(source_bytes=len(compiled.asm['sycl']))
    dot_kernel[(1,)](x,y,z,m,n,k,**kw)
    expected=[-99.]*(bs*32)
    for b in range(bs):
        for r in range(m):
            for c in range(n):
                expected[b*32+r*8+c]=sum(av[(b*32+(h*4+r if ta else r*8+h))*stride]*bv[(b*64+(c*8+h if tb else h*8+c))*stride] for h in range(k))
    actual=list(z.c_array)
    error=max(abs(a-b) for a,b in zip(actual,expected))
    if error>1.e-5:raise AssertionError(f'{name}: error={error}, actual={actual}, expected={expected}')
    return dict(max_abs_error=error)


CASES=[f'dot_{rank}_{layout}_{precision}' for rank in ('2d','3d') for layout in ('nn','tn','nt','tt') for precision in ('fp32','fp16','stride')]
