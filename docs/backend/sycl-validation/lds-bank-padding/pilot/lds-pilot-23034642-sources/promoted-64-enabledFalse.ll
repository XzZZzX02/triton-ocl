;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-sk0st0bg/kernel.cpp"
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
  %.fr433.i = freeze i32 %3
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
  br i1 %40, label %.preheader407.i, label %.loopexit408.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

.preheader407.i:                                  ; preds = %._crit_edge.i
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
  %56 = icmp sgt i32 %.fr433.i, 0
  br i1 %56, label %.preheader407.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader407.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %54, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %57 = icmp sgt i32 %.fr433.i, 1
  %58 = or disjoint i64 %55, 64
  br i1 %57, label %.preheader407.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %53, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader407.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %59 = phi i64 [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %60 = icmp slt i64 %59, %51
  br i1 %60, label %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

61:                                               ; preds = %.preheader407.split.1.i
  %62 = add nuw nsw i64 %58, %59
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %62
  %.sroa.0207.0.copyload.1.i = load i16, ptr %63, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %61, %.preheader407.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %61 ], [ 0, %.preheader407.split.1.i ]
  %64 = trunc i64 %59 to i32
  %65 = add i32 %64, 64
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %65
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !25
  %67 = add nuw nsw i64 %59, 1
  %exitcond.1.not.i = icmp eq i64 %67, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader407.split.1.i, !llvm.loop !28

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %68 = icmp sgt i32 %.fr433.i, 2
  %69 = or disjoint i64 %55, 128
  br i1 %68, label %.preheader407.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %53, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader407.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %70 = phi i64 [ %78, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %71 = icmp slt i64 %70, %51
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

72:                                               ; preds = %.preheader407.split.2.i
  %73 = add nuw nsw i64 %69, %70
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0207.0.copyload.2.i = load i16, ptr %74, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %72, %.preheader407.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %72 ], [ 0, %.preheader407.split.2.i ]
  %75 = trunc i64 %70 to i32
  %76 = add i32 %75, 128
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %76
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %77, align 2, !tbaa.struct !25
  %78 = add nuw nsw i64 %70, 1
  %exitcond.2.not.i = icmp eq i64 %78, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader407.split.2.i, !llvm.loop !28

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %79 = icmp sgt i32 %.fr433.i, 3
  %80 = or disjoint i64 %55, 192
  br i1 %79, label %.preheader407.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %53, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader407.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %81 = phi i64 [ %89, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %82 = icmp slt i64 %81, %51
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

83:                                               ; preds = %.preheader407.split.3.i
  %84 = add nuw nsw i64 %80, %81
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0207.0.copyload.3.i = load i16, ptr %85, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %83, %.preheader407.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %83 ], [ 0, %.preheader407.split.3.i ]
  %86 = trunc i64 %81 to i32
  %87 = add i32 %86, 192
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %87
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %88, align 2, !tbaa.struct !25
  %89 = add nuw nsw i64 %81, 1
  %exitcond.3.not.i = icmp eq i64 %89, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader407.split.3.i, !llvm.loop !28

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %90 = icmp sgt i32 %.fr433.i, 4
  %91 = or disjoint i64 %55, 256
  br i1 %90, label %.preheader407.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %53, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader407.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %92 = phi i64 [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %93 = icmp slt i64 %92, %51
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

94:                                               ; preds = %.preheader407.split.4.i
  %95 = add nuw nsw i64 %91, %92
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0207.0.copyload.4.i = load i16, ptr %96, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %94, %.preheader407.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %94 ], [ 0, %.preheader407.split.4.i ]
  %97 = trunc i64 %92 to i32
  %98 = add i32 %97, 256
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %98
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %99, align 2, !tbaa.struct !25
  %100 = add nuw nsw i64 %92, 1
  %exitcond.4.not.i = icmp eq i64 %100, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader407.split.4.i, !llvm.loop !28

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %101 = icmp sgt i32 %.fr433.i, 5
  %102 = or disjoint i64 %55, 320
  br i1 %101, label %.preheader407.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %53, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader407.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %103 = phi i64 [ %111, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %104 = icmp slt i64 %103, %51
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

105:                                              ; preds = %.preheader407.split.5.i
  %106 = add nuw nsw i64 %102, %103
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0207.0.copyload.5.i = load i16, ptr %107, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %105, %.preheader407.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %105 ], [ 0, %.preheader407.split.5.i ]
  %108 = trunc i64 %103 to i32
  %109 = add i32 %108, 320
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %109
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  %111 = add nuw nsw i64 %103, 1
  %exitcond.5.not.i = icmp eq i64 %111, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader407.split.5.i, !llvm.loop !28

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %112 = icmp sgt i32 %.fr433.i, 6
  %113 = or disjoint i64 %55, 384
  br i1 %112, label %.preheader407.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %53, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader407.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %114 = phi i64 [ %122, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %115 = icmp slt i64 %114, %51
  br i1 %115, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

116:                                              ; preds = %.preheader407.split.6.i
  %117 = add nuw nsw i64 %113, %114
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0207.0.copyload.6.i = load i16, ptr %118, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %116, %.preheader407.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %116 ], [ 0, %.preheader407.split.6.i ]
  %119 = trunc i64 %114 to i32
  %120 = add i32 %119, 384
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %120
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  %122 = add nuw nsw i64 %114, 1
  %exitcond.6.not.i = icmp eq i64 %122, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader407.split.6.i, !llvm.loop !28

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %123 = icmp sgt i32 %.fr433.i, 7
  %124 = or disjoint i64 %55, 448
  br i1 %123, label %.preheader407.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %53, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit408.i

