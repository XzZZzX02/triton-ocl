;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-ynbn7as0/kernel.cpp"
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
  %11 = icmp ult i64 %10, 44739242
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 48
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 44739243
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
  %33 = icmp ult i64 %32, 48
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 44739242
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %40 = icmp ult i64 %39, 48
  call void @llvm.assume(i1 %40)
  %41 = icmp eq i64 %39, 0
  br i1 %41, label %47, label %.lr.ph564.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, %6
  %42 = phi i64 [ %32, %6 ], [ %45, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i ]
  %43 = trunc i64 %42 to i32
  %44 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %43
  store float 0.000000e+00, ptr addrspace(3) %44, align 4, !tbaa !23
  %45 = add nuw nsw i64 %42, 48
  %46 = icmp ult i64 %42, 80
  br i1 %46, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, label %._crit_edge.i, !llvm.loop !27

47:                                               ; preds = %._crit_edge.i
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
  %56 = sext i32 %38 to i64
  %57 = icmp sgt i32 %3, 0
  %58 = icmp ugt i32 %3, 1
  %59 = icmp ugt i32 %3, 2
  %60 = icmp ugt i32 %3, 3
  %61 = icmp ugt i32 %3, 4
  %62 = icmp ugt i32 %3, 5
  %63 = icmp ugt i32 %3, 6
  %64 = icmp ugt i32 %3, 7
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split.us.i, %47
  %65 = phi i64 [ 0, %47 ], [ %75, %.split.us.i ]
  %66 = icmp slt i64 %65, %52
  %67 = shl i64 %65, 3
  %.tr551.i = trunc i64 %65 to i32
  %68 = shl i32 %.tr551.i, 3
  %69 = sext i32 %68 to i64
  %70 = add nsw i64 %69, %56
  %.fr.i = freeze i1 %66
  br i1 %.fr.i, label %.preheader557.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr588.i = trunc i64 %65 to i32
  %71 = shl i32 %.tr588.i, 4
  %72 = add i32 %71, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %54, i32 %72
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader557.split.preheader.i:                  ; preds = %.preheader557.i
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader557.split.preheader.i
  %73 = trunc i64 %67 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %73
  store i16 0, ptr addrspace(3) %74, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %75 = add nuw nsw i64 %65, 1
  %exitcond.not.i = icmp eq i64 %75, 16
  br i1 %exitcond.not.i, label %.lr.ph564.i, label %.preheader557.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader557.split.preheader.i
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0269.0.copyload.i = load i16, ptr %76, align 16, !tbaa.struct !29
  %77 = trunc i64 %67 to i32
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %77
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %78, align 2, !tbaa.struct !29
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %79 = trunc i64 %67 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %80
  store i16 0, ptr addrspace(3) %81, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %82 = or disjoint i64 %70, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0269.0.copyload.1.i = load i16, ptr %83, align 2, !tbaa.struct !29
  %84 = trunc i64 %67 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %85
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %86, align 2, !tbaa.struct !29
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %87 = trunc i64 %67 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %90 = or disjoint i64 %70, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0269.0.copyload.2.i = load i16, ptr %91, align 4, !tbaa.struct !29
  %92 = trunc i64 %67 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %93
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %94, align 2, !tbaa.struct !29
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %95 = trunc i64 %67 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %98 = or disjoint i64 %70, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0269.0.copyload.3.i = load i16, ptr %99, align 2, !tbaa.struct !29
  %100 = trunc i64 %67 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %101
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %102, align 2, !tbaa.struct !29
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %103 = trunc i64 %67 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %106 = or disjoint i64 %70, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0269.0.copyload.4.i = load i16, ptr %107, align 8, !tbaa.struct !29
  %108 = trunc i64 %67 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %109
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %111 = trunc i64 %67 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %114 = or disjoint i64 %70, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0269.0.copyload.5.i = load i16, ptr %115, align 2, !tbaa.struct !29
  %116 = trunc i64 %67 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %117
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %118, align 2, !tbaa.struct !29
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %119 = trunc i64 %67 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %122 = or disjoint i64 %70, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0269.0.copyload.6.i = load i16, ptr %123, align 4, !tbaa.struct !29
  %124 = trunc i64 %67 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %125
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %126, align 2, !tbaa.struct !29
  br i1 %64, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

127:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %128 = or disjoint i64 %70, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0269.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %127 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i ]
  %130 = trunc i64 %67 to i32
  %131 = or disjoint i32 %130, 7
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %131
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !29
  br label %.split.us.i

.lr.ph564.i:                                      ; preds = %.split.us.i, %._crit_edge.i
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
  %138 = icmp ult i64 %137, 48
  call void @llvm.assume(i1 %138)
  %139 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %140 = inttoptr i32 %139 to ptr addrspace(3)
  %141 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 512
  %142 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i.i

._crit_edge565.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %144 = icmp ult i64 %143, 48
  call void @llvm.assume(i1 %144)
  %145 = icmp eq i64 %143, 0
  br i1 %145, label %157, label %.lr.ph570.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i.i, %.lr.ph564.i
  %146 = phi i64 [ %137, %.lr.ph564.i ], [ %155, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i.i ]
  %147 = lshr i64 %146, 4
  %148 = shl nuw nsw i64 %146, 3
  %149 = and i64 %148, 120
  %150 = or disjoint i64 %149, %147
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %151
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !29
  %153 = trunc i64 %146 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %153
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %154, align 2, !tbaa.struct !29
  %155 = add nuw nsw i64 %146, 48
  %156 = icmp ult i64 %146, 80
  br i1 %156, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i.i, label %._crit_edge565.i, !llvm.loop !35

157:                                              ; preds = %._crit_edge565.i
  %158 = shl i32 %.tr.i, 8
  %159 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %160 = icmp eq i64 %159, 0
  call void @llvm.assume(i1 %160)
  %161 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %162 = icmp eq i64 %161, 0
  call void @llvm.assume(i1 %162)
  %163 = sext i32 %4 to i64
  %164 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %165 = inttoptr i32 %164 to ptr addrspace(3)
  %166 = getelementptr inbounds i8, ptr addrspace(3) %165, i32 1024
  %167 = sext i32 %158 to i64
  %168 = icmp sgt i32 %5, 0
  %169 = icmp ugt i32 %5, 1
  %170 = icmp ugt i32 %5, 2
  %171 = icmp ugt i32 %5, 3
  %172 = icmp ugt i32 %5, 4
  %173 = icmp ugt i32 %5, 5
  %174 = icmp ugt i32 %5, 6
  %175 = icmp ugt i32 %5, 7
  %176 = icmp ugt i32 %5, 8
  %177 = icmp ugt i32 %5, 9
  %178 = icmp ugt i32 %5, 10
  %179 = icmp ugt i32 %5, 11
  %180 = icmp ugt i32 %5, 12
  %181 = icmp ugt i32 %5, 13
  %182 = icmp ugt i32 %5, 14
  %183 = icmp ugt i32 %5, 15
  br label %.preheader556.i

.preheader556.i:                                  ; preds = %.split567.us.i, %157
  %184 = phi i64 [ 0, %157 ], [ %194, %.split567.us.i ]
  %185 = icmp slt i64 %184, %163
  %186 = shl i64 %184, 4
  %.tr550.i = trunc i64 %184 to i32
  %187 = shl i32 %.tr550.i, 4
  %188 = sext i32 %187 to i64
  %189 = add nsw i64 %188, %167
  %.fr568.i = freeze i1 %185
  br i1 %.fr568.i, label %.preheader556.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.us.preheader.i: ; preds = %.preheader556.i
  %.tr587.i = trunc i64 %184 to i32
  %190 = shl i32 %.tr587.i, 5
  %191 = add i32 %190, 1024
  %scevgep581.i = getelementptr i8, ptr addrspace(3) %165, i32 %191
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep581.i, i8 0, i32 32, i1 false)
  br label %.split567.us.i

.preheader556.split.preheader.i:                  ; preds = %.preheader556.i
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.thread.i: ; preds = %.preheader556.split.preheader.i
  %192 = trunc i64 %186 to i32
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %192
  store i16 0, ptr addrspace(3) %193, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i

