;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-tr6gw_by/kernel.cpp"
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
  br i1 %43, label %44, label %.lr.ph490.i

44:                                               ; preds = %._crit_edge.i
  %45 = shl i32 %.tr.i, 10
  %46 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = sext i32 %5 to i64
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 512
  %54 = sext i32 %45 to i64
  %55 = icmp sgt i32 %3, 0
  %56 = icmp ugt i32 %3, 1
  %57 = icmp ugt i32 %3, 2
  %58 = icmp ugt i32 %3, 3
  %59 = icmp ugt i32 %3, 4
  %60 = icmp ugt i32 %3, 5
  %61 = icmp ugt i32 %3, 6
  %62 = icmp ugt i32 %3, 7
  br label %.preheader483.i

.preheader483.i:                                  ; preds = %.split.us.i, %44
  %63 = phi i64 [ 0, %44 ], [ %73, %.split.us.i ]
  %64 = icmp slt i64 %63, %50
  %65 = shl i64 %63, 3
  %.tr477.i = trunc i64 %63 to i32
  %66 = shl i32 %.tr477.i, 3
  %67 = sext i32 %66 to i64
  %68 = add nsw i64 %67, %54
  %.fr.i = freeze i1 %64
  br i1 %.fr.i, label %.preheader483.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.i: ; preds = %.preheader483.i
  %.tr511.i = trunc i64 %63 to i32
  %69 = shl i32 %.tr511.i, 4
  %70 = add i32 %69, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %52, i32 %70
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader483.split.preheader.i:                  ; preds = %.preheader483.i
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.thread.i: ; preds = %.preheader483.split.preheader.i
  %71 = trunc i64 %65 to i32
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %71
  store i16 0, ptr addrspace(3) %72, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.i
  %73 = add nuw nsw i64 %63, 1
  %exitcond.not.i = icmp eq i64 %73, 128
  br i1 %exitcond.not.i, label %.lr.ph490.i, label %.preheader483.i, !llvm.loop !26

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i: ; preds = %.preheader483.split.preheader.i
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0239.0.copyload.i = load i16, ptr %74, align 16, !tbaa.struct !23
  %75 = trunc i64 %65 to i32
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %75
  store i16 %.sroa.0239.0.copyload.i, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.thread.i
  %77 = trunc i64 %65 to i32
  %78 = or disjoint i32 %77, 1
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %78
  store i16 0, ptr addrspace(3) %79, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i
  %80 = or disjoint i64 %68, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %80
  %.sroa.0239.0.copyload.1.i = load i16, ptr %81, align 2, !tbaa.struct !23
  %82 = trunc i64 %65 to i32
  %83 = or disjoint i32 %82, 1
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %83
  store i16 %.sroa.0239.0.copyload.1.i, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i
  %85 = trunc i64 %65 to i32
  %86 = or disjoint i32 %85, 2
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %86
  store i16 0, ptr addrspace(3) %87, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i
  %88 = or disjoint i64 %68, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %88
  %.sroa.0239.0.copyload.2.i = load i16, ptr %89, align 4, !tbaa.struct !23
  %90 = trunc i64 %65 to i32
  %91 = or disjoint i32 %90, 2
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %91
  store i16 %.sroa.0239.0.copyload.2.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i
  %93 = trunc i64 %65 to i32
  %94 = or disjoint i32 %93, 3
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %94
  store i16 0, ptr addrspace(3) %95, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i
  %96 = or disjoint i64 %68, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %96
  %.sroa.0239.0.copyload.3.i = load i16, ptr %97, align 2, !tbaa.struct !23
  %98 = trunc i64 %65 to i32
  %99 = or disjoint i32 %98, 3
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %99
  store i16 %.sroa.0239.0.copyload.3.i, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i
  %101 = trunc i64 %65 to i32
  %102 = or disjoint i32 %101, 4
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %102
  store i16 0, ptr addrspace(3) %103, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i
  %104 = or disjoint i64 %68, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0239.0.copyload.4.i = load i16, ptr %105, align 8, !tbaa.struct !23
  %106 = trunc i64 %65 to i32
  %107 = or disjoint i32 %106, 4
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %107
  store i16 %.sroa.0239.0.copyload.4.i, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i
  %109 = trunc i64 %65 to i32
  %110 = or disjoint i32 %109, 5
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %110
  store i16 0, ptr addrspace(3) %111, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i
  %112 = or disjoint i64 %68, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %112
  %.sroa.0239.0.copyload.5.i = load i16, ptr %113, align 2, !tbaa.struct !23
  %114 = trunc i64 %65 to i32
  %115 = or disjoint i32 %114, 5
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %115
  store i16 %.sroa.0239.0.copyload.5.i, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i
  %117 = trunc i64 %65 to i32
  %118 = or disjoint i32 %117, 6
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %118
  store i16 0, ptr addrspace(3) %119, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i
  %120 = or disjoint i64 %68, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %120
  %.sroa.0239.0.copyload.6.i = load i16, ptr %121, align 4, !tbaa.struct !23
  %122 = trunc i64 %65 to i32
  %123 = or disjoint i32 %122, 6
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %123
  store i16 %.sroa.0239.0.copyload.6.i, ptr addrspace(3) %124, align 2, !tbaa.struct !23
  br i1 %62, label %125, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

125:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i
  %126 = or disjoint i64 %68, 7
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %126
  %.sroa.0239.0.copyload.7.i = load i16, ptr %127, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i: ; preds = %125, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i
  %.sroa.0241.2.7.i = phi i16 [ %.sroa.0239.0.copyload.7.i, %125 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i ]
  %128 = trunc i64 %65 to i32
  %129 = or disjoint i32 %128, 7
  %130 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %129
  store i16 %.sroa.0241.2.7.i, ptr addrspace(3) %130, align 2, !tbaa.struct !23
  br label %.split.us.i

.lr.ph490.i:                                      ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %131 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %132 = icmp eq i64 %131, 0
  call void @llvm.assume(i1 %132)
  %133 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %134 = icmp eq i64 %133, 0
  call void @llvm.assume(i1 %134)
  %135 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %136 = icmp ult i64 %135, 256
  call void @llvm.assume(i1 %136)
  %137 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %138 = inttoptr i32 %137 to ptr addrspace(3)
  %139 = getelementptr inbounds i8, ptr addrspace(3) %138, i32 512
  %140 = getelementptr inbounds i8, ptr addrspace(3) %138, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge491.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %142 = icmp ult i64 %141, 256
  call void @llvm.assume(i1 %142)
  %143 = icmp eq i64 %141, 0
  br i1 %143, label %155, label %.loopexit.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph490.i
  %144 = phi i64 [ %135, %.lr.ph490.i ], [ %153, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %145 = lshr i64 %144, 7
  %146 = shl nuw nsw i64 %144, 3
  %147 = and i64 %146, 1016
  %148 = or disjoint i64 %147, %145
  %149 = trunc i64 %148 to i32
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %139, i32 %149
  %.sroa.0294.0.copyload.i = load i16, ptr addrspace(3) %150, align 2, !tbaa.struct !23
  %151 = trunc i64 %144 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %151
  store i16 %.sroa.0294.0.copyload.i, ptr addrspace(3) %152, align 2, !tbaa.struct !23
  %153 = add nuw nsw i64 %144, 256
  %154 = icmp ult i64 %144, 768
  br i1 %154, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge491.i, !llvm.loop !30

155:                                              ; preds = %._crit_edge491.i
  %156 = shl i32 %.tr.i, 11
  %157 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %158 = icmp eq i64 %157, 0
  call void @llvm.assume(i1 %158)
  %159 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %160 = icmp eq i64 %159, 0
  call void @llvm.assume(i1 %160)
  %161 = sext i32 %5 to i64
  %162 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %163 = inttoptr i32 %162 to ptr addrspace(3)
  %164 = getelementptr inbounds i8, ptr addrspace(3) %163, i32 4608
  %165 = sext i32 %156 to i64
  %166 = icmp sgt i32 %4, 0
  %167 = icmp ugt i32 %4, 1
  %168 = icmp ugt i32 %4, 2
  %169 = icmp ugt i32 %4, 3
  %170 = icmp ugt i32 %4, 4
  %171 = icmp ugt i32 %4, 5
  %172 = icmp ugt i32 %4, 6
  %173 = icmp ugt i32 %4, 7
  %174 = icmp ugt i32 %4, 8
  %175 = icmp ugt i32 %4, 9
  %176 = icmp ugt i32 %4, 10
  %177 = icmp ugt i32 %4, 11
  %178 = icmp ugt i32 %4, 12
  %179 = icmp ugt i32 %4, 13
  %180 = icmp ugt i32 %4, 14
  %181 = icmp ugt i32 %4, 15
  br label %.preheader482.i

.preheader482.i:                                  ; preds = %.split493.us.i, %155
  %182 = phi i64 [ 0, %155 ], [ %192, %.split493.us.i ]
  %183 = icmp slt i64 %182, %161
  %184 = shl i64 %182, 4
  %.tr476.i = trunc i64 %182 to i32
  %185 = shl i32 %.tr476.i, 4
  %186 = sext i32 %185 to i64
  %187 = add nsw i64 %186, %165
  %.fr494.i = freeze i1 %183
  br i1 %.fr494.i, label %.preheader482.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader482.i
  %.tr510.i = trunc i64 %182 to i32
  %188 = shl i32 %.tr510.i, 5
  %189 = add i32 %188, 4608
  %scevgep504.i = getelementptr i8, ptr addrspace(3) %163, i32 %189
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep504.i, i8 0, i32 32, i1 false)
  br label %.split493.us.i

