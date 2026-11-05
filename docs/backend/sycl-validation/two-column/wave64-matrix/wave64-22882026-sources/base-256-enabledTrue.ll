;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882026/tmp/triton-sycl-cache/compile-ns5ve7sc/kernel.cpp"
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
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #5 {
  %.fr472.i = freeze i32 %3
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !14
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 8388608
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
  %33 = icmp ult i64 %32, 256
  call void @llvm.assume(i1 %33)
  %34 = icmp ult i64 %32, 128
  br i1 %34, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %6
  %35 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %36 = inttoptr i32 %35 to ptr addrspace(3)
  %37 = trunc i64 %32 to i32
  %38 = getelementptr inbounds float, ptr addrspace(3) %36, i32 %37
  store float 0.000000e+00, ptr addrspace(3) %38, align 4, !tbaa !23
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %40 = icmp ult i64 %39, 8388607
  call void @llvm.assume(i1 %40)
  %41 = shl nuw nsw i64 %39, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %43 = icmp ult i64 %42, 256
  call void @llvm.assume(i1 %43)
  %44 = icmp eq i64 %42, 0
  br i1 %44, label %.preheader407.i, label %.loopexit408.i

.preheader407.i:                                  ; preds = %._crit_edge.i
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
  %53 = icmp sgt i32 %.fr472.i, 0
  br i1 %53, label %.preheader407.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader407.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %52, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader407.split.preheader.i:                  ; preds = %.preheader407.i
  %54 = icmp sgt i32 %5, 0
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader407.split.preheader.i
  store i16 0, ptr addrspace(3) %52, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.thread.i

.split.us.i:                                      ; preds = %269, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i
  %.sroa.0209.2.31.i = phi i16 [ %.sroa.0207.0.copyload.31.i, %269 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i ]
  %55 = getelementptr i8, ptr addrspace(3) %51, i32 574
  store i16 %.sroa.0209.2.31.i, ptr addrspace(3) %55, align 2, !tbaa.struct !27
  %56 = icmp ugt i32 %.fr472.i, 1
  %57 = add nuw nsw i64 %41, 32
  br i1 %56, label %.preheader407.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %51, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader407.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %.split.us.i
  %58 = phi i64 [ %66, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i ], [ 0, %.split.us.i ]
  %59 = icmp slt i64 %58, %49
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i

60:                                               ; preds = %.preheader407.split.1.i
  %61 = add nuw nsw i64 %57, %58
  %62 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %61
  %.sroa.0207.0.copyload.1.i = load i16, ptr %62, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %60, %.preheader407.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %60 ], [ 0, %.preheader407.split.1.i ]
  %63 = trunc i64 %58 to i32
  %64 = add i32 %63, 32
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %64
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %65, align 2, !tbaa.struct !27
  %66 = add nuw nsw i64 %58, 1
  %exitcond.1.not.i = icmp eq i64 %66, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader407.split.1.i, !llvm.loop !30

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %67 = icmp sgt i32 %.fr472.i, 2
  %68 = add nuw nsw i64 %41, 64
  br i1 %67, label %.preheader407.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %51, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader407.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %.split.us.1.i
  %69 = phi i64 [ %77, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i ], [ 0, %.split.us.1.i ]
  %70 = icmp slt i64 %69, %49
  br i1 %70, label %71, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i

71:                                               ; preds = %.preheader407.split.2.i
  %72 = add nuw nsw i64 %68, %69
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %72
  %.sroa.0207.0.copyload.2.i = load i16, ptr %73, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %71, %.preheader407.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %71 ], [ 0, %.preheader407.split.2.i ]
  %74 = trunc i64 %69 to i32
  %75 = add i32 %74, 64
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %75
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %76, align 2, !tbaa.struct !27
  %77 = add nuw nsw i64 %69, 1
  %exitcond.2.not.i = icmp eq i64 %77, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader407.split.2.i, !llvm.loop !30

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %78 = icmp sgt i32 %.fr472.i, 3
  %79 = add nuw nsw i64 %41, 96
  br i1 %78, label %.preheader407.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %51, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader407.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %.split.us.2.i
  %80 = phi i64 [ %88, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i ], [ 0, %.split.us.2.i ]
  %81 = icmp slt i64 %80, %49
  br i1 %81, label %82, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i

82:                                               ; preds = %.preheader407.split.3.i
  %83 = add nuw nsw i64 %79, %80
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %83
  %.sroa.0207.0.copyload.3.i = load i16, ptr %84, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %82, %.preheader407.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %82 ], [ 0, %.preheader407.split.3.i ]
  %85 = trunc i64 %80 to i32
  %86 = add i32 %85, 96
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %86
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %87, align 2, !tbaa.struct !27
  %88 = add nuw nsw i64 %80, 1
  %exitcond.3.not.i = icmp eq i64 %88, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader407.split.3.i, !llvm.loop !30

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %89 = icmp sgt i32 %.fr472.i, 4
  %90 = add nuw nsw i64 %41, 128
  br i1 %89, label %.preheader407.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %51, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader407.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %.split.us.3.i
  %91 = phi i64 [ %99, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i ], [ 0, %.split.us.3.i ]
  %92 = icmp slt i64 %91, %49
  br i1 %92, label %93, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i

93:                                               ; preds = %.preheader407.split.4.i
  %94 = add nuw nsw i64 %90, %91
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %94
  %.sroa.0207.0.copyload.4.i = load i16, ptr %95, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %93, %.preheader407.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %93 ], [ 0, %.preheader407.split.4.i ]
  %96 = trunc i64 %91 to i32
  %97 = add i32 %96, 128
  %98 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %97
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %98, align 2, !tbaa.struct !27
  %99 = add nuw nsw i64 %91, 1
  %exitcond.4.not.i = icmp eq i64 %99, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader407.split.4.i, !llvm.loop !30

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %100 = icmp sgt i32 %.fr472.i, 5
  %101 = add nuw nsw i64 %41, 160
  br i1 %100, label %.preheader407.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %51, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader407.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %.split.us.4.i
  %102 = phi i64 [ %110, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i ], [ 0, %.split.us.4.i ]
  %103 = icmp slt i64 %102, %49
  br i1 %103, label %104, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i

