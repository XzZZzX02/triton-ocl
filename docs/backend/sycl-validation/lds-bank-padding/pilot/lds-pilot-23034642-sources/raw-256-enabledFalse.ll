;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-j8v2pdau/kernel.cpp"
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
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 8388608
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
  %33 = icmp ult i64 %32, 256
  call void @llvm.assume(i1 %33)
  %34 = icmp ult i64 %32, 128
  br i1 %34, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %6
  %35 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %36 = inttoptr i32 %35 to ptr addrspace(3)
  %37 = trunc i64 %32 to i32
  %38 = getelementptr inbounds float, ptr addrspace(3) %36, i32 %37
  store float 0.000000e+00, ptr addrspace(3) %38, align 4, !tbaa !19
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %40 = icmp ult i64 %39, 8388607
  call void @llvm.assume(i1 %40)
  %.tr.i = trunc i64 %39 to i32
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %42 = icmp ult i64 %41, 256
  call void @llvm.assume(i1 %42)
  %43 = icmp eq i64 %41, 0
  br i1 %43, label %.preheader408.i, label %.loopexit409.i

.preheader408.i:                                  ; preds = %._crit_edge.i
  %44 = shl nuw i32 %.tr.i, 9
  %45 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = sext i32 %5 to i64
  %50 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %51 = inttoptr i32 %50 to ptr addrspace(3)
  %52 = getelementptr i8, ptr addrspace(3) %51, i32 512
  %53 = sext i32 %44 to i64
  %54 = icmp sgt i32 %.fr434.i, 0
  br i1 %54, label %.preheader408.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader408.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %52, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %55 = icmp sgt i32 %.fr434.i, 1
  %56 = or disjoint i64 %53, 64
  br i1 %55, label %.preheader408.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %51, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader408.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %57 = phi i64 [ %65, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %58 = icmp slt i64 %57, %49
  br i1 %58, label %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

59:                                               ; preds = %.preheader408.split.1.i
  %60 = add nuw nsw i64 %56, %57
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %60
  %.sroa.0207.0.copyload.1.i = load i16, ptr %61, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %59, %.preheader408.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %59 ], [ 0, %.preheader408.split.1.i ]
  %62 = trunc i64 %57 to i32
  %63 = add i32 %62, 64
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %63
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %64, align 2, !tbaa.struct !23
  %65 = add nuw nsw i64 %57, 1
  %exitcond.1.not.i = icmp eq i64 %65, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader408.split.1.i, !llvm.loop !26

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %66 = icmp sgt i32 %.fr434.i, 2
  %67 = or disjoint i64 %53, 128
  br i1 %66, label %.preheader408.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %51, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader408.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %68 = phi i64 [ %76, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %69 = icmp slt i64 %68, %49
  br i1 %69, label %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

70:                                               ; preds = %.preheader408.split.2.i
  %71 = add nuw nsw i64 %67, %68
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %71
  %.sroa.0207.0.copyload.2.i = load i16, ptr %72, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %70, %.preheader408.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %70 ], [ 0, %.preheader408.split.2.i ]
  %73 = trunc i64 %68 to i32
  %74 = add i32 %73, 128
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %74
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %75, align 2, !tbaa.struct !23
  %76 = add nuw nsw i64 %68, 1
  %exitcond.2.not.i = icmp eq i64 %76, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader408.split.2.i, !llvm.loop !26

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %77 = icmp sgt i32 %.fr434.i, 3
  %78 = or disjoint i64 %53, 192
  br i1 %77, label %.preheader408.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %51, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader408.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %79 = phi i64 [ %87, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %80 = icmp slt i64 %79, %49
  br i1 %80, label %81, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

81:                                               ; preds = %.preheader408.split.3.i
  %82 = add nuw nsw i64 %78, %79
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0207.0.copyload.3.i = load i16, ptr %83, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %81, %.preheader408.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %81 ], [ 0, %.preheader408.split.3.i ]
  %84 = trunc i64 %79 to i32
  %85 = add i32 %84, 192
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %85
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %86, align 2, !tbaa.struct !23
  %87 = add nuw nsw i64 %79, 1
  %exitcond.3.not.i = icmp eq i64 %87, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader408.split.3.i, !llvm.loop !26

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %88 = icmp sgt i32 %.fr434.i, 4
  %89 = or disjoint i64 %53, 256
  br i1 %88, label %.preheader408.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %51, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader408.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %90 = phi i64 [ %98, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %91 = icmp slt i64 %90, %49
  br i1 %91, label %92, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

92:                                               ; preds = %.preheader408.split.4.i
  %93 = add nuw nsw i64 %89, %90
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0207.0.copyload.4.i = load i16, ptr %94, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %92, %.preheader408.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %92 ], [ 0, %.preheader408.split.4.i ]
  %95 = trunc i64 %90 to i32
  %96 = add i32 %95, 256
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %96
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  %98 = add nuw nsw i64 %90, 1
  %exitcond.4.not.i = icmp eq i64 %98, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader408.split.4.i, !llvm.loop !26

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %99 = icmp sgt i32 %.fr434.i, 5
  %100 = or disjoint i64 %53, 320
  br i1 %99, label %.preheader408.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %51, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader408.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %101 = phi i64 [ %109, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %102 = icmp slt i64 %101, %49
  br i1 %102, label %103, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

103:                                              ; preds = %.preheader408.split.5.i
  %104 = add nuw nsw i64 %100, %101
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0207.0.copyload.5.i = load i16, ptr %105, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %103, %.preheader408.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %103 ], [ 0, %.preheader408.split.5.i ]
  %106 = trunc i64 %101 to i32
  %107 = add i32 %106, 320
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %107
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  %109 = add nuw nsw i64 %101, 1
  %exitcond.5.not.i = icmp eq i64 %109, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader408.split.5.i, !llvm.loop !26

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %110 = icmp sgt i32 %.fr434.i, 6
  %111 = or disjoint i64 %53, 384
  br i1 %110, label %.preheader408.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %51, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader408.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %112 = phi i64 [ %120, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %113 = icmp slt i64 %112, %49
  br i1 %113, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

114:                                              ; preds = %.preheader408.split.6.i
  %115 = add nuw nsw i64 %111, %112
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0207.0.copyload.6.i = load i16, ptr %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %114, %.preheader408.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %114 ], [ 0, %.preheader408.split.6.i ]
  %117 = trunc i64 %112 to i32
  %118 = add i32 %117, 384
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %118
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
  %120 = add nuw nsw i64 %112, 1
  %exitcond.6.not.i = icmp eq i64 %120, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader408.split.6.i, !llvm.loop !26

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %121 = icmp sgt i32 %.fr434.i, 7
  %122 = or disjoint i64 %53, 448
  br i1 %121, label %.preheader408.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %51, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit409.i

