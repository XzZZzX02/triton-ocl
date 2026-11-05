;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-345ai6lo/kernel.cpp"
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
  %.fr563.i = freeze i32 %3
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
  %42 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %44 = icmp ult i64 %43, 4
  call void @llvm.assume(i1 %44)
  %45 = icmp eq i64 %43, 0
  br i1 %45, label %52, label %.loopexit492.i

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
  br i1 %55, label %56, label %.loopexit492.i

56:                                               ; preds = %52
  %57 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %58 = icmp ult i64 %57, 4
  call void @llvm.assume(i1 %58)
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %.preheader491.i, label %.loopexit492.i

.preheader491.i:                                  ; preds = %56
  %60 = sext i32 %5 to i64
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr i8, ptr addrspace(3) %62, i32 512
  %64 = sext i32 %42 to i64
  %65 = icmp sgt i32 %.fr563.i, 0
  br i1 %65, label %.preheader490.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader491.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %63, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader490.split.preheader.i:                  ; preds = %.preheader491.i
  %66 = icmp sgt i32 %5, 0
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i: ; preds = %.preheader490.split.preheader.i
  store i16 0, ptr addrspace(3) %63, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.thread.i

.split.us.i:                                      ; preds = %281, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i
  %.sroa.0230.2.31.i = phi i16 [ %.sroa.0228.0.copyload.31.i, %281 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i ]
  %67 = getelementptr i8, ptr addrspace(3) %62, i32 574
  store i16 %.sroa.0230.2.31.i, ptr addrspace(3) %67, align 2, !tbaa.struct !29
  %68 = icmp ugt i32 %.fr563.i, 1
  %69 = or disjoint i64 %64, 32
  br i1 %68, label %.preheader490.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %62, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader490.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i, %.split.us.i
  %70 = phi i64 [ %78, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i ], [ 0, %.split.us.i ]
  %71 = icmp slt i64 %70, %60
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i

72:                                               ; preds = %.preheader490.split.1.i
  %73 = add nuw nsw i64 %69, %70
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0228.0.copyload.1.i = load i16, ptr %74, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i: ; preds = %72, %.preheader490.split.1.i
  %.sroa.0230.2.1.i = phi i16 [ %.sroa.0228.0.copyload.1.i, %72 ], [ 0, %.preheader490.split.1.i ]
  %75 = trunc i64 %70 to i32
  %76 = add i32 %75, 32
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %76
  store i16 %.sroa.0230.2.1.i, ptr addrspace(3) %77, align 2, !tbaa.struct !29
  %78 = add nuw nsw i64 %70, 1
  %exitcond.1.not.i = icmp eq i64 %78, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader490.split.1.i, !llvm.loop !32

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i
  %79 = icmp sgt i32 %.fr563.i, 2
  %80 = or disjoint i64 %64, 64
  br i1 %79, label %.preheader490.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %62, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader490.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i, %.split.us.1.i
  %81 = phi i64 [ %89, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i ], [ 0, %.split.us.1.i ]
  %82 = icmp slt i64 %81, %60
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i

83:                                               ; preds = %.preheader490.split.2.i
  %84 = add nuw nsw i64 %80, %81
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0228.0.copyload.2.i = load i16, ptr %85, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i: ; preds = %83, %.preheader490.split.2.i
  %.sroa.0230.2.2.i = phi i16 [ %.sroa.0228.0.copyload.2.i, %83 ], [ 0, %.preheader490.split.2.i ]
  %86 = trunc i64 %81 to i32
  %87 = add i32 %86, 64
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %87
  store i16 %.sroa.0230.2.2.i, ptr addrspace(3) %88, align 2, !tbaa.struct !29
  %89 = add nuw nsw i64 %81, 1
  %exitcond.2.not.i = icmp eq i64 %89, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader490.split.2.i, !llvm.loop !32

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i
  %90 = icmp sgt i32 %.fr563.i, 3
  %91 = or disjoint i64 %64, 96
  br i1 %90, label %.preheader490.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %62, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader490.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i, %.split.us.2.i
  %92 = phi i64 [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i ], [ 0, %.split.us.2.i ]
  %93 = icmp slt i64 %92, %60
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i

94:                                               ; preds = %.preheader490.split.3.i
  %95 = add nuw nsw i64 %91, %92
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0228.0.copyload.3.i = load i16, ptr %96, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i: ; preds = %94, %.preheader490.split.3.i
  %.sroa.0230.2.3.i = phi i16 [ %.sroa.0228.0.copyload.3.i, %94 ], [ 0, %.preheader490.split.3.i ]
  %97 = trunc i64 %92 to i32
  %98 = add i32 %97, 96
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %98
  store i16 %.sroa.0230.2.3.i, ptr addrspace(3) %99, align 2, !tbaa.struct !29
  %100 = add nuw nsw i64 %92, 1
  %exitcond.3.not.i = icmp eq i64 %100, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader490.split.3.i, !llvm.loop !32

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i
  %101 = icmp sgt i32 %.fr563.i, 4
  %102 = or disjoint i64 %64, 128
  br i1 %101, label %.preheader490.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %62, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader490.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i, %.split.us.3.i
  %103 = phi i64 [ %111, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i ], [ 0, %.split.us.3.i ]
  %104 = icmp slt i64 %103, %60
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i

105:                                              ; preds = %.preheader490.split.4.i
  %106 = add nuw nsw i64 %102, %103
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0228.0.copyload.4.i = load i16, ptr %107, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i: ; preds = %105, %.preheader490.split.4.i
  %.sroa.0230.2.4.i = phi i16 [ %.sroa.0228.0.copyload.4.i, %105 ], [ 0, %.preheader490.split.4.i ]
  %108 = trunc i64 %103 to i32
  %109 = add i32 %108, 128
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %109
  store i16 %.sroa.0230.2.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  %111 = add nuw nsw i64 %103, 1
  %exitcond.4.not.i = icmp eq i64 %111, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader490.split.4.i, !llvm.loop !32

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i
  %112 = icmp sgt i32 %.fr563.i, 5
  %113 = or disjoint i64 %64, 160
  br i1 %112, label %.preheader490.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %62, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader490.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i, %.split.us.4.i
  %114 = phi i64 [ %122, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i ], [ 0, %.split.us.4.i ]
  %115 = icmp slt i64 %114, %60
  br i1 %115, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i

116:                                              ; preds = %.preheader490.split.5.i
  %117 = add nuw nsw i64 %113, %114
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0228.0.copyload.5.i = load i16, ptr %118, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i: ; preds = %116, %.preheader490.split.5.i
  %.sroa.0230.2.5.i = phi i16 [ %.sroa.0228.0.copyload.5.i, %116 ], [ 0, %.preheader490.split.5.i ]
  %119 = trunc i64 %114 to i32
  %120 = add i32 %119, 160
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %120
  store i16 %.sroa.0230.2.5.i, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  %122 = add nuw nsw i64 %114, 1
  %exitcond.5.not.i = icmp eq i64 %122, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader490.split.5.i, !llvm.loop !32

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i
  %123 = icmp sgt i32 %.fr563.i, 6
  %124 = or disjoint i64 %64, 192
  br i1 %123, label %.preheader490.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %62, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i