104:                                              ; preds = %.preheader407.split.5.i
  %105 = add nuw nsw i64 %101, %102
  %106 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %105
  %.sroa.0207.0.copyload.5.i = load i16, ptr %106, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %104, %.preheader407.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %104 ], [ 0, %.preheader407.split.5.i ]
  %107 = trunc i64 %102 to i32
  %108 = add i32 %107, 160
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %108
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %109, align 2, !tbaa.struct !27
  %110 = add nuw nsw i64 %102, 1
  %exitcond.5.not.i = icmp eq i64 %110, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader407.split.5.i, !llvm.loop !30

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %111 = icmp sgt i32 %.fr472.i, 6
  %112 = add nuw nsw i64 %41, 192
  br i1 %111, label %.preheader407.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %51, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i

.preheader407.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %.split.us.5.i
  %113 = phi i64 [ %121, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %.split.us.5.i ]
  %114 = icmp slt i64 %113, %49
  br i1 %114, label %115, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i

115:                                              ; preds = %.preheader407.split.6.i
  %116 = add nuw nsw i64 %112, %113
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %116
  %.sroa.0207.0.copyload.6.i = load i16, ptr %117, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %115, %.preheader407.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %115 ], [ 0, %.preheader407.split.6.i ]
  %118 = trunc i64 %113 to i32
  %119 = add i32 %118, 192
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %119
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %120, align 2, !tbaa.struct !27
  %121 = add nuw nsw i64 %113, 1
  %exitcond.6.not.i = icmp eq i64 %121, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader407.split.6.i, !llvm.loop !30

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %122 = icmp sgt i32 %.fr472.i, 7
  %123 = add nuw nsw i64 %41, 224
  br i1 %122, label %.preheader407.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %51, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.loopexit408.i

.preheader407.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %.split.us.6.i
  %124 = phi i64 [ %132, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i ], [ 0, %.split.us.6.i ]
  %125 = icmp slt i64 %124, %49
  br i1 %125, label %126, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

