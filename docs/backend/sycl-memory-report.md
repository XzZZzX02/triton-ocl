# 核心内存语义 gap 实现报告

日期：2026-10-27；DFCS 经 wlx，gfx906 作业 22606329。

## 实现

原有 MaskAnalysis/PtrAnalysis 将 tensor 地址与 mask 归约成矩形 subview，
无法表示孔洞、OR、负 offset、非线性与 data-dependent gather。
新增 ScalarMemory：逐逻辑 lane 保留原始地址算术与布尔 predicate，在 scf.if
的 then 分支内执行实际 load/store；else 支持逐元素 other。Scalar mask 同样受保护。
运行时 shape、stride、shift 仍是运行时值；逻辑 block 保持 Triton 要求的静态 shape。

循环携带的 tensor pointer 归一化为 invariant allocation base + i64 offset tensor，
支持嵌套循环中的 pointer 更新。停用旧 metadata use analysis，防止删除仍被
scalar address extraction 使用的 offset tensor。索引用 int64_t 输出。
当循环变更 base allocation 或遇到无法标量化的 pointer expression，报告明确错误。

## 正确性与健壮性

| 测试 | 原实现 | 修复后 CPU | 修复后 gfx906 |
|---|---:|---:|---:|
| 原始 11 项 memory | 2/11 | 11/11 | 11/11 |
| 扩展 14 项 memory | 新用例 | 14/14 | 14/14 |

固定覆盖：非连续 mask、OR、lower bound、负 offset、runtime stride、modulo、
data-dependent gather、tensor-valued other、嵌套循环、嵌套 pointer iter_args、
scalar false mask、3D grid、empty shape、单元素 tail。
false scalar mask 指向明显无效地址，未发生访问；masked store 保留 sentinel。
空 shape 采用 1 元素哨兵 backing buffer，验证 kernel 不写入。
全部当前测试精确比较，max_abs_error=0。原始错误日志和结果见 sycl-validation。

## 性能与限制

本阶段建立通用正确性路径，不宣称性能提高。逐 lane scalar memory 会增加
地址计算和中间 local memory；后续性能阶段以本版本作为正确性基准。
不把不能运行的 baseline 用例报告为无限加速。动态逻辑 block、切换 allocation
的 pointer loop 尚不支持，并以诊断拒绝；不是完整 Triton 内存操作全集的声明。

后续独立补充扩展到 scalar pointer carry、同 allocation 的条件 pointer 更新，
以及 mixed scalar/tensor 地址重建。CPU/gfx906 新增 24 项运行检查和 1 项负例均通过，
原有 memory 14 项亦重新通过。实现、bufferization 回归修复与原始证据见
sycl-pointer-followup-report.md。

## 复现

~~~sh
export ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4
python-triton python/test/sycl/semantics.py --all --group memory --mode run --python /public/home/dtune/zzx/triton/bin/python-triton --output memory.json
# gfx906 分配节点：ACPP_VISIBILITY_MASK=hip，unset LD_PRELOAD。
~~~