.preheader490.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i, %.split.us.5.i
  %125 = phi i64 [ %133, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i ], [ 0, %.split.us.5.i ]
  %126 = icmp slt i64 %125, %60
  br i1 %126, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i

127:                                              ; preds = %.preheader490.split.6.i
  %128 = add nuw nsw i64 %124, %125
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0228.0.copyload.6.i = load i16, ptr %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i: ; preds = %127, %.preheader490.split.6.i
  %.sroa.0230.2.6.i = phi i16 [ %.sroa.0228.0.copyload.6.i, %127 ], [ 0, %.preheader490.split.6.i ]
  %130 = trunc i64 %125 to i32
  %131 = add i32 %130, 192
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %131
  store i16 %.sroa.0230.2.6.i, ptr addrspace(3) %132, align 2, !tbaa.struct !29
  %133 = add nuw nsw i64 %125, 1
  %exitcond.6.not.i = icmp eq i64 %133, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader490.split.6.i, !llvm.loop !32

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i
  %134 = icmp sgt i32 %.fr563.i, 7
  %135 = or disjoint i64 %64, 224
  br i1 %134, label %.preheader490.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %62, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.loopexit492.i

.preheader490.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i, %.split.us.6.i
  %136 = phi i64 [ %144, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i ], [ 0, %.split.us.6.i ]
  %137 = icmp slt i64 %136, %60
  br i1 %137, label %138, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i

