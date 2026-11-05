;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882025/tmp/triton-sycl-cache/compile-w6wtprvj/kernel.cpp"
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
  %.tr.i = trunc i64 %28 to i32
  %30 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 256
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.loopexit.i

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
  %43 = zext i32 %30 to i64
  %44 = icmp sgt i32 %3, 0
  %45 = icmp ugt i32 %3, 1
  %46 = icmp ugt i32 %3, 2
  %47 = icmp ugt i32 %3, 3
  %48 = icmp ugt i32 %3, 4
  %49 = icmp ugt i32 %3, 5
  %50 = icmp ugt i32 %3, 6
  %51 = icmp ugt i32 %3, 7
  br label %.preheader703.i

.preheader703.i:                                  ; preds = %.split.us.i, %34
  %52 = phi i64 [ 0, %34 ], [ %62, %.split.us.i ]
  %53 = icmp slt i64 %52, %39
  %54 = shl i64 %52, 3
  %.tr698.i = trunc i64 %52 to i32
  %55 = shl i32 %.tr698.i, 3
  %56 = sext i32 %55 to i64
  %57 = add nsw i64 %56, %43
  %.fr.i = freeze i1 %53
  br i1 %.fr.i, label %.preheader703.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i: ; preds = %.preheader703.i
  %.tr724.i = trunc i64 %52 to i32
  %58 = shl i32 %.tr724.i, 4
  %59 = add i32 %58, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %59
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader703.split.preheader.i:                  ; preds = %.preheader703.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i: ; preds = %.preheader703.split.preheader.i
  %60 = trunc i64 %54 to i32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %60
  store i16 0, ptr addrspace(3) %61, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i
  %62 = add nuw nsw i64 %52, 1
  %exitcond.not.i = icmp eq i64 %62, 16
  br i1 %exitcond.not.i, label %.loopexit.i, label %.preheader703.i, !llvm.loop !24

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i: ; preds = %.preheader703.split.preheader.i
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0321.0.copyload.i = load i16, ptr %63, align 16, !tbaa.struct !19
  %64 = trunc i64 %54 to i32
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %64
  store i16 %.sroa.0321.0.copyload.i, ptr addrspace(3) %65, align 2, !tbaa.struct !19
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.thread.i
  %66 = trunc i64 %54 to i32
  %67 = or disjoint i32 %66, 1
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %67
  store i16 0, ptr addrspace(3) %68, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i
  %69 = or disjoint i64 %57, 1
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %69
  %.sroa.0321.0.copyload.1.i = load i16, ptr %70, align 2, !tbaa.struct !19
  %71 = trunc i64 %54 to i32
  %72 = or disjoint i32 %71, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0321.0.copyload.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !19
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.thread.i
  %74 = trunc i64 %54 to i32
  %75 = or disjoint i32 %74, 2
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.1.i
  %77 = or disjoint i64 %57, 2
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0321.0.copyload.2.i = load i16, ptr %78, align 4, !tbaa.struct !19
  %79 = trunc i64 %54 to i32
  %80 = or disjoint i32 %79, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0321.0.copyload.2.i, ptr addrspace(3) %81, align 2, !tbaa.struct !19
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.thread.i
  %82 = trunc i64 %54 to i32
  %83 = or disjoint i32 %82, 3
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.2.i
  %85 = or disjoint i64 %57, 3
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0321.0.copyload.3.i = load i16, ptr %86, align 2, !tbaa.struct !19
  %87 = trunc i64 %54 to i32
  %88 = or disjoint i32 %87, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0321.0.copyload.3.i, ptr addrspace(3) %89, align 2, !tbaa.struct !19
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.thread.i
  %90 = trunc i64 %54 to i32
  %91 = or disjoint i32 %90, 4
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.3.i
  %93 = or disjoint i64 %57, 4
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0321.0.copyload.4.i = load i16, ptr %94, align 8, !tbaa.struct !19
  %95 = trunc i64 %54 to i32
  %96 = or disjoint i32 %95, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0321.0.copyload.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !19
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.thread.i
  %98 = trunc i64 %54 to i32
  %99 = or disjoint i32 %98, 5
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.4.i
  %101 = or disjoint i64 %57, 5
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0321.0.copyload.5.i = load i16, ptr %102, align 2, !tbaa.struct !19
  %103 = trunc i64 %54 to i32
  %104 = or disjoint i32 %103, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0321.0.copyload.5.i, ptr addrspace(3) %105, align 2, !tbaa.struct !19
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.thread.i
  %106 = trunc i64 %54 to i32
  %107 = or disjoint i32 %106, 6
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.5.i
  %109 = or disjoint i64 %57, 6
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0321.0.copyload.6.i = load i16, ptr %110, align 4, !tbaa.struct !19
  %111 = trunc i64 %54 to i32
  %112 = or disjoint i32 %111, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0321.0.copyload.6.i, ptr addrspace(3) %113, align 2, !tbaa.struct !19
  br i1 %51, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

114:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i
  %115 = or disjoint i64 %57, 7
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0321.0.copyload.7.i = load i16, ptr %116, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.7.i: ; preds = %114, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i
  %.sroa.0323.2.7.i = phi i16 [ %.sroa.0321.0.copyload.7.i, %114 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.6.thread.i ]
  %117 = trunc i64 %54 to i32
  %118 = or disjoint i32 %117, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %118
  store i16 %.sroa.0323.2.7.i, ptr addrspace(3) %119, align 2, !tbaa.struct !19
  br label %.split.us.i

.loopexit.i:                                      ; preds = %.split.us.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %121 = icmp eq i64 %120, 0
  call void @llvm.assume(i1 %121)
  %122 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %123 = icmp eq i64 %122, 0
  call void @llvm.assume(i1 %123)
  %124 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %125 = icmp ult i64 %124, 256
  call void @llvm.assume(i1 %125)
  %126 = icmp ult i64 %124, 128
  br i1 %126, label %.lr.ph.i, label %.lr.ph709.i

.lr.ph.i:                                         ; preds = %.loopexit.i
  %127 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %128 = inttoptr i32 %127 to ptr addrspace(3)
  %129 = getelementptr inbounds i8, ptr addrspace(3) %128, i32 512
  %130 = getelementptr inbounds i8, ptr addrspace(3) %128, i32 768
  %131 = lshr i64 %124, 4
  %132 = shl nuw nsw i64 %124, 3
  %133 = and i64 %132, 120
  %134 = or disjoint i64 %133, %131
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %129, i32 %135
  %.sroa.0382.0.copyload.i = load i16, ptr addrspace(3) %136, align 2, !tbaa.struct !19
  %137 = trunc i64 %124 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %130, i32 %137
  store i16 %.sroa.0382.0.copyload.i, ptr addrspace(3) %138, align 2, !tbaa.struct !19
  br label %.lr.ph709.i

.lr.ph709.i:                                      ; preds = %.lr.ph.i, %.loopexit.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %139 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %140 = icmp eq i64 %139, 0
  call void @llvm.assume(i1 %140)
  %141 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %142 = icmp eq i64 %141, 0
  call void @llvm.assume(i1 %142)
  %143 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %144 = icmp ult i64 %143, 256
  call void @llvm.assume(i1 %144)
  %145 = sext i32 %4 to i64
  %146 = sext i32 %5 to i64
  %147 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %148 = inttoptr i32 %147 to ptr addrspace(3)
  %149 = getelementptr inbounds i8, ptr addrspace(3) %148, i32 1024
  %150 = and i64 %143, 15
  %151 = lshr i64 %143, 4
  %152 = icmp slt i64 %151, %145
  %153 = icmp slt i64 %150, %146
  %154 = and i1 %152, %153
  br i1 %154, label %155, label %._crit_edge713.i

