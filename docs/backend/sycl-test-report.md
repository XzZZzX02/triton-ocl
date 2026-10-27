# 测试体系 gap 实现报告

2026-10-27。新增仓库内固定、无需 torch/numpy 的语义和错误合同测试。

- 58 项实际执行测试：reduction 20、memory 14、dot 24；CPU/gfx906 均 58/58。
- 9 项 host 负例：grid/block、dtype、编译错误、超时、child signal、fallback
  策略、零长 backing；另有 translator 不支持 op 的正常退出负例。
- runner 子进程隔离，每项超时，记录 signal/returncode/stderr 和 JSON；
  支持分组、编译/执行/benchmark 模式、可选并发，默认顺序保证可复现。
- 固定边界 mask、孔洞、不同 reduction axis、1D/3D grid、empty/tail、
  loop pointer、transpose/batch/stride/half、argmax tie 等回归。

实现前仅少量 f32 vector/sum/dot 示例，没有上述固定矩阵和隔离诊断；
现在每个 gap 均保留 baseline/after 原始 JSON。测试性能收益是可定位与可复现，
不将测试速度报告成 kernel 加速。现有测试通过不代表全 dtype 和所有模型覆盖。
复现命令、DFCS 环境及后续随机数/NaN 数值覆盖限制见 python/test/sycl/README.md。

后续增加 optimization_semantics.py 15 项、optimized_reductions.py 18 项，
CPU/gfx906 均通过；包含 random floating sum、typed scratch、非二次幂和多维
local ranges、storage lifetime 与显式实验向量路径检查。
scalar_pointer_semantics.py 增加 24 项实际输出检查和 1 项具体诊断负例，
两种 backend 均通过；内存实现补充后原有 14 项 memory 回归再次通过。
这些补充的细节分别见 sycl-performance-report.md 与 sycl-pointer-followup-report.md。
