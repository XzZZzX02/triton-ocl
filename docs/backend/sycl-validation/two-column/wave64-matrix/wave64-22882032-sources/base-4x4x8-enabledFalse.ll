;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-fhqtr9gp/kernel.cpp"
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
  %.fr482.i = freeze i32 %3
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !10
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 268435455
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp ult i64 %20, 8
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 268435456
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp ult i64 %28, 8
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp ult i64 %30, 4
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 4
  call void @llvm.assume(i1 %33)
  %34 = shl nuw nsw i64 %32, 5
  %35 = shl nuw nsw i64 %30, 3
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
  br i1 %45, label %52, label %.loopexit413.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %46 = phi i64 [ %37, %6 ], [ %50, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %47 = trunc i64 %46 to i32
  %48 = and i32 %47, 127
  %49 = getelementptr inbounds float, ptr addrspace(3) %39, i32 %48
  store float 0.000000e+00, ptr addrspace(3) %49, align 4, !tbaa !19
  %50 = add nuw nsw i64 %46, 128
  %51 = icmp ugt i64 %46, 9223372036854775679
  br i1 %51, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

52:                                               ; preds = %._crit_edge.i
  %53 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %54 = icmp ult i64 %53, 4
  call void @llvm.assume(i1 %54)
  %55 = icmp eq i64 %53, 0
  br i1 %55, label %56, label %.loopexit413.i

56:                                               ; preds = %52
  %57 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %58 = icmp ult i64 %57, 8
  call void @llvm.assume(i1 %58)
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %.preheader412.i, label %.loopexit413.i

.preheader412.i:                                  ; preds = %56
  %60 = sext i32 %5 to i64
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr i8, ptr addrspace(3) %62, i32 512
  %64 = sext i32 %42 to i64
  %65 = icmp sgt i32 %.fr482.i, 0
  br i1 %65, label %.preheader411.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader412.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %63, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader411.split.preheader.i:                  ; preds = %.preheader412.i
  %66 = icmp sgt i32 %5, 0
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i: ; preds = %.preheader411.split.preheader.i
  store i16 0, ptr addrspace(3) %63, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.thread.i

.split.us.i:                                      ; preds = %281, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i
  %.sroa.0209.2.31.i = phi i16 [ %.sroa.0207.0.copyload.31.i, %281 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i ]
  %67 = getelementptr i8, ptr addrspace(3) %62, i32 574
  store i16 %.sroa.0209.2.31.i, ptr addrspace(3) %67, align 2, !tbaa.struct !25
  %68 = icmp ugt i32 %.fr482.i, 1
  %69 = or disjoint i64 %64, 32
  br i1 %68, label %.preheader411.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %62, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader411.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %70 = phi i64 [ %78, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %71 = icmp slt i64 %70, %60
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

72:                                               ; preds = %.preheader411.split.1.i
  %73 = add nuw nsw i64 %69, %70
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0207.0.copyload.1.i = load i16, ptr %74, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %72, %.preheader411.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %72 ], [ 0, %.preheader411.split.1.i ]
  %75 = trunc i64 %70 to i32
  %76 = add i32 %75, 32
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %76
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %77, align 2, !tbaa.struct !25
  %78 = add nuw nsw i64 %70, 1
  %exitcond.1.not.i = icmp eq i64 %78, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader411.split.1.i, !llvm.loop !28

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %79 = icmp sgt i32 %.fr482.i, 2
  %80 = or disjoint i64 %64, 64
  br i1 %79, label %.preheader411.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %62, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader411.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %81 = phi i64 [ %89, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %82 = icmp slt i64 %81, %60
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

83:                                               ; preds = %.preheader411.split.2.i
  %84 = add nuw nsw i64 %80, %81
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0207.0.copyload.2.i = load i16, ptr %85, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %83, %.preheader411.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %83 ], [ 0, %.preheader411.split.2.i ]
  %86 = trunc i64 %81 to i32
  %87 = add i32 %86, 64
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %87
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %88, align 2, !tbaa.struct !25
  %89 = add nuw nsw i64 %81, 1
  %exitcond.2.not.i = icmp eq i64 %89, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader411.split.2.i, !llvm.loop !28

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %90 = icmp sgt i32 %.fr482.i, 3
  %91 = or disjoint i64 %64, 96
  br i1 %90, label %.preheader411.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %62, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader411.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %92 = phi i64 [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %93 = icmp slt i64 %92, %60
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

94:                                               ; preds = %.preheader411.split.3.i
  %95 = add nuw nsw i64 %91, %92
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0207.0.copyload.3.i = load i16, ptr %96, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %94, %.preheader411.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %94 ], [ 0, %.preheader411.split.3.i ]
  %97 = trunc i64 %92 to i32
  %98 = add i32 %97, 96
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %98
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %99, align 2, !tbaa.struct !25
  %100 = add nuw nsw i64 %92, 1
  %exitcond.3.not.i = icmp eq i64 %100, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader411.split.3.i, !llvm.loop !28

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %101 = icmp sgt i32 %.fr482.i, 4
  %102 = or disjoint i64 %64, 128
  br i1 %101, label %.preheader411.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %62, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader411.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %103 = phi i64 [ %111, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %104 = icmp slt i64 %103, %60
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

105:                                              ; preds = %.preheader411.split.4.i
  %106 = add nuw nsw i64 %102, %103
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0207.0.copyload.4.i = load i16, ptr %107, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %105, %.preheader411.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %105 ], [ 0, %.preheader411.split.4.i ]
  %108 = trunc i64 %103 to i32
  %109 = add i32 %108, 128
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %109
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  %111 = add nuw nsw i64 %103, 1
  %exitcond.4.not.i = icmp eq i64 %111, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader411.split.4.i, !llvm.loop !28

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %112 = icmp sgt i32 %.fr482.i, 5
  %113 = or disjoint i64 %64, 160
  br i1 %112, label %.preheader411.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %62, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader411.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %114 = phi i64 [ %122, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %115 = icmp slt i64 %114, %60
  br i1 %115, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

116:                                              ; preds = %.preheader411.split.5.i
  %117 = add nuw nsw i64 %113, %114
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0207.0.copyload.5.i = load i16, ptr %118, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %116, %.preheader411.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %116 ], [ 0, %.preheader411.split.5.i ]
  %119 = trunc i64 %114 to i32
  %120 = add i32 %119, 160
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %120
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  %122 = add nuw nsw i64 %114, 1
  %exitcond.5.not.i = icmp eq i64 %122, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader411.split.5.i, !llvm.loop !28

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %123 = icmp sgt i32 %.fr482.i, 6
  %124 = or disjoint i64 %64, 192
  br i1 %123, label %.preheader411.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %62, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader411.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %125 = phi i64 [ %133, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %126 = icmp slt i64 %125, %60
  br i1 %126, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

127:                                              ; preds = %.preheader411.split.6.i
  %128 = add nuw nsw i64 %124, %125
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0207.0.copyload.6.i = load i16, ptr %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %127, %.preheader411.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %127 ], [ 0, %.preheader411.split.6.i ]
  %130 = trunc i64 %125 to i32
  %131 = add i32 %130, 192
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %131
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %132, align 2, !tbaa.struct !25
  %133 = add nuw nsw i64 %125, 1
  %exitcond.6.not.i = icmp eq i64 %133, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader411.split.6.i, !llvm.loop !28

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %134 = icmp sgt i32 %.fr482.i, 7
  %135 = or disjoint i64 %64, 224
  br i1 %134, label %.preheader411.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %62, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.loopexit413.i

.preheader411.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %136 = phi i64 [ %144, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %137 = icmp slt i64 %136, %60
  br i1 %137, label %138, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

138:                                              ; preds = %.preheader411.split.7.i
  %139 = add nuw nsw i64 %135, %136
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %139
  %.sroa.0207.0.copyload.7.i = load i16, ptr %140, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %138, %.preheader411.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %138 ], [ 0, %.preheader411.split.7.i ]
  %141 = trunc i64 %136 to i32
  %142 = add i32 %141, 224
  %143 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %142
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %143, align 2, !tbaa.struct !25
  %144 = add nuw nsw i64 %136, 1
  %exitcond.7.not.i = icmp eq i64 %144, 32
  br i1 %exitcond.7.not.i, label %.loopexit413.i, label %.preheader411.split.7.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %.preheader411.split.preheader.i
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %64
  %.sroa.0207.0.copyload.i = load i16, ptr %145, align 32, !tbaa.struct !25
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %63, align 2, !tbaa.struct !25
  %.not531.i = icmp eq i32 %5, 1
  br i1 %.not531.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i
  %146 = getelementptr i8, ptr addrspace(3) %62, i32 514
  store i16 0, ptr addrspace(3) %146, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %147 = or disjoint i64 %64, 1
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %147
  %.sroa.0207.0.copyload.1436.i = load i16, ptr %148, align 2, !tbaa.struct !25
  %149 = getelementptr i8, ptr addrspace(3) %62, i32 514
  store i16 %.sroa.0207.0.copyload.1436.i, ptr addrspace(3) %149, align 2, !tbaa.struct !25
  %150 = icmp ugt i32 %5, 2
  br i1 %150, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.thread.i
  %151 = getelementptr i8, ptr addrspace(3) %62, i32 516
  store i16 0, ptr addrspace(3) %151, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1439.i
  %152 = or disjoint i64 %64, 2
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %152
  %.sroa.0207.0.copyload.2441.i = load i16, ptr %153, align 4, !tbaa.struct !25
  %154 = getelementptr i8, ptr addrspace(3) %62, i32 516
  store i16 %.sroa.0207.0.copyload.2441.i, ptr addrspace(3) %154, align 2, !tbaa.struct !25
  %.not532.i = icmp eq i32 %5, 3
  br i1 %.not532.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.thread.i
  %155 = getelementptr i8, ptr addrspace(3) %62, i32 518
  store i16 0, ptr addrspace(3) %155, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2444.i
  %156 = or disjoint i64 %64, 3
  %157 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %156
  %.sroa.0207.0.copyload.3446.i = load i16, ptr %157, align 2, !tbaa.struct !25
  %158 = getelementptr i8, ptr addrspace(3) %62, i32 518
  store i16 %.sroa.0207.0.copyload.3446.i, ptr addrspace(3) %158, align 2, !tbaa.struct !25
  %159 = icmp ugt i32 %5, 4
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.thread.i
  %160 = getelementptr i8, ptr addrspace(3) %62, i32 520
  store i16 0, ptr addrspace(3) %160, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3449.i
  %161 = or disjoint i64 %64, 4
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %161
  %.sroa.0207.0.copyload.4451.i = load i16, ptr %162, align 8, !tbaa.struct !25
  %163 = getelementptr i8, ptr addrspace(3) %62, i32 520
  store i16 %.sroa.0207.0.copyload.4451.i, ptr addrspace(3) %163, align 2, !tbaa.struct !25
  %.not533.i = icmp eq i32 %5, 5
  br i1 %.not533.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.thread.i
  %164 = getelementptr i8, ptr addrspace(3) %62, i32 522
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4454.i
  %165 = or disjoint i64 %64, 5
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0207.0.copyload.5456.i = load i16, ptr %166, align 2, !tbaa.struct !25
  %167 = getelementptr i8, ptr addrspace(3) %62, i32 522
  store i16 %.sroa.0207.0.copyload.5456.i, ptr addrspace(3) %167, align 2, !tbaa.struct !25
  %168 = icmp ugt i32 %5, 6
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.thread.i
  %169 = getelementptr i8, ptr addrspace(3) %62, i32 524
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5459.i
  %170 = or disjoint i64 %64, 6
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0207.0.copyload.6461.i = load i16, ptr %171, align 4, !tbaa.struct !25
  %172 = getelementptr i8, ptr addrspace(3) %62, i32 524
  store i16 %.sroa.0207.0.copyload.6461.i, ptr addrspace(3) %172, align 2, !tbaa.struct !25
  %.not534.i = icmp eq i32 %5, 7
  br i1 %.not534.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.thread.i
  %173 = getelementptr i8, ptr addrspace(3) %62, i32 526
  store i16 0, ptr addrspace(3) %173, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6464.i
  %174 = or disjoint i64 %64, 7
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %174
  %.sroa.0207.0.copyload.7466.i = load i16, ptr %175, align 2, !tbaa.struct !25
  %176 = getelementptr i8, ptr addrspace(3) %62, i32 526
  store i16 %.sroa.0207.0.copyload.7466.i, ptr addrspace(3) %176, align 2, !tbaa.struct !25
  %177 = icmp ugt i32 %5, 8
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.thread.i
  %178 = getelementptr i8, ptr addrspace(3) %62, i32 528
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7469.i
  %179 = or disjoint i64 %64, 8
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %179
  %.sroa.0207.0.copyload.8.i = load i16, ptr %180, align 16, !tbaa.struct !25
  %181 = getelementptr i8, ptr addrspace(3) %62, i32 528
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %181, align 2, !tbaa.struct !25
  %.not535.i = icmp eq i32 %5, 9
  br i1 %.not535.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i
  %182 = getelementptr i8, ptr addrspace(3) %62, i32 530
  store i16 0, ptr addrspace(3) %182, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i
  %183 = or disjoint i64 %64, 9
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %183
  %.sroa.0207.0.copyload.9.i = load i16, ptr %184, align 2, !tbaa.struct !25
  %185 = getelementptr i8, ptr addrspace(3) %62, i32 530
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %185, align 2, !tbaa.struct !25
  %186 = icmp ugt i32 %5, 10
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i
  %187 = getelementptr i8, ptr addrspace(3) %62, i32 532
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i
  %188 = or disjoint i64 %64, 10
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %188
  %.sroa.0207.0.copyload.10.i = load i16, ptr %189, align 4, !tbaa.struct !25
  %190 = getelementptr i8, ptr addrspace(3) %62, i32 532
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %190, align 2, !tbaa.struct !25
  %.not536.i = icmp eq i32 %5, 11
  br i1 %.not536.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i
  %191 = getelementptr i8, ptr addrspace(3) %62, i32 534
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i
  %192 = or disjoint i64 %64, 11
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %192
  %.sroa.0207.0.copyload.11.i = load i16, ptr %193, align 2, !tbaa.struct !25
  %194 = getelementptr i8, ptr addrspace(3) %62, i32 534
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %194, align 2, !tbaa.struct !25
  %195 = icmp ugt i32 %5, 12
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i
  %196 = getelementptr i8, ptr addrspace(3) %62, i32 536
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i
  %197 = or disjoint i64 %64, 12
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0207.0.copyload.12.i = load i16, ptr %198, align 8, !tbaa.struct !25
  %199 = getelementptr i8, ptr addrspace(3) %62, i32 536
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %199, align 2, !tbaa.struct !25
  %.not537.i = icmp eq i32 %5, 13
  br i1 %.not537.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i
  %200 = getelementptr i8, ptr addrspace(3) %62, i32 538
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i
  %201 = or disjoint i64 %64, 13
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %201
  %.sroa.0207.0.copyload.13.i = load i16, ptr %202, align 2, !tbaa.struct !25
  %203 = getelementptr i8, ptr addrspace(3) %62, i32 538
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %203, align 2, !tbaa.struct !25
  %204 = icmp ugt i32 %5, 14
  br i1 %204, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i
  %205 = getelementptr i8, ptr addrspace(3) %62, i32 540
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i
  %206 = or disjoint i64 %64, 14
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %206
  %.sroa.0207.0.copyload.14.i = load i16, ptr %207, align 4, !tbaa.struct !25
  %208 = getelementptr i8, ptr addrspace(3) %62, i32 540
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %208, align 2, !tbaa.struct !25
  %.not538.i = icmp eq i32 %5, 15
  br i1 %.not538.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i
  %209 = getelementptr i8, ptr addrspace(3) %62, i32 542
  store i16 0, ptr addrspace(3) %209, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i
  %210 = or disjoint i64 %64, 15
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %210
  %.sroa.0207.0.copyload.15.i = load i16, ptr %211, align 2, !tbaa.struct !25
  %212 = getelementptr i8, ptr addrspace(3) %62, i32 542
  store i16 %.sroa.0207.0.copyload.15.i, ptr addrspace(3) %212, align 2, !tbaa.struct !25
  %213 = icmp ugt i32 %5, 16
  br i1 %213, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i
  %214 = getelementptr i8, ptr addrspace(3) %62, i32 544
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i
  %215 = or disjoint i64 %64, 16
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %215
  %.sroa.0207.0.copyload.16.i = load i16, ptr %216, align 32, !tbaa.struct !25
  %217 = getelementptr i8, ptr addrspace(3) %62, i32 544
  store i16 %.sroa.0207.0.copyload.16.i, ptr addrspace(3) %217, align 2, !tbaa.struct !25
  %.not539.i = icmp eq i32 %5, 17
  br i1 %.not539.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i
  %218 = getelementptr i8, ptr addrspace(3) %62, i32 546
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i
  %219 = or disjoint i64 %64, 17
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %219
  %.sroa.0207.0.copyload.17.i = load i16, ptr %220, align 2, !tbaa.struct !25
  %221 = getelementptr i8, ptr addrspace(3) %62, i32 546
  store i16 %.sroa.0207.0.copyload.17.i, ptr addrspace(3) %221, align 2, !tbaa.struct !25
  %222 = icmp ugt i32 %5, 18
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i
  %223 = getelementptr i8, ptr addrspace(3) %62, i32 548
  store i16 0, ptr addrspace(3) %223, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i
  %224 = or disjoint i64 %64, 18
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %224
  %.sroa.0207.0.copyload.18.i = load i16, ptr %225, align 4, !tbaa.struct !25
  %226 = getelementptr i8, ptr addrspace(3) %62, i32 548
  store i16 %.sroa.0207.0.copyload.18.i, ptr addrspace(3) %226, align 2, !tbaa.struct !25
  %.not540.i = icmp eq i32 %5, 19
  br i1 %.not540.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i
  %227 = getelementptr i8, ptr addrspace(3) %62, i32 550
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i
  %228 = or disjoint i64 %64, 19
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %228
  %.sroa.0207.0.copyload.19.i = load i16, ptr %229, align 2, !tbaa.struct !25
  %230 = getelementptr i8, ptr addrspace(3) %62, i32 550
  store i16 %.sroa.0207.0.copyload.19.i, ptr addrspace(3) %230, align 2, !tbaa.struct !25
  %231 = icmp ugt i32 %5, 20
  br i1 %231, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i
  %232 = getelementptr i8, ptr addrspace(3) %62, i32 552
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i
  %233 = or disjoint i64 %64, 20
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %233
  %.sroa.0207.0.copyload.20.i = load i16, ptr %234, align 8, !tbaa.struct !25
  %235 = getelementptr i8, ptr addrspace(3) %62, i32 552
  store i16 %.sroa.0207.0.copyload.20.i, ptr addrspace(3) %235, align 2, !tbaa.struct !25
  %.not541.i = icmp eq i32 %5, 21
  br i1 %.not541.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i
  %236 = getelementptr i8, ptr addrspace(3) %62, i32 554
  store i16 0, ptr addrspace(3) %236, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i
  %237 = or disjoint i64 %64, 21
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %237
  %.sroa.0207.0.copyload.21.i = load i16, ptr %238, align 2, !tbaa.struct !25
  %239 = getelementptr i8, ptr addrspace(3) %62, i32 554
  store i16 %.sroa.0207.0.copyload.21.i, ptr addrspace(3) %239, align 2, !tbaa.struct !25
  %240 = icmp ugt i32 %5, 22
  br i1 %240, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i
  %241 = getelementptr i8, ptr addrspace(3) %62, i32 556
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i
  %242 = or disjoint i64 %64, 22
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %242
  %.sroa.0207.0.copyload.22.i = load i16, ptr %243, align 4, !tbaa.struct !25
  %244 = getelementptr i8, ptr addrspace(3) %62, i32 556
  store i16 %.sroa.0207.0.copyload.22.i, ptr addrspace(3) %244, align 2, !tbaa.struct !25
  %.not542.i = icmp eq i32 %5, 23
  br i1 %.not542.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i
  %245 = getelementptr i8, ptr addrspace(3) %62, i32 558
  store i16 0, ptr addrspace(3) %245, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i
  %246 = or disjoint i64 %64, 23
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %246
  %.sroa.0207.0.copyload.23.i = load i16, ptr %247, align 2, !tbaa.struct !25
  %248 = getelementptr i8, ptr addrspace(3) %62, i32 558
  store i16 %.sroa.0207.0.copyload.23.i, ptr addrspace(3) %248, align 2, !tbaa.struct !25
  %249 = icmp ugt i32 %5, 24
  br i1 %249, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i
  %250 = getelementptr i8, ptr addrspace(3) %62, i32 560
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i
  %251 = or disjoint i64 %64, 24
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %251
  %.sroa.0207.0.copyload.24.i = load i16, ptr %252, align 16, !tbaa.struct !25
  %253 = getelementptr i8, ptr addrspace(3) %62, i32 560
  store i16 %.sroa.0207.0.copyload.24.i, ptr addrspace(3) %253, align 2, !tbaa.struct !25
  %.not543.i = icmp eq i32 %5, 25
  br i1 %.not543.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i
  %254 = getelementptr i8, ptr addrspace(3) %62, i32 562
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i
  %255 = or disjoint i64 %64, 25
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %255
  %.sroa.0207.0.copyload.25.i = load i16, ptr %256, align 2, !tbaa.struct !25
  %257 = getelementptr i8, ptr addrspace(3) %62, i32 562
  store i16 %.sroa.0207.0.copyload.25.i, ptr addrspace(3) %257, align 2, !tbaa.struct !25
  %258 = icmp ugt i32 %5, 26
  br i1 %258, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i
  %259 = getelementptr i8, ptr addrspace(3) %62, i32 564
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i
  %260 = or disjoint i64 %64, 26
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %260
  %.sroa.0207.0.copyload.26.i = load i16, ptr %261, align 4, !tbaa.struct !25
  %262 = getelementptr i8, ptr addrspace(3) %62, i32 564
  store i16 %.sroa.0207.0.copyload.26.i, ptr addrspace(3) %262, align 2, !tbaa.struct !25
  %.not544.i = icmp eq i32 %5, 27
  br i1 %.not544.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i
  %263 = getelementptr i8, ptr addrspace(3) %62, i32 566
  store i16 0, ptr addrspace(3) %263, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i
  %264 = or disjoint i64 %64, 27
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %264
  %.sroa.0207.0.copyload.27.i = load i16, ptr %265, align 2, !tbaa.struct !25
  %266 = getelementptr i8, ptr addrspace(3) %62, i32 566
  store i16 %.sroa.0207.0.copyload.27.i, ptr addrspace(3) %266, align 2, !tbaa.struct !25
  %267 = icmp ugt i32 %5, 28
  br i1 %267, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i
  %268 = getelementptr i8, ptr addrspace(3) %62, i32 568
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i
  %269 = or disjoint i64 %64, 28
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %269
  %.sroa.0207.0.copyload.28.i = load i16, ptr %270, align 8, !tbaa.struct !25
  %271 = getelementptr i8, ptr addrspace(3) %62, i32 568
  store i16 %.sroa.0207.0.copyload.28.i, ptr addrspace(3) %271, align 2, !tbaa.struct !25
  %.not545.i = icmp eq i32 %5, 29
  br i1 %.not545.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i
  %272 = getelementptr i8, ptr addrspace(3) %62, i32 570
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i
  %273 = or disjoint i64 %64, 29
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %273
  %.sroa.0207.0.copyload.29.i = load i16, ptr %274, align 2, !tbaa.struct !25
  %275 = getelementptr i8, ptr addrspace(3) %62, i32 570
  store i16 %.sroa.0207.0.copyload.29.i, ptr addrspace(3) %275, align 2, !tbaa.struct !25
  %276 = icmp ugt i32 %5, 30
  br i1 %276, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i
  %277 = getelementptr i8, ptr addrspace(3) %62, i32 572
  store i16 0, ptr addrspace(3) %277, align 2, !tbaa.struct !25
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i
  %278 = or disjoint i64 %64, 30
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %278
  %.sroa.0207.0.copyload.30.i = load i16, ptr %279, align 4, !tbaa.struct !25
  %280 = getelementptr i8, ptr addrspace(3) %62, i32 572
  store i16 %.sroa.0207.0.copyload.30.i, ptr addrspace(3) %280, align 2, !tbaa.struct !25
  %.not546.i = icmp eq i32 %5, 31
  br i1 %.not546.i, label %.split.us.i, label %281

281:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i
  %282 = or disjoint i64 %64, 31
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %282
  %.sroa.0207.0.copyload.31.i = load i16, ptr %283, align 2, !tbaa.struct !25
  br label %.split.us.i

.loopexit413.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %56, %52, %._crit_edge.i
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
  br i1 %287, label %288, label %.lr.ph424.i

288:                                              ; preds = %.loopexit413.i
  %289 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %290 = icmp ult i64 %289, 4
  call void @llvm.assume(i1 %290)
  %291 = icmp eq i64 %289, 0
  br i1 %291, label %292, label %.lr.ph424.i

292:                                              ; preds = %288
  %293 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %294 = icmp ult i64 %293, 8
  call void @llvm.assume(i1 %294)
  %295 = icmp eq i64 %293, 0
  br i1 %295, label %.preheader410.i, label %.lr.ph424.i

.preheader410.i:                                  ; preds = %292
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
  br label %.preheader409.i

.preheader409.i:                                  ; preds = %.split421.us.i, %.preheader410.i
  %317 = phi i64 [ 0, %.preheader410.i ], [ %327, %.split421.us.i ]
  %318 = icmp slt i64 %317, %296
  %319 = shl i64 %317, 4
  %.tr400.i = trunc i64 %317 to i32
  %320 = shl i32 %.tr400.i, 4
  %321 = sext i32 %320 to i64
  %322 = add nsw i64 %321, %300
  %.fr422.i = freeze i1 %318
  br i1 %.fr422.i, label %.preheader409.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader409.i
  %.tr481.i = trunc i64 %317 to i32
  %323 = shl i32 %.tr481.i, 5
  %324 = add i32 %323, 1024
  %scevgep470.i = getelementptr i8, ptr addrspace(3) %298, i32 %324
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep470.i, i8 0, i32 32, i1 false)
  br label %.split421.us.i