155:                                              ; preds = %.lr.ph709.i
  %156 = shl nuw nsw i64 %28, 8
  %157 = and i64 %143, 240
  %158 = or disjoint i64 %157, %156
  %159 = or disjoint i64 %158, %150
  %160 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %159
  %.sroa.0284.0.copyload.i = load i16, ptr %160, align 2, !tbaa.struct !19
  br label %._crit_edge713.i

._crit_edge713.i:                                 ; preds = %155, %.lr.ph709.i
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %155 ], [ 0, %.lr.ph709.i ]
  %161 = trunc i64 %143 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %149, i32 %161
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %162, align 2, !tbaa.struct !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %163 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %164 = icmp eq i64 %163, 0
  call void @llvm.assume(i1 %164)
  %165 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %166 = icmp eq i64 %165, 0
  call void @llvm.assume(i1 %166)
  %167 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %168 = icmp ult i64 %167, 256
  call void @llvm.assume(i1 %168)
  %169 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %170 = inttoptr i32 %169 to ptr addrspace(3)
  %171 = getelementptr inbounds i8, ptr addrspace(3) %170, i32 1024
  %172 = getelementptr inbounds i8, ptr addrspace(3) %170, i32 1536
  %173 = lshr i64 %167, 4
  %174 = shl nuw nsw i64 %167, 4
  %175 = and i64 %174, 240
  %176 = or disjoint i64 %175, %173
  %177 = trunc i64 %176 to i32
  %178 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %171, i32 %177
  %.sroa.0383.0.copyload.i = load i16, ptr addrspace(3) %178, align 2, !tbaa.struct !19
  %179 = trunc i64 %167 to i32
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %172, i32 %179
  store i16 %.sroa.0383.0.copyload.i, ptr addrspace(3) %180, align 2, !tbaa.struct !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %181 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %182 = icmp eq i64 %181, 0
  call void @llvm.assume(i1 %182)
  %183 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %184 = icmp eq i64 %183, 0
  call void @llvm.assume(i1 %184)
  %185 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %186 = icmp ult i64 %185, 256
  call void @llvm.assume(i1 %186)
  %187 = icmp ult i64 %185, 128
  br i1 %187, label %.lr.ph715.i, label %._crit_edge716.i

.lr.ph715.i:                                      ; preds = %._crit_edge713.i
  %188 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %189 = inttoptr i32 %188 to ptr addrspace(3)
  %190 = getelementptr inbounds i8, ptr addrspace(3) %189, i32 768
  %191 = getelementptr inbounds i8, ptr addrspace(3) %189, i32 1536
  %192 = and i64 %185, 112
  %193 = and i64 %185, 15
  br label %200

._crit_edge716.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, %._crit_edge713.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %194 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %195 = icmp ult i64 %194, 256
  call void @llvm.assume(i1 %195)
  %196 = icmp eq i64 %194, 0
  br i1 %196, label %404, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %197 = trunc i64 %185 to i32
  %198 = and i32 %197, 127
  %199 = getelementptr inbounds float, ptr addrspace(3) %189, i32 %198
  store float %401, ptr addrspace(3) %199, align 4, !tbaa !28
  br label %._crit_edge716.i

200:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph715.i
  %201 = phi i64 [ 0, %.lr.ph715.i ], [ %402, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %202 = phi float [ 0.000000e+00, %.lr.ph715.i ], [ %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %203 = add nuw nsw i64 %201, %192
  %204 = trunc i64 %203 to i32
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %204
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %205, align 2, !tbaa.struct !19
  %206 = shl nuw nsw i64 %201, 4
  %207 = or disjoint i64 %206, %193
  %208 = trunc i64 %207 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %191, i32 %208
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %209, align 2, !tbaa.struct !19
  %210 = zext i16 %.sroa.0243.0.copyload.i to i32
  %211 = lshr i32 %210, 10
  %212 = and i32 %211, 31
  %213 = and i32 %210, 1023
  switch i32 %212, label %219 [
    i32 31, label %214
    i32 0, label %221
  ]

214:                                              ; preds = %200
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %215 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %213, 0
  %216 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %217 = or disjoint i32 %216, %215
  %218 = bitcast i32 %217 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

219:                                              ; preds = %200
  %220 = or disjoint i32 %213, 1024
  br label %221

221:                                              ; preds = %219, %200
  %222 = phi i32 [ %220, %219 ], [ %213, %200 ]
  %223 = uitofp i32 %222 to float
  %.not.i = icmp eq i32 %212, 0
  %224 = add nsw i32 %212, -25
  %225 = select i1 %.not.i, i32 -24, i32 %224
  %226 = call float @__ocml_ldexp_f32(float noundef %223, i32 noundef %225) #6
  %227 = fneg contract float %226
  %.not666667.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %228 = select contract i1 %.not666667.i, float %227, float %226
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %221, %214
  %229 = phi float [ %218, %214 ], [ %228, %221 ]
  %230 = zext i16 %.sroa.0234.0.copyload.i to i32
  %231 = lshr i32 %230, 10
  %232 = and i32 %231, 31
  %233 = and i32 %230, 1023
  switch i32 %232, label %239 [
    i32 31, label %234
    i32 0, label %241
  ]

234:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %235 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %233, 0
  %236 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %237 = or disjoint i32 %236, %235
  %238 = bitcast i32 %237 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

239:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %240 = or disjoint i32 %233, 1024
  br label %241

241:                                              ; preds = %239, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %242 = phi i32 [ %240, %239 ], [ %233, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %243 = uitofp i32 %242 to float
  %.not668.i = icmp eq i32 %232, 0
  %244 = add nsw i32 %232, -25
  %245 = select i1 %.not668.i, i32 -24, i32 %244
  %246 = call float @__ocml_ldexp_f32(float noundef %243, i32 noundef %245) #6
  %247 = fneg contract float %246
  %.not669670.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %248 = select contract i1 %.not669670.i, float %247, float %246
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %241, %234
  %249 = phi float [ %238, %234 ], [ %248, %241 ]
  %250 = fmul contract float %229, %249
  %251 = fadd contract float %202, %250
  %252 = or disjoint i64 %201, 1
  %253 = add nuw nsw i64 %252, %192
  %254 = trunc i64 %253 to i32
  %255 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %254
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %255, align 2, !tbaa.struct !19
  %256 = shl nuw nsw i64 %252, 4
  %257 = or disjoint i64 %256, %193
  %258 = trunc i64 %257 to i32
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %191, i32 %258
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %259, align 2, !tbaa.struct !19
  %260 = zext i16 %.sroa.0225.0.copyload.i to i32
  %261 = lshr i32 %260, 10
  %262 = and i32 %261, 31
  %263 = and i32 %260, 1023
  switch i32 %262, label %269 [
    i32 31, label %264
    i32 0, label %271
  ]

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %265 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %263, 0
  %266 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %267 = or disjoint i32 %266, %265
  %268 = bitcast i32 %267 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %270 = or disjoint i32 %263, 1024
  br label %271

271:                                              ; preds = %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %272 = phi i32 [ %270, %269 ], [ %263, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %273 = uitofp i32 %272 to float
  %.not671.i = icmp eq i32 %262, 0
  %274 = add nsw i32 %262, -25
  %275 = select i1 %.not671.i, i32 -24, i32 %274
  %276 = call float @__ocml_ldexp_f32(float noundef %273, i32 noundef %275) #6
  %277 = fneg contract float %276
  %.not672673.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %278 = select contract i1 %.not672673.i, float %277, float %276
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %271, %264
  %279 = phi float [ %268, %264 ], [ %278, %271 ]
  %280 = zext i16 %.sroa.0216.0.copyload.i to i32
  %281 = lshr i32 %280, 10
  %282 = and i32 %281, 31
  %283 = and i32 %280, 1023
  switch i32 %282, label %289 [
    i32 31, label %284
    i32 0, label %291
  ]

284:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %285 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not693.i = icmp eq i32 %283, 0
  %286 = select i1 %.not693.i, i32 2139095040, i32 2143289344
  %287 = or disjoint i32 %286, %285
  %288 = bitcast i32 %287 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

289:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %290 = or disjoint i32 %283, 1024
  br label %291

291:                                              ; preds = %289, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %292 = phi i32 [ %290, %289 ], [ %283, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %293 = uitofp i32 %292 to float
  %.not674.i = icmp eq i32 %282, 0
  %294 = add nsw i32 %282, -25
  %295 = select i1 %.not674.i, i32 -24, i32 %294
  %296 = call float @__ocml_ldexp_f32(float noundef %293, i32 noundef %295) #6
  %297 = fneg contract float %296
  %.not675676.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %298 = select contract i1 %.not675676.i, float %297, float %296
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %291, %284
  %299 = phi float [ %288, %284 ], [ %298, %291 ]
  %300 = fmul contract float %279, %299
  %301 = fadd contract float %251, %300
  %302 = or disjoint i64 %201, 2
  %303 = add nuw nsw i64 %302, %192
  %304 = trunc i64 %303 to i32
  %305 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %304
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %305, align 2, !tbaa.struct !19
  %306 = shl nuw nsw i64 %302, 4
  %307 = or disjoint i64 %306, %193
  %308 = trunc i64 %307 to i32
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %191, i32 %308
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %309, align 2, !tbaa.struct !19
  %310 = zext i16 %.sroa.0207.0.copyload.i to i32
  %311 = lshr i32 %310, 10
  %312 = and i32 %311, 31
  %313 = and i32 %310, 1023
  switch i32 %312, label %319 [
    i32 31, label %314
    i32 0, label %321
  ]

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %315 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %313, 0
  %316 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %317 = or disjoint i32 %316, %315
  %318 = bitcast i32 %317 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %320 = or disjoint i32 %313, 1024
  br label %321

321:                                              ; preds = %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %322 = phi i32 [ %320, %319 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %323 = uitofp i32 %322 to float
  %.not677.i = icmp eq i32 %312, 0
  %324 = add nsw i32 %312, -25
  %325 = select i1 %.not677.i, i32 -24, i32 %324
  %326 = call float @__ocml_ldexp_f32(float noundef %323, i32 noundef %325) #6
  %327 = fneg contract float %326
  %.not678679.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %328 = select contract i1 %.not678679.i, float %327, float %326
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %321, %314
  %329 = phi float [ %318, %314 ], [ %328, %321 ]
  %330 = zext i16 %.sroa.0198.0.copyload.i to i32
  %331 = lshr i32 %330, 10
  %332 = and i32 %331, 31
  %333 = and i32 %330, 1023
  switch i32 %332, label %339 [
    i32 31, label %334
    i32 0, label %341
  ]

334:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %335 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %333, 0
  %336 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %337 = or disjoint i32 %336, %335
  %338 = bitcast i32 %337 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

339:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %340 = or disjoint i32 %333, 1024
  br label %341

341:                                              ; preds = %339, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %342 = phi i32 [ %340, %339 ], [ %333, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %343 = uitofp i32 %342 to float
  %.not680.i = icmp eq i32 %332, 0
  %344 = add nsw i32 %332, -25
  %345 = select i1 %.not680.i, i32 -24, i32 %344
  %346 = call float @__ocml_ldexp_f32(float noundef %343, i32 noundef %345) #6
  %347 = fneg contract float %346
  %.not681682.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %348 = select contract i1 %.not681682.i, float %347, float %346
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %341, %334
  %349 = phi float [ %338, %334 ], [ %348, %341 ]
  %350 = fmul contract float %329, %349
  %351 = fadd contract float %301, %350
  %352 = or disjoint i64 %201, 3
  %353 = add nuw nsw i64 %352, %192
  %354 = trunc i64 %353 to i32
  %355 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %354
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %355, align 2, !tbaa.struct !19
  %356 = shl nuw nsw i64 %352, 4
  %357 = or disjoint i64 %356, %193
  %358 = trunc i64 %357 to i32
  %359 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %191, i32 %358
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %359, align 2, !tbaa.struct !19
  %360 = zext i16 %.sroa.0189.0.copyload.i to i32
  %361 = lshr i32 %360, 10
  %362 = and i32 %361, 31
  %363 = and i32 %360, 1023
  switch i32 %362, label %369 [
    i32 31, label %364
    i32 0, label %371
  ]

364:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %365 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %363, 0
  %366 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %367 = or disjoint i32 %366, %365
  %368 = bitcast i32 %367 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %370 = or disjoint i32 %363, 1024
  br label %371

371:                                              ; preds = %369, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %372 = phi i32 [ %370, %369 ], [ %363, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %373 = uitofp i32 %372 to float
  %.not683.i = icmp eq i32 %362, 0
  %374 = add nsw i32 %362, -25
  %375 = select i1 %.not683.i, i32 -24, i32 %374
  %376 = call float @__ocml_ldexp_f32(float noundef %373, i32 noundef %375) #6
  %377 = fneg contract float %376
  %.not684685.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %378 = select contract i1 %.not684685.i, float %377, float %376
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %371, %364
  %379 = phi float [ %368, %364 ], [ %378, %371 ]
  %380 = zext i16 %.sroa.0180.0.copyload.i to i32
  %381 = lshr i32 %380, 10
  %382 = and i32 %381, 31
  %383 = and i32 %380, 1023
  switch i32 %382, label %389 [
    i32 31, label %384
    i32 0, label %391
  ]

384:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %385 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %383, 0
  %386 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %387 = or disjoint i32 %386, %385
  %388 = bitcast i32 %387 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

389:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %390 = or disjoint i32 %383, 1024
  br label %391

391:                                              ; preds = %389, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %392 = phi i32 [ %390, %389 ], [ %383, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %393 = uitofp i32 %392 to float
  %.not686.i = icmp eq i32 %382, 0
  %394 = add nsw i32 %382, -25
  %395 = select i1 %.not686.i, i32 -24, i32 %394
  %396 = call float @__ocml_ldexp_f32(float noundef %393, i32 noundef %395) #6
  %397 = fneg contract float %396
  %.not687688.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %398 = select contract i1 %.not687688.i, float %397, float %396
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %391, %384
  %399 = phi float [ %388, %384 ], [ %398, %391 ]
  %400 = fmul contract float %379, %399
  %401 = fadd contract float %351, %400
  %402 = add nuw nsw i64 %201, 4
  %403 = icmp ult i64 %201, 12
  br i1 %403, label %200, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, !llvm.loop !30

404:                                              ; preds = %._crit_edge716.i
  %405 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %406 = icmp eq i64 %405, 0
  call void @llvm.assume(i1 %406)
  %407 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %408 = icmp eq i64 %407, 0
  call void @llvm.assume(i1 %408)
  %409 = sext i32 %3 to i64
  %410 = call i32 @llvm.amdgcn.groupstaticsize()
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = zext i32 %30 to i64
  %413 = icmp sgt i32 %4, 0
  %414 = icmp ugt i32 %4, 1
  %415 = icmp ugt i32 %4, 2
  %416 = icmp ugt i32 %4, 3
  %417 = icmp ugt i32 %4, 4
  %418 = icmp ugt i32 %4, 5
  %419 = icmp ugt i32 %4, 6
  %420 = icmp ugt i32 %4, 7
  %421 = icmp ugt i32 %4, 8
  %422 = icmp ugt i32 %4, 9
  %423 = icmp ugt i32 %4, 10
  %424 = icmp ugt i32 %4, 11
  %425 = icmp ugt i32 %4, 12
  %426 = icmp ugt i32 %4, 13
  %427 = icmp ugt i32 %4, 14
  %428 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split718.us.i, %404
  %429 = phi i64 [ 0, %404 ], [ %435, %.split718.us.i ]
  %430 = icmp slt i64 %429, %409
  %431 = shl i64 %429, 4
  %.tr665.i = trunc i64 %429 to i32
  %432 = shl i32 %.tr665.i, 4
  %433 = sext i32 %432 to i64
  %434 = add nsw i64 %433, %412
  %.fr719.i = freeze i1 %430
  %brmerge.not.i = select i1 %.fr719.i, i1 %413, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split718.us.i

.split718.us.i:                                   ; preds = %524, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %435 = add nuw nsw i64 %429, 1
  %exitcond723.not.i = icmp eq i64 %435, 8
  br i1 %exitcond723.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !31

.preheader.split.1.i:                             ; preds = %.preheader.i
  %436 = trunc i64 %431 to i32
  %437 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !28
  %439 = getelementptr inbounds float, ptr %9, i64 %434
  store float %438, ptr %439, align 32, !tbaa !28
  br i1 %414, label %.preheader.split.2.i, label %.split718.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %440 = trunc i64 %431 to i32
  %441 = or disjoint i32 %440, 1
  %442 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %441
  %443 = load float, ptr addrspace(3) %442, align 4, !tbaa !28
  %444 = or disjoint i64 %434, 1
  %445 = getelementptr inbounds float, ptr %9, i64 %444
  store float %443, ptr %445, align 4, !tbaa !28
  br i1 %415, label %.preheader.split.3.i, label %.split718.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %446 = trunc i64 %431 to i32
  %447 = or disjoint i32 %446, 2
  %448 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %447
  %449 = load float, ptr addrspace(3) %448, align 4, !tbaa !28
  %450 = or disjoint i64 %434, 2
  %451 = getelementptr inbounds float, ptr %9, i64 %450
  store float %449, ptr %451, align 8, !tbaa !28
  br i1 %416, label %.preheader.split.4.i, label %.split718.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %452 = trunc i64 %431 to i32
  %453 = or disjoint i32 %452, 3
  %454 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %453
  %455 = load float, ptr addrspace(3) %454, align 4, !tbaa !28
  %456 = or disjoint i64 %434, 3
  %457 = getelementptr inbounds float, ptr %9, i64 %456
  store float %455, ptr %457, align 4, !tbaa !28
  br i1 %417, label %.preheader.split.5.i, label %.split718.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %458 = trunc i64 %431 to i32
  %459 = or disjoint i32 %458, 4
  %460 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %459
  %461 = load float, ptr addrspace(3) %460, align 4, !tbaa !28
  %462 = or disjoint i64 %434, 4
  %463 = getelementptr inbounds float, ptr %9, i64 %462
  store float %461, ptr %463, align 16, !tbaa !28
  br i1 %418, label %.preheader.split.6.i, label %.split718.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %464 = trunc i64 %431 to i32
  %465 = or disjoint i32 %464, 5
  %466 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %465
  %467 = load float, ptr addrspace(3) %466, align 4, !tbaa !28
  %468 = or disjoint i64 %434, 5
  %469 = getelementptr inbounds float, ptr %9, i64 %468
  store float %467, ptr %469, align 4, !tbaa !28
  br i1 %419, label %.preheader.split.7.i, label %.split718.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %470 = trunc i64 %431 to i32
  %471 = or disjoint i32 %470, 6
  %472 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %471
  %473 = load float, ptr addrspace(3) %472, align 4, !tbaa !28
  %474 = or disjoint i64 %434, 6
  %475 = getelementptr inbounds float, ptr %9, i64 %474
  store float %473, ptr %475, align 8, !tbaa !28
  br i1 %420, label %.preheader.split.8.i, label %.split718.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %476 = trunc i64 %431 to i32
  %477 = or disjoint i32 %476, 7
  %478 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %477
  %479 = load float, ptr addrspace(3) %478, align 4, !tbaa !28
  %480 = or disjoint i64 %434, 7
  %481 = getelementptr inbounds float, ptr %9, i64 %480
  store float %479, ptr %481, align 4, !tbaa !28
  br i1 %421, label %.preheader.split.9.i, label %.split718.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %482 = trunc i64 %431 to i32
  %483 = or disjoint i32 %482, 8
  %484 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %483
  %485 = load float, ptr addrspace(3) %484, align 4, !tbaa !28
  %486 = or disjoint i64 %434, 8
  %487 = getelementptr inbounds float, ptr %9, i64 %486
  store float %485, ptr %487, align 32, !tbaa !28
  br i1 %422, label %.preheader.split.10.i, label %.split718.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %488 = trunc i64 %431 to i32
  %489 = or disjoint i32 %488, 9
  %490 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %489
  %491 = load float, ptr addrspace(3) %490, align 4, !tbaa !28
  %492 = or disjoint i64 %434, 9
  %493 = getelementptr inbounds float, ptr %9, i64 %492
  store float %491, ptr %493, align 4, !tbaa !28
  br i1 %423, label %.preheader.split.11.i, label %.split718.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %494 = trunc i64 %431 to i32
  %495 = or disjoint i32 %494, 10
  %496 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %495
  %497 = load float, ptr addrspace(3) %496, align 4, !tbaa !28
  %498 = or disjoint i64 %434, 10
  %499 = getelementptr inbounds float, ptr %9, i64 %498
  store float %497, ptr %499, align 8, !tbaa !28
  br i1 %424, label %.preheader.split.12.i, label %.split718.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %500 = trunc i64 %431 to i32
  %501 = or disjoint i32 %500, 11
  %502 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %501
  %503 = load float, ptr addrspace(3) %502, align 4, !tbaa !28
  %504 = or disjoint i64 %434, 11
  %505 = getelementptr inbounds float, ptr %9, i64 %504
  store float %503, ptr %505, align 4, !tbaa !28
  br i1 %425, label %.preheader.split.13.i, label %.split718.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %506 = trunc i64 %431 to i32
  %507 = or disjoint i32 %506, 12
  %508 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %507
  %509 = load float, ptr addrspace(3) %508, align 4, !tbaa !28
  %510 = or disjoint i64 %434, 12
  %511 = getelementptr inbounds float, ptr %9, i64 %510
  store float %509, ptr %511, align 16, !tbaa !28
  br i1 %426, label %.preheader.split.14.i, label %.split718.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %512 = trunc i64 %431 to i32
  %513 = or disjoint i32 %512, 13
  %514 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %513
  %515 = load float, ptr addrspace(3) %514, align 4, !tbaa !28
  %516 = or disjoint i64 %434, 13
  %517 = getelementptr inbounds float, ptr %9, i64 %516
  store float %515, ptr %517, align 4, !tbaa !28
  br i1 %427, label %.preheader.split.15.i, label %.split718.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %518 = trunc i64 %431 to i32
  %519 = or disjoint i32 %518, 14
  %520 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %519
  %521 = load float, ptr addrspace(3) %520, align 4, !tbaa !28
  %522 = or disjoint i64 %434, 14
  %523 = getelementptr inbounds float, ptr %9, i64 %522
  store float %521, ptr %523, align 8, !tbaa !28
  br i1 %428, label %524, label %.split718.us.i

524:                                              ; preds = %.preheader.split.15.i
  %525 = trunc i64 %431 to i32
  %526 = or disjoint i32 %525, 15
  %527 = getelementptr inbounds float, ptr addrspace(3) %411, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !28
  %529 = or disjoint i64 %434, 15
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 4, !tbaa !28
  br label %.split718.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge716.i, %.split718.us.i
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
!28 = !{!29, !29, i64 0}
!29 = !{!"float", !22, i64 0}
!30 = distinct !{!30, !25}
!31 = distinct !{!31, !25}
;----------------- End AdaptiveCpp IR dump ---------------
