"""Held-out one-dimensional wide-store stride profitability using the same IR."""
import argparse
import sys
from affine_store_cases import SHAPES
from affine_store_semantics import main


if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--length',type=int,required=True);p.add_argument('--stride',type=int,required=True)
    a,rest=p.parse_known_args()
    assert a.length in (256,512,1024) and a.stride in (-4,-2,-1,1,2,3,4)
    SHAPES['dense']=((a.length,),(a.stride,))
    sys.argv=[sys.argv[0],'--case','dense','--dtype','f32',*rest]
    main()
