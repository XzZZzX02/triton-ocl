;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-r5jl4fof/kernel.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

%struct.triton_sycl_float16_storage = type { i16 }

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #0

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

declare hidden i64 @__ockl_get_local_id(i32 noundef) local_unnamed_addr #2

declare hidden i64 @__ockl_get_group_id(i32 noundef) local_unnamed_addr #2

declare hidden i64 @__ockl_get_num_groups(i32 noundef) local_unnamed_addr #2

declare hidden float @__ocml_ldexp_f32(float noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.groupstaticsize() #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p3.i32(ptr addrspace(3) nocapture writeonly, i8, i32, i1 immarg) #4

; Function Attrs: nounwind
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #5 {
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !14
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 64
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 33554431
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = shl nuw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %40 = icmp ult i64 %39, 64
  call void @llvm.assume(i1 %40)
  %41 = icmp eq i64 %39, 0
  br i1 %41, label %47, label %.loopexit488.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %42 = phi i64 [ %32, %6 ], [ %45, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %43 = trunc i64 %42 to i32
  %44 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %43
  store float 0.000000e+00, ptr addrspace(3) %44, align 4, !tbaa !23
  %45 = add nuw nsw i64 %42, 64
  %46 = icmp ult i64 %42, 64
  br i1 %46, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !27

47:                                               ; preds = %._crit_edge.i
  %48 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %51 = icmp eq i64 %50, 0
  call void @llvm.assume(i1 %51)
  %52 = sext i32 %3 to i64
  %53 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %54 = inttoptr i32 %53 to ptr addrspace(3)
  %55 = getelementptr inbounds i8, ptr addrspace(3) %54, i32 512
  %56 = sext i32 %38 to i64
  %57 = icmp sgt i32 %5, 0
  %58 = icmp ugt i32 %5, 1
  %59 = icmp ugt i32 %5, 2
  %60 = icmp ugt i32 %5, 3
  %61 = icmp ugt i32 %5, 4
  %62 = icmp ugt i32 %5, 5
  %63 = icmp ugt i32 %5, 6
  %64 = icmp ugt i32 %5, 7
  %65 = icmp ugt i32 %5, 8
  %66 = icmp ugt i32 %5, 9
  %67 = icmp ugt i32 %5, 10
  %68 = icmp ugt i32 %5, 11
  %69 = icmp ugt i32 %5, 12
  %70 = icmp ugt i32 %5, 13
  %71 = icmp ugt i32 %5, 14
  %72 = icmp ugt i32 %5, 15
  br label %.preheader487.i

.preheader487.i:                                  ; preds = %.split.us.i, %47
  %73 = phi i64 [ 0, %47 ], [ %83, %.split.us.i ]
  %74 = icmp slt i64 %73, %52
  %75 = shl i64 %73, 4
  %.tr481.i = trunc i64 %73 to i32
  %76 = shl i32 %.tr481.i, 4
  %77 = sext i32 %76 to i64
  %78 = add nsw i64 %77, %56
  %.fr.i = freeze i1 %74
  br i1 %.fr.i, label %.preheader487.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.i: ; preds = %.preheader487.i
  %.tr514.i = trunc i64 %73 to i32
  %79 = shl i32 %.tr514.i, 5
  %80 = add i32 %79, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %54, i32 %80
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep.i, i8 0, i32 32, i1 false)
  br label %.split.us.i

.preheader487.split.preheader.i:                  ; preds = %.preheader487.i
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i: ; preds = %.preheader487.split.preheader.i
  %81 = trunc i64 %75 to i32
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %81
  store i16 0, ptr addrspace(3) %82, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.i
  %83 = add nuw nsw i64 %73, 1
  %exitcond.not.i = icmp eq i64 %83, 8
  br i1 %exitcond.not.i, label %.loopexit488.i, label %.preheader487.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i: ; preds = %.preheader487.split.preheader.i
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %78
  %.sroa.0228.0.copyload.i = load i16, ptr %84, align 32, !tbaa.struct !29
  %85 = trunc i64 %75 to i32
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %85
  store i16 %.sroa.0228.0.copyload.i, ptr addrspace(3) %86, align 2, !tbaa.struct !29
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i
  %87 = trunc i64 %75 to i32
  %88 = or disjoint i32 %87, 1
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i
  %90 = or disjoint i64 %78, 1
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0228.0.copyload.1.i = load i16, ptr %91, align 2, !tbaa.struct !29
  %92 = trunc i64 %75 to i32
  %93 = or disjoint i32 %92, 1
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %93
  store i16 %.sroa.0228.0.copyload.1.i, ptr addrspace(3) %94, align 2, !tbaa.struct !29
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.thread.i
  %95 = trunc i64 %75 to i32
  %96 = or disjoint i32 %95, 2
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i
  %98 = or disjoint i64 %78, 2
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0228.0.copyload.2.i = load i16, ptr %99, align 4, !tbaa.struct !29
  %100 = trunc i64 %75 to i32
  %101 = or disjoint i32 %100, 2
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %101
  store i16 %.sroa.0228.0.copyload.2.i, ptr addrspace(3) %102, align 2, !tbaa.struct !29
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.thread.i
  %103 = trunc i64 %75 to i32
  %104 = or disjoint i32 %103, 3
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i
  %106 = or disjoint i64 %78, 3
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0228.0.copyload.3.i = load i16, ptr %107, align 2, !tbaa.struct !29
  %108 = trunc i64 %75 to i32
  %109 = or disjoint i32 %108, 3
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %109
  store i16 %.sroa.0228.0.copyload.3.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.thread.i
  %111 = trunc i64 %75 to i32
  %112 = or disjoint i32 %111, 4
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i
  %114 = or disjoint i64 %78, 4
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0228.0.copyload.4.i = load i16, ptr %115, align 8, !tbaa.struct !29
  %116 = trunc i64 %75 to i32
  %117 = or disjoint i32 %116, 4
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %117
  store i16 %.sroa.0228.0.copyload.4.i, ptr addrspace(3) %118, align 2, !tbaa.struct !29
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.thread.i
  %119 = trunc i64 %75 to i32
  %120 = or disjoint i32 %119, 5
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i
  %122 = or disjoint i64 %78, 5
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0228.0.copyload.5.i = load i16, ptr %123, align 2, !tbaa.struct !29
  %124 = trunc i64 %75 to i32
  %125 = or disjoint i32 %124, 5
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %125
  store i16 %.sroa.0228.0.copyload.5.i, ptr addrspace(3) %126, align 2, !tbaa.struct !29
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.thread.i
  %127 = trunc i64 %75 to i32
  %128 = or disjoint i32 %127, 6
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %128
  store i16 0, ptr addrspace(3) %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i
  %130 = or disjoint i64 %78, 6
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %130
  %.sroa.0228.0.copyload.6.i = load i16, ptr %131, align 4, !tbaa.struct !29
  %132 = trunc i64 %75 to i32
  %133 = or disjoint i32 %132, 6
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %133
  store i16 %.sroa.0228.0.copyload.6.i, ptr addrspace(3) %134, align 2, !tbaa.struct !29
  br i1 %64, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.thread.i
  %135 = trunc i64 %75 to i32
  %136 = or disjoint i32 %135, 7
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %136
  store i16 0, ptr addrspace(3) %137, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i
  %138 = or disjoint i64 %78, 7
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %138
  %.sroa.0228.0.copyload.7.i = load i16, ptr %139, align 2, !tbaa.struct !29
  %140 = trunc i64 %75 to i32
  %141 = or disjoint i32 %140, 7
  %142 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %141
  store i16 %.sroa.0228.0.copyload.7.i, ptr addrspace(3) %142, align 2, !tbaa.struct !29
  br i1 %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.thread.i
  %143 = trunc i64 %75 to i32
  %144 = or disjoint i32 %143, 8
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %144
  store i16 0, ptr addrspace(3) %145, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i
  %146 = or disjoint i64 %78, 8
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %146
  %.sroa.0228.0.copyload.8.i = load i16, ptr %147, align 16, !tbaa.struct !29
  %148 = trunc i64 %75 to i32
  %149 = or disjoint i32 %148, 8
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %149
  store i16 %.sroa.0228.0.copyload.8.i, ptr addrspace(3) %150, align 2, !tbaa.struct !29
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i
  %151 = trunc i64 %75 to i32
  %152 = or disjoint i32 %151, 9
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %152
  store i16 0, ptr addrspace(3) %153, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i
  %154 = or disjoint i64 %78, 9
  %155 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %154
  %.sroa.0228.0.copyload.9.i = load i16, ptr %155, align 2, !tbaa.struct !29
  %156 = trunc i64 %75 to i32
  %157 = or disjoint i32 %156, 9
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %157
  store i16 %.sroa.0228.0.copyload.9.i, ptr addrspace(3) %158, align 2, !tbaa.struct !29
  br i1 %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i
  %159 = trunc i64 %75 to i32
  %160 = or disjoint i32 %159, 10
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %160
  store i16 0, ptr addrspace(3) %161, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i
  %162 = or disjoint i64 %78, 10
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %162
  %.sroa.0228.0.copyload.10.i = load i16, ptr %163, align 4, !tbaa.struct !29
  %164 = trunc i64 %75 to i32
  %165 = or disjoint i32 %164, 10
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %165
  store i16 %.sroa.0228.0.copyload.10.i, ptr addrspace(3) %166, align 2, !tbaa.struct !29
  br i1 %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i
  %167 = trunc i64 %75 to i32
  %168 = or disjoint i32 %167, 11
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %168
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i
  %170 = or disjoint i64 %78, 11
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0228.0.copyload.11.i = load i16, ptr %171, align 2, !tbaa.struct !29
  %172 = trunc i64 %75 to i32
  %173 = or disjoint i32 %172, 11
  %174 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %173
  store i16 %.sroa.0228.0.copyload.11.i, ptr addrspace(3) %174, align 2, !tbaa.struct !29
  br i1 %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i
  %175 = trunc i64 %75 to i32
  %176 = or disjoint i32 %175, 12
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %176
  store i16 0, ptr addrspace(3) %177, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i
  %178 = or disjoint i64 %78, 12
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %178
  %.sroa.0228.0.copyload.12.i = load i16, ptr %179, align 8, !tbaa.struct !29
  %180 = trunc i64 %75 to i32
  %181 = or disjoint i32 %180, 12
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %181
  store i16 %.sroa.0228.0.copyload.12.i, ptr addrspace(3) %182, align 2, !tbaa.struct !29
  br i1 %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i
  %183 = trunc i64 %75 to i32
  %184 = or disjoint i32 %183, 13
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %184
  store i16 0, ptr addrspace(3) %185, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i
  %186 = or disjoint i64 %78, 13
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %186
  %.sroa.0228.0.copyload.13.i = load i16, ptr %187, align 2, !tbaa.struct !29
  %188 = trunc i64 %75 to i32
  %189 = or disjoint i32 %188, 13
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %189
  store i16 %.sroa.0228.0.copyload.13.i, ptr addrspace(3) %190, align 2, !tbaa.struct !29
  br i1 %71, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i
  %191 = trunc i64 %75 to i32
  %192 = or disjoint i32 %191, 14
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %192
  store i16 0, ptr addrspace(3) %193, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i
  %194 = or disjoint i64 %78, 14
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %194
  %.sroa.0228.0.copyload.14.i = load i16, ptr %195, align 4, !tbaa.struct !29
  %196 = trunc i64 %75 to i32
  %197 = or disjoint i32 %196, 14
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %197
  store i16 %.sroa.0228.0.copyload.14.i, ptr addrspace(3) %198, align 2, !tbaa.struct !29
  br i1 %72, label %199, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i

199:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i
  %200 = or disjoint i64 %78, 15
  %201 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %200
  %.sroa.0228.0.copyload.15.i = load i16, ptr %201, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i: ; preds = %199, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i
  %.sroa.0230.2.15.i = phi i16 [ %.sroa.0228.0.copyload.15.i, %199 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i ]
  %202 = trunc i64 %75 to i32
  %203 = or disjoint i32 %202, 15
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %203
  store i16 %.sroa.0230.2.15.i, ptr addrspace(3) %204, align 2, !tbaa.struct !29
  br label %.split.us.i

.loopexit488.i:                                   ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %205 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %206 = icmp ult i64 %205, 64
  call void @llvm.assume(i1 %206)
  %207 = icmp eq i64 %205, 0
  br i1 %207, label %208, label %.lr.ph498.i

208:                                              ; preds = %.loopexit488.i
  %209 = shl i32 %.tr.i, 8
  %210 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %211 = icmp eq i64 %210, 0
  call void @llvm.assume(i1 %211)
  %212 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %213 = icmp eq i64 %212, 0
  call void @llvm.assume(i1 %213)
  %214 = sext i32 %5 to i64
  %215 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %216 = inttoptr i32 %215 to ptr addrspace(3)
  %217 = getelementptr inbounds i8, ptr addrspace(3) %216, i32 768
  %218 = sext i32 %209 to i64
  %219 = icmp sgt i32 %4, 0
  %220 = icmp ugt i32 %4, 1
  %221 = icmp ugt i32 %4, 2
  %222 = icmp ugt i32 %4, 3
  %223 = icmp ugt i32 %4, 4
  %224 = icmp ugt i32 %4, 5
  %225 = icmp ugt i32 %4, 6
  %226 = icmp ugt i32 %4, 7
  %227 = icmp ugt i32 %4, 8
  %228 = icmp ugt i32 %4, 9
  %229 = icmp ugt i32 %4, 10
  %230 = icmp ugt i32 %4, 11
  %231 = icmp ugt i32 %4, 12
  %232 = icmp ugt i32 %4, 13
  %233 = icmp ugt i32 %4, 14
  %234 = icmp ugt i32 %4, 15
  br label %.preheader486.i

.preheader486.i:                                  ; preds = %.split495.us.i, %208
  %235 = phi i64 [ 0, %208 ], [ %245, %.split495.us.i ]
  %236 = icmp slt i64 %235, %214
  %237 = shl i64 %235, 4
  %.tr480.i = trunc i64 %235 to i32
  %238 = shl i32 %.tr480.i, 4
  %239 = sext i32 %238 to i64
  %240 = add nsw i64 %239, %218
  %.fr496.i = freeze i1 %236
  br i1 %.fr496.i, label %.preheader486.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader486.i
  %.tr513.i = trunc i64 %235 to i32
  %241 = shl i32 %.tr513.i, 5
  %242 = add i32 %241, 768
  %scevgep507.i = getelementptr i8, ptr addrspace(3) %216, i32 %242
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep507.i, i8 0, i32 32, i1 false)
  br label %.split495.us.i