.preheader408.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %123 = phi i64 [ %131, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %124 = icmp slt i64 %123, %49
  br i1 %124, label %125, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

125:                                              ; preds = %.preheader408.split.7.i
  %126 = add nuw nsw i64 %122, %123
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %126
  %.sroa.0207.0.copyload.7.i = load i16, ptr %127, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %125, %.preheader408.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %125 ], [ 0, %.preheader408.split.7.i ]
  %128 = trunc i64 %123 to i32
  %129 = add i32 %128, 448
  %130 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %129
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %130, align 2, !tbaa.struct !23
  %131 = add nuw nsw i64 %123, 1
  %exitcond.7.not.i = icmp eq i64 %131, 64
  br i1 %exitcond.7.not.i, label %.loopexit409.i, label %.preheader408.split.7.i, !llvm.loop !26

.preheader408.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %.preheader408.i
  %132 = phi i64 [ %139, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i ], [ 0, %.preheader408.i ]
  %133 = icmp slt i64 %132, %49
  br i1 %133, label %134, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

134:                                              ; preds = %.preheader408.split.i
  %135 = add nuw nsw i64 %132, %53
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %135
  %.sroa.0207.0.copyload.i = load i16, ptr %136, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %134, %.preheader408.split.i
  %.sroa.0209.2.i = phi i16 [ %.sroa.0207.0.copyload.i, %134 ], [ 0, %.preheader408.split.i ]
  %137 = trunc i64 %132 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %137
  store i16 %.sroa.0209.2.i, ptr addrspace(3) %138, align 2, !tbaa.struct !23
  %139 = add nuw nsw i64 %132, 1
  %exitcond.not.i = icmp eq i64 %139, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader408.split.i, !llvm.loop !26