138:                                              ; preds = %.preheader490.split.7.i
  %139 = add nuw nsw i64 %135, %136
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %139
  %.sroa.0228.0.copyload.7.i = load i16, ptr %140, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i: ; preds = %138, %.preheader490.split.7.i
  %.sroa.0230.2.7.i = phi i16 [ %.sroa.0228.0.copyload.7.i, %138 ], [ 0, %.preheader490.split.7.i ]
  %141 = trunc i64 %136 to i32
  %142 = add i32 %141, 224
  %143 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %142
  store i16 %.sroa.0230.2.7.i, ptr addrspace(3) %143, align 2, !tbaa.struct !29
  %144 = add nuw nsw i64 %136, 1
  %exitcond.7.not.i = icmp eq i64 %144, 32
  br i1 %exitcond.7.not.i, label %.loopexit492.i, label %.preheader490.split.7.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i: ; preds = %.preheader490.split.preheader.i
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %64
  %.sroa.0228.0.copyload.i = load i16, ptr %145, align 32, !tbaa.struct !29
  store i16 %.sroa.0228.0.copyload.i, ptr addrspace(3) %63, align 2, !tbaa.struct !29
  %.not613.i = icmp eq i32 %5, 1
  br i1 %.not613.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i
  %146 = getelementptr i8, ptr addrspace(3) %62, i32 514
  store i16 0, ptr addrspace(3) %146, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i
  %147 = or disjoint i64 %64, 1
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %147
  %.sroa.0228.0.copyload.1517.i = load i16, ptr %148, align 2, !tbaa.struct !29
  %149 = getelementptr i8, ptr addrspace(3) %62, i32 514
  store i16 %.sroa.0228.0.copyload.1517.i, ptr addrspace(3) %149, align 2, !tbaa.struct !29
  %150 = icmp ugt i32 %5, 2
  br i1 %150, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.thread.i
  %151 = getelementptr i8, ptr addrspace(3) %62, i32 516
  store i16 0, ptr addrspace(3) %151, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1520.i
  %152 = or disjoint i64 %64, 2
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %152
  %.sroa.0228.0.copyload.2522.i = load i16, ptr %153, align 4, !tbaa.struct !29
  %154 = getelementptr i8, ptr addrspace(3) %62, i32 516
  store i16 %.sroa.0228.0.copyload.2522.i, ptr addrspace(3) %154, align 2, !tbaa.struct !29
  %.not614.i = icmp eq i32 %5, 3
  br i1 %.not614.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.thread.i
  %155 = getelementptr i8, ptr addrspace(3) %62, i32 518
  store i16 0, ptr addrspace(3) %155, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2525.i
  %156 = or disjoint i64 %64, 3
  %157 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %156
  %.sroa.0228.0.copyload.3527.i = load i16, ptr %157, align 2, !tbaa.struct !29
  %158 = getelementptr i8, ptr addrspace(3) %62, i32 518
  store i16 %.sroa.0228.0.copyload.3527.i, ptr addrspace(3) %158, align 2, !tbaa.struct !29
  %159 = icmp ugt i32 %5, 4
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.thread.i
  %160 = getelementptr i8, ptr addrspace(3) %62, i32 520
  store i16 0, ptr addrspace(3) %160, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3530.i
  %161 = or disjoint i64 %64, 4
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %161
  %.sroa.0228.0.copyload.4532.i = load i16, ptr %162, align 8, !tbaa.struct !29
  %163 = getelementptr i8, ptr addrspace(3) %62, i32 520
  store i16 %.sroa.0228.0.copyload.4532.i, ptr addrspace(3) %163, align 2, !tbaa.struct !29
  %.not615.i = icmp eq i32 %5, 5
  br i1 %.not615.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.thread.i
  %164 = getelementptr i8, ptr addrspace(3) %62, i32 522
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4535.i
  %165 = or disjoint i64 %64, 5
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0228.0.copyload.5537.i = load i16, ptr %166, align 2, !tbaa.struct !29
  %167 = getelementptr i8, ptr addrspace(3) %62, i32 522
  store i16 %.sroa.0228.0.copyload.5537.i, ptr addrspace(3) %167, align 2, !tbaa.struct !29
  %168 = icmp ugt i32 %5, 6
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.thread.i
  %169 = getelementptr i8, ptr addrspace(3) %62, i32 524
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5540.i
  %170 = or disjoint i64 %64, 6
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0228.0.copyload.6542.i = load i16, ptr %171, align 4, !tbaa.struct !29
  %172 = getelementptr i8, ptr addrspace(3) %62, i32 524
  store i16 %.sroa.0228.0.copyload.6542.i, ptr addrspace(3) %172, align 2, !tbaa.struct !29
  %.not616.i = icmp eq i32 %5, 7
  br i1 %.not616.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.thread.i
  %173 = getelementptr i8, ptr addrspace(3) %62, i32 526
  store i16 0, ptr addrspace(3) %173, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6545.i
  %174 = or disjoint i64 %64, 7
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %174
  %.sroa.0228.0.copyload.7547.i = load i16, ptr %175, align 2, !tbaa.struct !29
  %176 = getelementptr i8, ptr addrspace(3) %62, i32 526
  store i16 %.sroa.0228.0.copyload.7547.i, ptr addrspace(3) %176, align 2, !tbaa.struct !29
  %177 = icmp ugt i32 %5, 8
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.thread.i
  %178 = getelementptr i8, ptr addrspace(3) %62, i32 528
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7550.i
  %179 = or disjoint i64 %64, 8
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %179
  %.sroa.0228.0.copyload.8.i = load i16, ptr %180, align 16, !tbaa.struct !29
  %181 = getelementptr i8, ptr addrspace(3) %62, i32 528
  store i16 %.sroa.0228.0.copyload.8.i, ptr addrspace(3) %181, align 2, !tbaa.struct !29
  %.not617.i = icmp eq i32 %5, 9
  br i1 %.not617.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i
  %182 = getelementptr i8, ptr addrspace(3) %62, i32 530
  store i16 0, ptr addrspace(3) %182, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i
  %183 = or disjoint i64 %64, 9
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %183
  %.sroa.0228.0.copyload.9.i = load i16, ptr %184, align 2, !tbaa.struct !29
  %185 = getelementptr i8, ptr addrspace(3) %62, i32 530
  store i16 %.sroa.0228.0.copyload.9.i, ptr addrspace(3) %185, align 2, !tbaa.struct !29
  %186 = icmp ugt i32 %5, 10
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i
  %187 = getelementptr i8, ptr addrspace(3) %62, i32 532
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i
  %188 = or disjoint i64 %64, 10
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %188
  %.sroa.0228.0.copyload.10.i = load i16, ptr %189, align 4, !tbaa.struct !29
  %190 = getelementptr i8, ptr addrspace(3) %62, i32 532
  store i16 %.sroa.0228.0.copyload.10.i, ptr addrspace(3) %190, align 2, !tbaa.struct !29
  %.not618.i = icmp eq i32 %5, 11
  br i1 %.not618.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i
  %191 = getelementptr i8, ptr addrspace(3) %62, i32 534
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i
  %192 = or disjoint i64 %64, 11
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %192
  %.sroa.0228.0.copyload.11.i = load i16, ptr %193, align 2, !tbaa.struct !29
  %194 = getelementptr i8, ptr addrspace(3) %62, i32 534
  store i16 %.sroa.0228.0.copyload.11.i, ptr addrspace(3) %194, align 2, !tbaa.struct !29
  %195 = icmp ugt i32 %5, 12
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i
  %196 = getelementptr i8, ptr addrspace(3) %62, i32 536
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i
  %197 = or disjoint i64 %64, 12
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0228.0.copyload.12.i = load i16, ptr %198, align 8, !tbaa.struct !29
  %199 = getelementptr i8, ptr addrspace(3) %62, i32 536
  store i16 %.sroa.0228.0.copyload.12.i, ptr addrspace(3) %199, align 2, !tbaa.struct !29
  %.not619.i = icmp eq i32 %5, 13
  br i1 %.not619.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i
  %200 = getelementptr i8, ptr addrspace(3) %62, i32 538
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i
  %201 = or disjoint i64 %64, 13
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %201
  %.sroa.0228.0.copyload.13.i = load i16, ptr %202, align 2, !tbaa.struct !29
  %203 = getelementptr i8, ptr addrspace(3) %62, i32 538
  store i16 %.sroa.0228.0.copyload.13.i, ptr addrspace(3) %203, align 2, !tbaa.struct !29
  %204 = icmp ugt i32 %5, 14
  br i1 %204, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i
  %205 = getelementptr i8, ptr addrspace(3) %62, i32 540
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i
  %206 = or disjoint i64 %64, 14
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %206
  %.sroa.0228.0.copyload.14.i = load i16, ptr %207, align 4, !tbaa.struct !29
  %208 = getelementptr i8, ptr addrspace(3) %62, i32 540
  store i16 %.sroa.0228.0.copyload.14.i, ptr addrspace(3) %208, align 2, !tbaa.struct !29
  %.not620.i = icmp eq i32 %5, 15
  br i1 %.not620.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i
  %209 = getelementptr i8, ptr addrspace(3) %62, i32 542
  store i16 0, ptr addrspace(3) %209, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i
  %210 = or disjoint i64 %64, 15
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %210
  %.sroa.0228.0.copyload.15.i = load i16, ptr %211, align 2, !tbaa.struct !29
  %212 = getelementptr i8, ptr addrspace(3) %62, i32 542
  store i16 %.sroa.0228.0.copyload.15.i, ptr addrspace(3) %212, align 2, !tbaa.struct !29
  %213 = icmp ugt i32 %5, 16
  br i1 %213, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i
  %214 = getelementptr i8, ptr addrspace(3) %62, i32 544
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i
  %215 = or disjoint i64 %64, 16
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %215
  %.sroa.0228.0.copyload.16.i = load i16, ptr %216, align 32, !tbaa.struct !29
  %217 = getelementptr i8, ptr addrspace(3) %62, i32 544
  store i16 %.sroa.0228.0.copyload.16.i, ptr addrspace(3) %217, align 2, !tbaa.struct !29
  %.not621.i = icmp eq i32 %5, 17
  br i1 %.not621.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i
  %218 = getelementptr i8, ptr addrspace(3) %62, i32 546
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i
  %219 = or disjoint i64 %64, 17
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %219
  %.sroa.0228.0.copyload.17.i = load i16, ptr %220, align 2, !tbaa.struct !29
  %221 = getelementptr i8, ptr addrspace(3) %62, i32 546
  store i16 %.sroa.0228.0.copyload.17.i, ptr addrspace(3) %221, align 2, !tbaa.struct !29
  %222 = icmp ugt i32 %5, 18
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i
  %223 = getelementptr i8, ptr addrspace(3) %62, i32 548
  store i16 0, ptr addrspace(3) %223, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i
  %224 = or disjoint i64 %64, 18
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %224
  %.sroa.0228.0.copyload.18.i = load i16, ptr %225, align 4, !tbaa.struct !29
  %226 = getelementptr i8, ptr addrspace(3) %62, i32 548
  store i16 %.sroa.0228.0.copyload.18.i, ptr addrspace(3) %226, align 2, !tbaa.struct !29
  %.not622.i = icmp eq i32 %5, 19
  br i1 %.not622.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i
  %227 = getelementptr i8, ptr addrspace(3) %62, i32 550
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i
  %228 = or disjoint i64 %64, 19
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %228
  %.sroa.0228.0.copyload.19.i = load i16, ptr %229, align 2, !tbaa.struct !29
  %230 = getelementptr i8, ptr addrspace(3) %62, i32 550
  store i16 %.sroa.0228.0.copyload.19.i, ptr addrspace(3) %230, align 2, !tbaa.struct !29
  %231 = icmp ugt i32 %5, 20
  br i1 %231, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i
  %232 = getelementptr i8, ptr addrspace(3) %62, i32 552
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i
  %233 = or disjoint i64 %64, 20
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %233
  %.sroa.0228.0.copyload.20.i = load i16, ptr %234, align 8, !tbaa.struct !29
  %235 = getelementptr i8, ptr addrspace(3) %62, i32 552
  store i16 %.sroa.0228.0.copyload.20.i, ptr addrspace(3) %235, align 2, !tbaa.struct !29
  %.not623.i = icmp eq i32 %5, 21
  br i1 %.not623.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i
  %236 = getelementptr i8, ptr addrspace(3) %62, i32 554
  store i16 0, ptr addrspace(3) %236, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i
  %237 = or disjoint i64 %64, 21
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %237
  %.sroa.0228.0.copyload.21.i = load i16, ptr %238, align 2, !tbaa.struct !29
  %239 = getelementptr i8, ptr addrspace(3) %62, i32 554
  store i16 %.sroa.0228.0.copyload.21.i, ptr addrspace(3) %239, align 2, !tbaa.struct !29
  %240 = icmp ugt i32 %5, 22
  br i1 %240, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i
  %241 = getelementptr i8, ptr addrspace(3) %62, i32 556
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i
  %242 = or disjoint i64 %64, 22
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %242
  %.sroa.0228.0.copyload.22.i = load i16, ptr %243, align 4, !tbaa.struct !29
  %244 = getelementptr i8, ptr addrspace(3) %62, i32 556
  store i16 %.sroa.0228.0.copyload.22.i, ptr addrspace(3) %244, align 2, !tbaa.struct !29
  %.not624.i = icmp eq i32 %5, 23
  br i1 %.not624.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i
  %245 = getelementptr i8, ptr addrspace(3) %62, i32 558
  store i16 0, ptr addrspace(3) %245, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i
  %246 = or disjoint i64 %64, 23
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %246
  %.sroa.0228.0.copyload.23.i = load i16, ptr %247, align 2, !tbaa.struct !29
  %248 = getelementptr i8, ptr addrspace(3) %62, i32 558
  store i16 %.sroa.0228.0.copyload.23.i, ptr addrspace(3) %248, align 2, !tbaa.struct !29
  %249 = icmp ugt i32 %5, 24
  br i1 %249, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i
  %250 = getelementptr i8, ptr addrspace(3) %62, i32 560
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i
  %251 = or disjoint i64 %64, 24
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %251
  %.sroa.0228.0.copyload.24.i = load i16, ptr %252, align 16, !tbaa.struct !29
  %253 = getelementptr i8, ptr addrspace(3) %62, i32 560
  store i16 %.sroa.0228.0.copyload.24.i, ptr addrspace(3) %253, align 2, !tbaa.struct !29
  %.not625.i = icmp eq i32 %5, 25
  br i1 %.not625.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i
  %254 = getelementptr i8, ptr addrspace(3) %62, i32 562
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i
  %255 = or disjoint i64 %64, 25
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %255
  %.sroa.0228.0.copyload.25.i = load i16, ptr %256, align 2, !tbaa.struct !29
  %257 = getelementptr i8, ptr addrspace(3) %62, i32 562
  store i16 %.sroa.0228.0.copyload.25.i, ptr addrspace(3) %257, align 2, !tbaa.struct !29
  %258 = icmp ugt i32 %5, 26
  br i1 %258, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i
  %259 = getelementptr i8, ptr addrspace(3) %62, i32 564
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i
  %260 = or disjoint i64 %64, 26
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %260
  %.sroa.0228.0.copyload.26.i = load i16, ptr %261, align 4, !tbaa.struct !29
  %262 = getelementptr i8, ptr addrspace(3) %62, i32 564
  store i16 %.sroa.0228.0.copyload.26.i, ptr addrspace(3) %262, align 2, !tbaa.struct !29
  %.not626.i = icmp eq i32 %5, 27
  br i1 %.not626.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i
  %263 = getelementptr i8, ptr addrspace(3) %62, i32 566
  store i16 0, ptr addrspace(3) %263, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i
  %264 = or disjoint i64 %64, 27
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %264
  %.sroa.0228.0.copyload.27.i = load i16, ptr %265, align 2, !tbaa.struct !29
  %266 = getelementptr i8, ptr addrspace(3) %62, i32 566
  store i16 %.sroa.0228.0.copyload.27.i, ptr addrspace(3) %266, align 2, !tbaa.struct !29
  %267 = icmp ugt i32 %5, 28
  br i1 %267, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i
  %268 = getelementptr i8, ptr addrspace(3) %62, i32 568
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i
  %269 = or disjoint i64 %64, 28
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %269
  %.sroa.0228.0.copyload.28.i = load i16, ptr %270, align 8, !tbaa.struct !29
  %271 = getelementptr i8, ptr addrspace(3) %62, i32 568
  store i16 %.sroa.0228.0.copyload.28.i, ptr addrspace(3) %271, align 2, !tbaa.struct !29
  %.not627.i = icmp eq i32 %5, 29
  br i1 %.not627.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i
  %272 = getelementptr i8, ptr addrspace(3) %62, i32 570
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i
  %273 = or disjoint i64 %64, 29
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %273
  %.sroa.0228.0.copyload.29.i = load i16, ptr %274, align 2, !tbaa.struct !29
  %275 = getelementptr i8, ptr addrspace(3) %62, i32 570
  store i16 %.sroa.0228.0.copyload.29.i, ptr addrspace(3) %275, align 2, !tbaa.struct !29
  %276 = icmp ugt i32 %5, 30
  br i1 %276, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i
  %277 = getelementptr i8, ptr addrspace(3) %62, i32 572
  store i16 0, ptr addrspace(3) %277, align 2, !tbaa.struct !29
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i
  %278 = or disjoint i64 %64, 30
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %278
  %.sroa.0228.0.copyload.30.i = load i16, ptr %279, align 4, !tbaa.struct !29
  %280 = getelementptr i8, ptr addrspace(3) %62, i32 572
  store i16 %.sroa.0228.0.copyload.30.i, ptr addrspace(3) %280, align 2, !tbaa.struct !29
  %.not628.i = icmp eq i32 %5, 31
  br i1 %.not628.i, label %.split.us.i, label %281

281:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i
  %282 = or disjoint i64 %64, 31
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %282
  %.sroa.0228.0.copyload.31.i = load i16, ptr %283, align 2, !tbaa.struct !29
  br label %.split.us.i

.loopexit492.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i, %56, %52, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %284 = shl i32 %.tr.i, 9
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %285 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %286 = icmp ult i64 %285, 4
  call void @llvm.assume(i1 %286)
  %287 = icmp eq i64 %285, 0
  br i1 %287, label %288, label %.lr.ph504.i

288:                                              ; preds = %.loopexit492.i
  %289 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %290 = icmp ult i64 %289, 4
  call void @llvm.assume(i1 %290)
  %291 = icmp eq i64 %289, 0
  br i1 %291, label %292, label %.lr.ph504.i

292:                                              ; preds = %288
  %293 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %294 = icmp ult i64 %293, 4
  call void @llvm.assume(i1 %294)
  %295 = icmp eq i64 %293, 0
  br i1 %295, label %.preheader489.i, label %.lr.ph504.i

.preheader489.i:                                  ; preds = %292
  %296 = sext i32 %5 to i64
  %297 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %298 = inttoptr i32 %297 to ptr addrspace(3)
  %299 = getelementptr inbounds i8, ptr addrspace(3) %298, i32 1024
  %300 = sext i32 %284 to i64
  %301 = icmp sgt i32 %4, 0
  %302 = icmp ugt i32 %4, 1
  %303 = icmp ugt i32 %4, 2
  %304 = icmp ugt i32 %4, 3
  %305 = icmp ugt i32 %4, 4
  %306 = icmp ugt i32 %4, 5
  %307 = icmp ugt i32 %4, 6
  %308 = icmp ugt i32 %4, 7
  %309 = icmp ugt i32 %4, 8
  %310 = icmp ugt i32 %4, 9
  %311 = icmp ugt i32 %4, 10
  %312 = icmp ugt i32 %4, 11
  %313 = icmp ugt i32 %4, 12
  %314 = icmp ugt i32 %4, 13
  %315 = icmp ugt i32 %4, 14
  %316 = icmp ugt i32 %4, 15
  br label %.preheader488.i

