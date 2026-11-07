;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-bpxgxtdw/kernel.cpp"
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
  br i1 %43, label %.preheader407.i, label %.loopexit408.i

.preheader407.i:                                  ; preds = %._crit_edge.i
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
  %54 = icmp sgt i32 %.fr433.i, 0
  br i1 %54, label %.preheader407.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader407.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %52, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %55 = icmp sgt i32 %.fr433.i, 1
  %56 = or disjoint i64 %53, 64
  br i1 %55, label %.preheader407.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %51, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader407.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %57 = phi i64 [ %65, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %58 = icmp slt i64 %57, %49
  br i1 %58, label %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

59:                                               ; preds = %.preheader407.split.1.i
  %60 = add nuw nsw i64 %56, %57
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %60
  %.sroa.0207.0.copyload.1.i = load i16, ptr %61, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %59, %.preheader407.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %59 ], [ 0, %.preheader407.split.1.i ]
  %62 = trunc i64 %57 to i32
  %63 = add i32 %62, 64
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %63
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %64, align 2, !tbaa.struct !23
  %65 = add nuw nsw i64 %57, 1
  %exitcond.1.not.i = icmp eq i64 %65, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader407.split.1.i, !llvm.loop !26

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %66 = icmp sgt i32 %.fr433.i, 2
  %67 = or disjoint i64 %53, 128
  br i1 %66, label %.preheader407.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %51, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader407.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %68 = phi i64 [ %76, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %69 = icmp slt i64 %68, %49
  br i1 %69, label %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

70:                                               ; preds = %.preheader407.split.2.i
  %71 = add nuw nsw i64 %67, %68
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %71
  %.sroa.0207.0.copyload.2.i = load i16, ptr %72, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %70, %.preheader407.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %70 ], [ 0, %.preheader407.split.2.i ]
  %73 = trunc i64 %68 to i32
  %74 = add i32 %73, 128
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %74
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %75, align 2, !tbaa.struct !23
  %76 = add nuw nsw i64 %68, 1
  %exitcond.2.not.i = icmp eq i64 %76, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader407.split.2.i, !llvm.loop !26

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %77 = icmp sgt i32 %.fr433.i, 3
  %78 = or disjoint i64 %53, 192
  br i1 %77, label %.preheader407.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %51, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader407.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %79 = phi i64 [ %87, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %80 = icmp slt i64 %79, %49
  br i1 %80, label %81, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

81:                                               ; preds = %.preheader407.split.3.i
  %82 = add nuw nsw i64 %78, %79
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0207.0.copyload.3.i = load i16, ptr %83, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %81, %.preheader407.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %81 ], [ 0, %.preheader407.split.3.i ]
  %84 = trunc i64 %79 to i32
  %85 = add i32 %84, 192
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %85
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %86, align 2, !tbaa.struct !23
  %87 = add nuw nsw i64 %79, 1
  %exitcond.3.not.i = icmp eq i64 %87, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader407.split.3.i, !llvm.loop !26

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %88 = icmp sgt i32 %.fr433.i, 4
  %89 = or disjoint i64 %53, 256
  br i1 %88, label %.preheader407.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %51, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader407.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %90 = phi i64 [ %98, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %91 = icmp slt i64 %90, %49
  br i1 %91, label %92, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

92:                                               ; preds = %.preheader407.split.4.i
  %93 = add nuw nsw i64 %89, %90
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0207.0.copyload.4.i = load i16, ptr %94, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %92, %.preheader407.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %92 ], [ 0, %.preheader407.split.4.i ]
  %95 = trunc i64 %90 to i32
  %96 = add i32 %95, 256
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %96
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  %98 = add nuw nsw i64 %90, 1
  %exitcond.4.not.i = icmp eq i64 %98, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader407.split.4.i, !llvm.loop !26

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %99 = icmp sgt i32 %.fr433.i, 5
  %100 = or disjoint i64 %53, 320
  br i1 %99, label %.preheader407.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %51, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader407.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %101 = phi i64 [ %109, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %102 = icmp slt i64 %101, %49
  br i1 %102, label %103, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

103:                                              ; preds = %.preheader407.split.5.i
  %104 = add nuw nsw i64 %100, %101
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0207.0.copyload.5.i = load i16, ptr %105, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %103, %.preheader407.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %103 ], [ 0, %.preheader407.split.5.i ]
  %106 = trunc i64 %101 to i32
  %107 = add i32 %106, 320
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %107
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  %109 = add nuw nsw i64 %101, 1
  %exitcond.5.not.i = icmp eq i64 %109, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader407.split.5.i, !llvm.loop !26

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %110 = icmp sgt i32 %.fr433.i, 6
  %111 = or disjoint i64 %53, 384
  br i1 %110, label %.preheader407.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %51, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader407.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %112 = phi i64 [ %120, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %113 = icmp slt i64 %112, %49
  br i1 %113, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

114:                                              ; preds = %.preheader407.split.6.i
  %115 = add nuw nsw i64 %111, %112
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0207.0.copyload.6.i = load i16, ptr %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %114, %.preheader407.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %114 ], [ 0, %.preheader407.split.6.i ]
  %117 = trunc i64 %112 to i32
  %118 = add i32 %117, 384
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %118
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
  %120 = add nuw nsw i64 %112, 1
  %exitcond.6.not.i = icmp eq i64 %120, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader407.split.6.i, !llvm.loop !26

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %121 = icmp sgt i32 %.fr433.i, 7
  %122 = or disjoint i64 %53, 448
  br i1 %121, label %.preheader407.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %51, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit408.i