.loopexit409.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %140 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %141 = icmp ult i64 %140, 256
  call void @llvm.assume(i1 %141)
  %142 = icmp eq i64 %140, 0
  br i1 %142, label %143, label %.loopexit.i

143:                                              ; preds = %.loopexit409.i
  %144 = shl i32 %.tr.i, 10
  %145 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %146 = icmp eq i64 %145, 0
  call void @llvm.assume(i1 %146)
  %147 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %148 = icmp eq i64 %147, 0
  call void @llvm.assume(i1 %148)
  %149 = sext i32 %5 to i64
  %150 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %151 = inttoptr i32 %150 to ptr addrspace(3)
  %152 = getelementptr inbounds i8, ptr addrspace(3) %151, i32 1536
  %153 = sext i32 %144 to i64
  %154 = icmp sgt i32 %4, 0
  %155 = icmp ugt i32 %4, 1
  %156 = icmp ugt i32 %4, 2
  %157 = icmp ugt i32 %4, 3
  %158 = icmp ugt i32 %4, 4
  %159 = icmp ugt i32 %4, 5
  %160 = icmp ugt i32 %4, 6
  %161 = icmp ugt i32 %4, 7
  %162 = icmp ugt i32 %4, 8
  %163 = icmp ugt i32 %4, 9
  %164 = icmp ugt i32 %4, 10
  %165 = icmp ugt i32 %4, 11
  %166 = icmp ugt i32 %4, 12
  %167 = icmp ugt i32 %4, 13
  %168 = icmp ugt i32 %4, 14
  %169 = icmp ugt i32 %4, 15
  br label %.preheader407.i

.preheader407.i:                                  ; preds = %.split415.us.i, %143
  %170 = phi i64 [ 0, %143 ], [ %180, %.split415.us.i ]
  %171 = icmp slt i64 %170, %149
  %172 = shl i64 %170, 4
  %.tr400.i = trunc i64 %170 to i32
  %173 = shl i32 %.tr400.i, 4
  %174 = sext i32 %173 to i64
  %175 = add nsw i64 %174, %153
  %.fr416.i = freeze i1 %171
  br i1 %.fr416.i, label %.preheader407.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader407.i
  %.tr433.i = trunc i64 %170 to i32
  %176 = shl i32 %.tr433.i, 5
  %177 = add i32 %176, 1536
  %scevgep427.i = getelementptr i8, ptr addrspace(3) %151, i32 %177
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep427.i, i8 0, i32 32, i1 false)
  br label %.split415.us.i