126:                                              ; preds = %.preheader407.split.7.i
  %127 = add nuw nsw i64 %123, %124
  %128 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %127
  %.sroa.0207.0.copyload.7.i = load i16, ptr %128, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %126, %.preheader407.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %126 ], [ 0, %.preheader407.split.7.i ]
  %129 = trunc i64 %124 to i32
  %130 = add i32 %129, 224
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %130
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %131, align 2, !tbaa.struct !27
  %132 = add nuw nsw i64 %124, 1
  %exitcond.7.not.i = icmp eq i64 %132, 32
  br i1 %exitcond.7.not.i, label %.loopexit408.i, label %.preheader407.split.7.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader407.split.preheader.i
  %133 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %41
  %.sroa.0207.0.copyload.i = load i16, ptr %133, align 32, !tbaa.struct !27
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %52, align 2, !tbaa.struct !27
  %.not521.i = icmp eq i32 %5, 1
  br i1 %.not521.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %134 = getelementptr i8, ptr addrspace(3) %51, i32 514
  store i16 0, ptr addrspace(3) %134, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %135 = add nuw nsw i64 %41, 1
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %135
  %.sroa.0207.0.copyload.1427.i = load i16, ptr %136, align 2, !tbaa.struct !27
  %137 = getelementptr i8, ptr addrspace(3) %51, i32 514
  store i16 %.sroa.0207.0.copyload.1427.i, ptr addrspace(3) %137, align 2, !tbaa.struct !27
  %138 = icmp ugt i32 %5, 2
  br i1 %138, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.thread.i
  %139 = getelementptr i8, ptr addrspace(3) %51, i32 516
  store i16 0, ptr addrspace(3) %139, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1430.i
  %140 = add nuw nsw i64 %41, 2
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %140
  %.sroa.0207.0.copyload.2432.i = load i16, ptr %141, align 4, !tbaa.struct !27
  %142 = getelementptr i8, ptr addrspace(3) %51, i32 516
  store i16 %.sroa.0207.0.copyload.2432.i, ptr addrspace(3) %142, align 2, !tbaa.struct !27
  %.not522.i = icmp eq i32 %5, 3
  br i1 %.not522.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.thread.i
  %143 = getelementptr i8, ptr addrspace(3) %51, i32 518
  store i16 0, ptr addrspace(3) %143, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2435.i
  %144 = add nuw nsw i64 %41, 3
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %144
  %.sroa.0207.0.copyload.3437.i = load i16, ptr %145, align 2, !tbaa.struct !27
  %146 = getelementptr i8, ptr addrspace(3) %51, i32 518
  store i16 %.sroa.0207.0.copyload.3437.i, ptr addrspace(3) %146, align 2, !tbaa.struct !27
  %147 = icmp ugt i32 %5, 4
  br i1 %147, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.thread.i
  %148 = getelementptr i8, ptr addrspace(3) %51, i32 520
  store i16 0, ptr addrspace(3) %148, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3440.i
  %149 = add nuw nsw i64 %41, 4
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %149
  %.sroa.0207.0.copyload.4442.i = load i16, ptr %150, align 8, !tbaa.struct !27
  %151 = getelementptr i8, ptr addrspace(3) %51, i32 520
  store i16 %.sroa.0207.0.copyload.4442.i, ptr addrspace(3) %151, align 2, !tbaa.struct !27
  %.not523.i = icmp eq i32 %5, 5
  br i1 %.not523.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.thread.i
  %152 = getelementptr i8, ptr addrspace(3) %51, i32 522
  store i16 0, ptr addrspace(3) %152, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4445.i
  %153 = add nuw nsw i64 %41, 5
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %153
  %.sroa.0207.0.copyload.5447.i = load i16, ptr %154, align 2, !tbaa.struct !27
  %155 = getelementptr i8, ptr addrspace(3) %51, i32 522
  store i16 %.sroa.0207.0.copyload.5447.i, ptr addrspace(3) %155, align 2, !tbaa.struct !27
  %156 = icmp ugt i32 %5, 6
  br i1 %156, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.thread.i
  %157 = getelementptr i8, ptr addrspace(3) %51, i32 524
  store i16 0, ptr addrspace(3) %157, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5450.i
  %158 = add nuw nsw i64 %41, 6
  %159 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %158
  %.sroa.0207.0.copyload.6452.i = load i16, ptr %159, align 4, !tbaa.struct !27
  %160 = getelementptr i8, ptr addrspace(3) %51, i32 524
  store i16 %.sroa.0207.0.copyload.6452.i, ptr addrspace(3) %160, align 2, !tbaa.struct !27
  %.not524.i = icmp eq i32 %5, 7
  br i1 %.not524.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.thread.i
  %161 = getelementptr i8, ptr addrspace(3) %51, i32 526
  store i16 0, ptr addrspace(3) %161, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6455.i
  %162 = add nuw nsw i64 %41, 7
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %162
  %.sroa.0207.0.copyload.7457.i = load i16, ptr %163, align 2, !tbaa.struct !27
  %164 = getelementptr i8, ptr addrspace(3) %51, i32 526
  store i16 %.sroa.0207.0.copyload.7457.i, ptr addrspace(3) %164, align 2, !tbaa.struct !27
  %165 = icmp ugt i32 %5, 8
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.thread.i
  %166 = getelementptr i8, ptr addrspace(3) %51, i32 528
  store i16 0, ptr addrspace(3) %166, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7460.i
  %167 = add nuw nsw i64 %41, 8
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %167
  %.sroa.0207.0.copyload.8.i = load i16, ptr %168, align 16, !tbaa.struct !27
  %169 = getelementptr i8, ptr addrspace(3) %51, i32 528
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %169, align 2, !tbaa.struct !27
  %.not525.i = icmp eq i32 %5, 9
  br i1 %.not525.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i
  %170 = getelementptr i8, ptr addrspace(3) %51, i32 530
  store i16 0, ptr addrspace(3) %170, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i
  %171 = add nuw nsw i64 %41, 9
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %171
  %.sroa.0207.0.copyload.9.i = load i16, ptr %172, align 2, !tbaa.struct !27
  %173 = getelementptr i8, ptr addrspace(3) %51, i32 530
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %173, align 2, !tbaa.struct !27
  %174 = icmp ugt i32 %5, 10
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i
  %175 = getelementptr i8, ptr addrspace(3) %51, i32 532
  store i16 0, ptr addrspace(3) %175, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i
  %176 = add nuw nsw i64 %41, 10
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %176
  %.sroa.0207.0.copyload.10.i = load i16, ptr %177, align 4, !tbaa.struct !27
  %178 = getelementptr i8, ptr addrspace(3) %51, i32 532
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %178, align 2, !tbaa.struct !27
  %.not526.i = icmp eq i32 %5, 11
  br i1 %.not526.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i
  %179 = getelementptr i8, ptr addrspace(3) %51, i32 534
  store i16 0, ptr addrspace(3) %179, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i
  %180 = add nuw nsw i64 %41, 11
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %180
  %.sroa.0207.0.copyload.11.i = load i16, ptr %181, align 2, !tbaa.struct !27
  %182 = getelementptr i8, ptr addrspace(3) %51, i32 534
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %182, align 2, !tbaa.struct !27
  %183 = icmp ugt i32 %5, 12
  br i1 %183, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i
  %184 = getelementptr i8, ptr addrspace(3) %51, i32 536
  store i16 0, ptr addrspace(3) %184, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i
  %185 = add nuw nsw i64 %41, 12
  %186 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %185
  %.sroa.0207.0.copyload.12.i = load i16, ptr %186, align 8, !tbaa.struct !27
  %187 = getelementptr i8, ptr addrspace(3) %51, i32 536
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %187, align 2, !tbaa.struct !27
  %.not527.i = icmp eq i32 %5, 13
  br i1 %.not527.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i
  %188 = getelementptr i8, ptr addrspace(3) %51, i32 538
  store i16 0, ptr addrspace(3) %188, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i
  %189 = add nuw nsw i64 %41, 13
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %189
  %.sroa.0207.0.copyload.13.i = load i16, ptr %190, align 2, !tbaa.struct !27
  %191 = getelementptr i8, ptr addrspace(3) %51, i32 538
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %191, align 2, !tbaa.struct !27
  %192 = icmp ugt i32 %5, 14
  br i1 %192, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i
  %193 = getelementptr i8, ptr addrspace(3) %51, i32 540
  store i16 0, ptr addrspace(3) %193, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i
  %194 = add nuw nsw i64 %41, 14
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %194
  %.sroa.0207.0.copyload.14.i = load i16, ptr %195, align 4, !tbaa.struct !27
  %196 = getelementptr i8, ptr addrspace(3) %51, i32 540
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %196, align 2, !tbaa.struct !27
  %.not528.i = icmp eq i32 %5, 15
  br i1 %.not528.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i
  %197 = getelementptr i8, ptr addrspace(3) %51, i32 542
  store i16 0, ptr addrspace(3) %197, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i
  %198 = add nuw nsw i64 %41, 15
  %199 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %198
  %.sroa.0207.0.copyload.15.i = load i16, ptr %199, align 2, !tbaa.struct !27
  %200 = getelementptr i8, ptr addrspace(3) %51, i32 542
  store i16 %.sroa.0207.0.copyload.15.i, ptr addrspace(3) %200, align 2, !tbaa.struct !27
  %201 = icmp ugt i32 %5, 16
  br i1 %201, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i
  %202 = getelementptr i8, ptr addrspace(3) %51, i32 544
  store i16 0, ptr addrspace(3) %202, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i
  %203 = add nuw nsw i64 %41, 16
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %203
  %.sroa.0207.0.copyload.16.i = load i16, ptr %204, align 32, !tbaa.struct !27
  %205 = getelementptr i8, ptr addrspace(3) %51, i32 544
  store i16 %.sroa.0207.0.copyload.16.i, ptr addrspace(3) %205, align 2, !tbaa.struct !27
  %.not529.i = icmp eq i32 %5, 17
  br i1 %.not529.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i
  %206 = getelementptr i8, ptr addrspace(3) %51, i32 546
  store i16 0, ptr addrspace(3) %206, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i
  %207 = add nuw nsw i64 %41, 17
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %207
  %.sroa.0207.0.copyload.17.i = load i16, ptr %208, align 2, !tbaa.struct !27
  %209 = getelementptr i8, ptr addrspace(3) %51, i32 546
  store i16 %.sroa.0207.0.copyload.17.i, ptr addrspace(3) %209, align 2, !tbaa.struct !27
  %210 = icmp ugt i32 %5, 18
  br i1 %210, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i
  %211 = getelementptr i8, ptr addrspace(3) %51, i32 548
  store i16 0, ptr addrspace(3) %211, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i
  %212 = add nuw nsw i64 %41, 18
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %212
  %.sroa.0207.0.copyload.18.i = load i16, ptr %213, align 4, !tbaa.struct !27
  %214 = getelementptr i8, ptr addrspace(3) %51, i32 548
  store i16 %.sroa.0207.0.copyload.18.i, ptr addrspace(3) %214, align 2, !tbaa.struct !27
  %.not530.i = icmp eq i32 %5, 19
  br i1 %.not530.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i
  %215 = getelementptr i8, ptr addrspace(3) %51, i32 550
  store i16 0, ptr addrspace(3) %215, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i
  %216 = add nuw nsw i64 %41, 19
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %216
  %.sroa.0207.0.copyload.19.i = load i16, ptr %217, align 2, !tbaa.struct !27
  %218 = getelementptr i8, ptr addrspace(3) %51, i32 550
  store i16 %.sroa.0207.0.copyload.19.i, ptr addrspace(3) %218, align 2, !tbaa.struct !27
  %219 = icmp ugt i32 %5, 20
  br i1 %219, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i
  %220 = getelementptr i8, ptr addrspace(3) %51, i32 552
  store i16 0, ptr addrspace(3) %220, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i
  %221 = add nuw nsw i64 %41, 20
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %221
  %.sroa.0207.0.copyload.20.i = load i16, ptr %222, align 8, !tbaa.struct !27
  %223 = getelementptr i8, ptr addrspace(3) %51, i32 552
  store i16 %.sroa.0207.0.copyload.20.i, ptr addrspace(3) %223, align 2, !tbaa.struct !27
  %.not531.i = icmp eq i32 %5, 21
  br i1 %.not531.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i
  %224 = getelementptr i8, ptr addrspace(3) %51, i32 554
  store i16 0, ptr addrspace(3) %224, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i
  %225 = add nuw nsw i64 %41, 21
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %225
  %.sroa.0207.0.copyload.21.i = load i16, ptr %226, align 2, !tbaa.struct !27
  %227 = getelementptr i8, ptr addrspace(3) %51, i32 554
  store i16 %.sroa.0207.0.copyload.21.i, ptr addrspace(3) %227, align 2, !tbaa.struct !27
  %228 = icmp ugt i32 %5, 22
  br i1 %228, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i
  %229 = getelementptr i8, ptr addrspace(3) %51, i32 556
  store i16 0, ptr addrspace(3) %229, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i
  %230 = add nuw nsw i64 %41, 22
  %231 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %230
  %.sroa.0207.0.copyload.22.i = load i16, ptr %231, align 4, !tbaa.struct !27
  %232 = getelementptr i8, ptr addrspace(3) %51, i32 556
  store i16 %.sroa.0207.0.copyload.22.i, ptr addrspace(3) %232, align 2, !tbaa.struct !27
  %.not532.i = icmp eq i32 %5, 23
  br i1 %.not532.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i
  %233 = getelementptr i8, ptr addrspace(3) %51, i32 558
  store i16 0, ptr addrspace(3) %233, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i
  %234 = add nuw nsw i64 %41, 23
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %234
  %.sroa.0207.0.copyload.23.i = load i16, ptr %235, align 2, !tbaa.struct !27
  %236 = getelementptr i8, ptr addrspace(3) %51, i32 558
  store i16 %.sroa.0207.0.copyload.23.i, ptr addrspace(3) %236, align 2, !tbaa.struct !27
  %237 = icmp ugt i32 %5, 24
  br i1 %237, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i
  %238 = getelementptr i8, ptr addrspace(3) %51, i32 560
  store i16 0, ptr addrspace(3) %238, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i
  %239 = add nuw nsw i64 %41, 24
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %239
  %.sroa.0207.0.copyload.24.i = load i16, ptr %240, align 16, !tbaa.struct !27
  %241 = getelementptr i8, ptr addrspace(3) %51, i32 560
  store i16 %.sroa.0207.0.copyload.24.i, ptr addrspace(3) %241, align 2, !tbaa.struct !27
  %.not533.i = icmp eq i32 %5, 25
  br i1 %.not533.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i
  %242 = getelementptr i8, ptr addrspace(3) %51, i32 562
  store i16 0, ptr addrspace(3) %242, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i
  %243 = add nuw nsw i64 %41, 25
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %243
  %.sroa.0207.0.copyload.25.i = load i16, ptr %244, align 2, !tbaa.struct !27
  %245 = getelementptr i8, ptr addrspace(3) %51, i32 562
  store i16 %.sroa.0207.0.copyload.25.i, ptr addrspace(3) %245, align 2, !tbaa.struct !27
  %246 = icmp ugt i32 %5, 26
  br i1 %246, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i
  %247 = getelementptr i8, ptr addrspace(3) %51, i32 564
  store i16 0, ptr addrspace(3) %247, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i
  %248 = add nuw nsw i64 %41, 26
  %249 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %248
  %.sroa.0207.0.copyload.26.i = load i16, ptr %249, align 4, !tbaa.struct !27
  %250 = getelementptr i8, ptr addrspace(3) %51, i32 564
  store i16 %.sroa.0207.0.copyload.26.i, ptr addrspace(3) %250, align 2, !tbaa.struct !27
  %.not534.i = icmp eq i32 %5, 27
  br i1 %.not534.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i
  %251 = getelementptr i8, ptr addrspace(3) %51, i32 566
  store i16 0, ptr addrspace(3) %251, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i
  %252 = add nuw nsw i64 %41, 27
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %252
  %.sroa.0207.0.copyload.27.i = load i16, ptr %253, align 2, !tbaa.struct !27
  %254 = getelementptr i8, ptr addrspace(3) %51, i32 566
  store i16 %.sroa.0207.0.copyload.27.i, ptr addrspace(3) %254, align 2, !tbaa.struct !27
  %255 = icmp ugt i32 %5, 28
  br i1 %255, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i
  %256 = getelementptr i8, ptr addrspace(3) %51, i32 568
  store i16 0, ptr addrspace(3) %256, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i
  %257 = add nuw nsw i64 %41, 28
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %257
  %.sroa.0207.0.copyload.28.i = load i16, ptr %258, align 8, !tbaa.struct !27
  %259 = getelementptr i8, ptr addrspace(3) %51, i32 568
  store i16 %.sroa.0207.0.copyload.28.i, ptr addrspace(3) %259, align 2, !tbaa.struct !27
  %.not535.i = icmp eq i32 %5, 29
  br i1 %.not535.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i
  %260 = getelementptr i8, ptr addrspace(3) %51, i32 570
  store i16 0, ptr addrspace(3) %260, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i
  %261 = add nuw nsw i64 %41, 29
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %261
  %.sroa.0207.0.copyload.29.i = load i16, ptr %262, align 2, !tbaa.struct !27
  %263 = getelementptr i8, ptr addrspace(3) %51, i32 570
  store i16 %.sroa.0207.0.copyload.29.i, ptr addrspace(3) %263, align 2, !tbaa.struct !27
  %264 = icmp ugt i32 %5, 30
  br i1 %264, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i
  %265 = getelementptr i8, ptr addrspace(3) %51, i32 572
  store i16 0, ptr addrspace(3) %265, align 2, !tbaa.struct !27
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i
  %266 = add nuw nsw i64 %41, 30
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %266
  %.sroa.0207.0.copyload.30.i = load i16, ptr %267, align 4, !tbaa.struct !27
  %268 = getelementptr i8, ptr addrspace(3) %51, i32 572
  store i16 %.sroa.0207.0.copyload.30.i, ptr addrspace(3) %268, align 2, !tbaa.struct !27
  %.not536.i = icmp eq i32 %5, 31
  br i1 %.not536.i, label %.split.us.i, label %269

269:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i
  %270 = add nuw nsw i64 %41, 31
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %270
  %.sroa.0207.0.copyload.31.i = load i16, ptr %271, align 2, !tbaa.struct !27
  br label %.split.us.i

.loopexit408.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %272 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %273 = icmp ult i64 %272, 256
  call void @llvm.assume(i1 %273)
  %274 = icmp eq i64 %272, 0
  br i1 %274, label %275, label %.loopexit.i

275:                                              ; preds = %.loopexit408.i
  %.tr390.i = trunc i64 %39 to i32
  %276 = shl nuw i32 %.tr390.i, 9
  %277 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %278 = icmp eq i64 %277, 0
  call void @llvm.assume(i1 %278)
  %279 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %280 = icmp eq i64 %279, 0
  call void @llvm.assume(i1 %280)
  %281 = sext i32 %5 to i64
  %282 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %283 = inttoptr i32 %282 to ptr addrspace(3)
  %284 = getelementptr inbounds i8, ptr addrspace(3) %283, i32 1024
  %285 = sext i32 %276 to i64
  %286 = icmp sgt i32 %4, 0
  %287 = icmp ugt i32 %4, 1
  %288 = icmp ugt i32 %4, 2
  %289 = icmp ugt i32 %4, 3
  %290 = icmp ugt i32 %4, 4
  %291 = icmp ugt i32 %4, 5
  %292 = icmp ugt i32 %4, 6
  %293 = icmp ugt i32 %4, 7
  %294 = icmp ugt i32 %4, 8
  %295 = icmp ugt i32 %4, 9
  %296 = icmp ugt i32 %4, 10
  %297 = icmp ugt i32 %4, 11
  %298 = icmp ugt i32 %4, 12
  %299 = icmp ugt i32 %4, 13
  %300 = icmp ugt i32 %4, 14
  %301 = icmp ugt i32 %4, 15
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split414.us.i, %275
  %302 = phi i64 [ 0, %275 ], [ %312, %.split414.us.i ]
  %303 = icmp slt i64 %302, %281
  %304 = shl i64 %302, 4
  %.tr400.i = trunc i64 %302 to i32
  %305 = shl i32 %.tr400.i, 4
  %306 = sext i32 %305 to i64
  %307 = add nsw i64 %306, %285
  %.fr415.i = freeze i1 %303
  br i1 %.fr415.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr.i = trunc i64 %302 to i32
  %308 = shl i32 %.tr.i, 5
  %309 = add i32 %308, 1024
  %scevgep461.i = getelementptr i8, ptr addrspace(3) %283, i32 %309
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep461.i, i8 0, i32 32, i1 false)
  br label %.split414.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %286, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %310 = trunc i64 %304 to i32
  %311 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %310
  store i16 0, ptr addrspace(3) %311, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

