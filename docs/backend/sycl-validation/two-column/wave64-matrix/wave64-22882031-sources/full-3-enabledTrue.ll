;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-qg78pppi/kernel.cpp"
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
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !14
  %11 = icmp ult i64 %10, 715827882
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 3
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 715827883
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
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
  %36 = icmp eq i64 %35, 0
  call void @llvm.assume(i1 %36)
  %37 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %38 = icmp eq i64 %37, 0
  call void @llvm.assume(i1 %38)
  %39 = sext i32 %5 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = sext i32 %30 to i64
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
  br i1 %.fr.i, label %.preheader703.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader703.i
  %.tr724.i = trunc i64 %52 to i32
  %58 = shl i32 %.tr724.i, 4
  %59 = add i32 %58, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %59
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader703.split.preheader.i:                  ; preds = %.preheader703.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader703.split.preheader.i
  %60 = trunc i64 %54 to i32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %60
  store i16 0, ptr addrspace(3) %61, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %62 = add nuw nsw i64 %52, 1
  %exitcond.not.i = icmp eq i64 %62, 16
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader703.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader703.split.preheader.i
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0321.0.copyload.i = load i16, ptr %63, align 16, !tbaa.struct !23
  %64 = trunc i64 %54 to i32
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %64
  store i16 %.sroa.0321.0.copyload.i, ptr addrspace(3) %65, align 2, !tbaa.struct !23
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %66 = trunc i64 %54 to i32
  %67 = or disjoint i32 %66, 1
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %67
  store i16 0, ptr addrspace(3) %68, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %69 = or disjoint i64 %57, 1
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %69
  %.sroa.0321.0.copyload.1.i = load i16, ptr %70, align 2, !tbaa.struct !23
  %71 = trunc i64 %54 to i32
  %72 = or disjoint i32 %71, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0321.0.copyload.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !23
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %74 = trunc i64 %54 to i32
  %75 = or disjoint i32 %74, 2
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %77 = or disjoint i64 %57, 2
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0321.0.copyload.2.i = load i16, ptr %78, align 4, !tbaa.struct !23
  %79 = trunc i64 %54 to i32
  %80 = or disjoint i32 %79, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0321.0.copyload.2.i, ptr addrspace(3) %81, align 2, !tbaa.struct !23
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %82 = trunc i64 %54 to i32
  %83 = or disjoint i32 %82, 3
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %85 = or disjoint i64 %57, 3
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0321.0.copyload.3.i = load i16, ptr %86, align 2, !tbaa.struct !23
  %87 = trunc i64 %54 to i32
  %88 = or disjoint i32 %87, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0321.0.copyload.3.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %90 = trunc i64 %54 to i32
  %91 = or disjoint i32 %90, 4
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %93 = or disjoint i64 %57, 4
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0321.0.copyload.4.i = load i16, ptr %94, align 8, !tbaa.struct !23
  %95 = trunc i64 %54 to i32
  %96 = or disjoint i32 %95, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0321.0.copyload.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %98 = trunc i64 %54 to i32
  %99 = or disjoint i32 %98, 5
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %101 = or disjoint i64 %57, 5
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0321.0.copyload.5.i = load i16, ptr %102, align 2, !tbaa.struct !23
  %103 = trunc i64 %54 to i32
  %104 = or disjoint i32 %103, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0321.0.copyload.5.i, ptr addrspace(3) %105, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %106 = trunc i64 %54 to i32
  %107 = or disjoint i32 %106, 6
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %109 = or disjoint i64 %57, 6
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0321.0.copyload.6.i = load i16, ptr %110, align 4, !tbaa.struct !23
  %111 = trunc i64 %54 to i32
  %112 = or disjoint i32 %111, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0321.0.copyload.6.i, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br i1 %51, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

114:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %115 = or disjoint i64 %57, 7
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0321.0.copyload.7.i = load i16, ptr %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %114, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %.sroa.0323.2.7.i = phi i16 [ %.sroa.0321.0.copyload.7.i, %114 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i ]
  %117 = trunc i64 %54 to i32
  %118 = or disjoint i32 %117, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %118
  store i16 %.sroa.0323.2.7.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
  br label %.split.us.i