.preheader407.split.preheader.i:                  ; preds = %.preheader407.i
  br i1 %154, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader407.split.preheader.i
  %178 = trunc i64 %172 to i32
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %178
  store i16 0, ptr addrspace(3) %179, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split415.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %180 = add nuw nsw i64 %170, 1
  %exitcond429.not.i = icmp eq i64 %180, 64
  br i1 %exitcond429.not.i, label %.loopexit.i, label %.preheader407.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader407.split.preheader.i
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %175
  %.sroa.0196.0.copyload.i = load i16, ptr %181, align 32, !tbaa.struct !23
  %182 = trunc i64 %172 to i32
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %182
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %183, align 2, !tbaa.struct !23
  br i1 %155, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %184 = trunc i64 %172 to i32
  %185 = or disjoint i32 %184, 1
  %186 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %185
  store i16 0, ptr addrspace(3) %186, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %187 = or disjoint i64 %175, 1
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %187
  %.sroa.0196.0.copyload.1.i = load i16, ptr %188, align 2, !tbaa.struct !23
  %189 = trunc i64 %172 to i32
  %190 = or disjoint i32 %189, 1
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %190
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %191, align 2, !tbaa.struct !23
  br i1 %156, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %192 = trunc i64 %172 to i32
  %193 = or disjoint i32 %192, 2
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %193
  store i16 0, ptr addrspace(3) %194, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %195 = or disjoint i64 %175, 2
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %195
  %.sroa.0196.0.copyload.2.i = load i16, ptr %196, align 4, !tbaa.struct !23
  %197 = trunc i64 %172 to i32
  %198 = or disjoint i32 %197, 2
  %199 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %198
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %199, align 2, !tbaa.struct !23
  br i1 %157, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %200 = trunc i64 %172 to i32
  %201 = or disjoint i32 %200, 3
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %201
  store i16 0, ptr addrspace(3) %202, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %203 = or disjoint i64 %175, 3
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %203
  %.sroa.0196.0.copyload.3.i = load i16, ptr %204, align 2, !tbaa.struct !23
  %205 = trunc i64 %172 to i32
  %206 = or disjoint i32 %205, 3
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %206
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %207, align 2, !tbaa.struct !23
  br i1 %158, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %208 = trunc i64 %172 to i32
  %209 = or disjoint i32 %208, 4
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %209
  store i16 0, ptr addrspace(3) %210, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %211 = or disjoint i64 %175, 4
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %211
  %.sroa.0196.0.copyload.4.i = load i16, ptr %212, align 8, !tbaa.struct !23
  %213 = trunc i64 %172 to i32
  %214 = or disjoint i32 %213, 4
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %214
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %215, align 2, !tbaa.struct !23
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %216 = trunc i64 %172 to i32
  %217 = or disjoint i32 %216, 5
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %217
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %219 = or disjoint i64 %175, 5
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %219
  %.sroa.0196.0.copyload.5.i = load i16, ptr %220, align 2, !tbaa.struct !23
  %221 = trunc i64 %172 to i32
  %222 = or disjoint i32 %221, 5
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %222
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %223, align 2, !tbaa.struct !23
  br i1 %160, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %224 = trunc i64 %172 to i32
  %225 = or disjoint i32 %224, 6
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %225
  store i16 0, ptr addrspace(3) %226, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %227 = or disjoint i64 %175, 6
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %227
  %.sroa.0196.0.copyload.6.i = load i16, ptr %228, align 4, !tbaa.struct !23
  %229 = trunc i64 %172 to i32
  %230 = or disjoint i32 %229, 6
  %231 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %230
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %231, align 2, !tbaa.struct !23
  br i1 %161, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %232 = trunc i64 %172 to i32
  %233 = or disjoint i32 %232, 7
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %233
  store i16 0, ptr addrspace(3) %234, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %235 = or disjoint i64 %175, 7
  %236 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %235
  %.sroa.0196.0.copyload.7.i = load i16, ptr %236, align 2, !tbaa.struct !23
  %237 = trunc i64 %172 to i32
  %238 = or disjoint i32 %237, 7
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %238
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %239, align 2, !tbaa.struct !23
  br i1 %162, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %240 = trunc i64 %172 to i32
  %241 = or disjoint i32 %240, 8
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %241
  store i16 0, ptr addrspace(3) %242, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %243 = or disjoint i64 %175, 8
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %243
  %.sroa.0196.0.copyload.8.i = load i16, ptr %244, align 16, !tbaa.struct !23
  %245 = trunc i64 %172 to i32
  %246 = or disjoint i32 %245, 8
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %246
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %247, align 2, !tbaa.struct !23
  br i1 %163, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %248 = trunc i64 %172 to i32
  %249 = or disjoint i32 %248, 9
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %249
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %251 = or disjoint i64 %175, 9
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %251
  %.sroa.0196.0.copyload.9.i = load i16, ptr %252, align 2, !tbaa.struct !23
  %253 = trunc i64 %172 to i32
  %254 = or disjoint i32 %253, 9
  %255 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %254
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %255, align 2, !tbaa.struct !23
  br i1 %164, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %256 = trunc i64 %172 to i32
  %257 = or disjoint i32 %256, 10
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %257
  store i16 0, ptr addrspace(3) %258, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %259 = or disjoint i64 %175, 10
  %260 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %259
  %.sroa.0196.0.copyload.10.i = load i16, ptr %260, align 4, !tbaa.struct !23
  %261 = trunc i64 %172 to i32
  %262 = or disjoint i32 %261, 10
  %263 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %262
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %263, align 2, !tbaa.struct !23
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %264 = trunc i64 %172 to i32
  %265 = or disjoint i32 %264, 11
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %265
  store i16 0, ptr addrspace(3) %266, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %267 = or disjoint i64 %175, 11
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %267
  %.sroa.0196.0.copyload.11.i = load i16, ptr %268, align 2, !tbaa.struct !23
  %269 = trunc i64 %172 to i32
  %270 = or disjoint i32 %269, 11
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %270
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %271, align 2, !tbaa.struct !23
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %272 = trunc i64 %172 to i32
  %273 = or disjoint i32 %272, 12
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %273
  store i16 0, ptr addrspace(3) %274, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %275 = or disjoint i64 %175, 12
  %276 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %275
  %.sroa.0196.0.copyload.12.i = load i16, ptr %276, align 8, !tbaa.struct !23
  %277 = trunc i64 %172 to i32
  %278 = or disjoint i32 %277, 12
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %278
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %279, align 2, !tbaa.struct !23
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %280 = trunc i64 %172 to i32
  %281 = or disjoint i32 %280, 13
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %281
  store i16 0, ptr addrspace(3) %282, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %283 = or disjoint i64 %175, 13
  %284 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %283
  %.sroa.0196.0.copyload.13.i = load i16, ptr %284, align 2, !tbaa.struct !23
  %285 = trunc i64 %172 to i32
  %286 = or disjoint i32 %285, 13
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %286
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %287, align 2, !tbaa.struct !23
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %288 = trunc i64 %172 to i32
  %289 = or disjoint i32 %288, 14
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %289
  store i16 0, ptr addrspace(3) %290, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %291 = or disjoint i64 %175, 14
  %292 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %291
  %.sroa.0196.0.copyload.14.i = load i16, ptr %292, align 4, !tbaa.struct !23
  %293 = trunc i64 %172 to i32
  %294 = or disjoint i32 %293, 14
  %295 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %294
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %295, align 2, !tbaa.struct !23
  br i1 %169, label %296, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

296:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %297 = or disjoint i64 %175, 15
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %297
  %.sroa.0196.0.copyload.15.i = load i16, ptr %298, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %296, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %296 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %299 = trunc i64 %172 to i32
  %300 = or disjoint i32 %299, 15
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %300
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %301, align 2, !tbaa.struct !23
  br label %.split415.us.i

.loopexit.i:                                      ; preds = %.split415.us.i, %.loopexit409.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %302 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %303 = icmp eq i64 %302, 0
  call void @llvm.assume(i1 %303)
  %304 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %305 = icmp eq i64 %304, 0
  call void @llvm.assume(i1 %305)
  %306 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %307 = icmp ult i64 %306, 256
  call void @llvm.assume(i1 %307)
  %308 = icmp ult i64 %306, 128
  br i1 %308, label %.lr.ph418.i, label %._crit_edge419.i

.lr.ph418.i:                                      ; preds = %.loopexit.i
  %309 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %310 = inttoptr i32 %309 to ptr addrspace(3)
  %311 = getelementptr inbounds i8, ptr addrspace(3) %310, i32 512
  %312 = getelementptr inbounds i8, ptr addrspace(3) %310, i32 1536
  %313 = and i64 %306, 15
  %314 = shl nuw nsw i64 %306, 2
  %315 = and i64 %314, 448
  %316 = trunc i64 %306 to i32
  %317 = getelementptr inbounds float, ptr addrspace(3) %310, i32 %316
  %.pre.i = load float, ptr addrspace(3) %317, align 4, !tbaa !19
  br label %322

._crit_edge419.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.loopexit.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %318 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %319 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %320 = icmp ult i64 %319, 256
  call void @llvm.assume(i1 %320)
  %321 = icmp eq i64 %319, 0
  br i1 %321, label %375, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

322:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph418.i
  %323 = phi float [ %.pre.i, %.lr.ph418.i ], [ %373, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %324 = phi i64 [ 0, %.lr.ph418.i ], [ %374, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %325 = add nuw nsw i64 %324, %315
  %326 = trunc i64 %325 to i32
  %327 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %311, i32 %326
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %327, align 2, !tbaa.struct !23
  %328 = shl nuw nsw i64 %324, 4
  %329 = or disjoint i64 %328, %313
  %330 = trunc i64 %329 to i32
  %331 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %312, i32 %330
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %331, align 2, !tbaa.struct !23
  %332 = zext i16 %.sroa.0185.0.copyload.i to i32
  %333 = lshr i32 %332, 10
  %334 = and i32 %333, 31
  %335 = and i32 %332, 1023
  switch i32 %334, label %341 [
    i32 31, label %336
    i32 0, label %343
  ]

336:                                              ; preds = %322
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %337 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %335, 0
  %338 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %339 = or disjoint i32 %338, %337
  %340 = bitcast i32 %339 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

341:                                              ; preds = %322
  %342 = or disjoint i32 %335, 1024
  br label %343

343:                                              ; preds = %341, %322
  %344 = phi i32 [ %342, %341 ], [ %335, %322 ]
  %345 = uitofp i32 %344 to float
  %.not.i = icmp eq i32 %334, 0
  %346 = add nsw i32 %334, -25
  %347 = select i1 %.not.i, i32 -24, i32 %346
  %348 = call float @__ocml_ldexp_f32(float noundef %345, i32 noundef %347) #6
  %349 = fneg contract float %348
  %.not393394.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %350 = select contract i1 %.not393394.i, float %349, float %348
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %343, %336
  %351 = phi float [ %340, %336 ], [ %350, %343 ]
  %352 = zext i16 %.sroa.0176.0.copyload.i to i32
  %353 = lshr i32 %352, 10
  %354 = and i32 %353, 31
  %355 = and i32 %352, 1023
  switch i32 %354, label %361 [
    i32 31, label %356
    i32 0, label %363
  ]

356:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %357 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %355, 0
  %358 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %359 = or disjoint i32 %358, %357
  %360 = bitcast i32 %359 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

361:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %362 = or disjoint i32 %355, 1024
  br label %363

363:                                              ; preds = %361, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %364 = phi i32 [ %362, %361 ], [ %355, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %365 = uitofp i32 %364 to float
  %.not395.i = icmp eq i32 %354, 0
  %366 = add nsw i32 %354, -25
  %367 = select i1 %.not395.i, i32 -24, i32 %366
  %368 = call float @__ocml_ldexp_f32(float noundef %365, i32 noundef %367) #6
  %369 = fneg contract float %368
  %.not396397.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %370 = select contract i1 %.not396397.i, float %369, float %368
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %363, %356
  %371 = phi float [ %360, %356 ], [ %370, %363 ]
  %372 = fmul contract float %351, %371
  %373 = fadd contract float %323, %372
  store float %373, ptr addrspace(3) %317, align 4, !tbaa !19
  %374 = add nuw nsw i64 %324, 1
  %exitcond430.not.i = icmp eq i64 %374, 64
  br i1 %exitcond430.not.i, label %._crit_edge419.i, label %322, !llvm.loop !31

375:                                              ; preds = %._crit_edge419.i
  %376 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %377 = icmp eq i64 %376, 0
  call void @llvm.assume(i1 %377)
  %378 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %379 = icmp eq i64 %378, 0
  call void @llvm.assume(i1 %379)
  %380 = sext i32 %.fr434.i to i64
  %381 = call i32 @llvm.amdgcn.groupstaticsize()
  %382 = inttoptr i32 %381 to ptr addrspace(3)
  %383 = icmp slt i32 %4, 1
  %384 = icmp ugt i32 %4, 1
  %385 = icmp ugt i32 %4, 2
  %386 = icmp ugt i32 %4, 3
  %387 = icmp ugt i32 %4, 4
  %388 = icmp ugt i32 %4, 5
  %389 = icmp ugt i32 %4, 6
  %390 = icmp ugt i32 %4, 7
  %391 = icmp ugt i32 %4, 8
  %392 = icmp ugt i32 %4, 9
  %393 = icmp ugt i32 %4, 10
  %394 = icmp ugt i32 %4, 11
  %395 = icmp ugt i32 %4, 12
  %396 = icmp ugt i32 %4, 13
  %397 = icmp ugt i32 %4, 14
  %398 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split421.us.i, %375
  %399 = phi i64 [ 0, %375 ], [ %405, %.split421.us.i ]
  %400 = icmp sge i64 %399, %380
  %401 = shl i64 %399, 4
  %.tr392.i = trunc i64 %399 to i32
  %402 = shl i32 %.tr392.i, 4
  %403 = sext i32 %402 to i64
  %404 = add nsw i64 %318, %403
  %brmerge.i = select i1 %400, i1 true, i1 %383
  br i1 %brmerge.i, label %.split421.us.i, label %.preheader.split.1.i

.split421.us.i:                                   ; preds = %494, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %405 = add i64 %399, 1
  %exitcond432.not.i = icmp eq i64 %405, 8
  br i1 %exitcond432.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %406 = trunc i64 %401 to i32
  %407 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %406
  %408 = load float, ptr addrspace(3) %407, align 4, !tbaa !19
  %409 = getelementptr inbounds float, ptr %9, i64 %404
  store float %408, ptr %409, align 32, !tbaa !19
  br i1 %384, label %.preheader.split.2.i, label %.split421.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %410 = trunc i64 %401 to i32
  %411 = or disjoint i32 %410, 1
  %412 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %411
  %413 = load float, ptr addrspace(3) %412, align 4, !tbaa !19
  %414 = or disjoint i64 %404, 1
  %415 = getelementptr inbounds float, ptr %9, i64 %414
  store float %413, ptr %415, align 4, !tbaa !19
  br i1 %385, label %.preheader.split.3.i, label %.split421.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %416 = trunc i64 %401 to i32
  %417 = or disjoint i32 %416, 2
  %418 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !19
  %420 = or disjoint i64 %404, 2
  %421 = getelementptr inbounds float, ptr %9, i64 %420
  store float %419, ptr %421, align 8, !tbaa !19
  br i1 %386, label %.preheader.split.4.i, label %.split421.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %422 = trunc i64 %401 to i32
  %423 = or disjoint i32 %422, 3
  %424 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %423
  %425 = load float, ptr addrspace(3) %424, align 4, !tbaa !19
  %426 = or disjoint i64 %404, 3
  %427 = getelementptr inbounds float, ptr %9, i64 %426
  store float %425, ptr %427, align 4, !tbaa !19
  br i1 %387, label %.preheader.split.5.i, label %.split421.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %428 = trunc i64 %401 to i32
  %429 = or disjoint i32 %428, 4
  %430 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %429
  %431 = load float, ptr addrspace(3) %430, align 4, !tbaa !19
  %432 = or disjoint i64 %404, 4
  %433 = getelementptr inbounds float, ptr %9, i64 %432
  store float %431, ptr %433, align 16, !tbaa !19
  br i1 %388, label %.preheader.split.6.i, label %.split421.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %434 = trunc i64 %401 to i32
  %435 = or disjoint i32 %434, 5
  %436 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %435
  %437 = load float, ptr addrspace(3) %436, align 4, !tbaa !19
  %438 = or disjoint i64 %404, 5
  %439 = getelementptr inbounds float, ptr %9, i64 %438
  store float %437, ptr %439, align 4, !tbaa !19
  br i1 %389, label %.preheader.split.7.i, label %.split421.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %440 = trunc i64 %401 to i32
  %441 = or disjoint i32 %440, 6
  %442 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %441
  %443 = load float, ptr addrspace(3) %442, align 4, !tbaa !19
  %444 = or disjoint i64 %404, 6
  %445 = getelementptr inbounds float, ptr %9, i64 %444
  store float %443, ptr %445, align 8, !tbaa !19
  br i1 %390, label %.preheader.split.8.i, label %.split421.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %446 = trunc i64 %401 to i32
  %447 = or disjoint i32 %446, 7
  %448 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %447
  %449 = load float, ptr addrspace(3) %448, align 4, !tbaa !19
  %450 = or disjoint i64 %404, 7
  %451 = getelementptr inbounds float, ptr %9, i64 %450
  store float %449, ptr %451, align 4, !tbaa !19
  br i1 %391, label %.preheader.split.9.i, label %.split421.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %452 = trunc i64 %401 to i32
  %453 = or disjoint i32 %452, 8
  %454 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %453
  %455 = load float, ptr addrspace(3) %454, align 4, !tbaa !19
  %456 = or disjoint i64 %404, 8
  %457 = getelementptr inbounds float, ptr %9, i64 %456
  store float %455, ptr %457, align 32, !tbaa !19
  br i1 %392, label %.preheader.split.10.i, label %.split421.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %458 = trunc i64 %401 to i32
  %459 = or disjoint i32 %458, 9
  %460 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %459
  %461 = load float, ptr addrspace(3) %460, align 4, !tbaa !19
  %462 = or disjoint i64 %404, 9
  %463 = getelementptr inbounds float, ptr %9, i64 %462
  store float %461, ptr %463, align 4, !tbaa !19
  br i1 %393, label %.preheader.split.11.i, label %.split421.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %464 = trunc i64 %401 to i32
  %465 = or disjoint i32 %464, 10
  %466 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %465
  %467 = load float, ptr addrspace(3) %466, align 4, !tbaa !19
  %468 = or disjoint i64 %404, 10
  %469 = getelementptr inbounds float, ptr %9, i64 %468
  store float %467, ptr %469, align 8, !tbaa !19
  br i1 %394, label %.preheader.split.12.i, label %.split421.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %470 = trunc i64 %401 to i32
  %471 = or disjoint i32 %470, 11
  %472 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %471
  %473 = load float, ptr addrspace(3) %472, align 4, !tbaa !19
  %474 = or disjoint i64 %404, 11
  %475 = getelementptr inbounds float, ptr %9, i64 %474
  store float %473, ptr %475, align 4, !tbaa !19
  br i1 %395, label %.preheader.split.13.i, label %.split421.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %476 = trunc i64 %401 to i32
  %477 = or disjoint i32 %476, 12
  %478 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %477
  %479 = load float, ptr addrspace(3) %478, align 4, !tbaa !19
  %480 = or disjoint i64 %404, 12
  %481 = getelementptr inbounds float, ptr %9, i64 %480
  store float %479, ptr %481, align 16, !tbaa !19
  br i1 %396, label %.preheader.split.14.i, label %.split421.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %482 = trunc i64 %401 to i32
  %483 = or disjoint i32 %482, 13
  %484 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %483
  %485 = load float, ptr addrspace(3) %484, align 4, !tbaa !19
  %486 = or disjoint i64 %404, 13
  %487 = getelementptr inbounds float, ptr %9, i64 %486
  store float %485, ptr %487, align 4, !tbaa !19
  br i1 %397, label %.preheader.split.15.i, label %.split421.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %488 = trunc i64 %401 to i32
  %489 = or disjoint i32 %488, 14
  %490 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %489
  %491 = load float, ptr addrspace(3) %490, align 4, !tbaa !19
  %492 = or disjoint i64 %404, 14
  %493 = getelementptr inbounds float, ptr %9, i64 %492
  store float %491, ptr %493, align 8, !tbaa !19
  br i1 %398, label %494, label %.split421.us.i

494:                                              ; preds = %.preheader.split.15.i
  %495 = trunc i64 %401 to i32
  %496 = or disjoint i32 %495, 15
  %497 = getelementptr inbounds float, ptr addrspace(3) %382, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !19
  %499 = or disjoint i64 %404, 15
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 4, !tbaa !19
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="256,256" }
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
!23 = !{i64 0, i64 2, !24}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !21, i64 0}
!26 = distinct !{!26, !27, !28, !29}
!27 = !{!"llvm.loop.mustprogress"}
!28 = !{!"llvm.loop.vectorize.width", i32 1}
!29 = !{!"llvm.loop.interleave.count", i32 1}
!30 = distinct !{!30, !27, !28, !29}
!31 = distinct !{!31, !27}
!32 = distinct !{!32, !27}
;----------------- End AdaptiveCpp IR dump ---------------
