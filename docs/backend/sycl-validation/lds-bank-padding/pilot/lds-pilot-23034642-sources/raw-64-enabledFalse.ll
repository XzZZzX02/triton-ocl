;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-sipavk3b/kernel.cpp"
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
  %.fr434.i = freeze i32 %3
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !10
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
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
  br i1 %40, label %.preheader408.i, label %.loopexit409.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

.preheader408.i:                                  ; preds = %._crit_edge.i
  %46 = shl i32 %.tr.i, 9
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
  %56 = icmp sgt i32 %.fr434.i, 0
  br i1 %56, label %.preheader408.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader408.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %54, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %57 = icmp sgt i32 %.fr434.i, 1
  %58 = or disjoint i64 %55, 64
  br i1 %57, label %.preheader408.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %53, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader408.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %59 = phi i64 [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %60 = icmp slt i64 %59, %51
  br i1 %60, label %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

61:                                               ; preds = %.preheader408.split.1.i
  %62 = add nuw nsw i64 %58, %59
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %62
  %.sroa.0207.0.copyload.1.i = load i16, ptr %63, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %61, %.preheader408.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %61 ], [ 0, %.preheader408.split.1.i ]
  %64 = trunc i64 %59 to i32
  %65 = add i32 %64, 64
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %65
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !25
  %67 = add nuw nsw i64 %59, 1
  %exitcond.1.not.i = icmp eq i64 %67, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader408.split.1.i, !llvm.loop !28

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %68 = icmp sgt i32 %.fr434.i, 2
  %69 = or disjoint i64 %55, 128
  br i1 %68, label %.preheader408.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %53, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader408.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %70 = phi i64 [ %78, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %71 = icmp slt i64 %70, %51
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

72:                                               ; preds = %.preheader408.split.2.i
  %73 = add nuw nsw i64 %69, %70
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0207.0.copyload.2.i = load i16, ptr %74, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %72, %.preheader408.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %72 ], [ 0, %.preheader408.split.2.i ]
  %75 = trunc i64 %70 to i32
  %76 = add i32 %75, 128
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %76
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %77, align 2, !tbaa.struct !25
  %78 = add nuw nsw i64 %70, 1
  %exitcond.2.not.i = icmp eq i64 %78, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader408.split.2.i, !llvm.loop !28

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %79 = icmp sgt i32 %.fr434.i, 3
  %80 = or disjoint i64 %55, 192
  br i1 %79, label %.preheader408.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %53, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader408.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %81 = phi i64 [ %89, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %82 = icmp slt i64 %81, %51
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

83:                                               ; preds = %.preheader408.split.3.i
  %84 = add nuw nsw i64 %80, %81
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0207.0.copyload.3.i = load i16, ptr %85, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %83, %.preheader408.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %83 ], [ 0, %.preheader408.split.3.i ]
  %86 = trunc i64 %81 to i32
  %87 = add i32 %86, 192
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %87
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %88, align 2, !tbaa.struct !25
  %89 = add nuw nsw i64 %81, 1
  %exitcond.3.not.i = icmp eq i64 %89, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader408.split.3.i, !llvm.loop !28

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %90 = icmp sgt i32 %.fr434.i, 4
  %91 = or disjoint i64 %55, 256
  br i1 %90, label %.preheader408.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %53, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader408.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %92 = phi i64 [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %93 = icmp slt i64 %92, %51
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

94:                                               ; preds = %.preheader408.split.4.i
  %95 = add nuw nsw i64 %91, %92
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0207.0.copyload.4.i = load i16, ptr %96, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %94, %.preheader408.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %94 ], [ 0, %.preheader408.split.4.i ]
  %97 = trunc i64 %92 to i32
  %98 = add i32 %97, 256
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %98
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %99, align 2, !tbaa.struct !25
  %100 = add nuw nsw i64 %92, 1
  %exitcond.4.not.i = icmp eq i64 %100, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader408.split.4.i, !llvm.loop !28

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %101 = icmp sgt i32 %.fr434.i, 5
  %102 = or disjoint i64 %55, 320
  br i1 %101, label %.preheader408.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %53, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader408.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %103 = phi i64 [ %111, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %104 = icmp slt i64 %103, %51
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

105:                                              ; preds = %.preheader408.split.5.i
  %106 = add nuw nsw i64 %102, %103
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0207.0.copyload.5.i = load i16, ptr %107, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %105, %.preheader408.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %105 ], [ 0, %.preheader408.split.5.i ]
  %108 = trunc i64 %103 to i32
  %109 = add i32 %108, 320
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %109
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  %111 = add nuw nsw i64 %103, 1
  %exitcond.5.not.i = icmp eq i64 %111, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader408.split.5.i, !llvm.loop !28

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %112 = icmp sgt i32 %.fr434.i, 6
  %113 = or disjoint i64 %55, 384
  br i1 %112, label %.preheader408.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %53, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader408.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %114 = phi i64 [ %122, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %115 = icmp slt i64 %114, %51
  br i1 %115, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

116:                                              ; preds = %.preheader408.split.6.i
  %117 = add nuw nsw i64 %113, %114
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0207.0.copyload.6.i = load i16, ptr %118, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %116, %.preheader408.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %116 ], [ 0, %.preheader408.split.6.i ]
  %119 = trunc i64 %114 to i32
  %120 = add i32 %119, 384
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %120
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  %122 = add nuw nsw i64 %114, 1
  %exitcond.6.not.i = icmp eq i64 %122, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader408.split.6.i, !llvm.loop !28

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %123 = icmp sgt i32 %.fr434.i, 7
  %124 = or disjoint i64 %55, 448
  br i1 %123, label %.preheader408.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %53, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit409.i

