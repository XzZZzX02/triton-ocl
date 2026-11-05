;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-vdutf681/kernel.cpp"
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
  %11 = icmp ult i64 %10, 2147483647
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp eq i64 %16, 0
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 2147483648
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 2147483647
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %34 = icmp eq i64 %33, 0
  call void @llvm.assume(i1 %34)
  %35 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %36 = icmp eq i64 %35, 0
  call void @llvm.assume(i1 %36)
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %40 = inttoptr i32 %39 to ptr addrspace(3)
  %41 = getelementptr inbounds i8, ptr addrspace(3) %40, i32 512
  %42 = sext i32 %30 to i64
  %43 = icmp sgt i32 %3, 0
  %44 = icmp ugt i32 %3, 1
  %45 = icmp ugt i32 %3, 2
  %46 = icmp ugt i32 %3, 3
  %47 = icmp ugt i32 %3, 4
  %48 = icmp ugt i32 %3, 5
  %49 = icmp ugt i32 %3, 6
  %50 = icmp ugt i32 %3, 7
  br label %.preheader703.i

.preheader703.i:                                  ; preds = %.split.us.i, %6
  %51 = phi i64 [ 0, %6 ], [ %61, %.split.us.i ]
  %52 = icmp slt i64 %51, %37
  %53 = shl i64 %51, 3
  %.tr698.i = trunc i64 %51 to i32
  %54 = shl i32 %.tr698.i, 3
  %55 = sext i32 %54 to i64
  %56 = add nsw i64 %55, %42
  %.fr.i = freeze i1 %52
  br i1 %.fr.i, label %.preheader703.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader703.i
  %.tr719.i = trunc i64 %51 to i32
  %57 = shl i32 %.tr719.i, 4
  %58 = add i32 %57, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %40, i32 %58
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader703.split.preheader.i:                  ; preds = %.preheader703.i
  br i1 %43, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader703.split.preheader.i
  %59 = trunc i64 %53 to i32
  %60 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %59
  store i16 0, ptr addrspace(3) %60, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %61 = add nuw nsw i64 %51, 1
  %exitcond.not.i = icmp eq i64 %61, 16
  br i1 %exitcond.not.i, label %119, label %.preheader703.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader703.split.preheader.i
  %62 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %56
  %.sroa.0321.0.copyload.i = load i16, ptr %62, align 16, !tbaa.struct !23
  %63 = trunc i64 %53 to i32
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %63
  store i16 %.sroa.0321.0.copyload.i, ptr addrspace(3) %64, align 2, !tbaa.struct !23
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %65 = trunc i64 %53 to i32
  %66 = or disjoint i32 %65, 1
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %66
  store i16 0, ptr addrspace(3) %67, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %68 = or disjoint i64 %56, 1
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0321.0.copyload.1.i = load i16, ptr %69, align 2, !tbaa.struct !23
  %70 = trunc i64 %53 to i32
  %71 = or disjoint i32 %70, 1
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %71
  store i16 %.sroa.0321.0.copyload.1.i, ptr addrspace(3) %72, align 2, !tbaa.struct !23
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %73 = trunc i64 %53 to i32
  %74 = or disjoint i32 %73, 2
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %74
  store i16 0, ptr addrspace(3) %75, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %76 = or disjoint i64 %56, 2
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0321.0.copyload.2.i = load i16, ptr %77, align 4, !tbaa.struct !23
  %78 = trunc i64 %53 to i32
  %79 = or disjoint i32 %78, 2
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %79
  store i16 %.sroa.0321.0.copyload.2.i, ptr addrspace(3) %80, align 2, !tbaa.struct !23
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %81 = trunc i64 %53 to i32
  %82 = or disjoint i32 %81, 3
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %82
  store i16 0, ptr addrspace(3) %83, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %84 = or disjoint i64 %56, 3
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0321.0.copyload.3.i = load i16, ptr %85, align 2, !tbaa.struct !23
  %86 = trunc i64 %53 to i32
  %87 = or disjoint i32 %86, 3
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %87
  store i16 %.sroa.0321.0.copyload.3.i, ptr addrspace(3) %88, align 2, !tbaa.struct !23
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %89 = trunc i64 %53 to i32
  %90 = or disjoint i32 %89, 4
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %90
  store i16 0, ptr addrspace(3) %91, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %92 = or disjoint i64 %56, 4
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %92
  %.sroa.0321.0.copyload.4.i = load i16, ptr %93, align 8, !tbaa.struct !23
  %94 = trunc i64 %53 to i32
  %95 = or disjoint i32 %94, 4
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %95
  store i16 %.sroa.0321.0.copyload.4.i, ptr addrspace(3) %96, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %97 = trunc i64 %53 to i32
  %98 = or disjoint i32 %97, 5
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %98
  store i16 0, ptr addrspace(3) %99, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %100 = or disjoint i64 %56, 5
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %100
  %.sroa.0321.0.copyload.5.i = load i16, ptr %101, align 2, !tbaa.struct !23
  %102 = trunc i64 %53 to i32
  %103 = or disjoint i32 %102, 5
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %103
  store i16 %.sroa.0321.0.copyload.5.i, ptr addrspace(3) %104, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %105 = trunc i64 %53 to i32
  %106 = or disjoint i32 %105, 6
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %106
  store i16 0, ptr addrspace(3) %107, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %108 = or disjoint i64 %56, 6
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %108
  %.sroa.0321.0.copyload.6.i = load i16, ptr %109, align 4, !tbaa.struct !23
  %110 = trunc i64 %53 to i32
  %111 = or disjoint i32 %110, 6
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %111
  store i16 %.sroa.0321.0.copyload.6.i, ptr addrspace(3) %112, align 2, !tbaa.struct !23
  br i1 %50, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

113:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %114 = or disjoint i64 %56, 7
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0321.0.copyload.7.i = load i16, ptr %115, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %113, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %.sroa.0323.2.7.i = phi i16 [ %.sroa.0321.0.copyload.7.i, %113 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i ]
  %116 = trunc i64 %53 to i32
  %117 = or disjoint i32 %116, 7
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %117
  store i16 %.sroa.0323.2.7.i, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  br label %.split.us.i

119:                                              ; preds = %.split.us.i
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
  %125 = icmp eq i64 %124, 0
  call void @llvm.assume(i1 %125)
  %126 = getelementptr inbounds i8, ptr addrspace(3) %40, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i

127:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = shl i32 %.tr.i, 8
  %129 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %130 = icmp eq i64 %129, 0
  call void @llvm.assume(i1 %130)
  %131 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %132 = icmp eq i64 %131, 0
  call void @llvm.assume(i1 %132)
  %133 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %134 = icmp eq i64 %133, 0
  call void @llvm.assume(i1 %134)
  %135 = sext i32 %4 to i64
  %136 = getelementptr inbounds i8, ptr addrspace(3) %40, i32 1024
  %137 = sext i32 %128 to i64
  br label %160

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i, %119
  %138 = phi i64 [ 0, %119 ], [ %151, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i ]
  %139 = lshr i64 %138, 4
  %140 = shl nuw nsw i64 %138, 3
  %141 = and i64 %140, 120
  %142 = or disjoint i64 %141, %139
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %143
  %145 = addrspacecast ptr addrspace(3) %144 to ptr
  %146 = load volatile i16, ptr %145, align 2, !tbaa !24
  %147 = trunc i64 %138 to i32
  %148 = and i32 %147, 127
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %148
  %150 = addrspacecast ptr addrspace(3) %149 to ptr
  store volatile i16 %146, ptr %150, align 2, !tbaa !24
  %151 = add nuw nsw i64 %138, 1
  %exitcond713.not.i = icmp eq i64 %151, 128
  br i1 %exitcond713.not.i, label %127, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i.i, !llvm.loop !32

152:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i
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
  %158 = icmp eq i64 %157, 0
  call void @llvm.assume(i1 %158)
  %159 = getelementptr inbounds i8, ptr addrspace(3) %40, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i

160:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i, %127
  %161 = phi i64 [ 0, %127 ], [ %174, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i ]
  %162 = lshr i64 %161, 4
  %163 = and i64 %161, 15
  %164 = icmp slt i64 %162, %135
  %165 = icmp slt i64 %163, %37
  %166 = and i1 %164, %165
  br i1 %166, label %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i