.split414.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i
  %312 = add nuw nsw i64 %302, 1
  %exitcond.not.i = icmp eq i64 %312, 32
  br i1 %exitcond.not.i, label %.loopexit.i, label %.preheader406.i, !llvm.loop !34

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i: ; preds = %.preheader406.split.preheader.i
  %313 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %307
  %.sroa.0196.0.copyload.i = load i16, ptr %313, align 32, !tbaa.struct !27
  %314 = trunc i64 %304 to i32
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %314
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %315, align 2, !tbaa.struct !27
  br i1 %287, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i
  %316 = trunc i64 %304 to i32
  %317 = or disjoint i32 %316, 1
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %317
  store i16 0, ptr addrspace(3) %318, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i
  %319 = or disjoint i64 %307, 1
  %320 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %319
  %.sroa.0196.0.copyload.1.i = load i16, ptr %320, align 2, !tbaa.struct !27
  %321 = trunc i64 %304 to i32
  %322 = or disjoint i32 %321, 1
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %322
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %323, align 2, !tbaa.struct !27
  br i1 %288, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i
  %324 = trunc i64 %304 to i32
  %325 = or disjoint i32 %324, 2
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %325
  store i16 0, ptr addrspace(3) %326, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i
  %327 = or disjoint i64 %307, 2
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %327
  %.sroa.0196.0.copyload.2.i = load i16, ptr %328, align 4, !tbaa.struct !27
  %329 = trunc i64 %304 to i32
  %330 = or disjoint i32 %329, 2
  %331 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %330
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %331, align 2, !tbaa.struct !27
  br i1 %289, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i
  %332 = trunc i64 %304 to i32
  %333 = or disjoint i32 %332, 3
  %334 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %333
  store i16 0, ptr addrspace(3) %334, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i
  %335 = or disjoint i64 %307, 3
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %335
  %.sroa.0196.0.copyload.3.i = load i16, ptr %336, align 2, !tbaa.struct !27
  %337 = trunc i64 %304 to i32
  %338 = or disjoint i32 %337, 3
  %339 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %338
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %339, align 2, !tbaa.struct !27
  br i1 %290, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i
  %340 = trunc i64 %304 to i32
  %341 = or disjoint i32 %340, 4
  %342 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %341
  store i16 0, ptr addrspace(3) %342, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i
  %343 = or disjoint i64 %307, 4
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %343
  %.sroa.0196.0.copyload.4.i = load i16, ptr %344, align 8, !tbaa.struct !27
  %345 = trunc i64 %304 to i32
  %346 = or disjoint i32 %345, 4
  %347 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %346
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %347, align 2, !tbaa.struct !27
  br i1 %291, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i
  %348 = trunc i64 %304 to i32
  %349 = or disjoint i32 %348, 5
  %350 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %349
  store i16 0, ptr addrspace(3) %350, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i
  %351 = or disjoint i64 %307, 5
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %351
  %.sroa.0196.0.copyload.5.i = load i16, ptr %352, align 2, !tbaa.struct !27
  %353 = trunc i64 %304 to i32
  %354 = or disjoint i32 %353, 5
  %355 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %354
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %355, align 2, !tbaa.struct !27
  br i1 %292, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i
  %356 = trunc i64 %304 to i32
  %357 = or disjoint i32 %356, 6
  %358 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %357
  store i16 0, ptr addrspace(3) %358, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i
  %359 = or disjoint i64 %307, 6
  %360 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %359
  %.sroa.0196.0.copyload.6.i = load i16, ptr %360, align 4, !tbaa.struct !27
  %361 = trunc i64 %304 to i32
  %362 = or disjoint i32 %361, 6
  %363 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %362
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %363, align 2, !tbaa.struct !27
  br i1 %293, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i
  %364 = trunc i64 %304 to i32
  %365 = or disjoint i32 %364, 7
  %366 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %365
  store i16 0, ptr addrspace(3) %366, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i
  %367 = or disjoint i64 %307, 7
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %367
  %.sroa.0196.0.copyload.7.i = load i16, ptr %368, align 2, !tbaa.struct !27
  %369 = trunc i64 %304 to i32
  %370 = or disjoint i32 %369, 7
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %370
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %371, align 2, !tbaa.struct !27
  br i1 %294, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i
  %372 = trunc i64 %304 to i32
  %373 = or disjoint i32 %372, 8
  %374 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %373
  store i16 0, ptr addrspace(3) %374, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i
  %375 = or disjoint i64 %307, 8
  %376 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %375
  %.sroa.0196.0.copyload.8.i = load i16, ptr %376, align 16, !tbaa.struct !27
  %377 = trunc i64 %304 to i32
  %378 = or disjoint i32 %377, 8
  %379 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %378
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %379, align 2, !tbaa.struct !27
  br i1 %295, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i
  %380 = trunc i64 %304 to i32
  %381 = or disjoint i32 %380, 9
  %382 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %381
  store i16 0, ptr addrspace(3) %382, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i
  %383 = or disjoint i64 %307, 9
  %384 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %383
  %.sroa.0196.0.copyload.9.i = load i16, ptr %384, align 2, !tbaa.struct !27
  %385 = trunc i64 %304 to i32
  %386 = or disjoint i32 %385, 9
  %387 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %386
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %387, align 2, !tbaa.struct !27
  br i1 %296, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i
  %388 = trunc i64 %304 to i32
  %389 = or disjoint i32 %388, 10
  %390 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %389
  store i16 0, ptr addrspace(3) %390, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i
  %391 = or disjoint i64 %307, 10
  %392 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %391
  %.sroa.0196.0.copyload.10.i = load i16, ptr %392, align 4, !tbaa.struct !27
  %393 = trunc i64 %304 to i32
  %394 = or disjoint i32 %393, 10
  %395 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %394
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %395, align 2, !tbaa.struct !27
  br i1 %297, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i
  %396 = trunc i64 %304 to i32
  %397 = or disjoint i32 %396, 11
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %397
  store i16 0, ptr addrspace(3) %398, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i
  %399 = or disjoint i64 %307, 11
  %400 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %399
  %.sroa.0196.0.copyload.11.i = load i16, ptr %400, align 2, !tbaa.struct !27
  %401 = trunc i64 %304 to i32
  %402 = or disjoint i32 %401, 11
  %403 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %402
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %403, align 2, !tbaa.struct !27
  br i1 %298, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i
  %404 = trunc i64 %304 to i32
  %405 = or disjoint i32 %404, 12
  %406 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %405
  store i16 0, ptr addrspace(3) %406, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i
  %407 = or disjoint i64 %307, 12
  %408 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %407
  %.sroa.0196.0.copyload.12.i = load i16, ptr %408, align 8, !tbaa.struct !27
  %409 = trunc i64 %304 to i32
  %410 = or disjoint i32 %409, 12
  %411 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %410
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %411, align 2, !tbaa.struct !27
  br i1 %299, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i
  %412 = trunc i64 %304 to i32
  %413 = or disjoint i32 %412, 13
  %414 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %413
  store i16 0, ptr addrspace(3) %414, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i
  %415 = or disjoint i64 %307, 13
  %416 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %415
  %.sroa.0196.0.copyload.13.i = load i16, ptr %416, align 2, !tbaa.struct !27
  %417 = trunc i64 %304 to i32
  %418 = or disjoint i32 %417, 13
  %419 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %418
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %419, align 2, !tbaa.struct !27
  br i1 %300, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i
  %420 = trunc i64 %304 to i32
  %421 = or disjoint i32 %420, 14
  %422 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %421
  store i16 0, ptr addrspace(3) %422, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i
  %423 = or disjoint i64 %307, 14
  %424 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %423
  %.sroa.0196.0.copyload.14.i = load i16, ptr %424, align 4, !tbaa.struct !27
  %425 = trunc i64 %304 to i32
  %426 = or disjoint i32 %425, 14
  %427 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %426
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %427, align 2, !tbaa.struct !27
  br i1 %301, label %428, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

428:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i
  %429 = or disjoint i64 %307, 15
  %430 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %429
  %.sroa.0196.0.copyload.15.i = load i16, ptr %430, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i: ; preds = %428, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %428 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i ]
  %431 = trunc i64 %304 to i32
  %432 = or disjoint i32 %431, 15
  %433 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %284, i32 %432
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %433, align 2, !tbaa.struct !27
  br label %.split414.us.i

.loopexit.i:                                      ; preds = %.split414.us.i, %.loopexit408.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %434 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %435 = icmp eq i64 %434, 0
  call void @llvm.assume(i1 %435)
  %436 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %437 = icmp eq i64 %436, 0
  call void @llvm.assume(i1 %437)
  %438 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %439 = icmp ult i64 %438, 256
  call void @llvm.assume(i1 %439)
  %440 = icmp ult i64 %438, 128
  br i1 %440, label %.lr.ph417.i, label %._crit_edge418.i

.lr.ph417.i:                                      ; preds = %.loopexit.i
  %441 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %442 = inttoptr i32 %441 to ptr addrspace(3)
  %443 = getelementptr inbounds i8, ptr addrspace(3) %442, i32 512
  %444 = getelementptr inbounds i8, ptr addrspace(3) %442, i32 1024
  %445 = and i64 %438, 15
  %446 = trunc i64 %438 to i32
  %447 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %446
  %448 = load float, ptr addrspace(3) %447, align 4, !tbaa !23
  %449 = shl nuw nsw i64 %438, 1
  %450 = and i64 %449, 224
  br label %455