.preheader408.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %125 = phi i64 [ %133, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %126 = icmp slt i64 %125, %51
  br i1 %126, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

127:                                              ; preds = %.preheader408.split.7.i
  %128 = add nuw nsw i64 %124, %125
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0207.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %127, %.preheader408.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %127 ], [ 0, %.preheader408.split.7.i ]
  %130 = trunc i64 %125 to i32
  %131 = add i32 %130, 448
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %131
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !25
  %133 = add nuw nsw i64 %125, 1
  %exitcond.7.not.i = icmp eq i64 %133, 64
  br i1 %exitcond.7.not.i, label %.loopexit409.i, label %.preheader408.split.7.i, !llvm.loop !28

.preheader408.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %.preheader408.i
  %134 = phi i64 [ %141, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i ], [ 0, %.preheader408.i ]
  %135 = icmp slt i64 %134, %51
  br i1 %135, label %136, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

136:                                              ; preds = %.preheader408.split.i
  %137 = add nuw nsw i64 %134, %55
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %137
  %.sroa.0207.0.copyload.i = load i16, ptr %138, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %136, %.preheader408.split.i
  %.sroa.0209.2.i = phi i16 [ %.sroa.0207.0.copyload.i, %136 ], [ 0, %.preheader408.split.i ]
  %139 = trunc i64 %134 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %139
  store i16 %.sroa.0209.2.i, ptr addrspace(3) %140, align 2, !tbaa.struct !25
  %141 = add nuw nsw i64 %134, 1
  %exitcond.not.i = icmp eq i64 %141, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader408.split.i, !llvm.loop !28

.loopexit409.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %142 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %143 = icmp ult i64 %142, 64
  call void @llvm.assume(i1 %143)
  %144 = icmp eq i64 %142, 0
  br i1 %144, label %145, label %.lr.ph418.i

