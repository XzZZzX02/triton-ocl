;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-jjnzddtl/kernel.cpp"
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
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 8388607
  call void @llvm.assume(i1 %29)
  %30 = shl nuw nsw i64 %28, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 256
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %._crit_edge.i

34:                                               ; preds = %6
  %35 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %36 = icmp eq i64 %35, 0
  call void @llvm.assume(i1 %36)
  %37 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %38 = icmp eq i64 %37, 0
  call void @llvm.assume(i1 %38)
  %39 = sext i32 %5 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = icmp sgt i32 %3, 0
  %44 = icmp ugt i32 %3, 1
  %45 = icmp ugt i32 %3, 2
  %46 = icmp ugt i32 %3, 3
  %47 = icmp ugt i32 %3, 4
  %48 = icmp ugt i32 %3, 5
  %49 = icmp ugt i32 %3, 6
  %50 = icmp ugt i32 %3, 7
  br label %.preheader700.i

.preheader700.i:                                  ; preds = %.split.us.i, %34
  %51 = phi i64 [ 0, %34 ], [ %61, %.split.us.i ]
  %52 = icmp slt i64 %51, %39
  %53 = shl i64 %51, 3
  %.tr694.i = trunc i64 %51 to i32
  %54 = shl i32 %.tr694.i, 3
  %55 = sext i32 %54 to i64
  %56 = add nsw i64 %30, %55
  %.fr.i = freeze i1 %52
  br i1 %.fr.i, label %.preheader700.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i: ; preds = %.preheader700.i
  %.tr726.i = trunc i64 %51 to i32
  %57 = shl i32 %.tr726.i, 4
  %58 = add i32 %57, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %58
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader700.split.preheader.i:                  ; preds = %.preheader700.i
  br i1 %43, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i: ; preds = %.preheader700.split.preheader.i
  %59 = trunc i64 %53 to i32
  %60 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %59
  store i16 0, ptr addrspace(3) %60, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i
  %61 = add nuw nsw i64 %51, 1
  %exitcond.not.i = icmp eq i64 %61, 32
  br i1 %exitcond.not.i, label %._crit_edge.i, label %.preheader700.i, !llvm.loop !24

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i: ; preds = %.preheader700.split.preheader.i
  %62 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %56
  %.sroa.0317.0.copyload.i = load i16, ptr %62, align 16, !tbaa.struct !19
  %63 = trunc i64 %53 to i32
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %63
  store i16 %.sroa.0317.0.copyload.i, ptr addrspace(3) %64, align 2, !tbaa.struct !19
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i
  %65 = trunc i64 %53 to i32
  %66 = or disjoint i32 %65, 1
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %66
  store i16 0, ptr addrspace(3) %67, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i
  %68 = or disjoint i64 %56, 1
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0317.0.copyload.1.i = load i16, ptr %69, align 2, !tbaa.struct !19
  %70 = trunc i64 %53 to i32
  %71 = or disjoint i32 %70, 1
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %71
  store i16 %.sroa.0317.0.copyload.1.i, ptr addrspace(3) %72, align 2, !tbaa.struct !19
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i
  %73 = trunc i64 %53 to i32
  %74 = or disjoint i32 %73, 2
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %74
  store i16 0, ptr addrspace(3) %75, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i
  %76 = or disjoint i64 %56, 2
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0317.0.copyload.2.i = load i16, ptr %77, align 4, !tbaa.struct !19
  %78 = trunc i64 %53 to i32
  %79 = or disjoint i32 %78, 2
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %79
  store i16 %.sroa.0317.0.copyload.2.i, ptr addrspace(3) %80, align 2, !tbaa.struct !19
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i
  %81 = trunc i64 %53 to i32
  %82 = or disjoint i32 %81, 3
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %82
  store i16 0, ptr addrspace(3) %83, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i
  %84 = or disjoint i64 %56, 3
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0317.0.copyload.3.i = load i16, ptr %85, align 2, !tbaa.struct !19
  %86 = trunc i64 %53 to i32
  %87 = or disjoint i32 %86, 3
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %87
  store i16 %.sroa.0317.0.copyload.3.i, ptr addrspace(3) %88, align 2, !tbaa.struct !19
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i
  %89 = trunc i64 %53 to i32
  %90 = or disjoint i32 %89, 4
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %90
  store i16 0, ptr addrspace(3) %91, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i
  %92 = or disjoint i64 %56, 4
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %92
  %.sroa.0317.0.copyload.4.i = load i16, ptr %93, align 8, !tbaa.struct !19
  %94 = trunc i64 %53 to i32
  %95 = or disjoint i32 %94, 4
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %95
  store i16 %.sroa.0317.0.copyload.4.i, ptr addrspace(3) %96, align 2, !tbaa.struct !19
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i
  %97 = trunc i64 %53 to i32
  %98 = or disjoint i32 %97, 5
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %98
  store i16 0, ptr addrspace(3) %99, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i
  %100 = or disjoint i64 %56, 5
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %100
  %.sroa.0317.0.copyload.5.i = load i16, ptr %101, align 2, !tbaa.struct !19
  %102 = trunc i64 %53 to i32
  %103 = or disjoint i32 %102, 5
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %103
  store i16 %.sroa.0317.0.copyload.5.i, ptr addrspace(3) %104, align 2, !tbaa.struct !19
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i
  %105 = trunc i64 %53 to i32
  %106 = or disjoint i32 %105, 6
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %106
  store i16 0, ptr addrspace(3) %107, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i
  %108 = or disjoint i64 %56, 6
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %108
  %.sroa.0317.0.copyload.6.i = load i16, ptr %109, align 4, !tbaa.struct !19
  %110 = trunc i64 %53 to i32
  %111 = or disjoint i32 %110, 6
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %111
  store i16 %.sroa.0317.0.copyload.6.i, ptr addrspace(3) %112, align 2, !tbaa.struct !19
  br i1 %50, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

113:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i
  %114 = or disjoint i64 %56, 7
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0317.0.copyload.7.i = load i16, ptr %115, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i: ; preds = %113, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i
  %.sroa.0319.2.7.i = phi i16 [ %.sroa.0317.0.copyload.7.i, %113 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i ]
  %116 = trunc i64 %53 to i32
  %117 = or disjoint i32 %116, 7
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %117
  store i16 %.sroa.0319.2.7.i, ptr addrspace(3) %118, align 2, !tbaa.struct !19
  br label %.split.us.i

._crit_edge.i:                                    ; preds = %.split.us.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %120 = icmp eq i64 %119, 0
  call void @llvm.assume(i1 %120)
  %121 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %122 = icmp eq i64 %121, 0
  call void @llvm.assume(i1 %122)
  %123 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %124 = icmp ult i64 %123, 256
  call void @llvm.assume(i1 %124)
  %125 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %126 = inttoptr i32 %125 to ptr addrspace(3)
  %127 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 512
  %128 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 1024
  %129 = lshr i64 %123, 5
  %130 = shl nuw nsw i64 %123, 3
  %131 = and i64 %130, 248
  %132 = or disjoint i64 %131, %129
  %133 = trunc i64 %132 to i32
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %133
  %.sroa.0378.0.copyload.i = load i16, ptr addrspace(3) %134, align 2, !tbaa.struct !19
  %135 = trunc i64 %123 to i32
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %135
  store i16 %.sroa.0378.0.copyload.i, ptr addrspace(3) %136, align 2, !tbaa.struct !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %138 = icmp ult i64 %137, 256
  call void @llvm.assume(i1 %138)
  %139 = icmp eq i64 %137, 0
  br i1 %139, label %140, label %.lr.ph710.i

140:                                              ; preds = %._crit_edge.i
  %.tr659.i = trunc i64 %28 to i32
  %141 = shl nuw i32 %.tr659.i, 9
  %142 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %143 = icmp eq i64 %142, 0
  call void @llvm.assume(i1 %143)
  %144 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %145 = icmp eq i64 %144, 0
  call void @llvm.assume(i1 %145)
  %146 = sext i32 %4 to i64
  %147 = sext i32 %5 to i64
  %148 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %149 = inttoptr i32 %148 to ptr addrspace(3)
  %150 = getelementptr inbounds i8, ptr addrspace(3) %149, i32 1536
  %151 = sext i32 %141 to i64
  br label %.preheader699.i

