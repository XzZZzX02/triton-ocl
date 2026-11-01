"""Equivalent affine/arith terminal-copy IR and bitwise independent fixtures."""
import ctypes
import itertools

F16=[0,0x8000,0x3c00,0xbc00,0x7c00,0xfc00,0x7e00,0x7d01,
     0xfe55,1,0x8001,0x3ff,0x83ff,0x400,0x8400,0x7bff,0xfbff]
F32=[0,0x80000000,0x3f800000,0xbf800000,0x7f800000,0xff800000,
     0x7fc00000,0x7f800001,0xffc01234,1,0x80000001,0x7fffff,
     0x807fffff,0x800000,0x80800000,0x7f7fffff,0xff7fffff]


class Raw:
    def __init__(self,values,dtype):
        import triton.language as tl
        self.dtype=tl.float16 if dtype=='f16' else tl.float32
        self.c_array=((ctypes.c_uint16 if dtype=='f16' else ctypes.c_float)*len(values))()
        self.words=((ctypes.c_uint16 if dtype=='f16' else ctypes.c_uint32)*len(values)).from_buffer(self.c_array)
        self.words[:]=values
    def data_ptr(self):return ctypes.addressof(self.c_array)


SHAPES={'dense':((16,32),(32,1)),'transpose':((16,32),(1,19)),
    'padded':((16,32),(43,1)),'negative':((16,32),(-43,1)),
    'reverse':((16,32),(43,-1)),'stride2':((16,32),(72,2)),
    'rank1':((512,),(2,)),'rank3':((2,8,32),(600,65,-1)),
    'small':((8,16),(16,1)),'dynamic':((16,32),(32,1)),
    'collision':((16,32),(1,1)),'modulo':((16,32),(32,1))}


def source(shape=(16,32),coefficients=(32,1),dtype='f32',form='affine',reader='affine',
           variant='plain',masked=True,grid_stride=2048,base=11,bits=64):
    rank=len(shape);local='memref<'+'x'.join(map(str,shape))+'x'+dtype+'>'
    view=f'memref<1x{dtype}, strided<[1], offset: ?>>'
    coords=','.join('%d'+str(i) for i in range(rank))
    dims=','.join('d'+str(i) for i in range(rank))
    # Source data always dense; output layout is independently selected.
    dense=[1]*rank
    for i in range(rank-2,-1,-1):dense[i]=dense[i+1]*shape[i+1]
    expr=lambda cc:' + '.join(f'd{i}*({c})' for i,c in enumerate(cc))
    extent=1
    for n in shape:extent*=n
    input_index=f'%linear = affine.apply affine_map<({dims})->({expr(dense)})>({coords})'
    put=f'''{input_index}
      %srcat = arith.addi %inputbase,%linear : index
      %in = memref.reinterpret_cast %input to offset:[%srcat], sizes:[1], strides:[1] : memref<*x{dtype}> to {view}
      %v = memref.load %in[%zero] : {view}
      affine.store %v,%local[{coords}] : {local}'''
    for i in reversed(range(rank)):
        put=f'affine.for %d{i} = 0 to {shape[i]} {{\n{put}\n}} {{sycl.parallel}}'
    prefix=[]
    if form=='affine':
        address=f'%at = affine.apply affine_map<({dims})[s0]->(s0 + {expr(coefficients)})>({coords})[%outputbase]'
    elif form=='nested':
        address=f'%relative = affine.apply affine_map<({dims})->({expr(coefficients)})>({coords})\n%at = affine.apply affine_map<(d0)[s0]->(s0+d0)>(%relative)[%outputbase]'
    elif form=='mixed':
        prefix=['%base32 = arith.index_cast %outputbase : index to i32']
        current='%base32'
        for i,c in enumerate(coefficients):
            prefix += [f'%i{i} = arith.index_cast %d{i} : index to i32',
                f'%coef{i} = arith.constant {c} : i32',f'%part{i} = arith.muli %i{i},%coef{i} : i32',
                f'%sum{i} = arith.addi {current},%part{i} : i32'];current=f'%sum{i}'
        address='\n'.join(prefix)+f'\n%relative = arith.index_cast {current} : i32 to index\n%at = affine.apply affine_map<(d0)->(d0+3-3)>(%relative)'
    else:
        current='%outputbase'
        for i,c in enumerate(coefficients):
            prefix += [f'%coef{i} = arith.constant {c} : index',f'%part{i} = arith.muli %d{i},%coef{i} : index',
                f'%sum{i} = arith.addi {current},%part{i} : index'];current=f'%sum{i}'
        address='\n'.join(prefix)+f'\n%at = arith.addi {current},%zero : index'
    if variant=='modulo':address+='\n%remat = arith.remsi %at,%seven : index';at='%remat'
    elif variant=='dynamic':address+='\n%dynat = arith.muli %at,%stride : index';at='%dynat'
    else:at='%at'
    write=f'''%out = memref.reinterpret_cast %output to offset:[{at}], sizes:[1], strides:[1] : memref<*x{dtype}> to {view}
      %v = {reader}.load %local[{coords}] : {local}
      memref.store %v,%out[%zero] : {view}'''
    if masked or variant in ('collision','modulo'):
        pred='%valid'
        validity='%rest = arith.remsi %linear,%five : index\n%valid = arith.cmpi ne,%rest,%two : index'
        if variant in ('collision','modulo'):
            validity+='\n%only = arith.cmpi eq,%linear,%zero : index';pred='%only'
        if variant=='empty':pred='%never'
        write=f'{input_index}\n{validity}\nscf.if {pred} {{\n{write}\n}}'
    write=address+'\n'+write
    for i in reversed(range(rank)):write=f'affine.for %d{i} = 0 to {shape[i]} {{\n{write}\n}}'
    return f'''module {{func.func @affine_copy(%input:memref<*x{dtype}>,%output:memref<*x{dtype}>,%stride:index) {{
      %zero = arith.constant 0 : index
      %two = arith.constant 2 : index
      %five = arith.constant 5 : index
      %seven = arith.constant 7 : index
      %never = arith.constant false
      %size = arith.constant {extent} : index
      %spacing = arith.constant {grid_stride} : index
      %base = arith.constant {base} : index
      %group = gpu.global_id x
      %inputbase = arith.muli %group,%size : index
      %offset = arith.muli %group,%spacing : index
      %outputbase = arith.addi %base,%offset : index
      %local = memref.alloc() : {local}
      {put}
      {write}
      return
    }} }}'''


def fixture(case,dtype,grid=3):
    shape,coeff=SHAPES[case];points=list(itertools.product(*(range(n) for n in shape)))
    offsets=[sum(i*c for i,c in zip(coords,coeff)) for coords in points]
    base=11-min(offsets);spacing=max(offsets)-min(offsets)+23
    size=base+(grid-1)*spacing+max(offsets)+13
    special=F16 if dtype=='f16' else F32;sentinel=0x3555 if dtype=='f16' else 0x4e13579b
    raw=[special[i%len(special)] for i in range(grid*len(points))]
    expected=[sentinel]*size
    for b in range(grid):
        for lane,off in enumerate(offsets):
            valid=lane%5!=2
            if case in ('collision','modulo'):valid=lane==0
            if valid:
                at=(base+b*spacing+off)%7 if case=='modulo' else base+b*spacing+off
                expected[at]=raw[b*len(points)+lane]
    return shape,coeff,base,spacing,raw,expected,sentinel