._crit_edge418.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.loopexit.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %451 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %452 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %453 = icmp ult i64 %452, 256
  call void @llvm.assume(i1 %453)
  %454 = icmp eq i64 %452, 0
  br i1 %454, label %508, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %506, ptr addrspace(3) %447, align 4, !tbaa !23
  br label %._crit_edge418.i

455:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph417.i
  %456 = phi i64 [ 0, %.lr.ph417.i ], [ %507, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %457 = phi float [ %448, %.lr.ph417.i ], [ %506, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %458 = add nuw nsw i64 %456, %450
  %459 = trunc i64 %458 to i32
  %460 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %443, i32 %459
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %460, align 2, !tbaa.struct !27
  %461 = shl nuw nsw i64 %456, 4
  %462 = or disjoint i64 %461, %445
  %463 = trunc i64 %462 to i32
  %464 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %444, i32 %463
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %464, align 2, !tbaa.struct !27
  %465 = zext i16 %.sroa.0179.0.copyload.i to i32
  %466 = lshr i32 %465, 10
  %467 = and i32 %466, 31
  %468 = and i32 %465, 1023
  switch i32 %467, label %474 [
    i32 31, label %469
    i32 0, label %476
  ]

469:                                              ; preds = %455
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %470 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %468, 0
  %471 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %472 = or disjoint i32 %471, %470
  %473 = bitcast i32 %472 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

474:                                              ; preds = %455
  %475 = or disjoint i32 %468, 1024
  br label %476

476:                                              ; preds = %474, %455
  %477 = phi i32 [ %475, %474 ], [ %468, %455 ]
  %478 = uitofp i32 %477 to float
  %.not.i = icmp eq i32 %467, 0
  %479 = add nsw i32 %467, -25
  %480 = select i1 %.not.i, i32 -24, i32 %479
  %481 = call float @__ocml_ldexp_f32(float noundef %478, i32 noundef %480) #6
  %482 = fneg contract float %481
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %483 = select contract i1 %.not393394.i, float %482, float %481
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i: ; preds = %476, %469
  %484 = phi float [ %473, %469 ], [ %483, %476 ]
  %485 = zext i16 %.sroa.0170.0.copyload.i to i32
  %486 = lshr i32 %485, 10
  %487 = and i32 %486, 31
  %488 = and i32 %485, 1023
  switch i32 %487, label %494 [
    i32 31, label %489
    i32 0, label %496
  ]

489:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %490 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %488, 0
  %491 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %492 = or disjoint i32 %491, %490
  %493 = bitcast i32 %492 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

494:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %495 = or disjoint i32 %488, 1024
  br label %496

496:                                              ; preds = %494, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %497 = phi i32 [ %495, %494 ], [ %488, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i ]
  %498 = uitofp i32 %497 to float
  %.not395.i = icmp eq i32 %487, 0
  %499 = add nsw i32 %487, -25
  %500 = select i1 %.not395.i, i32 -24, i32 %499
  %501 = call float @__ocml_ldexp_f32(float noundef %498, i32 noundef %500) #6
  %502 = fneg contract float %501
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %503 = select contract i1 %.not396397.i, float %502, float %501
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %496, %489
  %504 = phi float [ %493, %489 ], [ %503, %496 ]
  %505 = fmul contract float %484, %504
  %506 = fadd contract float %457, %505
  %507 = add nuw nsw i64 %456, 1
  %exitcond469.not.i = icmp eq i64 %507, 32
  br i1 %exitcond469.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, label %455, !llvm.loop !35

508:                                              ; preds = %._crit_edge418.i
  %509 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %510 = icmp eq i64 %509, 0
  call void @llvm.assume(i1 %510)
  %511 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %512 = icmp eq i64 %511, 0
  call void @llvm.assume(i1 %512)
  %513 = sext i32 %.fr472.i to i64
  %514 = call i32 @llvm.amdgcn.groupstaticsize()
  %515 = inttoptr i32 %514 to ptr addrspace(3)
  %516 = icmp slt i32 %4, 1
  %517 = icmp ugt i32 %4, 1
  %518 = icmp ugt i32 %4, 2
  %519 = icmp ugt i32 %4, 3
  %520 = icmp ugt i32 %4, 4
  %521 = icmp ugt i32 %4, 5
  %522 = icmp ugt i32 %4, 6
  %523 = icmp ugt i32 %4, 7
  %524 = icmp ugt i32 %4, 8
  %525 = icmp ugt i32 %4, 9
  %526 = icmp ugt i32 %4, 10
  %527 = icmp ugt i32 %4, 11
  %528 = icmp ugt i32 %4, 12
  %529 = icmp ugt i32 %4, 13
  %530 = icmp ugt i32 %4, 14
  %531 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split420.us.i, %508
  %532 = phi i64 [ 0, %508 ], [ %538, %.split420.us.i ]
  %533 = icmp sge i64 %532, %513
  %534 = shl i64 %532, 4
  %.tr392.i = trunc i64 %532 to i32
  %535 = shl i32 %.tr392.i, 4
  %536 = sext i32 %535 to i64
  %537 = add nsw i64 %451, %536
  %brmerge.i = select i1 %533, i1 true, i1 %516
  br i1 %brmerge.i, label %.split420.us.i, label %.preheader.split.1.i

.split420.us.i:                                   ; preds = %627, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %538 = add i64 %532, 1
  %exitcond471.not.i = icmp eq i64 %538, 8
  br i1 %exitcond471.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %539 = trunc i64 %534 to i32
  %540 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !23
  %542 = getelementptr inbounds float, ptr %9, i64 %537
  store float %541, ptr %542, align 32, !tbaa !23
  br i1 %517, label %.preheader.split.2.i, label %.split420.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %543 = trunc i64 %534 to i32
  %544 = or disjoint i32 %543, 1
  %545 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %544
  %546 = load float, ptr addrspace(3) %545, align 4, !tbaa !23
  %547 = or disjoint i64 %537, 1
  %548 = getelementptr inbounds float, ptr %9, i64 %547
  store float %546, ptr %548, align 4, !tbaa !23
  br i1 %518, label %.preheader.split.3.i, label %.split420.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %549 = trunc i64 %534 to i32
  %550 = or disjoint i32 %549, 2
  %551 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %550
  %552 = load float, ptr addrspace(3) %551, align 4, !tbaa !23
  %553 = or disjoint i64 %537, 2
  %554 = getelementptr inbounds float, ptr %9, i64 %553
  store float %552, ptr %554, align 8, !tbaa !23
  br i1 %519, label %.preheader.split.4.i, label %.split420.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %555 = trunc i64 %534 to i32
  %556 = or disjoint i32 %555, 3
  %557 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %556
  %558 = load float, ptr addrspace(3) %557, align 4, !tbaa !23
  %559 = or disjoint i64 %537, 3
  %560 = getelementptr inbounds float, ptr %9, i64 %559
  store float %558, ptr %560, align 4, !tbaa !23
  br i1 %520, label %.preheader.split.5.i, label %.split420.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %561 = trunc i64 %534 to i32
  %562 = or disjoint i32 %561, 4
  %563 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %562
  %564 = load float, ptr addrspace(3) %563, align 4, !tbaa !23
  %565 = or disjoint i64 %537, 4
  %566 = getelementptr inbounds float, ptr %9, i64 %565
  store float %564, ptr %566, align 16, !tbaa !23
  br i1 %521, label %.preheader.split.6.i, label %.split420.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %567 = trunc i64 %534 to i32
  %568 = or disjoint i32 %567, 5
  %569 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %568
  %570 = load float, ptr addrspace(3) %569, align 4, !tbaa !23
  %571 = or disjoint i64 %537, 5
  %572 = getelementptr inbounds float, ptr %9, i64 %571
  store float %570, ptr %572, align 4, !tbaa !23
  br i1 %522, label %.preheader.split.7.i, label %.split420.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %573 = trunc i64 %534 to i32
  %574 = or disjoint i32 %573, 6
  %575 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %574
  %576 = load float, ptr addrspace(3) %575, align 4, !tbaa !23
  %577 = or disjoint i64 %537, 6
  %578 = getelementptr inbounds float, ptr %9, i64 %577
  store float %576, ptr %578, align 8, !tbaa !23
  br i1 %523, label %.preheader.split.8.i, label %.split420.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %579 = trunc i64 %534 to i32
  %580 = or disjoint i32 %579, 7
  %581 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %580
  %582 = load float, ptr addrspace(3) %581, align 4, !tbaa !23
  %583 = or disjoint i64 %537, 7
  %584 = getelementptr inbounds float, ptr %9, i64 %583
  store float %582, ptr %584, align 4, !tbaa !23
  br i1 %524, label %.preheader.split.9.i, label %.split420.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %585 = trunc i64 %534 to i32
  %586 = or disjoint i32 %585, 8
  %587 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %586
  %588 = load float, ptr addrspace(3) %587, align 4, !tbaa !23
  %589 = or disjoint i64 %537, 8
  %590 = getelementptr inbounds float, ptr %9, i64 %589
  store float %588, ptr %590, align 32, !tbaa !23
  br i1 %525, label %.preheader.split.10.i, label %.split420.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %591 = trunc i64 %534 to i32
  %592 = or disjoint i32 %591, 9
  %593 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %592
  %594 = load float, ptr addrspace(3) %593, align 4, !tbaa !23
  %595 = or disjoint i64 %537, 9
  %596 = getelementptr inbounds float, ptr %9, i64 %595
  store float %594, ptr %596, align 4, !tbaa !23
  br i1 %526, label %.preheader.split.11.i, label %.split420.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %597 = trunc i64 %534 to i32
  %598 = or disjoint i32 %597, 10
  %599 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %598
  %600 = load float, ptr addrspace(3) %599, align 4, !tbaa !23
  %601 = or disjoint i64 %537, 10
  %602 = getelementptr inbounds float, ptr %9, i64 %601
  store float %600, ptr %602, align 8, !tbaa !23
  br i1 %527, label %.preheader.split.12.i, label %.split420.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %603 = trunc i64 %534 to i32
  %604 = or disjoint i32 %603, 11
  %605 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %604
  %606 = load float, ptr addrspace(3) %605, align 4, !tbaa !23
  %607 = or disjoint i64 %537, 11
  %608 = getelementptr inbounds float, ptr %9, i64 %607
  store float %606, ptr %608, align 4, !tbaa !23
  br i1 %528, label %.preheader.split.13.i, label %.split420.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %609 = trunc i64 %534 to i32
  %610 = or disjoint i32 %609, 12
  %611 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %610
  %612 = load float, ptr addrspace(3) %611, align 4, !tbaa !23
  %613 = or disjoint i64 %537, 12
  %614 = getelementptr inbounds float, ptr %9, i64 %613
  store float %612, ptr %614, align 16, !tbaa !23
  br i1 %529, label %.preheader.split.14.i, label %.split420.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %615 = trunc i64 %534 to i32
  %616 = or disjoint i32 %615, 13
  %617 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %616
  %618 = load float, ptr addrspace(3) %617, align 4, !tbaa !23
  %619 = or disjoint i64 %537, 13
  %620 = getelementptr inbounds float, ptr %9, i64 %619
  store float %618, ptr %620, align 4, !tbaa !23
  br i1 %530, label %.preheader.split.15.i, label %.split420.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %621 = trunc i64 %534 to i32
  %622 = or disjoint i32 %621, 14
  %623 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %622
  %624 = load float, ptr addrspace(3) %623, align 4, !tbaa !23
  %625 = or disjoint i64 %537, 14
  %626 = getelementptr inbounds float, ptr %9, i64 %625
  store float %624, ptr %626, align 8, !tbaa !23
  br i1 %531, label %627, label %.split420.us.i

627:                                              ; preds = %.preheader.split.15.i
  %628 = trunc i64 %534 to i32
  %629 = or disjoint i32 %628, 15
  %630 = getelementptr inbounds float, ptr addrspace(3) %515, i32 %629
  %631 = load float, ptr addrspace(3) %630, align 4, !tbaa !23
  %632 = or disjoint i64 %537, 15
  %633 = getelementptr inbounds float, ptr %9, i64 %632
  store float %631, ptr %633, align 4, !tbaa !23
  br label %.split420.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge418.i, %.split420.us.i
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
!10 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
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
!27 = !{i64 0, i64 2, !28}
!28 = !{!29, !29, i64 0}
!29 = !{!"short", !25, i64 0}
!30 = distinct !{!30, !31, !32, !33}
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!"llvm.loop.vectorize.width", i32 1}
!33 = !{!"llvm.loop.interleave.count", i32 1}
!34 = distinct !{!34, !31, !32, !33}
!35 = distinct !{!35, !31}
!36 = distinct !{!36, !31}
;----------------- End AdaptiveCpp IR dump ---------------
