# Reduction gap 实现报告

日期：2026-10-27。远端验证路径：`wlx -> dfcs`，AdaptiveCpp SSCP；
DCU 作业 `22606228`，gfx906。测试期间使用冻结的 reduction-python 编译器与 translator，
避免后续 memory 改动污染结果。原始结果见 `sycl-validation/reduction-*.json`。

## 实现

- 不再将所有 reduction 初始化为 0：独立二元 combiner 使用 MLIR arith neutral element；
  sum/or/xor 为 0，and 为全 1，浮点 max/min 使用对应语义的 identity。
- 对任意耦合 tuple combiner，直接用首个输入 tuple 初始化，再执行后续合并，
  不猜测用户 combiner 的 identity；支持多个输入和多个输出以及 argmax 的 index/tie。
- 修正非末尾 axis 的 affine map，将输出维放在前面，reduction 维放在最后；
  支持 rank1 scalar、rank2 两个 axis、rank3 三个 axis。
- 显式标记 reduction loop，补充索引数据的 range/expand lowering，
  支持 rank3 copy，并去除嵌套 work-item 分配循环内部的非一致 barrier。
- 修复 NaN 常量被错误输出成 -INFINITY 的问题，避免 min 初始化产生错误值；
  lowering 失败会传递 pass failure。

## 正确性与健壮性对照

| 测试集 | 实现前 | 实现后 |
|---|---:|---:|
| rank2 编译，8 类 × axis0/1 | 4/16 | 16/16 |
| rank2 CPU 逐元素对照 | 3/16 | 16/16 |
| 全部 reduction CPU | 未覆盖新增 rank 测试 | 20/20 |
| 全部 reduction gfx906 | 原版不支持大部分语义 | 20/20 |

max 使用全负数、min 使用全正数，and 使用非零高位 bit pattern，
因此可揭露错误的 0 初始化。tuple 检查 sum/max 两个独立输出；argmax 检查值、索引和左侧 tie。
整数逐 bit 比较，当前浮点测试使用可精确表示的整数值，误差全部为 0。
原版 axis0 失败、tuple 不支持、max/min translator abort 和 AND 返回全 0 的问题
均有固定用例复现，修复版全部正常返回。

## 性能

本 gap 主要修正语义，尚未执行并行 tree reduction 优化。gfx906 同一
sum_axis1 小用例，baseline device-event 中位数为 2,757,160 ns（11 次）。
修复版为 2,670,131 ns（11 次，约低 3.2%，不作为性能优化结论）。
对应原始数据见 reduction-final-dcu.json；这些小 kernel 的 event 区间
受 AdaptiveCpp JIT/runtime 开销显著影响，不能据此宣称计算性能提升。
性能 gap 将使用同一设备、冻结版本、同进程 warmup/repeat 重新测量。

## 复现

```sh
source /public/home/dtune/zzx/triton/env.sh
export TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1
export ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4
python-triton python/test/sycl/semantics.py --all --group reduction --mode run   --python /public/home/dtune/zzx/triton/bin/python-triton --output results.json
# 在申请到的 gfx906 DCU 节点改用 ACPP_VISIBILITY_MASK=hip，并 unset LD_PRELOAD。
```

静态逻辑 block 必须非空；runtime 长度由 memory mask 表达。
没有在此报告中宣称全 dtype、NaN payload、signed zero 或所有自定义 combiner 的全覆盖。
