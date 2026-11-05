;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-ullztgyx/kernel.cpp"
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
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 536870911
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp ult i64 %20, 4
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 536870912
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 536870911
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 4
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.lr.ph.i

34:                                               ; preds = %6
  %35 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %36 = icmp ult i64 %35, 4
  call void @llvm.assume(i1 %36)
  %37 = icmp eq i64 %35, 0
  br i1 %37, label %38, label %.lr.ph.i

38:                                               ; preds = %34
  %39 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %40 = icmp ult i64 %39, 4
  call void @llvm.assume(i1 %40)
  %41 = icmp eq i64 %39, 0
  br i1 %41, label %.preheader708.i, label %.lr.ph.i

.preheader708.i:                                  ; preds = %38
  %42 = sext i32 %5 to i64
  %43 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %44 = inttoptr i32 %43 to ptr addrspace(3)
  %45 = getelementptr inbounds i8, ptr addrspace(3) %44, i32 512
  %46 = sext i32 %30 to i64
  %47 = icmp sgt i32 %3, 0
  %48 = icmp ugt i32 %3, 1
  %49 = icmp ugt i32 %3, 2
  %50 = icmp ugt i32 %3, 3
  %51 = icmp ugt i32 %3, 4
  %52 = icmp ugt i32 %3, 5
  %53 = icmp ugt i32 %3, 6
  %54 = icmp ugt i32 %3, 7
  br label %.preheader707.i

.preheader707.i:                                  ; preds = %.split.us.i, %.preheader708.i
  %55 = phi i64 [ 0, %.preheader708.i ], [ %65, %.split.us.i ]
  %56 = icmp slt i64 %55, %42
  %57 = shl i64 %55, 3
  %.tr701.i = trunc i64 %55 to i32
  %58 = shl i32 %.tr701.i, 3
  %59 = sext i32 %58 to i64
  %60 = add nsw i64 %59, %46
  %.fr.i = freeze i1 %56
  br i1 %.fr.i, label %.preheader707.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i: ; preds = %.preheader707.i
  %.tr737.i = trunc i64 %55 to i32
  %61 = shl i32 %.tr737.i, 4
  %62 = add i32 %61, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %44, i32 %62
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader707.split.preheader.i:                  ; preds = %.preheader707.i
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i: ; preds = %.preheader707.split.preheader.i
  %63 = trunc i64 %57 to i32
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %63
  store i16 0, ptr addrspace(3) %64, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i
  %65 = add nuw nsw i64 %55, 1
  %exitcond.not.i = icmp eq i64 %65, 16
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader707.i, !llvm.loop !24

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i: ; preds = %.preheader707.split.preheader.i
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %60
  %.sroa.0321.0.copyload.i = load i16, ptr %66, align 16, !tbaa.struct !19
  %67 = trunc i64 %57 to i32
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %67
  store i16 %.sroa.0321.0.copyload.i, ptr addrspace(3) %68, align 2, !tbaa.struct !19
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i
  %69 = trunc i64 %57 to i32
  %70 = or disjoint i32 %69, 1
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %70
  store i16 0, ptr addrspace(3) %71, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i
  %72 = or disjoint i64 %60, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %72
  %.sroa.0321.0.copyload.1.i = load i16, ptr %73, align 2, !tbaa.struct !19
  %74 = trunc i64 %57 to i32
  %75 = or disjoint i32 %74, 1
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %75
  store i16 %.sroa.0321.0.copyload.1.i, ptr addrspace(3) %76, align 2, !tbaa.struct !19
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i
  %77 = trunc i64 %57 to i32
  %78 = or disjoint i32 %77, 2
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %78
  store i16 0, ptr addrspace(3) %79, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i
  %80 = or disjoint i64 %60, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %80
  %.sroa.0321.0.copyload.2.i = load i16, ptr %81, align 4, !tbaa.struct !19
  %82 = trunc i64 %57 to i32
  %83 = or disjoint i32 %82, 2
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %83
  store i16 %.sroa.0321.0.copyload.2.i, ptr addrspace(3) %84, align 2, !tbaa.struct !19
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i
  %85 = trunc i64 %57 to i32
  %86 = or disjoint i32 %85, 3
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %86
  store i16 0, ptr addrspace(3) %87, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i
  %88 = or disjoint i64 %60, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %88
  %.sroa.0321.0.copyload.3.i = load i16, ptr %89, align 2, !tbaa.struct !19
  %90 = trunc i64 %57 to i32
  %91 = or disjoint i32 %90, 3
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %91
  store i16 %.sroa.0321.0.copyload.3.i, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i
  %93 = trunc i64 %57 to i32
  %94 = or disjoint i32 %93, 4
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %94
  store i16 0, ptr addrspace(3) %95, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i
  %96 = or disjoint i64 %60, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %96
  %.sroa.0321.0.copyload.4.i = load i16, ptr %97, align 8, !tbaa.struct !19
  %98 = trunc i64 %57 to i32
  %99 = or disjoint i32 %98, 4
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %99
  store i16 %.sroa.0321.0.copyload.4.i, ptr addrspace(3) %100, align 2, !tbaa.struct !19
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i
  %101 = trunc i64 %57 to i32
  %102 = or disjoint i32 %101, 5
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %102
  store i16 0, ptr addrspace(3) %103, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i
  %104 = or disjoint i64 %60, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0321.0.copyload.5.i = load i16, ptr %105, align 2, !tbaa.struct !19
  %106 = trunc i64 %57 to i32
  %107 = or disjoint i32 %106, 5
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %107
  store i16 %.sroa.0321.0.copyload.5.i, ptr addrspace(3) %108, align 2, !tbaa.struct !19
  br i1 %53, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i
  %109 = trunc i64 %57 to i32
  %110 = or disjoint i32 %109, 6
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %110
  store i16 0, ptr addrspace(3) %111, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i
  %112 = or disjoint i64 %60, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %112
  %.sroa.0321.0.copyload.6.i = load i16, ptr %113, align 4, !tbaa.struct !19
  %114 = trunc i64 %57 to i32
  %115 = or disjoint i32 %114, 6
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %115
  store i16 %.sroa.0321.0.copyload.6.i, ptr addrspace(3) %116, align 2, !tbaa.struct !19
  br i1 %54, label %117, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

117:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i
  %118 = or disjoint i64 %60, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %118
  %.sroa.0321.0.copyload.7.i = load i16, ptr %119, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i: ; preds = %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i
  %.sroa.0323.2.7.i = phi i16 [ %.sroa.0321.0.copyload.7.i, %117 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i ]
  %120 = trunc i64 %57 to i32
  %121 = or disjoint i32 %120, 7
  %122 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %121
  store i16 %.sroa.0323.2.7.i, ptr addrspace(3) %122, align 2, !tbaa.struct !19
  br label %.split.us.i

.lr.ph.i:                                         ; preds = %.split.us.i, %38, %34, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %124 = icmp ult i64 %123, 4
  call void @llvm.assume(i1 %124)
  %125 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %126 = icmp ult i64 %125, 4
  call void @llvm.assume(i1 %126)
  %127 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %128 = icmp ult i64 %127, 4
  call void @llvm.assume(i1 %128)
  %129 = shl nuw nsw i64 %127, 4
  %130 = shl nuw nsw i64 %125, 2
  %131 = or disjoint i64 %129, %130
  %132 = or disjoint i64 %131, %123
  %133 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %134 = inttoptr i32 %133 to ptr addrspace(3)
  %135 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 512
  %136 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i

.lr.ph718.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %138 = icmp ult i64 %137, 4
  call void @llvm.assume(i1 %138)
  %139 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %140 = icmp ult i64 %139, 4
  call void @llvm.assume(i1 %140)
  %141 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %142 = icmp ult i64 %141, 4
  call void @llvm.assume(i1 %142)
  %143 = shl nuw nsw i64 %141, 4
  %144 = shl nuw nsw i64 %139, 2
  %145 = or disjoint i64 %143, %144
  %146 = or disjoint i64 %145, %137
  %147 = shl i32 %.tr.i, 8
  %148 = sext i32 %4 to i64
  %149 = sext i32 %5 to i64
  %150 = sext i32 %147 to i64
  %151 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %152 = inttoptr i32 %151 to ptr addrspace(3)
  %153 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 1024
  br label %181

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, %.lr.ph.i
  %154 = phi i64 [ %132, %.lr.ph.i ], [ %165, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i ]
  %155 = lshr i64 %154, 4
  %156 = and i64 %155, 7
  %157 = shl i64 %154, 3
  %158 = and i64 %157, 120
  %159 = or disjoint i64 %158, %156
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %160
  %.sroa.0382.0.copyload.i = load i16, ptr addrspace(3) %161, align 2, !tbaa.struct !19
  %162 = trunc i64 %154 to i32
  %163 = and i32 %162, 127
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %163
  store i16 %.sroa.0382.0.copyload.i, ptr addrspace(3) %164, align 2, !tbaa.struct !19
  %165 = add nuw nsw i64 %154, 64
  %166 = icmp ult i64 %154, 64
  br i1 %166, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, label %.lr.ph718.i, !llvm.loop !28

