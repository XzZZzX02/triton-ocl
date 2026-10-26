# Dot gap 实现报告

2026-10-27；DFCS 经 wlx，gfx906 全量作业 22606373。

## 实现

新增 tt.trans -> linalg.generic 的 permutation map lowering，支持 2D transpose
和 3D batch 内 transpose。输入加载使用 memory gap 的精确 runtime stride/mask，
保留 f32 accumulator；fp16 input 经 arith.extf 转为 f32 后乘加。
补齐 emitter 的 ExtFOp dispatch 与半精度常量输出；仅在 ctypes.uint16 backing
明确声明 float16 时将其识别为 half bits，普通 uint16 继续是整数，不扩展全 dtype 系统。

## 测试和收益

24 项固定测试 = 2D/3D × NN/TN/NT/TT × f32/fp16/stride2。
所有用例带 runtime M=3,N=5,K=7 的边界 mask（逻辑 block 4×8×8），
检查输出值与未写入区域哨兵。reference 由 Python 标量乘加计算；
输入为四分之一整数，fp16 可精确表示，max_abs_error 全部为 0。

| 对照 | 原版 | 修复后 |
|---|---:|---:|
| 24 项编译 | 2/24 | 24/24 |
| CPU 完整运行 | 原版多数编译不支持 | 24/24 |
| gfx906 完整运行 | 原版多数编译不支持 | 24/24 |

baseline 含转置 lowering 失败、half emitter abort、rank3 copy abort；
新实现全部正常结束。原始 JSON 见 sycl-validation/dot-*.json。
没有把 baseline 的编译失败用例用于性能加速比；此阶段不宣称 dot 计算加速。

## 复现与范围

~~~sh
python-triton python/test/sycl/semantics.py --all --group dot --mode run --python /public/home/dtune/zzx/triton/bin/python-triton --output dot.json
~~~

覆盖普通 dense dot 的明确组合，不代表 tensor core、bf16/fp8、稀疏 dot、
任意 dtype 混合或全部模型布局已经支持。当前使用 f32 累加的 scalar MAC，
专门性能优化在后续 gap 评估。
