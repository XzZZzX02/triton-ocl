# 运行可靠性 gap 实现报告

2026-10-27。

## 实现

删除 Python compiler.py 的重复方法定义，translator 采用 TemporaryDirectory，
成功失败均清理，保留 kernel name、exit code 和 stderr，并配置超时。
standalone SYCL 编译和运行均有超时与子进程诊断；q.wait_and_throw 传播异步错误，
C++ main 捕获异常并返回非零退出码。默认不再在失败后自动 ctypes 重试，
仅显式 TRITON_SYCL_ENABLE_INPROCESS_FALLBACK=1 才启用旧路径。

内存主路径完全避免旧 MaskAnalysis/PtrAnalysis 的矩形近似与断言路径：
scalar addptr 直接生成 reinterpret_cast，load/store 只接受标量，pointer loop
先转为 offset，未归一化形式报告失败。对未知 Triton op、未知 emitter op、
不支持的 source type、copy view、控制流返回等给出 MLIR 错误；不再 abort。
保留只针对内部 SSA 命名不变量的 assert；不宣称第三方 LLVM 的 bug 无法崩溃。

并发验证暴露 executable cache 发布竞争，改为独立临时编译目录 + 原子 replace，
cache key 包含 compiler path 与 target。零字节 backing buffer 分配一个安全占位元素。

## 验证和收益

- 本地 host failure contracts 9/9：grid/block、dtype、timeout、child signal、
  compiler error、默认无 fallback、显式 fallback、empty backing buffer。
- 不支持 math.ctpop 的 translator 负例：正常 exit=1，包含源位置与 operation，
  不再 SIGABRT。
- 冻结版全量语义 CPU 58/58、gfx906 58/58；并发缓存修复后 CPU 全量重跑通过。
- 此阶段增加失败可诊断性和进程隔离，不宣称 kernel 运行性能提升。

执行 python3 python/test/sycl/reliability.py；完整结果见
sycl-validation/functional-cpu2.json 与 functional-dcu.json。