.lr.ph721.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %167 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %168 = icmp ult i64 %167, 4
  call void @llvm.assume(i1 %168)
  %169 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %170 = icmp ult i64 %169, 4
  call void @llvm.assume(i1 %170)
  %171 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %172 = icmp ult i64 %171, 4
  call void @llvm.assume(i1 %172)
  %173 = shl nuw nsw i64 %171, 4
  %174 = shl nuw nsw i64 %169, 2
  %175 = or disjoint i64 %173, %174
  %176 = or disjoint i64 %175, %167
  %177 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %178 = inttoptr i32 %177 to ptr addrspace(3)
  %179 = getelementptr inbounds i8, ptr addrspace(3) %178, i32 1024
  %180 = getelementptr inbounds i8, ptr addrspace(3) %178, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i

181:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph718.i
  %182 = phi i64 [ %146, %.lr.ph718.i ], [ %197, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %.frozen.i = freeze i64 %182
  %183 = sdiv i64 %.frozen.i, 16
  %184 = srem i64 %183, 16
  %185 = mul i64 %183, 16
  %.decomposed.i = sub i64 %.frozen.i, %185
  %186 = icmp slt i64 %184, %148
  %187 = icmp slt i64 %.decomposed.i, %149
  %188 = and i1 %187, %186
  br i1 %188, label %189, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

189:                                              ; preds = %181
  %.tr698.i = trunc i64 %184 to i32
  %190 = shl nsw i32 %.tr698.i, 4
  %191 = sext i32 %190 to i64
  %192 = add nsw i64 %.decomposed.i, %150
  %193 = add nsw i64 %192, %191
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %193
  %.sroa.0284.0.copyload.i = load i16, ptr %194, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %189, %181
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %189 ], [ 0, %181 ]
  %srem699.i = srem i64 %182, 256
  %195 = trunc i64 %srem699.i to i32
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %153, i32 %195
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %196, align 2, !tbaa.struct !19
  %197 = add i64 %182, 64
  %198 = icmp slt i64 %197, 256
  br i1 %198, label %181, label %.lr.ph721.i, !llvm.loop !29

.lr.ph724.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %199 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %200 = icmp ult i64 %199, 4
  call void @llvm.assume(i1 %200)
  %201 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %202 = icmp ult i64 %201, 4
  call void @llvm.assume(i1 %202)
  %203 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %204 = icmp ult i64 %203, 4
  call void @llvm.assume(i1 %204)
  %205 = shl nuw nsw i64 %203, 4
  %206 = shl nuw nsw i64 %201, 2
  %207 = or disjoint i64 %205, %206
  %208 = or disjoint i64 %207, %199
  %209 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %210 = inttoptr i32 %209 to ptr addrspace(3)
  %211 = getelementptr inbounds i8, ptr addrspace(3) %210, i32 768
  %212 = getelementptr inbounds i8, ptr addrspace(3) %210, i32 1536
  br label %229

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %.lr.ph721.i
  %213 = phi i64 [ %176, %.lr.ph721.i ], [ %224, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i ]
  %214 = lshr i64 %213, 4
  %215 = and i64 %214, 15
  %216 = shl i64 %213, 4
  %217 = and i64 %216, 240
  %218 = or disjoint i64 %217, %215
  %219 = trunc i64 %218 to i32
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %179, i32 %219
  %.sroa.0383.0.copyload.i = load i16, ptr addrspace(3) %220, align 2, !tbaa.struct !19
  %221 = trunc i64 %213 to i32
  %222 = and i32 %221, 255
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %180, i32 %222
  store i16 %.sroa.0383.0.copyload.i, ptr addrspace(3) %223, align 2, !tbaa.struct !19
  %224 = add nuw nsw i64 %213, 64
  %225 = icmp ult i64 %213, 192
  br i1 %225, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, label %.lr.ph724.i, !llvm.loop !30