.preheader409.split.preheader.i:                  ; preds = %.preheader409.i
  br i1 %301, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader409.split.preheader.i
  %325 = trunc i64 %319 to i32
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %325
  store i16 0, ptr addrspace(3) %326, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split421.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %327 = add nuw nsw i64 %317, 1
  %exitcond.not.i = icmp eq i64 %327, 32
  br i1 %exitcond.not.i, label %.lr.ph424.i, label %.preheader409.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader409.split.preheader.i
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0196.0.copyload.i = load i16, ptr %328, align 32, !tbaa.struct !25
  %329 = trunc i64 %319 to i32
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %329
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %330, align 2, !tbaa.struct !25
  br i1 %302, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %331 = trunc i64 %319 to i32
  %332 = or disjoint i32 %331, 1
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %332
  store i16 0, ptr addrspace(3) %333, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %334 = or disjoint i64 %322, 1
  %335 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %334
  %.sroa.0196.0.copyload.1.i = load i16, ptr %335, align 2, !tbaa.struct !25
  %336 = trunc i64 %319 to i32
  %337 = or disjoint i32 %336, 1
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %337
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %338, align 2, !tbaa.struct !25
  br i1 %303, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %339 = trunc i64 %319 to i32
  %340 = or disjoint i32 %339, 2
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %340
  store i16 0, ptr addrspace(3) %341, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %342 = or disjoint i64 %322, 2
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %342
  %.sroa.0196.0.copyload.2.i = load i16, ptr %343, align 4, !tbaa.struct !25
  %344 = trunc i64 %319 to i32
  %345 = or disjoint i32 %344, 2
  %346 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %345
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %346, align 2, !tbaa.struct !25
  br i1 %304, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %347 = trunc i64 %319 to i32
  %348 = or disjoint i32 %347, 3
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %348
  store i16 0, ptr addrspace(3) %349, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %350 = or disjoint i64 %322, 3
  %351 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %350
  %.sroa.0196.0.copyload.3.i = load i16, ptr %351, align 2, !tbaa.struct !25
  %352 = trunc i64 %319 to i32
  %353 = or disjoint i32 %352, 3
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %353
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %354, align 2, !tbaa.struct !25
  br i1 %305, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %355 = trunc i64 %319 to i32
  %356 = or disjoint i32 %355, 4
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %356
  store i16 0, ptr addrspace(3) %357, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %358 = or disjoint i64 %322, 4
  %359 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %358
  %.sroa.0196.0.copyload.4.i = load i16, ptr %359, align 8, !tbaa.struct !25
  %360 = trunc i64 %319 to i32
  %361 = or disjoint i32 %360, 4
  %362 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %361
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %362, align 2, !tbaa.struct !25
  br i1 %306, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %363 = trunc i64 %319 to i32
  %364 = or disjoint i32 %363, 5
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %364
  store i16 0, ptr addrspace(3) %365, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %366 = or disjoint i64 %322, 5
  %367 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %366
  %.sroa.0196.0.copyload.5.i = load i16, ptr %367, align 2, !tbaa.struct !25
  %368 = trunc i64 %319 to i32
  %369 = or disjoint i32 %368, 5
  %370 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %369
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %370, align 2, !tbaa.struct !25
  br i1 %307, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %371 = trunc i64 %319 to i32
  %372 = or disjoint i32 %371, 6
  %373 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %372
  store i16 0, ptr addrspace(3) %373, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %374 = or disjoint i64 %322, 6
  %375 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %374
  %.sroa.0196.0.copyload.6.i = load i16, ptr %375, align 4, !tbaa.struct !25
  %376 = trunc i64 %319 to i32
  %377 = or disjoint i32 %376, 6
  %378 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %377
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %378, align 2, !tbaa.struct !25
  br i1 %308, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %379 = trunc i64 %319 to i32
  %380 = or disjoint i32 %379, 7
  %381 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %380
  store i16 0, ptr addrspace(3) %381, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %382 = or disjoint i64 %322, 7
  %383 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %382
  %.sroa.0196.0.copyload.7.i = load i16, ptr %383, align 2, !tbaa.struct !25
  %384 = trunc i64 %319 to i32
  %385 = or disjoint i32 %384, 7
  %386 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %385
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %386, align 2, !tbaa.struct !25
  br i1 %309, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %387 = trunc i64 %319 to i32
  %388 = or disjoint i32 %387, 8
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %388
  store i16 0, ptr addrspace(3) %389, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %390 = or disjoint i64 %322, 8
  %391 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %390
  %.sroa.0196.0.copyload.8.i = load i16, ptr %391, align 16, !tbaa.struct !25
  %392 = trunc i64 %319 to i32
  %393 = or disjoint i32 %392, 8
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %393
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %394, align 2, !tbaa.struct !25
  br i1 %310, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %395 = trunc i64 %319 to i32
  %396 = or disjoint i32 %395, 9
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %396
  store i16 0, ptr addrspace(3) %397, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %398 = or disjoint i64 %322, 9
  %399 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %398
  %.sroa.0196.0.copyload.9.i = load i16, ptr %399, align 2, !tbaa.struct !25
  %400 = trunc i64 %319 to i32
  %401 = or disjoint i32 %400, 9
  %402 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %401
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %402, align 2, !tbaa.struct !25
  br i1 %311, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %403 = trunc i64 %319 to i32
  %404 = or disjoint i32 %403, 10
  %405 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %404
  store i16 0, ptr addrspace(3) %405, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %406 = or disjoint i64 %322, 10
  %407 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %406
  %.sroa.0196.0.copyload.10.i = load i16, ptr %407, align 4, !tbaa.struct !25
  %408 = trunc i64 %319 to i32
  %409 = or disjoint i32 %408, 10
  %410 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %409
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %410, align 2, !tbaa.struct !25
  br i1 %312, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %411 = trunc i64 %319 to i32
  %412 = or disjoint i32 %411, 11
  %413 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %412
  store i16 0, ptr addrspace(3) %413, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %414 = or disjoint i64 %322, 11
  %415 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %414
  %.sroa.0196.0.copyload.11.i = load i16, ptr %415, align 2, !tbaa.struct !25
  %416 = trunc i64 %319 to i32
  %417 = or disjoint i32 %416, 11
  %418 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %417
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %418, align 2, !tbaa.struct !25
  br i1 %313, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %419 = trunc i64 %319 to i32
  %420 = or disjoint i32 %419, 12
  %421 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %420
  store i16 0, ptr addrspace(3) %421, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %422 = or disjoint i64 %322, 12
  %423 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %422
  %.sroa.0196.0.copyload.12.i = load i16, ptr %423, align 8, !tbaa.struct !25
  %424 = trunc i64 %319 to i32
  %425 = or disjoint i32 %424, 12
  %426 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %425
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %426, align 2, !tbaa.struct !25
  br i1 %314, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %427 = trunc i64 %319 to i32
  %428 = or disjoint i32 %427, 13
  %429 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %428
  store i16 0, ptr addrspace(3) %429, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %430 = or disjoint i64 %322, 13
  %431 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %430
  %.sroa.0196.0.copyload.13.i = load i16, ptr %431, align 2, !tbaa.struct !25
  %432 = trunc i64 %319 to i32
  %433 = or disjoint i32 %432, 13
  %434 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %433
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %434, align 2, !tbaa.struct !25
  br i1 %315, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %435 = trunc i64 %319 to i32
  %436 = or disjoint i32 %435, 14
  %437 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %436
  store i16 0, ptr addrspace(3) %437, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %438 = or disjoint i64 %322, 14
  %439 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %438
  %.sroa.0196.0.copyload.14.i = load i16, ptr %439, align 4, !tbaa.struct !25
  %440 = trunc i64 %319 to i32
  %441 = or disjoint i32 %440, 14
  %442 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %441
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %442, align 2, !tbaa.struct !25
  br i1 %316, label %443, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

443:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %444 = or disjoint i64 %322, 15
  %445 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %444
  %.sroa.0196.0.copyload.15.i = load i16, ptr %445, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %443, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %443 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %446 = trunc i64 %319 to i32
  %447 = or disjoint i32 %446, 15
  %448 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %299, i32 %447
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %448, align 2, !tbaa.struct !25
  br label %.split421.us.i

.lr.ph424.i:                                      ; preds = %.split421.us.i, %292, %288, %.loopexit413.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %449 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %450 = icmp ult i64 %449, 8
  call void @llvm.assume(i1 %450)
  %451 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %452 = icmp ult i64 %451, 4
  call void @llvm.assume(i1 %452)
  %453 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %454 = icmp ult i64 %453, 4
  call void @llvm.assume(i1 %454)
  %455 = shl nuw nsw i64 %453, 5
  %456 = shl nuw nsw i64 %451, 3
  %457 = or disjoint i64 %455, %456
  %458 = or disjoint i64 %457, %449
  %459 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %460 = inttoptr i32 %459 to ptr addrspace(3)
  %461 = getelementptr inbounds i8, ptr addrspace(3) %460, i32 512
  %462 = getelementptr inbounds i8, ptr addrspace(3) %460, i32 1024
  br label %467

._crit_edge425.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
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
  br i1 %466, label %531, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

467:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph424.i
  %468 = phi i64 [ %458, %.lr.ph424.i ], [ %476, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %.frozen.i = freeze i64 %468
  %469 = sdiv i64 %.frozen.i, 16
  %470 = srem i64 %469, 8
  %471 = mul i64 %469, 16
  %.decomposed.i = sub i64 %.frozen.i, %471
  %srem.i = srem i64 %468, 128
  %472 = trunc i64 %srem.i to i32
  %473 = getelementptr inbounds float, ptr addrspace(3) %460, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !19
  %475 = shl nsw i64 %470, 5
  br label %478

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %529, ptr addrspace(3) %473, align 4, !tbaa !19
  %476 = add i64 %468, 128
  %477 = icmp ugt i64 %468, 9223372036854775679
  br i1 %477, label %467, label %._crit_edge425.i, !llvm.loop !32

478:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %467
  %479 = phi i64 [ 0, %467 ], [ %530, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %480 = phi float [ %474, %467 ], [ %529, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %481 = add nuw nsw i64 %479, %475
  %482 = trunc i64 %481 to i32
  %483 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %461, i32 %482
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %483, align 2, !tbaa.struct !25
  %484 = shl nuw nsw i64 %479, 4
  %485 = add nsw i64 %484, %.decomposed.i
  %486 = trunc i64 %485 to i32
  %487 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %462, i32 %486
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %487, align 2, !tbaa.struct !25
  %488 = zext i16 %.sroa.0179.0.copyload.i to i32
  %489 = lshr i32 %488, 10
  %490 = and i32 %489, 31
  %491 = and i32 %488, 1023
  switch i32 %490, label %497 [
    i32 31, label %492
    i32 0, label %499
  ]

492:                                              ; preds = %478
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %493 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %491, 0
  %494 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %495 = or disjoint i32 %494, %493
  %496 = bitcast i32 %495 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

497:                                              ; preds = %478
  %498 = or disjoint i32 %491, 1024
  br label %499

499:                                              ; preds = %497, %478
  %500 = phi i32 [ %498, %497 ], [ %491, %478 ]
  %501 = uitofp i32 %500 to float
  %.not.i = icmp eq i32 %490, 0
  %502 = add nsw i32 %490, -25
  %503 = select i1 %.not.i, i32 -24, i32 %502
  %504 = call float @__ocml_ldexp_f32(float noundef %501, i32 noundef %503) #6
  %505 = fneg contract float %504
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %506 = select contract i1 %.not393394.i, float %505, float %504
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %499, %492
  %507 = phi float [ %496, %492 ], [ %506, %499 ]
  %508 = zext i16 %.sroa.0170.0.copyload.i to i32
  %509 = lshr i32 %508, 10
  %510 = and i32 %509, 31
  %511 = and i32 %508, 1023
  switch i32 %510, label %517 [
    i32 31, label %512
    i32 0, label %519
  ]

512:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %513 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %511, 0
  %514 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %515 = or disjoint i32 %514, %513
  %516 = bitcast i32 %515 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

517:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %518 = or disjoint i32 %511, 1024
  br label %519

519:                                              ; preds = %517, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %520 = phi i32 [ %518, %517 ], [ %511, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %521 = uitofp i32 %520 to float
  %.not395.i = icmp eq i32 %510, 0
  %522 = add nsw i32 %510, -25
  %523 = select i1 %.not395.i, i32 -24, i32 %522
  %524 = call float @__ocml_ldexp_f32(float noundef %521, i32 noundef %523) #6
  %525 = fneg contract float %524
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %526 = select contract i1 %.not396397.i, float %525, float %524
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %519, %512
  %527 = phi float [ %516, %512 ], [ %526, %519 ]
  %528 = fmul contract float %507, %527
  %529 = fadd contract float %480, %528
  %530 = add nuw nsw i64 %479, 1
  %exitcond478.not.i = icmp eq i64 %530, 32
  br i1 %exitcond478.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %478, !llvm.loop !33

531:                                              ; preds = %._crit_edge425.i
  %532 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %533 = icmp ult i64 %532, 4
  call void @llvm.assume(i1 %533)
  %534 = icmp eq i64 %532, 0
  br i1 %534, label %535, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

535:                                              ; preds = %531
  %536 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %537 = icmp ult i64 %536, 8
  call void @llvm.assume(i1 %537)
  %538 = icmp eq i64 %536, 0
  br i1 %538, label %.preheader408.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader408.i:                                  ; preds = %535
  %539 = sext i32 %.fr482.i to i64
  %540 = call i32 @llvm.amdgcn.groupstaticsize()
  %541 = inttoptr i32 %540 to ptr addrspace(3)
  %542 = sext i32 %463 to i64
  %543 = icmp slt i32 %4, 1
  %544 = icmp ugt i32 %4, 1
  %545 = icmp ugt i32 %4, 2
  %546 = icmp ugt i32 %4, 3
  %547 = icmp ugt i32 %4, 4
  %548 = icmp ugt i32 %4, 5
  %549 = icmp ugt i32 %4, 6
  %550 = icmp ugt i32 %4, 7
  %551 = icmp ugt i32 %4, 8
  %552 = icmp ugt i32 %4, 9
  %553 = icmp ugt i32 %4, 10
  %554 = icmp ugt i32 %4, 11
  %555 = icmp ugt i32 %4, 12
  %556 = icmp ugt i32 %4, 13
  %557 = icmp ugt i32 %4, 14
  %558 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split427.us.i, %.preheader408.i
  %559 = phi i64 [ 0, %.preheader408.i ], [ %565, %.split427.us.i ]
  %560 = icmp sge i64 %559, %539
  %561 = shl i64 %559, 4
  %.tr392.i = trunc i64 %559 to i32
  %562 = shl i32 %.tr392.i, 4
  %563 = sext i32 %562 to i64
  %564 = add nsw i64 %563, %542
  %brmerge.i = select i1 %560, i1 true, i1 %543
  br i1 %brmerge.i, label %.split427.us.i, label %.preheader.split.1.i

.split427.us.i:                                   ; preds = %654, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %565 = add i64 %559, 1
  %exitcond480.not.i = icmp eq i64 %565, 8
  br i1 %exitcond480.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %566 = trunc i64 %561 to i32
  %567 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %566
  %568 = load float, ptr addrspace(3) %567, align 4, !tbaa !19
  %569 = getelementptr inbounds float, ptr %9, i64 %564
  store float %568, ptr %569, align 32, !tbaa !19
  br i1 %544, label %.preheader.split.2.i, label %.split427.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %570 = trunc i64 %561 to i32
  %571 = or disjoint i32 %570, 1
  %572 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %571
  %573 = load float, ptr addrspace(3) %572, align 4, !tbaa !19
  %574 = or disjoint i64 %564, 1
  %575 = getelementptr inbounds float, ptr %9, i64 %574
  store float %573, ptr %575, align 4, !tbaa !19
  br i1 %545, label %.preheader.split.3.i, label %.split427.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %576 = trunc i64 %561 to i32
  %577 = or disjoint i32 %576, 2
  %578 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %577
  %579 = load float, ptr addrspace(3) %578, align 4, !tbaa !19
  %580 = or disjoint i64 %564, 2
  %581 = getelementptr inbounds float, ptr %9, i64 %580
  store float %579, ptr %581, align 8, !tbaa !19
  br i1 %546, label %.preheader.split.4.i, label %.split427.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %582 = trunc i64 %561 to i32
  %583 = or disjoint i32 %582, 3
  %584 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %583
  %585 = load float, ptr addrspace(3) %584, align 4, !tbaa !19
  %586 = or disjoint i64 %564, 3
  %587 = getelementptr inbounds float, ptr %9, i64 %586
  store float %585, ptr %587, align 4, !tbaa !19
  br i1 %547, label %.preheader.split.5.i, label %.split427.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %588 = trunc i64 %561 to i32
  %589 = or disjoint i32 %588, 4
  %590 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %589
  %591 = load float, ptr addrspace(3) %590, align 4, !tbaa !19
  %592 = or disjoint i64 %564, 4
  %593 = getelementptr inbounds float, ptr %9, i64 %592
  store float %591, ptr %593, align 16, !tbaa !19
  br i1 %548, label %.preheader.split.6.i, label %.split427.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %594 = trunc i64 %561 to i32
  %595 = or disjoint i32 %594, 5
  %596 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %595
  %597 = load float, ptr addrspace(3) %596, align 4, !tbaa !19
  %598 = or disjoint i64 %564, 5
  %599 = getelementptr inbounds float, ptr %9, i64 %598
  store float %597, ptr %599, align 4, !tbaa !19
  br i1 %549, label %.preheader.split.7.i, label %.split427.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %600 = trunc i64 %561 to i32
  %601 = or disjoint i32 %600, 6
  %602 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %601
  %603 = load float, ptr addrspace(3) %602, align 4, !tbaa !19
  %604 = or disjoint i64 %564, 6
  %605 = getelementptr inbounds float, ptr %9, i64 %604
  store float %603, ptr %605, align 8, !tbaa !19
  br i1 %550, label %.preheader.split.8.i, label %.split427.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %606 = trunc i64 %561 to i32
  %607 = or disjoint i32 %606, 7
  %608 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %607
  %609 = load float, ptr addrspace(3) %608, align 4, !tbaa !19
  %610 = or disjoint i64 %564, 7
  %611 = getelementptr inbounds float, ptr %9, i64 %610
  store float %609, ptr %611, align 4, !tbaa !19
  br i1 %551, label %.preheader.split.9.i, label %.split427.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %612 = trunc i64 %561 to i32
  %613 = or disjoint i32 %612, 8
  %614 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %613
  %615 = load float, ptr addrspace(3) %614, align 4, !tbaa !19
  %616 = or disjoint i64 %564, 8
  %617 = getelementptr inbounds float, ptr %9, i64 %616
  store float %615, ptr %617, align 32, !tbaa !19
  br i1 %552, label %.preheader.split.10.i, label %.split427.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %618 = trunc i64 %561 to i32
  %619 = or disjoint i32 %618, 9
  %620 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %619
  %621 = load float, ptr addrspace(3) %620, align 4, !tbaa !19
  %622 = or disjoint i64 %564, 9
  %623 = getelementptr inbounds float, ptr %9, i64 %622
  store float %621, ptr %623, align 4, !tbaa !19
  br i1 %553, label %.preheader.split.11.i, label %.split427.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %624 = trunc i64 %561 to i32
  %625 = or disjoint i32 %624, 10
  %626 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %625
  %627 = load float, ptr addrspace(3) %626, align 4, !tbaa !19
  %628 = or disjoint i64 %564, 10
  %629 = getelementptr inbounds float, ptr %9, i64 %628
  store float %627, ptr %629, align 8, !tbaa !19
  br i1 %554, label %.preheader.split.12.i, label %.split427.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %630 = trunc i64 %561 to i32
  %631 = or disjoint i32 %630, 11
  %632 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %631
  %633 = load float, ptr addrspace(3) %632, align 4, !tbaa !19
  %634 = or disjoint i64 %564, 11
  %635 = getelementptr inbounds float, ptr %9, i64 %634
  store float %633, ptr %635, align 4, !tbaa !19
  br i1 %555, label %.preheader.split.13.i, label %.split427.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %636 = trunc i64 %561 to i32
  %637 = or disjoint i32 %636, 12
  %638 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %637
  %639 = load float, ptr addrspace(3) %638, align 4, !tbaa !19
  %640 = or disjoint i64 %564, 12
  %641 = getelementptr inbounds float, ptr %9, i64 %640
  store float %639, ptr %641, align 16, !tbaa !19
  br i1 %556, label %.preheader.split.14.i, label %.split427.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %642 = trunc i64 %561 to i32
  %643 = or disjoint i32 %642, 13
  %644 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %643
  %645 = load float, ptr addrspace(3) %644, align 4, !tbaa !19
  %646 = or disjoint i64 %564, 13
  %647 = getelementptr inbounds float, ptr %9, i64 %646
  store float %645, ptr %647, align 4, !tbaa !19
  br i1 %557, label %.preheader.split.15.i, label %.split427.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %648 = trunc i64 %561 to i32
  %649 = or disjoint i32 %648, 14
  %650 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %649
  %651 = load float, ptr addrspace(3) %650, align 4, !tbaa !19
  %652 = or disjoint i64 %564, 14
  %653 = getelementptr inbounds float, ptr %9, i64 %652
  store float %651, ptr %653, align 8, !tbaa !19
  br i1 %558, label %654, label %.split427.us.i

654:                                              ; preds = %.preheader.split.15.i
  %655 = trunc i64 %561 to i32
  %656 = or disjoint i32 %655, 15
  %657 = getelementptr inbounds float, ptr addrspace(3) %541, i32 %656
  %658 = load float, ptr addrspace(3) %657, align 4, !tbaa !19
  %659 = or disjoint i64 %564, 15
  %660 = getelementptr inbounds float, ptr %9, i64 %659
  store float %658, ptr %660, align 4, !tbaa !19
  br label %.split427.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge425.i, %531, %535, %.split427.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5, !5}
!hipsycl.sscp.annotations = !{!6, !7, !8, !9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 4, !"amdgpu_hostcall", i32 1}
!3 = !{i32 1, !"amdgpu_code_object_version", i32 500}
!4 = !{i32 8, !"PIC Level", i32 0}
!5 = !{!"clang version 17.0.0 (http://10.4.0.1/dcutoolkit/driverruntime/llvm-project.git ff5bf917a679c83afe927af051a20b86fef7b07d)"}
!6 = !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!7 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!8 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!9 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!10 = !{!11}
!11 = distinct !{!11, !12, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv: argument 0"}
!12 = distinct !{!12, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv"}
!13 = !{!14}
!14 = distinct !{!14, !15, !"_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv: argument 0"}
!15 = distinct !{!15, !"_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv"}
!16 = !{!17}
!17 = distinct !{!17, !18, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv: argument 0"}
!18 = distinct !{!18, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{i64 0, i64 2, !26}
!26 = !{!27, !27, i64 0}
!27 = !{!"short", !21, i64 0}
!28 = distinct !{!28, !24, !29, !30}
!29 = !{!"llvm.loop.vectorize.width", i32 1}
!30 = !{!"llvm.loop.interleave.count", i32 1}
!31 = distinct !{!31, !24, !29, !30}
!32 = distinct !{!32, !24}
!33 = distinct !{!33, !24}
!34 = distinct !{!34, !24}
;----------------- End AdaptiveCpp IR dump ---------------