145:                                              ; preds = %.loopexit409.i
  %146 = shl i32 %.tr.i, 10
  %147 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %148 = icmp eq i64 %147, 0
  call void @llvm.assume(i1 %148)
  %149 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %150 = icmp eq i64 %149, 0
  call void @llvm.assume(i1 %150)
  %151 = sext i32 %5 to i64
  %152 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %153 = inttoptr i32 %152 to ptr addrspace(3)
  %154 = getelementptr inbounds i8, ptr addrspace(3) %153, i32 1536
  %155 = sext i32 %146 to i64
  %156 = icmp sgt i32 %4, 0
  %157 = icmp ugt i32 %4, 1
  %158 = icmp ugt i32 %4, 2
  %159 = icmp ugt i32 %4, 3
  %160 = icmp ugt i32 %4, 4
  %161 = icmp ugt i32 %4, 5
  %162 = icmp ugt i32 %4, 6
  %163 = icmp ugt i32 %4, 7
  %164 = icmp ugt i32 %4, 8
  %165 = icmp ugt i32 %4, 9
  %166 = icmp ugt i32 %4, 10
  %167 = icmp ugt i32 %4, 11
  %168 = icmp ugt i32 %4, 12
  %169 = icmp ugt i32 %4, 13
  %170 = icmp ugt i32 %4, 14
  %171 = icmp ugt i32 %4, 15
  br label %.preheader407.i

.preheader407.i:                                  ; preds = %.split415.us.i, %145
  %172 = phi i64 [ 0, %145 ], [ %182, %.split415.us.i ]
  %173 = icmp slt i64 %172, %151
  %174 = shl i64 %172, 4
  %.tr400.i = trunc i64 %172 to i32
  %175 = shl i32 %.tr400.i, 4
  %176 = sext i32 %175 to i64
  %177 = add nsw i64 %176, %155
  %.fr416.i = freeze i1 %173
  br i1 %.fr416.i, label %.preheader407.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader407.i
  %.tr433.i = trunc i64 %172 to i32
  %178 = shl i32 %.tr433.i, 5
  %179 = add i32 %178, 1536
  %scevgep427.i = getelementptr i8, ptr addrspace(3) %153, i32 %179
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep427.i, i8 0, i32 32, i1 false)
  br label %.split415.us.i