._crit_edge725.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %226 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %227 = icmp ult i64 %226, 4
  call void @llvm.assume(i1 %227)
  %228 = icmp eq i64 %226, 0
  br i1 %228, label %443, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

229:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, %.lr.ph724.i
  %230 = phi i64 [ %208, %.lr.ph724.i ], [ %237, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i ]
  %.frozen747.i = freeze i64 %230
  %231 = sdiv i64 %.frozen747.i, 16
  %232 = srem i64 %231, 8
  %233 = mul i64 %231, 16
  %.decomposed748.i = sub i64 %.frozen747.i, %233
  %234 = shl nsw i64 %232, 4
  br label %239

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %srem.i = srem i64 %230, 128
  %235 = trunc i64 %srem.i to i32
  %236 = getelementptr inbounds float, ptr addrspace(3) %210, i32 %235
  store float %440, ptr addrspace(3) %236, align 4, !tbaa !31
  %237 = add i64 %230, 64
  %238 = icmp slt i64 %237, 128
  br i1 %238, label %229, label %._crit_edge725.i, !llvm.loop !33

239:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %229
  %240 = phi i64 [ 0, %229 ], [ %441, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %241 = phi float [ 0.000000e+00, %229 ], [ %440, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %242 = add nuw nsw i64 %240, %234
  %243 = trunc i64 %242 to i32
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %211, i32 %243
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %244, align 2, !tbaa.struct !19
  %245 = shl nuw nsw i64 %240, 4
  %246 = add nsw i64 %245, %.decomposed748.i
  %247 = trunc i64 %246 to i32
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %212, i32 %247
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %248, align 2, !tbaa.struct !19
  %249 = zext i16 %.sroa.0243.0.copyload.i to i32
  %250 = lshr i32 %249, 10
  %251 = and i32 %250, 31
  %252 = and i32 %249, 1023
  switch i32 %251, label %258 [
    i32 31, label %253
    i32 0, label %260
  ]

253:                                              ; preds = %239
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %254 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %252, 0
  %255 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %256 = or disjoint i32 %255, %254
  %257 = bitcast i32 %256 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

258:                                              ; preds = %239
  %259 = or disjoint i32 %252, 1024
  br label %260

260:                                              ; preds = %258, %239
  %261 = phi i32 [ %259, %258 ], [ %252, %239 ]
  %262 = uitofp i32 %261 to float
  %.not.i = icmp eq i32 %251, 0
  %263 = add nsw i32 %251, -25
  %264 = select i1 %.not.i, i32 -24, i32 %263
  %265 = call float @__ocml_ldexp_f32(float noundef %262, i32 noundef %264) #6
  %266 = fneg contract float %265
  %.not666667.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %267 = select contract i1 %.not666667.i, float %266, float %265
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %260, %253
  %268 = phi float [ %257, %253 ], [ %267, %260 ]
  %269 = zext i16 %.sroa.0234.0.copyload.i to i32
  %270 = lshr i32 %269, 10
  %271 = and i32 %270, 31
  %272 = and i32 %269, 1023
  switch i32 %271, label %278 [
    i32 31, label %273
    i32 0, label %280
  ]

273:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %274 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %272, 0
  %275 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %276 = or disjoint i32 %275, %274
  %277 = bitcast i32 %276 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

278:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %279 = or disjoint i32 %272, 1024
  br label %280

280:                                              ; preds = %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %281 = phi i32 [ %279, %278 ], [ %272, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %282 = uitofp i32 %281 to float
  %.not668.i = icmp eq i32 %271, 0
  %283 = add nsw i32 %271, -25
  %284 = select i1 %.not668.i, i32 -24, i32 %283
  %285 = call float @__ocml_ldexp_f32(float noundef %282, i32 noundef %284) #6
  %286 = fneg contract float %285
  %.not669670.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %287 = select contract i1 %.not669670.i, float %286, float %285
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %280, %273
  %288 = phi float [ %277, %273 ], [ %287, %280 ]
  %289 = fmul contract float %268, %288
  %290 = fadd contract float %241, %289
  %291 = or disjoint i64 %240, 1
  %292 = add nuw nsw i64 %291, %234
  %293 = trunc i64 %292 to i32
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %211, i32 %293
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %294, align 2, !tbaa.struct !19
  %295 = shl nuw nsw i64 %291, 4
  %296 = add nsw i64 %295, %.decomposed748.i
  %297 = trunc i64 %296 to i32
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %212, i32 %297
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %298, align 2, !tbaa.struct !19
  %299 = zext i16 %.sroa.0225.0.copyload.i to i32
  %300 = lshr i32 %299, 10
  %301 = and i32 %300, 31
  %302 = and i32 %299, 1023
  switch i32 %301, label %308 [
    i32 31, label %303
    i32 0, label %310
  ]

303:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %304 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %302, 0
  %305 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %306 = or disjoint i32 %305, %304
  %307 = bitcast i32 %306 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

308:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %309 = or disjoint i32 %302, 1024
  br label %310

310:                                              ; preds = %308, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %311 = phi i32 [ %309, %308 ], [ %302, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %312 = uitofp i32 %311 to float
  %.not671.i = icmp eq i32 %301, 0
  %313 = add nsw i32 %301, -25
  %314 = select i1 %.not671.i, i32 -24, i32 %313
  %315 = call float @__ocml_ldexp_f32(float noundef %312, i32 noundef %314) #6
  %316 = fneg contract float %315
  %.not672673.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %317 = select contract i1 %.not672673.i, float %316, float %315
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %310, %303
  %318 = phi float [ %307, %303 ], [ %317, %310 ]
  %319 = zext i16 %.sroa.0216.0.copyload.i to i32
  %320 = lshr i32 %319, 10
  %321 = and i32 %320, 31
  %322 = and i32 %319, 1023
  switch i32 %321, label %328 [
    i32 31, label %323
    i32 0, label %330
  ]

323:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %324 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not693.i = icmp eq i32 %322, 0
  %325 = select i1 %.not693.i, i32 2139095040, i32 2143289344
  %326 = or disjoint i32 %325, %324
  %327 = bitcast i32 %326 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

328:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %329 = or disjoint i32 %322, 1024
  br label %330

330:                                              ; preds = %328, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %331 = phi i32 [ %329, %328 ], [ %322, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %332 = uitofp i32 %331 to float
  %.not674.i = icmp eq i32 %321, 0
  %333 = add nsw i32 %321, -25
  %334 = select i1 %.not674.i, i32 -24, i32 %333
  %335 = call float @__ocml_ldexp_f32(float noundef %332, i32 noundef %334) #6
  %336 = fneg contract float %335
  %.not675676.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %337 = select contract i1 %.not675676.i, float %336, float %335
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %330, %323
  %338 = phi float [ %327, %323 ], [ %337, %330 ]
  %339 = fmul contract float %318, %338
  %340 = fadd contract float %290, %339
  %341 = or disjoint i64 %240, 2
  %342 = add nuw nsw i64 %341, %234
  %343 = trunc i64 %342 to i32
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %211, i32 %343
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %344, align 2, !tbaa.struct !19
  %345 = shl nuw nsw i64 %341, 4
  %346 = add nsw i64 %345, %.decomposed748.i
  %347 = trunc i64 %346 to i32
  %348 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %212, i32 %347
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %348, align 2, !tbaa.struct !19
  %349 = zext i16 %.sroa.0207.0.copyload.i to i32
  %350 = lshr i32 %349, 10
  %351 = and i32 %350, 31
  %352 = and i32 %349, 1023
  switch i32 %351, label %358 [
    i32 31, label %353
    i32 0, label %360
  ]

353:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %354 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %352, 0
  %355 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %356 = or disjoint i32 %355, %354
  %357 = bitcast i32 %356 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

358:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %359 = or disjoint i32 %352, 1024
  br label %360

360:                                              ; preds = %358, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %361 = phi i32 [ %359, %358 ], [ %352, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %362 = uitofp i32 %361 to float
  %.not677.i = icmp eq i32 %351, 0
  %363 = add nsw i32 %351, -25
  %364 = select i1 %.not677.i, i32 -24, i32 %363
  %365 = call float @__ocml_ldexp_f32(float noundef %362, i32 noundef %364) #6
  %366 = fneg contract float %365
  %.not678679.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %367 = select contract i1 %.not678679.i, float %366, float %365
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %360, %353
  %368 = phi float [ %357, %353 ], [ %367, %360 ]
  %369 = zext i16 %.sroa.0198.0.copyload.i to i32
  %370 = lshr i32 %369, 10
  %371 = and i32 %370, 31
  %372 = and i32 %369, 1023
  switch i32 %371, label %378 [
    i32 31, label %373
    i32 0, label %380
  ]

373:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %374 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %372, 0
  %375 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %376 = or disjoint i32 %375, %374
  %377 = bitcast i32 %376 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

378:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %379 = or disjoint i32 %372, 1024
  br label %380

380:                                              ; preds = %378, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %381 = phi i32 [ %379, %378 ], [ %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %382 = uitofp i32 %381 to float
  %.not680.i = icmp eq i32 %371, 0
  %383 = add nsw i32 %371, -25
  %384 = select i1 %.not680.i, i32 -24, i32 %383
  %385 = call float @__ocml_ldexp_f32(float noundef %382, i32 noundef %384) #6
  %386 = fneg contract float %385
  %.not681682.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %387 = select contract i1 %.not681682.i, float %386, float %385
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %380, %373
  %388 = phi float [ %377, %373 ], [ %387, %380 ]
  %389 = fmul contract float %368, %388
  %390 = fadd contract float %340, %389
  %391 = or disjoint i64 %240, 3
  %392 = add nuw nsw i64 %391, %234
  %393 = trunc i64 %392 to i32
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %211, i32 %393
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %394, align 2, !tbaa.struct !19
  %395 = shl nuw nsw i64 %391, 4
  %396 = add nsw i64 %395, %.decomposed748.i
  %397 = trunc i64 %396 to i32
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %212, i32 %397
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %398, align 2, !tbaa.struct !19
  %399 = zext i16 %.sroa.0189.0.copyload.i to i32
  %400 = lshr i32 %399, 10
  %401 = and i32 %400, 31
  %402 = and i32 %399, 1023
  switch i32 %401, label %408 [
    i32 31, label %403
    i32 0, label %410
  ]

403:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %404 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %402, 0
  %405 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %406 = or disjoint i32 %405, %404
  %407 = bitcast i32 %406 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

408:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %409 = or disjoint i32 %402, 1024
  br label %410

410:                                              ; preds = %408, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %411 = phi i32 [ %409, %408 ], [ %402, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %412 = uitofp i32 %411 to float
  %.not683.i = icmp eq i32 %401, 0
  %413 = add nsw i32 %401, -25
  %414 = select i1 %.not683.i, i32 -24, i32 %413
  %415 = call float @__ocml_ldexp_f32(float noundef %412, i32 noundef %414) #6
  %416 = fneg contract float %415
  %.not684685.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %417 = select contract i1 %.not684685.i, float %416, float %415
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %410, %403
  %418 = phi float [ %407, %403 ], [ %417, %410 ]
  %419 = zext i16 %.sroa.0180.0.copyload.i to i32
  %420 = lshr i32 %419, 10
  %421 = and i32 %420, 31
  %422 = and i32 %419, 1023
  switch i32 %421, label %428 [
    i32 31, label %423
    i32 0, label %430
  ]

423:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %424 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %422, 0
  %425 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %426 = or disjoint i32 %425, %424
  %427 = bitcast i32 %426 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

428:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %429 = or disjoint i32 %422, 1024
  br label %430

430:                                              ; preds = %428, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %431 = phi i32 [ %429, %428 ], [ %422, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %432 = uitofp i32 %431 to float
  %.not686.i = icmp eq i32 %421, 0
  %433 = add nsw i32 %421, -25
  %434 = select i1 %.not686.i, i32 -24, i32 %433
  %435 = call float @__ocml_ldexp_f32(float noundef %432, i32 noundef %434) #6
  %436 = fneg contract float %435
  %.not687688.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %437 = select contract i1 %.not687688.i, float %436, float %435
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %430, %423
  %438 = phi float [ %427, %423 ], [ %437, %430 ]
  %439 = fmul contract float %418, %438
  %440 = fadd contract float %390, %439
  %441 = add nuw nsw i64 %240, 4
  %442 = icmp ult i64 %240, 12
  br i1 %442, label %239, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, !llvm.loop !34

443:                                              ; preds = %._crit_edge725.i
  %444 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %445 = icmp ult i64 %444, 4
  call void @llvm.assume(i1 %445)
  %446 = icmp eq i64 %444, 0
  br i1 %446, label %447, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

447:                                              ; preds = %443
  %448 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %449 = icmp ult i64 %448, 4
  call void @llvm.assume(i1 %449)
  %450 = icmp eq i64 %448, 0
  br i1 %450, label %.preheader706.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader706.i:                                  ; preds = %447
  %451 = sext i32 %3 to i64
  %452 = call i32 @llvm.amdgcn.groupstaticsize()
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = sext i32 %30 to i64
  %455 = icmp sgt i32 %4, 0
  %456 = icmp ugt i32 %4, 1
  %457 = icmp ugt i32 %4, 2
  %458 = icmp ugt i32 %4, 3
  %459 = icmp ugt i32 %4, 4
  %460 = icmp ugt i32 %4, 5
  %461 = icmp ugt i32 %4, 6
  %462 = icmp ugt i32 %4, 7
  %463 = icmp ugt i32 %4, 8
  %464 = icmp ugt i32 %4, 9
  %465 = icmp ugt i32 %4, 10
  %466 = icmp ugt i32 %4, 11
  %467 = icmp ugt i32 %4, 12
  %468 = icmp ugt i32 %4, 13
  %469 = icmp ugt i32 %4, 14
  %470 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split727.us.i, %.preheader706.i
  %471 = phi i64 [ 0, %.preheader706.i ], [ %477, %.split727.us.i ]
  %472 = icmp slt i64 %471, %451
  %473 = shl i64 %471, 4
  %.tr665.i = trunc i64 %471 to i32
  %474 = shl i32 %.tr665.i, 4
  %475 = sext i32 %474 to i64
  %476 = add nsw i64 %475, %454
  %.fr728.i = freeze i1 %472
  %brmerge.not.i = select i1 %.fr728.i, i1 %455, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split727.us.i

.split727.us.i:                                   ; preds = %566, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %477 = add nuw nsw i64 %471, 1
  %exitcond736.not.i = icmp eq i64 %477, 8
  br i1 %exitcond736.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %478 = trunc i64 %473 to i32
  %479 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !31
  %481 = getelementptr inbounds float, ptr %9, i64 %476
  store float %480, ptr %481, align 32, !tbaa !31
  br i1 %456, label %.preheader.split.2.i, label %.split727.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %482 = trunc i64 %473 to i32
  %483 = or disjoint i32 %482, 1
  %484 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %483
  %485 = load float, ptr addrspace(3) %484, align 4, !tbaa !31
  %486 = or disjoint i64 %476, 1
  %487 = getelementptr inbounds float, ptr %9, i64 %486
  store float %485, ptr %487, align 4, !tbaa !31
  br i1 %457, label %.preheader.split.3.i, label %.split727.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %488 = trunc i64 %473 to i32
  %489 = or disjoint i32 %488, 2
  %490 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %489
  %491 = load float, ptr addrspace(3) %490, align 4, !tbaa !31
  %492 = or disjoint i64 %476, 2
  %493 = getelementptr inbounds float, ptr %9, i64 %492
  store float %491, ptr %493, align 8, !tbaa !31
  br i1 %458, label %.preheader.split.4.i, label %.split727.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %494 = trunc i64 %473 to i32
  %495 = or disjoint i32 %494, 3
  %496 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %495
  %497 = load float, ptr addrspace(3) %496, align 4, !tbaa !31
  %498 = or disjoint i64 %476, 3
  %499 = getelementptr inbounds float, ptr %9, i64 %498
  store float %497, ptr %499, align 4, !tbaa !31
  br i1 %459, label %.preheader.split.5.i, label %.split727.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %500 = trunc i64 %473 to i32
  %501 = or disjoint i32 %500, 4
  %502 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %501
  %503 = load float, ptr addrspace(3) %502, align 4, !tbaa !31
  %504 = or disjoint i64 %476, 4
  %505 = getelementptr inbounds float, ptr %9, i64 %504
  store float %503, ptr %505, align 16, !tbaa !31
  br i1 %460, label %.preheader.split.6.i, label %.split727.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %506 = trunc i64 %473 to i32
  %507 = or disjoint i32 %506, 5
  %508 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %507
  %509 = load float, ptr addrspace(3) %508, align 4, !tbaa !31
  %510 = or disjoint i64 %476, 5
  %511 = getelementptr inbounds float, ptr %9, i64 %510
  store float %509, ptr %511, align 4, !tbaa !31
  br i1 %461, label %.preheader.split.7.i, label %.split727.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %512 = trunc i64 %473 to i32
  %513 = or disjoint i32 %512, 6
  %514 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %513
  %515 = load float, ptr addrspace(3) %514, align 4, !tbaa !31
  %516 = or disjoint i64 %476, 6
  %517 = getelementptr inbounds float, ptr %9, i64 %516
  store float %515, ptr %517, align 8, !tbaa !31
  br i1 %462, label %.preheader.split.8.i, label %.split727.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %518 = trunc i64 %473 to i32
  %519 = or disjoint i32 %518, 7
  %520 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %519
  %521 = load float, ptr addrspace(3) %520, align 4, !tbaa !31
  %522 = or disjoint i64 %476, 7
  %523 = getelementptr inbounds float, ptr %9, i64 %522
  store float %521, ptr %523, align 4, !tbaa !31
  br i1 %463, label %.preheader.split.9.i, label %.split727.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %524 = trunc i64 %473 to i32
  %525 = or disjoint i32 %524, 8
  %526 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %525
  %527 = load float, ptr addrspace(3) %526, align 4, !tbaa !31
  %528 = or disjoint i64 %476, 8
  %529 = getelementptr inbounds float, ptr %9, i64 %528
  store float %527, ptr %529, align 32, !tbaa !31
  br i1 %464, label %.preheader.split.10.i, label %.split727.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %530 = trunc i64 %473 to i32
  %531 = or disjoint i32 %530, 9
  %532 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %531
  %533 = load float, ptr addrspace(3) %532, align 4, !tbaa !31
  %534 = or disjoint i64 %476, 9
  %535 = getelementptr inbounds float, ptr %9, i64 %534
  store float %533, ptr %535, align 4, !tbaa !31
  br i1 %465, label %.preheader.split.11.i, label %.split727.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %536 = trunc i64 %473 to i32
  %537 = or disjoint i32 %536, 10
  %538 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %537
  %539 = load float, ptr addrspace(3) %538, align 4, !tbaa !31
  %540 = or disjoint i64 %476, 10
  %541 = getelementptr inbounds float, ptr %9, i64 %540
  store float %539, ptr %541, align 8, !tbaa !31
  br i1 %466, label %.preheader.split.12.i, label %.split727.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %542 = trunc i64 %473 to i32
  %543 = or disjoint i32 %542, 11
  %544 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %543
  %545 = load float, ptr addrspace(3) %544, align 4, !tbaa !31
  %546 = or disjoint i64 %476, 11
  %547 = getelementptr inbounds float, ptr %9, i64 %546
  store float %545, ptr %547, align 4, !tbaa !31
  br i1 %467, label %.preheader.split.13.i, label %.split727.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %548 = trunc i64 %473 to i32
  %549 = or disjoint i32 %548, 12
  %550 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %549
  %551 = load float, ptr addrspace(3) %550, align 4, !tbaa !31
  %552 = or disjoint i64 %476, 12
  %553 = getelementptr inbounds float, ptr %9, i64 %552
  store float %551, ptr %553, align 16, !tbaa !31
  br i1 %468, label %.preheader.split.14.i, label %.split727.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %554 = trunc i64 %473 to i32
  %555 = or disjoint i32 %554, 13
  %556 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %555
  %557 = load float, ptr addrspace(3) %556, align 4, !tbaa !31
  %558 = or disjoint i64 %476, 13
  %559 = getelementptr inbounds float, ptr %9, i64 %558
  store float %557, ptr %559, align 4, !tbaa !31
  br i1 %469, label %.preheader.split.15.i, label %.split727.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %560 = trunc i64 %473 to i32
  %561 = or disjoint i32 %560, 14
  %562 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %561
  %563 = load float, ptr addrspace(3) %562, align 4, !tbaa !31
  %564 = or disjoint i64 %476, 14
  %565 = getelementptr inbounds float, ptr %9, i64 %564
  store float %563, ptr %565, align 8, !tbaa !31
  br i1 %470, label %566, label %.split727.us.i

566:                                              ; preds = %.preheader.split.15.i
  %567 = trunc i64 %473 to i32
  %568 = or disjoint i32 %567, 15
  %569 = getelementptr inbounds float, ptr addrspace(3) %453, i32 %568
  %570 = load float, ptr addrspace(3) %569, align 4, !tbaa !31
  %571 = or disjoint i64 %476, 15
  %572 = getelementptr inbounds float, ptr %9, i64 %571
  store float %570, ptr %572, align 4, !tbaa !31
  br label %.split727.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge725.i, %443, %447, %.split727.us.i
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
