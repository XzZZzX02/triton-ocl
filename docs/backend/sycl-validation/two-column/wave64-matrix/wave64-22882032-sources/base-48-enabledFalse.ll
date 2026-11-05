;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-2e685apv/kernel.cpp"
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
  %.fr473.i = freeze i32 %3
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !10
  %11 = icmp ult i64 %10, 44739242
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 48
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 44739243
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
  %33 = icmp ult i64 %32, 48
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 44739242
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 48
  call void @llvm.assume(i1 %39)
  %40 = icmp eq i64 %38, 0
  br i1 %40, label %.preheader407.i, label %.loopexit408.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 48
  %45 = icmp ult i64 %41, 80
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

.preheader407.i:                                  ; preds = %._crit_edge.i
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
  %56 = icmp sgt i32 %.fr473.i, 0
  br i1 %56, label %.preheader407.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader407.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %54, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader407.split.preheader.i:                  ; preds = %.preheader407.i
  %57 = icmp sgt i32 %5, 0
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i: ; preds = %.preheader407.split.preheader.i
  store i16 0, ptr addrspace(3) %54, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.thread.i

.split.us.i:                                      ; preds = %272, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i
  %.sroa.0209.2.31.i = phi i16 [ %.sroa.0207.0.copyload.31.i, %272 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i ]
  %58 = getelementptr i8, ptr addrspace(3) %53, i32 574
  store i16 %.sroa.0209.2.31.i, ptr addrspace(3) %58, align 2, !tbaa.struct !25
  %59 = icmp ugt i32 %.fr473.i, 1
  %60 = or disjoint i64 %55, 32
  br i1 %59, label %.preheader407.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %53, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader407.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %61 = phi i64 [ %69, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %62 = icmp slt i64 %61, %51
  br i1 %62, label %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

63:                                               ; preds = %.preheader407.split.1.i
  %64 = add nuw nsw i64 %60, %61
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %64
  %.sroa.0207.0.copyload.1.i = load i16, ptr %65, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %63, %.preheader407.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %63 ], [ 0, %.preheader407.split.1.i ]
  %66 = trunc i64 %61 to i32
  %67 = add i32 %66, 32
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %67
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %68, align 2, !tbaa.struct !25
  %69 = add nuw nsw i64 %61, 1
  %exitcond.1.not.i = icmp eq i64 %69, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader407.split.1.i, !llvm.loop !28

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %70 = icmp sgt i32 %.fr473.i, 2
  %71 = or disjoint i64 %55, 64
  br i1 %70, label %.preheader407.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %53, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader407.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %72 = phi i64 [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %73 = icmp slt i64 %72, %51
  br i1 %73, label %74, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

74:                                               ; preds = %.preheader407.split.2.i
  %75 = add nuw nsw i64 %71, %72
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %75
  %.sroa.0207.0.copyload.2.i = load i16, ptr %76, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %74, %.preheader407.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %74 ], [ 0, %.preheader407.split.2.i ]
  %77 = trunc i64 %72 to i32
  %78 = add i32 %77, 64
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %78
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %79, align 2, !tbaa.struct !25
  %80 = add nuw nsw i64 %72, 1
  %exitcond.2.not.i = icmp eq i64 %80, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader407.split.2.i, !llvm.loop !28

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %81 = icmp sgt i32 %.fr473.i, 3
  %82 = or disjoint i64 %55, 96
  br i1 %81, label %.preheader407.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %53, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader407.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %83 = phi i64 [ %91, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %84 = icmp slt i64 %83, %51
  br i1 %84, label %85, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

85:                                               ; preds = %.preheader407.split.3.i
  %86 = add nuw nsw i64 %82, %83
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %86
  %.sroa.0207.0.copyload.3.i = load i16, ptr %87, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %85, %.preheader407.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %85 ], [ 0, %.preheader407.split.3.i ]
  %88 = trunc i64 %83 to i32
  %89 = add i32 %88, 96
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %89
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %90, align 2, !tbaa.struct !25
  %91 = add nuw nsw i64 %83, 1
  %exitcond.3.not.i = icmp eq i64 %91, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader407.split.3.i, !llvm.loop !28

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %92 = icmp sgt i32 %.fr473.i, 4
  %93 = or disjoint i64 %55, 128
  br i1 %92, label %.preheader407.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %53, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader407.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %94 = phi i64 [ %102, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %95 = icmp slt i64 %94, %51
  br i1 %95, label %96, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

96:                                               ; preds = %.preheader407.split.4.i
  %97 = add nuw nsw i64 %93, %94
  %98 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %97
  %.sroa.0207.0.copyload.4.i = load i16, ptr %98, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %96, %.preheader407.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %96 ], [ 0, %.preheader407.split.4.i ]
  %99 = trunc i64 %94 to i32
  %100 = add i32 %99, 128
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %100
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %101, align 2, !tbaa.struct !25
  %102 = add nuw nsw i64 %94, 1
  %exitcond.4.not.i = icmp eq i64 %102, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader407.split.4.i, !llvm.loop !28

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %103 = icmp sgt i32 %.fr473.i, 5
  %104 = or disjoint i64 %55, 160
  br i1 %103, label %.preheader407.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %53, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader407.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %105 = phi i64 [ %113, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %106 = icmp slt i64 %105, %51
  br i1 %106, label %107, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

107:                                              ; preds = %.preheader407.split.5.i
  %108 = add nuw nsw i64 %104, %105
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %108
  %.sroa.0207.0.copyload.5.i = load i16, ptr %109, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %107, %.preheader407.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %107 ], [ 0, %.preheader407.split.5.i ]
  %110 = trunc i64 %105 to i32
  %111 = add i32 %110, 160
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %111
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %112, align 2, !tbaa.struct !25
  %113 = add nuw nsw i64 %105, 1
  %exitcond.5.not.i = icmp eq i64 %113, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader407.split.5.i, !llvm.loop !28

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %114 = icmp sgt i32 %.fr473.i, 6
  %115 = or disjoint i64 %55, 192
  br i1 %114, label %.preheader407.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %53, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader407.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %116 = phi i64 [ %124, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %117 = icmp slt i64 %116, %51
  br i1 %117, label %118, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

118:                                              ; preds = %.preheader407.split.6.i
  %119 = add nuw nsw i64 %115, %116
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0207.0.copyload.6.i = load i16, ptr %120, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %118, %.preheader407.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %118 ], [ 0, %.preheader407.split.6.i ]
  %121 = trunc i64 %116 to i32
  %122 = add i32 %121, 192
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %122
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %123, align 2, !tbaa.struct !25
  %124 = add nuw nsw i64 %116, 1
  %exitcond.6.not.i = icmp eq i64 %124, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader407.split.6.i, !llvm.loop !28

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %125 = icmp sgt i32 %.fr473.i, 7
  %126 = or disjoint i64 %55, 224
  br i1 %125, label %.preheader407.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %53, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.loopexit408.i