.preheader486.split.preheader.i:                  ; preds = %.preheader486.i
  br i1 %219, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader486.split.preheader.i
  %243 = trunc i64 %237 to i32
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %243
  store i16 0, ptr addrspace(3) %244, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split495.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %245 = add nuw nsw i64 %235, 1
  %exitcond509.not.i = icmp eq i64 %245, 16
  br i1 %exitcond509.not.i, label %.lr.ph498.i, label %.preheader486.i, !llvm.loop !35

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader486.split.preheader.i
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %240
  %.sroa.0217.0.copyload.i = load i16, ptr %246, align 32, !tbaa.struct !29
  %247 = trunc i64 %237 to i32
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %247
  store i16 %.sroa.0217.0.copyload.i, ptr addrspace(3) %248, align 2, !tbaa.struct !29
  br i1 %220, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %249 = trunc i64 %237 to i32
  %250 = or disjoint i32 %249, 1
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %250
  store i16 0, ptr addrspace(3) %251, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %252 = or disjoint i64 %240, 1
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %252
  %.sroa.0217.0.copyload.1.i = load i16, ptr %253, align 2, !tbaa.struct !29
  %254 = trunc i64 %237 to i32
  %255 = or disjoint i32 %254, 1
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %255
  store i16 %.sroa.0217.0.copyload.1.i, ptr addrspace(3) %256, align 2, !tbaa.struct !29
  br i1 %221, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %257 = trunc i64 %237 to i32
  %258 = or disjoint i32 %257, 2
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %258
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %260 = or disjoint i64 %240, 2
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %260
  %.sroa.0217.0.copyload.2.i = load i16, ptr %261, align 4, !tbaa.struct !29
  %262 = trunc i64 %237 to i32
  %263 = or disjoint i32 %262, 2
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %263
  store i16 %.sroa.0217.0.copyload.2.i, ptr addrspace(3) %264, align 2, !tbaa.struct !29
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %265 = trunc i64 %237 to i32
  %266 = or disjoint i32 %265, 3
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %266
  store i16 0, ptr addrspace(3) %267, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %268 = or disjoint i64 %240, 3
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %268
  %.sroa.0217.0.copyload.3.i = load i16, ptr %269, align 2, !tbaa.struct !29
  %270 = trunc i64 %237 to i32
  %271 = or disjoint i32 %270, 3
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %271
  store i16 %.sroa.0217.0.copyload.3.i, ptr addrspace(3) %272, align 2, !tbaa.struct !29
  br i1 %223, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %273 = trunc i64 %237 to i32
  %274 = or disjoint i32 %273, 4
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %274
  store i16 0, ptr addrspace(3) %275, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %276 = or disjoint i64 %240, 4
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %276
  %.sroa.0217.0.copyload.4.i = load i16, ptr %277, align 8, !tbaa.struct !29
  %278 = trunc i64 %237 to i32
  %279 = or disjoint i32 %278, 4
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %279
  store i16 %.sroa.0217.0.copyload.4.i, ptr addrspace(3) %280, align 2, !tbaa.struct !29
  br i1 %224, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %281 = trunc i64 %237 to i32
  %282 = or disjoint i32 %281, 5
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %282
  store i16 0, ptr addrspace(3) %283, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %284 = or disjoint i64 %240, 5
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %284
  %.sroa.0217.0.copyload.5.i = load i16, ptr %285, align 2, !tbaa.struct !29
  %286 = trunc i64 %237 to i32
  %287 = or disjoint i32 %286, 5
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %287
  store i16 %.sroa.0217.0.copyload.5.i, ptr addrspace(3) %288, align 2, !tbaa.struct !29
  br i1 %225, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %289 = trunc i64 %237 to i32
  %290 = or disjoint i32 %289, 6
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %290
  store i16 0, ptr addrspace(3) %291, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %292 = or disjoint i64 %240, 6
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %292
  %.sroa.0217.0.copyload.6.i = load i16, ptr %293, align 4, !tbaa.struct !29
  %294 = trunc i64 %237 to i32
  %295 = or disjoint i32 %294, 6
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %295
  store i16 %.sroa.0217.0.copyload.6.i, ptr addrspace(3) %296, align 2, !tbaa.struct !29
  br i1 %226, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %297 = trunc i64 %237 to i32
  %298 = or disjoint i32 %297, 7
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %298
  store i16 0, ptr addrspace(3) %299, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %300 = or disjoint i64 %240, 7
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %300
  %.sroa.0217.0.copyload.7.i = load i16, ptr %301, align 2, !tbaa.struct !29
  %302 = trunc i64 %237 to i32
  %303 = or disjoint i32 %302, 7
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %303
  store i16 %.sroa.0217.0.copyload.7.i, ptr addrspace(3) %304, align 2, !tbaa.struct !29
  br i1 %227, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %305 = trunc i64 %237 to i32
  %306 = or disjoint i32 %305, 8
  %307 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %306
  store i16 0, ptr addrspace(3) %307, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %308 = or disjoint i64 %240, 8
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %308
  %.sroa.0217.0.copyload.8.i = load i16, ptr %309, align 16, !tbaa.struct !29
  %310 = trunc i64 %237 to i32
  %311 = or disjoint i32 %310, 8
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %311
  store i16 %.sroa.0217.0.copyload.8.i, ptr addrspace(3) %312, align 2, !tbaa.struct !29
  br i1 %228, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %313 = trunc i64 %237 to i32
  %314 = or disjoint i32 %313, 9
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %314
  store i16 0, ptr addrspace(3) %315, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %316 = or disjoint i64 %240, 9
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %316
  %.sroa.0217.0.copyload.9.i = load i16, ptr %317, align 2, !tbaa.struct !29
  %318 = trunc i64 %237 to i32
  %319 = or disjoint i32 %318, 9
  %320 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %319
  store i16 %.sroa.0217.0.copyload.9.i, ptr addrspace(3) %320, align 2, !tbaa.struct !29
  br i1 %229, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %321 = trunc i64 %237 to i32
  %322 = or disjoint i32 %321, 10
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %322
  store i16 0, ptr addrspace(3) %323, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %324 = or disjoint i64 %240, 10
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %324
  %.sroa.0217.0.copyload.10.i = load i16, ptr %325, align 4, !tbaa.struct !29
  %326 = trunc i64 %237 to i32
  %327 = or disjoint i32 %326, 10
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %327
  store i16 %.sroa.0217.0.copyload.10.i, ptr addrspace(3) %328, align 2, !tbaa.struct !29
  br i1 %230, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %329 = trunc i64 %237 to i32
  %330 = or disjoint i32 %329, 11
  %331 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %330
  store i16 0, ptr addrspace(3) %331, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %332 = or disjoint i64 %240, 11
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %332
  %.sroa.0217.0.copyload.11.i = load i16, ptr %333, align 2, !tbaa.struct !29
  %334 = trunc i64 %237 to i32
  %335 = or disjoint i32 %334, 11
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %335
  store i16 %.sroa.0217.0.copyload.11.i, ptr addrspace(3) %336, align 2, !tbaa.struct !29
  br i1 %231, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %337 = trunc i64 %237 to i32
  %338 = or disjoint i32 %337, 12
  %339 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %338
  store i16 0, ptr addrspace(3) %339, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %340 = or disjoint i64 %240, 12
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %340
  %.sroa.0217.0.copyload.12.i = load i16, ptr %341, align 8, !tbaa.struct !29
  %342 = trunc i64 %237 to i32
  %343 = or disjoint i32 %342, 12
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %343
  store i16 %.sroa.0217.0.copyload.12.i, ptr addrspace(3) %344, align 2, !tbaa.struct !29
  br i1 %232, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %345 = trunc i64 %237 to i32
  %346 = or disjoint i32 %345, 13
  %347 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %346
  store i16 0, ptr addrspace(3) %347, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %348 = or disjoint i64 %240, 13
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %348
  %.sroa.0217.0.copyload.13.i = load i16, ptr %349, align 2, !tbaa.struct !29
  %350 = trunc i64 %237 to i32
  %351 = or disjoint i32 %350, 13
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %351
  store i16 %.sroa.0217.0.copyload.13.i, ptr addrspace(3) %352, align 2, !tbaa.struct !29
  br i1 %233, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %353 = trunc i64 %237 to i32
  %354 = or disjoint i32 %353, 14
  %355 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %354
  store i16 0, ptr addrspace(3) %355, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %356 = or disjoint i64 %240, 14
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %356
  %.sroa.0217.0.copyload.14.i = load i16, ptr %357, align 4, !tbaa.struct !29
  %358 = trunc i64 %237 to i32
  %359 = or disjoint i32 %358, 14
  %360 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %359
  store i16 %.sroa.0217.0.copyload.14.i, ptr addrspace(3) %360, align 2, !tbaa.struct !29
  br i1 %234, label %361, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

361:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %362 = or disjoint i64 %240, 15
  %363 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %362
  %.sroa.0217.0.copyload.15.i = load i16, ptr %363, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %361, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0219.2.15.i = phi i16 [ %.sroa.0217.0.copyload.15.i, %361 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %364 = trunc i64 %237 to i32
  %365 = or disjoint i32 %364, 15
  %366 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %217, i32 %365
  store i16 %.sroa.0219.2.15.i, ptr addrspace(3) %366, align 2, !tbaa.struct !29
  br label %.split495.us.i

.lr.ph498.i:                                      ; preds = %.split495.us.i, %.loopexit488.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %367 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %368 = icmp eq i64 %367, 0
  call void @llvm.assume(i1 %368)
  %369 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %370 = icmp eq i64 %369, 0
  call void @llvm.assume(i1 %370)
  %371 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %372 = icmp ult i64 %371, 64
  call void @llvm.assume(i1 %372)
  %373 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %374 = inttoptr i32 %373 to ptr addrspace(3)
  %375 = getelementptr inbounds i8, ptr addrspace(3) %374, i32 512
  %376 = getelementptr inbounds i8, ptr addrspace(3) %374, i32 768
  %377 = and i64 %371, 7
  %378 = shl nuw nsw i64 %371, 1
  %379 = and i64 %378, 112
  %380 = or disjoint i64 %379, %377
  %381 = trunc i64 %380 to i32
  %382 = getelementptr inbounds float, ptr addrspace(3) %374, i32 %381
  %383 = load float, ptr addrspace(3) %382, align 4, !tbaa !23
  %384 = or disjoint i64 %377, 8
  %385 = or disjoint i64 %379, %384
  %386 = trunc i64 %385 to i32
  %387 = getelementptr inbounds float, ptr addrspace(3) %374, i32 %386
  %388 = load float, ptr addrspace(3) %387, align 4, !tbaa !23
  br label %392

._crit_edge499.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %444, ptr addrspace(3) %382, align 4, !tbaa !23
  store float %469, ptr addrspace(3) %387, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %389 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %390 = icmp ult i64 %389, 64
  call void @llvm.assume(i1 %390)
  %391 = icmp eq i64 %389, 0
  br i1 %391, label %471, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

392:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph498.i
  %393 = phi i64 [ 0, %.lr.ph498.i ], [ %470, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %394 = phi float [ %388, %.lr.ph498.i ], [ %469, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %395 = phi float [ %383, %.lr.ph498.i ], [ %444, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %396 = add nuw nsw i64 %393, %379
  %397 = trunc i64 %396 to i32
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %375, i32 %397
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %398, align 2, !tbaa.struct !29
  %399 = shl nuw nsw i64 %393, 4
  %400 = or disjoint i64 %399, %377
  %401 = trunc i64 %400 to i32
  %402 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %376, i32 %401
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %402, align 2, !tbaa.struct !29
  %403 = zext i16 %.sroa.0194.0.copyload.i to i32
  %404 = lshr i32 %403, 10
  %405 = and i32 %404, 31
  %406 = and i32 %403, 1023
  switch i32 %405, label %412 [
    i32 31, label %407
    i32 0, label %414
  ]

407:                                              ; preds = %392
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %408 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not479.i = icmp eq i32 %406, 0
  %409 = select i1 %.not479.i, i32 2139095040, i32 2143289344
  %410 = or disjoint i32 %409, %408
  %411 = bitcast i32 %410 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

412:                                              ; preds = %392
  %413 = or disjoint i32 %406, 1024
  br label %414

414:                                              ; preds = %412, %392
  %415 = phi i32 [ %413, %412 ], [ %406, %392 ]
  %416 = uitofp i32 %415 to float
  %.not.i = icmp eq i32 %405, 0
  %417 = add nsw i32 %405, -25
  %418 = select i1 %.not.i, i32 -24, i32 %417
  %419 = call float @__ocml_ldexp_f32(float noundef %416, i32 noundef %418) #6
  %420 = fneg contract float %419
  %.not469470.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %421 = select contract i1 %.not469470.i, float %420, float %419
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %414, %407
  %422 = phi float [ %411, %407 ], [ %421, %414 ]
  %423 = zext i16 %.sroa.0185.0.copyload.i to i32
  %424 = lshr i32 %423, 10
  %425 = and i32 %424, 31
  %426 = and i32 %423, 1023
  switch i32 %425, label %432 [
    i32 31, label %427
    i32 0, label %434
  ]

427:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %428 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not478.i = icmp eq i32 %426, 0
  %429 = select i1 %.not478.i, i32 2139095040, i32 2143289344
  %430 = or disjoint i32 %429, %428
  %431 = bitcast i32 %430 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

432:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %433 = or disjoint i32 %426, 1024
  br label %434

434:                                              ; preds = %432, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %435 = phi i32 [ %433, %432 ], [ %426, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %436 = uitofp i32 %435 to float
  %.not471.i = icmp eq i32 %425, 0
  %437 = add nsw i32 %425, -25
  %438 = select i1 %.not471.i, i32 -24, i32 %437
  %439 = call float @__ocml_ldexp_f32(float noundef %436, i32 noundef %438) #6
  %440 = fneg contract float %439
  %.not472473.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %441 = select contract i1 %.not472473.i, float %440, float %439
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %434, %427
  %442 = phi float [ %431, %427 ], [ %441, %434 ]
  %443 = fmul contract float %422, %442
  %444 = fadd contract float %395, %443
  %445 = or disjoint i64 %399, %384
  %446 = trunc i64 %445 to i32
  %447 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %376, i32 %446
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %447, align 2, !tbaa.struct !29
  %448 = zext i16 %.sroa.0176.0.copyload.i to i32
  %449 = lshr i32 %448, 10
  %450 = and i32 %449, 31
  %451 = and i32 %448, 1023
  switch i32 %450, label %457 [
    i32 31, label %452
    i32 0, label %459
  ]

452:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %453 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not477.i = icmp eq i32 %451, 0
  %454 = select i1 %.not477.i, i32 2139095040, i32 2143289344
  %455 = or disjoint i32 %454, %453
  %456 = bitcast i32 %455 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

457:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %458 = or disjoint i32 %451, 1024
  br label %459

459:                                              ; preds = %457, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %460 = phi i32 [ %458, %457 ], [ %451, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %461 = uitofp i32 %460 to float
  %.not474.i = icmp eq i32 %450, 0
  %462 = add nsw i32 %450, -25
  %463 = select i1 %.not474.i, i32 -24, i32 %462
  %464 = call float @__ocml_ldexp_f32(float noundef %461, i32 noundef %463) #6
  %465 = fneg contract float %464
  %.not475476.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %466 = select contract i1 %.not475476.i, float %465, float %464
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %459, %452
  %467 = phi float [ %456, %452 ], [ %466, %459 ]
  %468 = fmul contract float %422, %467
  %469 = fadd contract float %394, %468
  %470 = add nuw nsw i64 %393, 1
  %exitcond510.not.i = icmp eq i64 %470, 16
  br i1 %exitcond510.not.i, label %._crit_edge499.i, label %392, !llvm.loop !36

471:                                              ; preds = %._crit_edge499.i
  %472 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %473 = icmp eq i64 %472, 0
  call void @llvm.assume(i1 %473)
  %474 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %475 = icmp eq i64 %474, 0
  call void @llvm.assume(i1 %475)
  %476 = sext i32 %3 to i64
  %477 = call i32 @llvm.amdgcn.groupstaticsize()
  %478 = inttoptr i32 %477 to ptr addrspace(3)
  %479 = sext i32 %38 to i64
  %480 = icmp sgt i32 %4, 0
  %481 = icmp ugt i32 %4, 1
  %482 = icmp ugt i32 %4, 2
  %483 = icmp ugt i32 %4, 3
  %484 = icmp ugt i32 %4, 4
  %485 = icmp ugt i32 %4, 5
  %486 = icmp ugt i32 %4, 6
  %487 = icmp ugt i32 %4, 7
  %488 = icmp ugt i32 %4, 8
  %489 = icmp ugt i32 %4, 9
  %490 = icmp ugt i32 %4, 10
  %491 = icmp ugt i32 %4, 11
  %492 = icmp ugt i32 %4, 12
  %493 = icmp ugt i32 %4, 13
  %494 = icmp ugt i32 %4, 14
  %495 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split501.us.i, %471
  %496 = phi i64 [ 0, %471 ], [ %502, %.split501.us.i ]
  %497 = icmp slt i64 %496, %476
  %498 = shl i64 %496, 4
  %.tr468.i = trunc i64 %496 to i32
  %499 = shl i32 %.tr468.i, 4
  %500 = sext i32 %499 to i64
  %501 = add nsw i64 %500, %479
  %.fr502.i = freeze i1 %497
  %brmerge.not.i = select i1 %.fr502.i, i1 %480, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split501.us.i

.split501.us.i:                                   ; preds = %591, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %502 = add nuw nsw i64 %496, 1
  %exitcond512.not.i = icmp eq i64 %502, 8
  br i1 %exitcond512.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %503 = trunc i64 %498 to i32
  %504 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !23
  %506 = getelementptr inbounds float, ptr %9, i64 %501
  store float %505, ptr %506, align 32, !tbaa !23
  br i1 %481, label %.preheader.split.2.i, label %.split501.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %507 = trunc i64 %498 to i32
  %508 = or disjoint i32 %507, 1
  %509 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !23
  %511 = or disjoint i64 %501, 1
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 4, !tbaa !23
  br i1 %482, label %.preheader.split.3.i, label %.split501.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %513 = trunc i64 %498 to i32
  %514 = or disjoint i32 %513, 2
  %515 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %514
  %516 = load float, ptr addrspace(3) %515, align 4, !tbaa !23
  %517 = or disjoint i64 %501, 2
  %518 = getelementptr inbounds float, ptr %9, i64 %517
  store float %516, ptr %518, align 8, !tbaa !23
  br i1 %483, label %.preheader.split.4.i, label %.split501.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %519 = trunc i64 %498 to i32
  %520 = or disjoint i32 %519, 3
  %521 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %520
  %522 = load float, ptr addrspace(3) %521, align 4, !tbaa !23
  %523 = or disjoint i64 %501, 3
  %524 = getelementptr inbounds float, ptr %9, i64 %523
  store float %522, ptr %524, align 4, !tbaa !23
  br i1 %484, label %.preheader.split.5.i, label %.split501.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %525 = trunc i64 %498 to i32
  %526 = or disjoint i32 %525, 4
  %527 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !23
  %529 = or disjoint i64 %501, 4
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 16, !tbaa !23
  br i1 %485, label %.preheader.split.6.i, label %.split501.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %531 = trunc i64 %498 to i32
  %532 = or disjoint i32 %531, 5
  %533 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %532
  %534 = load float, ptr addrspace(3) %533, align 4, !tbaa !23
  %535 = or disjoint i64 %501, 5
  %536 = getelementptr inbounds float, ptr %9, i64 %535
  store float %534, ptr %536, align 4, !tbaa !23
  br i1 %486, label %.preheader.split.7.i, label %.split501.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %537 = trunc i64 %498 to i32
  %538 = or disjoint i32 %537, 6
  %539 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %538
  %540 = load float, ptr addrspace(3) %539, align 4, !tbaa !23
  %541 = or disjoint i64 %501, 6
  %542 = getelementptr inbounds float, ptr %9, i64 %541
  store float %540, ptr %542, align 8, !tbaa !23
  br i1 %487, label %.preheader.split.8.i, label %.split501.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %543 = trunc i64 %498 to i32
  %544 = or disjoint i32 %543, 7
  %545 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %544
  %546 = load float, ptr addrspace(3) %545, align 4, !tbaa !23
  %547 = or disjoint i64 %501, 7
  %548 = getelementptr inbounds float, ptr %9, i64 %547
  store float %546, ptr %548, align 4, !tbaa !23
  br i1 %488, label %.preheader.split.9.i, label %.split501.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %549 = trunc i64 %498 to i32
  %550 = or disjoint i32 %549, 8
  %551 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %550
  %552 = load float, ptr addrspace(3) %551, align 4, !tbaa !23
  %553 = or disjoint i64 %501, 8
  %554 = getelementptr inbounds float, ptr %9, i64 %553
  store float %552, ptr %554, align 32, !tbaa !23
  br i1 %489, label %.preheader.split.10.i, label %.split501.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %555 = trunc i64 %498 to i32
  %556 = or disjoint i32 %555, 9
  %557 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %556
  %558 = load float, ptr addrspace(3) %557, align 4, !tbaa !23
  %559 = or disjoint i64 %501, 9
  %560 = getelementptr inbounds float, ptr %9, i64 %559
  store float %558, ptr %560, align 4, !tbaa !23
  br i1 %490, label %.preheader.split.11.i, label %.split501.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %561 = trunc i64 %498 to i32
  %562 = or disjoint i32 %561, 10
  %563 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %562
  %564 = load float, ptr addrspace(3) %563, align 4, !tbaa !23
  %565 = or disjoint i64 %501, 10
  %566 = getelementptr inbounds float, ptr %9, i64 %565
  store float %564, ptr %566, align 8, !tbaa !23
  br i1 %491, label %.preheader.split.12.i, label %.split501.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %567 = trunc i64 %498 to i32
  %568 = or disjoint i32 %567, 11
  %569 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %568
  %570 = load float, ptr addrspace(3) %569, align 4, !tbaa !23
  %571 = or disjoint i64 %501, 11
  %572 = getelementptr inbounds float, ptr %9, i64 %571
  store float %570, ptr %572, align 4, !tbaa !23
  br i1 %492, label %.preheader.split.13.i, label %.split501.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %573 = trunc i64 %498 to i32
  %574 = or disjoint i32 %573, 12
  %575 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %574
  %576 = load float, ptr addrspace(3) %575, align 4, !tbaa !23
  %577 = or disjoint i64 %501, 12
  %578 = getelementptr inbounds float, ptr %9, i64 %577
  store float %576, ptr %578, align 16, !tbaa !23
  br i1 %493, label %.preheader.split.14.i, label %.split501.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %579 = trunc i64 %498 to i32
  %580 = or disjoint i32 %579, 13
  %581 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %580
  %582 = load float, ptr addrspace(3) %581, align 4, !tbaa !23
  %583 = or disjoint i64 %501, 13
  %584 = getelementptr inbounds float, ptr %9, i64 %583
  store float %582, ptr %584, align 4, !tbaa !23
  br i1 %494, label %.preheader.split.15.i, label %.split501.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %585 = trunc i64 %498 to i32
  %586 = or disjoint i32 %585, 14
  %587 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %586
  %588 = load float, ptr addrspace(3) %587, align 4, !tbaa !23
  %589 = or disjoint i64 %501, 14
  %590 = getelementptr inbounds float, ptr %9, i64 %589
  store float %588, ptr %590, align 8, !tbaa !23
  br i1 %495, label %591, label %.split501.us.i

591:                                              ; preds = %.preheader.split.15.i
  %592 = trunc i64 %498 to i32
  %593 = or disjoint i32 %592, 15
  %594 = getelementptr inbounds float, ptr addrspace(3) %478, i32 %593
  %595 = load float, ptr addrspace(3) %594, align 4, !tbaa !23
  %596 = or disjoint i64 %501, 15
  %597 = getelementptr inbounds float, ptr %9, i64 %596
  store float %595, ptr %597, align 4, !tbaa !23
  br label %.split501.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge499.i, %.split501.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="64,64" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5}
!hipsycl.sscp.annotations = !{!6, !7, !8, !9, !10, !11, !12, !13}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 4, !"amdgpu_hostcall", i32 1}
!3 = !{i32 1, !"amdgpu_code_object_version", i32 500}
!4 = !{i32 8, !"PIC Level", i32 0}
!5 = !{!"clang version 17.0.0 (http://10.4.0.1/dcutoolkit/driverruntime/llvm-project.git ff5bf917a679c83afe927af051a20b86fef7b07d)"}
!6 = !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!7 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!8 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!9 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!10 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!13 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!14 = !{!15}
!15 = distinct !{!15, !16, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv: argument 0"}
!16 = distinct !{!16, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv: argument 0"}
!19 = distinct !{!19, !"_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv: argument 0"}
!22 = distinct !{!22, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv"}
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = !{i64 0, i64 2, !30}
!30 = !{!31, !31, i64 0}
!31 = !{!"short", !25, i64 0}
!32 = distinct !{!32, !28, !33, !34}
!33 = !{!"llvm.loop.vectorize.width", i32 1}
!34 = !{!"llvm.loop.interleave.count", i32 1}
!35 = distinct !{!35, !28, !33, !34}
!36 = distinct !{!36, !28}
!37 = distinct !{!37, !28}
;----------------- End AdaptiveCpp IR dump ---------------