167:                                              ; preds = %160
  %168 = and i64 %161, 9223372036854775792
  %169 = or disjoint i64 %168, %137
  %170 = or disjoint i64 %169, %163
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %170
  %.sroa.0284.0.copyload.i = load i16, ptr %171, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i: ; preds = %167, %160
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %167 ], [ 0, %160 ]
  %172 = trunc i64 %161 to i32
  %173 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %172
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %173, align 2, !tbaa.struct !23
  %174 = add nuw nsw i64 %161, 1
  %exitcond714.not.i = icmp eq i64 %174, 256
  br i1 %exitcond714.not.i, label %152, label %160, !llvm.loop !33

175:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %176 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %177 = icmp eq i64 %176, 0
  call void @llvm.assume(i1 %177)
  %178 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %179 = icmp eq i64 %178, 0
  call void @llvm.assume(i1 %179)
  %180 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %181 = icmp eq i64 %180, 0
  call void @llvm.assume(i1 %181)
  br label %219

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, %152
  %182 = phi i64 [ 0, %152 ], [ %195, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i ]
  %183 = lshr i64 %182, 4
  %184 = shl nuw nsw i64 %182, 4
  %185 = and i64 %184, 240
  %186 = or disjoint i64 %185, %183
  %187 = trunc i64 %186 to i32
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %187
  %189 = addrspacecast ptr addrspace(3) %188 to ptr
  %190 = load volatile i16, ptr %189, align 2, !tbaa !24
  %191 = trunc i64 %182 to i32
  %192 = and i32 %191, 255
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %159, i32 %192
  %194 = addrspacecast ptr addrspace(3) %193 to ptr
  store volatile i16 %190, ptr %194, align 2, !tbaa !24
  %195 = add nuw nsw i64 %182, 1
  %exitcond715.not.i = icmp eq i64 %195, 256
  br i1 %exitcond715.not.i, label %175, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, !llvm.loop !34

196:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %197 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %198 = icmp eq i64 %197, 0
  call void @llvm.assume(i1 %198)
  %199 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %200 = icmp eq i64 %199, 0
  call void @llvm.assume(i1 %200)
  %201 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %202 = icmp eq i64 %201, 0
  call void @llvm.assume(i1 %202)
  %203 = icmp sgt i32 %4, 0
  %204 = icmp ugt i32 %4, 1
  %205 = icmp ugt i32 %4, 2
  %206 = icmp ugt i32 %4, 3
  %207 = icmp ugt i32 %4, 4
  %208 = icmp ugt i32 %4, 5
  %209 = icmp ugt i32 %4, 6
  %210 = icmp ugt i32 %4, 7
  %211 = icmp ugt i32 %4, 8
  %212 = icmp ugt i32 %4, 9
  %213 = icmp ugt i32 %4, 10
  %214 = icmp ugt i32 %4, 11
  %215 = icmp ugt i32 %4, 12
  %216 = icmp ugt i32 %4, 13
  %217 = icmp ugt i32 %4, 14
  %218 = icmp ugt i32 %4, 15
  br label %.preheader.i

219:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %175
  %220 = phi i64 [ 0, %175 ], [ %226, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %221 = and i64 %220, 112
  %222 = and i64 %220, 15
  br label %227

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %223 = trunc i64 %220 to i32
  %224 = and i32 %223, 127
  %225 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %224
  store float %428, ptr addrspace(3) %225, align 4, !tbaa !35
  %226 = add nuw nsw i64 %220, 1
  %exitcond716.not.i = icmp eq i64 %226, 128
  br i1 %exitcond716.not.i, label %196, label %219, !llvm.loop !37

227:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %219
  %228 = phi i64 [ 0, %219 ], [ %429, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %229 = phi float [ 0.000000e+00, %219 ], [ %428, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %230 = add nuw nsw i64 %228, %221
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %231
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !23
  %233 = shl nuw nsw i64 %228, 4
  %234 = or disjoint i64 %233, %222
  %235 = trunc i64 %234 to i32
  %236 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %159, i32 %235
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %236, align 2, !tbaa.struct !23
  %237 = zext i16 %.sroa.0243.0.copyload.i to i32
  %238 = lshr i32 %237, 10
  %239 = and i32 %238, 31
  %240 = and i32 %237, 1023
  switch i32 %239, label %246 [
    i32 31, label %241
    i32 0, label %248
  ]

241:                                              ; preds = %227
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %242 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %240, 0
  %243 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %244 = or disjoint i32 %243, %242
  %245 = bitcast i32 %244 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

246:                                              ; preds = %227
  %247 = or disjoint i32 %240, 1024
  br label %248

248:                                              ; preds = %246, %227
  %249 = phi i32 [ %247, %246 ], [ %240, %227 ]
  %250 = uitofp i32 %249 to float
  %.not.i = icmp eq i32 %239, 0
  %251 = add nsw i32 %239, -25
  %252 = select i1 %.not.i, i32 -24, i32 %251
  %253 = call float @__ocml_ldexp_f32(float noundef %250, i32 noundef %252) #6
  %254 = fneg contract float %253
  %.not666667.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %255 = select contract i1 %.not666667.i, float %254, float %253
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i: ; preds = %248, %241
  %256 = phi float [ %245, %241 ], [ %255, %248 ]
  %257 = zext i16 %.sroa.0234.0.copyload.i to i32
  %258 = lshr i32 %257, 10
  %259 = and i32 %258, 31
  %260 = and i32 %257, 1023
  switch i32 %259, label %266 [
    i32 31, label %261
    i32 0, label %268
  ]

261:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %262 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %260, 0
  %263 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %264 = or disjoint i32 %263, %262
  %265 = bitcast i32 %264 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

266:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %267 = or disjoint i32 %260, 1024
  br label %268

268:                                              ; preds = %266, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %269 = phi i32 [ %267, %266 ], [ %260, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i ]
  %270 = uitofp i32 %269 to float
  %.not668.i = icmp eq i32 %259, 0
  %271 = add nsw i32 %259, -25
  %272 = select i1 %.not668.i, i32 -24, i32 %271
  %273 = call float @__ocml_ldexp_f32(float noundef %270, i32 noundef %272) #6
  %274 = fneg contract float %273
  %.not669670.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %275 = select contract i1 %.not669670.i, float %274, float %273
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i: ; preds = %268, %261
  %276 = phi float [ %265, %261 ], [ %275, %268 ]
  %277 = fmul contract float %256, %276
  %278 = fadd contract float %229, %277
  %279 = or disjoint i64 %228, 1
  %280 = add nuw nsw i64 %279, %221
  %281 = trunc i64 %280 to i32
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %281
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %282, align 2, !tbaa.struct !23
  %283 = shl nuw nsw i64 %279, 4
  %284 = or disjoint i64 %283, %222
  %285 = trunc i64 %284 to i32
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %159, i32 %285
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %286, align 2, !tbaa.struct !23
  %287 = zext i16 %.sroa.0225.0.copyload.i to i32
  %288 = lshr i32 %287, 10
  %289 = and i32 %288, 31
  %290 = and i32 %287, 1023
  switch i32 %289, label %296 [
    i32 31, label %291
    i32 0, label %298
  ]

291:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %292 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %290, 0
  %293 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %294 = or disjoint i32 %293, %292
  %295 = bitcast i32 %294 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %297 = or disjoint i32 %290, 1024
  br label %298

298:                                              ; preds = %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %299 = phi i32 [ %297, %296 ], [ %290, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i ]
  %300 = uitofp i32 %299 to float
  %.not671.i = icmp eq i32 %289, 0
  %301 = add nsw i32 %289, -25
  %302 = select i1 %.not671.i, i32 -24, i32 %301
  %303 = call float @__ocml_ldexp_f32(float noundef %300, i32 noundef %302) #6
  %304 = fneg contract float %303
  %.not672673.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %305 = select contract i1 %.not672673.i, float %304, float %303
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %298, %291
  %306 = phi float [ %295, %291 ], [ %305, %298 ]
  %307 = zext i16 %.sroa.0216.0.copyload.i to i32
  %308 = lshr i32 %307, 10
  %309 = and i32 %308, 31
  %310 = and i32 %307, 1023
  switch i32 %309, label %316 [
    i32 31, label %311
    i32 0, label %318
  ]

311:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %312 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not693.i = icmp eq i32 %310, 0
  %313 = select i1 %.not693.i, i32 2139095040, i32 2143289344
  %314 = or disjoint i32 %313, %312
  %315 = bitcast i32 %314 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

316:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %317 = or disjoint i32 %310, 1024
  br label %318

318:                                              ; preds = %316, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %319 = phi i32 [ %317, %316 ], [ %310, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %320 = uitofp i32 %319 to float
  %.not674.i = icmp eq i32 %309, 0
  %321 = add nsw i32 %309, -25
  %322 = select i1 %.not674.i, i32 -24, i32 %321
  %323 = call float @__ocml_ldexp_f32(float noundef %320, i32 noundef %322) #6
  %324 = fneg contract float %323
  %.not675676.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %325 = select contract i1 %.not675676.i, float %324, float %323
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i: ; preds = %318, %311
  %326 = phi float [ %315, %311 ], [ %325, %318 ]
  %327 = fmul contract float %306, %326
  %328 = fadd contract float %278, %327
  %329 = or disjoint i64 %228, 2
  %330 = add nuw nsw i64 %329, %221
  %331 = trunc i64 %330 to i32
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %331
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %332, align 2, !tbaa.struct !23
  %333 = shl nuw nsw i64 %329, 4
  %334 = or disjoint i64 %333, %222
  %335 = trunc i64 %334 to i32
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %159, i32 %335
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %336, align 2, !tbaa.struct !23
  %337 = zext i16 %.sroa.0207.0.copyload.i to i32
  %338 = lshr i32 %337, 10
  %339 = and i32 %338, 31
  %340 = and i32 %337, 1023
  switch i32 %339, label %346 [
    i32 31, label %341
    i32 0, label %348
  ]

341:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %342 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %340, 0
  %343 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %344 = or disjoint i32 %343, %342
  %345 = bitcast i32 %344 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

346:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %347 = or disjoint i32 %340, 1024
  br label %348

348:                                              ; preds = %346, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %349 = phi i32 [ %347, %346 ], [ %340, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i ]
  %350 = uitofp i32 %349 to float
  %.not677.i = icmp eq i32 %339, 0
  %351 = add nsw i32 %339, -25
  %352 = select i1 %.not677.i, i32 -24, i32 %351
  %353 = call float @__ocml_ldexp_f32(float noundef %350, i32 noundef %352) #6
  %354 = fneg contract float %353
  %.not678679.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %355 = select contract i1 %.not678679.i, float %354, float %353
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %348, %341
  %356 = phi float [ %345, %341 ], [ %355, %348 ]
  %357 = zext i16 %.sroa.0198.0.copyload.i to i32
  %358 = lshr i32 %357, 10
  %359 = and i32 %358, 31
  %360 = and i32 %357, 1023
  switch i32 %359, label %366 [
    i32 31, label %361
    i32 0, label %368
  ]

361:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %362 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %360, 0
  %363 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %364 = or disjoint i32 %363, %362
  %365 = bitcast i32 %364 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

366:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %367 = or disjoint i32 %360, 1024
  br label %368

368:                                              ; preds = %366, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %369 = phi i32 [ %367, %366 ], [ %360, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %370 = uitofp i32 %369 to float
  %.not680.i = icmp eq i32 %359, 0
  %371 = add nsw i32 %359, -25
  %372 = select i1 %.not680.i, i32 -24, i32 %371
  %373 = call float @__ocml_ldexp_f32(float noundef %370, i32 noundef %372) #6
  %374 = fneg contract float %373
  %.not681682.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %375 = select contract i1 %.not681682.i, float %374, float %373
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i: ; preds = %368, %361
  %376 = phi float [ %365, %361 ], [ %375, %368 ]
  %377 = fmul contract float %356, %376
  %378 = fadd contract float %328, %377
  %379 = or disjoint i64 %228, 3
  %380 = add nuw nsw i64 %379, %221
  %381 = trunc i64 %380 to i32
  %382 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %381
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %382, align 2, !tbaa.struct !23
  %383 = shl nuw nsw i64 %379, 4
  %384 = or disjoint i64 %383, %222
  %385 = trunc i64 %384 to i32
  %386 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %159, i32 %385
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %386, align 2, !tbaa.struct !23
  %387 = zext i16 %.sroa.0189.0.copyload.i to i32
  %388 = lshr i32 %387, 10
  %389 = and i32 %388, 31
  %390 = and i32 %387, 1023
  switch i32 %389, label %396 [
    i32 31, label %391
    i32 0, label %398
  ]

391:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %392 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %390, 0
  %393 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %394 = or disjoint i32 %393, %392
  %395 = bitcast i32 %394 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

396:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %397 = or disjoint i32 %390, 1024
  br label %398

398:                                              ; preds = %396, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %399 = phi i32 [ %397, %396 ], [ %390, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i ]
  %400 = uitofp i32 %399 to float
  %.not683.i = icmp eq i32 %389, 0
  %401 = add nsw i32 %389, -25
  %402 = select i1 %.not683.i, i32 -24, i32 %401
  %403 = call float @__ocml_ldexp_f32(float noundef %400, i32 noundef %402) #6
  %404 = fneg contract float %403
  %.not684685.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %405 = select contract i1 %.not684685.i, float %404, float %403
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %398, %391
  %406 = phi float [ %395, %391 ], [ %405, %398 ]
  %407 = zext i16 %.sroa.0180.0.copyload.i to i32
  %408 = lshr i32 %407, 10
  %409 = and i32 %408, 31
  %410 = and i32 %407, 1023
  switch i32 %409, label %416 [
    i32 31, label %411
    i32 0, label %418
  ]

411:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %412 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %410, 0
  %413 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %414 = or disjoint i32 %413, %412
  %415 = bitcast i32 %414 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

416:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %417 = or disjoint i32 %410, 1024
  br label %418

418:                                              ; preds = %416, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %419 = phi i32 [ %417, %416 ], [ %410, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %420 = uitofp i32 %419 to float
  %.not686.i = icmp eq i32 %409, 0
  %421 = add nsw i32 %409, -25
  %422 = select i1 %.not686.i, i32 -24, i32 %421
  %423 = call float @__ocml_ldexp_f32(float noundef %420, i32 noundef %422) #6
  %424 = fneg contract float %423
  %.not687688.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %425 = select contract i1 %.not687688.i, float %424, float %423
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %418, %411
  %426 = phi float [ %415, %411 ], [ %425, %418 ]
  %427 = fmul contract float %406, %426
  %428 = fadd contract float %378, %427
  %429 = add nuw nsw i64 %228, 4
  %430 = icmp ult i64 %228, 12
  br i1 %430, label %227, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !38

.preheader.i:                                     ; preds = %.split709.us.i, %196
  %431 = phi i64 [ 0, %196 ], [ %437, %.split709.us.i ]
  %432 = icmp slt i64 %431, %38
  %433 = shl i64 %431, 4
  %.tr665.i = trunc i64 %431 to i32
  %434 = shl i32 %.tr665.i, 4
  %435 = sext i32 %434 to i64
  %436 = add nsw i64 %435, %42
  %.fr710.i = freeze i1 %432
  %brmerge.not.i = select i1 %.fr710.i, i1 %203, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split709.us.i

.split709.us.i:                                   ; preds = %526, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %437 = add nuw nsw i64 %431, 1
  %exitcond718.not.i = icmp eq i64 %437, 8
  br i1 %exitcond718.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %438 = trunc i64 %433 to i32
  %439 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !35
  %441 = getelementptr inbounds float, ptr %9, i64 %436
  store float %440, ptr %441, align 32, !tbaa !35
  br i1 %204, label %.preheader.split.2.i, label %.split709.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %442 = trunc i64 %433 to i32
  %443 = or disjoint i32 %442, 1
  %444 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %443
  %445 = load float, ptr addrspace(3) %444, align 4, !tbaa !35
  %446 = or disjoint i64 %436, 1
  %447 = getelementptr inbounds float, ptr %9, i64 %446
  store float %445, ptr %447, align 4, !tbaa !35
  br i1 %205, label %.preheader.split.3.i, label %.split709.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %448 = trunc i64 %433 to i32
  %449 = or disjoint i32 %448, 2
  %450 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !35
  %452 = or disjoint i64 %436, 2
  %453 = getelementptr inbounds float, ptr %9, i64 %452
  store float %451, ptr %453, align 8, !tbaa !35
  br i1 %206, label %.preheader.split.4.i, label %.split709.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %454 = trunc i64 %433 to i32
  %455 = or disjoint i32 %454, 3
  %456 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !35
  %458 = or disjoint i64 %436, 3
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 4, !tbaa !35
  br i1 %207, label %.preheader.split.5.i, label %.split709.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %460 = trunc i64 %433 to i32
  %461 = or disjoint i32 %460, 4
  %462 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !35
  %464 = or disjoint i64 %436, 4
  %465 = getelementptr inbounds float, ptr %9, i64 %464
  store float %463, ptr %465, align 16, !tbaa !35
  br i1 %208, label %.preheader.split.6.i, label %.split709.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %466 = trunc i64 %433 to i32
  %467 = or disjoint i32 %466, 5
  %468 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !35
  %470 = or disjoint i64 %436, 5
  %471 = getelementptr inbounds float, ptr %9, i64 %470
  store float %469, ptr %471, align 4, !tbaa !35
  br i1 %209, label %.preheader.split.7.i, label %.split709.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %472 = trunc i64 %433 to i32
  %473 = or disjoint i32 %472, 6
  %474 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !35
  %476 = or disjoint i64 %436, 6
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 8, !tbaa !35
  br i1 %210, label %.preheader.split.8.i, label %.split709.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %478 = trunc i64 %433 to i32
  %479 = or disjoint i32 %478, 7
  %480 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !35
  %482 = or disjoint i64 %436, 7
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 4, !tbaa !35
  br i1 %211, label %.preheader.split.9.i, label %.split709.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %484 = trunc i64 %433 to i32
  %485 = or disjoint i32 %484, 8
  %486 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !35
  %488 = or disjoint i64 %436, 8
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 32, !tbaa !35
  br i1 %212, label %.preheader.split.10.i, label %.split709.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %490 = trunc i64 %433 to i32
  %491 = or disjoint i32 %490, 9
  %492 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !35
  %494 = or disjoint i64 %436, 9
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 4, !tbaa !35
  br i1 %213, label %.preheader.split.11.i, label %.split709.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %496 = trunc i64 %433 to i32
  %497 = or disjoint i32 %496, 10
  %498 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !35
  %500 = or disjoint i64 %436, 10
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 8, !tbaa !35
  br i1 %214, label %.preheader.split.12.i, label %.split709.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %502 = trunc i64 %433 to i32
  %503 = or disjoint i32 %502, 11
  %504 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !35
  %506 = or disjoint i64 %436, 11
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 4, !tbaa !35
  br i1 %215, label %.preheader.split.13.i, label %.split709.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %508 = trunc i64 %433 to i32
  %509 = or disjoint i32 %508, 12
  %510 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !35
  %512 = or disjoint i64 %436, 12
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 16, !tbaa !35
  br i1 %216, label %.preheader.split.14.i, label %.split709.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %514 = trunc i64 %433 to i32
  %515 = or disjoint i32 %514, 13
  %516 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !35
  %518 = or disjoint i64 %436, 13
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 4, !tbaa !35
  br i1 %217, label %.preheader.split.15.i, label %.split709.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %520 = trunc i64 %433 to i32
  %521 = or disjoint i32 %520, 14
  %522 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !35
  %524 = or disjoint i64 %436, 14
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 8, !tbaa !35
  br i1 %218, label %526, label %.split709.us.i

526:                                              ; preds = %.preheader.split.15.i
  %527 = trunc i64 %433 to i32
  %528 = or disjoint i32 %527, 15
  %529 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %528
  %530 = load float, ptr addrspace(3) %529, align 4, !tbaa !35
  %531 = or disjoint i64 %436, 15
  %532 = getelementptr inbounds float, ptr %9, i64 %531
  store float %530, ptr %532, align 4, !tbaa !35
  br label %.split709.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %.split709.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="1,1" }
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
