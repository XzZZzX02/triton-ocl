;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882027/tmp/triton-sycl-cache/compile-8hedr1tk/kernel.cpp"
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
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !14
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 33554432
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
  %33 = icmp ult i64 %32, 64
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 33554431
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 64
  call void @llvm.assume(i1 %39)
  %40 = icmp eq i64 %38, 0
  br i1 %40, label %46, label %.lr.ph646.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !23
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !27

46:                                               ; preds = %._crit_edge.i
  %47 = shl i32 %.tr.i, 8
  %48 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %51 = icmp eq i64 %50, 0
  call void @llvm.assume(i1 %51)
  %52 = sext i32 %5 to i64
  %53 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %54 = inttoptr i32 %53 to ptr addrspace(3)
  %55 = getelementptr inbounds i8, ptr addrspace(3) %54, i32 512
  %56 = sext i32 %47 to i64
  %57 = icmp sgt i32 %3, 0
  %58 = icmp ugt i32 %3, 1
  %59 = icmp ugt i32 %3, 2
  %60 = icmp ugt i32 %3, 3
  %61 = icmp ugt i32 %3, 4
  %62 = icmp ugt i32 %3, 5
  %63 = icmp ugt i32 %3, 6
  %64 = icmp ugt i32 %3, 7
  br label %.preheader638.i

.preheader638.i:                                  ; preds = %.split.us.i, %46
  %65 = phi i64 [ 0, %46 ], [ %75, %.split.us.i ]
  %66 = icmp slt i64 %65, %52
  %67 = shl i64 %65, 3
  %.tr632.i = trunc i64 %65 to i32
  %68 = shl i32 %.tr632.i, 3
  %69 = sext i32 %68 to i64
  %70 = add nsw i64 %69, %56
  %.fr.i = freeze i1 %66
  br i1 %.fr.i, label %.preheader638.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i: ; preds = %.preheader638.i
  %.tr671.i = trunc i64 %65 to i32
  %71 = shl i32 %.tr671.i, 4
  %72 = add i32 %71, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %54, i32 %72
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader638.split.preheader.i:                  ; preds = %.preheader638.i
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i: ; preds = %.preheader638.split.preheader.i
  %73 = trunc i64 %67 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %73
  store i16 0, ptr addrspace(3) %74, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.us.preheader.i
  %75 = add nuw nsw i64 %65, 1
  %exitcond.not.i = icmp eq i64 %75, 32
  br i1 %exitcond.not.i, label %.lr.ph646.i, label %.preheader638.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i: ; preds = %.preheader638.split.preheader.i
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0290.0.copyload.i = load i16, ptr %76, align 16, !tbaa.struct !29
  %77 = trunc i64 %67 to i32
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %77
  store i16 %.sroa.0290.0.copyload.i, ptr addrspace(3) %78, align 2, !tbaa.struct !29
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.thread.i
  %79 = trunc i64 %67 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %80
  store i16 0, ptr addrspace(3) %81, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i
  %82 = or disjoint i64 %70, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0290.0.copyload.1.i = load i16, ptr %83, align 2, !tbaa.struct !29
  %84 = trunc i64 %67 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %85
  store i16 %.sroa.0290.0.copyload.1.i, ptr addrspace(3) %86, align 2, !tbaa.struct !29
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.thread.i
  %87 = trunc i64 %67 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.1.i
  %90 = or disjoint i64 %70, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0290.0.copyload.2.i = load i16, ptr %91, align 4, !tbaa.struct !29
  %92 = trunc i64 %67 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %93
  store i16 %.sroa.0290.0.copyload.2.i, ptr addrspace(3) %94, align 2, !tbaa.struct !29
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.thread.i
  %95 = trunc i64 %67 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.2.i
  %98 = or disjoint i64 %70, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0290.0.copyload.3.i = load i16, ptr %99, align 2, !tbaa.struct !29
  %100 = trunc i64 %67 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %101
  store i16 %.sroa.0290.0.copyload.3.i, ptr addrspace(3) %102, align 2, !tbaa.struct !29
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.thread.i
  %103 = trunc i64 %67 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.3.i
  %106 = or disjoint i64 %70, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0290.0.copyload.4.i = load i16, ptr %107, align 8, !tbaa.struct !29
  %108 = trunc i64 %67 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %109
  store i16 %.sroa.0290.0.copyload.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.thread.i
  %111 = trunc i64 %67 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.4.i
  %114 = or disjoint i64 %70, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0290.0.copyload.5.i = load i16, ptr %115, align 2, !tbaa.struct !29
  %116 = trunc i64 %67 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %117
  store i16 %.sroa.0290.0.copyload.5.i, ptr addrspace(3) %118, align 2, !tbaa.struct !29
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.thread.i
  %119 = trunc i64 %67 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.5.i
  %122 = or disjoint i64 %70, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0290.0.copyload.6.i = load i16, ptr %123, align 4, !tbaa.struct !29
  %124 = trunc i64 %67 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %125
  store i16 %.sroa.0290.0.copyload.6.i, ptr addrspace(3) %126, align 2, !tbaa.struct !29
  br i1 %64, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

127:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i
  %128 = or disjoint i64 %70, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0290.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.7.i: ; preds = %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i
  %.sroa.0292.2.7.i = phi i16 [ %.sroa.0290.0.copyload.7.i, %127 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.6.thread.i ]
  %130 = trunc i64 %67 to i32
  %131 = or disjoint i32 %130, 7
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %131
  store i16 %.sroa.0292.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !29
  br label %.split.us.i

.lr.ph646.i:                                      ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %134 = icmp eq i64 %133, 0
  call void @llvm.assume(i1 %134)
  %135 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %136 = icmp eq i64 %135, 0
  call void @llvm.assume(i1 %136)
  %137 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %138 = icmp ult i64 %137, 64
  call void @llvm.assume(i1 %138)
  %139 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %140 = inttoptr i32 %139 to ptr addrspace(3)
  %141 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 512
  %142 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge647.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %144 = icmp ult i64 %143, 64
  call void @llvm.assume(i1 %144)
  %145 = icmp eq i64 %143, 0
  br i1 %145, label %157, label %.lr.ph652.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph646.i
  %146 = phi i64 [ %137, %.lr.ph646.i ], [ %155, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %147 = lshr i64 %146, 5
  %148 = shl nuw nsw i64 %146, 3
  %149 = and i64 %148, 248
  %150 = or disjoint i64 %149, %147
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %151
  %.sroa.0365.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !29
  %153 = trunc i64 %146 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %153
  store i16 %.sroa.0365.0.copyload.i, ptr addrspace(3) %154, align 2, !tbaa.struct !29
  %155 = add nuw nsw i64 %146, 64
  %156 = icmp ult i64 %146, 192
  br i1 %156, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge647.i, !llvm.loop !35

157:                                              ; preds = %._crit_edge647.i
  %158 = shl i32 %.tr.i, 9
  %159 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %160 = icmp eq i64 %159, 0
  call void @llvm.assume(i1 %160)
  %161 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %162 = icmp eq i64 %161, 0
  call void @llvm.assume(i1 %162)
  %163 = sext i32 %4 to i64
  %164 = sext i32 %5 to i64
  %165 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %166 = inttoptr i32 %165 to ptr addrspace(3)
  %167 = getelementptr inbounds i8, ptr addrspace(3) %166, i32 1536
  %168 = sext i32 %158 to i64
  br label %.preheader637.i

.preheader637.i:                                  ; preds = %.split649.us.i, %157
  %169 = phi i64 [ 0, %157 ], [ %177, %.split649.us.i ]
  %170 = icmp slt i64 %169, %163
  %171 = shl i64 %169, 5
  %.tr631.i = trunc i64 %169 to i32
  %172 = shl i32 %.tr631.i, 5
  %173 = sext i32 %172 to i64
  %174 = add nsw i64 %173, %168
  %.fr650.i = freeze i1 %170
  br i1 %.fr650.i, label %.preheader637.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader637.i
  %.tr670.i = trunc i64 %169 to i32
  %175 = shl i32 %.tr670.i, 6
  %176 = add i32 %175, 1536
  %scevgep664.i = getelementptr i8, ptr addrspace(3) %166, i32 %176
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep664.i, i8 0, i32 64, i1 false)
  br label %.split649.us.i

.split649.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %177 = add nuw nsw i64 %169, 1
  %exitcond666.not.i = icmp eq i64 %177, 16
  br i1 %exitcond666.not.i, label %.lr.ph652.i, label %.preheader637.i, !llvm.loop !36

.preheader637.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader637.i
  %178 = phi i64 [ %186, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader637.i ]
  %179 = icmp slt i64 %178, %164
  br i1 %179, label %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

