;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882025/tmp/triton-sycl-cache/compile-4uf879bh/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 16777215
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 128
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.lr.ph709.i

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
  br i1 %exitcond.not.i, label %.lr.ph709.i, label %.preheader703.i, !llvm.loop !24

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

.lr.ph709.i:                                      ; preds = %.split.us.i, %6
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
  %125 = icmp ult i64 %124, 128
  call void @llvm.assume(i1 %125)
  %126 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %127 = inttoptr i32 %126 to ptr addrspace(3)
  %128 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 512
  %129 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 768
  %130 = lshr i64 %124, 4
  %131 = shl nuw nsw i64 %124, 3
  %132 = and i64 %131, 120
  %133 = or disjoint i64 %132, %130
  %134 = trunc i64 %133 to i32
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %134
  %.sroa.0382.0.copyload.i = load i16, ptr addrspace(3) %135, align 2, !tbaa.struct !19
  %136 = trunc i64 %124 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %129, i32 %136
  store i16 %.sroa.0382.0.copyload.i, ptr addrspace(3) %137, align 2, !tbaa.struct !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %139 = icmp eq i64 %138, 0
  call void @llvm.assume(i1 %139)
  %140 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %141 = icmp eq i64 %140, 0
  call void @llvm.assume(i1 %141)
  %142 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %143 = icmp ult i64 %142, 128
  call void @llvm.assume(i1 %143)
  %144 = shl nuw i32 %.tr.i, 8
  %145 = sext i32 %4 to i64
  %146 = sext i32 %5 to i64
  %147 = sext i32 %144 to i64
  %148 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %149 = inttoptr i32 %148 to ptr addrspace(3)
  %150 = getelementptr inbounds i8, ptr addrspace(3) %149, i32 1024
  %151 = and i64 %142, 15
  %152 = icmp slt i64 %151, %146
  br label %163

.lr.ph712.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %154 = icmp eq i64 %153, 0
  call void @llvm.assume(i1 %154)
  %155 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %156 = icmp eq i64 %155, 0
  call void @llvm.assume(i1 %156)
  %157 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %158 = icmp ult i64 %157, 128
  call void @llvm.assume(i1 %158)
  %159 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %160 = inttoptr i32 %159 to ptr addrspace(3)
  %161 = getelementptr inbounds i8, ptr addrspace(3) %160, i32 1024
  %162 = getelementptr inbounds i8, ptr addrspace(3) %160, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i

163:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph709.i
  %164 = phi i64 [ %142, %.lr.ph709.i ], [ %175, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %165 = lshr i64 %164, 4
  %166 = icmp slt i64 %165, %145
  %167 = and i1 %166, %152
  br i1 %167, label %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

168:                                              ; preds = %163
  %169 = and i64 %164, 9223372036854775792
  %170 = or disjoint i64 %169, %147
  %171 = or disjoint i64 %170, %151
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %171
  %.sroa.0284.0.copyload.i = load i16, ptr %172, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %168, %163
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %168 ], [ 0, %163 ]
  %173 = trunc i64 %164 to i32
  %174 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %150, i32 %173
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %174, align 2, !tbaa.struct !19
  %175 = add nuw nsw i64 %164, 128
  %176 = icmp ult i64 %164, 128
  br i1 %176, label %163, label %.lr.ph712.i, !llvm.loop !28

.lr.ph715.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %177 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %178 = icmp eq i64 %177, 0
  call void @llvm.assume(i1 %178)
  %179 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %180 = icmp eq i64 %179, 0
  call void @llvm.assume(i1 %180)
  %181 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %182 = icmp ult i64 %181, 128
  call void @llvm.assume(i1 %182)
  %183 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %184 = inttoptr i32 %183 to ptr addrspace(3)
  %185 = getelementptr inbounds i8, ptr addrspace(3) %184, i32 768
  %186 = getelementptr inbounds i8, ptr addrspace(3) %184, i32 1536
  %187 = and i64 %181, 112
  %188 = and i64 %181, 15
  br label %205

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %.lr.ph712.i
  %189 = phi i64 [ %157, %.lr.ph712.i ], [ %198, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i ]
  %190 = lshr i64 %189, 4
  %191 = shl nuw nsw i64 %189, 4
  %192 = and i64 %191, 240
  %193 = or disjoint i64 %192, %190
  %194 = trunc i64 %193 to i32
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %161, i32 %194
  %.sroa.0383.0.copyload.i = load i16, ptr addrspace(3) %195, align 2, !tbaa.struct !19
  %196 = trunc i64 %189 to i32
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %196
  store i16 %.sroa.0383.0.copyload.i, ptr addrspace(3) %197, align 2, !tbaa.struct !19
  %198 = add nuw nsw i64 %189, 128
  %199 = icmp ult i64 %189, 128
  br i1 %199, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, label %.lr.ph715.i, !llvm.loop !29