.preheader407.split.preheader.i:                  ; preds = %.preheader407.i
  br i1 %156, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader407.split.preheader.i
  %180 = trunc i64 %174 to i32
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %180
  store i16 0, ptr addrspace(3) %181, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split415.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %182 = add nuw nsw i64 %172, 1
  %exitcond429.not.i = icmp eq i64 %182, 64
  br i1 %exitcond429.not.i, label %.lr.ph418.i, label %.preheader407.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader407.split.preheader.i
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %177
  %.sroa.0196.0.copyload.i = load i16, ptr %183, align 32, !tbaa.struct !25
  %184 = trunc i64 %174 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %184
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %185, align 2, !tbaa.struct !25
  br i1 %157, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %186 = trunc i64 %174 to i32
  %187 = or disjoint i32 %186, 1
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %187
  store i16 0, ptr addrspace(3) %188, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %189 = or disjoint i64 %177, 1
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %189
  %.sroa.0196.0.copyload.1.i = load i16, ptr %190, align 2, !tbaa.struct !25
  %191 = trunc i64 %174 to i32
  %192 = or disjoint i32 %191, 1
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %192
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %193, align 2, !tbaa.struct !25
  br i1 %158, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %194 = trunc i64 %174 to i32
  %195 = or disjoint i32 %194, 2
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %195
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %197 = or disjoint i64 %177, 2
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %197
  %.sroa.0196.0.copyload.2.i = load i16, ptr %198, align 4, !tbaa.struct !25
  %199 = trunc i64 %174 to i32
  %200 = or disjoint i32 %199, 2
  %201 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %200
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %201, align 2, !tbaa.struct !25
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %202 = trunc i64 %174 to i32
  %203 = or disjoint i32 %202, 3
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %203
  store i16 0, ptr addrspace(3) %204, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %205 = or disjoint i64 %177, 3
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %205
  %.sroa.0196.0.copyload.3.i = load i16, ptr %206, align 2, !tbaa.struct !25
  %207 = trunc i64 %174 to i32
  %208 = or disjoint i32 %207, 3
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %208
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %209, align 2, !tbaa.struct !25
  br i1 %160, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %210 = trunc i64 %174 to i32
  %211 = or disjoint i32 %210, 4
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %211
  store i16 0, ptr addrspace(3) %212, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %213 = or disjoint i64 %177, 4
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %213
  %.sroa.0196.0.copyload.4.i = load i16, ptr %214, align 8, !tbaa.struct !25
  %215 = trunc i64 %174 to i32
  %216 = or disjoint i32 %215, 4
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %216
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %217, align 2, !tbaa.struct !25
  br i1 %161, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %218 = trunc i64 %174 to i32
  %219 = or disjoint i32 %218, 5
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %219
  store i16 0, ptr addrspace(3) %220, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %221 = or disjoint i64 %177, 5
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %221
  %.sroa.0196.0.copyload.5.i = load i16, ptr %222, align 2, !tbaa.struct !25
  %223 = trunc i64 %174 to i32
  %224 = or disjoint i32 %223, 5
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %224
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %225, align 2, !tbaa.struct !25
  br i1 %162, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %226 = trunc i64 %174 to i32
  %227 = or disjoint i32 %226, 6
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %227
  store i16 0, ptr addrspace(3) %228, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %229 = or disjoint i64 %177, 6
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %229
  %.sroa.0196.0.copyload.6.i = load i16, ptr %230, align 4, !tbaa.struct !25
  %231 = trunc i64 %174 to i32
  %232 = or disjoint i32 %231, 6
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %232
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %233, align 2, !tbaa.struct !25
  br i1 %163, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %234 = trunc i64 %174 to i32
  %235 = or disjoint i32 %234, 7
  %236 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %235
  store i16 0, ptr addrspace(3) %236, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %237 = or disjoint i64 %177, 7
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %237
  %.sroa.0196.0.copyload.7.i = load i16, ptr %238, align 2, !tbaa.struct !25
  %239 = trunc i64 %174 to i32
  %240 = or disjoint i32 %239, 7
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %240
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %241, align 2, !tbaa.struct !25
  br i1 %164, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %242 = trunc i64 %174 to i32
  %243 = or disjoint i32 %242, 8
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %243
  store i16 0, ptr addrspace(3) %244, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %245 = or disjoint i64 %177, 8
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %245
  %.sroa.0196.0.copyload.8.i = load i16, ptr %246, align 16, !tbaa.struct !25
  %247 = trunc i64 %174 to i32
  %248 = or disjoint i32 %247, 8
  %249 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %248
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %249, align 2, !tbaa.struct !25
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %250 = trunc i64 %174 to i32
  %251 = or disjoint i32 %250, 9
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %251
  store i16 0, ptr addrspace(3) %252, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %253 = or disjoint i64 %177, 9
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %253
  %.sroa.0196.0.copyload.9.i = load i16, ptr %254, align 2, !tbaa.struct !25
  %255 = trunc i64 %174 to i32
  %256 = or disjoint i32 %255, 9
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %256
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %257, align 2, !tbaa.struct !25
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %258 = trunc i64 %174 to i32
  %259 = or disjoint i32 %258, 10
  %260 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %259
  store i16 0, ptr addrspace(3) %260, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %261 = or disjoint i64 %177, 10
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %261
  %.sroa.0196.0.copyload.10.i = load i16, ptr %262, align 4, !tbaa.struct !25
  %263 = trunc i64 %174 to i32
  %264 = or disjoint i32 %263, 10
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %264
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %265, align 2, !tbaa.struct !25
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %266 = trunc i64 %174 to i32
  %267 = or disjoint i32 %266, 11
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %267
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %269 = or disjoint i64 %177, 11
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %269
  %.sroa.0196.0.copyload.11.i = load i16, ptr %270, align 2, !tbaa.struct !25
  %271 = trunc i64 %174 to i32
  %272 = or disjoint i32 %271, 11
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %272
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %273, align 2, !tbaa.struct !25
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %274 = trunc i64 %174 to i32
  %275 = or disjoint i32 %274, 12
  %276 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %275
  store i16 0, ptr addrspace(3) %276, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %277 = or disjoint i64 %177, 12
  %278 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %277
  %.sroa.0196.0.copyload.12.i = load i16, ptr %278, align 8, !tbaa.struct !25
  %279 = trunc i64 %174 to i32
  %280 = or disjoint i32 %279, 12
  %281 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %280
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %281, align 2, !tbaa.struct !25
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %282 = trunc i64 %174 to i32
  %283 = or disjoint i32 %282, 13
  %284 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %283
  store i16 0, ptr addrspace(3) %284, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %285 = or disjoint i64 %177, 13
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %285
  %.sroa.0196.0.copyload.13.i = load i16, ptr %286, align 2, !tbaa.struct !25
  %287 = trunc i64 %174 to i32
  %288 = or disjoint i32 %287, 13
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %288
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %289, align 2, !tbaa.struct !25
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %290 = trunc i64 %174 to i32
  %291 = or disjoint i32 %290, 14
  %292 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %291
  store i16 0, ptr addrspace(3) %292, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %293 = or disjoint i64 %177, 14
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %293
  %.sroa.0196.0.copyload.14.i = load i16, ptr %294, align 4, !tbaa.struct !25
  %295 = trunc i64 %174 to i32
  %296 = or disjoint i32 %295, 14
  %297 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %296
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %297, align 2, !tbaa.struct !25
  br i1 %171, label %298, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

298:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %299 = or disjoint i64 %177, 15
  %300 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %299
  %.sroa.0196.0.copyload.15.i = load i16, ptr %300, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %298, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %298 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %301 = trunc i64 %174 to i32
  %302 = or disjoint i32 %301, 15
  %303 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %302
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %303, align 2, !tbaa.struct !25
  br label %.split415.us.i

.lr.ph418.i:                                      ; preds = %.split415.us.i, %.loopexit409.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %304 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %305 = icmp eq i64 %304, 0
  call void @llvm.assume(i1 %305)
  %306 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %307 = icmp eq i64 %306, 0
  call void @llvm.assume(i1 %307)
  %308 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %309 = icmp ult i64 %308, 64
  call void @llvm.assume(i1 %309)
  %310 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %311 = inttoptr i32 %310 to ptr addrspace(3)
  %312 = getelementptr inbounds i8, ptr addrspace(3) %311, i32 512
  %313 = getelementptr inbounds i8, ptr addrspace(3) %311, i32 1536
  %314 = and i64 %308, 15
  br label %318

._crit_edge419.i:                                 ; preds = %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i1.i.i.preheader.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %315 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %316 = icmp ult i64 %315, 64
  call void @llvm.assume(i1 %316)
  %317 = icmp eq i64 %315, 0
  br i1 %317, label %379, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

