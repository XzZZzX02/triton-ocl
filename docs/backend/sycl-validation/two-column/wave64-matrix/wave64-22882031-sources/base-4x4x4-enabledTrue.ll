;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-qn41i2g0/kernel.cpp"
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
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 536870911
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp ult i64 %20, 4
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 536870912
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp ult i64 %28, 4
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp ult i64 %30, 4
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 4
  call void @llvm.assume(i1 %33)
  %34 = shl nuw nsw i64 %32, 4
  %35 = shl nuw nsw i64 %30, 2
  %36 = or disjoint i64 %34, %35
  %37 = or disjoint i64 %36, %28
  %38 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %39 = inttoptr i32 %38 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %41 = icmp ult i64 %40, 536870911
  call void @llvm.assume(i1 %41)
  %.tr.i = trunc i64 %40 to i32
  %42 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %44 = icmp ult i64 %43, 4
  call void @llvm.assume(i1 %44)
  %45 = icmp eq i64 %43, 0
  br i1 %45, label %52, label %.lr.ph654.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %46 = phi i64 [ %37, %6 ], [ %50, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %47 = trunc i64 %46 to i32
  %48 = and i32 %47, 127
  %49 = getelementptr inbounds float, ptr addrspace(3) %39, i32 %48
  store float 0.000000e+00, ptr addrspace(3) %49, align 4, !tbaa !23
  %50 = add nuw nsw i64 %46, 64
  %51 = icmp ult i64 %46, 64
  br i1 %51, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !27

52:                                               ; preds = %._crit_edge.i
  %53 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %54 = icmp ult i64 %53, 4
  call void @llvm.assume(i1 %54)
  %55 = icmp eq i64 %53, 0
  br i1 %55, label %56, label %.lr.ph654.i

56:                                               ; preds = %52
  %57 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %58 = icmp ult i64 %57, 4
  call void @llvm.assume(i1 %58)
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %.preheader642.i, label %.lr.ph654.i

.preheader642.i:                                  ; preds = %56
  %60 = sext i32 %5 to i64
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr inbounds i8, ptr addrspace(3) %62, i32 512
  %64 = sext i32 %42 to i64
  %65 = icmp sgt i32 %3, 0
  %66 = icmp ugt i32 %3, 1
  %67 = icmp ugt i32 %3, 2
  %68 = icmp ugt i32 %3, 3
  %69 = icmp ugt i32 %3, 4
  %70 = icmp ugt i32 %3, 5
  %71 = icmp ugt i32 %3, 6
  %72 = icmp ugt i32 %3, 7
  br label %.preheader641.i

.preheader641.i:                                  ; preds = %.split.us.i, %.preheader642.i
  %73 = phi i64 [ 0, %.preheader642.i ], [ %83, %.split.us.i ]
  %74 = icmp slt i64 %73, %60
  %75 = shl i64 %73, 3
  %.tr632.i = trunc i64 %73 to i32
  %76 = shl i32 %.tr632.i, 3
  %77 = sext i32 %76 to i64
  %78 = add nsw i64 %77, %64
  %.fr.i = freeze i1 %74
  br i1 %.fr.i, label %.preheader641.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i: ; preds = %.preheader641.i
  %.tr683.i = trunc i64 %73 to i32
  %79 = shl i32 %.tr683.i, 4
  %80 = add i32 %79, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %62, i32 %80
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader641.split.preheader.i:                  ; preds = %.preheader641.i
  br i1 %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i: ; preds = %.preheader641.split.preheader.i
  %81 = trunc i64 %75 to i32
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %81
  store i16 0, ptr addrspace(3) %82, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i
  %83 = add nuw nsw i64 %73, 1
  %exitcond.not.i = icmp eq i64 %83, 16
  br i1 %exitcond.not.i, label %.lr.ph654.i, label %.preheader641.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i: ; preds = %.preheader641.split.preheader.i
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %78
  %.sroa.0290.0.copyload.i = load i16, ptr %84, align 16, !tbaa.struct !29
  %85 = trunc i64 %75 to i32
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %85
  store i16 %.sroa.0290.0.copyload.i, ptr addrspace(3) %86, align 2, !tbaa.struct !29
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i
  %87 = trunc i64 %75 to i32
  %88 = or disjoint i32 %87, 1
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i
  %90 = or disjoint i64 %78, 1
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0290.0.copyload.1.i = load i16, ptr %91, align 2, !tbaa.struct !29
  %92 = trunc i64 %75 to i32
  %93 = or disjoint i32 %92, 1
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %93
  store i16 %.sroa.0290.0.copyload.1.i, ptr addrspace(3) %94, align 2, !tbaa.struct !29
  br i1 %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i
  %95 = trunc i64 %75 to i32
  %96 = or disjoint i32 %95, 2
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i
  %98 = or disjoint i64 %78, 2
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0290.0.copyload.2.i = load i16, ptr %99, align 4, !tbaa.struct !29
  %100 = trunc i64 %75 to i32
  %101 = or disjoint i32 %100, 2
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %101
  store i16 %.sroa.0290.0.copyload.2.i, ptr addrspace(3) %102, align 2, !tbaa.struct !29
  br i1 %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i
  %103 = trunc i64 %75 to i32
  %104 = or disjoint i32 %103, 3
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i
  %106 = or disjoint i64 %78, 3
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0290.0.copyload.3.i = load i16, ptr %107, align 2, !tbaa.struct !29
  %108 = trunc i64 %75 to i32
  %109 = or disjoint i32 %108, 3
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %109
  store i16 %.sroa.0290.0.copyload.3.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  br i1 %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i
  %111 = trunc i64 %75 to i32
  %112 = or disjoint i32 %111, 4
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i
  %114 = or disjoint i64 %78, 4
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0290.0.copyload.4.i = load i16, ptr %115, align 8, !tbaa.struct !29
  %116 = trunc i64 %75 to i32
  %117 = or disjoint i32 %116, 4
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %117
  store i16 %.sroa.0290.0.copyload.4.i, ptr addrspace(3) %118, align 2, !tbaa.struct !29
  br i1 %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i
  %119 = trunc i64 %75 to i32
  %120 = or disjoint i32 %119, 5
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i
  %122 = or disjoint i64 %78, 5
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0290.0.copyload.5.i = load i16, ptr %123, align 2, !tbaa.struct !29
  %124 = trunc i64 %75 to i32
  %125 = or disjoint i32 %124, 5
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %125
  store i16 %.sroa.0290.0.copyload.5.i, ptr addrspace(3) %126, align 2, !tbaa.struct !29
  br i1 %71, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i
  %127 = trunc i64 %75 to i32
  %128 = or disjoint i32 %127, 6
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %128
  store i16 0, ptr addrspace(3) %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i
  %130 = or disjoint i64 %78, 6
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %130
  %.sroa.0290.0.copyload.6.i = load i16, ptr %131, align 4, !tbaa.struct !29
  %132 = trunc i64 %75 to i32
  %133 = or disjoint i32 %132, 6
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %133
  store i16 %.sroa.0290.0.copyload.6.i, ptr addrspace(3) %134, align 2, !tbaa.struct !29
  br i1 %72, label %135, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

135:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i
  %136 = or disjoint i64 %78, 7
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %136
  %.sroa.0290.0.copyload.7.i = load i16, ptr %137, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i: ; preds = %135, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i
  %.sroa.0292.2.7.i = phi i16 [ %.sroa.0290.0.copyload.7.i, %135 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i ]
  %138 = trunc i64 %75 to i32
  %139 = or disjoint i32 %138, 7
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %139
  store i16 %.sroa.0292.2.7.i, ptr addrspace(3) %140, align 2, !tbaa.struct !29
  br label %.split.us.i

.lr.ph654.i:                                      ; preds = %.split.us.i, %56, %52, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %142 = icmp ult i64 %141, 4
  call void @llvm.assume(i1 %142)
  %143 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %144 = icmp ult i64 %143, 4
  call void @llvm.assume(i1 %144)
  %145 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %146 = icmp ult i64 %145, 4
  call void @llvm.assume(i1 %146)
  %147 = shl nuw nsw i64 %145, 4
  %148 = shl nuw nsw i64 %143, 2
  %149 = or disjoint i64 %147, %148
  %150 = or disjoint i64 %149, %141
  %151 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %152 = inttoptr i32 %151 to ptr addrspace(3)
  %153 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 512
  %154 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge655.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %157 = icmp ult i64 %156, 4
  call void @llvm.assume(i1 %157)
  %158 = icmp eq i64 %156, 0
  br i1 %158, label %172, label %.lr.ph660.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph654.i
  %159 = phi i64 [ %150, %.lr.ph654.i ], [ %170, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %160 = lshr i64 %159, 4
  %161 = and i64 %160, 7
  %162 = shl i64 %159, 3
  %163 = and i64 %162, 120
  %164 = or disjoint i64 %163, %161
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %153, i32 %165
  %.sroa.0365.0.copyload.i = load i16, ptr addrspace(3) %166, align 2, !tbaa.struct !29
  %167 = trunc i64 %159 to i32
  %168 = and i32 %167, 127
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %168
  store i16 %.sroa.0365.0.copyload.i, ptr addrspace(3) %169, align 2, !tbaa.struct !29
  %170 = add nuw nsw i64 %159, 64
  %171 = icmp ult i64 %159, 64
  br i1 %171, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge655.i, !llvm.loop !35

172:                                              ; preds = %._crit_edge655.i
  %173 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %174 = icmp ult i64 %173, 4
  call void @llvm.assume(i1 %174)
  %175 = icmp eq i64 %173, 0
  br i1 %175, label %176, label %.lr.ph660.i

176:                                              ; preds = %172
  %177 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %178 = icmp ult i64 %177, 4
  call void @llvm.assume(i1 %178)
  %179 = icmp eq i64 %177, 0
  br i1 %179, label %.preheader640.i, label %.lr.ph660.i

.preheader640.i:                                  ; preds = %176
  %180 = sext i32 %4 to i64
  %181 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %182 = inttoptr i32 %181 to ptr addrspace(3)
  %183 = getelementptr inbounds i8, ptr addrspace(3) %182, i32 1024
  %184 = sext i32 %155 to i64
  %185 = icmp sgt i32 %5, 0
  %186 = icmp ugt i32 %5, 1
  %187 = icmp ugt i32 %5, 2
  %188 = icmp ugt i32 %5, 3
  %189 = icmp ugt i32 %5, 4
  %190 = icmp ugt i32 %5, 5
  %191 = icmp ugt i32 %5, 6
  %192 = icmp ugt i32 %5, 7
  %193 = icmp ugt i32 %5, 8
  %194 = icmp ugt i32 %5, 9
  %195 = icmp ugt i32 %5, 10
  %196 = icmp ugt i32 %5, 11
  %197 = icmp ugt i32 %5, 12
  %198 = icmp ugt i32 %5, 13
  %199 = icmp ugt i32 %5, 14
  %200 = icmp ugt i32 %5, 15
  br label %.preheader639.i

.preheader639.i:                                  ; preds = %.split657.us.i, %.preheader640.i
  %201 = phi i64 [ 0, %.preheader640.i ], [ %211, %.split657.us.i ]
  %202 = icmp slt i64 %201, %180
  %203 = shl i64 %201, 4
  %.tr630.i = trunc i64 %201 to i32
  %204 = shl i32 %.tr630.i, 4
  %205 = sext i32 %204 to i64
  %206 = add nsw i64 %205, %184
  %.fr658.i = freeze i1 %202
  br i1 %.fr658.i, label %.preheader639.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader639.i
  %.tr682.i = trunc i64 %201 to i32
  %207 = shl i32 %.tr682.i, 5
  %208 = add i32 %207, 1024
  %scevgep676.i = getelementptr i8, ptr addrspace(3) %182, i32 %208
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep676.i, i8 0, i32 32, i1 false)
  br label %.split657.us.i

.preheader639.split.preheader.i:                  ; preds = %.preheader639.i
  br i1 %185, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader639.split.preheader.i
  %209 = trunc i64 %203 to i32
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %209
  store i16 0, ptr addrspace(3) %210, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split657.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %211 = add nuw nsw i64 %201, 1
  %exitcond678.not.i = icmp eq i64 %211, 16
  br i1 %exitcond678.not.i, label %.lr.ph660.i, label %.preheader639.i, !llvm.loop !36

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader639.split.preheader.i
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %206
  %.sroa.0253.0.copyload.i = load i16, ptr %212, align 32, !tbaa.struct !29
  %213 = trunc i64 %203 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %213
  store i16 %.sroa.0253.0.copyload.i, ptr addrspace(3) %214, align 2, !tbaa.struct !29
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %215 = trunc i64 %203 to i32
  %216 = or disjoint i32 %215, 1
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %216
  store i16 0, ptr addrspace(3) %217, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %218 = or disjoint i64 %206, 1
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %218
  %.sroa.0253.0.copyload.1.i = load i16, ptr %219, align 2, !tbaa.struct !29
  %220 = trunc i64 %203 to i32
  %221 = or disjoint i32 %220, 1
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %221
  store i16 %.sroa.0253.0.copyload.1.i, ptr addrspace(3) %222, align 2, !tbaa.struct !29
  br i1 %187, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %223 = trunc i64 %203 to i32
  %224 = or disjoint i32 %223, 2
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %224
  store i16 0, ptr addrspace(3) %225, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %226 = or disjoint i64 %206, 2
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %226
  %.sroa.0253.0.copyload.2.i = load i16, ptr %227, align 4, !tbaa.struct !29
  %228 = trunc i64 %203 to i32
  %229 = or disjoint i32 %228, 2
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %229
  store i16 %.sroa.0253.0.copyload.2.i, ptr addrspace(3) %230, align 2, !tbaa.struct !29
  br i1 %188, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %231 = trunc i64 %203 to i32
  %232 = or disjoint i32 %231, 3
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %232
  store i16 0, ptr addrspace(3) %233, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %234 = or disjoint i64 %206, 3
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %234
  %.sroa.0253.0.copyload.3.i = load i16, ptr %235, align 2, !tbaa.struct !29
  %236 = trunc i64 %203 to i32
  %237 = or disjoint i32 %236, 3
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %237
  store i16 %.sroa.0253.0.copyload.3.i, ptr addrspace(3) %238, align 2, !tbaa.struct !29
  br i1 %189, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %239 = trunc i64 %203 to i32
  %240 = or disjoint i32 %239, 4
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %240
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %242 = or disjoint i64 %206, 4
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %242
  %.sroa.0253.0.copyload.4.i = load i16, ptr %243, align 8, !tbaa.struct !29
  %244 = trunc i64 %203 to i32
  %245 = or disjoint i32 %244, 4
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %245
  store i16 %.sroa.0253.0.copyload.4.i, ptr addrspace(3) %246, align 2, !tbaa.struct !29
  br i1 %190, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %247 = trunc i64 %203 to i32
  %248 = or disjoint i32 %247, 5
  %249 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %248
  store i16 0, ptr addrspace(3) %249, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %250 = or disjoint i64 %206, 5
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %250
  %.sroa.0253.0.copyload.5.i = load i16, ptr %251, align 2, !tbaa.struct !29
  %252 = trunc i64 %203 to i32
  %253 = or disjoint i32 %252, 5
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %253
  store i16 %.sroa.0253.0.copyload.5.i, ptr addrspace(3) %254, align 2, !tbaa.struct !29
  br i1 %191, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %255 = trunc i64 %203 to i32
  %256 = or disjoint i32 %255, 6
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %256
  store i16 0, ptr addrspace(3) %257, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %258 = or disjoint i64 %206, 6
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %258
  %.sroa.0253.0.copyload.6.i = load i16, ptr %259, align 4, !tbaa.struct !29
  %260 = trunc i64 %203 to i32
  %261 = or disjoint i32 %260, 6
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %261
  store i16 %.sroa.0253.0.copyload.6.i, ptr addrspace(3) %262, align 2, !tbaa.struct !29
  br i1 %192, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %263 = trunc i64 %203 to i32
  %264 = or disjoint i32 %263, 7
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %264
  store i16 0, ptr addrspace(3) %265, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %266 = or disjoint i64 %206, 7
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %266
  %.sroa.0253.0.copyload.7.i = load i16, ptr %267, align 2, !tbaa.struct !29
  %268 = trunc i64 %203 to i32
  %269 = or disjoint i32 %268, 7
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %269
  store i16 %.sroa.0253.0.copyload.7.i, ptr addrspace(3) %270, align 2, !tbaa.struct !29
  br i1 %193, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %271 = trunc i64 %203 to i32
  %272 = or disjoint i32 %271, 8
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %272
  store i16 0, ptr addrspace(3) %273, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %274 = or disjoint i64 %206, 8
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %274
  %.sroa.0253.0.copyload.8.i = load i16, ptr %275, align 16, !tbaa.struct !29
  %276 = trunc i64 %203 to i32
  %277 = or disjoint i32 %276, 8
  %278 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %277
  store i16 %.sroa.0253.0.copyload.8.i, ptr addrspace(3) %278, align 2, !tbaa.struct !29
  br i1 %194, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %279 = trunc i64 %203 to i32
  %280 = or disjoint i32 %279, 9
  %281 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %280
  store i16 0, ptr addrspace(3) %281, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %282 = or disjoint i64 %206, 9
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %282
  %.sroa.0253.0.copyload.9.i = load i16, ptr %283, align 2, !tbaa.struct !29
  %284 = trunc i64 %203 to i32
  %285 = or disjoint i32 %284, 9
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %285
  store i16 %.sroa.0253.0.copyload.9.i, ptr addrspace(3) %286, align 2, !tbaa.struct !29
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %287 = trunc i64 %203 to i32
  %288 = or disjoint i32 %287, 10
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %288
  store i16 0, ptr addrspace(3) %289, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %290 = or disjoint i64 %206, 10
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %290
  %.sroa.0253.0.copyload.10.i = load i16, ptr %291, align 4, !tbaa.struct !29
  %292 = trunc i64 %203 to i32
  %293 = or disjoint i32 %292, 10
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %293
  store i16 %.sroa.0253.0.copyload.10.i, ptr addrspace(3) %294, align 2, !tbaa.struct !29
  br i1 %196, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %295 = trunc i64 %203 to i32
  %296 = or disjoint i32 %295, 11
  %297 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %296
  store i16 0, ptr addrspace(3) %297, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %298 = or disjoint i64 %206, 11
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %298
  %.sroa.0253.0.copyload.11.i = load i16, ptr %299, align 2, !tbaa.struct !29
  %300 = trunc i64 %203 to i32
  %301 = or disjoint i32 %300, 11
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %301
  store i16 %.sroa.0253.0.copyload.11.i, ptr addrspace(3) %302, align 2, !tbaa.struct !29
  br i1 %197, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %303 = trunc i64 %203 to i32
  %304 = or disjoint i32 %303, 12
  %305 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %304
  store i16 0, ptr addrspace(3) %305, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %306 = or disjoint i64 %206, 12
  %307 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %306
  %.sroa.0253.0.copyload.12.i = load i16, ptr %307, align 8, !tbaa.struct !29
  %308 = trunc i64 %203 to i32
  %309 = or disjoint i32 %308, 12
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %309
  store i16 %.sroa.0253.0.copyload.12.i, ptr addrspace(3) %310, align 2, !tbaa.struct !29
  br i1 %198, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %311 = trunc i64 %203 to i32
  %312 = or disjoint i32 %311, 13
  %313 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %312
  store i16 0, ptr addrspace(3) %313, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %314 = or disjoint i64 %206, 13
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %314
  %.sroa.0253.0.copyload.13.i = load i16, ptr %315, align 2, !tbaa.struct !29
  %316 = trunc i64 %203 to i32
  %317 = or disjoint i32 %316, 13
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %317
  store i16 %.sroa.0253.0.copyload.13.i, ptr addrspace(3) %318, align 2, !tbaa.struct !29
  br i1 %199, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %319 = trunc i64 %203 to i32
  %320 = or disjoint i32 %319, 14
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %320
  store i16 0, ptr addrspace(3) %321, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %322 = or disjoint i64 %206, 14
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0253.0.copyload.14.i = load i16, ptr %323, align 4, !tbaa.struct !29
  %324 = trunc i64 %203 to i32
  %325 = or disjoint i32 %324, 14
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %325
  store i16 %.sroa.0253.0.copyload.14.i, ptr addrspace(3) %326, align 2, !tbaa.struct !29
  br i1 %200, label %327, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

327:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %328 = or disjoint i64 %206, 15
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %328
  %.sroa.0253.0.copyload.15.i = load i16, ptr %329, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %327, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0255.2.15.i = phi i16 [ %.sroa.0253.0.copyload.15.i, %327 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %330 = trunc i64 %203 to i32
  %331 = or disjoint i32 %330, 15
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %331
  store i16 %.sroa.0255.2.15.i, ptr addrspace(3) %332, align 2, !tbaa.struct !29
  br label %.split657.us.i

.lr.ph660.i:                                      ; preds = %.split657.us.i, %176, %172, %._crit_edge655.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %333 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %334 = icmp ult i64 %333, 4
  call void @llvm.assume(i1 %334)
  %335 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %336 = icmp ult i64 %335, 4
  call void @llvm.assume(i1 %336)
  %337 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %338 = icmp ult i64 %337, 4
  call void @llvm.assume(i1 %338)
  %339 = shl nuw nsw i64 %337, 4
  %340 = shl nuw nsw i64 %335, 2
  %341 = or disjoint i64 %339, %340
  %342 = or disjoint i64 %341, %333
  %343 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %344 = inttoptr i32 %343 to ptr addrspace(3)
  %345 = getelementptr inbounds i8, ptr addrspace(3) %344, i32 1024
  %346 = getelementptr inbounds i8, ptr addrspace(3) %344, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph663.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %347 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %348 = icmp ult i64 %347, 4
  call void @llvm.assume(i1 %348)
  %349 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %350 = icmp ult i64 %349, 4
  call void @llvm.assume(i1 %350)
  %351 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %352 = icmp ult i64 %351, 4
  call void @llvm.assume(i1 %352)
  %353 = shl nuw nsw i64 %351, 4
  %354 = shl nuw nsw i64 %349, 2
  %355 = or disjoint i64 %353, %354
  %356 = or disjoint i64 %355, %347
  %357 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %358 = inttoptr i32 %357 to ptr addrspace(3)
  %359 = getelementptr inbounds i8, ptr addrspace(3) %358, i32 768
  %360 = getelementptr inbounds i8, ptr addrspace(3) %358, i32 1536
  br label %377

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph660.i
  %361 = phi i64 [ %342, %.lr.ph660.i ], [ %372, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %362 = lshr i64 %361, 4
  %363 = and i64 %362, 15
  %364 = shl i64 %361, 4
  %365 = and i64 %364, 240
  %366 = or disjoint i64 %365, %363
  %367 = trunc i64 %366 to i32
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %345, i32 %367
  %.sroa.0366.0.copyload.i = load i16, ptr addrspace(3) %368, align 2, !tbaa.struct !29
  %369 = trunc i64 %361 to i32
  %370 = and i32 %369, 255
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %346, i32 %370
  store i16 %.sroa.0366.0.copyload.i, ptr addrspace(3) %371, align 2, !tbaa.struct !29
  %372 = add nuw nsw i64 %361, 64
  %373 = icmp ult i64 %361, 192
  br i1 %373, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph663.i, !llvm.loop !37

._crit_edge664.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %374 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %375 = icmp ult i64 %374, 4
  call void @llvm.assume(i1 %375)
  %376 = icmp eq i64 %374, 0
  br i1 %376, label %473, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

377:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph663.i
  %378 = phi i64 [ %356, %.lr.ph663.i ], [ %392, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %.frozen.i = freeze i64 %378
  %379 = sdiv i64 %.frozen.i, 8
  %380 = srem i64 %379, 8
  %381 = mul i64 %379, 8
  %.decomposed.i = sub i64 %.frozen.i, %381
  %382 = shl nsw i64 %380, 4
  %383 = add nsw i64 %382, %.decomposed.i
  %384 = trunc i64 %383 to i32
  %385 = getelementptr inbounds float, ptr addrspace(3) %358, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !23
  %387 = add nsw i64 %.decomposed.i, 8
  %388 = add nuw nsw i64 %382, %387
  %389 = trunc i64 %388 to i32
  %390 = getelementptr inbounds float, ptr addrspace(3) %358, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !23
  br label %394

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %446, ptr addrspace(3) %385, align 4, !tbaa !23
  store float %471, ptr addrspace(3) %390, align 4, !tbaa !23
  %392 = add i64 %378, 64
  %393 = icmp ugt i64 %378, 9223372036854775743
  br i1 %393, label %377, label %._crit_edge664.i, !llvm.loop !38

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %377
  %395 = phi i64 [ 0, %377 ], [ %472, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %396 = phi float [ %391, %377 ], [ %471, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %397 = phi float [ %386, %377 ], [ %446, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %398 = add nuw nsw i64 %395, %382
  %399 = trunc i64 %398 to i32
  %400 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %359, i32 %399
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %400, align 2, !tbaa.struct !29
  %401 = shl nuw nsw i64 %395, 4
  %402 = add nsw i64 %401, %.decomposed.i
  %403 = trunc i64 %402 to i32
  %404 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %360, i32 %403
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %404, align 2, !tbaa.struct !29
  %405 = zext i16 %.sroa.0204.0.copyload.i to i32
  %406 = lshr i32 %405, 10
  %407 = and i32 %406, 31
  %408 = and i32 %405, 1023
  switch i32 %407, label %414 [
    i32 31, label %409
    i32 0, label %416
  ]

409:                                              ; preds = %394
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %410 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not629.i = icmp eq i32 %408, 0
  %411 = select i1 %.not629.i, i32 2139095040, i32 2143289344
  %412 = or disjoint i32 %411, %410
  %413 = bitcast i32 %412 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

414:                                              ; preds = %394
  %415 = or disjoint i32 %408, 1024
  br label %416

416:                                              ; preds = %414, %394
  %417 = phi i32 [ %415, %414 ], [ %408, %394 ]
  %418 = uitofp i32 %417 to float
  %.not.i = icmp eq i32 %407, 0
  %419 = add nsw i32 %407, -25
  %420 = select i1 %.not.i, i32 -24, i32 %419
  %421 = call float @__ocml_ldexp_f32(float noundef %418, i32 noundef %420) #6
  %422 = fneg contract float %421
  %.not619620.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %423 = select contract i1 %.not619620.i, float %422, float %421
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %416, %409
  %424 = phi float [ %413, %409 ], [ %423, %416 ]
  %425 = zext i16 %.sroa.0195.0.copyload.i to i32
  %426 = lshr i32 %425, 10
  %427 = and i32 %426, 31
  %428 = and i32 %425, 1023
  switch i32 %427, label %434 [
    i32 31, label %429
    i32 0, label %436
  ]

429:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %430 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not628.i = icmp eq i32 %428, 0
  %431 = select i1 %.not628.i, i32 2139095040, i32 2143289344
  %432 = or disjoint i32 %431, %430
  %433 = bitcast i32 %432 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

434:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %435 = or disjoint i32 %428, 1024
  br label %436

436:                                              ; preds = %434, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %437 = phi i32 [ %435, %434 ], [ %428, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %438 = uitofp i32 %437 to float
  %.not621.i = icmp eq i32 %427, 0
  %439 = add nsw i32 %427, -25
  %440 = select i1 %.not621.i, i32 -24, i32 %439
  %441 = call float @__ocml_ldexp_f32(float noundef %438, i32 noundef %440) #6
  %442 = fneg contract float %441
  %.not622623.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %443 = select contract i1 %.not622623.i, float %442, float %441
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %436, %429
  %444 = phi float [ %433, %429 ], [ %443, %436 ]
  %445 = fmul contract float %424, %444
  %446 = fadd contract float %397, %445
  %447 = add nuw nsw i64 %401, %387
  %448 = trunc i64 %447 to i32
  %449 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %360, i32 %448
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %449, align 2, !tbaa.struct !29
  %450 = zext i16 %.sroa.0186.0.copyload.i to i32
  %451 = lshr i32 %450, 10
  %452 = and i32 %451, 31
  %453 = and i32 %450, 1023
  switch i32 %452, label %459 [
    i32 31, label %454
    i32 0, label %461
  ]

454:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %455 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not627.i = icmp eq i32 %453, 0
  %456 = select i1 %.not627.i, i32 2139095040, i32 2143289344
  %457 = or disjoint i32 %456, %455
  %458 = bitcast i32 %457 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

459:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %460 = or disjoint i32 %453, 1024
  br label %461

461:                                              ; preds = %459, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %462 = phi i32 [ %460, %459 ], [ %453, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %463 = uitofp i32 %462 to float
  %.not624.i = icmp eq i32 %452, 0
  %464 = add nsw i32 %452, -25
  %465 = select i1 %.not624.i, i32 -24, i32 %464
  %466 = call float @__ocml_ldexp_f32(float noundef %463, i32 noundef %465) #6
  %467 = fneg contract float %466
  %.not625626.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %468 = select contract i1 %.not625626.i, float %467, float %466
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %461, %454
  %469 = phi float [ %458, %454 ], [ %468, %461 ]
  %470 = fmul contract float %424, %469
  %471 = fadd contract float %396, %470
  %472 = add nuw nsw i64 %395, 1
  %exitcond679.not.i = icmp eq i64 %472, 16
  br i1 %exitcond679.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %394, !llvm.loop !39

473:                                              ; preds = %._crit_edge664.i
  %474 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %475 = icmp ult i64 %474, 4
  call void @llvm.assume(i1 %475)
  %476 = icmp eq i64 %474, 0
  br i1 %476, label %477, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

477:                                              ; preds = %473
  %478 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %479 = icmp ult i64 %478, 4
  call void @llvm.assume(i1 %479)
  %480 = icmp eq i64 %478, 0
  br i1 %480, label %.preheader638.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader638.i:                                  ; preds = %477
  %481 = sext i32 %3 to i64
  %482 = call i32 @llvm.amdgcn.groupstaticsize()
  %483 = inttoptr i32 %482 to ptr addrspace(3)
  %484 = sext i32 %42 to i64
  %485 = icmp sgt i32 %4, 0
  %486 = icmp ugt i32 %4, 1
  %487 = icmp ugt i32 %4, 2
  %488 = icmp ugt i32 %4, 3
  %489 = icmp ugt i32 %4, 4
  %490 = icmp ugt i32 %4, 5
  %491 = icmp ugt i32 %4, 6
  %492 = icmp ugt i32 %4, 7
  %493 = icmp ugt i32 %4, 8
  %494 = icmp ugt i32 %4, 9
  %495 = icmp ugt i32 %4, 10
  %496 = icmp ugt i32 %4, 11
  %497 = icmp ugt i32 %4, 12
  %498 = icmp ugt i32 %4, 13
  %499 = icmp ugt i32 %4, 14
  %500 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split666.us.i, %.preheader638.i
  %501 = phi i64 [ 0, %.preheader638.i ], [ %507, %.split666.us.i ]
  %502 = icmp slt i64 %501, %481
  %503 = shl i64 %501, 4
  %.tr618.i = trunc i64 %501 to i32
  %504 = shl i32 %.tr618.i, 4
  %505 = sext i32 %504 to i64
  %506 = add nsw i64 %505, %484
  %.fr667.i = freeze i1 %502
  %brmerge.not.i = select i1 %.fr667.i, i1 %485, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split666.us.i

.split666.us.i:                                   ; preds = %596, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %507 = add nuw nsw i64 %501, 1
  %exitcond681.not.i = icmp eq i64 %507, 8
  br i1 %exitcond681.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !40

.preheader.split.1.i:                             ; preds = %.preheader.i
  %508 = trunc i64 %503 to i32
  %509 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !23
  %511 = getelementptr inbounds float, ptr %9, i64 %506
  store float %510, ptr %511, align 32, !tbaa !23
  br i1 %486, label %.preheader.split.2.i, label %.split666.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %512 = trunc i64 %503 to i32
  %513 = or disjoint i32 %512, 1
  %514 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %513
  %515 = load float, ptr addrspace(3) %514, align 4, !tbaa !23
  %516 = or disjoint i64 %506, 1
  %517 = getelementptr inbounds float, ptr %9, i64 %516
  store float %515, ptr %517, align 4, !tbaa !23
  br i1 %487, label %.preheader.split.3.i, label %.split666.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %518 = trunc i64 %503 to i32
  %519 = or disjoint i32 %518, 2
  %520 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %519
  %521 = load float, ptr addrspace(3) %520, align 4, !tbaa !23
  %522 = or disjoint i64 %506, 2
  %523 = getelementptr inbounds float, ptr %9, i64 %522
  store float %521, ptr %523, align 8, !tbaa !23
  br i1 %488, label %.preheader.split.4.i, label %.split666.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %524 = trunc i64 %503 to i32
  %525 = or disjoint i32 %524, 3
  %526 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %525
  %527 = load float, ptr addrspace(3) %526, align 4, !tbaa !23
  %528 = or disjoint i64 %506, 3
  %529 = getelementptr inbounds float, ptr %9, i64 %528
  store float %527, ptr %529, align 4, !tbaa !23
  br i1 %489, label %.preheader.split.5.i, label %.split666.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %530 = trunc i64 %503 to i32
  %531 = or disjoint i32 %530, 4
  %532 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %531
  %533 = load float, ptr addrspace(3) %532, align 4, !tbaa !23
  %534 = or disjoint i64 %506, 4
  %535 = getelementptr inbounds float, ptr %9, i64 %534
  store float %533, ptr %535, align 16, !tbaa !23
  br i1 %490, label %.preheader.split.6.i, label %.split666.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %536 = trunc i64 %503 to i32
  %537 = or disjoint i32 %536, 5
  %538 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %537
  %539 = load float, ptr addrspace(3) %538, align 4, !tbaa !23
  %540 = or disjoint i64 %506, 5
  %541 = getelementptr inbounds float, ptr %9, i64 %540
  store float %539, ptr %541, align 4, !tbaa !23
  br i1 %491, label %.preheader.split.7.i, label %.split666.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %542 = trunc i64 %503 to i32
  %543 = or disjoint i32 %542, 6
  %544 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %543
  %545 = load float, ptr addrspace(3) %544, align 4, !tbaa !23
  %546 = or disjoint i64 %506, 6
  %547 = getelementptr inbounds float, ptr %9, i64 %546
  store float %545, ptr %547, align 8, !tbaa !23
  br i1 %492, label %.preheader.split.8.i, label %.split666.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %548 = trunc i64 %503 to i32
  %549 = or disjoint i32 %548, 7
  %550 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %549
  %551 = load float, ptr addrspace(3) %550, align 4, !tbaa !23
  %552 = or disjoint i64 %506, 7
  %553 = getelementptr inbounds float, ptr %9, i64 %552
  store float %551, ptr %553, align 4, !tbaa !23
  br i1 %493, label %.preheader.split.9.i, label %.split666.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %554 = trunc i64 %503 to i32
  %555 = or disjoint i32 %554, 8
  %556 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %555
  %557 = load float, ptr addrspace(3) %556, align 4, !tbaa !23
  %558 = or disjoint i64 %506, 8
  %559 = getelementptr inbounds float, ptr %9, i64 %558
  store float %557, ptr %559, align 32, !tbaa !23
  br i1 %494, label %.preheader.split.10.i, label %.split666.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %560 = trunc i64 %503 to i32
  %561 = or disjoint i32 %560, 9
  %562 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %561
  %563 = load float, ptr addrspace(3) %562, align 4, !tbaa !23
  %564 = or disjoint i64 %506, 9
  %565 = getelementptr inbounds float, ptr %9, i64 %564
  store float %563, ptr %565, align 4, !tbaa !23
  br i1 %495, label %.preheader.split.11.i, label %.split666.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %566 = trunc i64 %503 to i32
  %567 = or disjoint i32 %566, 10
  %568 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %567
  %569 = load float, ptr addrspace(3) %568, align 4, !tbaa !23
  %570 = or disjoint i64 %506, 10
  %571 = getelementptr inbounds float, ptr %9, i64 %570
  store float %569, ptr %571, align 8, !tbaa !23
  br i1 %496, label %.preheader.split.12.i, label %.split666.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %572 = trunc i64 %503 to i32
  %573 = or disjoint i32 %572, 11
  %574 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %573
  %575 = load float, ptr addrspace(3) %574, align 4, !tbaa !23
  %576 = or disjoint i64 %506, 11
  %577 = getelementptr inbounds float, ptr %9, i64 %576
  store float %575, ptr %577, align 4, !tbaa !23
  br i1 %497, label %.preheader.split.13.i, label %.split666.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %578 = trunc i64 %503 to i32
  %579 = or disjoint i32 %578, 12
  %580 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %579
  %581 = load float, ptr addrspace(3) %580, align 4, !tbaa !23
  %582 = or disjoint i64 %506, 12
  %583 = getelementptr inbounds float, ptr %9, i64 %582
  store float %581, ptr %583, align 16, !tbaa !23
  br i1 %498, label %.preheader.split.14.i, label %.split666.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %584 = trunc i64 %503 to i32
  %585 = or disjoint i32 %584, 13
  %586 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %585
  %587 = load float, ptr addrspace(3) %586, align 4, !tbaa !23
  %588 = or disjoint i64 %506, 13
  %589 = getelementptr inbounds float, ptr %9, i64 %588
  store float %587, ptr %589, align 4, !tbaa !23
  br i1 %499, label %.preheader.split.15.i, label %.split666.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %590 = trunc i64 %503 to i32
  %591 = or disjoint i32 %590, 14
  %592 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %591
  %593 = load float, ptr addrspace(3) %592, align 4, !tbaa !23
  %594 = or disjoint i64 %506, 14
  %595 = getelementptr inbounds float, ptr %9, i64 %594
  store float %593, ptr %595, align 8, !tbaa !23
  br i1 %500, label %596, label %.split666.us.i

596:                                              ; preds = %.preheader.split.15.i
  %597 = trunc i64 %503 to i32
  %598 = or disjoint i32 %597, 15
  %599 = getelementptr inbounds float, ptr addrspace(3) %483, i32 %598
  %600 = load float, ptr addrspace(3) %599, align 4, !tbaa !23
  %601 = or disjoint i64 %506, 15
  %602 = getelementptr inbounds float, ptr %9, i64 %601
  store float %600, ptr %602, align 4, !tbaa !23
  br label %.split666.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge664.i, %473, %477, %.split666.us.i
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
!36 = distinct !{!36, !28, !33, !34}
!37 = distinct !{!37, !28, !33, !34}
!38 = distinct !{!38, !28}
!39 = distinct !{!39, !28}
!40 = distinct !{!40, !28}
;----------------- End AdaptiveCpp IR dump ---------------
