;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-qvcit730/kernel.cpp"
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
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 715827882
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 3
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.lr.ph.i

34:                                               ; preds = %6
  %35 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %36 = icmp ult i64 %35, 5
  call void @llvm.assume(i1 %36)
  %37 = icmp eq i64 %35, 0
  br i1 %37, label %38, label %.lr.ph.i

38:                                               ; preds = %34
  %39 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %40 = icmp eq i64 %39, 0
  call void @llvm.assume(i1 %40)
  %41 = sext i32 %5 to i64
  %42 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %43 = inttoptr i32 %42 to ptr addrspace(3)
  %44 = getelementptr inbounds i8, ptr addrspace(3) %43, i32 512
  %45 = sext i32 %30 to i64
  %46 = icmp sgt i32 %3, 0
  %47 = icmp ugt i32 %3, 1
  %48 = icmp ugt i32 %3, 2
  %49 = icmp ugt i32 %3, 3
  %50 = icmp ugt i32 %3, 4
  %51 = icmp ugt i32 %3, 5
  %52 = icmp ugt i32 %3, 6
  %53 = icmp ugt i32 %3, 7
  br label %.preheader707.i

.preheader707.i:                                  ; preds = %.split.us.i, %38
  %54 = phi i64 [ 0, %38 ], [ %64, %.split.us.i ]
  %55 = icmp slt i64 %54, %41
  %56 = shl i64 %54, 3
  %.tr701.i = trunc i64 %54 to i32
  %57 = shl i32 %.tr701.i, 3
  %58 = sext i32 %57 to i64
  %59 = add nsw i64 %58, %45
  %.fr.i = freeze i1 %55
  br i1 %.fr.i, label %.preheader707.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i: ; preds = %.preheader707.i
  %.tr744.i = trunc i64 %54 to i32
  %60 = shl i32 %.tr744.i, 4
  %61 = add i32 %60, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %43, i32 %61
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader707.split.preheader.i:                  ; preds = %.preheader707.i
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i: ; preds = %.preheader707.split.preheader.i
  %62 = trunc i64 %56 to i32
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %62
  store i16 0, ptr addrspace(3) %63, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i
  %64 = add nuw nsw i64 %54, 1
  %exitcond.not.i = icmp eq i64 %64, 16
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader707.i, !llvm.loop !24

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i: ; preds = %.preheader707.split.preheader.i
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %59
  %.sroa.0321.0.copyload.i = load i16, ptr %65, align 16, !tbaa.struct !19
  %66 = trunc i64 %56 to i32
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %66
  store i16 %.sroa.0321.0.copyload.i, ptr addrspace(3) %67, align 2, !tbaa.struct !19
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i
  %68 = trunc i64 %56 to i32
  %69 = or disjoint i32 %68, 1
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %69
  store i16 0, ptr addrspace(3) %70, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i
  %71 = or disjoint i64 %59, 1
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %71
  %.sroa.0321.0.copyload.1.i = load i16, ptr %72, align 2, !tbaa.struct !19
  %73 = trunc i64 %56 to i32
  %74 = or disjoint i32 %73, 1
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %74
  store i16 %.sroa.0321.0.copyload.1.i, ptr addrspace(3) %75, align 2, !tbaa.struct !19
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i
  %76 = trunc i64 %56 to i32
  %77 = or disjoint i32 %76, 2
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %77
  store i16 0, ptr addrspace(3) %78, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i
  %79 = or disjoint i64 %59, 2
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %79
  %.sroa.0321.0.copyload.2.i = load i16, ptr %80, align 4, !tbaa.struct !19
  %81 = trunc i64 %56 to i32
  %82 = or disjoint i32 %81, 2
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %82
  store i16 %.sroa.0321.0.copyload.2.i, ptr addrspace(3) %83, align 2, !tbaa.struct !19
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i
  %84 = trunc i64 %56 to i32
  %85 = or disjoint i32 %84, 3
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %85
  store i16 0, ptr addrspace(3) %86, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i
  %87 = or disjoint i64 %59, 3
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %87
  %.sroa.0321.0.copyload.3.i = load i16, ptr %88, align 2, !tbaa.struct !19
  %89 = trunc i64 %56 to i32
  %90 = or disjoint i32 %89, 3
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %90
  store i16 %.sroa.0321.0.copyload.3.i, ptr addrspace(3) %91, align 2, !tbaa.struct !19
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i
  %92 = trunc i64 %56 to i32
  %93 = or disjoint i32 %92, 4
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %93
  store i16 0, ptr addrspace(3) %94, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i
  %95 = or disjoint i64 %59, 4
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0321.0.copyload.4.i = load i16, ptr %96, align 8, !tbaa.struct !19
  %97 = trunc i64 %56 to i32
  %98 = or disjoint i32 %97, 4
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %98
  store i16 %.sroa.0321.0.copyload.4.i, ptr addrspace(3) %99, align 2, !tbaa.struct !19
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i
  %100 = trunc i64 %56 to i32
  %101 = or disjoint i32 %100, 5
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %101
  store i16 0, ptr addrspace(3) %102, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i
  %103 = or disjoint i64 %59, 5
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0321.0.copyload.5.i = load i16, ptr %104, align 2, !tbaa.struct !19
  %105 = trunc i64 %56 to i32
  %106 = or disjoint i32 %105, 5
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %106
  store i16 %.sroa.0321.0.copyload.5.i, ptr addrspace(3) %107, align 2, !tbaa.struct !19
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i
  %108 = trunc i64 %56 to i32
  %109 = or disjoint i32 %108, 6
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %109
  store i16 0, ptr addrspace(3) %110, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i
  %111 = or disjoint i64 %59, 6
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %111
  %.sroa.0321.0.copyload.6.i = load i16, ptr %112, align 4, !tbaa.struct !19
  %113 = trunc i64 %56 to i32
  %114 = or disjoint i32 %113, 6
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %114
  store i16 %.sroa.0321.0.copyload.6.i, ptr addrspace(3) %115, align 2, !tbaa.struct !19
  br i1 %53, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

116:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i
  %117 = or disjoint i64 %59, 7
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0321.0.copyload.7.i = load i16, ptr %118, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i: ; preds = %116, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i
  %.sroa.0323.2.7.i = phi i16 [ %.sroa.0321.0.copyload.7.i, %116 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i ]
  %119 = trunc i64 %56 to i32
  %120 = or disjoint i32 %119, 7
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %120
  store i16 %.sroa.0323.2.7.i, ptr addrspace(3) %121, align 2, !tbaa.struct !19
  br label %.split.us.i

.lr.ph.i:                                         ; preds = %.split.us.i, %34, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %123 = icmp eq i64 %122, 0
  call void @llvm.assume(i1 %123)
  %124 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %125 = icmp ult i64 %124, 5
  call void @llvm.assume(i1 %125)
  %126 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %127 = icmp ult i64 %126, 3
  call void @llvm.assume(i1 %127)
  %128 = mul nuw nsw i64 %126, 5
  %129 = add nuw nsw i64 %128, %124
  %130 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %131 = inttoptr i32 %130 to ptr addrspace(3)
  %132 = getelementptr inbounds i8, ptr addrspace(3) %131, i32 512
  %133 = getelementptr inbounds i8, ptr addrspace(3) %131, i32 768
  br label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i

.lr.ph721.i:                                      ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %135 = icmp eq i64 %134, 0
  call void @llvm.assume(i1 %135)
  %136 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %137 = icmp ult i64 %136, 5
  call void @llvm.assume(i1 %137)
  %138 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %139 = icmp ult i64 %138, 3
  call void @llvm.assume(i1 %139)
  %140 = mul nuw nsw i64 %138, 5
  %141 = add nuw nsw i64 %140, %136
  %142 = shl i32 %.tr.i, 8
  %143 = sext i32 %4 to i64
  %144 = sext i32 %5 to i64
  %145 = sext i32 %142 to i64
  %146 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %147 = inttoptr i32 %146 to ptr addrspace(3)
  %148 = getelementptr inbounds i8, ptr addrspace(3) %147, i32 1024
  br label %174

_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i: ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i, %.lr.ph.i
  %149 = phi i64 [ %129, %.lr.ph.i ], [ %160, %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i ]
  %150 = shl i64 %149, 3
  %151 = and i64 %150, 120
  %152 = lshr i64 %149, 4
  %153 = and i64 %152, 7
  %154 = or disjoint i64 %151, %153
  %155 = trunc i64 %154 to i32
  %156 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %155
  %.sroa.0382.0.copyload.i = load i16, ptr addrspace(3) %156, align 2, !tbaa.struct !19
  %157 = trunc i64 %149 to i32
  %158 = and i32 %157, 127
  %159 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %133, i32 %158
  store i16 %.sroa.0382.0.copyload.i, ptr addrspace(3) %159, align 2, !tbaa.struct !19
  %160 = add nuw nsw i64 %149, 15
  %161 = icmp ult i64 %149, 113
  br i1 %161, label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i, label %.lr.ph721.i, !llvm.loop !28