.preheader407.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %127 = phi i64 [ %135, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %128 = icmp slt i64 %127, %51
  br i1 %128, label %129, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

129:                                              ; preds = %.preheader407.split.7.i
  %130 = add nuw nsw i64 %126, %127
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %130
  %.sroa.0207.0.copyload.7.i = load i16, ptr %131, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %129, %.preheader407.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %129 ], [ 0, %.preheader407.split.7.i ]
  %132 = trunc i64 %127 to i32
  %133 = add i32 %132, 224
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %133
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %134, align 2, !tbaa.struct !25
  %135 = add nuw nsw i64 %127, 1
  %exitcond.7.not.i = icmp eq i64 %135, 32
  br i1 %exitcond.7.not.i, label %.loopexit408.i, label %.preheader407.split.7.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %.preheader407.split.preheader.i
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %55
  %.sroa.0207.0.copyload.i = load i16, ptr %136, align 32, !tbaa.struct !25
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %54, align 2, !tbaa.struct !25
  %.not522.i = icmp eq i32 %5, 1
  br i1 %.not522.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i
  %137 = getelementptr i8, ptr addrspace(3) %53, i32 514
  store i16 0, ptr addrspace(3) %137, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %138 = or disjoint i64 %55, 1
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %138
  %.sroa.0207.0.copyload.1427.i = load i16, ptr %139, align 2, !tbaa.struct !25
  %140 = getelementptr i8, ptr addrspace(3) %53, i32 514
  store i16 %.sroa.0207.0.copyload.1427.i, ptr addrspace(3) %140, align 2, !tbaa.struct !25
  %141 = icmp ugt i32 %5, 2
  br i1 %141, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.thread.i
  %142 = getelementptr i8, ptr addrspace(3) %53, i32 516
  store i16 0, ptr addrspace(3) %142, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1430.i
  %143 = or disjoint i64 %55, 2
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %143
  %.sroa.0207.0.copyload.2432.i = load i16, ptr %144, align 4, !tbaa.struct !25
  %145 = getelementptr i8, ptr addrspace(3) %53, i32 516
  store i16 %.sroa.0207.0.copyload.2432.i, ptr addrspace(3) %145, align 2, !tbaa.struct !25
  %.not523.i = icmp eq i32 %5, 3
  br i1 %.not523.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.thread.i
  %146 = getelementptr i8, ptr addrspace(3) %53, i32 518
  store i16 0, ptr addrspace(3) %146, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2435.i
  %147 = or disjoint i64 %55, 3
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %147
  %.sroa.0207.0.copyload.3437.i = load i16, ptr %148, align 2, !tbaa.struct !25
  %149 = getelementptr i8, ptr addrspace(3) %53, i32 518
  store i16 %.sroa.0207.0.copyload.3437.i, ptr addrspace(3) %149, align 2, !tbaa.struct !25
  %150 = icmp ugt i32 %5, 4
  br i1 %150, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.thread.i
  %151 = getelementptr i8, ptr addrspace(3) %53, i32 520
  store i16 0, ptr addrspace(3) %151, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3440.i
  %152 = or disjoint i64 %55, 4
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %152
  %.sroa.0207.0.copyload.4442.i = load i16, ptr %153, align 8, !tbaa.struct !25
  %154 = getelementptr i8, ptr addrspace(3) %53, i32 520
  store i16 %.sroa.0207.0.copyload.4442.i, ptr addrspace(3) %154, align 2, !tbaa.struct !25
  %.not524.i = icmp eq i32 %5, 5
  br i1 %.not524.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.thread.i
  %155 = getelementptr i8, ptr addrspace(3) %53, i32 522
  store i16 0, ptr addrspace(3) %155, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4445.i
  %156 = or disjoint i64 %55, 5
  %157 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %156
  %.sroa.0207.0.copyload.5447.i = load i16, ptr %157, align 2, !tbaa.struct !25
  %158 = getelementptr i8, ptr addrspace(3) %53, i32 522
  store i16 %.sroa.0207.0.copyload.5447.i, ptr addrspace(3) %158, align 2, !tbaa.struct !25
  %159 = icmp ugt i32 %5, 6
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.thread.i
  %160 = getelementptr i8, ptr addrspace(3) %53, i32 524
  store i16 0, ptr addrspace(3) %160, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5450.i
  %161 = or disjoint i64 %55, 6
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %161
  %.sroa.0207.0.copyload.6452.i = load i16, ptr %162, align 4, !tbaa.struct !25
  %163 = getelementptr i8, ptr addrspace(3) %53, i32 524
  store i16 %.sroa.0207.0.copyload.6452.i, ptr addrspace(3) %163, align 2, !tbaa.struct !25
  %.not525.i = icmp eq i32 %5, 7
  br i1 %.not525.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.thread.i
  %164 = getelementptr i8, ptr addrspace(3) %53, i32 526
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6455.i
  %165 = or disjoint i64 %55, 7
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0207.0.copyload.7457.i = load i16, ptr %166, align 2, !tbaa.struct !25
  %167 = getelementptr i8, ptr addrspace(3) %53, i32 526
  store i16 %.sroa.0207.0.copyload.7457.i, ptr addrspace(3) %167, align 2, !tbaa.struct !25
  %168 = icmp ugt i32 %5, 8
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.thread.i
  %169 = getelementptr i8, ptr addrspace(3) %53, i32 528
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7460.i
  %170 = or disjoint i64 %55, 8
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0207.0.copyload.8.i = load i16, ptr %171, align 16, !tbaa.struct !25
  %172 = getelementptr i8, ptr addrspace(3) %53, i32 528
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %172, align 2, !tbaa.struct !25
  %.not526.i = icmp eq i32 %5, 9
  br i1 %.not526.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i
  %173 = getelementptr i8, ptr addrspace(3) %53, i32 530
  store i16 0, ptr addrspace(3) %173, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i
  %174 = or disjoint i64 %55, 9
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %174
  %.sroa.0207.0.copyload.9.i = load i16, ptr %175, align 2, !tbaa.struct !25
  %176 = getelementptr i8, ptr addrspace(3) %53, i32 530
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %176, align 2, !tbaa.struct !25
  %177 = icmp ugt i32 %5, 10
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i
  %178 = getelementptr i8, ptr addrspace(3) %53, i32 532
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i
  %179 = or disjoint i64 %55, 10
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %179
  %.sroa.0207.0.copyload.10.i = load i16, ptr %180, align 4, !tbaa.struct !25
  %181 = getelementptr i8, ptr addrspace(3) %53, i32 532
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %181, align 2, !tbaa.struct !25
  %.not527.i = icmp eq i32 %5, 11
  br i1 %.not527.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i
  %182 = getelementptr i8, ptr addrspace(3) %53, i32 534
  store i16 0, ptr addrspace(3) %182, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i
  %183 = or disjoint i64 %55, 11
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %183
  %.sroa.0207.0.copyload.11.i = load i16, ptr %184, align 2, !tbaa.struct !25
  %185 = getelementptr i8, ptr addrspace(3) %53, i32 534
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %185, align 2, !tbaa.struct !25
  %186 = icmp ugt i32 %5, 12
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i
  %187 = getelementptr i8, ptr addrspace(3) %53, i32 536
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i
  %188 = or disjoint i64 %55, 12
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %188
  %.sroa.0207.0.copyload.12.i = load i16, ptr %189, align 8, !tbaa.struct !25
  %190 = getelementptr i8, ptr addrspace(3) %53, i32 536
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %190, align 2, !tbaa.struct !25
  %.not528.i = icmp eq i32 %5, 13
  br i1 %.not528.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i
  %191 = getelementptr i8, ptr addrspace(3) %53, i32 538
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i
  %192 = or disjoint i64 %55, 13
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %192
  %.sroa.0207.0.copyload.13.i = load i16, ptr %193, align 2, !tbaa.struct !25
  %194 = getelementptr i8, ptr addrspace(3) %53, i32 538
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %194, align 2, !tbaa.struct !25
  %195 = icmp ugt i32 %5, 14
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i
  %196 = getelementptr i8, ptr addrspace(3) %53, i32 540
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i
  %197 = or disjoint i64 %55, 14
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0207.0.copyload.14.i = load i16, ptr %198, align 4, !tbaa.struct !25
  %199 = getelementptr i8, ptr addrspace(3) %53, i32 540
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %199, align 2, !tbaa.struct !25
  %.not529.i = icmp eq i32 %5, 15
  br i1 %.not529.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i
  %200 = getelementptr i8, ptr addrspace(3) %53, i32 542
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i
  %201 = or disjoint i64 %55, 15
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %201
  %.sroa.0207.0.copyload.15.i = load i16, ptr %202, align 2, !tbaa.struct !25
  %203 = getelementptr i8, ptr addrspace(3) %53, i32 542
  store i16 %.sroa.0207.0.copyload.15.i, ptr addrspace(3) %203, align 2, !tbaa.struct !25
  %204 = icmp ugt i32 %5, 16
  br i1 %204, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.thread.i
  %205 = getelementptr i8, ptr addrspace(3) %53, i32 544
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i
  %206 = or disjoint i64 %55, 16
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %206
  %.sroa.0207.0.copyload.16.i = load i16, ptr %207, align 32, !tbaa.struct !25
  %208 = getelementptr i8, ptr addrspace(3) %53, i32 544
  store i16 %.sroa.0207.0.copyload.16.i, ptr addrspace(3) %208, align 2, !tbaa.struct !25
  %.not530.i = icmp eq i32 %5, 17
  br i1 %.not530.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.thread.i
  %209 = getelementptr i8, ptr addrspace(3) %53, i32 546
  store i16 0, ptr addrspace(3) %209, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.16.i
  %210 = or disjoint i64 %55, 17
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %210
  %.sroa.0207.0.copyload.17.i = load i16, ptr %211, align 2, !tbaa.struct !25
  %212 = getelementptr i8, ptr addrspace(3) %53, i32 546
  store i16 %.sroa.0207.0.copyload.17.i, ptr addrspace(3) %212, align 2, !tbaa.struct !25
  %213 = icmp ugt i32 %5, 18
  br i1 %213, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.thread.i
  %214 = getelementptr i8, ptr addrspace(3) %53, i32 548
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.17.i
  %215 = or disjoint i64 %55, 18
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %215
  %.sroa.0207.0.copyload.18.i = load i16, ptr %216, align 4, !tbaa.struct !25
  %217 = getelementptr i8, ptr addrspace(3) %53, i32 548
  store i16 %.sroa.0207.0.copyload.18.i, ptr addrspace(3) %217, align 2, !tbaa.struct !25
  %.not531.i = icmp eq i32 %5, 19
  br i1 %.not531.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.thread.i
  %218 = getelementptr i8, ptr addrspace(3) %53, i32 550
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.18.i
  %219 = or disjoint i64 %55, 19
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %219
  %.sroa.0207.0.copyload.19.i = load i16, ptr %220, align 2, !tbaa.struct !25
  %221 = getelementptr i8, ptr addrspace(3) %53, i32 550
  store i16 %.sroa.0207.0.copyload.19.i, ptr addrspace(3) %221, align 2, !tbaa.struct !25
  %222 = icmp ugt i32 %5, 20
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.thread.i
  %223 = getelementptr i8, ptr addrspace(3) %53, i32 552
  store i16 0, ptr addrspace(3) %223, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.19.i
  %224 = or disjoint i64 %55, 20
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %224
  %.sroa.0207.0.copyload.20.i = load i16, ptr %225, align 8, !tbaa.struct !25
  %226 = getelementptr i8, ptr addrspace(3) %53, i32 552
  store i16 %.sroa.0207.0.copyload.20.i, ptr addrspace(3) %226, align 2, !tbaa.struct !25
  %.not532.i = icmp eq i32 %5, 21
  br i1 %.not532.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.thread.i
  %227 = getelementptr i8, ptr addrspace(3) %53, i32 554
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.20.i
  %228 = or disjoint i64 %55, 21
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %228
  %.sroa.0207.0.copyload.21.i = load i16, ptr %229, align 2, !tbaa.struct !25
  %230 = getelementptr i8, ptr addrspace(3) %53, i32 554
  store i16 %.sroa.0207.0.copyload.21.i, ptr addrspace(3) %230, align 2, !tbaa.struct !25
  %231 = icmp ugt i32 %5, 22
  br i1 %231, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.thread.i
  %232 = getelementptr i8, ptr addrspace(3) %53, i32 556
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.21.i
  %233 = or disjoint i64 %55, 22
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %233
  %.sroa.0207.0.copyload.22.i = load i16, ptr %234, align 4, !tbaa.struct !25
  %235 = getelementptr i8, ptr addrspace(3) %53, i32 556
  store i16 %.sroa.0207.0.copyload.22.i, ptr addrspace(3) %235, align 2, !tbaa.struct !25
  %.not533.i = icmp eq i32 %5, 23
  br i1 %.not533.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.thread.i
  %236 = getelementptr i8, ptr addrspace(3) %53, i32 558
  store i16 0, ptr addrspace(3) %236, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.22.i
  %237 = or disjoint i64 %55, 23
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %237
  %.sroa.0207.0.copyload.23.i = load i16, ptr %238, align 2, !tbaa.struct !25
  %239 = getelementptr i8, ptr addrspace(3) %53, i32 558
  store i16 %.sroa.0207.0.copyload.23.i, ptr addrspace(3) %239, align 2, !tbaa.struct !25
  %240 = icmp ugt i32 %5, 24
  br i1 %240, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.thread.i
  %241 = getelementptr i8, ptr addrspace(3) %53, i32 560
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.23.i
  %242 = or disjoint i64 %55, 24
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %242
  %.sroa.0207.0.copyload.24.i = load i16, ptr %243, align 16, !tbaa.struct !25
  %244 = getelementptr i8, ptr addrspace(3) %53, i32 560
  store i16 %.sroa.0207.0.copyload.24.i, ptr addrspace(3) %244, align 2, !tbaa.struct !25
  %.not534.i = icmp eq i32 %5, 25
  br i1 %.not534.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.thread.i
  %245 = getelementptr i8, ptr addrspace(3) %53, i32 562
  store i16 0, ptr addrspace(3) %245, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.24.i
  %246 = or disjoint i64 %55, 25
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %246
  %.sroa.0207.0.copyload.25.i = load i16, ptr %247, align 2, !tbaa.struct !25
  %248 = getelementptr i8, ptr addrspace(3) %53, i32 562
  store i16 %.sroa.0207.0.copyload.25.i, ptr addrspace(3) %248, align 2, !tbaa.struct !25
  %249 = icmp ugt i32 %5, 26
  br i1 %249, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.thread.i
  %250 = getelementptr i8, ptr addrspace(3) %53, i32 564
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.25.i
  %251 = or disjoint i64 %55, 26
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %251
  %.sroa.0207.0.copyload.26.i = load i16, ptr %252, align 4, !tbaa.struct !25
  %253 = getelementptr i8, ptr addrspace(3) %53, i32 564
  store i16 %.sroa.0207.0.copyload.26.i, ptr addrspace(3) %253, align 2, !tbaa.struct !25
  %.not535.i = icmp eq i32 %5, 27
  br i1 %.not535.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.thread.i
  %254 = getelementptr i8, ptr addrspace(3) %53, i32 566
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.26.i
  %255 = or disjoint i64 %55, 27
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %255
  %.sroa.0207.0.copyload.27.i = load i16, ptr %256, align 2, !tbaa.struct !25
  %257 = getelementptr i8, ptr addrspace(3) %53, i32 566
  store i16 %.sroa.0207.0.copyload.27.i, ptr addrspace(3) %257, align 2, !tbaa.struct !25
  %258 = icmp ugt i32 %5, 28
  br i1 %258, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.thread.i
  %259 = getelementptr i8, ptr addrspace(3) %53, i32 568
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.27.i
  %260 = or disjoint i64 %55, 28
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %260
  %.sroa.0207.0.copyload.28.i = load i16, ptr %261, align 8, !tbaa.struct !25
  %262 = getelementptr i8, ptr addrspace(3) %53, i32 568
  store i16 %.sroa.0207.0.copyload.28.i, ptr addrspace(3) %262, align 2, !tbaa.struct !25
  %.not536.i = icmp eq i32 %5, 29
  br i1 %.not536.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.thread.i
  %263 = getelementptr i8, ptr addrspace(3) %53, i32 570
  store i16 0, ptr addrspace(3) %263, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.28.i
  %264 = or disjoint i64 %55, 29
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %264
  %.sroa.0207.0.copyload.29.i = load i16, ptr %265, align 2, !tbaa.struct !25
  %266 = getelementptr i8, ptr addrspace(3) %53, i32 570
  store i16 %.sroa.0207.0.copyload.29.i, ptr addrspace(3) %266, align 2, !tbaa.struct !25
  %267 = icmp ugt i32 %5, 30
  br i1 %267, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.thread.i
  %268 = getelementptr i8, ptr addrspace(3) %53, i32 572
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !25
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.29.i
  %269 = or disjoint i64 %55, 30
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %269
  %.sroa.0207.0.copyload.30.i = load i16, ptr %270, align 4, !tbaa.struct !25
  %271 = getelementptr i8, ptr addrspace(3) %53, i32 572
  store i16 %.sroa.0207.0.copyload.30.i, ptr addrspace(3) %271, align 2, !tbaa.struct !25
  %.not537.i = icmp eq i32 %5, 31
  br i1 %.not537.i, label %.split.us.i, label %272

272:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.30.i
  %273 = or disjoint i64 %55, 31
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %273
  %.sroa.0207.0.copyload.31.i = load i16, ptr %274, align 2, !tbaa.struct !25
  br label %.split.us.i

.loopexit408.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %275 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %276 = icmp ult i64 %275, 48
  call void @llvm.assume(i1 %276)
  %277 = icmp eq i64 %275, 0
  br i1 %277, label %278, label %.lr.ph417.i

278:                                              ; preds = %.loopexit408.i
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
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split414.us.i, %278
  %305 = phi i64 [ 0, %278 ], [ %315, %.split414.us.i ]
  %306 = icmp slt i64 %305, %284
  %307 = shl i64 %305, 4
  %.tr400.i = trunc i64 %305 to i32
  %308 = shl i32 %.tr400.i, 4
  %309 = sext i32 %308 to i64
  %310 = add nsw i64 %309, %288
  %.fr415.i = freeze i1 %306
  br i1 %.fr415.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr472.i = trunc i64 %305 to i32
  %311 = shl i32 %.tr472.i, 5
  %312 = add i32 %311, 1024
  %scevgep461.i = getelementptr i8, ptr addrspace(3) %286, i32 %312
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep461.i, i8 0, i32 32, i1 false)
  br label %.split414.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %289, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %313 = trunc i64 %307 to i32
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %313
  store i16 0, ptr addrspace(3) %314, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split414.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %315 = add nuw nsw i64 %305, 1
  %exitcond.not.i = icmp eq i64 %315, 32
  br i1 %exitcond.not.i, label %.lr.ph417.i, label %.preheader406.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader406.split.preheader.i
  %316 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %310
  %.sroa.0196.0.copyload.i = load i16, ptr %316, align 32, !tbaa.struct !25
  %317 = trunc i64 %307 to i32
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %317
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %318, align 2, !tbaa.struct !25
  br i1 %290, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %319 = trunc i64 %307 to i32
  %320 = or disjoint i32 %319, 1
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %320
  store i16 0, ptr addrspace(3) %321, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %322 = or disjoint i64 %310, 1
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0196.0.copyload.1.i = load i16, ptr %323, align 2, !tbaa.struct !25
  %324 = trunc i64 %307 to i32
  %325 = or disjoint i32 %324, 1
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %325
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %326, align 2, !tbaa.struct !25
  br i1 %291, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %327 = trunc i64 %307 to i32
  %328 = or disjoint i32 %327, 2
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %328
  store i16 0, ptr addrspace(3) %329, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %330 = or disjoint i64 %310, 2
  %331 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %330
  %.sroa.0196.0.copyload.2.i = load i16, ptr %331, align 4, !tbaa.struct !25
  %332 = trunc i64 %307 to i32
  %333 = or disjoint i32 %332, 2
  %334 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %333
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %334, align 2, !tbaa.struct !25
  br i1 %292, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %335 = trunc i64 %307 to i32
  %336 = or disjoint i32 %335, 3
  %337 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %336
  store i16 0, ptr addrspace(3) %337, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %338 = or disjoint i64 %310, 3
  %339 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %338
  %.sroa.0196.0.copyload.3.i = load i16, ptr %339, align 2, !tbaa.struct !25
  %340 = trunc i64 %307 to i32
  %341 = or disjoint i32 %340, 3
  %342 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %341
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %342, align 2, !tbaa.struct !25
  br i1 %293, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %343 = trunc i64 %307 to i32
  %344 = or disjoint i32 %343, 4
  %345 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %344
  store i16 0, ptr addrspace(3) %345, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %346 = or disjoint i64 %310, 4
  %347 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %346
  %.sroa.0196.0.copyload.4.i = load i16, ptr %347, align 8, !tbaa.struct !25
  %348 = trunc i64 %307 to i32
  %349 = or disjoint i32 %348, 4
  %350 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %349
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %350, align 2, !tbaa.struct !25
  br i1 %294, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %351 = trunc i64 %307 to i32
  %352 = or disjoint i32 %351, 5
  %353 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %352
  store i16 0, ptr addrspace(3) %353, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %354 = or disjoint i64 %310, 5
  %355 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %354
  %.sroa.0196.0.copyload.5.i = load i16, ptr %355, align 2, !tbaa.struct !25
  %356 = trunc i64 %307 to i32
  %357 = or disjoint i32 %356, 5
  %358 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %357
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %358, align 2, !tbaa.struct !25
  br i1 %295, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %359 = trunc i64 %307 to i32
  %360 = or disjoint i32 %359, 6
  %361 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %360
  store i16 0, ptr addrspace(3) %361, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %362 = or disjoint i64 %310, 6
  %363 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %362
  %.sroa.0196.0.copyload.6.i = load i16, ptr %363, align 4, !tbaa.struct !25
  %364 = trunc i64 %307 to i32
  %365 = or disjoint i32 %364, 6
  %366 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %365
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %366, align 2, !tbaa.struct !25
  br i1 %296, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %367 = trunc i64 %307 to i32
  %368 = or disjoint i32 %367, 7
  %369 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %368
  store i16 0, ptr addrspace(3) %369, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %370 = or disjoint i64 %310, 7
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %370
  %.sroa.0196.0.copyload.7.i = load i16, ptr %371, align 2, !tbaa.struct !25
  %372 = trunc i64 %307 to i32
  %373 = or disjoint i32 %372, 7
  %374 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %373
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %374, align 2, !tbaa.struct !25
  br i1 %297, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %375 = trunc i64 %307 to i32
  %376 = or disjoint i32 %375, 8
  %377 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %376
  store i16 0, ptr addrspace(3) %377, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %378 = or disjoint i64 %310, 8
  %379 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %378
  %.sroa.0196.0.copyload.8.i = load i16, ptr %379, align 16, !tbaa.struct !25
  %380 = trunc i64 %307 to i32
  %381 = or disjoint i32 %380, 8
  %382 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %381
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %382, align 2, !tbaa.struct !25
  br i1 %298, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %383 = trunc i64 %307 to i32
  %384 = or disjoint i32 %383, 9
  %385 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %384
  store i16 0, ptr addrspace(3) %385, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %386 = or disjoint i64 %310, 9
  %387 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %386
  %.sroa.0196.0.copyload.9.i = load i16, ptr %387, align 2, !tbaa.struct !25
  %388 = trunc i64 %307 to i32
  %389 = or disjoint i32 %388, 9
  %390 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %389
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %390, align 2, !tbaa.struct !25
  br i1 %299, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %391 = trunc i64 %307 to i32
  %392 = or disjoint i32 %391, 10
  %393 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %392
  store i16 0, ptr addrspace(3) %393, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %394 = or disjoint i64 %310, 10
  %395 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %394
  %.sroa.0196.0.copyload.10.i = load i16, ptr %395, align 4, !tbaa.struct !25
  %396 = trunc i64 %307 to i32
  %397 = or disjoint i32 %396, 10
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %397
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %398, align 2, !tbaa.struct !25
  br i1 %300, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %399 = trunc i64 %307 to i32
  %400 = or disjoint i32 %399, 11
  %401 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %400
  store i16 0, ptr addrspace(3) %401, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %402 = or disjoint i64 %310, 11
  %403 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %402
  %.sroa.0196.0.copyload.11.i = load i16, ptr %403, align 2, !tbaa.struct !25
  %404 = trunc i64 %307 to i32
  %405 = or disjoint i32 %404, 11
  %406 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %405
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %406, align 2, !tbaa.struct !25
  br i1 %301, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %407 = trunc i64 %307 to i32
  %408 = or disjoint i32 %407, 12
  %409 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %408
  store i16 0, ptr addrspace(3) %409, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %410 = or disjoint i64 %310, 12
  %411 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %410
  %.sroa.0196.0.copyload.12.i = load i16, ptr %411, align 8, !tbaa.struct !25
  %412 = trunc i64 %307 to i32
  %413 = or disjoint i32 %412, 12
  %414 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %413
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %414, align 2, !tbaa.struct !25
  br i1 %302, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %415 = trunc i64 %307 to i32
  %416 = or disjoint i32 %415, 13
  %417 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %416
  store i16 0, ptr addrspace(3) %417, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %418 = or disjoint i64 %310, 13
  %419 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %418
  %.sroa.0196.0.copyload.13.i = load i16, ptr %419, align 2, !tbaa.struct !25
  %420 = trunc i64 %307 to i32
  %421 = or disjoint i32 %420, 13
  %422 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %421
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %422, align 2, !tbaa.struct !25
  br i1 %303, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %423 = trunc i64 %307 to i32
  %424 = or disjoint i32 %423, 14
  %425 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %424
  store i16 0, ptr addrspace(3) %425, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %426 = or disjoint i64 %310, 14
  %427 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %426
  %.sroa.0196.0.copyload.14.i = load i16, ptr %427, align 4, !tbaa.struct !25
  %428 = trunc i64 %307 to i32
  %429 = or disjoint i32 %428, 14
  %430 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %429
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %430, align 2, !tbaa.struct !25
  br i1 %304, label %431, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

431:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %432 = or disjoint i64 %310, 15
  %433 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %432
  %.sroa.0196.0.copyload.15.i = load i16, ptr %433, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %431, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %431 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %434 = trunc i64 %307 to i32
  %435 = or disjoint i32 %434, 15
  %436 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %287, i32 %435
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %436, align 2, !tbaa.struct !25
  br label %.split414.us.i

.lr.ph417.i:                                      ; preds = %.split414.us.i, %.loopexit408.i
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
  %442 = icmp ult i64 %441, 48
  call void @llvm.assume(i1 %442)
  %443 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %444 = inttoptr i32 %443 to ptr addrspace(3)
  %445 = getelementptr inbounds i8, ptr addrspace(3) %444, i32 512
  %446 = getelementptr inbounds i8, ptr addrspace(3) %444, i32 1024
  %447 = and i64 %441, 15
  br label %451

._crit_edge418.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %448 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %449 = icmp ult i64 %448, 48
  call void @llvm.assume(i1 %449)
  %450 = icmp eq i64 %448, 0
  br i1 %450, label %513, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

451:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph417.i
  %452 = phi i64 [ %441, %.lr.ph417.i ], [ %458, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %453 = trunc i64 %452 to i32
  %454 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %453
  %455 = load float, ptr addrspace(3) %454, align 4, !tbaa !19
  %456 = shl nuw nsw i64 %452, 1
  %457 = and i64 %456, 224
  br label %460

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %511, ptr addrspace(3) %454, align 4, !tbaa !19
  %458 = add nuw nsw i64 %452, 48
  %459 = icmp ult i64 %452, 80
  br i1 %459, label %451, label %._crit_edge418.i, !llvm.loop !32

460:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %451
  %461 = phi i64 [ 0, %451 ], [ %512, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %462 = phi float [ %455, %451 ], [ %511, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %463 = add nuw nsw i64 %461, %457
  %464 = trunc i64 %463 to i32
  %465 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %445, i32 %464
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %465, align 2, !tbaa.struct !25
  %466 = shl nuw nsw i64 %461, 4
  %467 = or disjoint i64 %466, %447
  %468 = trunc i64 %467 to i32
  %469 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %446, i32 %468
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %469, align 2, !tbaa.struct !25
  %470 = zext i16 %.sroa.0179.0.copyload.i to i32
  %471 = lshr i32 %470, 10
  %472 = and i32 %471, 31
  %473 = and i32 %470, 1023
  switch i32 %472, label %479 [
    i32 31, label %474
    i32 0, label %481
  ]

474:                                              ; preds = %460
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %475 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %473, 0
  %476 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %477 = or disjoint i32 %476, %475
  %478 = bitcast i32 %477 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

479:                                              ; preds = %460
  %480 = or disjoint i32 %473, 1024
  br label %481

481:                                              ; preds = %479, %460
  %482 = phi i32 [ %480, %479 ], [ %473, %460 ]
  %483 = uitofp i32 %482 to float
  %.not.i = icmp eq i32 %472, 0
  %484 = add nsw i32 %472, -25
  %485 = select i1 %.not.i, i32 -24, i32 %484
  %486 = call float @__ocml_ldexp_f32(float noundef %483, i32 noundef %485) #6
  %487 = fneg contract float %486
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %488 = select contract i1 %.not393394.i, float %487, float %486
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %481, %474
  %489 = phi float [ %478, %474 ], [ %488, %481 ]
  %490 = zext i16 %.sroa.0170.0.copyload.i to i32
  %491 = lshr i32 %490, 10
  %492 = and i32 %491, 31
  %493 = and i32 %490, 1023
  switch i32 %492, label %499 [
    i32 31, label %494
    i32 0, label %501
  ]

494:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %495 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %493, 0
  %496 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %497 = or disjoint i32 %496, %495
  %498 = bitcast i32 %497 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

499:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %500 = or disjoint i32 %493, 1024
  br label %501

501:                                              ; preds = %499, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %502 = phi i32 [ %500, %499 ], [ %493, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %503 = uitofp i32 %502 to float
  %.not395.i = icmp eq i32 %492, 0
  %504 = add nsw i32 %492, -25
  %505 = select i1 %.not395.i, i32 -24, i32 %504
  %506 = call float @__ocml_ldexp_f32(float noundef %503, i32 noundef %505) #6
  %507 = fneg contract float %506
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %508 = select contract i1 %.not396397.i, float %507, float %506
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %501, %494
  %509 = phi float [ %498, %494 ], [ %508, %501 ]
  %510 = fmul contract float %489, %509
  %511 = fadd contract float %462, %510
  %512 = add nuw nsw i64 %461, 1
  %exitcond469.not.i = icmp eq i64 %512, 32
  br i1 %exitcond469.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %460, !llvm.loop !33

513:                                              ; preds = %._crit_edge418.i
  %514 = shl i32 %.tr.i, 7
  %515 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %516 = icmp eq i64 %515, 0
  call void @llvm.assume(i1 %516)
  %517 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %518 = icmp eq i64 %517, 0
  call void @llvm.assume(i1 %518)
  %519 = sext i32 %.fr473.i to i64
  %520 = call i32 @llvm.amdgcn.groupstaticsize()
  %521 = inttoptr i32 %520 to ptr addrspace(3)
  %522 = sext i32 %514 to i64
  %523 = icmp slt i32 %4, 1
  %524 = icmp ugt i32 %4, 1
  %525 = icmp ugt i32 %4, 2
  %526 = icmp ugt i32 %4, 3
  %527 = icmp ugt i32 %4, 4
  %528 = icmp ugt i32 %4, 5
  %529 = icmp ugt i32 %4, 6
  %530 = icmp ugt i32 %4, 7
  %531 = icmp ugt i32 %4, 8
  %532 = icmp ugt i32 %4, 9
  %533 = icmp ugt i32 %4, 10
  %534 = icmp ugt i32 %4, 11
  %535 = icmp ugt i32 %4, 12
  %536 = icmp ugt i32 %4, 13
  %537 = icmp ugt i32 %4, 14
  %538 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split420.us.i, %513
  %539 = phi i64 [ 0, %513 ], [ %545, %.split420.us.i ]
  %540 = icmp sge i64 %539, %519
  %541 = shl i64 %539, 4
  %.tr392.i = trunc i64 %539 to i32
  %542 = shl i32 %.tr392.i, 4
  %543 = sext i32 %542 to i64
  %544 = add nsw i64 %543, %522
  %brmerge.i = select i1 %540, i1 true, i1 %523
  br i1 %brmerge.i, label %.split420.us.i, label %.preheader.split.1.i

.split420.us.i:                                   ; preds = %634, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %545 = add i64 %539, 1
  %exitcond471.not.i = icmp eq i64 %545, 8
  br i1 %exitcond471.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %546 = trunc i64 %541 to i32
  %547 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %546
  %548 = load float, ptr addrspace(3) %547, align 4, !tbaa !19
  %549 = getelementptr inbounds float, ptr %9, i64 %544
  store float %548, ptr %549, align 32, !tbaa !19
  br i1 %524, label %.preheader.split.2.i, label %.split420.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %550 = trunc i64 %541 to i32
  %551 = or disjoint i32 %550, 1
  %552 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %551
  %553 = load float, ptr addrspace(3) %552, align 4, !tbaa !19
  %554 = or disjoint i64 %544, 1
  %555 = getelementptr inbounds float, ptr %9, i64 %554
  store float %553, ptr %555, align 4, !tbaa !19
  br i1 %525, label %.preheader.split.3.i, label %.split420.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %556 = trunc i64 %541 to i32
  %557 = or disjoint i32 %556, 2
  %558 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %557
  %559 = load float, ptr addrspace(3) %558, align 4, !tbaa !19
  %560 = or disjoint i64 %544, 2
  %561 = getelementptr inbounds float, ptr %9, i64 %560
  store float %559, ptr %561, align 8, !tbaa !19
  br i1 %526, label %.preheader.split.4.i, label %.split420.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %562 = trunc i64 %541 to i32
  %563 = or disjoint i32 %562, 3
  %564 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %563
  %565 = load float, ptr addrspace(3) %564, align 4, !tbaa !19
  %566 = or disjoint i64 %544, 3
  %567 = getelementptr inbounds float, ptr %9, i64 %566
  store float %565, ptr %567, align 4, !tbaa !19
  br i1 %527, label %.preheader.split.5.i, label %.split420.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %568 = trunc i64 %541 to i32
  %569 = or disjoint i32 %568, 4
  %570 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %569
  %571 = load float, ptr addrspace(3) %570, align 4, !tbaa !19
  %572 = or disjoint i64 %544, 4
  %573 = getelementptr inbounds float, ptr %9, i64 %572
  store float %571, ptr %573, align 16, !tbaa !19
  br i1 %528, label %.preheader.split.6.i, label %.split420.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %574 = trunc i64 %541 to i32
  %575 = or disjoint i32 %574, 5
  %576 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %575
  %577 = load float, ptr addrspace(3) %576, align 4, !tbaa !19
  %578 = or disjoint i64 %544, 5
  %579 = getelementptr inbounds float, ptr %9, i64 %578
  store float %577, ptr %579, align 4, !tbaa !19
  br i1 %529, label %.preheader.split.7.i, label %.split420.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %580 = trunc i64 %541 to i32
  %581 = or disjoint i32 %580, 6
  %582 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %581
  %583 = load float, ptr addrspace(3) %582, align 4, !tbaa !19
  %584 = or disjoint i64 %544, 6
  %585 = getelementptr inbounds float, ptr %9, i64 %584
  store float %583, ptr %585, align 8, !tbaa !19
  br i1 %530, label %.preheader.split.8.i, label %.split420.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %586 = trunc i64 %541 to i32
  %587 = or disjoint i32 %586, 7
  %588 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %587
  %589 = load float, ptr addrspace(3) %588, align 4, !tbaa !19
  %590 = or disjoint i64 %544, 7
  %591 = getelementptr inbounds float, ptr %9, i64 %590
  store float %589, ptr %591, align 4, !tbaa !19
  br i1 %531, label %.preheader.split.9.i, label %.split420.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %592 = trunc i64 %541 to i32
  %593 = or disjoint i32 %592, 8
  %594 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %593
  %595 = load float, ptr addrspace(3) %594, align 4, !tbaa !19
  %596 = or disjoint i64 %544, 8
  %597 = getelementptr inbounds float, ptr %9, i64 %596
  store float %595, ptr %597, align 32, !tbaa !19
  br i1 %532, label %.preheader.split.10.i, label %.split420.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %598 = trunc i64 %541 to i32
  %599 = or disjoint i32 %598, 9
  %600 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %599
  %601 = load float, ptr addrspace(3) %600, align 4, !tbaa !19
  %602 = or disjoint i64 %544, 9
  %603 = getelementptr inbounds float, ptr %9, i64 %602
  store float %601, ptr %603, align 4, !tbaa !19
  br i1 %533, label %.preheader.split.11.i, label %.split420.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %604 = trunc i64 %541 to i32
  %605 = or disjoint i32 %604, 10
  %606 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %605
  %607 = load float, ptr addrspace(3) %606, align 4, !tbaa !19
  %608 = or disjoint i64 %544, 10
  %609 = getelementptr inbounds float, ptr %9, i64 %608
  store float %607, ptr %609, align 8, !tbaa !19
  br i1 %534, label %.preheader.split.12.i, label %.split420.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %610 = trunc i64 %541 to i32
  %611 = or disjoint i32 %610, 11
  %612 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %611
  %613 = load float, ptr addrspace(3) %612, align 4, !tbaa !19
  %614 = or disjoint i64 %544, 11
  %615 = getelementptr inbounds float, ptr %9, i64 %614
  store float %613, ptr %615, align 4, !tbaa !19
  br i1 %535, label %.preheader.split.13.i, label %.split420.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %616 = trunc i64 %541 to i32
  %617 = or disjoint i32 %616, 12
  %618 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %617
  %619 = load float, ptr addrspace(3) %618, align 4, !tbaa !19
  %620 = or disjoint i64 %544, 12
  %621 = getelementptr inbounds float, ptr %9, i64 %620
  store float %619, ptr %621, align 16, !tbaa !19
  br i1 %536, label %.preheader.split.14.i, label %.split420.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %622 = trunc i64 %541 to i32
  %623 = or disjoint i32 %622, 13
  %624 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %623
  %625 = load float, ptr addrspace(3) %624, align 4, !tbaa !19
  %626 = or disjoint i64 %544, 13
  %627 = getelementptr inbounds float, ptr %9, i64 %626
  store float %625, ptr %627, align 4, !tbaa !19
  br i1 %537, label %.preheader.split.15.i, label %.split420.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %628 = trunc i64 %541 to i32
  %629 = or disjoint i32 %628, 14
  %630 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %629
  %631 = load float, ptr addrspace(3) %630, align 4, !tbaa !19
  %632 = or disjoint i64 %544, 14
  %633 = getelementptr inbounds float, ptr %9, i64 %632
  store float %631, ptr %633, align 8, !tbaa !19
  br i1 %538, label %634, label %.split420.us.i

634:                                              ; preds = %.preheader.split.15.i
  %635 = trunc i64 %541 to i32
  %636 = or disjoint i32 %635, 15
  %637 = getelementptr inbounds float, ptr addrspace(3) %521, i32 %636
  %638 = load float, ptr addrspace(3) %637, align 4, !tbaa !19
  %639 = or disjoint i64 %544, 15
  %640 = getelementptr inbounds float, ptr %9, i64 %639
  store float %638, ptr %640, align 4, !tbaa !19
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="48,48" }
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
