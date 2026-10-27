# 内存语义补充：标量与 tensor pointer 循环

2026-10-27；wlx → dfcs；最终 gfx906 作业 22609682，COMPLETED，exit 0，
节点 g09r1n10。性能提交后的独立内存补充，不改变性能测试中的计算路径。

## 实现

将循环携带的 scalar pointer 与 tensor pointer 统一表示为 invariant scalar
allocation base + i64 offset。标量 addptr 递归合并 offset；同一 allocation 的
arith.select 转为 offset select。tensor splat 递归归一化标量地址，保留已有的
scalar offset，避免混合 scalar/tensor carry 时把同一 allocation 误判为不同 base。
循环体入口和循环结果分别重建 pointer，支持零次迭代与嵌套循环。

当新 tensor 地址完全由 scalar 重建时，显式 materialize offset 到循环携带的
目标，满足 one-shot bufferization 的 destination equivalence。若表达式已依赖
原 offset tensor，则沿用 elementwise lowering 的 destination，避免额外写回
引起嵌套循环的 read-after-write 冲突。

## 验证

| 测试 | CPU | gfx906 |
|---|---:|---:|
| 新增指针运行用例 | 24/24 | 24/24 |
| allocation 切换负例 | 1/1 | 1/1 |
| 原有 memory 回归 | 14/14 | 14/14 |

24 项运行用例包括嵌套 scalar pointer、同 allocation 条件更新，以及从 scalar
重新构造 tensor pointer；复用同一份 compiled kernel，改变 runtime loops=0/3、
stride=3/-2，使用 grid=3 与 local=48/(8,8)。既检查循环内 load，也检查循环
结果 pointer 的 load；全部输出与 Python 标量 reference 精确相等。

allocation 切换正常返回编译失败，没有 abort。最终仓库测试通过 native stderr
文件描述符捕获诊断，要求出现具体文本：
SYCL loop-carried pointer changes its base allocation。
该检查另以 --compile-only 运行通过，证据见 scalar-checked-compile.log。

原有 58 项完整语义矩阵在性能提交已通过 CPU/gfx906；本补充针对受影响的
memory 14 项重新执行，reduction/dot 没有追加未执行的全量重跑声明。

## 回归证据与边界

scalar-final-compile-before-dps.log 记录未添加 destination 时 mixed pointer
的 bufferization 失败；scalar-nested-compile.log 与 scalar-final-memory-cpu.json
记录无条件 materialize 造成的旧 nested pointer 回归。最终依赖检查修复后，
新旧用例共同通过，最终结果见 scalar-dps-*.log/json 与对应作业脚本。
这些中间失败是开发过程中的回归证据，不计作最终通过。

本补充不宣称新性能收益。变更 allocation 的 loop carry 继续明确拒绝；
逻辑 block 保持静态 shape，runtime bounds/strides 为动态值。

~~~sh
python-triton python/test/sycl/scalar_pointer_semantics.py
python-triton python/test/sycl/scalar_pointer_semantics.py --compile-only
python-triton python/test/sycl/semantics.py --all --group memory --mode run \
  --python /public/home/dtune/zzx/triton/bin/python-triton --output memory.json
~~~