.preheader482.split.preheader.i:                  ; preds = %.preheader482.i
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader482.split.preheader.i
  %190 = trunc i64 %184 to i32
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %190
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split493.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %192 = add nuw nsw i64 %182, 1
  %exitcond506.not.i = icmp eq i64 %192, 128
  br i1 %exitcond506.not.i, label %.loopexit.i, label %.preheader482.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader482.split.preheader.i
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %187
  %.sroa.0202.0.copyload.i = load i16, ptr %193, align 32, !tbaa.struct !23
  %194 = trunc i64 %184 to i32
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %194
  store i16 %.sroa.0202.0.copyload.i, ptr addrspace(3) %195, align 2, !tbaa.struct !23
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %196 = trunc i64 %184 to i32
  %197 = or disjoint i32 %196, 1
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %197
  store i16 0, ptr addrspace(3) %198, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %199 = or disjoint i64 %187, 1
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %199
  %.sroa.0202.0.copyload.1.i = load i16, ptr %200, align 2, !tbaa.struct !23
  %201 = trunc i64 %184 to i32
  %202 = or disjoint i32 %201, 1
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %202
  store i16 %.sroa.0202.0.copyload.1.i, ptr addrspace(3) %203, align 2, !tbaa.struct !23
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %204 = trunc i64 %184 to i32
  %205 = or disjoint i32 %204, 2
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %205
  store i16 0, ptr addrspace(3) %206, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %207 = or disjoint i64 %187, 2
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %207
  %.sroa.0202.0.copyload.2.i = load i16, ptr %208, align 4, !tbaa.struct !23
  %209 = trunc i64 %184 to i32
  %210 = or disjoint i32 %209, 2
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %210
  store i16 %.sroa.0202.0.copyload.2.i, ptr addrspace(3) %211, align 2, !tbaa.struct !23
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %212 = trunc i64 %184 to i32
  %213 = or disjoint i32 %212, 3
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %213
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %215 = or disjoint i64 %187, 3
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %215
  %.sroa.0202.0.copyload.3.i = load i16, ptr %216, align 2, !tbaa.struct !23
  %217 = trunc i64 %184 to i32
  %218 = or disjoint i32 %217, 3
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %218
  store i16 %.sroa.0202.0.copyload.3.i, ptr addrspace(3) %219, align 2, !tbaa.struct !23
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %220 = trunc i64 %184 to i32
  %221 = or disjoint i32 %220, 4
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %221
  store i16 0, ptr addrspace(3) %222, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %223 = or disjoint i64 %187, 4
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %223
  %.sroa.0202.0.copyload.4.i = load i16, ptr %224, align 8, !tbaa.struct !23
  %225 = trunc i64 %184 to i32
  %226 = or disjoint i32 %225, 4
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %226
  store i16 %.sroa.0202.0.copyload.4.i, ptr addrspace(3) %227, align 2, !tbaa.struct !23
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %228 = trunc i64 %184 to i32
  %229 = or disjoint i32 %228, 5
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %229
  store i16 0, ptr addrspace(3) %230, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %231 = or disjoint i64 %187, 5
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %231
  %.sroa.0202.0.copyload.5.i = load i16, ptr %232, align 2, !tbaa.struct !23
  %233 = trunc i64 %184 to i32
  %234 = or disjoint i32 %233, 5
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %234
  store i16 %.sroa.0202.0.copyload.5.i, ptr addrspace(3) %235, align 2, !tbaa.struct !23
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %236 = trunc i64 %184 to i32
  %237 = or disjoint i32 %236, 6
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %237
  store i16 0, ptr addrspace(3) %238, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %239 = or disjoint i64 %187, 6
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %239
  %.sroa.0202.0.copyload.6.i = load i16, ptr %240, align 4, !tbaa.struct !23
  %241 = trunc i64 %184 to i32
  %242 = or disjoint i32 %241, 6
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %242
  store i16 %.sroa.0202.0.copyload.6.i, ptr addrspace(3) %243, align 2, !tbaa.struct !23
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %244 = trunc i64 %184 to i32
  %245 = or disjoint i32 %244, 7
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %245
  store i16 0, ptr addrspace(3) %246, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %247 = or disjoint i64 %187, 7
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %247
  %.sroa.0202.0.copyload.7.i = load i16, ptr %248, align 2, !tbaa.struct !23
  %249 = trunc i64 %184 to i32
  %250 = or disjoint i32 %249, 7
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %250
  store i16 %.sroa.0202.0.copyload.7.i, ptr addrspace(3) %251, align 2, !tbaa.struct !23
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %252 = trunc i64 %184 to i32
  %253 = or disjoint i32 %252, 8
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %253
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %255 = or disjoint i64 %187, 8
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %255
  %.sroa.0202.0.copyload.8.i = load i16, ptr %256, align 16, !tbaa.struct !23
  %257 = trunc i64 %184 to i32
  %258 = or disjoint i32 %257, 8
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %258
  store i16 %.sroa.0202.0.copyload.8.i, ptr addrspace(3) %259, align 2, !tbaa.struct !23
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %260 = trunc i64 %184 to i32
  %261 = or disjoint i32 %260, 9
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %261
  store i16 0, ptr addrspace(3) %262, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %263 = or disjoint i64 %187, 9
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %263
  %.sroa.0202.0.copyload.9.i = load i16, ptr %264, align 2, !tbaa.struct !23
  %265 = trunc i64 %184 to i32
  %266 = or disjoint i32 %265, 9
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %266
  store i16 %.sroa.0202.0.copyload.9.i, ptr addrspace(3) %267, align 2, !tbaa.struct !23
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %268 = trunc i64 %184 to i32
  %269 = or disjoint i32 %268, 10
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %269
  store i16 0, ptr addrspace(3) %270, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %271 = or disjoint i64 %187, 10
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %271
  %.sroa.0202.0.copyload.10.i = load i16, ptr %272, align 4, !tbaa.struct !23
  %273 = trunc i64 %184 to i32
  %274 = or disjoint i32 %273, 10
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %274
  store i16 %.sroa.0202.0.copyload.10.i, ptr addrspace(3) %275, align 2, !tbaa.struct !23
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %276 = trunc i64 %184 to i32
  %277 = or disjoint i32 %276, 11
  %278 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %277
  store i16 0, ptr addrspace(3) %278, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %279 = or disjoint i64 %187, 11
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %279
  %.sroa.0202.0.copyload.11.i = load i16, ptr %280, align 2, !tbaa.struct !23
  %281 = trunc i64 %184 to i32
  %282 = or disjoint i32 %281, 11
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %282
  store i16 %.sroa.0202.0.copyload.11.i, ptr addrspace(3) %283, align 2, !tbaa.struct !23
  br i1 %178, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %284 = trunc i64 %184 to i32
  %285 = or disjoint i32 %284, 12
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %285
  store i16 0, ptr addrspace(3) %286, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %287 = or disjoint i64 %187, 12
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %287
  %.sroa.0202.0.copyload.12.i = load i16, ptr %288, align 8, !tbaa.struct !23
  %289 = trunc i64 %184 to i32
  %290 = or disjoint i32 %289, 12
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %290
  store i16 %.sroa.0202.0.copyload.12.i, ptr addrspace(3) %291, align 2, !tbaa.struct !23
  br i1 %179, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %292 = trunc i64 %184 to i32
  %293 = or disjoint i32 %292, 13
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %293
  store i16 0, ptr addrspace(3) %294, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %295 = or disjoint i64 %187, 13
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %295
  %.sroa.0202.0.copyload.13.i = load i16, ptr %296, align 2, !tbaa.struct !23
  %297 = trunc i64 %184 to i32
  %298 = or disjoint i32 %297, 13
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %298
  store i16 %.sroa.0202.0.copyload.13.i, ptr addrspace(3) %299, align 2, !tbaa.struct !23
  br i1 %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %300 = trunc i64 %184 to i32
  %301 = or disjoint i32 %300, 14
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %301
  store i16 0, ptr addrspace(3) %302, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %303 = or disjoint i64 %187, 14
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %303
  %.sroa.0202.0.copyload.14.i = load i16, ptr %304, align 4, !tbaa.struct !23
  %305 = trunc i64 %184 to i32
  %306 = or disjoint i32 %305, 14
  %307 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %306
  store i16 %.sroa.0202.0.copyload.14.i, ptr addrspace(3) %307, align 2, !tbaa.struct !23
  br i1 %181, label %308, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

308:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %309 = or disjoint i64 %187, 15
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %309
  %.sroa.0202.0.copyload.15.i = load i16, ptr %310, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %308, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0204.2.15.i = phi i16 [ %.sroa.0202.0.copyload.15.i, %308 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %311 = trunc i64 %184 to i32
  %312 = or disjoint i32 %311, 15
  %313 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %312
  store i16 %.sroa.0204.2.15.i, ptr addrspace(3) %313, align 2, !tbaa.struct !23
  br label %.split493.us.i

.loopexit.i:                                      ; preds = %.split493.us.i, %._crit_edge491.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %314 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %315 = icmp eq i64 %314, 0
  call void @llvm.assume(i1 %315)
  %316 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %317 = icmp eq i64 %316, 0
  call void @llvm.assume(i1 %317)
  %318 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %319 = icmp ult i64 %318, 256
  call void @llvm.assume(i1 %319)
  %320 = icmp ult i64 %318, 128
  br i1 %320, label %.lr.ph496.i, label %._crit_edge497.i

.lr.ph496.i:                                      ; preds = %.loopexit.i
  %321 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %322 = inttoptr i32 %321 to ptr addrspace(3)
  %323 = getelementptr inbounds i8, ptr addrspace(3) %322, i32 2560
  %324 = getelementptr inbounds i8, ptr addrspace(3) %322, i32 4608
  %325 = and i64 %318, 15
  %326 = trunc i64 %318 to i32
  %327 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %326
  %328 = load float, ptr addrspace(3) %327, align 4, !tbaa !19
  %329 = shl nuw nsw i64 %318, 3
  %330 = and i64 %329, 896
  br label %335

._crit_edge497.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.loopexit.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %331 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %332 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %333 = icmp ult i64 %332, 256
  call void @llvm.assume(i1 %333)
  %334 = icmp eq i64 %332, 0
  br i1 %334, label %388, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %386, ptr addrspace(3) %327, align 4, !tbaa !19
  br label %._crit_edge497.i

335:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph496.i
  %336 = phi i64 [ 0, %.lr.ph496.i ], [ %387, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %337 = phi float [ %328, %.lr.ph496.i ], [ %386, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %338 = add nuw nsw i64 %336, %330
  %339 = trunc i64 %338 to i32
  %340 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %323, i32 %339
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %340, align 2, !tbaa.struct !23
  %341 = shl nuw nsw i64 %336, 4
  %342 = or disjoint i64 %341, %325
  %343 = trunc i64 %342 to i32
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %324, i32 %343
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %344, align 2, !tbaa.struct !23
  %345 = zext i16 %.sroa.0185.0.copyload.i to i32
  %346 = lshr i32 %345, 10
  %347 = and i32 %346, 31
  %348 = and i32 %345, 1023
  switch i32 %347, label %354 [
    i32 31, label %349
    i32 0, label %356
  ]

349:                                              ; preds = %335
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %350 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not475.i = icmp eq i32 %348, 0
  %351 = select i1 %.not475.i, i32 2139095040, i32 2143289344
  %352 = or disjoint i32 %351, %350
  %353 = bitcast i32 %352 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

354:                                              ; preds = %335
  %355 = or disjoint i32 %348, 1024
  br label %356

356:                                              ; preds = %354, %335
  %357 = phi i32 [ %355, %354 ], [ %348, %335 ]
  %358 = uitofp i32 %357 to float
  %.not.i = icmp eq i32 %347, 0
  %359 = add nsw i32 %347, -25
  %360 = select i1 %.not.i, i32 -24, i32 %359
  %361 = call float @__ocml_ldexp_f32(float noundef %358, i32 noundef %360) #6
  %362 = fneg contract float %361
  %.not469470.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %363 = select contract i1 %.not469470.i, float %362, float %361
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %356, %349
  %364 = phi float [ %353, %349 ], [ %363, %356 ]
  %365 = zext i16 %.sroa.0176.0.copyload.i to i32
  %366 = lshr i32 %365, 10
  %367 = and i32 %366, 31
  %368 = and i32 %365, 1023
  switch i32 %367, label %374 [
    i32 31, label %369
    i32 0, label %376
  ]

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %370 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not474.i = icmp eq i32 %368, 0
  %371 = select i1 %.not474.i, i32 2139095040, i32 2143289344
  %372 = or disjoint i32 %371, %370
  %373 = bitcast i32 %372 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

374:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %375 = or disjoint i32 %368, 1024
  br label %376

376:                                              ; preds = %374, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %377 = phi i32 [ %375, %374 ], [ %368, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %378 = uitofp i32 %377 to float
  %.not471.i = icmp eq i32 %367, 0
  %379 = add nsw i32 %367, -25
  %380 = select i1 %.not471.i, i32 -24, i32 %379
  %381 = call float @__ocml_ldexp_f32(float noundef %378, i32 noundef %380) #6
  %382 = fneg contract float %381
  %.not472473.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %383 = select contract i1 %.not472473.i, float %382, float %381
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %376, %369
  %384 = phi float [ %373, %369 ], [ %383, %376 ]
  %385 = fmul contract float %364, %384
  %386 = fadd contract float %337, %385
  %387 = add nuw nsw i64 %336, 1
  %exitcond507.not.i = icmp eq i64 %387, 128
  br i1 %exitcond507.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %335, !llvm.loop !32

388:                                              ; preds = %._crit_edge497.i
  %389 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %390 = icmp eq i64 %389, 0
  call void @llvm.assume(i1 %390)
  %391 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %392 = icmp eq i64 %391, 0
  call void @llvm.assume(i1 %392)
  %393 = sext i32 %3 to i64
  %394 = call i32 @llvm.amdgcn.groupstaticsize()
  %395 = inttoptr i32 %394 to ptr addrspace(3)
  %396 = icmp sgt i32 %4, 0
  %397 = icmp ugt i32 %4, 1
  %398 = icmp ugt i32 %4, 2
  %399 = icmp ugt i32 %4, 3
  %400 = icmp ugt i32 %4, 4
  %401 = icmp ugt i32 %4, 5
  %402 = icmp ugt i32 %4, 6
  %403 = icmp ugt i32 %4, 7
  %404 = icmp ugt i32 %4, 8
  %405 = icmp ugt i32 %4, 9
  %406 = icmp ugt i32 %4, 10
  %407 = icmp ugt i32 %4, 11
  %408 = icmp ugt i32 %4, 12
  %409 = icmp ugt i32 %4, 13
  %410 = icmp ugt i32 %4, 14
  %411 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split499.us.i, %388
  %412 = phi i64 [ 0, %388 ], [ %418, %.split499.us.i ]
  %413 = icmp slt i64 %412, %393
  %414 = shl i64 %412, 4
  %.tr468.i = trunc i64 %412 to i32
  %415 = shl i32 %.tr468.i, 4
  %416 = sext i32 %415 to i64
  %417 = add nsw i64 %331, %416
  %.fr500.i = freeze i1 %413
  %brmerge.not.i = select i1 %.fr500.i, i1 %396, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split499.us.i

.split499.us.i:                                   ; preds = %507, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %418 = add nuw nsw i64 %412, 1
  %exitcond509.not.i = icmp eq i64 %418, 8
  br i1 %exitcond509.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %419 = trunc i64 %414 to i32
  %420 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !19
  %422 = getelementptr inbounds float, ptr %9, i64 %417
  store float %421, ptr %422, align 32, !tbaa !19
  br i1 %397, label %.preheader.split.2.i, label %.split499.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %423 = trunc i64 %414 to i32
  %424 = or disjoint i32 %423, 1
  %425 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !19
  %427 = or disjoint i64 %417, 1
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 4, !tbaa !19
  br i1 %398, label %.preheader.split.3.i, label %.split499.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %429 = trunc i64 %414 to i32
  %430 = or disjoint i32 %429, 2
  %431 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !19
  %433 = or disjoint i64 %417, 2
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 8, !tbaa !19
  br i1 %399, label %.preheader.split.4.i, label %.split499.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %435 = trunc i64 %414 to i32
  %436 = or disjoint i32 %435, 3
  %437 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !19
  %439 = or disjoint i64 %417, 3
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 4, !tbaa !19
  br i1 %400, label %.preheader.split.5.i, label %.split499.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %441 = trunc i64 %414 to i32
  %442 = or disjoint i32 %441, 4
  %443 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !19
  %445 = or disjoint i64 %417, 4
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 16, !tbaa !19
  br i1 %401, label %.preheader.split.6.i, label %.split499.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %447 = trunc i64 %414 to i32
  %448 = or disjoint i32 %447, 5
  %449 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !19
  %451 = or disjoint i64 %417, 5
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 4, !tbaa !19
  br i1 %402, label %.preheader.split.7.i, label %.split499.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %453 = trunc i64 %414 to i32
  %454 = or disjoint i32 %453, 6
  %455 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !19
  %457 = or disjoint i64 %417, 6
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 8, !tbaa !19
  br i1 %403, label %.preheader.split.8.i, label %.split499.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %459 = trunc i64 %414 to i32
  %460 = or disjoint i32 %459, 7
  %461 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !19
  %463 = or disjoint i64 %417, 7
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 4, !tbaa !19
  br i1 %404, label %.preheader.split.9.i, label %.split499.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %465 = trunc i64 %414 to i32
  %466 = or disjoint i32 %465, 8
  %467 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !19
  %469 = or disjoint i64 %417, 8
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 32, !tbaa !19
  br i1 %405, label %.preheader.split.10.i, label %.split499.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %471 = trunc i64 %414 to i32
  %472 = or disjoint i32 %471, 9
  %473 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !19
  %475 = or disjoint i64 %417, 9
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 4, !tbaa !19
  br i1 %406, label %.preheader.split.11.i, label %.split499.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %477 = trunc i64 %414 to i32
  %478 = or disjoint i32 %477, 10
  %479 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !19
  %481 = or disjoint i64 %417, 10
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 8, !tbaa !19
  br i1 %407, label %.preheader.split.12.i, label %.split499.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %483 = trunc i64 %414 to i32
  %484 = or disjoint i32 %483, 11
  %485 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !19
  %487 = or disjoint i64 %417, 11
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 4, !tbaa !19
  br i1 %408, label %.preheader.split.13.i, label %.split499.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %489 = trunc i64 %414 to i32
  %490 = or disjoint i32 %489, 12
  %491 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !19
  %493 = or disjoint i64 %417, 12
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 16, !tbaa !19
  br i1 %409, label %.preheader.split.14.i, label %.split499.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %495 = trunc i64 %414 to i32
  %496 = or disjoint i32 %495, 13
  %497 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !19
  %499 = or disjoint i64 %417, 13
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 4, !tbaa !19
  br i1 %410, label %.preheader.split.15.i, label %.split499.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %501 = trunc i64 %414 to i32
  %502 = or disjoint i32 %501, 14
  %503 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !19
  %505 = or disjoint i64 %417, 14
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 8, !tbaa !19
  br i1 %411, label %507, label %.split499.us.i

507:                                              ; preds = %.preheader.split.15.i
  %508 = trunc i64 %414 to i32
  %509 = or disjoint i32 %508, 15
  %510 = getelementptr inbounds float, ptr addrspace(3) %395, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !19
  %512 = or disjoint i64 %417, 15
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 4, !tbaa !19
  br label %.split499.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge497.i, %.split499.us.i
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
!31 = distinct !{!31, !27, !28, !29}
!32 = distinct !{!32, !27}
!33 = distinct !{!33, !27}
;----------------- End AdaptiveCpp IR dump ---------------
