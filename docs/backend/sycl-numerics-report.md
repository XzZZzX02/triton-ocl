# SYCL 数值基础实现报告

日期：2026-10-27；基线：7395f3b8。DFCS 路径：wlx → dfcs。
这是完整 dtype/IEEE 目标的第一阶段，不代表转换笛卡尔积、所有模型布局或
所有浮点算子的完整覆盖。后续矩阵与 pass 验证继续进行。

## 实现方式

- 对此 checkout 的 18 种标量存储类型建立可追踪 ABI：bool、8/16/32/64 位
  有符号/无符号整数、fp16/bf16/f32/f64、五种 fp8。bool 指针按字节存储。
- 常量改为带类型的十六进制浮点/整数位模式，保留小量、精度和负零。
  前端 full(-0.) 不再折叠成正零。浮点比较覆盖 MLIR 的 16 个有序/无序谓词。
- unsigned 除法、余数、右移、比较、扩展和到浮点的转换按真实无符号语义输出；
  整数加减乘/左移用无符号中间值避免 C++ 有符号溢出。
- maximum/minimum 与 maxnum/minnum 分离处理 NaN 和 signed zero。
  maxnum/minnum reduction 从首项开始，避免 all-NaN 被无穷初值吞掉。
- fp16/bf16/fp8 用固定字节 ABI 的软件存储与显式舍入；修复 AdaptiveCpp half
  RTZ 65520→inf 和 mixed-zero maximum 的差异。原生硬件加速转换尚待单独验证。
- legacy fp8e4b15 在此 checkout 的 IR 为 i8：提供通用位转换，算术/reduction
  在创建 combiner 前升为 f32，补齐 tensor bitcast。其有限饱和/舍入沿用已有
  Triton CUDA helper 的特殊契约，并在测试 oracle 中单独说明。
- rank-zero memref.copy 复制 accessor[0]，避免复制 accessor 本身造成两个
  reduction 缓冲区别名。uint32/uint64 的 sum/max 共用初始化是固定回归。
- 数学函数显式使用 sycl:: 浮点重载，避免 abs(float) 被整数重载截断。

## 正确性与健壮性

同一份 dtype-v6 测试在冻结基线与冻结修复快照上运行。每个用例独立子进程；
运行两种 local range：48 和 (8,8)。期望值由 Python struct/ctypes/位编码产生。

| 类别 | 用例 | 基线 CPU 通过 | 修复 CPU | 修复 gfx906 |
|---|---:|---:|---:|---:|
| 原样存储与 masked tail | 18 | 7 | 18 | 18 |
| 整数算术/比较/转换 | 8 | 3 | 8 | 8 |
| NaN/inf/±0/subnormal 两两矩阵 | 4 | 0 | 4 | 4 |
| 常量精度/负零 | 2 | 0 | 2 | 2 |
| fp8/fp16/bf16 转换 | 7 | 0 | 7 | 7 |
| 算术 | 17 | 7 | 17 | 17 |
| sum/max/min 多输出 | 17 | 7 | 17 | 17 |
| 总计 | 73 | 24 | 73 | 73 |

CPU 原有 semantics 58/58；host reliability 9/9。原始结果保存在
sycl-validation/next/baseline-v6-cpu.json、numerics-v6-{cpu,dcu}.json、
numerics-v6-semantic-cpu.json。gfx906 作业 22626756。
中间失败 v3/v4/v5 也保留：分别揭露 signed zero、RTZ、abs 重载和 tensor bitcast，
不将 harness 错误或中间版本通过率当作最终性能/正确性依据。

## 收益与性能边界

收益是上述固定数值契约从 24/73 提升至 73/73，并消除已覆盖的编译失败与错算。
软件低精度转换会增加指令，不能由正确性推导速度提升；本阶段没有将其宣称为性能优化。
pass 的设备 event 计时独立报告。NaN payload 不要求保留，比较要求 NaN 分类及
契约定义的零符号；maxnum/minnum mixed-zero 的未指定符号不强行规定。

## 复现

source /public/home/dtune/zzx/triton/env.sh 后，设置冻结 PYTHONPATH、独立
TRITON_CACHE_DIR、node-local TMPDIR/ACPP_APPDB_DIR，运行：

    python-triton python/test/sycl/dtype_semantics.py --jobs 4 \
      --python /public/home/dtune/zzx/triton/bin/python-triton --output result.json

CPU：ACPP_VISIBILITY_MASK=omp OMP_NUM_THREADS=4。gfx906 必须在 Slurm
分配节点内 ACPP_VISIBILITY_MASK=hip、unset LD_PRELOAD。始终启用
TRITON_ALWAYS_COMPILE=1 TRITON_SYCL_DISABLE_INPROCESS_FALLBACK=1。