.preheader407.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %123 = phi i64 [ %131, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %124 = icmp slt i64 %123, %49
  br i1 %124, label %125, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

125:                                              ; preds = %.preheader407.split.7.i
  %126 = add nuw nsw i64 %122, %123
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %126
  %.sroa.0207.0.copyload.7.i = load i16, ptr %127, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %125, %.preheader407.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %125 ], [ 0, %.preheader407.split.7.i ]
  %128 = trunc i64 %123 to i32
  %129 = add i32 %128, 448
  %130 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %129
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %130, align 2, !tbaa.struct !23
  %131 = add nuw nsw i64 %123, 1
  %exitcond.7.not.i = icmp eq i64 %131, 64
  br i1 %exitcond.7.not.i, label %.loopexit408.i, label %.preheader407.split.7.i, !llvm.loop !26

.preheader407.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %.preheader407.i
  %132 = phi i64 [ %139, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i ], [ 0, %.preheader407.i ]
  %133 = icmp slt i64 %132, %49
  br i1 %133, label %134, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

134:                                              ; preds = %.preheader407.split.i
  %135 = add nuw nsw i64 %132, %53
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %135
  %.sroa.0207.0.copyload.i = load i16, ptr %136, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %134, %.preheader407.split.i
  %.sroa.0209.2.i = phi i16 [ %.sroa.0207.0.copyload.i, %134 ], [ 0, %.preheader407.split.i ]
  %137 = trunc i64 %132 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %137
  store i16 %.sroa.0209.2.i, ptr addrspace(3) %138, align 2, !tbaa.struct !23
  %139 = add nuw nsw i64 %132, 1
  %exitcond.not.i = icmp eq i64 %139, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader407.split.i, !llvm.loop !26

.loopexit408.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %._crit_edge.i
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