.preheader699.i:                                  ; preds = %.split707.us.i, %140
  %152 = phi i64 [ 0, %140 ], [ %160, %.split707.us.i ]
  %153 = icmp slt i64 %152, %146
  %154 = shl i64 %152, 5
  %.tr693.i = trunc i64 %152 to i32
  %155 = shl i32 %.tr693.i, 5
  %156 = sext i32 %155 to i64
  %157 = add nsw i64 %156, %151
  %.fr708.i = freeze i1 %153
  br i1 %.fr708.i, label %.preheader699.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader699.i
  %.tr.i = trunc i64 %152 to i32
  %158 = shl i32 %.tr.i, 6
  %159 = add i32 %158, 1536
  %scevgep721.i = getelementptr i8, ptr addrspace(3) %149, i32 %159
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep721.i, i8 0, i32 64, i1 false)
  br label %.split707.us.i

.split707.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %160 = add nuw nsw i64 %152, 1
  %exitcond723.not.i = icmp eq i64 %160, 16
  br i1 %exitcond723.not.i, label %.lr.ph710.i, label %.preheader699.i, !llvm.loop !28

.preheader699.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader699.i
  %161 = phi i64 [ %169, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader699.i ]
  %162 = icmp slt i64 %161, %147
  br i1 %162, label %163, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

163:                                              ; preds = %.preheader699.split.i
  %164 = add nuw nsw i64 %157, %161
  %165 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %164
  %.sroa.0280.0.copyload.i = load i16, ptr %165, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %163, %.preheader699.split.i
  %.sroa.0282.2.i = phi i16 [ %.sroa.0280.0.copyload.i, %163 ], [ 0, %.preheader699.split.i ]
  %166 = add nuw nsw i64 %161, %154
  %167 = trunc i64 %166 to i32
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %150, i32 %167
  store i16 %.sroa.0282.2.i, ptr addrspace(3) %168, align 2, !tbaa.struct !19
  %169 = add nuw nsw i64 %161, 1
  %exitcond722.not.i = icmp eq i64 %169, 32
  br i1 %exitcond722.not.i, label %.split707.us.i, label %.preheader699.split.i, !llvm.loop !29

.lr.ph710.i:                                      ; preds = %.split707.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %170 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %171 = icmp eq i64 %170, 0
  call void @llvm.assume(i1 %171)
  %172 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %173 = icmp eq i64 %172, 0
  call void @llvm.assume(i1 %173)
  %174 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %175 = icmp ult i64 %174, 256
  call void @llvm.assume(i1 %175)
  %176 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %177 = inttoptr i32 %176 to ptr addrspace(3)
  %178 = getelementptr inbounds i8, ptr addrspace(3) %177, i32 1536
  %179 = getelementptr inbounds i8, ptr addrspace(3) %177, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i

._crit_edge711.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %180 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %181 = icmp eq i64 %180, 0
  call void @llvm.assume(i1 %181)
  %182 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %183 = icmp eq i64 %182, 0
  call void @llvm.assume(i1 %183)
  %184 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %185 = icmp ult i64 %184, 256
  call void @llvm.assume(i1 %185)
  %186 = icmp ult i64 %184, 128
  br i1 %186, label %.lr.ph713.i, label %._crit_edge714.i

.lr.ph713.i:                                      ; preds = %._crit_edge711.i
  %187 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %188 = inttoptr i32 %187 to ptr addrspace(3)
  %189 = getelementptr inbounds i8, ptr addrspace(3) %188, i32 1024
  %190 = getelementptr inbounds i8, ptr addrspace(3) %188, i32 2560
  %191 = and i64 %184, 15
  %192 = shl nuw nsw i64 %184, 1
  %193 = and i64 %192, 224
  br label %212

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i, %.lr.ph710.i
  %194 = phi i64 [ %174, %.lr.ph710.i ], [ %203, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i ]
  %195 = lshr i64 %194, 4
  %196 = shl nuw nsw i64 %194, 5
  %197 = and i64 %196, 480
  %198 = or disjoint i64 %197, %195
  %199 = trunc i64 %198 to i32
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %178, i32 %199
  %.sroa.0379.0.copyload.i = load i16, ptr addrspace(3) %200, align 2, !tbaa.struct !19
  %201 = trunc i64 %194 to i32
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %179, i32 %201
  store i16 %.sroa.0379.0.copyload.i, ptr addrspace(3) %202, align 2, !tbaa.struct !19
  %203 = add nuw nsw i64 %194, 256
  %204 = icmp ult i64 %194, 256
  br i1 %204, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i, label %._crit_edge711.i, !llvm.loop !30

