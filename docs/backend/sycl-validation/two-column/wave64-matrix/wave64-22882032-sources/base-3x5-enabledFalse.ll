;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-eod_t426/kernel.cpp"
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
  %.fr479.i = freeze i32 %3
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !10
  %11 = icmp ult i64 %10, 715827882
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 429496729
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 3
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp ult i64 %18, 5
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 715827883
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 429496730
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp ult i64 %30, 5
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 3
  call void @llvm.assume(i1 %33)
  %34 = mul nuw nsw i64 %32, 5
  %35 = add nuw nsw i64 %34, %30
  %36 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %37 = inttoptr i32 %36 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 715827882
  call void @llvm.assume(i1 %39)
  %.tr.i = trunc i64 %38 to i32
  %40 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %42 = icmp ult i64 %41, 3
  call void @llvm.assume(i1 %42)
  %43 = icmp eq i64 %41, 0
  br i1 %43, label %50, label %.loopexit410.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %44 = phi i64 [ %35, %6 ], [ %48, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %45 = trunc i64 %44 to i32
  %46 = and i32 %45, 127
  %47 = getelementptr inbounds float, ptr addrspace(3) %37, i32 %46
  store float 0.000000e+00, ptr addrspace(3) %47, align 4, !tbaa !19
  %48 = add nuw nsw i64 %44, 15
  %49 = icmp ult i64 %44, 113
  br i1 %49, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

50:                                               ; preds = %._crit_edge.i
  %51 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %52 = icmp ult i64 %51, 5
  call void @llvm.assume(i1 %52)
  %53 = icmp eq i64 %51, 0
  br i1 %53, label %.preheader409.i, label %.loopexit410.i

.preheader409.i:                                  ; preds = %50
  %54 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %55 = icmp eq i64 %54, 0
  call void @llvm.assume(i1 %55)
  %56 = sext i32 %5 to i64
  %57 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %58 = inttoptr i32 %57 to ptr addrspace(3)
  %59 = getelementptr i8, ptr addrspace(3) %58, i32 512
  %60 = sext i32 %40 to i64
  %61 = icmp sgt i32 %.fr479.i, 0
  br i1 %61, label %.preheader409.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader409.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %59, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader409.split.preheader.i:                  ; preds = %.preheader409.i
  %62 = icmp sgt i32 %5, 0
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i: ; preds = %.preheader409.split.preheader.i
  store i16 0, ptr addrspace(3) %59, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.thread.i

.split.us.i:                                      ; preds = %277, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i
  %.sroa.0209.2.31.i = phi i16 [ %.sroa.0207.0.copyload.31.i, %277 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i ]
  %63 = getelementptr i8, ptr addrspace(3) %58, i32 574
  store i16 %.sroa.0209.2.31.i, ptr addrspace(3) %63, align 2, !tbaa.struct !25
  %64 = icmp ugt i32 %.fr479.i, 1
  %65 = or disjoint i64 %60, 32
  br i1 %64, label %.preheader409.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %58, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader409.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %66 = phi i64 [ %74, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %67 = icmp slt i64 %66, %56
  br i1 %67, label %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

68:                                               ; preds = %.preheader409.split.1.i
  %69 = add nuw nsw i64 %65, %66
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %69
  %.sroa.0207.0.copyload.1.i = load i16, ptr %70, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %68, %.preheader409.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %68 ], [ 0, %.preheader409.split.1.i ]
  %71 = trunc i64 %66 to i32
  %72 = add i32 %71, 32
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %72
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !25
  %74 = add nuw nsw i64 %66, 1
  %exitcond.1.not.i = icmp eq i64 %74, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader409.split.1.i, !llvm.loop !28

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %75 = icmp sgt i32 %.fr479.i, 2
  %76 = or disjoint i64 %60, 64
  br i1 %75, label %.preheader409.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %58, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader409.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %77 = phi i64 [ %85, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %78 = icmp slt i64 %77, %56
  br i1 %78, label %79, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

79:                                               ; preds = %.preheader409.split.2.i
  %80 = add nuw nsw i64 %76, %77
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %80
  %.sroa.0207.0.copyload.2.i = load i16, ptr %81, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %79, %.preheader409.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %79 ], [ 0, %.preheader409.split.2.i ]
  %82 = trunc i64 %77 to i32
  %83 = add i32 %82, 64
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %83
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %84, align 2, !tbaa.struct !25
  %85 = add nuw nsw i64 %77, 1
  %exitcond.2.not.i = icmp eq i64 %85, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader409.split.2.i, !llvm.loop !28

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %86 = icmp sgt i32 %.fr479.i, 3
  %87 = or disjoint i64 %60, 96
  br i1 %86, label %.preheader409.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %58, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader409.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %88 = phi i64 [ %96, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %89 = icmp slt i64 %88, %56
  br i1 %89, label %90, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

90:                                               ; preds = %.preheader409.split.3.i
  %91 = add nuw nsw i64 %87, %88
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %91
  %.sroa.0207.0.copyload.3.i = load i16, ptr %92, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %90, %.preheader409.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %90 ], [ 0, %.preheader409.split.3.i ]
  %93 = trunc i64 %88 to i32
  %94 = add i32 %93, 96
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %94
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %95, align 2, !tbaa.struct !25
  %96 = add nuw nsw i64 %88, 1
  %exitcond.3.not.i = icmp eq i64 %96, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader409.split.3.i, !llvm.loop !28

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %97 = icmp sgt i32 %.fr479.i, 4
  %98 = or disjoint i64 %60, 128
  br i1 %97, label %.preheader409.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %58, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader409.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %99 = phi i64 [ %107, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %100 = icmp slt i64 %99, %56
  br i1 %100, label %101, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

101:                                              ; preds = %.preheader409.split.4.i
  %102 = add nuw nsw i64 %98, %99
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %102
  %.sroa.0207.0.copyload.4.i = load i16, ptr %103, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %101, %.preheader409.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %101 ], [ 0, %.preheader409.split.4.i ]
  %104 = trunc i64 %99 to i32
  %105 = add i32 %104, 128
  %106 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %105
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %106, align 2, !tbaa.struct !25
  %107 = add nuw nsw i64 %99, 1
  %exitcond.4.not.i = icmp eq i64 %107, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader409.split.4.i, !llvm.loop !28

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %108 = icmp sgt i32 %.fr479.i, 5
  %109 = or disjoint i64 %60, 160
  br i1 %108, label %.preheader409.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %58, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader409.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %110 = phi i64 [ %118, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %111 = icmp slt i64 %110, %56
  br i1 %111, label %112, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

112:                                              ; preds = %.preheader409.split.5.i
  %113 = add nuw nsw i64 %109, %110
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %113
  %.sroa.0207.0.copyload.5.i = load i16, ptr %114, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %112, %.preheader409.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %112 ], [ 0, %.preheader409.split.5.i ]
  %115 = trunc i64 %110 to i32
  %116 = add i32 %115, 160
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %116
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %117, align 2, !tbaa.struct !25
  %118 = add nuw nsw i64 %110, 1
  %exitcond.5.not.i = icmp eq i64 %118, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader409.split.5.i, !llvm.loop !28

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %119 = icmp sgt i32 %.fr479.i, 6
  %120 = or disjoint i64 %60, 192
  br i1 %119, label %.preheader409.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %58, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader409.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %121 = phi i64 [ %129, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %122 = icmp slt i64 %121, %56
  br i1 %122, label %123, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

123:                                              ; preds = %.preheader409.split.6.i
  %124 = add nuw nsw i64 %120, %121
  %125 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %124
  %.sroa.0207.0.copyload.6.i = load i16, ptr %125, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %123, %.preheader409.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %123 ], [ 0, %.preheader409.split.6.i ]
  %126 = trunc i64 %121 to i32
  %127 = add i32 %126, 192
  %128 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %127
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %128, align 2, !tbaa.struct !25
  %129 = add nuw nsw i64 %121, 1
  %exitcond.6.not.i = icmp eq i64 %129, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader409.split.6.i, !llvm.loop !28

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %130 = icmp sgt i32 %.fr479.i, 7
  %131 = or disjoint i64 %60, 224
  br i1 %130, label %.preheader409.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %58, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.loopexit410.i

.preheader409.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %132 = phi i64 [ %140, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %133 = icmp slt i64 %132, %56
  br i1 %133, label %134, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

134:                                              ; preds = %.preheader409.split.7.i
  %135 = add nuw nsw i64 %131, %132
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %135
  %.sroa.0207.0.copyload.7.i = load i16, ptr %136, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %134, %.preheader409.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %134 ], [ 0, %.preheader409.split.7.i ]
  %137 = trunc i64 %132 to i32
  %138 = add i32 %137, 224
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %138
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %139, align 2, !tbaa.struct !25
  %140 = add nuw nsw i64 %132, 1
  %exitcond.7.not.i = icmp eq i64 %140, 32
  br i1 %exitcond.7.not.i, label %.loopexit410.i, label %.preheader409.split.7.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %.preheader409.split.preheader.i
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %60
  %.sroa.0207.0.copyload.i = load i16, ptr %141, align 32, !tbaa.struct !25
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %59, align 2, !tbaa.struct !25
  %.not528.i = icmp eq i32 %5, 1
  br i1 %.not528.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i
  %142 = getelementptr i8, ptr addrspace(3) %58, i32 514
  store i16 0, ptr addrspace(3) %142, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %143 = or disjoint i64 %60, 1
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %143
  %.sroa.0207.0.copyload.1433.i = load i16, ptr %144, align 2, !tbaa.struct !25
  %145 = getelementptr i8, ptr addrspace(3) %58, i32 514
  store i16 %.sroa.0207.0.copyload.1433.i, ptr addrspace(3) %145, align 2, !tbaa.struct !25
  %146 = icmp ugt i32 %5, 2
  br i1 %146, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.thread.i
  %147 = getelementptr i8, ptr addrspace(3) %58, i32 516
  store i16 0, ptr addrspace(3) %147, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1436.i
  %148 = or disjoint i64 %60, 2
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %148
  %.sroa.0207.0.copyload.2438.i = load i16, ptr %149, align 4, !tbaa.struct !25
  %150 = getelementptr i8, ptr addrspace(3) %58, i32 516
  store i16 %.sroa.0207.0.copyload.2438.i, ptr addrspace(3) %150, align 2, !tbaa.struct !25
  %.not529.i = icmp eq i32 %5, 3
  br i1 %.not529.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.thread.i
  %151 = getelementptr i8, ptr addrspace(3) %58, i32 518
  store i16 0, ptr addrspace(3) %151, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2441.i
  %152 = or disjoint i64 %60, 3
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %152
  %.sroa.0207.0.copyload.3443.i = load i16, ptr %153, align 2, !tbaa.struct !25
  %154 = getelementptr i8, ptr addrspace(3) %58, i32 518
  store i16 %.sroa.0207.0.copyload.3443.i, ptr addrspace(3) %154, align 2, !tbaa.struct !25
  %155 = icmp ugt i32 %5, 4
  br i1 %155, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.thread.i
  %156 = getelementptr i8, ptr addrspace(3) %58, i32 520
  store i16 0, ptr addrspace(3) %156, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3446.i
  %157 = or disjoint i64 %60, 4
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %157
  %.sroa.0207.0.copyload.4448.i = load i16, ptr %158, align 8, !tbaa.struct !25
  %159 = getelementptr i8, ptr addrspace(3) %58, i32 520
  store i16 %.sroa.0207.0.copyload.4448.i, ptr addrspace(3) %159, align 2, !tbaa.struct !25
  %.not530.i = icmp eq i32 %5, 5
  br i1 %.not530.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.thread.i
  %160 = getelementptr i8, ptr addrspace(3) %58, i32 522
  store i16 0, ptr addrspace(3) %160, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4451.i
  %161 = or disjoint i64 %60, 5
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %161
  %.sroa.0207.0.copyload.5453.i = load i16, ptr %162, align 2, !tbaa.struct !25
  %163 = getelementptr i8, ptr addrspace(3) %58, i32 522
  store i16 %.sroa.0207.0.copyload.5453.i, ptr addrspace(3) %163, align 2, !tbaa.struct !25
  %164 = icmp ugt i32 %5, 6
  br i1 %164, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.thread.i
  %165 = getelementptr i8, ptr addrspace(3) %58, i32 524
  store i16 0, ptr addrspace(3) %165, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5456.i
  %166 = or disjoint i64 %60, 6
  %167 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %166
  %.sroa.0207.0.copyload.6458.i = load i16, ptr %167, align 4, !tbaa.struct !25
  %168 = getelementptr i8, ptr addrspace(3) %58, i32 524
  store i16 %.sroa.0207.0.copyload.6458.i, ptr addrspace(3) %168, align 2, !tbaa.struct !25
  %.not531.i = icmp eq i32 %5, 7
  br i1 %.not531.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.thread.i
  %169 = getelementptr i8, ptr addrspace(3) %58, i32 526
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6461.i
  %170 = or disjoint i64 %60, 7
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0207.0.copyload.7463.i = load i16, ptr %171, align 2, !tbaa.struct !25
  %172 = getelementptr i8, ptr addrspace(3) %58, i32 526
  store i16 %.sroa.0207.0.copyload.7463.i, ptr addrspace(3) %172, align 2, !tbaa.struct !25
  %173 = icmp ugt i32 %5, 8
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.thread.i
  %174 = getelementptr i8, ptr addrspace(3) %58, i32 528
  store i16 0, ptr addrspace(3) %174, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7466.i
  %175 = or disjoint i64 %60, 8
  %176 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %175
  %.sroa.0207.0.copyload.8.i = load i16, ptr %176, align 16, !tbaa.struct !25
  %177 = getelementptr i8, ptr addrspace(3) %58, i32 528
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %177, align 2, !tbaa.struct !25
  %.not532.i = icmp eq i32 %5, 9
  br i1 %.not532.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i
  %178 = getelementptr i8, ptr addrspace(3) %58, i32 530
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i
  %179 = or disjoint i64 %60, 9
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %179
  %.sroa.0207.0.copyload.9.i = load i16, ptr %180, align 2, !tbaa.struct !25
  %181 = getelementptr i8, ptr addrspace(3) %58, i32 530
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %181, align 2, !tbaa.struct !25
  %182 = icmp ugt i32 %5, 10
  br i1 %182, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i
  %183 = getelementptr i8, ptr addrspace(3) %58, i32 532
  store i16 0, ptr addrspace(3) %183, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i
  %184 = or disjoint i64 %60, 10
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %184
  %.sroa.0207.0.copyload.10.i = load i16, ptr %185, align 4, !tbaa.struct !25
  %186 = getelementptr i8, ptr addrspace(3) %58, i32 532
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %186, align 2, !tbaa.struct !25
  %.not533.i = icmp eq i32 %5, 11
  br i1 %.not533.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i
  %187 = getelementptr i8, ptr addrspace(3) %58, i32 534
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i
  %188 = or disjoint i64 %60, 11
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %188
  %.sroa.0207.0.copyload.11.i = load i16, ptr %189, align 2, !tbaa.struct !25
  %190 = getelementptr i8, ptr addrspace(3) %58, i32 534
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %190, align 2, !tbaa.struct !25
  %191 = icmp ugt i32 %5, 12
  br i1 %191, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i
  %192 = getelementptr i8, ptr addrspace(3) %58, i32 536
  store i16 0, ptr addrspace(3) %192, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i
  %193 = or disjoint i64 %60, 12
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %193
  %.sroa.0207.0.copyload.12.i = load i16, ptr %194, align 8, !tbaa.struct !25
  %195 = getelementptr i8, ptr addrspace(3) %58, i32 536
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %195, align 2, !tbaa.struct !25
  %.not534.i = icmp eq i32 %5, 13
  br i1 %.not534.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i
  %196 = getelementptr i8, ptr addrspace(3) %58, i32 538
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i
  %197 = or disjoint i64 %60, 13
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0207.0.copyload.13.i = load i16, ptr %198, align 2, !tbaa.struct !25
  %199 = getelementptr i8, ptr addrspace(3) %58, i32 538
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %199, align 2, !tbaa.struct !25
  %200 = icmp ugt i32 %5, 14
  br i1 %200, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i
  %201 = getelementptr i8, ptr addrspace(3) %58, i32 540
  store i16 0, ptr addrspace(3) %201, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i
  %202 = or disjoint i64 %60, 14
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %202
  %.sroa.0207.0.copyload.14.i = load i16, ptr %203, align 4, !tbaa.struct !25
  %204 = getelementptr i8, ptr addrspace(3) %58, i32 540
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %204, align 2, !tbaa.struct !25
  %.not535.i = icmp eq i32 %5, 15
  br i1 %.not535.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i
  %205 = getelementptr i8, ptr addrspace(3) %58, i32 542
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i
  %206 = or disjoint i64 %60, 15
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %206
  %.sroa.0207.0.copyload.15.i = load i16, ptr %207, align 2, !tbaa.struct !25
  %208 = getelementptr i8, ptr addrspace(3) %58, i32 542
  store i16 %.sroa.0207.0.copyload.15.i, ptr addrspace(3) %208, align 2, !tbaa.struct !25
  %209 = icmp ugt i32 %5, 16
  br i1 %209, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i
  %210 = getelementptr i8, ptr addrspace(3) %58, i32 544
  store i16 0, ptr addrspace(3) %210, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i
  %211 = or disjoint i64 %60, 16
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %211
  %.sroa.0207.0.copyload.16.i = load i16, ptr %212, align 32, !tbaa.struct !25
  %213 = getelementptr i8, ptr addrspace(3) %58, i32 544
  store i16 %.sroa.0207.0.copyload.16.i, ptr addrspace(3) %213, align 2, !tbaa.struct !25
  %.not536.i = icmp eq i32 %5, 17
  br i1 %.not536.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i
  %214 = getelementptr i8, ptr addrspace(3) %58, i32 546
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i
  %215 = or disjoint i64 %60, 17
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %215
  %.sroa.0207.0.copyload.17.i = load i16, ptr %216, align 2, !tbaa.struct !25
  %217 = getelementptr i8, ptr addrspace(3) %58, i32 546
  store i16 %.sroa.0207.0.copyload.17.i, ptr addrspace(3) %217, align 2, !tbaa.struct !25
  %218 = icmp ugt i32 %5, 18
  br i1 %218, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i
  %219 = getelementptr i8, ptr addrspace(3) %58, i32 548
  store i16 0, ptr addrspace(3) %219, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i
  %220 = or disjoint i64 %60, 18
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %220
  %.sroa.0207.0.copyload.18.i = load i16, ptr %221, align 4, !tbaa.struct !25
  %222 = getelementptr i8, ptr addrspace(3) %58, i32 548
  store i16 %.sroa.0207.0.copyload.18.i, ptr addrspace(3) %222, align 2, !tbaa.struct !25
  %.not537.i = icmp eq i32 %5, 19
  br i1 %.not537.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i
  %223 = getelementptr i8, ptr addrspace(3) %58, i32 550
  store i16 0, ptr addrspace(3) %223, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i
  %224 = or disjoint i64 %60, 19
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %224
  %.sroa.0207.0.copyload.19.i = load i16, ptr %225, align 2, !tbaa.struct !25
  %226 = getelementptr i8, ptr addrspace(3) %58, i32 550
  store i16 %.sroa.0207.0.copyload.19.i, ptr addrspace(3) %226, align 2, !tbaa.struct !25
  %227 = icmp ugt i32 %5, 20
  br i1 %227, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i
  %228 = getelementptr i8, ptr addrspace(3) %58, i32 552
  store i16 0, ptr addrspace(3) %228, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i
  %229 = or disjoint i64 %60, 20
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %229
  %.sroa.0207.0.copyload.20.i = load i16, ptr %230, align 8, !tbaa.struct !25
  %231 = getelementptr i8, ptr addrspace(3) %58, i32 552
  store i16 %.sroa.0207.0.copyload.20.i, ptr addrspace(3) %231, align 2, !tbaa.struct !25
  %.not538.i = icmp eq i32 %5, 21
  br i1 %.not538.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i
  %232 = getelementptr i8, ptr addrspace(3) %58, i32 554
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i
  %233 = or disjoint i64 %60, 21
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %233
  %.sroa.0207.0.copyload.21.i = load i16, ptr %234, align 2, !tbaa.struct !25
  %235 = getelementptr i8, ptr addrspace(3) %58, i32 554
  store i16 %.sroa.0207.0.copyload.21.i, ptr addrspace(3) %235, align 2, !tbaa.struct !25
  %236 = icmp ugt i32 %5, 22
  br i1 %236, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i
  %237 = getelementptr i8, ptr addrspace(3) %58, i32 556
  store i16 0, ptr addrspace(3) %237, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i
  %238 = or disjoint i64 %60, 22
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %238
  %.sroa.0207.0.copyload.22.i = load i16, ptr %239, align 4, !tbaa.struct !25
  %240 = getelementptr i8, ptr addrspace(3) %58, i32 556
  store i16 %.sroa.0207.0.copyload.22.i, ptr addrspace(3) %240, align 2, !tbaa.struct !25
  %.not539.i = icmp eq i32 %5, 23
  br i1 %.not539.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i
  %241 = getelementptr i8, ptr addrspace(3) %58, i32 558
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i
  %242 = or disjoint i64 %60, 23
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %242
  %.sroa.0207.0.copyload.23.i = load i16, ptr %243, align 2, !tbaa.struct !25
  %244 = getelementptr i8, ptr addrspace(3) %58, i32 558
  store i16 %.sroa.0207.0.copyload.23.i, ptr addrspace(3) %244, align 2, !tbaa.struct !25
  %245 = icmp ugt i32 %5, 24
  br i1 %245, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i
  %246 = getelementptr i8, ptr addrspace(3) %58, i32 560
  store i16 0, ptr addrspace(3) %246, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i
  %247 = or disjoint i64 %60, 24
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %247
  %.sroa.0207.0.copyload.24.i = load i16, ptr %248, align 16, !tbaa.struct !25
  %249 = getelementptr i8, ptr addrspace(3) %58, i32 560
  store i16 %.sroa.0207.0.copyload.24.i, ptr addrspace(3) %249, align 2, !tbaa.struct !25
  %.not540.i = icmp eq i32 %5, 25
  br i1 %.not540.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i
  %250 = getelementptr i8, ptr addrspace(3) %58, i32 562
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i
  %251 = or disjoint i64 %60, 25
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %251
  %.sroa.0207.0.copyload.25.i = load i16, ptr %252, align 2, !tbaa.struct !25
  %253 = getelementptr i8, ptr addrspace(3) %58, i32 562
  store i16 %.sroa.0207.0.copyload.25.i, ptr addrspace(3) %253, align 2, !tbaa.struct !25
  %254 = icmp ugt i32 %5, 26
  br i1 %254, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i
  %255 = getelementptr i8, ptr addrspace(3) %58, i32 564
  store i16 0, ptr addrspace(3) %255, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i
  %256 = or disjoint i64 %60, 26
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %256
  %.sroa.0207.0.copyload.26.i = load i16, ptr %257, align 4, !tbaa.struct !25
  %258 = getelementptr i8, ptr addrspace(3) %58, i32 564
  store i16 %.sroa.0207.0.copyload.26.i, ptr addrspace(3) %258, align 2, !tbaa.struct !25
  %.not541.i = icmp eq i32 %5, 27
  br i1 %.not541.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i
  %259 = getelementptr i8, ptr addrspace(3) %58, i32 566
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i
  %260 = or disjoint i64 %60, 27
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %260
  %.sroa.0207.0.copyload.27.i = load i16, ptr %261, align 2, !tbaa.struct !25
  %262 = getelementptr i8, ptr addrspace(3) %58, i32 566
  store i16 %.sroa.0207.0.copyload.27.i, ptr addrspace(3) %262, align 2, !tbaa.struct !25
  %263 = icmp ugt i32 %5, 28
  br i1 %263, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i
  %264 = getelementptr i8, ptr addrspace(3) %58, i32 568
  store i16 0, ptr addrspace(3) %264, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i
  %265 = or disjoint i64 %60, 28
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %265
  %.sroa.0207.0.copyload.28.i = load i16, ptr %266, align 8, !tbaa.struct !25
  %267 = getelementptr i8, ptr addrspace(3) %58, i32 568
  store i16 %.sroa.0207.0.copyload.28.i, ptr addrspace(3) %267, align 2, !tbaa.struct !25
  %.not542.i = icmp eq i32 %5, 29
  br i1 %.not542.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i
  %268 = getelementptr i8, ptr addrspace(3) %58, i32 570
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i
  %269 = or disjoint i64 %60, 29
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %269
  %.sroa.0207.0.copyload.29.i = load i16, ptr %270, align 2, !tbaa.struct !25
  %271 = getelementptr i8, ptr addrspace(3) %58, i32 570
  store i16 %.sroa.0207.0.copyload.29.i, ptr addrspace(3) %271, align 2, !tbaa.struct !25
  %272 = icmp ugt i32 %5, 30
  br i1 %272, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i
  %273 = getelementptr i8, ptr addrspace(3) %58, i32 572
  store i16 0, ptr addrspace(3) %273, align 2, !tbaa.struct !25
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i
  %274 = or disjoint i64 %60, 30
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %274
  %.sroa.0207.0.copyload.30.i = load i16, ptr %275, align 4, !tbaa.struct !25
  %276 = getelementptr i8, ptr addrspace(3) %58, i32 572
  store i16 %.sroa.0207.0.copyload.30.i, ptr addrspace(3) %276, align 2, !tbaa.struct !25
  %.not543.i = icmp eq i32 %5, 31
  br i1 %.not543.i, label %.split.us.i, label %277

277:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i
  %278 = or disjoint i64 %60, 31
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %278
  %.sroa.0207.0.copyload.31.i = load i16, ptr %279, align 2, !tbaa.struct !25
  br label %.split.us.i

.loopexit410.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %50, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %280 = shl i32 %.tr.i, 9
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %281 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %282 = icmp ult i64 %281, 3
  call void @llvm.assume(i1 %282)
  %283 = icmp eq i64 %281, 0
  br i1 %283, label %284, label %.lr.ph421.i

284:                                              ; preds = %.loopexit410.i
  %285 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %286 = icmp ult i64 %285, 5
  call void @llvm.assume(i1 %286)
  %287 = icmp eq i64 %285, 0
  br i1 %287, label %288, label %.lr.ph421.i

288:                                              ; preds = %284
  %289 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %290 = icmp eq i64 %289, 0
  call void @llvm.assume(i1 %290)
  %291 = sext i32 %5 to i64
  %292 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %293 = inttoptr i32 %292 to ptr addrspace(3)
  %294 = getelementptr inbounds i8, ptr addrspace(3) %293, i32 1024
  %295 = sext i32 %280 to i64
  %296 = icmp sgt i32 %4, 0
  %297 = icmp ugt i32 %4, 1
  %298 = icmp ugt i32 %4, 2
  %299 = icmp ugt i32 %4, 3
  %300 = icmp ugt i32 %4, 4
  %301 = icmp ugt i32 %4, 5
  %302 = icmp ugt i32 %4, 6
  %303 = icmp ugt i32 %4, 7
  %304 = icmp ugt i32 %4, 8
  %305 = icmp ugt i32 %4, 9
  %306 = icmp ugt i32 %4, 10
  %307 = icmp ugt i32 %4, 11
  %308 = icmp ugt i32 %4, 12
  %309 = icmp ugt i32 %4, 13
  %310 = icmp ugt i32 %4, 14
  %311 = icmp ugt i32 %4, 15
  br label %.preheader408.i

.preheader408.i:                                  ; preds = %.split418.us.i, %288
  %312 = phi i64 [ 0, %288 ], [ %322, %.split418.us.i ]
  %313 = icmp slt i64 %312, %291
  %314 = shl i64 %312, 4
  %.tr400.i = trunc i64 %312 to i32
  %315 = shl i32 %.tr400.i, 4
  %316 = sext i32 %315 to i64
  %317 = add nsw i64 %316, %295
  %.fr419.i = freeze i1 %313
  br i1 %.fr419.i, label %.preheader408.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader408.i
  %.tr478.i = trunc i64 %312 to i32
  %318 = shl i32 %.tr478.i, 5
  %319 = add i32 %318, 1024
  %scevgep467.i = getelementptr i8, ptr addrspace(3) %293, i32 %319
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep467.i, i8 0, i32 32, i1 false)
  br label %.split418.us.i