.preheader407.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %125 = phi i64 [ %133, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %126 = icmp slt i64 %125, %51
  br i1 %126, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

127:                                              ; preds = %.preheader407.split.7.i
  %128 = add nuw nsw i64 %124, %125
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0207.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %127, %.preheader407.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %127 ], [ 0, %.preheader407.split.7.i ]
  %130 = trunc i64 %125 to i32
  %131 = add i32 %130, 448
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %131
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !25
  %133 = add nuw nsw i64 %125, 1
  %exitcond.7.not.i = icmp eq i64 %133, 64
  br i1 %exitcond.7.not.i, label %.loopexit408.i, label %.preheader407.split.7.i, !llvm.loop !28

.preheader407.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %.preheader407.i
  %134 = phi i64 [ %141, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i ], [ 0, %.preheader407.i ]
  %135 = icmp slt i64 %134, %51
  br i1 %135, label %136, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

136:                                              ; preds = %.preheader407.split.i
  %137 = add nuw nsw i64 %134, %55
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %137
  %.sroa.0207.0.copyload.i = load i16, ptr %138, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %136, %.preheader407.split.i
  %.sroa.0209.2.i = phi i16 [ %.sroa.0207.0.copyload.i, %136 ], [ 0, %.preheader407.split.i ]
  %139 = trunc i64 %134 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %139
  store i16 %.sroa.0209.2.i, ptr addrspace(3) %140, align 2, !tbaa.struct !25
  %141 = add nuw nsw i64 %134, 1
  %exitcond.not.i = icmp eq i64 %141, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader407.split.i, !llvm.loop !28

.loopexit408.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %._crit_edge.i
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
  br i1 %144, label %145, label %.lr.ph417.i

145:                                              ; preds = %.loopexit408.i
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
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split414.us.i, %145
  %172 = phi i64 [ 0, %145 ], [ %182, %.split414.us.i ]
  %173 = icmp slt i64 %172, %151
  %174 = shl i64 %172, 4
  %.tr400.i = trunc i64 %172 to i32
  %175 = shl i32 %.tr400.i, 4
  %176 = sext i32 %175 to i64
  %177 = add nsw i64 %176, %155
  %.fr415.i = freeze i1 %173
  br i1 %.fr415.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr432.i = trunc i64 %172 to i32
  %178 = shl i32 %.tr432.i, 5
  %179 = add i32 %178, 1536
  %scevgep426.i = getelementptr i8, ptr addrspace(3) %153, i32 %179
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep426.i, i8 0, i32 32, i1 false)
  br label %.split414.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %156, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %180 = trunc i64 %174 to i32
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %180
  store i16 0, ptr addrspace(3) %181, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split414.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %182 = add nuw nsw i64 %172, 1
  %exitcond428.not.i = icmp eq i64 %182, 64
  br i1 %exitcond428.not.i, label %.lr.ph417.i, label %.preheader406.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader406.split.preheader.i
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
  br label %.split414.us.i

.lr.ph417.i:                                      ; preds = %.split414.us.i, %.loopexit408.i
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

._crit_edge418.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
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
  br i1 %317, label %380, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

318:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph417.i
  %319 = phi i64 [ %308, %.lr.ph417.i ], [ %325, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %320 = trunc i64 %319 to i32
  %321 = getelementptr inbounds float, ptr addrspace(3) %311, i32 %320
  %322 = load float, ptr addrspace(3) %321, align 4, !tbaa !19
  %323 = shl nuw nsw i64 %319, 2
  %324 = and i64 %323, 448
  br label %327

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %378, ptr addrspace(3) %321, align 4, !tbaa !19
  %325 = add nuw nsw i64 %319, 64
  %326 = icmp ult i64 %319, 64
  br i1 %326, label %318, label %._crit_edge418.i, !llvm.loop !32

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %318
  %328 = phi i64 [ 0, %318 ], [ %379, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %329 = phi float [ %322, %318 ], [ %378, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %330 = add nuw nsw i64 %328, %324
  %331 = trunc i64 %330 to i32
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %312, i32 %331
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %332, align 2, !tbaa.struct !25
  %333 = shl nuw nsw i64 %328, 4
  %334 = or disjoint i64 %333, %314
  %335 = trunc i64 %334 to i32
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %313, i32 %335
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %336, align 2, !tbaa.struct !25
  %337 = zext i16 %.sroa.0179.0.copyload.i to i32
  %338 = lshr i32 %337, 10
  %339 = and i32 %338, 31
  %340 = and i32 %337, 1023
  switch i32 %339, label %346 [
    i32 31, label %341
    i32 0, label %348
  ]

341:                                              ; preds = %327
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %342 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %340, 0
  %343 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %344 = or disjoint i32 %343, %342
  %345 = bitcast i32 %344 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

346:                                              ; preds = %327
  %347 = or disjoint i32 %340, 1024
  br label %348

348:                                              ; preds = %346, %327
  %349 = phi i32 [ %347, %346 ], [ %340, %327 ]
  %350 = uitofp i32 %349 to float
  %.not.i = icmp eq i32 %339, 0
  %351 = add nsw i32 %339, -25
  %352 = select i1 %.not.i, i32 -24, i32 %351
  %353 = call float @__ocml_ldexp_f32(float noundef %350, i32 noundef %352) #6
  %354 = fneg contract float %353
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %355 = select contract i1 %.not393394.i, float %354, float %353
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %348, %341
  %356 = phi float [ %345, %341 ], [ %355, %348 ]
  %357 = zext i16 %.sroa.0170.0.copyload.i to i32
  %358 = lshr i32 %357, 10
  %359 = and i32 %358, 31
  %360 = and i32 %357, 1023
  switch i32 %359, label %366 [
    i32 31, label %361
    i32 0, label %368
  ]

361:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %362 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %360, 0
  %363 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %364 = or disjoint i32 %363, %362
  %365 = bitcast i32 %364 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

366:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %367 = or disjoint i32 %360, 1024
  br label %368

368:                                              ; preds = %366, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %369 = phi i32 [ %367, %366 ], [ %360, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %370 = uitofp i32 %369 to float
  %.not395.i = icmp eq i32 %359, 0
  %371 = add nsw i32 %359, -25
  %372 = select i1 %.not395.i, i32 -24, i32 %371
  %373 = call float @__ocml_ldexp_f32(float noundef %370, i32 noundef %372) #6
  %374 = fneg contract float %373
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %375 = select contract i1 %.not396397.i, float %374, float %373
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %368, %361
  %376 = phi float [ %365, %361 ], [ %375, %368 ]
  %377 = fmul contract float %356, %376
  %378 = fadd contract float %329, %377
  %379 = add nuw nsw i64 %328, 1
  %exitcond429.not.i = icmp eq i64 %379, 64
  br i1 %exitcond429.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %327, !llvm.loop !33

380:                                              ; preds = %._crit_edge418.i
  %381 = shl nuw i32 %.tr.i, 7
  %382 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %383 = icmp eq i64 %382, 0
  call void @llvm.assume(i1 %383)
  %384 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %385 = icmp eq i64 %384, 0
  call void @llvm.assume(i1 %385)
  %386 = sext i32 %.fr433.i to i64
  %387 = call i32 @llvm.amdgcn.groupstaticsize()
  %388 = inttoptr i32 %387 to ptr addrspace(3)
  %389 = sext i32 %381 to i64
  %390 = icmp slt i32 %4, 1
  %391 = icmp ugt i32 %4, 1
  %392 = icmp ugt i32 %4, 2
  %393 = icmp ugt i32 %4, 3
  %394 = icmp ugt i32 %4, 4
  %395 = icmp ugt i32 %4, 5
  %396 = icmp ugt i32 %4, 6
  %397 = icmp ugt i32 %4, 7
  %398 = icmp ugt i32 %4, 8
  %399 = icmp ugt i32 %4, 9
  %400 = icmp ugt i32 %4, 10
  %401 = icmp ugt i32 %4, 11
  %402 = icmp ugt i32 %4, 12
  %403 = icmp ugt i32 %4, 13
  %404 = icmp ugt i32 %4, 14
  %405 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split420.us.i, %380
  %406 = phi i64 [ 0, %380 ], [ %412, %.split420.us.i ]
  %407 = icmp sge i64 %406, %386
  %408 = shl i64 %406, 4
  %.tr392.i = trunc i64 %406 to i32
  %409 = shl i32 %.tr392.i, 4
  %410 = sext i32 %409 to i64
  %411 = add nsw i64 %410, %389
  %brmerge.i = select i1 %407, i1 true, i1 %390
  br i1 %brmerge.i, label %.split420.us.i, label %.preheader.split.1.i

.split420.us.i:                                   ; preds = %501, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %412 = add i64 %406, 1
  %exitcond431.not.i = icmp eq i64 %412, 8
  br i1 %exitcond431.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %413 = trunc i64 %408 to i32
  %414 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !19
  %416 = getelementptr inbounds float, ptr %9, i64 %411
  store float %415, ptr %416, align 32, !tbaa !19
  br i1 %391, label %.preheader.split.2.i, label %.split420.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %417 = trunc i64 %408 to i32
  %418 = or disjoint i32 %417, 1
  %419 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %418
  %420 = load float, ptr addrspace(3) %419, align 4, !tbaa !19
  %421 = or disjoint i64 %411, 1
  %422 = getelementptr inbounds float, ptr %9, i64 %421
  store float %420, ptr %422, align 4, !tbaa !19
  br i1 %392, label %.preheader.split.3.i, label %.split420.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %423 = trunc i64 %408 to i32
  %424 = or disjoint i32 %423, 2
  %425 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !19
  %427 = or disjoint i64 %411, 2
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 8, !tbaa !19
  br i1 %393, label %.preheader.split.4.i, label %.split420.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %429 = trunc i64 %408 to i32
  %430 = or disjoint i32 %429, 3
  %431 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !19
  %433 = or disjoint i64 %411, 3
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 4, !tbaa !19
  br i1 %394, label %.preheader.split.5.i, label %.split420.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %435 = trunc i64 %408 to i32
  %436 = or disjoint i32 %435, 4
  %437 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !19
  %439 = or disjoint i64 %411, 4
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 16, !tbaa !19
  br i1 %395, label %.preheader.split.6.i, label %.split420.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %441 = trunc i64 %408 to i32
  %442 = or disjoint i32 %441, 5
  %443 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !19
  %445 = or disjoint i64 %411, 5
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 4, !tbaa !19
  br i1 %396, label %.preheader.split.7.i, label %.split420.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %447 = trunc i64 %408 to i32
  %448 = or disjoint i32 %447, 6
  %449 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !19
  %451 = or disjoint i64 %411, 6
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 8, !tbaa !19
  br i1 %397, label %.preheader.split.8.i, label %.split420.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %453 = trunc i64 %408 to i32
  %454 = or disjoint i32 %453, 7
  %455 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !19
  %457 = or disjoint i64 %411, 7
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 4, !tbaa !19
  br i1 %398, label %.preheader.split.9.i, label %.split420.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %459 = trunc i64 %408 to i32
  %460 = or disjoint i32 %459, 8
  %461 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !19
  %463 = or disjoint i64 %411, 8
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 32, !tbaa !19
  br i1 %399, label %.preheader.split.10.i, label %.split420.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %465 = trunc i64 %408 to i32
  %466 = or disjoint i32 %465, 9
  %467 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !19
  %469 = or disjoint i64 %411, 9
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 4, !tbaa !19
  br i1 %400, label %.preheader.split.11.i, label %.split420.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %471 = trunc i64 %408 to i32
  %472 = or disjoint i32 %471, 10
  %473 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !19
  %475 = or disjoint i64 %411, 10
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 8, !tbaa !19
  br i1 %401, label %.preheader.split.12.i, label %.split420.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %477 = trunc i64 %408 to i32
  %478 = or disjoint i32 %477, 11
  %479 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !19
  %481 = or disjoint i64 %411, 11
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 4, !tbaa !19
  br i1 %402, label %.preheader.split.13.i, label %.split420.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %483 = trunc i64 %408 to i32
  %484 = or disjoint i32 %483, 12
  %485 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !19
  %487 = or disjoint i64 %411, 12
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 16, !tbaa !19
  br i1 %403, label %.preheader.split.14.i, label %.split420.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %489 = trunc i64 %408 to i32
  %490 = or disjoint i32 %489, 13
  %491 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !19
  %493 = or disjoint i64 %411, 13
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 4, !tbaa !19
  br i1 %404, label %.preheader.split.15.i, label %.split420.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %495 = trunc i64 %408 to i32
  %496 = or disjoint i32 %495, 14
  %497 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !19
  %499 = or disjoint i64 %411, 14
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 8, !tbaa !19
  br i1 %405, label %501, label %.split420.us.i

501:                                              ; preds = %.preheader.split.15.i
  %502 = trunc i64 %408 to i32
  %503 = or disjoint i32 %502, 15
  %504 = getelementptr inbounds float, ptr addrspace(3) %388, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !19
  %506 = or disjoint i64 %411, 15
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 4, !tbaa !19
  br label %.split420.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge418.i, %.split420.us.i
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