143:                                              ; preds = %.loopexit408.i
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
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split414.us.i, %143
  %170 = phi i64 [ 0, %143 ], [ %180, %.split414.us.i ]
  %171 = icmp slt i64 %170, %149
  %172 = shl i64 %170, 4
  %.tr400.i = trunc i64 %170 to i32
  %173 = shl i32 %.tr400.i, 4
  %174 = sext i32 %173 to i64
  %175 = add nsw i64 %174, %153
  %.fr415.i = freeze i1 %171
  br i1 %.fr415.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr432.i = trunc i64 %170 to i32
  %176 = shl i32 %.tr432.i, 5
  %177 = add i32 %176, 1536
  %scevgep426.i = getelementptr i8, ptr addrspace(3) %151, i32 %177
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep426.i, i8 0, i32 32, i1 false)
  br label %.split414.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %154, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %178 = trunc i64 %172 to i32
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %178
  store i16 0, ptr addrspace(3) %179, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split414.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %180 = add nuw nsw i64 %170, 1
  %exitcond428.not.i = icmp eq i64 %180, 64
  br i1 %exitcond428.not.i, label %.loopexit.i, label %.preheader406.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader406.split.preheader.i
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
  br label %.split414.us.i

.loopexit.i:                                      ; preds = %.split414.us.i, %.loopexit408.i
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
  br i1 %308, label %.lr.ph417.i, label %._crit_edge418.i

.lr.ph417.i:                                      ; preds = %.loopexit.i
  %309 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %310 = inttoptr i32 %309 to ptr addrspace(3)
  %311 = getelementptr inbounds i8, ptr addrspace(3) %310, i32 512
  %312 = getelementptr inbounds i8, ptr addrspace(3) %310, i32 1536
  %313 = and i64 %306, 15
  %314 = trunc i64 %306 to i32
  %315 = getelementptr inbounds float, ptr addrspace(3) %310, i32 %314
  %316 = load float, ptr addrspace(3) %315, align 4, !tbaa !19
  %317 = shl nuw nsw i64 %306, 2
  %318 = and i64 %317, 448
  br label %323

._crit_edge418.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.loopexit.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %319 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %320 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %321 = icmp ult i64 %320, 256
  call void @llvm.assume(i1 %321)
  %322 = icmp eq i64 %320, 0
  br i1 %322, label %376, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %374, ptr addrspace(3) %315, align 4, !tbaa !19
  br label %._crit_edge418.i

323:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph417.i
  %324 = phi i64 [ 0, %.lr.ph417.i ], [ %375, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %325 = phi float [ %316, %.lr.ph417.i ], [ %374, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %326 = add nuw nsw i64 %324, %318
  %327 = trunc i64 %326 to i32
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %311, i32 %327
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %328, align 2, !tbaa.struct !23
  %329 = shl nuw nsw i64 %324, 4
  %330 = or disjoint i64 %329, %313
  %331 = trunc i64 %330 to i32
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %312, i32 %331
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %332, align 2, !tbaa.struct !23
  %333 = zext i16 %.sroa.0179.0.copyload.i to i32
  %334 = lshr i32 %333, 10
  %335 = and i32 %334, 31
  %336 = and i32 %333, 1023
  switch i32 %335, label %342 [
    i32 31, label %337
    i32 0, label %344
  ]

337:                                              ; preds = %323
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %338 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %336, 0
  %339 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %340 = or disjoint i32 %339, %338
  %341 = bitcast i32 %340 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

342:                                              ; preds = %323
  %343 = or disjoint i32 %336, 1024
  br label %344

344:                                              ; preds = %342, %323
  %345 = phi i32 [ %343, %342 ], [ %336, %323 ]
  %346 = uitofp i32 %345 to float
  %.not.i = icmp eq i32 %335, 0
  %347 = add nsw i32 %335, -25
  %348 = select i1 %.not.i, i32 -24, i32 %347
  %349 = call float @__ocml_ldexp_f32(float noundef %346, i32 noundef %348) #6
  %350 = fneg contract float %349
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %351 = select contract i1 %.not393394.i, float %350, float %349
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %344, %337
  %352 = phi float [ %341, %337 ], [ %351, %344 ]
  %353 = zext i16 %.sroa.0170.0.copyload.i to i32
  %354 = lshr i32 %353, 10
  %355 = and i32 %354, 31
  %356 = and i32 %353, 1023
  switch i32 %355, label %362 [
    i32 31, label %357
    i32 0, label %364
  ]

357:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %358 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %356, 0
  %359 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %360 = or disjoint i32 %359, %358
  %361 = bitcast i32 %360 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

362:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %363 = or disjoint i32 %356, 1024
  br label %364

364:                                              ; preds = %362, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %365 = phi i32 [ %363, %362 ], [ %356, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %366 = uitofp i32 %365 to float
  %.not395.i = icmp eq i32 %355, 0
  %367 = add nsw i32 %355, -25
  %368 = select i1 %.not395.i, i32 -24, i32 %367
  %369 = call float @__ocml_ldexp_f32(float noundef %366, i32 noundef %368) #6
  %370 = fneg contract float %369
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %371 = select contract i1 %.not396397.i, float %370, float %369
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %364, %357
  %372 = phi float [ %361, %357 ], [ %371, %364 ]
  %373 = fmul contract float %352, %372
  %374 = fadd contract float %325, %373
  %375 = add nuw nsw i64 %324, 1
  %exitcond429.not.i = icmp eq i64 %375, 64
  br i1 %exitcond429.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %323, !llvm.loop !31

376:                                              ; preds = %._crit_edge418.i
  %377 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %378 = icmp eq i64 %377, 0
  call void @llvm.assume(i1 %378)
  %379 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %380 = icmp eq i64 %379, 0
  call void @llvm.assume(i1 %380)
  %381 = sext i32 %.fr433.i to i64
  %382 = call i32 @llvm.amdgcn.groupstaticsize()
  %383 = inttoptr i32 %382 to ptr addrspace(3)
  %384 = icmp slt i32 %4, 1
  %385 = icmp ugt i32 %4, 1
  %386 = icmp ugt i32 %4, 2
  %387 = icmp ugt i32 %4, 3
  %388 = icmp ugt i32 %4, 4
  %389 = icmp ugt i32 %4, 5
  %390 = icmp ugt i32 %4, 6
  %391 = icmp ugt i32 %4, 7
  %392 = icmp ugt i32 %4, 8
  %393 = icmp ugt i32 %4, 9
  %394 = icmp ugt i32 %4, 10
  %395 = icmp ugt i32 %4, 11
  %396 = icmp ugt i32 %4, 12
  %397 = icmp ugt i32 %4, 13
  %398 = icmp ugt i32 %4, 14
  %399 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split420.us.i, %376
  %400 = phi i64 [ 0, %376 ], [ %406, %.split420.us.i ]
  %401 = icmp sge i64 %400, %381
  %402 = shl i64 %400, 4
  %.tr392.i = trunc i64 %400 to i32
  %403 = shl i32 %.tr392.i, 4
  %404 = sext i32 %403 to i64
  %405 = add nsw i64 %319, %404
  %brmerge.i = select i1 %401, i1 true, i1 %384
  br i1 %brmerge.i, label %.split420.us.i, label %.preheader.split.1.i

.split420.us.i:                                   ; preds = %495, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %406 = add i64 %400, 1
  %exitcond431.not.i = icmp eq i64 %406, 8
  br i1 %exitcond431.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %407 = trunc i64 %402 to i32
  %408 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !19
  %410 = getelementptr inbounds float, ptr %9, i64 %405
  store float %409, ptr %410, align 32, !tbaa !19
  br i1 %385, label %.preheader.split.2.i, label %.split420.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %411 = trunc i64 %402 to i32
  %412 = or disjoint i32 %411, 1
  %413 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %412
  %414 = load float, ptr addrspace(3) %413, align 4, !tbaa !19
  %415 = or disjoint i64 %405, 1
  %416 = getelementptr inbounds float, ptr %9, i64 %415
  store float %414, ptr %416, align 4, !tbaa !19
  br i1 %386, label %.preheader.split.3.i, label %.split420.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %417 = trunc i64 %402 to i32
  %418 = or disjoint i32 %417, 2
  %419 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %418
  %420 = load float, ptr addrspace(3) %419, align 4, !tbaa !19
  %421 = or disjoint i64 %405, 2
  %422 = getelementptr inbounds float, ptr %9, i64 %421
  store float %420, ptr %422, align 8, !tbaa !19
  br i1 %387, label %.preheader.split.4.i, label %.split420.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %423 = trunc i64 %402 to i32
  %424 = or disjoint i32 %423, 3
  %425 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !19
  %427 = or disjoint i64 %405, 3
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 4, !tbaa !19
  br i1 %388, label %.preheader.split.5.i, label %.split420.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %429 = trunc i64 %402 to i32
  %430 = or disjoint i32 %429, 4
  %431 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !19
  %433 = or disjoint i64 %405, 4
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 16, !tbaa !19
  br i1 %389, label %.preheader.split.6.i, label %.split420.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %435 = trunc i64 %402 to i32
  %436 = or disjoint i32 %435, 5
  %437 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !19
  %439 = or disjoint i64 %405, 5
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 4, !tbaa !19
  br i1 %390, label %.preheader.split.7.i, label %.split420.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %441 = trunc i64 %402 to i32
  %442 = or disjoint i32 %441, 6
  %443 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !19
  %445 = or disjoint i64 %405, 6
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 8, !tbaa !19
  br i1 %391, label %.preheader.split.8.i, label %.split420.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %447 = trunc i64 %402 to i32
  %448 = or disjoint i32 %447, 7
  %449 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !19
  %451 = or disjoint i64 %405, 7
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 4, !tbaa !19
  br i1 %392, label %.preheader.split.9.i, label %.split420.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %453 = trunc i64 %402 to i32
  %454 = or disjoint i32 %453, 8
  %455 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !19
  %457 = or disjoint i64 %405, 8
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 32, !tbaa !19
  br i1 %393, label %.preheader.split.10.i, label %.split420.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %459 = trunc i64 %402 to i32
  %460 = or disjoint i32 %459, 9
  %461 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !19
  %463 = or disjoint i64 %405, 9
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 4, !tbaa !19
  br i1 %394, label %.preheader.split.11.i, label %.split420.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %465 = trunc i64 %402 to i32
  %466 = or disjoint i32 %465, 10
  %467 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !19
  %469 = or disjoint i64 %405, 10
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 8, !tbaa !19
  br i1 %395, label %.preheader.split.12.i, label %.split420.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %471 = trunc i64 %402 to i32
  %472 = or disjoint i32 %471, 11
  %473 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !19
  %475 = or disjoint i64 %405, 11
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 4, !tbaa !19
  br i1 %396, label %.preheader.split.13.i, label %.split420.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %477 = trunc i64 %402 to i32
  %478 = or disjoint i32 %477, 12
  %479 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !19
  %481 = or disjoint i64 %405, 12
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 16, !tbaa !19
  br i1 %397, label %.preheader.split.14.i, label %.split420.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %483 = trunc i64 %402 to i32
  %484 = or disjoint i32 %483, 13
  %485 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !19
  %487 = or disjoint i64 %405, 13
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 4, !tbaa !19
  br i1 %398, label %.preheader.split.15.i, label %.split420.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %489 = trunc i64 %402 to i32
  %490 = or disjoint i32 %489, 14
  %491 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !19
  %493 = or disjoint i64 %405, 14
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 8, !tbaa !19
  br i1 %399, label %495, label %.split420.us.i

495:                                              ; preds = %.preheader.split.15.i
  %496 = trunc i64 %402 to i32
  %497 = or disjoint i32 %496, 15
  %498 = getelementptr inbounds float, ptr addrspace(3) %383, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !19
  %500 = or disjoint i64 %405, 15
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 4, !tbaa !19
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