.preheader408.split.preheader.i:                  ; preds = %.preheader408.i
  br i1 %296, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader408.split.preheader.i
  %320 = trunc i64 %314 to i32
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %320
  store i16 0, ptr addrspace(3) %321, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split418.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %322 = add nuw nsw i64 %312, 1
  %exitcond.not.i = icmp eq i64 %322, 32
  br i1 %exitcond.not.i, label %.lr.ph421.i, label %.preheader408.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader408.split.preheader.i
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %317
  %.sroa.0196.0.copyload.i = load i16, ptr %323, align 32, !tbaa.struct !25
  %324 = trunc i64 %314 to i32
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %324
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %325, align 2, !tbaa.struct !25
  br i1 %297, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %326 = trunc i64 %314 to i32
  %327 = or disjoint i32 %326, 1
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %327
  store i16 0, ptr addrspace(3) %328, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %329 = or disjoint i64 %317, 1
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %329
  %.sroa.0196.0.copyload.1.i = load i16, ptr %330, align 2, !tbaa.struct !25
  %331 = trunc i64 %314 to i32
  %332 = or disjoint i32 %331, 1
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %332
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %333, align 2, !tbaa.struct !25
  br i1 %298, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %334 = trunc i64 %314 to i32
  %335 = or disjoint i32 %334, 2
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %335
  store i16 0, ptr addrspace(3) %336, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %337 = or disjoint i64 %317, 2
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %337
  %.sroa.0196.0.copyload.2.i = load i16, ptr %338, align 4, !tbaa.struct !25
  %339 = trunc i64 %314 to i32
  %340 = or disjoint i32 %339, 2
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %340
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %341, align 2, !tbaa.struct !25
  br i1 %299, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %342 = trunc i64 %314 to i32
  %343 = or disjoint i32 %342, 3
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %343
  store i16 0, ptr addrspace(3) %344, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %345 = or disjoint i64 %317, 3
  %346 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %345
  %.sroa.0196.0.copyload.3.i = load i16, ptr %346, align 2, !tbaa.struct !25
  %347 = trunc i64 %314 to i32
  %348 = or disjoint i32 %347, 3
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %348
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %349, align 2, !tbaa.struct !25
  br i1 %300, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %350 = trunc i64 %314 to i32
  %351 = or disjoint i32 %350, 4
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %351
  store i16 0, ptr addrspace(3) %352, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %353 = or disjoint i64 %317, 4
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %353
  %.sroa.0196.0.copyload.4.i = load i16, ptr %354, align 8, !tbaa.struct !25
  %355 = trunc i64 %314 to i32
  %356 = or disjoint i32 %355, 4
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %356
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %357, align 2, !tbaa.struct !25
  br i1 %301, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %358 = trunc i64 %314 to i32
  %359 = or disjoint i32 %358, 5
  %360 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %359
  store i16 0, ptr addrspace(3) %360, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %361 = or disjoint i64 %317, 5
  %362 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %361
  %.sroa.0196.0.copyload.5.i = load i16, ptr %362, align 2, !tbaa.struct !25
  %363 = trunc i64 %314 to i32
  %364 = or disjoint i32 %363, 5
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %364
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %365, align 2, !tbaa.struct !25
  br i1 %302, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %366 = trunc i64 %314 to i32
  %367 = or disjoint i32 %366, 6
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %367
  store i16 0, ptr addrspace(3) %368, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %369 = or disjoint i64 %317, 6
  %370 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %369
  %.sroa.0196.0.copyload.6.i = load i16, ptr %370, align 4, !tbaa.struct !25
  %371 = trunc i64 %314 to i32
  %372 = or disjoint i32 %371, 6
  %373 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %372
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %373, align 2, !tbaa.struct !25
  br i1 %303, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %374 = trunc i64 %314 to i32
  %375 = or disjoint i32 %374, 7
  %376 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %375
  store i16 0, ptr addrspace(3) %376, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %377 = or disjoint i64 %317, 7
  %378 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %377
  %.sroa.0196.0.copyload.7.i = load i16, ptr %378, align 2, !tbaa.struct !25
  %379 = trunc i64 %314 to i32
  %380 = or disjoint i32 %379, 7
  %381 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %380
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %381, align 2, !tbaa.struct !25
  br i1 %304, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %382 = trunc i64 %314 to i32
  %383 = or disjoint i32 %382, 8
  %384 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %383
  store i16 0, ptr addrspace(3) %384, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %385 = or disjoint i64 %317, 8
  %386 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %385
  %.sroa.0196.0.copyload.8.i = load i16, ptr %386, align 16, !tbaa.struct !25
  %387 = trunc i64 %314 to i32
  %388 = or disjoint i32 %387, 8
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %388
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %389, align 2, !tbaa.struct !25
  br i1 %305, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %390 = trunc i64 %314 to i32
  %391 = or disjoint i32 %390, 9
  %392 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %391
  store i16 0, ptr addrspace(3) %392, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %393 = or disjoint i64 %317, 9
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %393
  %.sroa.0196.0.copyload.9.i = load i16, ptr %394, align 2, !tbaa.struct !25
  %395 = trunc i64 %314 to i32
  %396 = or disjoint i32 %395, 9
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %396
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %397, align 2, !tbaa.struct !25
  br i1 %306, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %398 = trunc i64 %314 to i32
  %399 = or disjoint i32 %398, 10
  %400 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %399
  store i16 0, ptr addrspace(3) %400, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %401 = or disjoint i64 %317, 10
  %402 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %401
  %.sroa.0196.0.copyload.10.i = load i16, ptr %402, align 4, !tbaa.struct !25
  %403 = trunc i64 %314 to i32
  %404 = or disjoint i32 %403, 10
  %405 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %404
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %405, align 2, !tbaa.struct !25
  br i1 %307, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %406 = trunc i64 %314 to i32
  %407 = or disjoint i32 %406, 11
  %408 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %407
  store i16 0, ptr addrspace(3) %408, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %409 = or disjoint i64 %317, 11
  %410 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %409
  %.sroa.0196.0.copyload.11.i = load i16, ptr %410, align 2, !tbaa.struct !25
  %411 = trunc i64 %314 to i32
  %412 = or disjoint i32 %411, 11
  %413 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %412
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %413, align 2, !tbaa.struct !25
  br i1 %308, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %414 = trunc i64 %314 to i32
  %415 = or disjoint i32 %414, 12
  %416 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %415
  store i16 0, ptr addrspace(3) %416, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %417 = or disjoint i64 %317, 12
  %418 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %417
  %.sroa.0196.0.copyload.12.i = load i16, ptr %418, align 8, !tbaa.struct !25
  %419 = trunc i64 %314 to i32
  %420 = or disjoint i32 %419, 12
  %421 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %420
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %421, align 2, !tbaa.struct !25
  br i1 %309, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %422 = trunc i64 %314 to i32
  %423 = or disjoint i32 %422, 13
  %424 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %423
  store i16 0, ptr addrspace(3) %424, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %425 = or disjoint i64 %317, 13
  %426 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %425
  %.sroa.0196.0.copyload.13.i = load i16, ptr %426, align 2, !tbaa.struct !25
  %427 = trunc i64 %314 to i32
  %428 = or disjoint i32 %427, 13
  %429 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %428
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %429, align 2, !tbaa.struct !25
  br i1 %310, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %430 = trunc i64 %314 to i32
  %431 = or disjoint i32 %430, 14
  %432 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %431
  store i16 0, ptr addrspace(3) %432, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %433 = or disjoint i64 %317, 14
  %434 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %433
  %.sroa.0196.0.copyload.14.i = load i16, ptr %434, align 4, !tbaa.struct !25
  %435 = trunc i64 %314 to i32
  %436 = or disjoint i32 %435, 14
  %437 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %436
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %437, align 2, !tbaa.struct !25
  br i1 %311, label %438, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

438:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %439 = or disjoint i64 %317, 15
  %440 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %439
  %.sroa.0196.0.copyload.15.i = load i16, ptr %440, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %438, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %438 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %441 = trunc i64 %314 to i32
  %442 = or disjoint i32 %441, 15
  %443 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %294, i32 %442
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %443, align 2, !tbaa.struct !25
  br label %.split418.us.i

.lr.ph421.i:                                      ; preds = %.split418.us.i, %284, %.loopexit410.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %444 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %445 = icmp eq i64 %444, 0
  call void @llvm.assume(i1 %445)
  %446 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %447 = icmp ult i64 %446, 5
  call void @llvm.assume(i1 %447)
  %448 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %449 = icmp ult i64 %448, 3
  call void @llvm.assume(i1 %449)
  %450 = mul nuw nsw i64 %448, 5
  %451 = add nuw nsw i64 %450, %446
  %452 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = getelementptr inbounds i8, ptr addrspace(3) %453, i32 512
  %455 = getelementptr inbounds i8, ptr addrspace(3) %453, i32 1024
  br label %460

._crit_edge422.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %456 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %457 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %458 = icmp ult i64 %457, 3
  call void @llvm.assume(i1 %458)
  %459 = icmp eq i64 %457, 0
  br i1 %459, label %524, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

460:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph421.i
  %461 = phi i64 [ %451, %.lr.ph421.i ], [ %469, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %.frozen.i = freeze i64 %461
  %462 = sdiv i64 %.frozen.i, 16
  %463 = srem i64 %462, 8
  %464 = mul i64 %462, 16
  %.decomposed.i = sub i64 %.frozen.i, %464
  %srem.i = srem i64 %461, 128
  %465 = trunc i64 %srem.i to i32
  %466 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %465
  %467 = load float, ptr addrspace(3) %466, align 4, !tbaa !19
  %468 = shl nsw i64 %463, 5
  br label %471

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %522, ptr addrspace(3) %466, align 4, !tbaa !19
  %469 = add i64 %461, 15
  %470 = icmp slt i64 %469, 128
  br i1 %470, label %460, label %._crit_edge422.i, !llvm.loop !32

471:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %460
  %472 = phi i64 [ 0, %460 ], [ %523, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %473 = phi float [ %467, %460 ], [ %522, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %474 = add nuw nsw i64 %472, %468
  %475 = trunc i64 %474 to i32
  %476 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %454, i32 %475
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %476, align 2, !tbaa.struct !25
  %477 = shl nuw nsw i64 %472, 4
  %478 = add nsw i64 %477, %.decomposed.i
  %479 = trunc i64 %478 to i32
  %480 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %455, i32 %479
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %480, align 2, !tbaa.struct !25
  %481 = zext i16 %.sroa.0179.0.copyload.i to i32
  %482 = lshr i32 %481, 10
  %483 = and i32 %482, 31
  %484 = and i32 %481, 1023
  switch i32 %483, label %490 [
    i32 31, label %485
    i32 0, label %492
  ]

485:                                              ; preds = %471
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %486 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %484, 0
  %487 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %488 = or disjoint i32 %487, %486
  %489 = bitcast i32 %488 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

490:                                              ; preds = %471
  %491 = or disjoint i32 %484, 1024
  br label %492

492:                                              ; preds = %490, %471
  %493 = phi i32 [ %491, %490 ], [ %484, %471 ]
  %494 = uitofp i32 %493 to float
  %.not.i = icmp eq i32 %483, 0
  %495 = add nsw i32 %483, -25
  %496 = select i1 %.not.i, i32 -24, i32 %495
  %497 = call float @__ocml_ldexp_f32(float noundef %494, i32 noundef %496) #6
  %498 = fneg contract float %497
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %499 = select contract i1 %.not393394.i, float %498, float %497
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %492, %485
  %500 = phi float [ %489, %485 ], [ %499, %492 ]
  %501 = zext i16 %.sroa.0170.0.copyload.i to i32
  %502 = lshr i32 %501, 10
  %503 = and i32 %502, 31
  %504 = and i32 %501, 1023
  switch i32 %503, label %510 [
    i32 31, label %505
    i32 0, label %512
  ]

505:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %506 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %504, 0
  %507 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %508 = or disjoint i32 %507, %506
  %509 = bitcast i32 %508 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

510:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %511 = or disjoint i32 %504, 1024
  br label %512

512:                                              ; preds = %510, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %513 = phi i32 [ %511, %510 ], [ %504, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %514 = uitofp i32 %513 to float
  %.not395.i = icmp eq i32 %503, 0
  %515 = add nsw i32 %503, -25
  %516 = select i1 %.not395.i, i32 -24, i32 %515
  %517 = call float @__ocml_ldexp_f32(float noundef %514, i32 noundef %516) #6
  %518 = fneg contract float %517
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %519 = select contract i1 %.not396397.i, float %518, float %517
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %512, %505
  %520 = phi float [ %509, %505 ], [ %519, %512 ]
  %521 = fmul contract float %500, %520
  %522 = fadd contract float %473, %521
  %523 = add nuw nsw i64 %472, 1
  %exitcond475.not.i = icmp eq i64 %523, 32
  br i1 %exitcond475.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %471, !llvm.loop !33

524:                                              ; preds = %._crit_edge422.i
  %525 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %526 = icmp ult i64 %525, 5
  call void @llvm.assume(i1 %526)
  %527 = icmp eq i64 %525, 0
  br i1 %527, label %528, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

528:                                              ; preds = %524
  %529 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %530 = icmp eq i64 %529, 0
  call void @llvm.assume(i1 %530)
  %531 = sext i32 %.fr479.i to i64
  %532 = call i32 @llvm.amdgcn.groupstaticsize()
  %533 = inttoptr i32 %532 to ptr addrspace(3)
  %534 = sext i32 %456 to i64
  %535 = icmp slt i32 %4, 1
  %536 = icmp ugt i32 %4, 1
  %537 = icmp ugt i32 %4, 2
  %538 = icmp ugt i32 %4, 3
  %539 = icmp ugt i32 %4, 4
  %540 = icmp ugt i32 %4, 5
  %541 = icmp ugt i32 %4, 6
  %542 = icmp ugt i32 %4, 7
  %543 = icmp ugt i32 %4, 8
  %544 = icmp ugt i32 %4, 9
  %545 = icmp ugt i32 %4, 10
  %546 = icmp ugt i32 %4, 11
  %547 = icmp ugt i32 %4, 12
  %548 = icmp ugt i32 %4, 13
  %549 = icmp ugt i32 %4, 14
  %550 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split424.us.i, %528
  %551 = phi i64 [ 0, %528 ], [ %557, %.split424.us.i ]
  %552 = icmp sge i64 %551, %531
  %553 = shl i64 %551, 4
  %.tr392.i = trunc i64 %551 to i32
  %554 = shl i32 %.tr392.i, 4
  %555 = sext i32 %554 to i64
  %556 = add nsw i64 %555, %534
  %brmerge.i = select i1 %552, i1 true, i1 %535
  br i1 %brmerge.i, label %.split424.us.i, label %.preheader.split.1.i

.split424.us.i:                                   ; preds = %646, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %557 = add i64 %551, 1
  %exitcond477.not.i = icmp eq i64 %557, 8
  br i1 %exitcond477.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %558 = trunc i64 %553 to i32
  %559 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %558
  %560 = load float, ptr addrspace(3) %559, align 4, !tbaa !19
  %561 = getelementptr inbounds float, ptr %9, i64 %556
  store float %560, ptr %561, align 32, !tbaa !19
  br i1 %536, label %.preheader.split.2.i, label %.split424.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %562 = trunc i64 %553 to i32
  %563 = or disjoint i32 %562, 1
  %564 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %563
  %565 = load float, ptr addrspace(3) %564, align 4, !tbaa !19
  %566 = or disjoint i64 %556, 1
  %567 = getelementptr inbounds float, ptr %9, i64 %566
  store float %565, ptr %567, align 4, !tbaa !19
  br i1 %537, label %.preheader.split.3.i, label %.split424.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %568 = trunc i64 %553 to i32
  %569 = or disjoint i32 %568, 2
  %570 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %569
  %571 = load float, ptr addrspace(3) %570, align 4, !tbaa !19
  %572 = or disjoint i64 %556, 2
  %573 = getelementptr inbounds float, ptr %9, i64 %572
  store float %571, ptr %573, align 8, !tbaa !19
  br i1 %538, label %.preheader.split.4.i, label %.split424.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %574 = trunc i64 %553 to i32
  %575 = or disjoint i32 %574, 3
  %576 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %575
  %577 = load float, ptr addrspace(3) %576, align 4, !tbaa !19
  %578 = or disjoint i64 %556, 3
  %579 = getelementptr inbounds float, ptr %9, i64 %578
  store float %577, ptr %579, align 4, !tbaa !19
  br i1 %539, label %.preheader.split.5.i, label %.split424.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %580 = trunc i64 %553 to i32
  %581 = or disjoint i32 %580, 4
  %582 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %581
  %583 = load float, ptr addrspace(3) %582, align 4, !tbaa !19
  %584 = or disjoint i64 %556, 4
  %585 = getelementptr inbounds float, ptr %9, i64 %584
  store float %583, ptr %585, align 16, !tbaa !19
  br i1 %540, label %.preheader.split.6.i, label %.split424.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %586 = trunc i64 %553 to i32
  %587 = or disjoint i32 %586, 5
  %588 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %587
  %589 = load float, ptr addrspace(3) %588, align 4, !tbaa !19
  %590 = or disjoint i64 %556, 5
  %591 = getelementptr inbounds float, ptr %9, i64 %590
  store float %589, ptr %591, align 4, !tbaa !19
  br i1 %541, label %.preheader.split.7.i, label %.split424.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %592 = trunc i64 %553 to i32
  %593 = or disjoint i32 %592, 6
  %594 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %593
  %595 = load float, ptr addrspace(3) %594, align 4, !tbaa !19
  %596 = or disjoint i64 %556, 6
  %597 = getelementptr inbounds float, ptr %9, i64 %596
  store float %595, ptr %597, align 8, !tbaa !19
  br i1 %542, label %.preheader.split.8.i, label %.split424.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %598 = trunc i64 %553 to i32
  %599 = or disjoint i32 %598, 7
  %600 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %599
  %601 = load float, ptr addrspace(3) %600, align 4, !tbaa !19
  %602 = or disjoint i64 %556, 7
  %603 = getelementptr inbounds float, ptr %9, i64 %602
  store float %601, ptr %603, align 4, !tbaa !19
  br i1 %543, label %.preheader.split.9.i, label %.split424.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %604 = trunc i64 %553 to i32
  %605 = or disjoint i32 %604, 8
  %606 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %605
  %607 = load float, ptr addrspace(3) %606, align 4, !tbaa !19
  %608 = or disjoint i64 %556, 8
  %609 = getelementptr inbounds float, ptr %9, i64 %608
  store float %607, ptr %609, align 32, !tbaa !19
  br i1 %544, label %.preheader.split.10.i, label %.split424.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %610 = trunc i64 %553 to i32
  %611 = or disjoint i32 %610, 9
  %612 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %611
  %613 = load float, ptr addrspace(3) %612, align 4, !tbaa !19
  %614 = or disjoint i64 %556, 9
  %615 = getelementptr inbounds float, ptr %9, i64 %614
  store float %613, ptr %615, align 4, !tbaa !19
  br i1 %545, label %.preheader.split.11.i, label %.split424.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %616 = trunc i64 %553 to i32
  %617 = or disjoint i32 %616, 10
  %618 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %617
  %619 = load float, ptr addrspace(3) %618, align 4, !tbaa !19
  %620 = or disjoint i64 %556, 10
  %621 = getelementptr inbounds float, ptr %9, i64 %620
  store float %619, ptr %621, align 8, !tbaa !19
  br i1 %546, label %.preheader.split.12.i, label %.split424.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %622 = trunc i64 %553 to i32
  %623 = or disjoint i32 %622, 11
  %624 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %623
  %625 = load float, ptr addrspace(3) %624, align 4, !tbaa !19
  %626 = or disjoint i64 %556, 11
  %627 = getelementptr inbounds float, ptr %9, i64 %626
  store float %625, ptr %627, align 4, !tbaa !19
  br i1 %547, label %.preheader.split.13.i, label %.split424.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %628 = trunc i64 %553 to i32
  %629 = or disjoint i32 %628, 12
  %630 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %629
  %631 = load float, ptr addrspace(3) %630, align 4, !tbaa !19
  %632 = or disjoint i64 %556, 12
  %633 = getelementptr inbounds float, ptr %9, i64 %632
  store float %631, ptr %633, align 16, !tbaa !19
  br i1 %548, label %.preheader.split.14.i, label %.split424.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %634 = trunc i64 %553 to i32
  %635 = or disjoint i32 %634, 13
  %636 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %635
  %637 = load float, ptr addrspace(3) %636, align 4, !tbaa !19
  %638 = or disjoint i64 %556, 13
  %639 = getelementptr inbounds float, ptr %9, i64 %638
  store float %637, ptr %639, align 4, !tbaa !19
  br i1 %549, label %.preheader.split.15.i, label %.split424.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %640 = trunc i64 %553 to i32
  %641 = or disjoint i32 %640, 14
  %642 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %641
  %643 = load float, ptr addrspace(3) %642, align 4, !tbaa !19
  %644 = or disjoint i64 %556, 14
  %645 = getelementptr inbounds float, ptr %9, i64 %644
  store float %643, ptr %645, align 8, !tbaa !19
  br i1 %550, label %646, label %.split424.us.i

646:                                              ; preds = %.preheader.split.15.i
  %647 = trunc i64 %553 to i32
  %648 = or disjoint i32 %647, 15
  %649 = getelementptr inbounds float, ptr addrspace(3) %533, i32 %648
  %650 = load float, ptr addrspace(3) %649, align 4, !tbaa !19
  %651 = or disjoint i64 %556, 15
  %652 = getelementptr inbounds float, ptr %9, i64 %651
  store float %650, ptr %652, align 4, !tbaa !19
  br label %.split424.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge422.i, %524, %.split424.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="15,15" }
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
