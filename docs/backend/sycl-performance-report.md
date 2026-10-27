# 性能 gap 实现报告

2026-10-27；连接 wlx → dfcs；最终 gfx906 作业 22609223，节点 g09r1n10。
实际设备架构 gfx906:sramecc-:xnack-。测试使用冻结的 functional-python 与
gated-python 快照，避免编译器重建污染正在运行的比较。

## 实现与取舍

- 将可证明完整的 parallel affine nest 展平到 local_linear_id，连续维最快；
  同时支持 1D、2D、3D 物理 workgroup。包含未处理的嵌套 parallel loop 时拒绝
  部分展平，避免多维线程只覆盖对角元素。
- 识别独立标量二元 reduction，使用每个循环独立、按元素类型分配的 local scratch
  和 workgroup tree。支持非二次幂 local size；coupled tuple combiner 保留语义路径。
  顶层标量 store 由一个 work-item 写入并同步，消除重复写。
- 对相同类型、生命周期不重叠且使用范围位于带同步的顶层 affine phase 的 local
  allocation 复用存储；view、escape、重叠生命周期均保留独立空间。固定安全用例
  的 local buffer 从 2048 降到 1024 bytes；重叠用例保持 2048 bytes。
- 增加四元素 sycl::vec global/local copy 路径，仅匹配无 mask、单位 stride、
  rank1 f32/i32。gfx906 实测出现 copy 回退，因此默认关闭，显式
  vectorize_memory=True 才启用。该选项进入编译 cache key。没有宣称 native ISA
  已向量化，也没有把此实验路径计入默认收益。
- profiling 在同一 executable、queue 中进行 warmup 和多次事件采样；
  runtime 按 executable 隔离 AdaptiveCpp appdb，并对同一 image 的运行/JIT 发布加锁。

## 正确性与健壮性

最终默认配置在 CPU 与 gfx906 均通过：

| 测试 | CPU | gfx906 |
|---|---:|---:|
| 固定语义矩阵 | 58/58 | 58/58 |
| optimization safety，显式覆盖实验向量路径 | 15/15 | 15/15 |
| 长 reduction：sum/max/min/and/or/xor × local 48/64/128 | 18/18 | 18/18 |

安全矩阵覆盖孔洞 mask、重叠生命周期、顺序存储复用、mixed f32/i32 scratch，
local 48、(8,8)、(4,4,4)。random float sum 与 math.fsum 对照，最大绝对误差
2.7894857339560986e-06，小于 1e-4。整数结果精确相等。
主机失败契约 9/9，git diff --check 与 Python 语法检查通过。

owner-cpu.log 保留一次共享文件系统运行的 SIGBUS(-7)；已有 appdb 隔离锁仍未
避免该失败。改用节点本地 TMPDIR/appdb 后，owner 与最终 gated 配置均完整通过。
这不是已证明的根因修复；不自动重试、不 fallback 掩盖信号失败。

## gfx906 同卡性能对照

N=262144，逻辑 block=1024，grid=256。每个 executable 中 10 次 warmup、
31 次 device event，表中为中位数 μs。先逐元素验证输出，两版全部 max_abs_error=0。
before 是功能完成后的版本，after 是最终默认配置。编译、进程启动、host/device
数据拷贝不计入所报告的 kernel event 区间。

| kernel | local size | before μs | after μs | before/after |
|---|---:|---:|---:|---:|
| vector | 64 | 190.563 | 192.803 | 0.988x |
| vector | 128 | 188.643 | 190.884 | 0.988x |
| vector | 256 | 186.083 | 187.203 | 0.994x |
| matrix | 64 | 191.842 | 195.105 | 0.983x |
| matrix | 128 | 188.643 | 188.803 | 0.999x |
| matrix | 256 | 189.603 | 188.643 | 1.005x |
| sum | 64 | 158.402 | 104.482 | 1.516x |
| sum | 128 | 159.043 | 103.362 | 1.539x |
| sum | 256 | 160.002 | 100.801 | 1.587x |
| copy | 64 | 194.084 | 191.044 | 1.016x |
| copy | 128 | 185.284 | 188.323 | 0.984x |
| copy | 256 | 190.884 | 190.307 | 1.003x |
| reuse | 64 | 319.686 | 320.964 | 0.996x |
| reuse | 128 | 331.686 | 330.084 | 1.005x |
| reuse | 256 | 322.406 | 326.086 | 0.989x |

sum 提高 1.52–1.59 倍；其余变化约在 2% 内，不据此宣称加速。local storage
降低是容量收益，在当前 reuse 工作负载上未形成可确认的执行时间收益。
实验向量开启的独立作业 22608972 中，copy 分别为 193.924→199.584、
188.484→198.244、185.924→196.005 μs，慢约 3–5%；因此没有默认启用。
原始采样分别保存在 performance-default-*.json 与 performance-final-*.json，
原始日志为 gated-dcu-22609223.log、owner-dcu-22608972.log。

## 复现与限制

测试源码位于 python/test/sycl：performance.py、optimization_semantics.py、
optimized_reductions.py。最终作业脚本、环境和完整日志保存在 sycl-validation，
CPU 为 gated-cpu.sh，GPU 为 gated-dcu.sbatch。在申请到的 gfx906 节点执行：

~~~sh
export ACPP_VISIBILITY_MASK=hip TRITON_ALWAYS_COMPILE=1
unset LD_PRELOAD
export TMPDIR=/tmp/triton-sycl-bench ACPP_APPDB_DIR=/tmp/triton-sycl-bench-appdb
mkdir -p "$TMPDIR"
python-triton python/test/sycl/optimization_semantics.py
python-triton python/test/sycl/optimized_reductions.py
python-triton python/test/sycl/performance.py --output performance.json
~~~

这是一轮 gfx906 测量，没有跨卡、跨时段统计置信区间，也没有模型端到端加速结论。
dot 专门 tiling、MFMA、subgroup shuffle 和缓存策略调优尚未实现；本阶段提供
可移植的 workgroup reduction、连续访问分配和保守 local memory 复用。
