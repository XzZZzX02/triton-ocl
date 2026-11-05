;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882026/tmp/triton-sycl-cache/compile-66yg2pe9/kernel.cpp"
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
  %.fr556.i = freeze i32 %3
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
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 64
  call void @llvm.assume(i1 %39)
  %40 = icmp eq i64 %38, 0
  br i1 %40, label %.preheader488.i, label %.loopexit489.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !23
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !27

.preheader488.i:                                  ; preds = %._crit_edge.i
  %46 = shl i32 %.tr.i, 8
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %50 = icmp eq i64 %49, 0
  call void @llvm.assume(i1 %50)
  %51 = sext i32 %5 to i64
  %52 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %53 = inttoptr i32 %52 to ptr addrspace(3)
  %54 = getelementptr i8, ptr addrspace(3) %53, i32 512
  %55 = sext i32 %46 to i64
  %56 = icmp sgt i32 %.fr556.i, 0
  br i1 %56, label %.preheader488.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader488.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %54, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader488.split.preheader.i:                  ; preds = %.preheader488.i
  %57 = icmp sgt i32 %5, 0
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i: ; preds = %.preheader488.split.preheader.i
  store i16 0, ptr addrspace(3) %54, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.thread.i

.split.us.i:                                      ; preds = %272, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i
  %.sroa.0230.2.31.i = phi i16 [ %.sroa.0228.0.copyload.31.i, %272 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i ]
  %58 = getelementptr i8, ptr addrspace(3) %53, i32 574
  store i16 %.sroa.0230.2.31.i, ptr addrspace(3) %58, align 2, !tbaa.struct !29
  %59 = icmp ugt i32 %.fr556.i, 1
  %60 = or disjoint i64 %55, 32
  br i1 %59, label %.preheader488.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %53, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader488.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i, %.split.us.i
  %61 = phi i64 [ %69, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i ], [ 0, %.split.us.i ]
  %62 = icmp slt i64 %61, %51
  br i1 %62, label %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i

63:                                               ; preds = %.preheader488.split.1.i
  %64 = add nuw nsw i64 %60, %61
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %64
  %.sroa.0228.0.copyload.1.i = load i16, ptr %65, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i: ; preds = %63, %.preheader488.split.1.i
  %.sroa.0230.2.1.i = phi i16 [ %.sroa.0228.0.copyload.1.i, %63 ], [ 0, %.preheader488.split.1.i ]
  %66 = trunc i64 %61 to i32
  %67 = add i32 %66, 32
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %67
  store i16 %.sroa.0230.2.1.i, ptr addrspace(3) %68, align 2, !tbaa.struct !29
  %69 = add nuw nsw i64 %61, 1
  %exitcond.1.not.i = icmp eq i64 %69, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader488.split.1.i, !llvm.loop !32

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1.i
  %70 = icmp sgt i32 %.fr556.i, 2
  %71 = or disjoint i64 %55, 64
  br i1 %70, label %.preheader488.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %53, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader488.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i, %.split.us.1.i
  %72 = phi i64 [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i ], [ 0, %.split.us.1.i ]
  %73 = icmp slt i64 %72, %51
  br i1 %73, label %74, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i

74:                                               ; preds = %.preheader488.split.2.i
  %75 = add nuw nsw i64 %71, %72
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %75
  %.sroa.0228.0.copyload.2.i = load i16, ptr %76, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i: ; preds = %74, %.preheader488.split.2.i
  %.sroa.0230.2.2.i = phi i16 [ %.sroa.0228.0.copyload.2.i, %74 ], [ 0, %.preheader488.split.2.i ]
  %77 = trunc i64 %72 to i32
  %78 = add i32 %77, 64
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %78
  store i16 %.sroa.0230.2.2.i, ptr addrspace(3) %79, align 2, !tbaa.struct !29
  %80 = add nuw nsw i64 %72, 1
  %exitcond.2.not.i = icmp eq i64 %80, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader488.split.2.i, !llvm.loop !32

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2.i
  %81 = icmp sgt i32 %.fr556.i, 3
  %82 = or disjoint i64 %55, 96
  br i1 %81, label %.preheader488.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %53, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader488.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i, %.split.us.2.i
  %83 = phi i64 [ %91, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i ], [ 0, %.split.us.2.i ]
  %84 = icmp slt i64 %83, %51
  br i1 %84, label %85, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i

85:                                               ; preds = %.preheader488.split.3.i
  %86 = add nuw nsw i64 %82, %83
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %86
  %.sroa.0228.0.copyload.3.i = load i16, ptr %87, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i: ; preds = %85, %.preheader488.split.3.i
  %.sroa.0230.2.3.i = phi i16 [ %.sroa.0228.0.copyload.3.i, %85 ], [ 0, %.preheader488.split.3.i ]
  %88 = trunc i64 %83 to i32
  %89 = add i32 %88, 96
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %89
  store i16 %.sroa.0230.2.3.i, ptr addrspace(3) %90, align 2, !tbaa.struct !29
  %91 = add nuw nsw i64 %83, 1
  %exitcond.3.not.i = icmp eq i64 %91, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader488.split.3.i, !llvm.loop !32

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3.i
  %92 = icmp sgt i32 %.fr556.i, 4
  %93 = or disjoint i64 %55, 128
  br i1 %92, label %.preheader488.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %53, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader488.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i, %.split.us.3.i
  %94 = phi i64 [ %102, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i ], [ 0, %.split.us.3.i ]
  %95 = icmp slt i64 %94, %51
  br i1 %95, label %96, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i

96:                                               ; preds = %.preheader488.split.4.i
  %97 = add nuw nsw i64 %93, %94
  %98 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %97
  %.sroa.0228.0.copyload.4.i = load i16, ptr %98, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i: ; preds = %96, %.preheader488.split.4.i
  %.sroa.0230.2.4.i = phi i16 [ %.sroa.0228.0.copyload.4.i, %96 ], [ 0, %.preheader488.split.4.i ]
  %99 = trunc i64 %94 to i32
  %100 = add i32 %99, 128
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %100
  store i16 %.sroa.0230.2.4.i, ptr addrspace(3) %101, align 2, !tbaa.struct !29
  %102 = add nuw nsw i64 %94, 1
  %exitcond.4.not.i = icmp eq i64 %102, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader488.split.4.i, !llvm.loop !32

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4.i
  %103 = icmp sgt i32 %.fr556.i, 5
  %104 = or disjoint i64 %55, 160
  br i1 %103, label %.preheader488.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %53, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader488.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i, %.split.us.4.i
  %105 = phi i64 [ %113, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i ], [ 0, %.split.us.4.i ]
  %106 = icmp slt i64 %105, %51
  br i1 %106, label %107, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i