.lr.ph724.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %162 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %163 = icmp eq i64 %162, 0
  call void @llvm.assume(i1 %163)
  %164 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %165 = icmp ult i64 %164, 5
  call void @llvm.assume(i1 %165)
  %166 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %167 = icmp ult i64 %166, 3
  call void @llvm.assume(i1 %167)
  %168 = mul nuw nsw i64 %166, 5
  %169 = add nuw nsw i64 %168, %164
  %170 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %171 = inttoptr i32 %170 to ptr addrspace(3)
  %172 = getelementptr inbounds i8, ptr addrspace(3) %171, i32 1024
  %173 = getelementptr inbounds i8, ptr addrspace(3) %171, i32 1536
  br label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i

174:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph721.i
  %175 = phi i64 [ %141, %.lr.ph721.i ], [ %190, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %.frozen.i = freeze i64 %175
  %176 = sdiv i64 %.frozen.i, 16
  %177 = srem i64 %176, 16
  %178 = mul i64 %176, 16
  %.decomposed.i = sub i64 %.frozen.i, %178
  %179 = icmp slt i64 %177, %143
  %180 = icmp slt i64 %.decomposed.i, %144
  %181 = and i1 %180, %179
  br i1 %181, label %182, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

182:                                              ; preds = %174
  %.tr698.i = trunc i64 %177 to i32
  %183 = shl nsw i32 %.tr698.i, 4
  %184 = sext i32 %183 to i64
  %185 = add nsw i64 %.decomposed.i, %145
  %186 = add nsw i64 %185, %184
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %186
  %.sroa.0284.0.copyload.i = load i16, ptr %187, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %182, %174
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %182 ], [ 0, %174 ]
  %srem699.i = srem i64 %175, 256
  %188 = trunc i64 %srem699.i to i32
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %148, i32 %188
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %189, align 2, !tbaa.struct !19
  %190 = add i64 %175, 15
  %191 = icmp slt i64 %190, 256
  br i1 %191, label %174, label %.lr.ph724.i, !llvm.loop !29

.lr.ph727.i:                                      ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %192 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %193 = icmp eq i64 %192, 0
  call void @llvm.assume(i1 %193)
  %194 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %195 = icmp ult i64 %194, 5
  call void @llvm.assume(i1 %195)
  %196 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %197 = icmp ult i64 %196, 3
  call void @llvm.assume(i1 %197)
  %198 = mul nuw nsw i64 %196, 5
  %199 = add nuw nsw i64 %198, %194
  %200 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %201 = inttoptr i32 %200 to ptr addrspace(3)
  %202 = getelementptr inbounds i8, ptr addrspace(3) %201, i32 768
  %203 = getelementptr inbounds i8, ptr addrspace(3) %201, i32 1536
  br label %220

_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i: ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i, %.lr.ph724.i
  %204 = phi i64 [ %169, %.lr.ph724.i ], [ %215, %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i ]
  %205 = shl i64 %204, 4
  %206 = and i64 %205, 240
  %207 = lshr i64 %204, 4
  %208 = and i64 %207, 15
  %209 = or disjoint i64 %206, %208
  %210 = trunc i64 %209 to i32
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %172, i32 %210
  %.sroa.0383.0.copyload.i = load i16, ptr addrspace(3) %211, align 2, !tbaa.struct !19
  %212 = trunc i64 %204 to i32
  %213 = and i32 %212, 255
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %173, i32 %213
  store i16 %.sroa.0383.0.copyload.i, ptr addrspace(3) %214, align 2, !tbaa.struct !19
  %215 = add nuw nsw i64 %204, 15
  %216 = icmp ult i64 %204, 241
  br i1 %216, label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i, label %.lr.ph727.i, !llvm.loop !30

._crit_edge728.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %217 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %218 = icmp ult i64 %217, 3
  call void @llvm.assume(i1 %218)
  %219 = icmp eq i64 %217, 0
  br i1 %219, label %434, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

220:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, %.lr.ph727.i
  %221 = phi i64 [ %199, %.lr.ph727.i ], [ %228, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i ]
  %.frozen754.i = freeze i64 %221
  %222 = sdiv i64 %.frozen754.i, 16
  %223 = srem i64 %222, 8
  %224 = mul i64 %222, 16
  %.decomposed755.i = sub i64 %.frozen754.i, %224
  %225 = shl nsw i64 %223, 4
  br label %230

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %srem.i = srem i64 %221, 128
  %226 = trunc i64 %srem.i to i32
  %227 = getelementptr inbounds float, ptr addrspace(3) %201, i32 %226
  store float %431, ptr addrspace(3) %227, align 4, !tbaa !31
  %228 = add i64 %221, 15
  %229 = icmp slt i64 %228, 128
  br i1 %229, label %220, label %._crit_edge728.i, !llvm.loop !33

230:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %220
  %231 = phi i64 [ 0, %220 ], [ %432, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %232 = phi float [ 0.000000e+00, %220 ], [ %431, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %233 = add nuw nsw i64 %231, %225
  %234 = trunc i64 %233 to i32
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %202, i32 %234
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %235, align 2, !tbaa.struct !19
  %236 = shl nuw nsw i64 %231, 4
  %237 = add nsw i64 %236, %.decomposed755.i
  %238 = trunc i64 %237 to i32
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %203, i32 %238
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %239, align 2, !tbaa.struct !19
  %240 = zext i16 %.sroa.0243.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %230
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %245 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %243, 0
  %246 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

249:                                              ; preds = %230
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %230
  %252 = phi i32 [ %250, %249 ], [ %243, %230 ]
  %253 = uitofp i32 %252 to float
  %.not.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #6
  %257 = fneg contract float %256
  %.not666667.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %258 = select contract i1 %.not666667.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = zext i16 %.sroa.0234.0.copyload.i to i32
  %261 = lshr i32 %260, 10
  %262 = and i32 %261, 31
  %263 = and i32 %260, 1023
  switch i32 %262, label %269 [
    i32 31, label %264
    i32 0, label %271
  ]

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %265 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %263, 0
  %266 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %267 = or disjoint i32 %266, %265
  %268 = bitcast i32 %267 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %270 = or disjoint i32 %263, 1024
  br label %271

271:                                              ; preds = %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %272 = phi i32 [ %270, %269 ], [ %263, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %273 = uitofp i32 %272 to float
  %.not668.i = icmp eq i32 %262, 0
  %274 = add nsw i32 %262, -25
  %275 = select i1 %.not668.i, i32 -24, i32 %274
  %276 = call float @__ocml_ldexp_f32(float noundef %273, i32 noundef %275) #6
  %277 = fneg contract float %276
  %.not669670.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %278 = select contract i1 %.not669670.i, float %277, float %276
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %271, %264
  %279 = phi float [ %268, %264 ], [ %278, %271 ]
  %280 = fmul contract float %259, %279
  %281 = fadd contract float %232, %280
  %282 = or disjoint i64 %231, 1
  %283 = add nuw nsw i64 %282, %225
  %284 = trunc i64 %283 to i32
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %202, i32 %284
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %285, align 2, !tbaa.struct !19
  %286 = shl nuw nsw i64 %282, 4
  %287 = add nsw i64 %286, %.decomposed755.i
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %203, i32 %288
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !19
  %290 = zext i16 %.sroa.0225.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %295 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %293, 0
  %296 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not671.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not671.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #6
  %307 = fneg contract float %306
  %.not672673.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %308 = select contract i1 %.not672673.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = zext i16 %.sroa.0216.0.copyload.i to i32
  %311 = lshr i32 %310, 10
  %312 = and i32 %311, 31
  %313 = and i32 %310, 1023
  switch i32 %312, label %319 [
    i32 31, label %314
    i32 0, label %321
  ]

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %315 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not693.i = icmp eq i32 %313, 0
  %316 = select i1 %.not693.i, i32 2139095040, i32 2143289344
  %317 = or disjoint i32 %316, %315
  %318 = bitcast i32 %317 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %320 = or disjoint i32 %313, 1024
  br label %321

321:                                              ; preds = %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %322 = phi i32 [ %320, %319 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %323 = uitofp i32 %322 to float
  %.not674.i = icmp eq i32 %312, 0
  %324 = add nsw i32 %312, -25
  %325 = select i1 %.not674.i, i32 -24, i32 %324
  %326 = call float @__ocml_ldexp_f32(float noundef %323, i32 noundef %325) #6
  %327 = fneg contract float %326
  %.not675676.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %328 = select contract i1 %.not675676.i, float %327, float %326
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %321, %314
  %329 = phi float [ %318, %314 ], [ %328, %321 ]
  %330 = fmul contract float %309, %329
  %331 = fadd contract float %281, %330
  %332 = or disjoint i64 %231, 2
  %333 = add nuw nsw i64 %332, %225
  %334 = trunc i64 %333 to i32
  %335 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %202, i32 %334
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %335, align 2, !tbaa.struct !19
  %336 = shl nuw nsw i64 %332, 4
  %337 = add nsw i64 %336, %.decomposed755.i
  %338 = trunc i64 %337 to i32
  %339 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %203, i32 %338
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %339, align 2, !tbaa.struct !19
  %340 = zext i16 %.sroa.0207.0.copyload.i to i32
  %341 = lshr i32 %340, 10
  %342 = and i32 %341, 31
  %343 = and i32 %340, 1023
  switch i32 %342, label %349 [
    i32 31, label %344
    i32 0, label %351
  ]

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %345 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %343, 0
  %346 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %347 = or disjoint i32 %346, %345
  %348 = bitcast i32 %347 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

349:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %350 = or disjoint i32 %343, 1024
  br label %351

351:                                              ; preds = %349, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %352 = phi i32 [ %350, %349 ], [ %343, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %353 = uitofp i32 %352 to float
  %.not677.i = icmp eq i32 %342, 0
  %354 = add nsw i32 %342, -25
  %355 = select i1 %.not677.i, i32 -24, i32 %354
  %356 = call float @__ocml_ldexp_f32(float noundef %353, i32 noundef %355) #6
  %357 = fneg contract float %356
  %.not678679.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %358 = select contract i1 %.not678679.i, float %357, float %356
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %351, %344
  %359 = phi float [ %348, %344 ], [ %358, %351 ]
  %360 = zext i16 %.sroa.0198.0.copyload.i to i32
  %361 = lshr i32 %360, 10
  %362 = and i32 %361, 31
  %363 = and i32 %360, 1023
  switch i32 %362, label %369 [
    i32 31, label %364
    i32 0, label %371
  ]

364:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %365 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %363, 0
  %366 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %367 = or disjoint i32 %366, %365
  %368 = bitcast i32 %367 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %370 = or disjoint i32 %363, 1024
  br label %371

371:                                              ; preds = %369, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %372 = phi i32 [ %370, %369 ], [ %363, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %373 = uitofp i32 %372 to float
  %.not680.i = icmp eq i32 %362, 0
  %374 = add nsw i32 %362, -25
  %375 = select i1 %.not680.i, i32 -24, i32 %374
  %376 = call float @__ocml_ldexp_f32(float noundef %373, i32 noundef %375) #6
  %377 = fneg contract float %376
  %.not681682.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %378 = select contract i1 %.not681682.i, float %377, float %376
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %371, %364
  %379 = phi float [ %368, %364 ], [ %378, %371 ]
  %380 = fmul contract float %359, %379
  %381 = fadd contract float %331, %380
  %382 = or disjoint i64 %231, 3
  %383 = add nuw nsw i64 %382, %225
  %384 = trunc i64 %383 to i32
  %385 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %202, i32 %384
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %385, align 2, !tbaa.struct !19
  %386 = shl nuw nsw i64 %382, 4
  %387 = add nsw i64 %386, %.decomposed755.i
  %388 = trunc i64 %387 to i32
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %203, i32 %388
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %389, align 2, !tbaa.struct !19
  %390 = zext i16 %.sroa.0189.0.copyload.i to i32
  %391 = lshr i32 %390, 10
  %392 = and i32 %391, 31
  %393 = and i32 %390, 1023
  switch i32 %392, label %399 [
    i32 31, label %394
    i32 0, label %401
  ]

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %395 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %393, 0
  %396 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %397 = or disjoint i32 %396, %395
  %398 = bitcast i32 %397 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

399:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %400 = or disjoint i32 %393, 1024
  br label %401

401:                                              ; preds = %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %402 = phi i32 [ %400, %399 ], [ %393, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %403 = uitofp i32 %402 to float
  %.not683.i = icmp eq i32 %392, 0
  %404 = add nsw i32 %392, -25
  %405 = select i1 %.not683.i, i32 -24, i32 %404
  %406 = call float @__ocml_ldexp_f32(float noundef %403, i32 noundef %405) #6
  %407 = fneg contract float %406
  %.not684685.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %408 = select contract i1 %.not684685.i, float %407, float %406
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %401, %394
  %409 = phi float [ %398, %394 ], [ %408, %401 ]
  %410 = zext i16 %.sroa.0180.0.copyload.i to i32
  %411 = lshr i32 %410, 10
  %412 = and i32 %411, 31
  %413 = and i32 %410, 1023
  switch i32 %412, label %419 [
    i32 31, label %414
    i32 0, label %421
  ]

414:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %415 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %413, 0
  %416 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %417 = or disjoint i32 %416, %415
  %418 = bitcast i32 %417 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

419:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %420 = or disjoint i32 %413, 1024
  br label %421

421:                                              ; preds = %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %422 = phi i32 [ %420, %419 ], [ %413, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %423 = uitofp i32 %422 to float
  %.not686.i = icmp eq i32 %412, 0
  %424 = add nsw i32 %412, -25
  %425 = select i1 %.not686.i, i32 -24, i32 %424
  %426 = call float @__ocml_ldexp_f32(float noundef %423, i32 noundef %425) #6
  %427 = fneg contract float %426
  %.not687688.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %428 = select contract i1 %.not687688.i, float %427, float %426
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %421, %414
  %429 = phi float [ %418, %414 ], [ %428, %421 ]
  %430 = fmul contract float %409, %429
  %431 = fadd contract float %381, %430
  %432 = add nuw nsw i64 %231, 4
  %433 = icmp ult i64 %231, 12
  br i1 %433, label %230, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, !llvm.loop !34

434:                                              ; preds = %._crit_edge728.i
  %435 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %436 = icmp ult i64 %435, 5
  call void @llvm.assume(i1 %436)
  %437 = icmp eq i64 %435, 0
  br i1 %437, label %438, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

438:                                              ; preds = %434
  %439 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %440 = icmp eq i64 %439, 0
  call void @llvm.assume(i1 %440)
  %441 = sext i32 %3 to i64
  %442 = call i32 @llvm.amdgcn.groupstaticsize()
  %443 = inttoptr i32 %442 to ptr addrspace(3)
  %444 = sext i32 %30 to i64
  %445 = icmp sgt i32 %4, 0
  %446 = icmp ugt i32 %4, 1
  %447 = icmp ugt i32 %4, 2
  %448 = icmp ugt i32 %4, 3
  %449 = icmp ugt i32 %4, 4
  %450 = icmp ugt i32 %4, 5
  %451 = icmp ugt i32 %4, 6
  %452 = icmp ugt i32 %4, 7
  %453 = icmp ugt i32 %4, 8
  %454 = icmp ugt i32 %4, 9
  %455 = icmp ugt i32 %4, 10
  %456 = icmp ugt i32 %4, 11
  %457 = icmp ugt i32 %4, 12
  %458 = icmp ugt i32 %4, 13
  %459 = icmp ugt i32 %4, 14
  %460 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split730.us.i, %438
  %461 = phi i64 [ 0, %438 ], [ %467, %.split730.us.i ]
  %462 = icmp slt i64 %461, %441
  %463 = shl i64 %461, 4
  %.tr665.i = trunc i64 %461 to i32
  %464 = shl i32 %.tr665.i, 4
  %465 = sext i32 %464 to i64
  %466 = add nsw i64 %465, %444
  %.fr731.i = freeze i1 %462
  %brmerge.not.i = select i1 %.fr731.i, i1 %445, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split730.us.i

.split730.us.i:                                   ; preds = %556, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %467 = add nuw nsw i64 %461, 1
  %exitcond743.not.i = icmp eq i64 %467, 8
  br i1 %exitcond743.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %468 = trunc i64 %463 to i32
  %469 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %468
  %470 = load float, ptr addrspace(3) %469, align 4, !tbaa !31
  %471 = getelementptr inbounds float, ptr %9, i64 %466
  store float %470, ptr %471, align 32, !tbaa !31
  br i1 %446, label %.preheader.split.2.i, label %.split730.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %472 = trunc i64 %463 to i32
  %473 = or disjoint i32 %472, 1
  %474 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !31
  %476 = or disjoint i64 %466, 1
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 4, !tbaa !31
  br i1 %447, label %.preheader.split.3.i, label %.split730.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %478 = trunc i64 %463 to i32
  %479 = or disjoint i32 %478, 2
  %480 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !31
  %482 = or disjoint i64 %466, 2
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 8, !tbaa !31
  br i1 %448, label %.preheader.split.4.i, label %.split730.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %484 = trunc i64 %463 to i32
  %485 = or disjoint i32 %484, 3
  %486 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !31
  %488 = or disjoint i64 %466, 3
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 4, !tbaa !31
  br i1 %449, label %.preheader.split.5.i, label %.split730.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %490 = trunc i64 %463 to i32
  %491 = or disjoint i32 %490, 4
  %492 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !31
  %494 = or disjoint i64 %466, 4
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 16, !tbaa !31
  br i1 %450, label %.preheader.split.6.i, label %.split730.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %496 = trunc i64 %463 to i32
  %497 = or disjoint i32 %496, 5
  %498 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !31
  %500 = or disjoint i64 %466, 5
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 4, !tbaa !31
  br i1 %451, label %.preheader.split.7.i, label %.split730.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %502 = trunc i64 %463 to i32
  %503 = or disjoint i32 %502, 6
  %504 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !31
  %506 = or disjoint i64 %466, 6
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 8, !tbaa !31
  br i1 %452, label %.preheader.split.8.i, label %.split730.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %508 = trunc i64 %463 to i32
  %509 = or disjoint i32 %508, 7
  %510 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !31
  %512 = or disjoint i64 %466, 7
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 4, !tbaa !31
  br i1 %453, label %.preheader.split.9.i, label %.split730.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %514 = trunc i64 %463 to i32
  %515 = or disjoint i32 %514, 8
  %516 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !31
  %518 = or disjoint i64 %466, 8
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 32, !tbaa !31
  br i1 %454, label %.preheader.split.10.i, label %.split730.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %520 = trunc i64 %463 to i32
  %521 = or disjoint i32 %520, 9
  %522 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !31
  %524 = or disjoint i64 %466, 9
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 4, !tbaa !31
  br i1 %455, label %.preheader.split.11.i, label %.split730.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %526 = trunc i64 %463 to i32
  %527 = or disjoint i32 %526, 10
  %528 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !31
  %530 = or disjoint i64 %466, 10
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 8, !tbaa !31
  br i1 %456, label %.preheader.split.12.i, label %.split730.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %532 = trunc i64 %463 to i32
  %533 = or disjoint i32 %532, 11
  %534 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %533
  %535 = load float, ptr addrspace(3) %534, align 4, !tbaa !31
  %536 = or disjoint i64 %466, 11
  %537 = getelementptr inbounds float, ptr %9, i64 %536
  store float %535, ptr %537, align 4, !tbaa !31
  br i1 %457, label %.preheader.split.13.i, label %.split730.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %538 = trunc i64 %463 to i32
  %539 = or disjoint i32 %538, 12
  %540 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !31
  %542 = or disjoint i64 %466, 12
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 16, !tbaa !31
  br i1 %458, label %.preheader.split.14.i, label %.split730.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %544 = trunc i64 %463 to i32
  %545 = or disjoint i32 %544, 13
  %546 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %545
  %547 = load float, ptr addrspace(3) %546, align 4, !tbaa !31
  %548 = or disjoint i64 %466, 13
  %549 = getelementptr inbounds float, ptr %9, i64 %548
  store float %547, ptr %549, align 4, !tbaa !31
  br i1 %459, label %.preheader.split.15.i, label %.split730.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %550 = trunc i64 %463 to i32
  %551 = or disjoint i32 %550, 14
  %552 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %551
  %553 = load float, ptr addrspace(3) %552, align 4, !tbaa !31
  %554 = or disjoint i64 %466, 14
  %555 = getelementptr inbounds float, ptr %9, i64 %554
  store float %553, ptr %555, align 8, !tbaa !31
  br i1 %460, label %556, label %.split730.us.i

556:                                              ; preds = %.preheader.split.15.i
  %557 = trunc i64 %463 to i32
  %558 = or disjoint i32 %557, 15
  %559 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %558
  %560 = load float, ptr addrspace(3) %559, align 4, !tbaa !31
  %561 = or disjoint i64 %466, 15
  %562 = getelementptr inbounds float, ptr %9, i64 %561
  store float %560, ptr %562, align 4, !tbaa !31
  br label %.split730.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge728.i, %434, %.split730.us.i
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
!35 = distinct !{!35, !25}
;----------------- End AdaptiveCpp IR dump ---------------