._crit_edge714.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %._crit_edge711.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %205 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %206 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %207 = icmp ult i64 %206, 256
  call void @llvm.assume(i1 %207)
  %208 = icmp eq i64 %206, 0
  br i1 %208, label %416, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %209 = trunc i64 %184 to i32
  %210 = and i32 %209, 127
  %211 = getelementptr inbounds float, ptr addrspace(3) %188, i32 %210
  store float %413, ptr addrspace(3) %211, align 4, !tbaa !31
  br label %._crit_edge714.i

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph713.i
  %213 = phi i64 [ 0, %.lr.ph713.i ], [ %414, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %214 = phi float [ 0.000000e+00, %.lr.ph713.i ], [ %413, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %215 = add nuw nsw i64 %213, %193
  %216 = trunc i64 %215 to i32
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %216
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %217, align 2, !tbaa.struct !19
  %218 = shl nuw nsw i64 %213, 4
  %219 = or disjoint i64 %218, %191
  %220 = trunc i64 %219 to i32
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %220
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %221, align 2, !tbaa.struct !19
  %222 = zext i16 %.sroa.0243.0.copyload.i to i32
  %223 = lshr i32 %222, 10
  %224 = and i32 %223, 31
  %225 = and i32 %222, 1023
  switch i32 %224, label %231 [
    i32 31, label %226
    i32 0, label %233
  ]

226:                                              ; preds = %212
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %227 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %225, 0
  %228 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %229 = or disjoint i32 %228, %227
  %230 = bitcast i32 %229 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

231:                                              ; preds = %212
  %232 = or disjoint i32 %225, 1024
  br label %233

233:                                              ; preds = %231, %212
  %234 = phi i32 [ %232, %231 ], [ %225, %212 ]
  %235 = uitofp i32 %234 to float
  %.not.i = icmp eq i32 %224, 0
  %236 = add nsw i32 %224, -25
  %237 = select i1 %.not.i, i32 -24, i32 %236
  %238 = call float @__ocml_ldexp_f32(float noundef %235, i32 noundef %237) #6
  %239 = fneg contract float %238
  %.not662663.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %240 = select contract i1 %.not662663.i, float %239, float %238
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %233, %226
  %241 = phi float [ %230, %226 ], [ %240, %233 ]
  %242 = zext i16 %.sroa.0234.0.copyload.i to i32
  %243 = lshr i32 %242, 10
  %244 = and i32 %243, 31
  %245 = and i32 %242, 1023
  switch i32 %244, label %251 [
    i32 31, label %246
    i32 0, label %253
  ]

246:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %247 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %245, 0
  %248 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %249 = or disjoint i32 %248, %247
  %250 = bitcast i32 %249 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

251:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %252 = or disjoint i32 %245, 1024
  br label %253

253:                                              ; preds = %251, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %254 = phi i32 [ %252, %251 ], [ %245, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %255 = uitofp i32 %254 to float
  %.not664.i = icmp eq i32 %244, 0
  %256 = add nsw i32 %244, -25
  %257 = select i1 %.not664.i, i32 -24, i32 %256
  %258 = call float @__ocml_ldexp_f32(float noundef %255, i32 noundef %257) #6
  %259 = fneg contract float %258
  %.not665666.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %260 = select contract i1 %.not665666.i, float %259, float %258
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %253, %246
  %261 = phi float [ %250, %246 ], [ %260, %253 ]
  %262 = fmul contract float %241, %261
  %263 = fadd contract float %214, %262
  %264 = or disjoint i64 %213, 1
  %265 = add nuw nsw i64 %264, %193
  %266 = trunc i64 %265 to i32
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %266
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %267, align 2, !tbaa.struct !19
  %268 = shl nuw nsw i64 %264, 4
  %269 = or disjoint i64 %268, %191
  %270 = trunc i64 %269 to i32
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %270
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %271, align 2, !tbaa.struct !19
  %272 = zext i16 %.sroa.0225.0.copyload.i to i32
  %273 = lshr i32 %272, 10
  %274 = and i32 %273, 31
  %275 = and i32 %272, 1023
  switch i32 %274, label %281 [
    i32 31, label %276
    i32 0, label %283
  ]

276:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %277 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %275, 0
  %278 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %279 = or disjoint i32 %278, %277
  %280 = bitcast i32 %279 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

281:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %282 = or disjoint i32 %275, 1024
  br label %283

283:                                              ; preds = %281, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %284 = phi i32 [ %282, %281 ], [ %275, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %285 = uitofp i32 %284 to float
  %.not667.i = icmp eq i32 %274, 0
  %286 = add nsw i32 %274, -25
  %287 = select i1 %.not667.i, i32 -24, i32 %286
  %288 = call float @__ocml_ldexp_f32(float noundef %285, i32 noundef %287) #6
  %289 = fneg contract float %288
  %.not668669.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %290 = select contract i1 %.not668669.i, float %289, float %288
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %283, %276
  %291 = phi float [ %280, %276 ], [ %290, %283 ]
  %292 = zext i16 %.sroa.0216.0.copyload.i to i32
  %293 = lshr i32 %292, 10
  %294 = and i32 %293, 31
  %295 = and i32 %292, 1023
  switch i32 %294, label %301 [
    i32 31, label %296
    i32 0, label %303
  ]

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %297 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %295, 0
  %298 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %299 = or disjoint i32 %298, %297
  %300 = bitcast i32 %299 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

301:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %302 = or disjoint i32 %295, 1024
  br label %303

303:                                              ; preds = %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %304 = phi i32 [ %302, %301 ], [ %295, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %305 = uitofp i32 %304 to float
  %.not670.i = icmp eq i32 %294, 0
  %306 = add nsw i32 %294, -25
  %307 = select i1 %.not670.i, i32 -24, i32 %306
  %308 = call float @__ocml_ldexp_f32(float noundef %305, i32 noundef %307) #6
  %309 = fneg contract float %308
  %.not671672.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %310 = select contract i1 %.not671672.i, float %309, float %308
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %303, %296
  %311 = phi float [ %300, %296 ], [ %310, %303 ]
  %312 = fmul contract float %291, %311
  %313 = fadd contract float %263, %312
  %314 = or disjoint i64 %213, 2
  %315 = add nuw nsw i64 %314, %193
  %316 = trunc i64 %315 to i32
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %316
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %317, align 2, !tbaa.struct !19
  %318 = shl nuw nsw i64 %314, 4
  %319 = or disjoint i64 %318, %191
  %320 = trunc i64 %319 to i32
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %320
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %321, align 2, !tbaa.struct !19
  %322 = zext i16 %.sroa.0207.0.copyload.i to i32
  %323 = lshr i32 %322, 10
  %324 = and i32 %323, 31
  %325 = and i32 %322, 1023
  switch i32 %324, label %331 [
    i32 31, label %326
    i32 0, label %333
  ]

326:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %327 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not688.i = icmp eq i32 %325, 0
  %328 = select i1 %.not688.i, i32 2139095040, i32 2143289344
  %329 = or disjoint i32 %328, %327
  %330 = bitcast i32 %329 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

331:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %332 = or disjoint i32 %325, 1024
  br label %333

333:                                              ; preds = %331, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %334 = phi i32 [ %332, %331 ], [ %325, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %335 = uitofp i32 %334 to float
  %.not673.i = icmp eq i32 %324, 0
  %336 = add nsw i32 %324, -25
  %337 = select i1 %.not673.i, i32 -24, i32 %336
  %338 = call float @__ocml_ldexp_f32(float noundef %335, i32 noundef %337) #6
  %339 = fneg contract float %338
  %.not674675.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %340 = select contract i1 %.not674675.i, float %339, float %338
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %333, %326
  %341 = phi float [ %330, %326 ], [ %340, %333 ]
  %342 = zext i16 %.sroa.0198.0.copyload.i to i32
  %343 = lshr i32 %342, 10
  %344 = and i32 %343, 31
  %345 = and i32 %342, 1023
  switch i32 %344, label %351 [
    i32 31, label %346
    i32 0, label %353
  ]

346:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %347 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not687.i = icmp eq i32 %345, 0
  %348 = select i1 %.not687.i, i32 2139095040, i32 2143289344
  %349 = or disjoint i32 %348, %347
  %350 = bitcast i32 %349 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

351:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %352 = or disjoint i32 %345, 1024
  br label %353

353:                                              ; preds = %351, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %354 = phi i32 [ %352, %351 ], [ %345, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %355 = uitofp i32 %354 to float
  %.not676.i = icmp eq i32 %344, 0
  %356 = add nsw i32 %344, -25
  %357 = select i1 %.not676.i, i32 -24, i32 %356
  %358 = call float @__ocml_ldexp_f32(float noundef %355, i32 noundef %357) #6
  %359 = fneg contract float %358
  %.not677678.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %360 = select contract i1 %.not677678.i, float %359, float %358
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %353, %346
  %361 = phi float [ %350, %346 ], [ %360, %353 ]
  %362 = fmul contract float %341, %361
  %363 = fadd contract float %313, %362
  %364 = or disjoint i64 %213, 3
  %365 = add nuw nsw i64 %364, %193
  %366 = trunc i64 %365 to i32
  %367 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %366
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %367, align 2, !tbaa.struct !19
  %368 = shl nuw nsw i64 %364, 4
  %369 = or disjoint i64 %368, %191
  %370 = trunc i64 %369 to i32
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %370
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %371, align 2, !tbaa.struct !19
  %372 = zext i16 %.sroa.0189.0.copyload.i to i32
  %373 = lshr i32 %372, 10
  %374 = and i32 %373, 31
  %375 = and i32 %372, 1023
  switch i32 %374, label %381 [
    i32 31, label %376
    i32 0, label %383
  ]

376:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %377 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not686.i = icmp eq i32 %375, 0
  %378 = select i1 %.not686.i, i32 2139095040, i32 2143289344
  %379 = or disjoint i32 %378, %377
  %380 = bitcast i32 %379 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

381:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %382 = or disjoint i32 %375, 1024
  br label %383

383:                                              ; preds = %381, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %384 = phi i32 [ %382, %381 ], [ %375, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %385 = uitofp i32 %384 to float
  %.not679.i = icmp eq i32 %374, 0
  %386 = add nsw i32 %374, -25
  %387 = select i1 %.not679.i, i32 -24, i32 %386
  %388 = call float @__ocml_ldexp_f32(float noundef %385, i32 noundef %387) #6
  %389 = fneg contract float %388
  %.not680681.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %390 = select contract i1 %.not680681.i, float %389, float %388
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %383, %376
  %391 = phi float [ %380, %376 ], [ %390, %383 ]
  %392 = zext i16 %.sroa.0180.0.copyload.i to i32
  %393 = lshr i32 %392, 10
  %394 = and i32 %393, 31
  %395 = and i32 %392, 1023
  switch i32 %394, label %401 [
    i32 31, label %396
    i32 0, label %403
  ]

396:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %397 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not685.i = icmp eq i32 %395, 0
  %398 = select i1 %.not685.i, i32 2139095040, i32 2143289344
  %399 = or disjoint i32 %398, %397
  %400 = bitcast i32 %399 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

401:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %402 = or disjoint i32 %395, 1024
  br label %403

403:                                              ; preds = %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %404 = phi i32 [ %402, %401 ], [ %395, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %405 = uitofp i32 %404 to float
  %.not682.i = icmp eq i32 %394, 0
  %406 = add nsw i32 %394, -25
  %407 = select i1 %.not682.i, i32 -24, i32 %406
  %408 = call float @__ocml_ldexp_f32(float noundef %405, i32 noundef %407) #6
  %409 = fneg contract float %408
  %.not683684.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %410 = select contract i1 %.not683684.i, float %409, float %408
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %403, %396
  %411 = phi float [ %400, %396 ], [ %410, %403 ]
  %412 = fmul contract float %391, %411
  %413 = fadd contract float %363, %412
  %414 = add nuw nsw i64 %213, 4
  %415 = icmp ult i64 %213, 28
  br i1 %415, label %212, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, !llvm.loop !33

416:                                              ; preds = %._crit_edge714.i
  %417 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %418 = icmp eq i64 %417, 0
  call void @llvm.assume(i1 %418)
  %419 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %420 = icmp eq i64 %419, 0
  call void @llvm.assume(i1 %420)
  %421 = sext i32 %3 to i64
  %422 = call i32 @llvm.amdgcn.groupstaticsize()
  %423 = inttoptr i32 %422 to ptr addrspace(3)
  %424 = icmp sgt i32 %4, 0
  %425 = icmp ugt i32 %4, 1
  %426 = icmp ugt i32 %4, 2
  %427 = icmp ugt i32 %4, 3
  %428 = icmp ugt i32 %4, 4
  %429 = icmp ugt i32 %4, 5
  %430 = icmp ugt i32 %4, 6
  %431 = icmp ugt i32 %4, 7
  %432 = icmp ugt i32 %4, 8
  %433 = icmp ugt i32 %4, 9
  %434 = icmp ugt i32 %4, 10
  %435 = icmp ugt i32 %4, 11
  %436 = icmp ugt i32 %4, 12
  %437 = icmp ugt i32 %4, 13
  %438 = icmp ugt i32 %4, 14
  %439 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split716.us.i, %416
  %440 = phi i64 [ 0, %416 ], [ %446, %.split716.us.i ]
  %441 = icmp slt i64 %440, %421
  %442 = shl i64 %440, 4
  %.tr661.i = trunc i64 %440 to i32
  %443 = shl i32 %.tr661.i, 4
  %444 = sext i32 %443 to i64
  %445 = add nsw i64 %205, %444
  %.fr717.i = freeze i1 %441
  %brmerge.not.i = select i1 %.fr717.i, i1 %424, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split716.us.i

.split716.us.i:                                   ; preds = %535, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %446 = add nuw nsw i64 %440, 1
  %exitcond725.not.i = icmp eq i64 %446, 8
  br i1 %exitcond725.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %447 = trunc i64 %442 to i32
  %448 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %447
  %449 = load float, ptr addrspace(3) %448, align 4, !tbaa !31
  %450 = getelementptr inbounds float, ptr %9, i64 %445
  store float %449, ptr %450, align 32, !tbaa !31
  br i1 %425, label %.preheader.split.2.i, label %.split716.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %451 = trunc i64 %442 to i32
  %452 = or disjoint i32 %451, 1
  %453 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %452
  %454 = load float, ptr addrspace(3) %453, align 4, !tbaa !31
  %455 = or disjoint i64 %445, 1
  %456 = getelementptr inbounds float, ptr %9, i64 %455
  store float %454, ptr %456, align 4, !tbaa !31
  br i1 %426, label %.preheader.split.3.i, label %.split716.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %457 = trunc i64 %442 to i32
  %458 = or disjoint i32 %457, 2
  %459 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %458
  %460 = load float, ptr addrspace(3) %459, align 4, !tbaa !31
  %461 = or disjoint i64 %445, 2
  %462 = getelementptr inbounds float, ptr %9, i64 %461
  store float %460, ptr %462, align 8, !tbaa !31
  br i1 %427, label %.preheader.split.4.i, label %.split716.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %463 = trunc i64 %442 to i32
  %464 = or disjoint i32 %463, 3
  %465 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %464
  %466 = load float, ptr addrspace(3) %465, align 4, !tbaa !31
  %467 = or disjoint i64 %445, 3
  %468 = getelementptr inbounds float, ptr %9, i64 %467
  store float %466, ptr %468, align 4, !tbaa !31
  br i1 %428, label %.preheader.split.5.i, label %.split716.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %469 = trunc i64 %442 to i32
  %470 = or disjoint i32 %469, 4
  %471 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %470
  %472 = load float, ptr addrspace(3) %471, align 4, !tbaa !31
  %473 = or disjoint i64 %445, 4
  %474 = getelementptr inbounds float, ptr %9, i64 %473
  store float %472, ptr %474, align 16, !tbaa !31
  br i1 %429, label %.preheader.split.6.i, label %.split716.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %475 = trunc i64 %442 to i32
  %476 = or disjoint i32 %475, 5
  %477 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !31
  %479 = or disjoint i64 %445, 5
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 4, !tbaa !31
  br i1 %430, label %.preheader.split.7.i, label %.split716.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %481 = trunc i64 %442 to i32
  %482 = or disjoint i32 %481, 6
  %483 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !31
  %485 = or disjoint i64 %445, 6
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 8, !tbaa !31
  br i1 %431, label %.preheader.split.8.i, label %.split716.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %487 = trunc i64 %442 to i32
  %488 = or disjoint i32 %487, 7
  %489 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !31
  %491 = or disjoint i64 %445, 7
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 4, !tbaa !31
  br i1 %432, label %.preheader.split.9.i, label %.split716.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %493 = trunc i64 %442 to i32
  %494 = or disjoint i32 %493, 8
  %495 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !31
  %497 = or disjoint i64 %445, 8
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 32, !tbaa !31
  br i1 %433, label %.preheader.split.10.i, label %.split716.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %499 = trunc i64 %442 to i32
  %500 = or disjoint i32 %499, 9
  %501 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %500
  %502 = load float, ptr addrspace(3) %501, align 4, !tbaa !31
  %503 = or disjoint i64 %445, 9
  %504 = getelementptr inbounds float, ptr %9, i64 %503
  store float %502, ptr %504, align 4, !tbaa !31
  br i1 %434, label %.preheader.split.11.i, label %.split716.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %505 = trunc i64 %442 to i32
  %506 = or disjoint i32 %505, 10
  %507 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %506
  %508 = load float, ptr addrspace(3) %507, align 4, !tbaa !31
  %509 = or disjoint i64 %445, 10
  %510 = getelementptr inbounds float, ptr %9, i64 %509
  store float %508, ptr %510, align 8, !tbaa !31
  br i1 %435, label %.preheader.split.12.i, label %.split716.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %511 = trunc i64 %442 to i32
  %512 = or disjoint i32 %511, 11
  %513 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %512
  %514 = load float, ptr addrspace(3) %513, align 4, !tbaa !31
  %515 = or disjoint i64 %445, 11
  %516 = getelementptr inbounds float, ptr %9, i64 %515
  store float %514, ptr %516, align 4, !tbaa !31
  br i1 %436, label %.preheader.split.13.i, label %.split716.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %517 = trunc i64 %442 to i32
  %518 = or disjoint i32 %517, 12
  %519 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %518
  %520 = load float, ptr addrspace(3) %519, align 4, !tbaa !31
  %521 = or disjoint i64 %445, 12
  %522 = getelementptr inbounds float, ptr %9, i64 %521
  store float %520, ptr %522, align 16, !tbaa !31
  br i1 %437, label %.preheader.split.14.i, label %.split716.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %523 = trunc i64 %442 to i32
  %524 = or disjoint i32 %523, 13
  %525 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !31
  %527 = or disjoint i64 %445, 13
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 4, !tbaa !31
  br i1 %438, label %.preheader.split.15.i, label %.split716.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %529 = trunc i64 %442 to i32
  %530 = or disjoint i32 %529, 14
  %531 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %530
  %532 = load float, ptr addrspace(3) %531, align 4, !tbaa !31
  %533 = or disjoint i64 %445, 14
  %534 = getelementptr inbounds float, ptr %9, i64 %533
  store float %532, ptr %534, align 8, !tbaa !31
  br i1 %439, label %535, label %.split716.us.i

535:                                              ; preds = %.preheader.split.15.i
  %536 = trunc i64 %442 to i32
  %537 = or disjoint i32 %536, 15
  %538 = getelementptr inbounds float, ptr addrspace(3) %423, i32 %537
  %539 = load float, ptr addrspace(3) %538, align 4, !tbaa !31
  %540 = or disjoint i64 %445, 15
  %541 = getelementptr inbounds float, ptr %9, i64 %540
  store float %539, ptr %541, align 4, !tbaa !31
  br label %.split716.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge714.i, %.split716.us.i
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
!19 = !{i64 0, i64 2, !20}
!20 = !{!21, !21, i64 0}
!21 = !{!"short", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = distinct !{!24, !25, !26, !27}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{!"llvm.loop.vectorize.width", i32 1}
!27 = !{!"llvm.loop.interleave.count", i32 1}
!28 = distinct !{!28, !25, !26, !27}
!29 = distinct !{!29, !25, !26, !27}
!30 = distinct !{!30, !25, !26, !27}
!31 = !{!32, !32, i64 0}
!32 = !{!"float", !22, i64 0}
!33 = distinct !{!33, !25}
!34 = distinct !{!34, !25}
;----------------- End AdaptiveCpp IR dump ---------------