180:                                              ; preds = %.preheader637.split.i
  %181 = add nuw nsw i64 %174, %178
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %181
  %.sroa.0253.0.copyload.i = load i16, ptr %182, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %180, %.preheader637.split.i
  %.sroa.0255.2.i = phi i16 [ %.sroa.0253.0.copyload.i, %180 ], [ 0, %.preheader637.split.i ]
  %183 = add nuw nsw i64 %178, %171
  %184 = trunc i64 %183 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %167, i32 %184
  store i16 %.sroa.0255.2.i, ptr addrspace(3) %185, align 2, !tbaa.struct !29
  %186 = add nuw nsw i64 %178, 1
  %exitcond665.not.i = icmp eq i64 %186, 32
  br i1 %exitcond665.not.i, label %.split649.us.i, label %.preheader637.split.i, !llvm.loop !37

.lr.ph652.i:                                      ; preds = %.split649.us.i, %._crit_edge647.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %187 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %188 = icmp eq i64 %187, 0
  call void @llvm.assume(i1 %188)
  %189 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %190 = icmp eq i64 %189, 0
  call void @llvm.assume(i1 %190)
  %191 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %192 = icmp ult i64 %191, 64
  call void @llvm.assume(i1 %192)
  %193 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %194 = inttoptr i32 %193 to ptr addrspace(3)
  %195 = getelementptr inbounds i8, ptr addrspace(3) %194, i32 1536
  %196 = getelementptr inbounds i8, ptr addrspace(3) %194, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph655.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %197 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %198 = icmp eq i64 %197, 0
  call void @llvm.assume(i1 %198)
  %199 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %200 = icmp eq i64 %199, 0
  call void @llvm.assume(i1 %200)
  %201 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %202 = icmp ult i64 %201, 64
  call void @llvm.assume(i1 %202)
  %203 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %204 = inttoptr i32 %203 to ptr addrspace(3)
  %205 = getelementptr inbounds i8, ptr addrspace(3) %204, i32 1024
  %206 = getelementptr inbounds i8, ptr addrspace(3) %204, i32 2560
  %207 = and i64 %201, 7
  %208 = lshr i64 %201, 3
  %209 = shl nuw nsw i64 %208, 4
  %210 = or disjoint i64 %209, %207
  %211 = trunc i64 %210 to i32
  %212 = getelementptr inbounds float, ptr addrspace(3) %204, i32 %211
  %213 = load float, ptr addrspace(3) %212, align 4, !tbaa !23
  %214 = or disjoint i64 %207, 8
  %215 = or disjoint i64 %209, %214
  %216 = trunc i64 %215 to i32
  %217 = getelementptr inbounds float, ptr addrspace(3) %204, i32 %216
  %218 = load float, ptr addrspace(3) %217, align 4, !tbaa !23
  %219 = shl nuw nsw i64 %208, 5
  br label %234

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph652.i
  %220 = phi i64 [ %191, %.lr.ph652.i ], [ %229, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %221 = lshr i64 %220, 4
  %222 = shl nuw nsw i64 %220, 5
  %223 = and i64 %222, 480
  %224 = or disjoint i64 %223, %221
  %225 = trunc i64 %224 to i32
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %195, i32 %225
  %.sroa.0366.0.copyload.i = load i16, ptr addrspace(3) %226, align 2, !tbaa.struct !29
  %227 = trunc i64 %220 to i32
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %196, i32 %227
  store i16 %.sroa.0366.0.copyload.i, ptr addrspace(3) %228, align 2, !tbaa.struct !29
  %229 = add nuw nsw i64 %220, 64
  %230 = icmp ult i64 %220, 448
  br i1 %230, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph655.i, !llvm.loop !38

._crit_edge656.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %286, ptr addrspace(3) %212, align 4, !tbaa !23
  store float %311, ptr addrspace(3) %217, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %231 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %232 = icmp ult i64 %231, 64
  call void @llvm.assume(i1 %232)
  %233 = icmp eq i64 %231, 0
  br i1 %233, label %313, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

234:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph655.i
  %235 = phi i64 [ 0, %.lr.ph655.i ], [ %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %236 = phi float [ %218, %.lr.ph655.i ], [ %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %237 = phi float [ %213, %.lr.ph655.i ], [ %286, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %238 = add nuw nsw i64 %235, %219
  %239 = trunc i64 %238 to i32
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %205, i32 %239
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %240, align 2, !tbaa.struct !29
  %241 = shl nuw nsw i64 %235, 4
  %242 = or disjoint i64 %241, %207
  %243 = trunc i64 %242 to i32
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %206, i32 %243
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %244, align 2, !tbaa.struct !29
  %245 = zext i16 %.sroa.0204.0.copyload.i to i32
  %246 = lshr i32 %245, 10
  %247 = and i32 %246, 31
  %248 = and i32 %245, 1023
  switch i32 %247, label %254 [
    i32 31, label %249
    i32 0, label %256
  ]

249:                                              ; preds = %234
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %250 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not630.i = icmp eq i32 %248, 0
  %251 = select i1 %.not630.i, i32 2139095040, i32 2143289344
  %252 = or disjoint i32 %251, %250
  %253 = bitcast i32 %252 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

254:                                              ; preds = %234
  %255 = or disjoint i32 %248, 1024
  br label %256

256:                                              ; preds = %254, %234
  %257 = phi i32 [ %255, %254 ], [ %248, %234 ]
  %258 = uitofp i32 %257 to float
  %.not.i = icmp eq i32 %247, 0
  %259 = add nsw i32 %247, -25
  %260 = select i1 %.not.i, i32 -24, i32 %259
  %261 = call float @__ocml_ldexp_f32(float noundef %258, i32 noundef %260) #6
  %262 = fneg contract float %261
  %.not620621.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %263 = select contract i1 %.not620621.i, float %262, float %261
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %256, %249
  %264 = phi float [ %253, %249 ], [ %263, %256 ]
  %265 = zext i16 %.sroa.0195.0.copyload.i to i32
  %266 = lshr i32 %265, 10
  %267 = and i32 %266, 31
  %268 = and i32 %265, 1023
  switch i32 %267, label %274 [
    i32 31, label %269
    i32 0, label %276
  ]

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %270 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not629.i = icmp eq i32 %268, 0
  %271 = select i1 %.not629.i, i32 2139095040, i32 2143289344
  %272 = or disjoint i32 %271, %270
  %273 = bitcast i32 %272 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %275 = or disjoint i32 %268, 1024
  br label %276

276:                                              ; preds = %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %277 = phi i32 [ %275, %274 ], [ %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %278 = uitofp i32 %277 to float
  %.not622.i = icmp eq i32 %267, 0
  %279 = add nsw i32 %267, -25
  %280 = select i1 %.not622.i, i32 -24, i32 %279
  %281 = call float @__ocml_ldexp_f32(float noundef %278, i32 noundef %280) #6
  %282 = fneg contract float %281
  %.not623624.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %283 = select contract i1 %.not623624.i, float %282, float %281
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %276, %269
  %284 = phi float [ %273, %269 ], [ %283, %276 ]
  %285 = fmul contract float %264, %284
  %286 = fadd contract float %237, %285
  %287 = or disjoint i64 %241, %214
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %206, i32 %288
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !29
  %290 = zext i16 %.sroa.0186.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %295 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not628.i = icmp eq i32 %293, 0
  %296 = select i1 %.not628.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not625.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not625.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #6
  %307 = fneg contract float %306
  %.not626627.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %308 = select contract i1 %.not626627.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = fmul contract float %264, %309
  %311 = fadd contract float %236, %310
  %312 = add nuw nsw i64 %235, 1
  %exitcond667.not.i = icmp eq i64 %312, 32
  br i1 %exitcond667.not.i, label %._crit_edge656.i, label %234, !llvm.loop !39

313:                                              ; preds = %._crit_edge656.i
  %314 = shl nuw i32 %.tr.i, 7
  %315 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %316 = icmp eq i64 %315, 0
  call void @llvm.assume(i1 %316)
  %317 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %318 = icmp eq i64 %317, 0
  call void @llvm.assume(i1 %318)
  %319 = sext i32 %3 to i64
  %320 = call i32 @llvm.amdgcn.groupstaticsize()
  %321 = inttoptr i32 %320 to ptr addrspace(3)
  %322 = sext i32 %314 to i64
  %323 = icmp sgt i32 %4, 0
  %324 = icmp ugt i32 %4, 1
  %325 = icmp ugt i32 %4, 2
  %326 = icmp ugt i32 %4, 3
  %327 = icmp ugt i32 %4, 4
  %328 = icmp ugt i32 %4, 5
  %329 = icmp ugt i32 %4, 6
  %330 = icmp ugt i32 %4, 7
  %331 = icmp ugt i32 %4, 8
  %332 = icmp ugt i32 %4, 9
  %333 = icmp ugt i32 %4, 10
  %334 = icmp ugt i32 %4, 11
  %335 = icmp ugt i32 %4, 12
  %336 = icmp ugt i32 %4, 13
  %337 = icmp ugt i32 %4, 14
  %338 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split658.us.i, %313
  %339 = phi i64 [ 0, %313 ], [ %345, %.split658.us.i ]
  %340 = icmp slt i64 %339, %319
  %341 = shl i64 %339, 4
  %.tr619.i = trunc i64 %339 to i32
  %342 = shl i32 %.tr619.i, 4
  %343 = sext i32 %342 to i64
  %344 = add nsw i64 %343, %322
  %.fr659.i = freeze i1 %340
  %brmerge.not.i = select i1 %.fr659.i, i1 %323, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split658.us.i

.split658.us.i:                                   ; preds = %434, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %345 = add nuw nsw i64 %339, 1
  %exitcond669.not.i = icmp eq i64 %345, 8
  br i1 %exitcond669.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !40

.preheader.split.1.i:                             ; preds = %.preheader.i
  %346 = trunc i64 %341 to i32
  %347 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %346
  %348 = load float, ptr addrspace(3) %347, align 4, !tbaa !23
  %349 = getelementptr inbounds float, ptr %9, i64 %344
  store float %348, ptr %349, align 32, !tbaa !23
  br i1 %324, label %.preheader.split.2.i, label %.split658.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %350 = trunc i64 %341 to i32
  %351 = or disjoint i32 %350, 1
  %352 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %351
  %353 = load float, ptr addrspace(3) %352, align 4, !tbaa !23
  %354 = or disjoint i64 %344, 1
  %355 = getelementptr inbounds float, ptr %9, i64 %354
  store float %353, ptr %355, align 4, !tbaa !23
  br i1 %325, label %.preheader.split.3.i, label %.split658.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %356 = trunc i64 %341 to i32
  %357 = or disjoint i32 %356, 2
  %358 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %357
  %359 = load float, ptr addrspace(3) %358, align 4, !tbaa !23
  %360 = or disjoint i64 %344, 2
  %361 = getelementptr inbounds float, ptr %9, i64 %360
  store float %359, ptr %361, align 8, !tbaa !23
  br i1 %326, label %.preheader.split.4.i, label %.split658.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %362 = trunc i64 %341 to i32
  %363 = or disjoint i32 %362, 3
  %364 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %363
  %365 = load float, ptr addrspace(3) %364, align 4, !tbaa !23
  %366 = or disjoint i64 %344, 3
  %367 = getelementptr inbounds float, ptr %9, i64 %366
  store float %365, ptr %367, align 4, !tbaa !23
  br i1 %327, label %.preheader.split.5.i, label %.split658.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %368 = trunc i64 %341 to i32
  %369 = or disjoint i32 %368, 4
  %370 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %369
  %371 = load float, ptr addrspace(3) %370, align 4, !tbaa !23
  %372 = or disjoint i64 %344, 4
  %373 = getelementptr inbounds float, ptr %9, i64 %372
  store float %371, ptr %373, align 16, !tbaa !23
  br i1 %328, label %.preheader.split.6.i, label %.split658.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %374 = trunc i64 %341 to i32
  %375 = or disjoint i32 %374, 5
  %376 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %375
  %377 = load float, ptr addrspace(3) %376, align 4, !tbaa !23
  %378 = or disjoint i64 %344, 5
  %379 = getelementptr inbounds float, ptr %9, i64 %378
  store float %377, ptr %379, align 4, !tbaa !23
  br i1 %329, label %.preheader.split.7.i, label %.split658.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %380 = trunc i64 %341 to i32
  %381 = or disjoint i32 %380, 6
  %382 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %381
  %383 = load float, ptr addrspace(3) %382, align 4, !tbaa !23
  %384 = or disjoint i64 %344, 6
  %385 = getelementptr inbounds float, ptr %9, i64 %384
  store float %383, ptr %385, align 8, !tbaa !23
  br i1 %330, label %.preheader.split.8.i, label %.split658.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %386 = trunc i64 %341 to i32
  %387 = or disjoint i32 %386, 7
  %388 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %387
  %389 = load float, ptr addrspace(3) %388, align 4, !tbaa !23
  %390 = or disjoint i64 %344, 7
  %391 = getelementptr inbounds float, ptr %9, i64 %390
  store float %389, ptr %391, align 4, !tbaa !23
  br i1 %331, label %.preheader.split.9.i, label %.split658.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %392 = trunc i64 %341 to i32
  %393 = or disjoint i32 %392, 8
  %394 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %393
  %395 = load float, ptr addrspace(3) %394, align 4, !tbaa !23
  %396 = or disjoint i64 %344, 8
  %397 = getelementptr inbounds float, ptr %9, i64 %396
  store float %395, ptr %397, align 32, !tbaa !23
  br i1 %332, label %.preheader.split.10.i, label %.split658.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %398 = trunc i64 %341 to i32
  %399 = or disjoint i32 %398, 9
  %400 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %399
  %401 = load float, ptr addrspace(3) %400, align 4, !tbaa !23
  %402 = or disjoint i64 %344, 9
  %403 = getelementptr inbounds float, ptr %9, i64 %402
  store float %401, ptr %403, align 4, !tbaa !23
  br i1 %333, label %.preheader.split.11.i, label %.split658.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %404 = trunc i64 %341 to i32
  %405 = or disjoint i32 %404, 10
  %406 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %405
  %407 = load float, ptr addrspace(3) %406, align 4, !tbaa !23
  %408 = or disjoint i64 %344, 10
  %409 = getelementptr inbounds float, ptr %9, i64 %408
  store float %407, ptr %409, align 8, !tbaa !23
  br i1 %334, label %.preheader.split.12.i, label %.split658.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %410 = trunc i64 %341 to i32
  %411 = or disjoint i32 %410, 11
  %412 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %411
  %413 = load float, ptr addrspace(3) %412, align 4, !tbaa !23
  %414 = or disjoint i64 %344, 11
  %415 = getelementptr inbounds float, ptr %9, i64 %414
  store float %413, ptr %415, align 4, !tbaa !23
  br i1 %335, label %.preheader.split.13.i, label %.split658.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %416 = trunc i64 %341 to i32
  %417 = or disjoint i32 %416, 12
  %418 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !23
  %420 = or disjoint i64 %344, 12
  %421 = getelementptr inbounds float, ptr %9, i64 %420
  store float %419, ptr %421, align 16, !tbaa !23
  br i1 %336, label %.preheader.split.14.i, label %.split658.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %422 = trunc i64 %341 to i32
  %423 = or disjoint i32 %422, 13
  %424 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %423
  %425 = load float, ptr addrspace(3) %424, align 4, !tbaa !23
  %426 = or disjoint i64 %344, 13
  %427 = getelementptr inbounds float, ptr %9, i64 %426
  store float %425, ptr %427, align 4, !tbaa !23
  br i1 %337, label %.preheader.split.15.i, label %.split658.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %428 = trunc i64 %341 to i32
  %429 = or disjoint i32 %428, 14
  %430 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %429
  %431 = load float, ptr addrspace(3) %430, align 4, !tbaa !23
  %432 = or disjoint i64 %344, 14
  %433 = getelementptr inbounds float, ptr %9, i64 %432
  store float %431, ptr %433, align 8, !tbaa !23
  br i1 %338, label %434, label %.split658.us.i

434:                                              ; preds = %.preheader.split.15.i
  %435 = trunc i64 %341 to i32
  %436 = or disjoint i32 %435, 15
  %437 = getelementptr inbounds float, ptr addrspace(3) %321, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !23
  %439 = or disjoint i64 %344, 15
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 4, !tbaa !23
  br label %.split658.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge656.i, %.split658.us.i
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
!10 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
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
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = !{i64 0, i64 2, !30}
!30 = !{!31, !31, i64 0}
!31 = !{!"short", !25, i64 0}
!32 = distinct !{!32, !28, !33, !34}
!33 = !{!"llvm.loop.vectorize.width", i32 1}
!34 = !{!"llvm.loop.interleave.count", i32 1}
!35 = distinct !{!35, !28, !33, !34}
!36 = distinct !{!36, !28, !33, !34}
!37 = distinct !{!37, !28, !33, !34}
!38 = distinct !{!38, !28, !33, !34}
!39 = distinct !{!39, !28}
!40 = distinct !{!40, !28}
;----------------- End AdaptiveCpp IR dump ---------------