.lr.ph.i:                                         ; preds = %.split.us.i, %6
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
  %125 = icmp ult i64 %124, 3
  call void @llvm.assume(i1 %125)
  %126 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %127 = inttoptr i32 %126 to ptr addrspace(3)
  %128 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 512
  %129 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i

.lr.ph709.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %131 = icmp eq i64 %130, 0
  call void @llvm.assume(i1 %131)
  %132 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %133 = icmp eq i64 %132, 0
  call void @llvm.assume(i1 %133)
  %134 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %135 = icmp ult i64 %134, 3
  call void @llvm.assume(i1 %135)
  %136 = shl i32 %.tr.i, 8
  %137 = sext i32 %4 to i64
  %138 = sext i32 %5 to i64
  %139 = sext i32 %136 to i64
  %140 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %141 = inttoptr i32 %140 to ptr addrspace(3)
  %142 = getelementptr inbounds i8, ptr addrspace(3) %141, i32 1024
  br label %164

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i, %.lr.ph.i
  %143 = phi i64 [ %124, %.lr.ph.i ], [ %152, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i ]
  %144 = lshr i64 %143, 4
  %145 = shl nuw nsw i64 %143, 3
  %146 = and i64 %145, 120
  %147 = or disjoint i64 %146, %144
  %148 = trunc i64 %147 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %148
  %.sroa.0383.0.copyload.i = load i16, ptr addrspace(3) %149, align 2, !tbaa.struct !23
  %150 = trunc i64 %143 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %129, i32 %150
  store i16 %.sroa.0383.0.copyload.i, ptr addrspace(3) %151, align 2, !tbaa.struct !23
  %152 = add nuw nsw i64 %143, 3
  %153 = icmp ult i64 %143, 125
  br i1 %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i, label %.lr.ph709.i, !llvm.loop !32

.lr.ph712.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %155 = icmp eq i64 %154, 0
  call void @llvm.assume(i1 %155)
  %156 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %157 = icmp eq i64 %156, 0
  call void @llvm.assume(i1 %157)
  %158 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %159 = icmp ult i64 %158, 3
  call void @llvm.assume(i1 %159)
  %160 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %161 = inttoptr i32 %160 to ptr addrspace(3)
  %162 = getelementptr inbounds i8, ptr addrspace(3) %161, i32 1024
  %163 = getelementptr inbounds i8, ptr addrspace(3) %161, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i

164:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i, %.lr.ph709.i
  %165 = phi i64 [ %134, %.lr.ph709.i ], [ %178, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i ]
  %166 = lshr i64 %165, 4
  %167 = and i64 %165, 15
  %168 = icmp slt i64 %166, %137
  %169 = icmp slt i64 %167, %138
  %170 = and i1 %168, %169
  br i1 %170, label %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i

171:                                              ; preds = %164
  %172 = and i64 %165, 9223372036854775792
  %173 = or disjoint i64 %172, %139
  %174 = or disjoint i64 %173, %167
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %174
  %.sroa.0284.0.copyload.i = load i16, ptr %175, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i: ; preds = %171, %164
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %171 ], [ 0, %164 ]
  %176 = trunc i64 %165 to i32
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %176
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %177, align 2, !tbaa.struct !23
  %178 = add nuw nsw i64 %165, 3
  %179 = icmp ult i64 %165, 253
  br i1 %179, label %164, label %.lr.ph712.i, !llvm.loop !33

.lr.ph715.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i
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
  %185 = icmp ult i64 %184, 3
  call void @llvm.assume(i1 %185)
  %186 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %187 = inttoptr i32 %186 to ptr addrspace(3)
  %188 = getelementptr inbounds i8, ptr addrspace(3) %187, i32 768
  %189 = getelementptr inbounds i8, ptr addrspace(3) %187, i32 1536
  br label %204

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, %.lr.ph712.i
  %190 = phi i64 [ %158, %.lr.ph712.i ], [ %199, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i ]
  %191 = lshr i64 %190, 4
  %192 = shl nuw nsw i64 %190, 4
  %193 = and i64 %192, 240
  %194 = or disjoint i64 %193, %191
  %195 = trunc i64 %194 to i32
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %195
  %.sroa.0382.0.copyload.i = load i16, ptr addrspace(3) %196, align 2, !tbaa.struct !23
  %197 = trunc i64 %190 to i32
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %197
  store i16 %.sroa.0382.0.copyload.i, ptr addrspace(3) %198, align 2, !tbaa.struct !23
  %199 = add nuw nsw i64 %190, 3
  %200 = icmp ult i64 %190, 253
  br i1 %200, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, label %.lr.ph715.i, !llvm.loop !34