._crit_edge716.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %200 = trunc i64 %181 to i32
  %201 = getelementptr inbounds float, ptr addrspace(3) %184, i32 %200
  store float %406, ptr addrspace(3) %201, align 4, !tbaa !30
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %202 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %203 = icmp ult i64 %202, 128
  call void @llvm.assume(i1 %203)
  %204 = icmp eq i64 %202, 0
  br i1 %204, label %409, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

205:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph715.i
  %206 = phi i64 [ 0, %.lr.ph715.i ], [ %407, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %207 = phi float [ 0.000000e+00, %.lr.ph715.i ], [ %406, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %208 = add nuw nsw i64 %206, %187
  %209 = trunc i64 %208 to i32
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %185, i32 %209
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %210, align 2, !tbaa.struct !19
  %211 = shl nuw nsw i64 %206, 4
  %212 = or disjoint i64 %211, %188
  %213 = trunc i64 %212 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %186, i32 %213
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %214, align 2, !tbaa.struct !19
  %215 = zext i16 %.sroa.0243.0.copyload.i to i32
  %216 = lshr i32 %215, 10
  %217 = and i32 %216, 31
  %218 = and i32 %215, 1023
  switch i32 %217, label %224 [
    i32 31, label %219
    i32 0, label %226
  ]

219:                                              ; preds = %205
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %220 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %218, 0
  %221 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %222 = or disjoint i32 %221, %220
  %223 = bitcast i32 %222 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

224:                                              ; preds = %205
  %225 = or disjoint i32 %218, 1024
  br label %226

226:                                              ; preds = %224, %205
  %227 = phi i32 [ %225, %224 ], [ %218, %205 ]
  %228 = uitofp i32 %227 to float
  %.not.i = icmp eq i32 %217, 0
  %229 = add nsw i32 %217, -25
  %230 = select i1 %.not.i, i32 -24, i32 %229
  %231 = call float @__ocml_ldexp_f32(float noundef %228, i32 noundef %230) #6
  %232 = fneg contract float %231
  %.not666667.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %233 = select contract i1 %.not666667.i, float %232, float %231
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %226, %219
  %234 = phi float [ %223, %219 ], [ %233, %226 ]
  %235 = zext i16 %.sroa.0234.0.copyload.i to i32
  %236 = lshr i32 %235, 10
  %237 = and i32 %236, 31
  %238 = and i32 %235, 1023
  switch i32 %237, label %244 [
    i32 31, label %239
    i32 0, label %246
  ]

239:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %240 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %238, 0
  %241 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %242 = or disjoint i32 %241, %240
  %243 = bitcast i32 %242 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %245 = or disjoint i32 %238, 1024
  br label %246

246:                                              ; preds = %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %247 = phi i32 [ %245, %244 ], [ %238, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %248 = uitofp i32 %247 to float
  %.not668.i = icmp eq i32 %237, 0
  %249 = add nsw i32 %237, -25
  %250 = select i1 %.not668.i, i32 -24, i32 %249
  %251 = call float @__ocml_ldexp_f32(float noundef %248, i32 noundef %250) #6
  %252 = fneg contract float %251
  %.not669670.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %253 = select contract i1 %.not669670.i, float %252, float %251
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %246, %239
  %254 = phi float [ %243, %239 ], [ %253, %246 ]
  %255 = fmul contract float %234, %254
  %256 = fadd contract float %207, %255
  %257 = or disjoint i64 %206, 1
  %258 = add nuw nsw i64 %257, %187
  %259 = trunc i64 %258 to i32
  %260 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %185, i32 %259
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %260, align 2, !tbaa.struct !19
  %261 = shl nuw nsw i64 %257, 4
  %262 = or disjoint i64 %261, %188
  %263 = trunc i64 %262 to i32
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %186, i32 %263
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %264, align 2, !tbaa.struct !19
  %265 = zext i16 %.sroa.0225.0.copyload.i to i32
  %266 = lshr i32 %265, 10
  %267 = and i32 %266, 31
  %268 = and i32 %265, 1023
  switch i32 %267, label %274 [
    i32 31, label %269
    i32 0, label %276
  ]

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %270 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %268, 0
  %271 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %272 = or disjoint i32 %271, %270
  %273 = bitcast i32 %272 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %275 = or disjoint i32 %268, 1024
  br label %276

276:                                              ; preds = %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %277 = phi i32 [ %275, %274 ], [ %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %278 = uitofp i32 %277 to float
  %.not671.i = icmp eq i32 %267, 0
  %279 = add nsw i32 %267, -25
  %280 = select i1 %.not671.i, i32 -24, i32 %279
  %281 = call float @__ocml_ldexp_f32(float noundef %278, i32 noundef %280) #6
  %282 = fneg contract float %281
  %.not672673.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %283 = select contract i1 %.not672673.i, float %282, float %281
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %276, %269
  %284 = phi float [ %273, %269 ], [ %283, %276 ]
  %285 = zext i16 %.sroa.0216.0.copyload.i to i32
  %286 = lshr i32 %285, 10
  %287 = and i32 %286, 31
  %288 = and i32 %285, 1023
  switch i32 %287, label %294 [
    i32 31, label %289
    i32 0, label %296
  ]

289:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %290 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not693.i = icmp eq i32 %288, 0
  %291 = select i1 %.not693.i, i32 2139095040, i32 2143289344
  %292 = or disjoint i32 %291, %290
  %293 = bitcast i32 %292 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %295 = or disjoint i32 %288, 1024
  br label %296

296:                                              ; preds = %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %297 = phi i32 [ %295, %294 ], [ %288, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %298 = uitofp i32 %297 to float
  %.not674.i = icmp eq i32 %287, 0
  %299 = add nsw i32 %287, -25
  %300 = select i1 %.not674.i, i32 -24, i32 %299
  %301 = call float @__ocml_ldexp_f32(float noundef %298, i32 noundef %300) #6
  %302 = fneg contract float %301
  %.not675676.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %303 = select contract i1 %.not675676.i, float %302, float %301
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %296, %289
  %304 = phi float [ %293, %289 ], [ %303, %296 ]
  %305 = fmul contract float %284, %304
  %306 = fadd contract float %256, %305
  %307 = or disjoint i64 %206, 2
  %308 = add nuw nsw i64 %307, %187
  %309 = trunc i64 %308 to i32
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %185, i32 %309
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %310, align 2, !tbaa.struct !19
  %311 = shl nuw nsw i64 %307, 4
  %312 = or disjoint i64 %311, %188
  %313 = trunc i64 %312 to i32
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %186, i32 %313
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %314, align 2, !tbaa.struct !19
  %315 = zext i16 %.sroa.0207.0.copyload.i to i32
  %316 = lshr i32 %315, 10
  %317 = and i32 %316, 31
  %318 = and i32 %315, 1023
  switch i32 %317, label %324 [
    i32 31, label %319
    i32 0, label %326
  ]

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %320 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %318, 0
  %321 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %322 = or disjoint i32 %321, %320
  %323 = bitcast i32 %322 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %325 = or disjoint i32 %318, 1024
  br label %326

326:                                              ; preds = %324, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %327 = phi i32 [ %325, %324 ], [ %318, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %328 = uitofp i32 %327 to float
  %.not677.i = icmp eq i32 %317, 0
  %329 = add nsw i32 %317, -25
  %330 = select i1 %.not677.i, i32 -24, i32 %329
  %331 = call float @__ocml_ldexp_f32(float noundef %328, i32 noundef %330) #6
  %332 = fneg contract float %331
  %.not678679.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %333 = select contract i1 %.not678679.i, float %332, float %331
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %326, %319
  %334 = phi float [ %323, %319 ], [ %333, %326 ]
  %335 = zext i16 %.sroa.0198.0.copyload.i to i32
  %336 = lshr i32 %335, 10
  %337 = and i32 %336, 31
  %338 = and i32 %335, 1023
  switch i32 %337, label %344 [
    i32 31, label %339
    i32 0, label %346
  ]

339:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %340 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %338, 0
  %341 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %342 = or disjoint i32 %341, %340
  %343 = bitcast i32 %342 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %345 = or disjoint i32 %338, 1024
  br label %346

346:                                              ; preds = %344, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %347 = phi i32 [ %345, %344 ], [ %338, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %348 = uitofp i32 %347 to float
  %.not680.i = icmp eq i32 %337, 0
  %349 = add nsw i32 %337, -25
  %350 = select i1 %.not680.i, i32 -24, i32 %349
  %351 = call float @__ocml_ldexp_f32(float noundef %348, i32 noundef %350) #6
  %352 = fneg contract float %351
  %.not681682.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %353 = select contract i1 %.not681682.i, float %352, float %351
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %346, %339
  %354 = phi float [ %343, %339 ], [ %353, %346 ]
  %355 = fmul contract float %334, %354
  %356 = fadd contract float %306, %355
  %357 = or disjoint i64 %206, 3
  %358 = add nuw nsw i64 %357, %187
  %359 = trunc i64 %358 to i32
  %360 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %185, i32 %359
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %360, align 2, !tbaa.struct !19
  %361 = shl nuw nsw i64 %357, 4
  %362 = or disjoint i64 %361, %188
  %363 = trunc i64 %362 to i32
  %364 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %186, i32 %363
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %364, align 2, !tbaa.struct !19
  %365 = zext i16 %.sroa.0189.0.copyload.i to i32
  %366 = lshr i32 %365, 10
  %367 = and i32 %366, 31
  %368 = and i32 %365, 1023
  switch i32 %367, label %374 [
    i32 31, label %369
    i32 0, label %376
  ]

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %370 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %368, 0
  %371 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %372 = or disjoint i32 %371, %370
  %373 = bitcast i32 %372 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

374:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %375 = or disjoint i32 %368, 1024
  br label %376

376:                                              ; preds = %374, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %377 = phi i32 [ %375, %374 ], [ %368, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %378 = uitofp i32 %377 to float
  %.not683.i = icmp eq i32 %367, 0
  %379 = add nsw i32 %367, -25
  %380 = select i1 %.not683.i, i32 -24, i32 %379
  %381 = call float @__ocml_ldexp_f32(float noundef %378, i32 noundef %380) #6
  %382 = fneg contract float %381
  %.not684685.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %383 = select contract i1 %.not684685.i, float %382, float %381
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %376, %369
  %384 = phi float [ %373, %369 ], [ %383, %376 ]
  %385 = zext i16 %.sroa.0180.0.copyload.i to i32
  %386 = lshr i32 %385, 10
  %387 = and i32 %386, 31
  %388 = and i32 %385, 1023
  switch i32 %387, label %394 [
    i32 31, label %389
    i32 0, label %396
  ]

389:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %390 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %388, 0
  %391 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %392 = or disjoint i32 %391, %390
  %393 = bitcast i32 %392 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %395 = or disjoint i32 %388, 1024
  br label %396

396:                                              ; preds = %394, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %397 = phi i32 [ %395, %394 ], [ %388, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %398 = uitofp i32 %397 to float
  %.not686.i = icmp eq i32 %387, 0
  %399 = add nsw i32 %387, -25
  %400 = select i1 %.not686.i, i32 -24, i32 %399
  %401 = call float @__ocml_ldexp_f32(float noundef %398, i32 noundef %400) #6
  %402 = fneg contract float %401
  %.not687688.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %403 = select contract i1 %.not687688.i, float %402, float %401
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %396, %389
  %404 = phi float [ %393, %389 ], [ %403, %396 ]
  %405 = fmul contract float %384, %404
  %406 = fadd contract float %356, %405
  %407 = add nuw nsw i64 %206, 4
  %408 = icmp ult i64 %206, 12
  br i1 %408, label %205, label %._crit_edge716.i, !llvm.loop !32

409:                                              ; preds = %._crit_edge716.i
  %410 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %411 = icmp eq i64 %410, 0
  call void @llvm.assume(i1 %411)
  %412 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %413 = icmp eq i64 %412, 0
  call void @llvm.assume(i1 %413)
  %414 = sext i32 %3 to i64
  %415 = call i32 @llvm.amdgcn.groupstaticsize()
  %416 = inttoptr i32 %415 to ptr addrspace(3)
  %417 = zext i32 %30 to i64
  %418 = icmp sgt i32 %4, 0
  %419 = icmp ugt i32 %4, 1
  %420 = icmp ugt i32 %4, 2
  %421 = icmp ugt i32 %4, 3
  %422 = icmp ugt i32 %4, 4
  %423 = icmp ugt i32 %4, 5
  %424 = icmp ugt i32 %4, 6
  %425 = icmp ugt i32 %4, 7
  %426 = icmp ugt i32 %4, 8
  %427 = icmp ugt i32 %4, 9
  %428 = icmp ugt i32 %4, 10
  %429 = icmp ugt i32 %4, 11
  %430 = icmp ugt i32 %4, 12
  %431 = icmp ugt i32 %4, 13
  %432 = icmp ugt i32 %4, 14
  %433 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split718.us.i, %409
  %434 = phi i64 [ 0, %409 ], [ %440, %.split718.us.i ]
  %435 = icmp slt i64 %434, %414
  %436 = shl i64 %434, 4
  %.tr665.i = trunc i64 %434 to i32
  %437 = shl i32 %.tr665.i, 4
  %438 = sext i32 %437 to i64
  %439 = add nsw i64 %438, %417
  %.fr719.i = freeze i1 %435
  %brmerge.not.i = select i1 %.fr719.i, i1 %418, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split718.us.i

.split718.us.i:                                   ; preds = %529, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %440 = add nuw nsw i64 %434, 1
  %exitcond723.not.i = icmp eq i64 %440, 8
  br i1 %exitcond723.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %441 = trunc i64 %436 to i32
  %442 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %441
  %443 = load float, ptr addrspace(3) %442, align 4, !tbaa !30
  %444 = getelementptr inbounds float, ptr %9, i64 %439
  store float %443, ptr %444, align 32, !tbaa !30
  br i1 %419, label %.preheader.split.2.i, label %.split718.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %445 = trunc i64 %436 to i32
  %446 = or disjoint i32 %445, 1
  %447 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %446
  %448 = load float, ptr addrspace(3) %447, align 4, !tbaa !30
  %449 = or disjoint i64 %439, 1
  %450 = getelementptr inbounds float, ptr %9, i64 %449
  store float %448, ptr %450, align 4, !tbaa !30
  br i1 %420, label %.preheader.split.3.i, label %.split718.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %451 = trunc i64 %436 to i32
  %452 = or disjoint i32 %451, 2
  %453 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %452
  %454 = load float, ptr addrspace(3) %453, align 4, !tbaa !30
  %455 = or disjoint i64 %439, 2
  %456 = getelementptr inbounds float, ptr %9, i64 %455
  store float %454, ptr %456, align 8, !tbaa !30
  br i1 %421, label %.preheader.split.4.i, label %.split718.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %457 = trunc i64 %436 to i32
  %458 = or disjoint i32 %457, 3
  %459 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %458
  %460 = load float, ptr addrspace(3) %459, align 4, !tbaa !30
  %461 = or disjoint i64 %439, 3
  %462 = getelementptr inbounds float, ptr %9, i64 %461
  store float %460, ptr %462, align 4, !tbaa !30
  br i1 %422, label %.preheader.split.5.i, label %.split718.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %463 = trunc i64 %436 to i32
  %464 = or disjoint i32 %463, 4
  %465 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %464
  %466 = load float, ptr addrspace(3) %465, align 4, !tbaa !30
  %467 = or disjoint i64 %439, 4
  %468 = getelementptr inbounds float, ptr %9, i64 %467
  store float %466, ptr %468, align 16, !tbaa !30
  br i1 %423, label %.preheader.split.6.i, label %.split718.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %469 = trunc i64 %436 to i32
  %470 = or disjoint i32 %469, 5
  %471 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %470
  %472 = load float, ptr addrspace(3) %471, align 4, !tbaa !30
  %473 = or disjoint i64 %439, 5
  %474 = getelementptr inbounds float, ptr %9, i64 %473
  store float %472, ptr %474, align 4, !tbaa !30
  br i1 %424, label %.preheader.split.7.i, label %.split718.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %475 = trunc i64 %436 to i32
  %476 = or disjoint i32 %475, 6
  %477 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !30
  %479 = or disjoint i64 %439, 6
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 8, !tbaa !30
  br i1 %425, label %.preheader.split.8.i, label %.split718.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %481 = trunc i64 %436 to i32
  %482 = or disjoint i32 %481, 7
  %483 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !30
  %485 = or disjoint i64 %439, 7
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 4, !tbaa !30
  br i1 %426, label %.preheader.split.9.i, label %.split718.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %487 = trunc i64 %436 to i32
  %488 = or disjoint i32 %487, 8
  %489 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !30
  %491 = or disjoint i64 %439, 8
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 32, !tbaa !30
  br i1 %427, label %.preheader.split.10.i, label %.split718.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %493 = trunc i64 %436 to i32
  %494 = or disjoint i32 %493, 9
  %495 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !30
  %497 = or disjoint i64 %439, 9
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 4, !tbaa !30
  br i1 %428, label %.preheader.split.11.i, label %.split718.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %499 = trunc i64 %436 to i32
  %500 = or disjoint i32 %499, 10
  %501 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %500
  %502 = load float, ptr addrspace(3) %501, align 4, !tbaa !30
  %503 = or disjoint i64 %439, 10
  %504 = getelementptr inbounds float, ptr %9, i64 %503
  store float %502, ptr %504, align 8, !tbaa !30
  br i1 %429, label %.preheader.split.12.i, label %.split718.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %505 = trunc i64 %436 to i32
  %506 = or disjoint i32 %505, 11
  %507 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %506
  %508 = load float, ptr addrspace(3) %507, align 4, !tbaa !30
  %509 = or disjoint i64 %439, 11
  %510 = getelementptr inbounds float, ptr %9, i64 %509
  store float %508, ptr %510, align 4, !tbaa !30
  br i1 %430, label %.preheader.split.13.i, label %.split718.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %511 = trunc i64 %436 to i32
  %512 = or disjoint i32 %511, 12
  %513 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %512
  %514 = load float, ptr addrspace(3) %513, align 4, !tbaa !30
  %515 = or disjoint i64 %439, 12
  %516 = getelementptr inbounds float, ptr %9, i64 %515
  store float %514, ptr %516, align 16, !tbaa !30
  br i1 %431, label %.preheader.split.14.i, label %.split718.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %517 = trunc i64 %436 to i32
  %518 = or disjoint i32 %517, 13
  %519 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %518
  %520 = load float, ptr addrspace(3) %519, align 4, !tbaa !30
  %521 = or disjoint i64 %439, 13
  %522 = getelementptr inbounds float, ptr %9, i64 %521
  store float %520, ptr %522, align 4, !tbaa !30
  br i1 %432, label %.preheader.split.15.i, label %.split718.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %523 = trunc i64 %436 to i32
  %524 = or disjoint i32 %523, 14
  %525 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !30
  %527 = or disjoint i64 %439, 14
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 8, !tbaa !30
  br i1 %433, label %529, label %.split718.us.i

529:                                              ; preds = %.preheader.split.15.i
  %530 = trunc i64 %436 to i32
  %531 = or disjoint i32 %530, 15
  %532 = getelementptr inbounds float, ptr addrspace(3) %416, i32 %531
  %533 = load float, ptr addrspace(3) %532, align 4, !tbaa !30
  %534 = or disjoint i64 %439, 15
  %535 = getelementptr inbounds float, ptr %9, i64 %534
  store float %533, ptr %535, align 4, !tbaa !30
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
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
!30 = !{!31, !31, i64 0}
!31 = !{!"float", !22, i64 0}
!32 = distinct !{!32, !25}
!33 = distinct !{!33, !25}
;----------------- End AdaptiveCpp IR dump ---------------