107:                                              ; preds = %.preheader488.split.5.i
  %108 = add nuw nsw i64 %104, %105
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %108
  %.sroa.0228.0.copyload.5.i = load i16, ptr %109, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i: ; preds = %107, %.preheader488.split.5.i
  %.sroa.0230.2.5.i = phi i16 [ %.sroa.0228.0.copyload.5.i, %107 ], [ 0, %.preheader488.split.5.i ]
  %110 = trunc i64 %105 to i32
  %111 = add i32 %110, 160
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %111
  store i16 %.sroa.0230.2.5.i, ptr addrspace(3) %112, align 2, !tbaa.struct !29
  %113 = add nuw nsw i64 %105, 1
  %exitcond.5.not.i = icmp eq i64 %113, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader488.split.5.i, !llvm.loop !32

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5.i
  %114 = icmp sgt i32 %.fr556.i, 6
  %115 = or disjoint i64 %55, 192
  br i1 %114, label %.preheader488.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %53, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i

.preheader488.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i, %.split.us.5.i
  %116 = phi i64 [ %124, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i ], [ 0, %.split.us.5.i ]
  %117 = icmp slt i64 %116, %51
  br i1 %117, label %118, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i

118:                                              ; preds = %.preheader488.split.6.i
  %119 = add nuw nsw i64 %115, %116
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0228.0.copyload.6.i = load i16, ptr %120, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i: ; preds = %118, %.preheader488.split.6.i
  %.sroa.0230.2.6.i = phi i16 [ %.sroa.0228.0.copyload.6.i, %118 ], [ 0, %.preheader488.split.6.i ]
  %121 = trunc i64 %116 to i32
  %122 = add i32 %121, 192
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %122
  store i16 %.sroa.0230.2.6.i, ptr addrspace(3) %123, align 2, !tbaa.struct !29
  %124 = add nuw nsw i64 %116, 1
  %exitcond.6.not.i = icmp eq i64 %124, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader488.split.6.i, !llvm.loop !32

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6.i
  %125 = icmp sgt i32 %.fr556.i, 7
  %126 = or disjoint i64 %55, 224
  br i1 %125, label %.preheader488.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %53, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.loopexit489.i

.preheader488.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i, %.split.us.6.i
  %127 = phi i64 [ %135, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i ], [ 0, %.split.us.6.i ]
  %128 = icmp slt i64 %127, %51
  br i1 %128, label %129, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i