._crit_edge716.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %201 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %202 = icmp ult i64 %201, 3
  call void @llvm.assume(i1 %202)
  %203 = icmp eq i64 %201, 0
  br i1 %203, label %417, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

204:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.lr.ph715.i
  %205 = phi i64 [ %184, %.lr.ph715.i ], [ %211, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %206 = and i64 %205, 112
  %207 = and i64 %205, 15
  br label %213

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %208 = trunc i64 %205 to i32
  %209 = and i32 %208, 127
  %210 = getelementptr inbounds float, ptr addrspace(3) %187, i32 %209
  store float %414, ptr addrspace(3) %210, align 4, !tbaa !35
  %211 = add nuw nsw i64 %205, 3
  %212 = icmp ult i64 %205, 125
  br i1 %212, label %204, label %._crit_edge716.i, !llvm.loop !37

213:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %204
  %214 = phi i64 [ 0, %204 ], [ %415, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %215 = phi float [ 0.000000e+00, %204 ], [ %414, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %216 = add nuw nsw i64 %214, %206
  %217 = trunc i64 %216 to i32
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %188, i32 %217
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %218, align 2, !tbaa.struct !23
  %219 = shl nuw nsw i64 %214, 4
  %220 = or disjoint i64 %219, %207
  %221 = trunc i64 %220 to i32
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %221
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %222, align 2, !tbaa.struct !23
  %223 = zext i16 %.sroa.0243.0.copyload.i to i32
  %224 = lshr i32 %223, 10
  %225 = and i32 %224, 31
  %226 = and i32 %223, 1023
  switch i32 %225, label %232 [
    i32 31, label %227
    i32 0, label %234
  ]

227:                                              ; preds = %213
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %228 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %226, 0
  %229 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %230 = or disjoint i32 %229, %228
  %231 = bitcast i32 %230 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

232:                                              ; preds = %213
  %233 = or disjoint i32 %226, 1024
  br label %234

234:                                              ; preds = %232, %213
  %235 = phi i32 [ %233, %232 ], [ %226, %213 ]
  %236 = uitofp i32 %235 to float
  %.not.i = icmp eq i32 %225, 0
  %237 = add nsw i32 %225, -25
  %238 = select i1 %.not.i, i32 -24, i32 %237
  %239 = call float @__ocml_ldexp_f32(float noundef %236, i32 noundef %238) #6
  %240 = fneg contract float %239
  %.not666667.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %241 = select contract i1 %.not666667.i, float %240, float %239
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i: ; preds = %234, %227
  %242 = phi float [ %231, %227 ], [ %241, %234 ]
  %243 = zext i16 %.sroa.0234.0.copyload.i to i32
  %244 = lshr i32 %243, 10
  %245 = and i32 %244, 31
  %246 = and i32 %243, 1023
  switch i32 %245, label %252 [
    i32 31, label %247
    i32 0, label %254
  ]

247:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %248 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %246, 0
  %249 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %250 = or disjoint i32 %249, %248
  %251 = bitcast i32 %250 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

252:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %253 = or disjoint i32 %246, 1024
  br label %254

254:                                              ; preds = %252, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %255 = phi i32 [ %253, %252 ], [ %246, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i ]
  %256 = uitofp i32 %255 to float
  %.not668.i = icmp eq i32 %245, 0
  %257 = add nsw i32 %245, -25
  %258 = select i1 %.not668.i, i32 -24, i32 %257
  %259 = call float @__ocml_ldexp_f32(float noundef %256, i32 noundef %258) #6
  %260 = fneg contract float %259
  %.not669670.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %261 = select contract i1 %.not669670.i, float %260, float %259
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i: ; preds = %254, %247
  %262 = phi float [ %251, %247 ], [ %261, %254 ]
  %263 = fmul contract float %242, %262
  %264 = fadd contract float %215, %263
  %265 = or disjoint i64 %214, 1
  %266 = add nuw nsw i64 %265, %206
  %267 = trunc i64 %266 to i32
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %188, i32 %267
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %268, align 2, !tbaa.struct !23
  %269 = shl nuw nsw i64 %265, 4
  %270 = or disjoint i64 %269, %207
  %271 = trunc i64 %270 to i32
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %271
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %272, align 2, !tbaa.struct !23
  %273 = zext i16 %.sroa.0225.0.copyload.i to i32
  %274 = lshr i32 %273, 10
  %275 = and i32 %274, 31
  %276 = and i32 %273, 1023
  switch i32 %275, label %282 [
    i32 31, label %277
    i32 0, label %284
  ]

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %278 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %276, 0
  %279 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %280 = or disjoint i32 %279, %278
  %281 = bitcast i32 %280 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %283 = or disjoint i32 %276, 1024
  br label %284

284:                                              ; preds = %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %285 = phi i32 [ %283, %282 ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i ]
  %286 = uitofp i32 %285 to float
  %.not671.i = icmp eq i32 %275, 0
  %287 = add nsw i32 %275, -25
  %288 = select i1 %.not671.i, i32 -24, i32 %287
  %289 = call float @__ocml_ldexp_f32(float noundef %286, i32 noundef %288) #6
  %290 = fneg contract float %289
  %.not672673.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %291 = select contract i1 %.not672673.i, float %290, float %289
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %284, %277
  %292 = phi float [ %281, %277 ], [ %291, %284 ]
  %293 = zext i16 %.sroa.0216.0.copyload.i to i32
  %294 = lshr i32 %293, 10
  %295 = and i32 %294, 31
  %296 = and i32 %293, 1023
  switch i32 %295, label %302 [
    i32 31, label %297
    i32 0, label %304
  ]

297:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %298 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not693.i = icmp eq i32 %296, 0
  %299 = select i1 %.not693.i, i32 2139095040, i32 2143289344
  %300 = or disjoint i32 %299, %298
  %301 = bitcast i32 %300 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

302:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %303 = or disjoint i32 %296, 1024
  br label %304

304:                                              ; preds = %302, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %305 = phi i32 [ %303, %302 ], [ %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %306 = uitofp i32 %305 to float
  %.not674.i = icmp eq i32 %295, 0
  %307 = add nsw i32 %295, -25
  %308 = select i1 %.not674.i, i32 -24, i32 %307
  %309 = call float @__ocml_ldexp_f32(float noundef %306, i32 noundef %308) #6
  %310 = fneg contract float %309
  %.not675676.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %311 = select contract i1 %.not675676.i, float %310, float %309
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i: ; preds = %304, %297
  %312 = phi float [ %301, %297 ], [ %311, %304 ]
  %313 = fmul contract float %292, %312
  %314 = fadd contract float %264, %313
  %315 = or disjoint i64 %214, 2
  %316 = add nuw nsw i64 %315, %206
  %317 = trunc i64 %316 to i32
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %188, i32 %317
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %318, align 2, !tbaa.struct !23
  %319 = shl nuw nsw i64 %315, 4
  %320 = or disjoint i64 %319, %207
  %321 = trunc i64 %320 to i32
  %322 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %321
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %322, align 2, !tbaa.struct !23
  %323 = zext i16 %.sroa.0207.0.copyload.i to i32
  %324 = lshr i32 %323, 10
  %325 = and i32 %324, 31
  %326 = and i32 %323, 1023
  switch i32 %325, label %332 [
    i32 31, label %327
    i32 0, label %334
  ]

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %328 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %326, 0
  %329 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %330 = or disjoint i32 %329, %328
  %331 = bitcast i32 %330 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

332:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %333 = or disjoint i32 %326, 1024
  br label %334

334:                                              ; preds = %332, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %335 = phi i32 [ %333, %332 ], [ %326, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i ]
  %336 = uitofp i32 %335 to float
  %.not677.i = icmp eq i32 %325, 0
  %337 = add nsw i32 %325, -25
  %338 = select i1 %.not677.i, i32 -24, i32 %337
  %339 = call float @__ocml_ldexp_f32(float noundef %336, i32 noundef %338) #6
  %340 = fneg contract float %339
  %.not678679.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %341 = select contract i1 %.not678679.i, float %340, float %339
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %334, %327
  %342 = phi float [ %331, %327 ], [ %341, %334 ]
  %343 = zext i16 %.sroa.0198.0.copyload.i to i32
  %344 = lshr i32 %343, 10
  %345 = and i32 %344, 31
  %346 = and i32 %343, 1023
  switch i32 %345, label %352 [
    i32 31, label %347
    i32 0, label %354
  ]

347:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %348 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %346, 0
  %349 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %350 = or disjoint i32 %349, %348
  %351 = bitcast i32 %350 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

352:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %353 = or disjoint i32 %346, 1024
  br label %354

354:                                              ; preds = %352, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %355 = phi i32 [ %353, %352 ], [ %346, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %356 = uitofp i32 %355 to float
  %.not680.i = icmp eq i32 %345, 0
  %357 = add nsw i32 %345, -25
  %358 = select i1 %.not680.i, i32 -24, i32 %357
  %359 = call float @__ocml_ldexp_f32(float noundef %356, i32 noundef %358) #6
  %360 = fneg contract float %359
  %.not681682.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %361 = select contract i1 %.not681682.i, float %360, float %359
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i: ; preds = %354, %347
  %362 = phi float [ %351, %347 ], [ %361, %354 ]
  %363 = fmul contract float %342, %362
  %364 = fadd contract float %314, %363
  %365 = or disjoint i64 %214, 3
  %366 = add nuw nsw i64 %365, %206
  %367 = trunc i64 %366 to i32
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %188, i32 %367
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %368, align 2, !tbaa.struct !23
  %369 = shl nuw nsw i64 %365, 4
  %370 = or disjoint i64 %369, %207
  %371 = trunc i64 %370 to i32
  %372 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %371
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %372, align 2, !tbaa.struct !23
  %373 = zext i16 %.sroa.0189.0.copyload.i to i32
  %374 = lshr i32 %373, 10
  %375 = and i32 %374, 31
  %376 = and i32 %373, 1023
  switch i32 %375, label %382 [
    i32 31, label %377
    i32 0, label %384
  ]

377:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %378 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %376, 0
  %379 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %380 = or disjoint i32 %379, %378
  %381 = bitcast i32 %380 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

382:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %383 = or disjoint i32 %376, 1024
  br label %384

384:                                              ; preds = %382, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %385 = phi i32 [ %383, %382 ], [ %376, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i ]
  %386 = uitofp i32 %385 to float
  %.not683.i = icmp eq i32 %375, 0
  %387 = add nsw i32 %375, -25
  %388 = select i1 %.not683.i, i32 -24, i32 %387
  %389 = call float @__ocml_ldexp_f32(float noundef %386, i32 noundef %388) #6
  %390 = fneg contract float %389
  %.not684685.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %391 = select contract i1 %.not684685.i, float %390, float %389
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %384, %377
  %392 = phi float [ %381, %377 ], [ %391, %384 ]
  %393 = zext i16 %.sroa.0180.0.copyload.i to i32
  %394 = lshr i32 %393, 10
  %395 = and i32 %394, 31
  %396 = and i32 %393, 1023
  switch i32 %395, label %402 [
    i32 31, label %397
    i32 0, label %404
  ]

397:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %398 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %396, 0
  %399 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %400 = or disjoint i32 %399, %398
  %401 = bitcast i32 %400 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

402:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %403 = or disjoint i32 %396, 1024
  br label %404

404:                                              ; preds = %402, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %405 = phi i32 [ %403, %402 ], [ %396, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %406 = uitofp i32 %405 to float
  %.not686.i = icmp eq i32 %395, 0
  %407 = add nsw i32 %395, -25
  %408 = select i1 %.not686.i, i32 -24, i32 %407
  %409 = call float @__ocml_ldexp_f32(float noundef %406, i32 noundef %408) #6
  %410 = fneg contract float %409
  %.not687688.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %411 = select contract i1 %.not687688.i, float %410, float %409
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %404, %397
  %412 = phi float [ %401, %397 ], [ %411, %404 ]
  %413 = fmul contract float %392, %412
  %414 = fadd contract float %364, %413
  %415 = add nuw nsw i64 %214, 4
  %416 = icmp ult i64 %214, 12
  br i1 %416, label %213, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !38

417:                                              ; preds = %._crit_edge716.i
  %418 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %419 = icmp eq i64 %418, 0
  call void @llvm.assume(i1 %419)
  %420 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %421 = icmp eq i64 %420, 0
  call void @llvm.assume(i1 %421)
  %422 = sext i32 %3 to i64
  %423 = call i32 @llvm.amdgcn.groupstaticsize()
  %424 = inttoptr i32 %423 to ptr addrspace(3)
  %425 = sext i32 %30 to i64
  %426 = icmp sgt i32 %4, 0
  %427 = icmp ugt i32 %4, 1
  %428 = icmp ugt i32 %4, 2
  %429 = icmp ugt i32 %4, 3
  %430 = icmp ugt i32 %4, 4
  %431 = icmp ugt i32 %4, 5
  %432 = icmp ugt i32 %4, 6
  %433 = icmp ugt i32 %4, 7
  %434 = icmp ugt i32 %4, 8
  %435 = icmp ugt i32 %4, 9
  %436 = icmp ugt i32 %4, 10
  %437 = icmp ugt i32 %4, 11
  %438 = icmp ugt i32 %4, 12
  %439 = icmp ugt i32 %4, 13
  %440 = icmp ugt i32 %4, 14
  %441 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split718.us.i, %417
  %442 = phi i64 [ 0, %417 ], [ %448, %.split718.us.i ]
  %443 = icmp slt i64 %442, %422
  %444 = shl i64 %442, 4
  %.tr665.i = trunc i64 %442 to i32
  %445 = shl i32 %.tr665.i, 4
  %446 = sext i32 %445 to i64
  %447 = add nsw i64 %446, %425
  %.fr719.i = freeze i1 %443
  %brmerge.not.i = select i1 %.fr719.i, i1 %426, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split718.us.i

.split718.us.i:                                   ; preds = %537, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %448 = add nuw nsw i64 %442, 1
  %exitcond723.not.i = icmp eq i64 %448, 8
  br i1 %exitcond723.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %449 = trunc i64 %444 to i32
  %450 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !35
  %452 = getelementptr inbounds float, ptr %9, i64 %447
  store float %451, ptr %452, align 32, !tbaa !35
  br i1 %427, label %.preheader.split.2.i, label %.split718.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %453 = trunc i64 %444 to i32
  %454 = or disjoint i32 %453, 1
  %455 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !35
  %457 = or disjoint i64 %447, 1
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 4, !tbaa !35
  br i1 %428, label %.preheader.split.3.i, label %.split718.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %459 = trunc i64 %444 to i32
  %460 = or disjoint i32 %459, 2
  %461 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !35
  %463 = or disjoint i64 %447, 2
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 8, !tbaa !35
  br i1 %429, label %.preheader.split.4.i, label %.split718.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %465 = trunc i64 %444 to i32
  %466 = or disjoint i32 %465, 3
  %467 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !35
  %469 = or disjoint i64 %447, 3
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 4, !tbaa !35
  br i1 %430, label %.preheader.split.5.i, label %.split718.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %471 = trunc i64 %444 to i32
  %472 = or disjoint i32 %471, 4
  %473 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !35
  %475 = or disjoint i64 %447, 4
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 16, !tbaa !35
  br i1 %431, label %.preheader.split.6.i, label %.split718.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %477 = trunc i64 %444 to i32
  %478 = or disjoint i32 %477, 5
  %479 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !35
  %481 = or disjoint i64 %447, 5
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 4, !tbaa !35
  br i1 %432, label %.preheader.split.7.i, label %.split718.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %483 = trunc i64 %444 to i32
  %484 = or disjoint i32 %483, 6
  %485 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !35
  %487 = or disjoint i64 %447, 6
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 8, !tbaa !35
  br i1 %433, label %.preheader.split.8.i, label %.split718.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %489 = trunc i64 %444 to i32
  %490 = or disjoint i32 %489, 7
  %491 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !35
  %493 = or disjoint i64 %447, 7
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 4, !tbaa !35
  br i1 %434, label %.preheader.split.9.i, label %.split718.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %495 = trunc i64 %444 to i32
  %496 = or disjoint i32 %495, 8
  %497 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !35
  %499 = or disjoint i64 %447, 8
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 32, !tbaa !35
  br i1 %435, label %.preheader.split.10.i, label %.split718.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %501 = trunc i64 %444 to i32
  %502 = or disjoint i32 %501, 9
  %503 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !35
  %505 = or disjoint i64 %447, 9
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 4, !tbaa !35
  br i1 %436, label %.preheader.split.11.i, label %.split718.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %507 = trunc i64 %444 to i32
  %508 = or disjoint i32 %507, 10
  %509 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !35
  %511 = or disjoint i64 %447, 10
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 8, !tbaa !35
  br i1 %437, label %.preheader.split.12.i, label %.split718.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %513 = trunc i64 %444 to i32
  %514 = or disjoint i32 %513, 11
  %515 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %514
  %516 = load float, ptr addrspace(3) %515, align 4, !tbaa !35
  %517 = or disjoint i64 %447, 11
  %518 = getelementptr inbounds float, ptr %9, i64 %517
  store float %516, ptr %518, align 4, !tbaa !35
  br i1 %438, label %.preheader.split.13.i, label %.split718.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %519 = trunc i64 %444 to i32
  %520 = or disjoint i32 %519, 12
  %521 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %520
  %522 = load float, ptr addrspace(3) %521, align 4, !tbaa !35
  %523 = or disjoint i64 %447, 12
  %524 = getelementptr inbounds float, ptr %9, i64 %523
  store float %522, ptr %524, align 16, !tbaa !35
  br i1 %439, label %.preheader.split.14.i, label %.split718.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %525 = trunc i64 %444 to i32
  %526 = or disjoint i32 %525, 13
  %527 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !35
  %529 = or disjoint i64 %447, 13
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 4, !tbaa !35
  br i1 %440, label %.preheader.split.15.i, label %.split718.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %531 = trunc i64 %444 to i32
  %532 = or disjoint i32 %531, 14
  %533 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %532
  %534 = load float, ptr addrspace(3) %533, align 4, !tbaa !35
  %535 = or disjoint i64 %447, 14
  %536 = getelementptr inbounds float, ptr %9, i64 %535
  store float %534, ptr %536, align 8, !tbaa !35
  br i1 %441, label %537, label %.split718.us.i

537:                                              ; preds = %.preheader.split.15.i
  %538 = trunc i64 %444 to i32
  %539 = or disjoint i32 %538, 15
  %540 = getelementptr inbounds float, ptr addrspace(3) %424, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !35
  %542 = or disjoint i64 %447, 15
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 4, !tbaa !35
  br label %.split718.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge716.i, %.split718.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="3,3" }
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
!23 = !{i64 0, i64 2, !24}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C++ TBAA"}
!28 = distinct !{!28, !29, !30, !31}
!29 = !{!"llvm.loop.mustprogress"}
!30 = !{!"llvm.loop.vectorize.width", i32 1}
!31 = !{!"llvm.loop.interleave.count", i32 1}
!32 = distinct !{!32, !29, !30, !31}
!33 = distinct !{!33, !29, !30, !31}
!34 = distinct !{!34, !29, !30, !31}
!35 = !{!36, !36, i64 0}
!36 = !{!"float", !26, i64 0}
!37 = distinct !{!37, !29}
!38 = distinct !{!38, !29}
!39 = distinct !{!39, !29}
;----------------- End AdaptiveCpp IR dump ---------------