.preheader488.i:                                  ; preds = %.split501.us.i, %.preheader489.i
  %317 = phi i64 [ 0, %.preheader489.i ], [ %327, %.split501.us.i ]
  %318 = icmp slt i64 %317, %296
  %319 = shl i64 %317, 4
  %.tr481.i = trunc i64 %317 to i32
  %320 = shl i32 %.tr481.i, 4
  %321 = sext i32 %320 to i64
  %322 = add nsw i64 %321, %300
  %.fr502.i = freeze i1 %318
  br i1 %.fr502.i, label %.preheader488.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader488.i
  %.tr562.i = trunc i64 %317 to i32
  %323 = shl i32 %.tr562.i, 5
  %324 = add i32 %323, 1024
  %scevgep551.i = getelementptr i8, ptr addrspace(3) %298, i32 %324
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep551.i, i8 0, i32 32, i1 false)
  br label %.split501.us.i

.preheader488.split.preheader.i:                  ; preds = %.preheader488.i
  br i1 %301, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader488.split.preheader.i
  %325 = trunc i64 %319 to i32
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %325
  store i16 0, ptr addrspace(3) %326, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split501.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %327 = add nuw nsw i64 %317, 1
  %exitcond.not.i = icmp eq i64 %327, 32
  br i1 %exitcond.not.i, label %.lr.ph504.i, label %.preheader488.i, !llvm.loop !35

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader488.split.preheader.i
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0217.0.copyload.i = load i16, ptr %328, align 32, !tbaa.struct !29
  %329 = trunc i64 %319 to i32
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %329
  store i16 %.sroa.0217.0.copyload.i, ptr addrspace(3) %330, align 2, !tbaa.struct !29
  br i1 %302, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %331 = trunc i64 %319 to i32
  %332 = or disjoint i32 %331, 1
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %332
  store i16 0, ptr addrspace(3) %333, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %334 = or disjoint i64 %322, 1
  %335 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %334
  %.sroa.0217.0.copyload.1.i = load i16, ptr %335, align 2, !tbaa.struct !29
  %336 = trunc i64 %319 to i32
  %337 = or disjoint i32 %336, 1
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %337
  store i16 %.sroa.0217.0.copyload.1.i, ptr addrspace(3) %338, align 2, !tbaa.struct !29
  br i1 %303, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %339 = trunc i64 %319 to i32
  %340 = or disjoint i32 %339, 2
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %340
  store i16 0, ptr addrspace(3) %341, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %342 = or disjoint i64 %322, 2
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %342
  %.sroa.0217.0.copyload.2.i = load i16, ptr %343, align 4, !tbaa.struct !29
  %344 = trunc i64 %319 to i32
  %345 = or disjoint i32 %344, 2
  %346 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %345
  store i16 %.sroa.0217.0.copyload.2.i, ptr addrspace(3) %346, align 2, !tbaa.struct !29
  br i1 %304, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %347 = trunc i64 %319 to i32
  %348 = or disjoint i32 %347, 3
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %348
  store i16 0, ptr addrspace(3) %349, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %350 = or disjoint i64 %322, 3
  %351 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %350
  %.sroa.0217.0.copyload.3.i = load i16, ptr %351, align 2, !tbaa.struct !29
  %352 = trunc i64 %319 to i32
  %353 = or disjoint i32 %352, 3
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %353
  store i16 %.sroa.0217.0.copyload.3.i, ptr addrspace(3) %354, align 2, !tbaa.struct !29
  br i1 %305, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %355 = trunc i64 %319 to i32
  %356 = or disjoint i32 %355, 4
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %356
  store i16 0, ptr addrspace(3) %357, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %358 = or disjoint i64 %322, 4
  %359 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %358
  %.sroa.0217.0.copyload.4.i = load i16, ptr %359, align 8, !tbaa.struct !29
  %360 = trunc i64 %319 to i32
  %361 = or disjoint i32 %360, 4
  %362 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %361
  store i16 %.sroa.0217.0.copyload.4.i, ptr addrspace(3) %362, align 2, !tbaa.struct !29
  br i1 %306, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %363 = trunc i64 %319 to i32
  %364 = or disjoint i32 %363, 5
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %364
  store i16 0, ptr addrspace(3) %365, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %366 = or disjoint i64 %322, 5
  %367 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %366
  %.sroa.0217.0.copyload.5.i = load i16, ptr %367, align 2, !tbaa.struct !29
  %368 = trunc i64 %319 to i32
  %369 = or disjoint i32 %368, 5
  %370 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %369
  store i16 %.sroa.0217.0.copyload.5.i, ptr addrspace(3) %370, align 2, !tbaa.struct !29
  br i1 %307, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %371 = trunc i64 %319 to i32
  %372 = or disjoint i32 %371, 6
  %373 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %372
  store i16 0, ptr addrspace(3) %373, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %374 = or disjoint i64 %322, 6
  %375 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %374
  %.sroa.0217.0.copyload.6.i = load i16, ptr %375, align 4, !tbaa.struct !29
  %376 = trunc i64 %319 to i32
  %377 = or disjoint i32 %376, 6
  %378 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %377
  store i16 %.sroa.0217.0.copyload.6.i, ptr addrspace(3) %378, align 2, !tbaa.struct !29
  br i1 %308, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %379 = trunc i64 %319 to i32
  %380 = or disjoint i32 %379, 7
  %381 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %380
  store i16 0, ptr addrspace(3) %381, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %382 = or disjoint i64 %322, 7
  %383 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %382
  %.sroa.0217.0.copyload.7.i = load i16, ptr %383, align 2, !tbaa.struct !29
  %384 = trunc i64 %319 to i32
  %385 = or disjoint i32 %384, 7
  %386 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %385
  store i16 %.sroa.0217.0.copyload.7.i, ptr addrspace(3) %386, align 2, !tbaa.struct !29
  br i1 %309, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %387 = trunc i64 %319 to i32
  %388 = or disjoint i32 %387, 8
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %388
  store i16 0, ptr addrspace(3) %389, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %390 = or disjoint i64 %322, 8
  %391 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %390
  %.sroa.0217.0.copyload.8.i = load i16, ptr %391, align 16, !tbaa.struct !29
  %392 = trunc i64 %319 to i32
  %393 = or disjoint i32 %392, 8
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %393
  store i16 %.sroa.0217.0.copyload.8.i, ptr addrspace(3) %394, align 2, !tbaa.struct !29
  br i1 %310, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %395 = trunc i64 %319 to i32
  %396 = or disjoint i32 %395, 9
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %396
  store i16 0, ptr addrspace(3) %397, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %398 = or disjoint i64 %322, 9
  %399 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %398
  %.sroa.0217.0.copyload.9.i = load i16, ptr %399, align 2, !tbaa.struct !29
  %400 = trunc i64 %319 to i32
  %401 = or disjoint i32 %400, 9
  %402 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %401
  store i16 %.sroa.0217.0.copyload.9.i, ptr addrspace(3) %402, align 2, !tbaa.struct !29
  br i1 %311, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %403 = trunc i64 %319 to i32
  %404 = or disjoint i32 %403, 10
  %405 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %404
  store i16 0, ptr addrspace(3) %405, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %406 = or disjoint i64 %322, 10
  %407 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %406
  %.sroa.0217.0.copyload.10.i = load i16, ptr %407, align 4, !tbaa.struct !29
  %408 = trunc i64 %319 to i32
  %409 = or disjoint i32 %408, 10
  %410 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %409
  store i16 %.sroa.0217.0.copyload.10.i, ptr addrspace(3) %410, align 2, !tbaa.struct !29
  br i1 %312, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %411 = trunc i64 %319 to i32
  %412 = or disjoint i32 %411, 11
  %413 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %412
  store i16 0, ptr addrspace(3) %413, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %414 = or disjoint i64 %322, 11
  %415 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %414
  %.sroa.0217.0.copyload.11.i = load i16, ptr %415, align 2, !tbaa.struct !29
  %416 = trunc i64 %319 to i32
  %417 = or disjoint i32 %416, 11
  %418 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %417
  store i16 %.sroa.0217.0.copyload.11.i, ptr addrspace(3) %418, align 2, !tbaa.struct !29
  br i1 %313, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %419 = trunc i64 %319 to i32
  %420 = or disjoint i32 %419, 12
  %421 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %420
  store i16 0, ptr addrspace(3) %421, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %422 = or disjoint i64 %322, 12
  %423 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %422
  %.sroa.0217.0.copyload.12.i = load i16, ptr %423, align 8, !tbaa.struct !29
  %424 = trunc i64 %319 to i32
  %425 = or disjoint i32 %424, 12
  %426 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %425
  store i16 %.sroa.0217.0.copyload.12.i, ptr addrspace(3) %426, align 2, !tbaa.struct !29
  br i1 %314, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %427 = trunc i64 %319 to i32
  %428 = or disjoint i32 %427, 13
  %429 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %428
  store i16 0, ptr addrspace(3) %429, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %430 = or disjoint i64 %322, 13
  %431 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %430
  %.sroa.0217.0.copyload.13.i = load i16, ptr %431, align 2, !tbaa.struct !29
  %432 = trunc i64 %319 to i32
  %433 = or disjoint i32 %432, 13
  %434 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %433
  store i16 %.sroa.0217.0.copyload.13.i, ptr addrspace(3) %434, align 2, !tbaa.struct !29
  br i1 %315, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %435 = trunc i64 %319 to i32
  %436 = or disjoint i32 %435, 14
  %437 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %436
  store i16 0, ptr addrspace(3) %437, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %438 = or disjoint i64 %322, 14
  %439 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %438
  %.sroa.0217.0.copyload.14.i = load i16, ptr %439, align 4, !tbaa.struct !29
  %440 = trunc i64 %319 to i32
  %441 = or disjoint i32 %440, 14
  %442 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %441
  store i16 %.sroa.0217.0.copyload.14.i, ptr addrspace(3) %442, align 2, !tbaa.struct !29
  br i1 %316, label %443, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

443:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %444 = or disjoint i64 %322, 15
  %445 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %444
  %.sroa.0217.0.copyload.15.i = load i16, ptr %445, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %443, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0219.2.15.i = phi i16 [ %.sroa.0217.0.copyload.15.i, %443 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %446 = trunc i64 %319 to i32
  %447 = or disjoint i32 %446, 15
  %448 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %447
  store i16 %.sroa.0219.2.15.i, ptr addrspace(3) %448, align 2, !tbaa.struct !29
  br label %.split501.us.i

.lr.ph504.i:                                      ; preds = %.split501.us.i, %292, %288, %.loopexit492.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %449 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %450 = icmp ult i64 %449, 4
  call void @llvm.assume(i1 %450)
  %451 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %452 = icmp ult i64 %451, 4
  call void @llvm.assume(i1 %452)
  %453 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %454 = icmp ult i64 %453, 4
  call void @llvm.assume(i1 %454)
  %455 = shl nuw nsw i64 %453, 4
  %456 = shl nuw nsw i64 %451, 2
  %457 = or disjoint i64 %455, %456
  %458 = or disjoint i64 %457, %449
  %459 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %460 = inttoptr i32 %459 to ptr addrspace(3)
  %461 = getelementptr inbounds i8, ptr addrspace(3) %460, i32 512
  %462 = getelementptr inbounds i8, ptr addrspace(3) %460, i32 1024
  br label %467

._crit_edge505.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %463 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %464 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %465 = icmp ult i64 %464, 4
  call void @llvm.assume(i1 %465)
  %466 = icmp eq i64 %464, 0
  br i1 %466, label %564, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

467:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph504.i
  %468 = phi i64 [ %458, %.lr.ph504.i ], [ %483, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %.frozen.i = freeze i64 %468
  %469 = sdiv i64 %.frozen.i, 8
  %470 = srem i64 %469, 8
  %471 = mul i64 %469, 8
  %.decomposed.i = sub i64 %.frozen.i, %471
  %472 = shl nsw i64 %470, 4
  %473 = add nsw i64 %472, %.decomposed.i
  %474 = trunc i64 %473 to i32
  %475 = getelementptr inbounds float, ptr addrspace(3) %460, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !23
  %477 = add nsw i64 %.decomposed.i, 8
  %478 = add nuw nsw i64 %472, %477
  %479 = trunc i64 %478 to i32
  %480 = getelementptr inbounds float, ptr addrspace(3) %460, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !23
  %482 = shl nsw i64 %470, 5
  br label %485

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %537, ptr addrspace(3) %475, align 4, !tbaa !23
  store float %562, ptr addrspace(3) %480, align 4, !tbaa !23
  %483 = add i64 %468, 64
  %484 = icmp ugt i64 %468, 9223372036854775743
  br i1 %484, label %467, label %._crit_edge505.i, !llvm.loop !36

485:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %467
  %486 = phi i64 [ 0, %467 ], [ %563, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %487 = phi float [ %481, %467 ], [ %562, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %488 = phi float [ %476, %467 ], [ %537, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %489 = add nuw nsw i64 %486, %482
  %490 = trunc i64 %489 to i32
  %491 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %461, i32 %490
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %491, align 2, !tbaa.struct !29
  %492 = shl nuw nsw i64 %486, 4
  %493 = add nsw i64 %492, %.decomposed.i
  %494 = trunc i64 %493 to i32
  %495 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %462, i32 %494
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %495, align 2, !tbaa.struct !29
  %496 = zext i16 %.sroa.0194.0.copyload.i to i32
  %497 = lshr i32 %496, 10
  %498 = and i32 %497, 31
  %499 = and i32 %496, 1023
  switch i32 %498, label %505 [
    i32 31, label %500
    i32 0, label %507
  ]

500:                                              ; preds = %485
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %501 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not480.i = icmp eq i32 %499, 0
  %502 = select i1 %.not480.i, i32 2139095040, i32 2143289344
  %503 = or disjoint i32 %502, %501
  %504 = bitcast i32 %503 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

505:                                              ; preds = %485
  %506 = or disjoint i32 %499, 1024
  br label %507

507:                                              ; preds = %505, %485
  %508 = phi i32 [ %506, %505 ], [ %499, %485 ]
  %509 = uitofp i32 %508 to float
  %.not.i = icmp eq i32 %498, 0
  %510 = add nsw i32 %498, -25
  %511 = select i1 %.not.i, i32 -24, i32 %510
  %512 = call float @__ocml_ldexp_f32(float noundef %509, i32 noundef %511) #6
  %513 = fneg contract float %512
  %.not470471.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %514 = select contract i1 %.not470471.i, float %513, float %512
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %507, %500
  %515 = phi float [ %504, %500 ], [ %514, %507 ]
  %516 = zext i16 %.sroa.0185.0.copyload.i to i32
  %517 = lshr i32 %516, 10
  %518 = and i32 %517, 31
  %519 = and i32 %516, 1023
  switch i32 %518, label %525 [
    i32 31, label %520
    i32 0, label %527
  ]

520:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %521 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not479.i = icmp eq i32 %519, 0
  %522 = select i1 %.not479.i, i32 2139095040, i32 2143289344
  %523 = or disjoint i32 %522, %521
  %524 = bitcast i32 %523 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

525:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %526 = or disjoint i32 %519, 1024
  br label %527

527:                                              ; preds = %525, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %528 = phi i32 [ %526, %525 ], [ %519, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %529 = uitofp i32 %528 to float
  %.not472.i = icmp eq i32 %518, 0
  %530 = add nsw i32 %518, -25
  %531 = select i1 %.not472.i, i32 -24, i32 %530
  %532 = call float @__ocml_ldexp_f32(float noundef %529, i32 noundef %531) #6
  %533 = fneg contract float %532
  %.not473474.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %534 = select contract i1 %.not473474.i, float %533, float %532
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %527, %520
  %535 = phi float [ %524, %520 ], [ %534, %527 ]
  %536 = fmul contract float %515, %535
  %537 = fadd contract float %488, %536
  %538 = add nuw nsw i64 %492, %477
  %539 = trunc i64 %538 to i32
  %540 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %462, i32 %539
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %540, align 2, !tbaa.struct !29
  %541 = zext i16 %.sroa.0176.0.copyload.i to i32
  %542 = lshr i32 %541, 10
  %543 = and i32 %542, 31
  %544 = and i32 %541, 1023
  switch i32 %543, label %550 [
    i32 31, label %545
    i32 0, label %552
  ]

545:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %546 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not478.i = icmp eq i32 %544, 0
  %547 = select i1 %.not478.i, i32 2139095040, i32 2143289344
  %548 = or disjoint i32 %547, %546
  %549 = bitcast i32 %548 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

550:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %551 = or disjoint i32 %544, 1024
  br label %552

552:                                              ; preds = %550, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %553 = phi i32 [ %551, %550 ], [ %544, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %554 = uitofp i32 %553 to float
  %.not475.i = icmp eq i32 %543, 0
  %555 = add nsw i32 %543, -25
  %556 = select i1 %.not475.i, i32 -24, i32 %555
  %557 = call float @__ocml_ldexp_f32(float noundef %554, i32 noundef %556) #6
  %558 = fneg contract float %557
  %.not476477.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %559 = select contract i1 %.not476477.i, float %558, float %557
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %552, %545
  %560 = phi float [ %549, %545 ], [ %559, %552 ]
  %561 = fmul contract float %515, %560
  %562 = fadd contract float %487, %561
  %563 = add nuw nsw i64 %486, 1
  %exitcond559.not.i = icmp eq i64 %563, 32
  br i1 %exitcond559.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %485, !llvm.loop !37

564:                                              ; preds = %._crit_edge505.i
  %565 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %566 = icmp ult i64 %565, 4
  call void @llvm.assume(i1 %566)
  %567 = icmp eq i64 %565, 0
  br i1 %567, label %568, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

568:                                              ; preds = %564
  %569 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %570 = icmp ult i64 %569, 4
  call void @llvm.assume(i1 %570)
  %571 = icmp eq i64 %569, 0
  br i1 %571, label %.preheader487.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader487.i:                                  ; preds = %568
  %572 = sext i32 %.fr563.i to i64
  %573 = call i32 @llvm.amdgcn.groupstaticsize()
  %574 = inttoptr i32 %573 to ptr addrspace(3)
  %575 = sext i32 %463 to i64
  %576 = icmp slt i32 %4, 1
  %577 = icmp ugt i32 %4, 1
  %578 = icmp ugt i32 %4, 2
  %579 = icmp ugt i32 %4, 3
  %580 = icmp ugt i32 %4, 4
  %581 = icmp ugt i32 %4, 5
  %582 = icmp ugt i32 %4, 6
  %583 = icmp ugt i32 %4, 7
  %584 = icmp ugt i32 %4, 8
  %585 = icmp ugt i32 %4, 9
  %586 = icmp ugt i32 %4, 10
  %587 = icmp ugt i32 %4, 11
  %588 = icmp ugt i32 %4, 12
  %589 = icmp ugt i32 %4, 13
  %590 = icmp ugt i32 %4, 14
  %591 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split507.us.i, %.preheader487.i
  %592 = phi i64 [ 0, %.preheader487.i ], [ %598, %.split507.us.i ]
  %593 = icmp sge i64 %592, %572
  %594 = shl i64 %592, 4
  %.tr469.i = trunc i64 %592 to i32
  %595 = shl i32 %.tr469.i, 4
  %596 = sext i32 %595 to i64
  %597 = add nsw i64 %596, %575
  %brmerge.i = select i1 %593, i1 true, i1 %576
  br i1 %brmerge.i, label %.split507.us.i, label %.preheader.split.1.i

.split507.us.i:                                   ; preds = %687, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %598 = add i64 %592, 1
  %exitcond561.not.i = icmp eq i64 %598, 8
  br i1 %exitcond561.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %599 = trunc i64 %594 to i32
  %600 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %599
  %601 = load float, ptr addrspace(3) %600, align 4, !tbaa !23
  %602 = getelementptr inbounds float, ptr %9, i64 %597
  store float %601, ptr %602, align 32, !tbaa !23
  br i1 %577, label %.preheader.split.2.i, label %.split507.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %603 = trunc i64 %594 to i32
  %604 = or disjoint i32 %603, 1
  %605 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %604
  %606 = load float, ptr addrspace(3) %605, align 4, !tbaa !23
  %607 = or disjoint i64 %597, 1
  %608 = getelementptr inbounds float, ptr %9, i64 %607
  store float %606, ptr %608, align 4, !tbaa !23
  br i1 %578, label %.preheader.split.3.i, label %.split507.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %609 = trunc i64 %594 to i32
  %610 = or disjoint i32 %609, 2
  %611 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %610
  %612 = load float, ptr addrspace(3) %611, align 4, !tbaa !23
  %613 = or disjoint i64 %597, 2
  %614 = getelementptr inbounds float, ptr %9, i64 %613
  store float %612, ptr %614, align 8, !tbaa !23
  br i1 %579, label %.preheader.split.4.i, label %.split507.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %615 = trunc i64 %594 to i32
  %616 = or disjoint i32 %615, 3
  %617 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %616
  %618 = load float, ptr addrspace(3) %617, align 4, !tbaa !23
  %619 = or disjoint i64 %597, 3
  %620 = getelementptr inbounds float, ptr %9, i64 %619
  store float %618, ptr %620, align 4, !tbaa !23
  br i1 %580, label %.preheader.split.5.i, label %.split507.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %621 = trunc i64 %594 to i32
  %622 = or disjoint i32 %621, 4
  %623 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %622
  %624 = load float, ptr addrspace(3) %623, align 4, !tbaa !23
  %625 = or disjoint i64 %597, 4
  %626 = getelementptr inbounds float, ptr %9, i64 %625
  store float %624, ptr %626, align 16, !tbaa !23
  br i1 %581, label %.preheader.split.6.i, label %.split507.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %627 = trunc i64 %594 to i32
  %628 = or disjoint i32 %627, 5
  %629 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %628
  %630 = load float, ptr addrspace(3) %629, align 4, !tbaa !23
  %631 = or disjoint i64 %597, 5
  %632 = getelementptr inbounds float, ptr %9, i64 %631
  store float %630, ptr %632, align 4, !tbaa !23
  br i1 %582, label %.preheader.split.7.i, label %.split507.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %633 = trunc i64 %594 to i32
  %634 = or disjoint i32 %633, 6
  %635 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %634
  %636 = load float, ptr addrspace(3) %635, align 4, !tbaa !23
  %637 = or disjoint i64 %597, 6
  %638 = getelementptr inbounds float, ptr %9, i64 %637
  store float %636, ptr %638, align 8, !tbaa !23
  br i1 %583, label %.preheader.split.8.i, label %.split507.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %639 = trunc i64 %594 to i32
  %640 = or disjoint i32 %639, 7
  %641 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %640
  %642 = load float, ptr addrspace(3) %641, align 4, !tbaa !23
  %643 = or disjoint i64 %597, 7
  %644 = getelementptr inbounds float, ptr %9, i64 %643
  store float %642, ptr %644, align 4, !tbaa !23
  br i1 %584, label %.preheader.split.9.i, label %.split507.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %645 = trunc i64 %594 to i32
  %646 = or disjoint i32 %645, 8
  %647 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %646
  %648 = load float, ptr addrspace(3) %647, align 4, !tbaa !23
  %649 = or disjoint i64 %597, 8
  %650 = getelementptr inbounds float, ptr %9, i64 %649
  store float %648, ptr %650, align 32, !tbaa !23
  br i1 %585, label %.preheader.split.10.i, label %.split507.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %651 = trunc i64 %594 to i32
  %652 = or disjoint i32 %651, 9
  %653 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %652
  %654 = load float, ptr addrspace(3) %653, align 4, !tbaa !23
  %655 = or disjoint i64 %597, 9
  %656 = getelementptr inbounds float, ptr %9, i64 %655
  store float %654, ptr %656, align 4, !tbaa !23
  br i1 %586, label %.preheader.split.11.i, label %.split507.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %657 = trunc i64 %594 to i32
  %658 = or disjoint i32 %657, 10
  %659 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %658
  %660 = load float, ptr addrspace(3) %659, align 4, !tbaa !23
  %661 = or disjoint i64 %597, 10
  %662 = getelementptr inbounds float, ptr %9, i64 %661
  store float %660, ptr %662, align 8, !tbaa !23
  br i1 %587, label %.preheader.split.12.i, label %.split507.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %663 = trunc i64 %594 to i32
  %664 = or disjoint i32 %663, 11
  %665 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %664
  %666 = load float, ptr addrspace(3) %665, align 4, !tbaa !23
  %667 = or disjoint i64 %597, 11
  %668 = getelementptr inbounds float, ptr %9, i64 %667
  store float %666, ptr %668, align 4, !tbaa !23
  br i1 %588, label %.preheader.split.13.i, label %.split507.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %669 = trunc i64 %594 to i32
  %670 = or disjoint i32 %669, 12
  %671 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %670
  %672 = load float, ptr addrspace(3) %671, align 4, !tbaa !23
  %673 = or disjoint i64 %597, 12
  %674 = getelementptr inbounds float, ptr %9, i64 %673
  store float %672, ptr %674, align 16, !tbaa !23
  br i1 %589, label %.preheader.split.14.i, label %.split507.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %675 = trunc i64 %594 to i32
  %676 = or disjoint i32 %675, 13
  %677 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %676
  %678 = load float, ptr addrspace(3) %677, align 4, !tbaa !23
  %679 = or disjoint i64 %597, 13
  %680 = getelementptr inbounds float, ptr %9, i64 %679
  store float %678, ptr %680, align 4, !tbaa !23
  br i1 %590, label %.preheader.split.15.i, label %.split507.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %681 = trunc i64 %594 to i32
  %682 = or disjoint i32 %681, 14
  %683 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %682
  %684 = load float, ptr addrspace(3) %683, align 4, !tbaa !23
  %685 = or disjoint i64 %597, 14
  %686 = getelementptr inbounds float, ptr %9, i64 %685
  store float %684, ptr %686, align 8, !tbaa !23
  br i1 %591, label %687, label %.split507.us.i

687:                                              ; preds = %.preheader.split.15.i
  %688 = trunc i64 %594 to i32
  %689 = or disjoint i32 %688, 15
  %690 = getelementptr inbounds float, ptr addrspace(3) %574, i32 %689
  %691 = load float, ptr addrspace(3) %690, align 4, !tbaa !23
  %692 = or disjoint i64 %597, 15
  %693 = getelementptr inbounds float, ptr %9, i64 %692
  store float %691, ptr %693, align 4, !tbaa !23
  br label %.split507.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge505.i, %564, %568, %.split507.us.i
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
!38 = distinct !{!38, !28}
;----------------- End AdaptiveCpp IR dump ---------------