129:                                              ; preds = %.preheader488.split.7.i
  %130 = add nuw nsw i64 %126, %127
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %130
  %.sroa.0228.0.copyload.7.i = load i16, ptr %131, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i: ; preds = %129, %.preheader488.split.7.i
  %.sroa.0230.2.7.i = phi i16 [ %.sroa.0228.0.copyload.7.i, %129 ], [ 0, %.preheader488.split.7.i ]
  %132 = trunc i64 %127 to i32
  %133 = add i32 %132, 224
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %133
  store i16 %.sroa.0230.2.7.i, ptr addrspace(3) %134, align 2, !tbaa.struct !29
  %135 = add nuw nsw i64 %127, 1
  %exitcond.7.not.i = icmp eq i64 %135, 32
  br i1 %exitcond.7.not.i, label %.loopexit489.i, label %.preheader488.split.7.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i: ; preds = %.preheader488.split.preheader.i
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %55
  %.sroa.0228.0.copyload.i = load i16, ptr %136, align 32, !tbaa.struct !29
  store i16 %.sroa.0228.0.copyload.i, ptr addrspace(3) %54, align 2, !tbaa.struct !29
  %.not606.i = icmp eq i32 %5, 1
  br i1 %.not606.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.thread.i
  %137 = getelementptr i8, ptr addrspace(3) %53, i32 514
  store i16 0, ptr addrspace(3) %137, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.i
  %138 = or disjoint i64 %55, 1
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %138
  %.sroa.0228.0.copyload.1510.i = load i16, ptr %139, align 2, !tbaa.struct !29
  %140 = getelementptr i8, ptr addrspace(3) %53, i32 514
  store i16 %.sroa.0228.0.copyload.1510.i, ptr addrspace(3) %140, align 2, !tbaa.struct !29
  %141 = icmp ugt i32 %5, 2
  br i1 %141, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.thread.i
  %142 = getelementptr i8, ptr addrspace(3) %53, i32 516
  store i16 0, ptr addrspace(3) %142, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.1513.i
  %143 = or disjoint i64 %55, 2
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %143
  %.sroa.0228.0.copyload.2515.i = load i16, ptr %144, align 4, !tbaa.struct !29
  %145 = getelementptr i8, ptr addrspace(3) %53, i32 516
  store i16 %.sroa.0228.0.copyload.2515.i, ptr addrspace(3) %145, align 2, !tbaa.struct !29
  %.not607.i = icmp eq i32 %5, 3
  br i1 %.not607.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.thread.i
  %146 = getelementptr i8, ptr addrspace(3) %53, i32 518
  store i16 0, ptr addrspace(3) %146, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.2518.i
  %147 = or disjoint i64 %55, 3
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %147
  %.sroa.0228.0.copyload.3520.i = load i16, ptr %148, align 2, !tbaa.struct !29
  %149 = getelementptr i8, ptr addrspace(3) %53, i32 518
  store i16 %.sroa.0228.0.copyload.3520.i, ptr addrspace(3) %149, align 2, !tbaa.struct !29
  %150 = icmp ugt i32 %5, 4
  br i1 %150, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.thread.i
  %151 = getelementptr i8, ptr addrspace(3) %53, i32 520
  store i16 0, ptr addrspace(3) %151, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.3523.i
  %152 = or disjoint i64 %55, 4
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %152
  %.sroa.0228.0.copyload.4525.i = load i16, ptr %153, align 8, !tbaa.struct !29
  %154 = getelementptr i8, ptr addrspace(3) %53, i32 520
  store i16 %.sroa.0228.0.copyload.4525.i, ptr addrspace(3) %154, align 2, !tbaa.struct !29
  %.not608.i = icmp eq i32 %5, 5
  br i1 %.not608.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.thread.i
  %155 = getelementptr i8, ptr addrspace(3) %53, i32 522
  store i16 0, ptr addrspace(3) %155, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.4528.i
  %156 = or disjoint i64 %55, 5
  %157 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %156
  %.sroa.0228.0.copyload.5530.i = load i16, ptr %157, align 2, !tbaa.struct !29
  %158 = getelementptr i8, ptr addrspace(3) %53, i32 522
  store i16 %.sroa.0228.0.copyload.5530.i, ptr addrspace(3) %158, align 2, !tbaa.struct !29
  %159 = icmp ugt i32 %5, 6
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.thread.i
  %160 = getelementptr i8, ptr addrspace(3) %53, i32 524
  store i16 0, ptr addrspace(3) %160, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.5533.i
  %161 = or disjoint i64 %55, 6
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %161
  %.sroa.0228.0.copyload.6535.i = load i16, ptr %162, align 4, !tbaa.struct !29
  %163 = getelementptr i8, ptr addrspace(3) %53, i32 524
  store i16 %.sroa.0228.0.copyload.6535.i, ptr addrspace(3) %163, align 2, !tbaa.struct !29
  %.not609.i = icmp eq i32 %5, 7
  br i1 %.not609.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.thread.i
  %164 = getelementptr i8, ptr addrspace(3) %53, i32 526
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.6538.i
  %165 = or disjoint i64 %55, 7
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0228.0.copyload.7540.i = load i16, ptr %166, align 2, !tbaa.struct !29
  %167 = getelementptr i8, ptr addrspace(3) %53, i32 526
  store i16 %.sroa.0228.0.copyload.7540.i, ptr addrspace(3) %167, align 2, !tbaa.struct !29
  %168 = icmp ugt i32 %5, 8
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.thread.i
  %169 = getelementptr i8, ptr addrspace(3) %53, i32 528
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7543.i
  %170 = or disjoint i64 %55, 8
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0228.0.copyload.8.i = load i16, ptr %171, align 16, !tbaa.struct !29
  %172 = getelementptr i8, ptr addrspace(3) %53, i32 528
  store i16 %.sroa.0228.0.copyload.8.i, ptr addrspace(3) %172, align 2, !tbaa.struct !29
  %.not610.i = icmp eq i32 %5, 9
  br i1 %.not610.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.thread.i
  %173 = getelementptr i8, ptr addrspace(3) %53, i32 530
  store i16 0, ptr addrspace(3) %173, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.8.i
  %174 = or disjoint i64 %55, 9
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %174
  %.sroa.0228.0.copyload.9.i = load i16, ptr %175, align 2, !tbaa.struct !29
  %176 = getelementptr i8, ptr addrspace(3) %53, i32 530
  store i16 %.sroa.0228.0.copyload.9.i, ptr addrspace(3) %176, align 2, !tbaa.struct !29
  %177 = icmp ugt i32 %5, 10
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.thread.i
  %178 = getelementptr i8, ptr addrspace(3) %53, i32 532
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.9.i
  %179 = or disjoint i64 %55, 10
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %179
  %.sroa.0228.0.copyload.10.i = load i16, ptr %180, align 4, !tbaa.struct !29
  %181 = getelementptr i8, ptr addrspace(3) %53, i32 532
  store i16 %.sroa.0228.0.copyload.10.i, ptr addrspace(3) %181, align 2, !tbaa.struct !29
  %.not611.i = icmp eq i32 %5, 11
  br i1 %.not611.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.thread.i
  %182 = getelementptr i8, ptr addrspace(3) %53, i32 534
  store i16 0, ptr addrspace(3) %182, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.10.i
  %183 = or disjoint i64 %55, 11
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %183
  %.sroa.0228.0.copyload.11.i = load i16, ptr %184, align 2, !tbaa.struct !29
  %185 = getelementptr i8, ptr addrspace(3) %53, i32 534
  store i16 %.sroa.0228.0.copyload.11.i, ptr addrspace(3) %185, align 2, !tbaa.struct !29
  %186 = icmp ugt i32 %5, 12
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.thread.i
  %187 = getelementptr i8, ptr addrspace(3) %53, i32 536
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.11.i
  %188 = or disjoint i64 %55, 12
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %188
  %.sroa.0228.0.copyload.12.i = load i16, ptr %189, align 8, !tbaa.struct !29
  %190 = getelementptr i8, ptr addrspace(3) %53, i32 536
  store i16 %.sroa.0228.0.copyload.12.i, ptr addrspace(3) %190, align 2, !tbaa.struct !29
  %.not612.i = icmp eq i32 %5, 13
  br i1 %.not612.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.thread.i
  %191 = getelementptr i8, ptr addrspace(3) %53, i32 538
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.12.i
  %192 = or disjoint i64 %55, 13
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %192
  %.sroa.0228.0.copyload.13.i = load i16, ptr %193, align 2, !tbaa.struct !29
  %194 = getelementptr i8, ptr addrspace(3) %53, i32 538
  store i16 %.sroa.0228.0.copyload.13.i, ptr addrspace(3) %194, align 2, !tbaa.struct !29
  %195 = icmp ugt i32 %5, 14
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.thread.i
  %196 = getelementptr i8, ptr addrspace(3) %53, i32 540
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.13.i
  %197 = or disjoint i64 %55, 14
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0228.0.copyload.14.i = load i16, ptr %198, align 4, !tbaa.struct !29
  %199 = getelementptr i8, ptr addrspace(3) %53, i32 540
  store i16 %.sroa.0228.0.copyload.14.i, ptr addrspace(3) %199, align 2, !tbaa.struct !29
  %.not613.i = icmp eq i32 %5, 15
  br i1 %.not613.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.thread.i
  %200 = getelementptr i8, ptr addrspace(3) %53, i32 542
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.14.i
  %201 = or disjoint i64 %55, 15
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %201
  %.sroa.0228.0.copyload.15.i = load i16, ptr %202, align 2, !tbaa.struct !29
  %203 = getelementptr i8, ptr addrspace(3) %53, i32 542
  store i16 %.sroa.0228.0.copyload.15.i, ptr addrspace(3) %203, align 2, !tbaa.struct !29
  %204 = icmp ugt i32 %5, 16
  br i1 %204, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.thread.i
  %205 = getelementptr i8, ptr addrspace(3) %53, i32 544
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.15.i
  %206 = or disjoint i64 %55, 16
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %206
  %.sroa.0228.0.copyload.16.i = load i16, ptr %207, align 32, !tbaa.struct !29
  %208 = getelementptr i8, ptr addrspace(3) %53, i32 544
  store i16 %.sroa.0228.0.copyload.16.i, ptr addrspace(3) %208, align 2, !tbaa.struct !29
  %.not614.i = icmp eq i32 %5, 17
  br i1 %.not614.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.thread.i
  %209 = getelementptr i8, ptr addrspace(3) %53, i32 546
  store i16 0, ptr addrspace(3) %209, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.16.i
  %210 = or disjoint i64 %55, 17
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %210
  %.sroa.0228.0.copyload.17.i = load i16, ptr %211, align 2, !tbaa.struct !29
  %212 = getelementptr i8, ptr addrspace(3) %53, i32 546
  store i16 %.sroa.0228.0.copyload.17.i, ptr addrspace(3) %212, align 2, !tbaa.struct !29
  %213 = icmp ugt i32 %5, 18
  br i1 %213, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.thread.i
  %214 = getelementptr i8, ptr addrspace(3) %53, i32 548
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.17.i
  %215 = or disjoint i64 %55, 18
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %215
  %.sroa.0228.0.copyload.18.i = load i16, ptr %216, align 4, !tbaa.struct !29
  %217 = getelementptr i8, ptr addrspace(3) %53, i32 548
  store i16 %.sroa.0228.0.copyload.18.i, ptr addrspace(3) %217, align 2, !tbaa.struct !29
  %.not615.i = icmp eq i32 %5, 19
  br i1 %.not615.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.thread.i
  %218 = getelementptr i8, ptr addrspace(3) %53, i32 550
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.18.i
  %219 = or disjoint i64 %55, 19
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %219
  %.sroa.0228.0.copyload.19.i = load i16, ptr %220, align 2, !tbaa.struct !29
  %221 = getelementptr i8, ptr addrspace(3) %53, i32 550
  store i16 %.sroa.0228.0.copyload.19.i, ptr addrspace(3) %221, align 2, !tbaa.struct !29
  %222 = icmp ugt i32 %5, 20
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.thread.i
  %223 = getelementptr i8, ptr addrspace(3) %53, i32 552
  store i16 0, ptr addrspace(3) %223, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.19.i
  %224 = or disjoint i64 %55, 20
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %224
  %.sroa.0228.0.copyload.20.i = load i16, ptr %225, align 8, !tbaa.struct !29
  %226 = getelementptr i8, ptr addrspace(3) %53, i32 552
  store i16 %.sroa.0228.0.copyload.20.i, ptr addrspace(3) %226, align 2, !tbaa.struct !29
  %.not616.i = icmp eq i32 %5, 21
  br i1 %.not616.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.thread.i
  %227 = getelementptr i8, ptr addrspace(3) %53, i32 554
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.20.i
  %228 = or disjoint i64 %55, 21
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %228
  %.sroa.0228.0.copyload.21.i = load i16, ptr %229, align 2, !tbaa.struct !29
  %230 = getelementptr i8, ptr addrspace(3) %53, i32 554
  store i16 %.sroa.0228.0.copyload.21.i, ptr addrspace(3) %230, align 2, !tbaa.struct !29
  %231 = icmp ugt i32 %5, 22
  br i1 %231, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.thread.i
  %232 = getelementptr i8, ptr addrspace(3) %53, i32 556
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.21.i
  %233 = or disjoint i64 %55, 22
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %233
  %.sroa.0228.0.copyload.22.i = load i16, ptr %234, align 4, !tbaa.struct !29
  %235 = getelementptr i8, ptr addrspace(3) %53, i32 556
  store i16 %.sroa.0228.0.copyload.22.i, ptr addrspace(3) %235, align 2, !tbaa.struct !29
  %.not617.i = icmp eq i32 %5, 23
  br i1 %.not617.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.thread.i
  %236 = getelementptr i8, ptr addrspace(3) %53, i32 558
  store i16 0, ptr addrspace(3) %236, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.22.i
  %237 = or disjoint i64 %55, 23
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %237
  %.sroa.0228.0.copyload.23.i = load i16, ptr %238, align 2, !tbaa.struct !29
  %239 = getelementptr i8, ptr addrspace(3) %53, i32 558
  store i16 %.sroa.0228.0.copyload.23.i, ptr addrspace(3) %239, align 2, !tbaa.struct !29
  %240 = icmp ugt i32 %5, 24
  br i1 %240, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.thread.i
  %241 = getelementptr i8, ptr addrspace(3) %53, i32 560
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.23.i
  %242 = or disjoint i64 %55, 24
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %242
  %.sroa.0228.0.copyload.24.i = load i16, ptr %243, align 16, !tbaa.struct !29
  %244 = getelementptr i8, ptr addrspace(3) %53, i32 560
  store i16 %.sroa.0228.0.copyload.24.i, ptr addrspace(3) %244, align 2, !tbaa.struct !29
  %.not618.i = icmp eq i32 %5, 25
  br i1 %.not618.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.thread.i
  %245 = getelementptr i8, ptr addrspace(3) %53, i32 562
  store i16 0, ptr addrspace(3) %245, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.24.i
  %246 = or disjoint i64 %55, 25
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %246
  %.sroa.0228.0.copyload.25.i = load i16, ptr %247, align 2, !tbaa.struct !29
  %248 = getelementptr i8, ptr addrspace(3) %53, i32 562
  store i16 %.sroa.0228.0.copyload.25.i, ptr addrspace(3) %248, align 2, !tbaa.struct !29
  %249 = icmp ugt i32 %5, 26
  br i1 %249, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.thread.i
  %250 = getelementptr i8, ptr addrspace(3) %53, i32 564
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.25.i
  %251 = or disjoint i64 %55, 26
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %251
  %.sroa.0228.0.copyload.26.i = load i16, ptr %252, align 4, !tbaa.struct !29
  %253 = getelementptr i8, ptr addrspace(3) %53, i32 564
  store i16 %.sroa.0228.0.copyload.26.i, ptr addrspace(3) %253, align 2, !tbaa.struct !29
  %.not619.i = icmp eq i32 %5, 27
  br i1 %.not619.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.thread.i
  %254 = getelementptr i8, ptr addrspace(3) %53, i32 566
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.26.i
  %255 = or disjoint i64 %55, 27
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %255
  %.sroa.0228.0.copyload.27.i = load i16, ptr %256, align 2, !tbaa.struct !29
  %257 = getelementptr i8, ptr addrspace(3) %53, i32 566
  store i16 %.sroa.0228.0.copyload.27.i, ptr addrspace(3) %257, align 2, !tbaa.struct !29
  %258 = icmp ugt i32 %5, 28
  br i1 %258, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.thread.i
  %259 = getelementptr i8, ptr addrspace(3) %53, i32 568
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.27.i
  %260 = or disjoint i64 %55, 28
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %260
  %.sroa.0228.0.copyload.28.i = load i16, ptr %261, align 8, !tbaa.struct !29
  %262 = getelementptr i8, ptr addrspace(3) %53, i32 568
  store i16 %.sroa.0228.0.copyload.28.i, ptr addrspace(3) %262, align 2, !tbaa.struct !29
  %.not620.i = icmp eq i32 %5, 29
  br i1 %.not620.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.thread.i
  %263 = getelementptr i8, ptr addrspace(3) %53, i32 570
  store i16 0, ptr addrspace(3) %263, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.28.i
  %264 = or disjoint i64 %55, 29
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %264
  %.sroa.0228.0.copyload.29.i = load i16, ptr %265, align 2, !tbaa.struct !29
  %266 = getelementptr i8, ptr addrspace(3) %53, i32 570
  store i16 %.sroa.0228.0.copyload.29.i, ptr addrspace(3) %266, align 2, !tbaa.struct !29
  %267 = icmp ugt i32 %5, 30
  br i1 %267, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.thread.i
  %268 = getelementptr i8, ptr addrspace(3) %53, i32 572
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !29
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.29.i
  %269 = or disjoint i64 %55, 30
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %269
  %.sroa.0228.0.copyload.30.i = load i16, ptr %270, align 4, !tbaa.struct !29
  %271 = getelementptr i8, ptr addrspace(3) %53, i32 572
  store i16 %.sroa.0228.0.copyload.30.i, ptr addrspace(3) %271, align 2, !tbaa.struct !29
  %.not621.i = icmp eq i32 %5, 31
  br i1 %.not621.i, label %.split.us.i, label %272

272:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.30.i
  %273 = or disjoint i64 %55, 31
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %273
  %.sroa.0228.0.copyload.31.i = load i16, ptr %274, align 2, !tbaa.struct !29
  br label %.split.us.i

.loopexit489.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit6.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %275 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %276 = icmp ult i64 %275, 64
  call void @llvm.assume(i1 %276)
  %277 = icmp eq i64 %275, 0
  br i1 %277, label %278, label %.lr.ph499.i

278:                                              ; preds = %.loopexit489.i
  %279 = shl i32 %.tr.i, 9
  %280 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %281 = icmp eq i64 %280, 0
  call void @llvm.assume(i1 %281)
  %282 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %283 = icmp eq i64 %282, 0
  call void @llvm.assume(i1 %283)
  %284 = sext i32 %5 to i64
  %285 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %286 = inttoptr i32 %285 to ptr addrspace(3)
  %287 = getelementptr inbounds i8, ptr addrspace(3) %286, i32 1024
  %288 = sext i32 %279 to i64
  %289 = icmp sgt i32 %4, 0
  %290 = icmp ugt i32 %4, 1
  %291 = icmp ugt i32 %4, 2
  %292 = icmp ugt i32 %4, 3
  %293 = icmp ugt i32 %4, 4
  %294 = icmp ugt i32 %4, 5
  %295 = icmp ugt i32 %4, 6
  %296 = icmp ugt i32 %4, 7
  %297 = icmp ugt i32 %4, 8
  %298 = icmp ugt i32 %4, 9
  %299 = icmp ugt i32 %4, 10
  %300 = icmp ugt i32 %4, 11
  %301 = icmp ugt i32 %4, 12
  %302 = icmp ugt i32 %4, 13
  %303 = icmp ugt i32 %4, 14
  %304 = icmp ugt i32 %4, 15
  br label %.preheader487.i