318:                                              ; preds = %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i1.i.i.preheader.i, %.lr.ph418.i
  %319 = phi i64 [ %308, %.lr.ph418.i ], [ %377, %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i1.i.i.preheader.i ]
  %320 = shl nuw nsw i64 %319, 2
  %321 = and i64 %320, 448
  %322 = trunc i64 %319 to i32
  %323 = getelementptr inbounds float, ptr addrspace(3) %311, i32 %322
  %.pre.i = load float, ptr addrspace(3) %323, align 4, !tbaa !19
  br label %324

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %318
  %325 = phi float [ %.pre.i, %318 ], [ %375, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %326 = phi i64 [ 0, %318 ], [ %376, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %327 = add nuw nsw i64 %326, %321
  %328 = trunc i64 %327 to i32
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %312, i32 %328
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %329, align 2, !tbaa.struct !25
  %330 = shl nuw nsw i64 %326, 4
  %331 = or disjoint i64 %330, %314
  %332 = trunc i64 %331 to i32
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %313, i32 %332
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %333, align 2, !tbaa.struct !25
  %334 = zext i16 %.sroa.0185.0.copyload.i to i32
  %335 = lshr i32 %334, 10
  %336 = and i32 %335, 31
  %337 = and i32 %334, 1023
  switch i32 %336, label %343 [
    i32 31, label %338
    i32 0, label %345
  ]

338:                                              ; preds = %324
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %339 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %337, 0
  %340 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %341 = or disjoint i32 %340, %339
  %342 = bitcast i32 %341 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

343:                                              ; preds = %324
  %344 = or disjoint i32 %337, 1024
  br label %345

345:                                              ; preds = %343, %324
  %346 = phi i32 [ %344, %343 ], [ %337, %324 ]
  %347 = uitofp i32 %346 to float
  %.not.i = icmp eq i32 %336, 0
  %348 = add nsw i32 %336, -25
  %349 = select i1 %.not.i, i32 -24, i32 %348
  %350 = call float @__ocml_ldexp_f32(float noundef %347, i32 noundef %349) #6
  %351 = fneg contract float %350
  %.not393394.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %352 = select contract i1 %.not393394.i, float %351, float %350
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %345, %338
  %353 = phi float [ %342, %338 ], [ %352, %345 ]
  %354 = zext i16 %.sroa.0176.0.copyload.i to i32
  %355 = lshr i32 %354, 10
  %356 = and i32 %355, 31
  %357 = and i32 %354, 1023
  switch i32 %356, label %363 [
    i32 31, label %358
    i32 0, label %365
  ]

358:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %359 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %357, 0
  %360 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %361 = or disjoint i32 %360, %359
  %362 = bitcast i32 %361 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

363:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %364 = or disjoint i32 %357, 1024
  br label %365

365:                                              ; preds = %363, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %366 = phi i32 [ %364, %363 ], [ %357, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %367 = uitofp i32 %366 to float
  %.not395.i = icmp eq i32 %356, 0
  %368 = add nsw i32 %356, -25
  %369 = select i1 %.not395.i, i32 -24, i32 %368
  %370 = call float @__ocml_ldexp_f32(float noundef %367, i32 noundef %369) #6
  %371 = fneg contract float %370
  %.not396397.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %372 = select contract i1 %.not396397.i, float %371, float %370
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %365, %358
  %373 = phi float [ %362, %358 ], [ %372, %365 ]
  %374 = fmul contract float %353, %373
  %375 = fadd contract float %325, %374
  store float %375, ptr addrspace(3) %323, align 4, !tbaa !19
  %376 = add nuw nsw i64 %326, 1
  %exitcond430.not.i = icmp eq i64 %376, 64
  br i1 %exitcond430.not.i, label %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i1.i.i.preheader.i, label %324, !llvm.loop !32

_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i1.i.i.preheader.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %377 = add nuw nsw i64 %319, 64
  %378 = icmp ult i64 %319, 64
  br i1 %378, label %318, label %._crit_edge419.i, !llvm.loop !33

379:                                              ; preds = %._crit_edge419.i
  %380 = shl nuw i32 %.tr.i, 7
  %381 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %382 = icmp eq i64 %381, 0
  call void @llvm.assume(i1 %382)
  %383 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %384 = icmp eq i64 %383, 0
  call void @llvm.assume(i1 %384)
  %385 = sext i32 %.fr434.i to i64
  %386 = call i32 @llvm.amdgcn.groupstaticsize()
  %387 = inttoptr i32 %386 to ptr addrspace(3)
  %388 = sext i32 %380 to i64
  %389 = icmp slt i32 %4, 1
  %390 = icmp ugt i32 %4, 1
  %391 = icmp ugt i32 %4, 2
  %392 = icmp ugt i32 %4, 3
  %393 = icmp ugt i32 %4, 4
  %394 = icmp ugt i32 %4, 5
  %395 = icmp ugt i32 %4, 6
  %396 = icmp ugt i32 %4, 7
  %397 = icmp ugt i32 %4, 8
  %398 = icmp ugt i32 %4, 9
  %399 = icmp ugt i32 %4, 10
  %400 = icmp ugt i32 %4, 11
  %401 = icmp ugt i32 %4, 12
  %402 = icmp ugt i32 %4, 13
  %403 = icmp ugt i32 %4, 14
  %404 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split421.us.i, %379
  %405 = phi i64 [ 0, %379 ], [ %411, %.split421.us.i ]
  %406 = icmp sge i64 %405, %385
  %407 = shl i64 %405, 4
  %.tr392.i = trunc i64 %405 to i32
  %408 = shl i32 %.tr392.i, 4
  %409 = sext i32 %408 to i64
  %410 = add nsw i64 %409, %388
  %brmerge.i = select i1 %406, i1 true, i1 %389
  br i1 %brmerge.i, label %.split421.us.i, label %.preheader.split.1.i

.split421.us.i:                                   ; preds = %500, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %411 = add i64 %405, 1
  %exitcond432.not.i = icmp eq i64 %411, 8
  br i1 %exitcond432.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %412 = trunc i64 %407 to i32
  %413 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %412
  %414 = load float, ptr addrspace(3) %413, align 4, !tbaa !19
  %415 = getelementptr inbounds float, ptr %9, i64 %410
  store float %414, ptr %415, align 32, !tbaa !19
  br i1 %390, label %.preheader.split.2.i, label %.split421.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %416 = trunc i64 %407 to i32
  %417 = or disjoint i32 %416, 1
  %418 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !19
  %420 = or disjoint i64 %410, 1
  %421 = getelementptr inbounds float, ptr %9, i64 %420
  store float %419, ptr %421, align 4, !tbaa !19
  br i1 %391, label %.preheader.split.3.i, label %.split421.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %422 = trunc i64 %407 to i32
  %423 = or disjoint i32 %422, 2
  %424 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %423
  %425 = load float, ptr addrspace(3) %424, align 4, !tbaa !19
  %426 = or disjoint i64 %410, 2
  %427 = getelementptr inbounds float, ptr %9, i64 %426
  store float %425, ptr %427, align 8, !tbaa !19
  br i1 %392, label %.preheader.split.4.i, label %.split421.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %428 = trunc i64 %407 to i32
  %429 = or disjoint i32 %428, 3
  %430 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %429
  %431 = load float, ptr addrspace(3) %430, align 4, !tbaa !19
  %432 = or disjoint i64 %410, 3
  %433 = getelementptr inbounds float, ptr %9, i64 %432
  store float %431, ptr %433, align 4, !tbaa !19
  br i1 %393, label %.preheader.split.5.i, label %.split421.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %434 = trunc i64 %407 to i32
  %435 = or disjoint i32 %434, 4
  %436 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %435
  %437 = load float, ptr addrspace(3) %436, align 4, !tbaa !19
  %438 = or disjoint i64 %410, 4
  %439 = getelementptr inbounds float, ptr %9, i64 %438
  store float %437, ptr %439, align 16, !tbaa !19
  br i1 %394, label %.preheader.split.6.i, label %.split421.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %440 = trunc i64 %407 to i32
  %441 = or disjoint i32 %440, 5
  %442 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %441
  %443 = load float, ptr addrspace(3) %442, align 4, !tbaa !19
  %444 = or disjoint i64 %410, 5
  %445 = getelementptr inbounds float, ptr %9, i64 %444
  store float %443, ptr %445, align 4, !tbaa !19
  br i1 %395, label %.preheader.split.7.i, label %.split421.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %446 = trunc i64 %407 to i32
  %447 = or disjoint i32 %446, 6
  %448 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %447
  %449 = load float, ptr addrspace(3) %448, align 4, !tbaa !19
  %450 = or disjoint i64 %410, 6
  %451 = getelementptr inbounds float, ptr %9, i64 %450
  store float %449, ptr %451, align 8, !tbaa !19
  br i1 %396, label %.preheader.split.8.i, label %.split421.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %452 = trunc i64 %407 to i32
  %453 = or disjoint i32 %452, 7
  %454 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %453
  %455 = load float, ptr addrspace(3) %454, align 4, !tbaa !19
  %456 = or disjoint i64 %410, 7
  %457 = getelementptr inbounds float, ptr %9, i64 %456
  store float %455, ptr %457, align 4, !tbaa !19
  br i1 %397, label %.preheader.split.9.i, label %.split421.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %458 = trunc i64 %407 to i32
  %459 = or disjoint i32 %458, 8
  %460 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %459
  %461 = load float, ptr addrspace(3) %460, align 4, !tbaa !19
  %462 = or disjoint i64 %410, 8
  %463 = getelementptr inbounds float, ptr %9, i64 %462
  store float %461, ptr %463, align 32, !tbaa !19
  br i1 %398, label %.preheader.split.10.i, label %.split421.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %464 = trunc i64 %407 to i32
  %465 = or disjoint i32 %464, 9
  %466 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %465
  %467 = load float, ptr addrspace(3) %466, align 4, !tbaa !19
  %468 = or disjoint i64 %410, 9
  %469 = getelementptr inbounds float, ptr %9, i64 %468
  store float %467, ptr %469, align 4, !tbaa !19
  br i1 %399, label %.preheader.split.11.i, label %.split421.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %470 = trunc i64 %407 to i32
  %471 = or disjoint i32 %470, 10
  %472 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %471
  %473 = load float, ptr addrspace(3) %472, align 4, !tbaa !19
  %474 = or disjoint i64 %410, 10
  %475 = getelementptr inbounds float, ptr %9, i64 %474
  store float %473, ptr %475, align 8, !tbaa !19
  br i1 %400, label %.preheader.split.12.i, label %.split421.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %476 = trunc i64 %407 to i32
  %477 = or disjoint i32 %476, 11
  %478 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %477
  %479 = load float, ptr addrspace(3) %478, align 4, !tbaa !19
  %480 = or disjoint i64 %410, 11
  %481 = getelementptr inbounds float, ptr %9, i64 %480
  store float %479, ptr %481, align 4, !tbaa !19
  br i1 %401, label %.preheader.split.13.i, label %.split421.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %482 = trunc i64 %407 to i32
  %483 = or disjoint i32 %482, 12
  %484 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %483
  %485 = load float, ptr addrspace(3) %484, align 4, !tbaa !19
  %486 = or disjoint i64 %410, 12
  %487 = getelementptr inbounds float, ptr %9, i64 %486
  store float %485, ptr %487, align 16, !tbaa !19
  br i1 %402, label %.preheader.split.14.i, label %.split421.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %488 = trunc i64 %407 to i32
  %489 = or disjoint i32 %488, 13
  %490 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %489
  %491 = load float, ptr addrspace(3) %490, align 4, !tbaa !19
  %492 = or disjoint i64 %410, 13
  %493 = getelementptr inbounds float, ptr %9, i64 %492
  store float %491, ptr %493, align 4, !tbaa !19
  br i1 %403, label %.preheader.split.15.i, label %.split421.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %494 = trunc i64 %407 to i32
  %495 = or disjoint i32 %494, 14
  %496 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %495
  %497 = load float, ptr addrspace(3) %496, align 4, !tbaa !19
  %498 = or disjoint i64 %410, 14
  %499 = getelementptr inbounds float, ptr %9, i64 %498
  store float %497, ptr %499, align 8, !tbaa !19
  br i1 %404, label %500, label %.split421.us.i

500:                                              ; preds = %.preheader.split.15.i
  %501 = trunc i64 %407 to i32
  %502 = or disjoint i32 %501, 15
  %503 = getelementptr inbounds float, ptr addrspace(3) %387, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !19
  %505 = or disjoint i64 %410, 15
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 4, !tbaa !19
  br label %.split421.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge419.i, %.split421.us.i
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