.split567.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.us.preheader.i
  %194 = add nuw nsw i64 %184, 1
  %exitcond583.not.i = icmp eq i64 %194, 16
  br i1 %exitcond583.not.i, label %.lr.ph570.i, label %.preheader556.i, !llvm.loop !36

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i: ; preds = %.preheader556.split.preheader.i
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %189
  %.sroa.0232.0.copyload.i = load i16, ptr %195, align 32, !tbaa.struct !29
  %196 = trunc i64 %186 to i32
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %196
  store i16 %.sroa.0232.0.copyload.i, ptr addrspace(3) %197, align 2, !tbaa.struct !29
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.thread.i
  %198 = trunc i64 %186 to i32
  %199 = or disjoint i32 %198, 1
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %199
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i
  %201 = or disjoint i64 %189, 1
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %201
  %.sroa.0232.0.copyload.1.i = load i16, ptr %202, align 2, !tbaa.struct !29
  %203 = trunc i64 %186 to i32
  %204 = or disjoint i32 %203, 1
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %204
  store i16 %.sroa.0232.0.copyload.1.i, ptr addrspace(3) %205, align 2, !tbaa.struct !29
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i
  %206 = trunc i64 %186 to i32
  %207 = or disjoint i32 %206, 2
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %207
  store i16 0, ptr addrspace(3) %208, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i
  %209 = or disjoint i64 %189, 2
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %209
  %.sroa.0232.0.copyload.2.i = load i16, ptr %210, align 4, !tbaa.struct !29
  %211 = trunc i64 %186 to i32
  %212 = or disjoint i32 %211, 2
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %212
  store i16 %.sroa.0232.0.copyload.2.i, ptr addrspace(3) %213, align 2, !tbaa.struct !29
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i
  %214 = trunc i64 %186 to i32
  %215 = or disjoint i32 %214, 3
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %215
  store i16 0, ptr addrspace(3) %216, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i
  %217 = or disjoint i64 %189, 3
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %217
  %.sroa.0232.0.copyload.3.i = load i16, ptr %218, align 2, !tbaa.struct !29
  %219 = trunc i64 %186 to i32
  %220 = or disjoint i32 %219, 3
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %220
  store i16 %.sroa.0232.0.copyload.3.i, ptr addrspace(3) %221, align 2, !tbaa.struct !29
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i
  %222 = trunc i64 %186 to i32
  %223 = or disjoint i32 %222, 4
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %223
  store i16 0, ptr addrspace(3) %224, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i
  %225 = or disjoint i64 %189, 4
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %225
  %.sroa.0232.0.copyload.4.i = load i16, ptr %226, align 8, !tbaa.struct !29
  %227 = trunc i64 %186 to i32
  %228 = or disjoint i32 %227, 4
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %228
  store i16 %.sroa.0232.0.copyload.4.i, ptr addrspace(3) %229, align 2, !tbaa.struct !29
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i
  %230 = trunc i64 %186 to i32
  %231 = or disjoint i32 %230, 5
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %231
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i
  %233 = or disjoint i64 %189, 5
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %233
  %.sroa.0232.0.copyload.5.i = load i16, ptr %234, align 2, !tbaa.struct !29
  %235 = trunc i64 %186 to i32
  %236 = or disjoint i32 %235, 5
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %236
  store i16 %.sroa.0232.0.copyload.5.i, ptr addrspace(3) %237, align 2, !tbaa.struct !29
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i
  %238 = trunc i64 %186 to i32
  %239 = or disjoint i32 %238, 6
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %239
  store i16 0, ptr addrspace(3) %240, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i
  %241 = or disjoint i64 %189, 6
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %241
  %.sroa.0232.0.copyload.6.i = load i16, ptr %242, align 4, !tbaa.struct !29
  %243 = trunc i64 %186 to i32
  %244 = or disjoint i32 %243, 6
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %244
  store i16 %.sroa.0232.0.copyload.6.i, ptr addrspace(3) %245, align 2, !tbaa.struct !29
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i
  %246 = trunc i64 %186 to i32
  %247 = or disjoint i32 %246, 7
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %247
  store i16 0, ptr addrspace(3) %248, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i
  %249 = or disjoint i64 %189, 7
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %249
  %.sroa.0232.0.copyload.7.i = load i16, ptr %250, align 2, !tbaa.struct !29
  %251 = trunc i64 %186 to i32
  %252 = or disjoint i32 %251, 7
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %252
  store i16 %.sroa.0232.0.copyload.7.i, ptr addrspace(3) %253, align 2, !tbaa.struct !29
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i
  %254 = trunc i64 %186 to i32
  %255 = or disjoint i32 %254, 8
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %255
  store i16 0, ptr addrspace(3) %256, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i
  %257 = or disjoint i64 %189, 8
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %257
  %.sroa.0232.0.copyload.8.i = load i16, ptr %258, align 16, !tbaa.struct !29
  %259 = trunc i64 %186 to i32
  %260 = or disjoint i32 %259, 8
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %260
  store i16 %.sroa.0232.0.copyload.8.i, ptr addrspace(3) %261, align 2, !tbaa.struct !29
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i
  %262 = trunc i64 %186 to i32
  %263 = or disjoint i32 %262, 9
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %263
  store i16 0, ptr addrspace(3) %264, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i
  %265 = or disjoint i64 %189, 9
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %265
  %.sroa.0232.0.copyload.9.i = load i16, ptr %266, align 2, !tbaa.struct !29
  %267 = trunc i64 %186 to i32
  %268 = or disjoint i32 %267, 9
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %268
  store i16 %.sroa.0232.0.copyload.9.i, ptr addrspace(3) %269, align 2, !tbaa.struct !29
  br i1 %178, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i
  %270 = trunc i64 %186 to i32
  %271 = or disjoint i32 %270, 10
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %271
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i
  %273 = or disjoint i64 %189, 10
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %273
  %.sroa.0232.0.copyload.10.i = load i16, ptr %274, align 4, !tbaa.struct !29
  %275 = trunc i64 %186 to i32
  %276 = or disjoint i32 %275, 10
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %276
  store i16 %.sroa.0232.0.copyload.10.i, ptr addrspace(3) %277, align 2, !tbaa.struct !29
  br i1 %179, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i
  %278 = trunc i64 %186 to i32
  %279 = or disjoint i32 %278, 11
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %279
  store i16 0, ptr addrspace(3) %280, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i
  %281 = or disjoint i64 %189, 11
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %281
  %.sroa.0232.0.copyload.11.i = load i16, ptr %282, align 2, !tbaa.struct !29
  %283 = trunc i64 %186 to i32
  %284 = or disjoint i32 %283, 11
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %284
  store i16 %.sroa.0232.0.copyload.11.i, ptr addrspace(3) %285, align 2, !tbaa.struct !29
  br i1 %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i
  %286 = trunc i64 %186 to i32
  %287 = or disjoint i32 %286, 12
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %287
  store i16 0, ptr addrspace(3) %288, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i
  %289 = or disjoint i64 %189, 12
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %289
  %.sroa.0232.0.copyload.12.i = load i16, ptr %290, align 8, !tbaa.struct !29
  %291 = trunc i64 %186 to i32
  %292 = or disjoint i32 %291, 12
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %292
  store i16 %.sroa.0232.0.copyload.12.i, ptr addrspace(3) %293, align 2, !tbaa.struct !29
  br i1 %181, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i
  %294 = trunc i64 %186 to i32
  %295 = or disjoint i32 %294, 13
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %295
  store i16 0, ptr addrspace(3) %296, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i
  %297 = or disjoint i64 %189, 13
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %297
  %.sroa.0232.0.copyload.13.i = load i16, ptr %298, align 2, !tbaa.struct !29
  %299 = trunc i64 %186 to i32
  %300 = or disjoint i32 %299, 13
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %300
  store i16 %.sroa.0232.0.copyload.13.i, ptr addrspace(3) %301, align 2, !tbaa.struct !29
  br i1 %182, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i
  %302 = trunc i64 %186 to i32
  %303 = or disjoint i32 %302, 14
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %303
  store i16 0, ptr addrspace(3) %304, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i
  %305 = or disjoint i64 %189, 14
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %305
  %.sroa.0232.0.copyload.14.i = load i16, ptr %306, align 4, !tbaa.struct !29
  %307 = trunc i64 %186 to i32
  %308 = or disjoint i32 %307, 14
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %308
  store i16 %.sroa.0232.0.copyload.14.i, ptr addrspace(3) %309, align 2, !tbaa.struct !29
  br i1 %183, label %310, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i

310:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i
  %311 = or disjoint i64 %189, 15
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %311
  %.sroa.0232.0.copyload.15.i = load i16, ptr %312, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i: ; preds = %310, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i
  %.sroa.0234.2.15.i = phi i16 [ %.sroa.0232.0.copyload.15.i, %310 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i ]
  %313 = trunc i64 %186 to i32
  %314 = or disjoint i32 %313, 15
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %314
  store i16 %.sroa.0234.2.15.i, ptr addrspace(3) %315, align 2, !tbaa.struct !29
  br label %.split567.us.i

.lr.ph570.i:                                      ; preds = %.split567.us.i, %._crit_edge565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %316 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %317 = icmp eq i64 %316, 0
  call void @llvm.assume(i1 %317)
  %318 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %319 = icmp eq i64 %318, 0
  call void @llvm.assume(i1 %319)
  %320 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %321 = icmp ult i64 %320, 48
  call void @llvm.assume(i1 %321)
  %322 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %323 = inttoptr i32 %322 to ptr addrspace(3)
  %324 = getelementptr inbounds i8, ptr addrspace(3) %323, i32 1024
  %325 = getelementptr inbounds i8, ptr addrspace(3) %323, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

.lr.ph573.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %326 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %327 = icmp eq i64 %326, 0
  call void @llvm.assume(i1 %327)
  %328 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %329 = icmp eq i64 %328, 0
  call void @llvm.assume(i1 %329)
  %330 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %331 = icmp ult i64 %330, 48
  call void @llvm.assume(i1 %331)
  %332 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %333 = inttoptr i32 %332 to ptr addrspace(3)
  %334 = getelementptr inbounds i8, ptr addrspace(3) %333, i32 768
  %335 = getelementptr inbounds i8, ptr addrspace(3) %333, i32 1536
  %336 = and i64 %330, 15
  br label %351

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph570.i
  %337 = phi i64 [ %320, %.lr.ph570.i ], [ %346, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %338 = lshr i64 %337, 4
  %339 = shl nuw nsw i64 %337, 4
  %340 = and i64 %339, 240
  %341 = or disjoint i64 %340, %338
  %342 = trunc i64 %341 to i32
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %324, i32 %342
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %343, align 2, !tbaa.struct !29
  %344 = trunc i64 %337 to i32
  %345 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %325, i32 %344
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %345, align 2, !tbaa.struct !29
  %346 = add nuw nsw i64 %337, 48
  %347 = icmp ult i64 %337, 208
  br i1 %347, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %.lr.ph573.i, !llvm.loop !37

._crit_edge574.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %348 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %349 = icmp ult i64 %348, 48
  call void @llvm.assume(i1 %349)
  %350 = icmp eq i64 %348, 0
  br i1 %350, label %412, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

351:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.lr.ph573.i
  %352 = phi i64 [ %330, %.lr.ph573.i ], [ %357, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %353 = and i64 %352, 112
  %354 = trunc i64 %352 to i32
  %355 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %354
  %356 = load float, ptr addrspace(3) %355, align 4, !tbaa !23
  br label %359

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %410, ptr addrspace(3) %355, align 4, !tbaa !23
  %357 = add nuw nsw i64 %352, 48
  %358 = icmp ult i64 %352, 80
  br i1 %358, label %351, label %._crit_edge574.i, !llvm.loop !38

359:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %351
  %360 = phi i64 [ 0, %351 ], [ %411, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %361 = phi float [ %356, %351 ], [ %410, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %362 = add nuw nsw i64 %360, %353
  %363 = trunc i64 %362 to i32
  %364 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %334, i32 %363
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %364, align 2, !tbaa.struct !29
  %365 = shl nuw nsw i64 %360, 4
  %366 = or disjoint i64 %365, %336
  %367 = trunc i64 %366 to i32
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %335, i32 %367
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %368, align 2, !tbaa.struct !29
  %369 = zext i16 %.sroa.0189.0.copyload.i to i32
  %370 = lshr i32 %369, 10
  %371 = and i32 %370, 31
  %372 = and i32 %369, 1023
  switch i32 %371, label %378 [
    i32 31, label %373
    i32 0, label %380
  ]

373:                                              ; preds = %359
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %374 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %372, 0
  %375 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %376 = or disjoint i32 %375, %374
  %377 = bitcast i32 %376 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

378:                                              ; preds = %359
  %379 = or disjoint i32 %372, 1024
  br label %380

380:                                              ; preds = %378, %359
  %381 = phi i32 [ %379, %378 ], [ %372, %359 ]
  %382 = uitofp i32 %381 to float
  %.not.i = icmp eq i32 %371, 0
  %383 = add nsw i32 %371, -25
  %384 = select i1 %.not.i, i32 -24, i32 %383
  %385 = call float @__ocml_ldexp_f32(float noundef %382, i32 noundef %384) #6
  %386 = fneg contract float %385
  %.not543544.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %387 = select contract i1 %.not543544.i, float %386, float %385
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %380, %373
  %388 = phi float [ %377, %373 ], [ %387, %380 ]
  %389 = zext i16 %.sroa.0180.0.copyload.i to i32
  %390 = lshr i32 %389, 10
  %391 = and i32 %390, 31
  %392 = and i32 %389, 1023
  switch i32 %391, label %398 [
    i32 31, label %393
    i32 0, label %400
  ]

393:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %394 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %392, 0
  %395 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %396 = or disjoint i32 %395, %394
  %397 = bitcast i32 %396 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

398:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %399 = or disjoint i32 %392, 1024
  br label %400

400:                                              ; preds = %398, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %401 = phi i32 [ %399, %398 ], [ %392, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %402 = uitofp i32 %401 to float
  %.not545.i = icmp eq i32 %391, 0
  %403 = add nsw i32 %391, -25
  %404 = select i1 %.not545.i, i32 -24, i32 %403
  %405 = call float @__ocml_ldexp_f32(float noundef %402, i32 noundef %404) #6
  %406 = fneg contract float %405
  %.not546547.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %407 = select contract i1 %.not546547.i, float %406, float %405
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %400, %393
  %408 = phi float [ %397, %393 ], [ %407, %400 ]
  %409 = fmul contract float %388, %408
  %410 = fadd contract float %361, %409
  %411 = add nuw nsw i64 %360, 1
  %exitcond584.not.i = icmp eq i64 %411, 16
  br i1 %exitcond584.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, label %359, !llvm.loop !39

412:                                              ; preds = %._crit_edge574.i
  %413 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %414 = icmp eq i64 %413, 0
  call void @llvm.assume(i1 %414)
  %415 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %416 = icmp eq i64 %415, 0
  call void @llvm.assume(i1 %416)
  %417 = sext i32 %3 to i64
  %418 = call i32 @llvm.amdgcn.groupstaticsize()
  %419 = inttoptr i32 %418 to ptr addrspace(3)
  %420 = sext i32 %38 to i64
  %421 = icmp sgt i32 %4, 0
  %422 = icmp ugt i32 %4, 1
  %423 = icmp ugt i32 %4, 2
  %424 = icmp ugt i32 %4, 3
  %425 = icmp ugt i32 %4, 4
  %426 = icmp ugt i32 %4, 5
  %427 = icmp ugt i32 %4, 6
  %428 = icmp ugt i32 %4, 7
  %429 = icmp ugt i32 %4, 8
  %430 = icmp ugt i32 %4, 9
  %431 = icmp ugt i32 %4, 10
  %432 = icmp ugt i32 %4, 11
  %433 = icmp ugt i32 %4, 12
  %434 = icmp ugt i32 %4, 13
  %435 = icmp ugt i32 %4, 14
  %436 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split576.us.i, %412
  %437 = phi i64 [ 0, %412 ], [ %443, %.split576.us.i ]
  %438 = icmp slt i64 %437, %417
  %439 = shl i64 %437, 4
  %.tr542.i = trunc i64 %437 to i32
  %440 = shl i32 %.tr542.i, 4
  %441 = sext i32 %440 to i64
  %442 = add nsw i64 %441, %420
  %.fr577.i = freeze i1 %438
  %brmerge.not.i = select i1 %.fr577.i, i1 %421, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split576.us.i

.split576.us.i:                                   ; preds = %532, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %443 = add nuw nsw i64 %437, 1
  %exitcond586.not.i = icmp eq i64 %443, 8
  br i1 %exitcond586.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !40

.preheader.split.1.i:                             ; preds = %.preheader.i
  %444 = trunc i64 %439 to i32
  %445 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %444
  %446 = load float, ptr addrspace(3) %445, align 4, !tbaa !23
  %447 = getelementptr inbounds float, ptr %9, i64 %442
  store float %446, ptr %447, align 32, !tbaa !23
  br i1 %422, label %.preheader.split.2.i, label %.split576.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %448 = trunc i64 %439 to i32
  %449 = or disjoint i32 %448, 1
  %450 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !23
  %452 = or disjoint i64 %442, 1
  %453 = getelementptr inbounds float, ptr %9, i64 %452
  store float %451, ptr %453, align 4, !tbaa !23
  br i1 %423, label %.preheader.split.3.i, label %.split576.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %454 = trunc i64 %439 to i32
  %455 = or disjoint i32 %454, 2
  %456 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !23
  %458 = or disjoint i64 %442, 2
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 8, !tbaa !23
  br i1 %424, label %.preheader.split.4.i, label %.split576.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %460 = trunc i64 %439 to i32
  %461 = or disjoint i32 %460, 3
  %462 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !23
  %464 = or disjoint i64 %442, 3
  %465 = getelementptr inbounds float, ptr %9, i64 %464
  store float %463, ptr %465, align 4, !tbaa !23
  br i1 %425, label %.preheader.split.5.i, label %.split576.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %466 = trunc i64 %439 to i32
  %467 = or disjoint i32 %466, 4
  %468 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !23
  %470 = or disjoint i64 %442, 4
  %471 = getelementptr inbounds float, ptr %9, i64 %470
  store float %469, ptr %471, align 16, !tbaa !23
  br i1 %426, label %.preheader.split.6.i, label %.split576.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %472 = trunc i64 %439 to i32
  %473 = or disjoint i32 %472, 5
  %474 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !23
  %476 = or disjoint i64 %442, 5
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 4, !tbaa !23
  br i1 %427, label %.preheader.split.7.i, label %.split576.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %478 = trunc i64 %439 to i32
  %479 = or disjoint i32 %478, 6
  %480 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !23
  %482 = or disjoint i64 %442, 6
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 8, !tbaa !23
  br i1 %428, label %.preheader.split.8.i, label %.split576.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %484 = trunc i64 %439 to i32
  %485 = or disjoint i32 %484, 7
  %486 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !23
  %488 = or disjoint i64 %442, 7
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 4, !tbaa !23
  br i1 %429, label %.preheader.split.9.i, label %.split576.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %490 = trunc i64 %439 to i32
  %491 = or disjoint i32 %490, 8
  %492 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !23
  %494 = or disjoint i64 %442, 8
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 32, !tbaa !23
  br i1 %430, label %.preheader.split.10.i, label %.split576.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %496 = trunc i64 %439 to i32
  %497 = or disjoint i32 %496, 9
  %498 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !23
  %500 = or disjoint i64 %442, 9
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 4, !tbaa !23
  br i1 %431, label %.preheader.split.11.i, label %.split576.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %502 = trunc i64 %439 to i32
  %503 = or disjoint i32 %502, 10
  %504 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !23
  %506 = or disjoint i64 %442, 10
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 8, !tbaa !23
  br i1 %432, label %.preheader.split.12.i, label %.split576.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %508 = trunc i64 %439 to i32
  %509 = or disjoint i32 %508, 11
  %510 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !23
  %512 = or disjoint i64 %442, 11
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 4, !tbaa !23
  br i1 %433, label %.preheader.split.13.i, label %.split576.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %514 = trunc i64 %439 to i32
  %515 = or disjoint i32 %514, 12
  %516 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !23
  %518 = or disjoint i64 %442, 12
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 16, !tbaa !23
  br i1 %434, label %.preheader.split.14.i, label %.split576.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %520 = trunc i64 %439 to i32
  %521 = or disjoint i32 %520, 13
  %522 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !23
  %524 = or disjoint i64 %442, 13
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 4, !tbaa !23
  br i1 %435, label %.preheader.split.15.i, label %.split576.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %526 = trunc i64 %439 to i32
  %527 = or disjoint i32 %526, 14
  %528 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !23
  %530 = or disjoint i64 %442, 14
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 8, !tbaa !23
  br i1 %436, label %532, label %.split576.us.i

532:                                              ; preds = %.preheader.split.15.i
  %533 = trunc i64 %439 to i32
  %534 = or disjoint i32 %533, 15
  %535 = getelementptr inbounds float, ptr addrspace(3) %419, i32 %534
  %536 = load float, ptr addrspace(3) %535, align 4, !tbaa !23
  %537 = or disjoint i64 %442, 15
  %538 = getelementptr inbounds float, ptr %9, i64 %537
  store float %536, ptr %538, align 4, !tbaa !23
  br label %.split576.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge574.i, %.split576.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="48,48" }
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
!38 = distinct !{!38, !28}
!39 = distinct !{!39, !28}
!40 = distinct !{!40, !28}
;----------------- End AdaptiveCpp IR dump ---------------