.preheader487.i:                                  ; preds = %.split496.us.i, %278
  %305 = phi i64 [ 0, %278 ], [ %315, %.split496.us.i ]
  %306 = icmp slt i64 %305, %284
  %307 = shl i64 %305, 4
  %.tr481.i = trunc i64 %305 to i32
  %308 = shl i32 %.tr481.i, 4
  %309 = sext i32 %308 to i64
  %310 = add nsw i64 %309, %288
  %.fr497.i = freeze i1 %306
  br i1 %.fr497.i, label %.preheader487.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader487.i
  %.tr555.i = trunc i64 %305 to i32
  %311 = shl i32 %.tr555.i, 5
  %312 = add i32 %311, 1024
  %scevgep544.i = getelementptr i8, ptr addrspace(3) %286, i32 %312
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep544.i, i8 0, i32 32, i1 false)
  br label %.split496.us.i

.preheader487.split.preheader.i:                  ; preds = %.preheader487.i
  br i1 %289, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader487.split.preheader.i
  %313 = trunc i64 %307 to i32
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %313
  store i16 0, ptr addrspace(3) %314, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split496.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %315 = add nuw nsw i64 %305, 1
  %exitcond.not.i = icmp eq i64 %315, 32
  br i1 %exitcond.not.i, label %.lr.ph499.i, label %.preheader487.i, !llvm.loop !35

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader487.split.preheader.i
  %316 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %310
  %.sroa.0217.0.copyload.i = load i16, ptr %316, align 32, !tbaa.struct !29
  %317 = trunc i64 %307 to i32
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %317
  store i16 %.sroa.0217.0.copyload.i, ptr addrspace(3) %318, align 2, !tbaa.struct !29
  br i1 %290, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %319 = trunc i64 %307 to i32
  %320 = or disjoint i32 %319, 1
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %320
  store i16 0, ptr addrspace(3) %321, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %322 = or disjoint i64 %310, 1
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0217.0.copyload.1.i = load i16, ptr %323, align 2, !tbaa.struct !29
  %324 = trunc i64 %307 to i32
  %325 = or disjoint i32 %324, 1
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %325
  store i16 %.sroa.0217.0.copyload.1.i, ptr addrspace(3) %326, align 2, !tbaa.struct !29
  br i1 %291, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %327 = trunc i64 %307 to i32
  %328 = or disjoint i32 %327, 2
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %328
  store i16 0, ptr addrspace(3) %329, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %330 = or disjoint i64 %310, 2
  %331 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %330
  %.sroa.0217.0.copyload.2.i = load i16, ptr %331, align 4, !tbaa.struct !29
  %332 = trunc i64 %307 to i32
  %333 = or disjoint i32 %332, 2
  %334 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %333
  store i16 %.sroa.0217.0.copyload.2.i, ptr addrspace(3) %334, align 2, !tbaa.struct !29
  br i1 %292, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %335 = trunc i64 %307 to i32
  %336 = or disjoint i32 %335, 3
  %337 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %336
  store i16 0, ptr addrspace(3) %337, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %338 = or disjoint i64 %310, 3
  %339 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %338
  %.sroa.0217.0.copyload.3.i = load i16, ptr %339, align 2, !tbaa.struct !29
  %340 = trunc i64 %307 to i32
  %341 = or disjoint i32 %340, 3
  %342 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %341
  store i16 %.sroa.0217.0.copyload.3.i, ptr addrspace(3) %342, align 2, !tbaa.struct !29
  br i1 %293, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %343 = trunc i64 %307 to i32
  %344 = or disjoint i32 %343, 4
  %345 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %344
  store i16 0, ptr addrspace(3) %345, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %346 = or disjoint i64 %310, 4
  %347 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %346
  %.sroa.0217.0.copyload.4.i = load i16, ptr %347, align 8, !tbaa.struct !29
  %348 = trunc i64 %307 to i32
  %349 = or disjoint i32 %348, 4
  %350 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %349
  store i16 %.sroa.0217.0.copyload.4.i, ptr addrspace(3) %350, align 2, !tbaa.struct !29
  br i1 %294, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %351 = trunc i64 %307 to i32
  %352 = or disjoint i32 %351, 5
  %353 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %352
  store i16 0, ptr addrspace(3) %353, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %354 = or disjoint i64 %310, 5
  %355 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %354
  %.sroa.0217.0.copyload.5.i = load i16, ptr %355, align 2, !tbaa.struct !29
  %356 = trunc i64 %307 to i32
  %357 = or disjoint i32 %356, 5
  %358 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %357
  store i16 %.sroa.0217.0.copyload.5.i, ptr addrspace(3) %358, align 2, !tbaa.struct !29
  br i1 %295, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %359 = trunc i64 %307 to i32
  %360 = or disjoint i32 %359, 6
  %361 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %360
  store i16 0, ptr addrspace(3) %361, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %362 = or disjoint i64 %310, 6
  %363 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %362
  %.sroa.0217.0.copyload.6.i = load i16, ptr %363, align 4, !tbaa.struct !29
  %364 = trunc i64 %307 to i32
  %365 = or disjoint i32 %364, 6
  %366 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %365
  store i16 %.sroa.0217.0.copyload.6.i, ptr addrspace(3) %366, align 2, !tbaa.struct !29
  br i1 %296, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %367 = trunc i64 %307 to i32
  %368 = or disjoint i32 %367, 7
  %369 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %368
  store i16 0, ptr addrspace(3) %369, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %370 = or disjoint i64 %310, 7
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %370
  %.sroa.0217.0.copyload.7.i = load i16, ptr %371, align 2, !tbaa.struct !29
  %372 = trunc i64 %307 to i32
  %373 = or disjoint i32 %372, 7
  %374 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %373
  store i16 %.sroa.0217.0.copyload.7.i, ptr addrspace(3) %374, align 2, !tbaa.struct !29
  br i1 %297, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %375 = trunc i64 %307 to i32
  %376 = or disjoint i32 %375, 8
  %377 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %376
  store i16 0, ptr addrspace(3) %377, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %378 = or disjoint i64 %310, 8
  %379 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %378
  %.sroa.0217.0.copyload.8.i = load i16, ptr %379, align 16, !tbaa.struct !29
  %380 = trunc i64 %307 to i32
  %381 = or disjoint i32 %380, 8
  %382 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %381
  store i16 %.sroa.0217.0.copyload.8.i, ptr addrspace(3) %382, align 2, !tbaa.struct !29
  br i1 %298, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %383 = trunc i64 %307 to i32
  %384 = or disjoint i32 %383, 9
  %385 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %384
  store i16 0, ptr addrspace(3) %385, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %386 = or disjoint i64 %310, 9
  %387 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %386
  %.sroa.0217.0.copyload.9.i = load i16, ptr %387, align 2, !tbaa.struct !29
  %388 = trunc i64 %307 to i32
  %389 = or disjoint i32 %388, 9
  %390 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %389
  store i16 %.sroa.0217.0.copyload.9.i, ptr addrspace(3) %390, align 2, !tbaa.struct !29
  br i1 %299, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %391 = trunc i64 %307 to i32
  %392 = or disjoint i32 %391, 10
  %393 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %392
  store i16 0, ptr addrspace(3) %393, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %394 = or disjoint i64 %310, 10
  %395 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %394
  %.sroa.0217.0.copyload.10.i = load i16, ptr %395, align 4, !tbaa.struct !29
  %396 = trunc i64 %307 to i32
  %397 = or disjoint i32 %396, 10
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %397
  store i16 %.sroa.0217.0.copyload.10.i, ptr addrspace(3) %398, align 2, !tbaa.struct !29
  br i1 %300, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %399 = trunc i64 %307 to i32
  %400 = or disjoint i32 %399, 11
  %401 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %400
  store i16 0, ptr addrspace(3) %401, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %402 = or disjoint i64 %310, 11
  %403 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %402
  %.sroa.0217.0.copyload.11.i = load i16, ptr %403, align 2, !tbaa.struct !29
  %404 = trunc i64 %307 to i32
  %405 = or disjoint i32 %404, 11
  %406 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %405
  store i16 %.sroa.0217.0.copyload.11.i, ptr addrspace(3) %406, align 2, !tbaa.struct !29
  br i1 %301, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %407 = trunc i64 %307 to i32
  %408 = or disjoint i32 %407, 12
  %409 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %408
  store i16 0, ptr addrspace(3) %409, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %410 = or disjoint i64 %310, 12
  %411 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %410
  %.sroa.0217.0.copyload.12.i = load i16, ptr %411, align 8, !tbaa.struct !29
  %412 = trunc i64 %307 to i32
  %413 = or disjoint i32 %412, 12
  %414 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %413
  store i16 %.sroa.0217.0.copyload.12.i, ptr addrspace(3) %414, align 2, !tbaa.struct !29
  br i1 %302, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %415 = trunc i64 %307 to i32
  %416 = or disjoint i32 %415, 13
  %417 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %416
  store i16 0, ptr addrspace(3) %417, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %418 = or disjoint i64 %310, 13
  %419 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %418
  %.sroa.0217.0.copyload.13.i = load i16, ptr %419, align 2, !tbaa.struct !29
  %420 = trunc i64 %307 to i32
  %421 = or disjoint i32 %420, 13
  %422 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %421
  store i16 %.sroa.0217.0.copyload.13.i, ptr addrspace(3) %422, align 2, !tbaa.struct !29
  br i1 %303, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %423 = trunc i64 %307 to i32
  %424 = or disjoint i32 %423, 14
  %425 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %424
  store i16 0, ptr addrspace(3) %425, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %426 = or disjoint i64 %310, 14
  %427 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %426
  %.sroa.0217.0.copyload.14.i = load i16, ptr %427, align 4, !tbaa.struct !29
  %428 = trunc i64 %307 to i32
  %429 = or disjoint i32 %428, 14
  %430 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %429
  store i16 %.sroa.0217.0.copyload.14.i, ptr addrspace(3) %430, align 2, !tbaa.struct !29
  br i1 %304, label %431, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

431:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %432 = or disjoint i64 %310, 15
  %433 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %432
  %.sroa.0217.0.copyload.15.i = load i16, ptr %433, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %431, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0219.2.15.i = phi i16 [ %.sroa.0217.0.copyload.15.i, %431 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %434 = trunc i64 %307 to i32
  %435 = or disjoint i32 %434, 15
  %436 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %435
  store i16 %.sroa.0219.2.15.i, ptr addrspace(3) %436, align 2, !tbaa.struct !29
  br label %.split496.us.i

.lr.ph499.i:                                      ; preds = %.split496.us.i, %.loopexit489.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %437 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %438 = icmp eq i64 %437, 0
  call void @llvm.assume(i1 %438)
  %439 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %440 = icmp eq i64 %439, 0
  call void @llvm.assume(i1 %440)
  %441 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %442 = icmp ult i64 %441, 64
  call void @llvm.assume(i1 %442)
  %443 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %444 = inttoptr i32 %443 to ptr addrspace(3)
  %445 = getelementptr inbounds i8, ptr addrspace(3) %444, i32 512
  %446 = getelementptr inbounds i8, ptr addrspace(3) %444, i32 1024
  %447 = and i64 %441, 7
  %448 = lshr i64 %441, 3
  %449 = shl nuw nsw i64 %448, 4
  %450 = or disjoint i64 %449, %447
  %451 = trunc i64 %450 to i32
  %452 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %451
  %453 = load float, ptr addrspace(3) %452, align 4, !tbaa !23
  %454 = or disjoint i64 %447, 8
  %455 = or disjoint i64 %449, %454
  %456 = trunc i64 %455 to i32
  %457 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %456
  %458 = load float, ptr addrspace(3) %457, align 4, !tbaa !23
  %459 = shl nuw nsw i64 %448, 5
  br label %463

._crit_edge500.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %515, ptr addrspace(3) %452, align 4, !tbaa !23
  store float %540, ptr addrspace(3) %457, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %460 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %461 = icmp ult i64 %460, 64
  call void @llvm.assume(i1 %461)
  %462 = icmp eq i64 %460, 0
  br i1 %462, label %542, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

463:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph499.i
  %464 = phi i64 [ 0, %.lr.ph499.i ], [ %541, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %465 = phi float [ %458, %.lr.ph499.i ], [ %540, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %466 = phi float [ %453, %.lr.ph499.i ], [ %515, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %467 = add nuw nsw i64 %464, %459
  %468 = trunc i64 %467 to i32
  %469 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %445, i32 %468
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %469, align 2, !tbaa.struct !29
  %470 = shl nuw nsw i64 %464, 4
  %471 = or disjoint i64 %470, %447
  %472 = trunc i64 %471 to i32
  %473 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %446, i32 %472
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %473, align 2, !tbaa.struct !29
  %474 = zext i16 %.sroa.0194.0.copyload.i to i32
  %475 = lshr i32 %474, 10
  %476 = and i32 %475, 31
  %477 = and i32 %474, 1023
  switch i32 %476, label %483 [
    i32 31, label %478
    i32 0, label %485
  ]

478:                                              ; preds = %463
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %479 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not480.i = icmp eq i32 %477, 0
  %480 = select i1 %.not480.i, i32 2139095040, i32 2143289344
  %481 = or disjoint i32 %480, %479
  %482 = bitcast i32 %481 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

483:                                              ; preds = %463
  %484 = or disjoint i32 %477, 1024
  br label %485

485:                                              ; preds = %483, %463
  %486 = phi i32 [ %484, %483 ], [ %477, %463 ]
  %487 = uitofp i32 %486 to float
  %.not.i = icmp eq i32 %476, 0
  %488 = add nsw i32 %476, -25
  %489 = select i1 %.not.i, i32 -24, i32 %488
  %490 = call float @__ocml_ldexp_f32(float noundef %487, i32 noundef %489) #6
  %491 = fneg contract float %490
  %.not470471.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %492 = select contract i1 %.not470471.i, float %491, float %490
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %485, %478
  %493 = phi float [ %482, %478 ], [ %492, %485 ]
  %494 = zext i16 %.sroa.0185.0.copyload.i to i32
  %495 = lshr i32 %494, 10
  %496 = and i32 %495, 31
  %497 = and i32 %494, 1023
  switch i32 %496, label %503 [
    i32 31, label %498
    i32 0, label %505
  ]

498:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %499 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not479.i = icmp eq i32 %497, 0
  %500 = select i1 %.not479.i, i32 2139095040, i32 2143289344
  %501 = or disjoint i32 %500, %499
  %502 = bitcast i32 %501 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

503:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %504 = or disjoint i32 %497, 1024
  br label %505

505:                                              ; preds = %503, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %506 = phi i32 [ %504, %503 ], [ %497, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %507 = uitofp i32 %506 to float
  %.not472.i = icmp eq i32 %496, 0
  %508 = add nsw i32 %496, -25
  %509 = select i1 %.not472.i, i32 -24, i32 %508
  %510 = call float @__ocml_ldexp_f32(float noundef %507, i32 noundef %509) #6
  %511 = fneg contract float %510
  %.not473474.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %512 = select contract i1 %.not473474.i, float %511, float %510
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %505, %498
  %513 = phi float [ %502, %498 ], [ %512, %505 ]
  %514 = fmul contract float %493, %513
  %515 = fadd contract float %466, %514
  %516 = or disjoint i64 %470, %454
  %517 = trunc i64 %516 to i32
  %518 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %446, i32 %517
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %518, align 2, !tbaa.struct !29
  %519 = zext i16 %.sroa.0176.0.copyload.i to i32
  %520 = lshr i32 %519, 10
  %521 = and i32 %520, 31
  %522 = and i32 %519, 1023
  switch i32 %521, label %528 [
    i32 31, label %523
    i32 0, label %530
  ]

523:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %524 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not478.i = icmp eq i32 %522, 0
  %525 = select i1 %.not478.i, i32 2139095040, i32 2143289344
  %526 = or disjoint i32 %525, %524
  %527 = bitcast i32 %526 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

528:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %529 = or disjoint i32 %522, 1024
  br label %530

530:                                              ; preds = %528, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %531 = phi i32 [ %529, %528 ], [ %522, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %532 = uitofp i32 %531 to float
  %.not475.i = icmp eq i32 %521, 0
  %533 = add nsw i32 %521, -25
  %534 = select i1 %.not475.i, i32 -24, i32 %533
  %535 = call float @__ocml_ldexp_f32(float noundef %532, i32 noundef %534) #6
  %536 = fneg contract float %535
  %.not476477.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %537 = select contract i1 %.not476477.i, float %536, float %535
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %530, %523
  %538 = phi float [ %527, %523 ], [ %537, %530 ]
  %539 = fmul contract float %493, %538
  %540 = fadd contract float %465, %539
  %541 = add nuw nsw i64 %464, 1
  %exitcond552.not.i = icmp eq i64 %541, 32
  br i1 %exitcond552.not.i, label %._crit_edge500.i, label %463, !llvm.loop !36

542:                                              ; preds = %._crit_edge500.i
  %543 = shl nuw i32 %.tr.i, 7
  %544 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %545 = icmp eq i64 %544, 0
  call void @llvm.assume(i1 %545)
  %546 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %547 = icmp eq i64 %546, 0
  call void @llvm.assume(i1 %547)
  %548 = sext i32 %.fr556.i to i64
  %549 = call i32 @llvm.amdgcn.groupstaticsize()
  %550 = inttoptr i32 %549 to ptr addrspace(3)
  %551 = sext i32 %543 to i64
  %552 = icmp slt i32 %4, 1
  %553 = icmp ugt i32 %4, 1
  %554 = icmp ugt i32 %4, 2
  %555 = icmp ugt i32 %4, 3
  %556 = icmp ugt i32 %4, 4
  %557 = icmp ugt i32 %4, 5
  %558 = icmp ugt i32 %4, 6
  %559 = icmp ugt i32 %4, 7
  %560 = icmp ugt i32 %4, 8
  %561 = icmp ugt i32 %4, 9
  %562 = icmp ugt i32 %4, 10
  %563 = icmp ugt i32 %4, 11
  %564 = icmp ugt i32 %4, 12
  %565 = icmp ugt i32 %4, 13
  %566 = icmp ugt i32 %4, 14
  %567 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split502.us.i, %542
  %568 = phi i64 [ 0, %542 ], [ %574, %.split502.us.i ]
  %569 = icmp sge i64 %568, %548
  %570 = shl i64 %568, 4
  %.tr469.i = trunc i64 %568 to i32
  %571 = shl i32 %.tr469.i, 4
  %572 = sext i32 %571 to i64
  %573 = add nsw i64 %572, %551
  %brmerge.i = select i1 %569, i1 true, i1 %552
  br i1 %brmerge.i, label %.split502.us.i, label %.preheader.split.1.i

.split502.us.i:                                   ; preds = %663, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %574 = add i64 %568, 1
  %exitcond554.not.i = icmp eq i64 %574, 8
  br i1 %exitcond554.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %575 = trunc i64 %570 to i32
  %576 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %575
  %577 = load float, ptr addrspace(3) %576, align 4, !tbaa !23
  %578 = getelementptr inbounds float, ptr %9, i64 %573
  store float %577, ptr %578, align 32, !tbaa !23
  br i1 %553, label %.preheader.split.2.i, label %.split502.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %579 = trunc i64 %570 to i32
  %580 = or disjoint i32 %579, 1
  %581 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %580
  %582 = load float, ptr addrspace(3) %581, align 4, !tbaa !23
  %583 = or disjoint i64 %573, 1
  %584 = getelementptr inbounds float, ptr %9, i64 %583
  store float %582, ptr %584, align 4, !tbaa !23
  br i1 %554, label %.preheader.split.3.i, label %.split502.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %585 = trunc i64 %570 to i32
  %586 = or disjoint i32 %585, 2
  %587 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %586
  %588 = load float, ptr addrspace(3) %587, align 4, !tbaa !23
  %589 = or disjoint i64 %573, 2
  %590 = getelementptr inbounds float, ptr %9, i64 %589
  store float %588, ptr %590, align 8, !tbaa !23
  br i1 %555, label %.preheader.split.4.i, label %.split502.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %591 = trunc i64 %570 to i32
  %592 = or disjoint i32 %591, 3
  %593 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %592
  %594 = load float, ptr addrspace(3) %593, align 4, !tbaa !23
  %595 = or disjoint i64 %573, 3
  %596 = getelementptr inbounds float, ptr %9, i64 %595
  store float %594, ptr %596, align 4, !tbaa !23
  br i1 %556, label %.preheader.split.5.i, label %.split502.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %597 = trunc i64 %570 to i32
  %598 = or disjoint i32 %597, 4
  %599 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %598
  %600 = load float, ptr addrspace(3) %599, align 4, !tbaa !23
  %601 = or disjoint i64 %573, 4
  %602 = getelementptr inbounds float, ptr %9, i64 %601
  store float %600, ptr %602, align 16, !tbaa !23
  br i1 %557, label %.preheader.split.6.i, label %.split502.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %603 = trunc i64 %570 to i32
  %604 = or disjoint i32 %603, 5
  %605 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %604
  %606 = load float, ptr addrspace(3) %605, align 4, !tbaa !23
  %607 = or disjoint i64 %573, 5
  %608 = getelementptr inbounds float, ptr %9, i64 %607
  store float %606, ptr %608, align 4, !tbaa !23
  br i1 %558, label %.preheader.split.7.i, label %.split502.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %609 = trunc i64 %570 to i32
  %610 = or disjoint i32 %609, 6
  %611 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %610
  %612 = load float, ptr addrspace(3) %611, align 4, !tbaa !23
  %613 = or disjoint i64 %573, 6
  %614 = getelementptr inbounds float, ptr %9, i64 %613
  store float %612, ptr %614, align 8, !tbaa !23
  br i1 %559, label %.preheader.split.8.i, label %.split502.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %615 = trunc i64 %570 to i32
  %616 = or disjoint i32 %615, 7
  %617 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %616
  %618 = load float, ptr addrspace(3) %617, align 4, !tbaa !23
  %619 = or disjoint i64 %573, 7
  %620 = getelementptr inbounds float, ptr %9, i64 %619
  store float %618, ptr %620, align 4, !tbaa !23
  br i1 %560, label %.preheader.split.9.i, label %.split502.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %621 = trunc i64 %570 to i32
  %622 = or disjoint i32 %621, 8
  %623 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %622
  %624 = load float, ptr addrspace(3) %623, align 4, !tbaa !23
  %625 = or disjoint i64 %573, 8
  %626 = getelementptr inbounds float, ptr %9, i64 %625
  store float %624, ptr %626, align 32, !tbaa !23
  br i1 %561, label %.preheader.split.10.i, label %.split502.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %627 = trunc i64 %570 to i32
  %628 = or disjoint i32 %627, 9
  %629 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %628
  %630 = load float, ptr addrspace(3) %629, align 4, !tbaa !23
  %631 = or disjoint i64 %573, 9
  %632 = getelementptr inbounds float, ptr %9, i64 %631
  store float %630, ptr %632, align 4, !tbaa !23
  br i1 %562, label %.preheader.split.11.i, label %.split502.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %633 = trunc i64 %570 to i32
  %634 = or disjoint i32 %633, 10
  %635 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %634
  %636 = load float, ptr addrspace(3) %635, align 4, !tbaa !23
  %637 = or disjoint i64 %573, 10
  %638 = getelementptr inbounds float, ptr %9, i64 %637
  store float %636, ptr %638, align 8, !tbaa !23
  br i1 %563, label %.preheader.split.12.i, label %.split502.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %639 = trunc i64 %570 to i32
  %640 = or disjoint i32 %639, 11
  %641 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %640
  %642 = load float, ptr addrspace(3) %641, align 4, !tbaa !23
  %643 = or disjoint i64 %573, 11
  %644 = getelementptr inbounds float, ptr %9, i64 %643
  store float %642, ptr %644, align 4, !tbaa !23
  br i1 %564, label %.preheader.split.13.i, label %.split502.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %645 = trunc i64 %570 to i32
  %646 = or disjoint i32 %645, 12
  %647 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %646
  %648 = load float, ptr addrspace(3) %647, align 4, !tbaa !23
  %649 = or disjoint i64 %573, 12
  %650 = getelementptr inbounds float, ptr %9, i64 %649
  store float %648, ptr %650, align 16, !tbaa !23
  br i1 %565, label %.preheader.split.14.i, label %.split502.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %651 = trunc i64 %570 to i32
  %652 = or disjoint i32 %651, 13
  %653 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %652
  %654 = load float, ptr addrspace(3) %653, align 4, !tbaa !23
  %655 = or disjoint i64 %573, 13
  %656 = getelementptr inbounds float, ptr %9, i64 %655
  store float %654, ptr %656, align 4, !tbaa !23
  br i1 %566, label %.preheader.split.15.i, label %.split502.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %657 = trunc i64 %570 to i32
  %658 = or disjoint i32 %657, 14
  %659 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %658
  %660 = load float, ptr addrspace(3) %659, align 4, !tbaa !23
  %661 = or disjoint i64 %573, 14
  %662 = getelementptr inbounds float, ptr %9, i64 %661
  store float %660, ptr %662, align 8, !tbaa !23
  br i1 %567, label %663, label %.split502.us.i

663:                                              ; preds = %.preheader.split.15.i
  %664 = trunc i64 %570 to i32
  %665 = or disjoint i32 %664, 15
  %666 = getelementptr inbounds float, ptr addrspace(3) %550, i32 %665
  %667 = load float, ptr addrspace(3) %666, align 4, !tbaa !23
  %668 = or disjoint i64 %573, 15
  %669 = getelementptr inbounds float, ptr %9, i64 %668
  store float %667, ptr %669, align 4, !tbaa !23
  br label %.split502.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge500.i, %.split502.us.i
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
