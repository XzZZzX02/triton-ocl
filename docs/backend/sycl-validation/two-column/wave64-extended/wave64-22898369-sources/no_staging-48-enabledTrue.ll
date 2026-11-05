;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-donccf_z/kernel.cpp"
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
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 44739242
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %31 = icmp ult i64 %30, 48
  call void @llvm.assume(i1 %31)
  %32 = icmp eq i64 %30, 0
  br i1 %32, label %33, label %.lr.ph.i

33:                                               ; preds = %6
  %34 = shl i32 %.tr.i, 8
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
  %43 = sext i32 %34 to i64
  %44 = icmp sgt i32 %3, 0
  %45 = icmp ugt i32 %3, 1
  %46 = icmp ugt i32 %3, 2
  %47 = icmp ugt i32 %3, 3
  %48 = icmp ugt i32 %3, 4
  %49 = icmp ugt i32 %3, 5
  %50 = icmp ugt i32 %3, 6
  %51 = icmp ugt i32 %3, 7
  br label %.preheader700.i

.preheader700.i:                                  ; preds = %.split.us.i, %33
  %52 = phi i64 [ 0, %33 ], [ %62, %.split.us.i ]
  %53 = icmp slt i64 %52, %39
  %54 = shl i64 %52, 3
  %.tr694.i = trunc i64 %52 to i32
  %55 = shl i32 %.tr694.i, 3
  %56 = sext i32 %55 to i64
  %57 = add nsw i64 %56, %43
  %.fr.i = freeze i1 %53
  br i1 %.fr.i, label %.preheader700.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader700.i
  %.tr727.i = trunc i64 %52 to i32
  %58 = shl i32 %.tr727.i, 4
  %59 = add i32 %58, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %59
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader700.split.preheader.i:                  ; preds = %.preheader700.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader700.split.preheader.i
  %60 = trunc i64 %54 to i32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %60
  store i16 0, ptr addrspace(3) %61, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %62 = add nuw nsw i64 %52, 1
  %exitcond.not.i = icmp eq i64 %62, 32
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader700.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader700.split.preheader.i
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0317.0.copyload.i = load i16, ptr %63, align 16, !tbaa.struct !23
  %64 = trunc i64 %54 to i32
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %64
  store i16 %.sroa.0317.0.copyload.i, ptr addrspace(3) %65, align 2, !tbaa.struct !23
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
  %.sroa.0317.0.copyload.1.i = load i16, ptr %70, align 2, !tbaa.struct !23
  %71 = trunc i64 %54 to i32
  %72 = or disjoint i32 %71, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0317.0.copyload.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !23
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
  %.sroa.0317.0.copyload.2.i = load i16, ptr %78, align 4, !tbaa.struct !23
  %79 = trunc i64 %54 to i32
  %80 = or disjoint i32 %79, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0317.0.copyload.2.i, ptr addrspace(3) %81, align 2, !tbaa.struct !23
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
  %.sroa.0317.0.copyload.3.i = load i16, ptr %86, align 2, !tbaa.struct !23
  %87 = trunc i64 %54 to i32
  %88 = or disjoint i32 %87, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0317.0.copyload.3.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
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
  %.sroa.0317.0.copyload.4.i = load i16, ptr %94, align 8, !tbaa.struct !23
  %95 = trunc i64 %54 to i32
  %96 = or disjoint i32 %95, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0317.0.copyload.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
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
  %.sroa.0317.0.copyload.5.i = load i16, ptr %102, align 2, !tbaa.struct !23
  %103 = trunc i64 %54 to i32
  %104 = or disjoint i32 %103, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0317.0.copyload.5.i, ptr addrspace(3) %105, align 2, !tbaa.struct !23
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
  %.sroa.0317.0.copyload.6.i = load i16, ptr %110, align 4, !tbaa.struct !23
  %111 = trunc i64 %54 to i32
  %112 = or disjoint i32 %111, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0317.0.copyload.6.i, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br i1 %51, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

114:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %115 = or disjoint i64 %57, 7
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0317.0.copyload.7.i = load i16, ptr %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %114, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %.sroa.0319.2.7.i = phi i16 [ %.sroa.0317.0.copyload.7.i, %114 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i ]
  %117 = trunc i64 %54 to i32
  %118 = or disjoint i32 %117, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %118
  store i16 %.sroa.0319.2.7.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
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
  %125 = icmp ult i64 %124, 48
  call void @llvm.assume(i1 %125)
  %126 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %127 = inttoptr i32 %126 to ptr addrspace(3)
  %128 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 512
  %129 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %131 = icmp ult i64 %130, 48
  call void @llvm.assume(i1 %131)
  %132 = icmp eq i64 %130, 0
  br i1 %132, label %144, label %.lr.ph710.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i.i, %.lr.ph.i
  %133 = phi i64 [ %124, %.lr.ph.i ], [ %142, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i.i ]
  %134 = lshr i64 %133, 5
  %135 = shl nuw nsw i64 %133, 3
  %136 = and i64 %135, 248
  %137 = or disjoint i64 %136, %134
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %138
  %.sroa.0379.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !23
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %129, i32 %140
  store i16 %.sroa.0379.0.copyload.i, ptr addrspace(3) %141, align 2, !tbaa.struct !23
  %142 = add nuw nsw i64 %133, 48
  %143 = icmp ult i64 %133, 208
  br i1 %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i.i, label %._crit_edge.i, !llvm.loop !32

144:                                              ; preds = %._crit_edge.i
  %145 = shl i32 %.tr.i, 9
  %146 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %147 = icmp eq i64 %146, 0
  call void @llvm.assume(i1 %147)
  %148 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %149 = icmp eq i64 %148, 0
  call void @llvm.assume(i1 %149)
  %150 = sext i32 %4 to i64
  %151 = sext i32 %5 to i64
  %152 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %153 = inttoptr i32 %152 to ptr addrspace(3)
  %154 = getelementptr inbounds i8, ptr addrspace(3) %153, i32 1536
  %155 = sext i32 %145 to i64
  br label %.preheader699.i

.preheader699.i:                                  ; preds = %.split707.us.i, %144
  %156 = phi i64 [ 0, %144 ], [ %164, %.split707.us.i ]
  %157 = icmp slt i64 %156, %150
  %158 = shl i64 %156, 5
  %.tr693.i = trunc i64 %156 to i32
  %159 = shl i32 %.tr693.i, 5
  %160 = sext i32 %159 to i64
  %161 = add nsw i64 %160, %155
  %.fr708.i = freeze i1 %157
  br i1 %.fr708.i, label %.preheader699.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.us.preheader.i: ; preds = %.preheader699.i
  %.tr726.i = trunc i64 %156 to i32
  %162 = shl i32 %.tr726.i, 6
  %163 = add i32 %162, 1536
  %scevgep721.i = getelementptr i8, ptr addrspace(3) %153, i32 %163
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep721.i, i8 0, i32 64, i1 false)
  br label %.split707.us.i

.split707.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.us.preheader.i
  %164 = add nuw nsw i64 %156, 1
  %exitcond723.not.i = icmp eq i64 %164, 16
  br i1 %exitcond723.not.i, label %.lr.ph710.i, label %.preheader699.i, !llvm.loop !33

.preheader699.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.i, %.preheader699.i
  %165 = phi i64 [ %173, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.i ], [ 0, %.preheader699.i ]
  %166 = icmp slt i64 %165, %151
  br i1 %166, label %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.i

167:                                              ; preds = %.preheader699.split.i
  %168 = add nuw nsw i64 %161, %165
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %168
  %.sroa.0280.0.copyload.i = load i16, ptr %169, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit22.i.i.i.i: ; preds = %167, %.preheader699.split.i
  %.sroa.0282.2.i = phi i16 [ %.sroa.0280.0.copyload.i, %167 ], [ 0, %.preheader699.split.i ]
  %170 = add nuw nsw i64 %165, %158
  %171 = trunc i64 %170 to i32
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %171
  store i16 %.sroa.0282.2.i, ptr addrspace(3) %172, align 2, !tbaa.struct !23
  %173 = add nuw nsw i64 %165, 1
  %exitcond722.not.i = icmp eq i64 %173, 32
  br i1 %exitcond722.not.i, label %.split707.us.i, label %.preheader699.split.i, !llvm.loop !34

.lr.ph710.i:                                      ; preds = %.split707.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %174 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %175 = icmp eq i64 %174, 0
  call void @llvm.assume(i1 %175)
  %176 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %177 = icmp eq i64 %176, 0
  call void @llvm.assume(i1 %177)
  %178 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %179 = icmp ult i64 %178, 48
  call void @llvm.assume(i1 %179)
  %180 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %181 = inttoptr i32 %180 to ptr addrspace(3)
  %182 = getelementptr inbounds i8, ptr addrspace(3) %181, i32 1536
  %183 = getelementptr inbounds i8, ptr addrspace(3) %181, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i

.lr.ph713.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %184 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %185 = icmp eq i64 %184, 0
  call void @llvm.assume(i1 %185)
  %186 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %187 = icmp eq i64 %186, 0
  call void @llvm.assume(i1 %187)
  %188 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %189 = icmp ult i64 %188, 48
  call void @llvm.assume(i1 %189)
  %190 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %191 = inttoptr i32 %190 to ptr addrspace(3)
  %192 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 1024
  %193 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 2560
  %194 = and i64 %188, 15
  br label %209

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, %.lr.ph710.i
  %195 = phi i64 [ %178, %.lr.ph710.i ], [ %204, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i ]
  %196 = lshr i64 %195, 4
  %197 = shl nuw nsw i64 %195, 5
  %198 = and i64 %197, 480
  %199 = or disjoint i64 %198, %196
  %200 = trunc i64 %199 to i32
  %201 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %182, i32 %200
  %.sroa.0378.0.copyload.i = load i16, ptr addrspace(3) %201, align 2, !tbaa.struct !23
  %202 = trunc i64 %195 to i32
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %202
  store i16 %.sroa.0378.0.copyload.i, ptr addrspace(3) %203, align 2, !tbaa.struct !23
  %204 = add nuw nsw i64 %195, 48
  %205 = icmp ult i64 %195, 464
  br i1 %205, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, label %.lr.ph713.i, !llvm.loop !35

._crit_edge714.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %206 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %207 = icmp ult i64 %206, 48
  call void @llvm.assume(i1 %207)
  %208 = icmp eq i64 %206, 0
  br i1 %208, label %422, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

209:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.lr.ph713.i
  %210 = phi i64 [ %188, %.lr.ph713.i ], [ %216, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %211 = shl nuw nsw i64 %210, 1
  %212 = and i64 %211, 224
  br label %218

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %213 = trunc i64 %210 to i32
  %214 = and i32 %213, 127
  %215 = getelementptr inbounds float, ptr addrspace(3) %191, i32 %214
  store float %419, ptr addrspace(3) %215, align 4, !tbaa !36
  %216 = add nuw nsw i64 %210, 48
  %217 = icmp ult i64 %210, 80
  br i1 %217, label %209, label %._crit_edge714.i, !llvm.loop !38

218:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %209
  %219 = phi i64 [ 0, %209 ], [ %420, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %220 = phi float [ 0.000000e+00, %209 ], [ %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %221 = add nuw nsw i64 %219, %212
  %222 = trunc i64 %221 to i32
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %222
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %223, align 2, !tbaa.struct !23
  %224 = shl nuw nsw i64 %219, 4
  %225 = or disjoint i64 %224, %194
  %226 = trunc i64 %225 to i32
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %226
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %227, align 2, !tbaa.struct !23
  %228 = zext i16 %.sroa.0243.0.copyload.i to i32
  %229 = lshr i32 %228, 10
  %230 = and i32 %229, 31
  %231 = and i32 %228, 1023
  switch i32 %230, label %237 [
    i32 31, label %232
    i32 0, label %239
  ]

232:                                              ; preds = %218
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %233 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %231, 0
  %234 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %235 = or disjoint i32 %234, %233
  %236 = bitcast i32 %235 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

237:                                              ; preds = %218
  %238 = or disjoint i32 %231, 1024
  br label %239

239:                                              ; preds = %237, %218
  %240 = phi i32 [ %238, %237 ], [ %231, %218 ]
  %241 = uitofp i32 %240 to float
  %.not.i = icmp eq i32 %230, 0
  %242 = add nsw i32 %230, -25
  %243 = select i1 %.not.i, i32 -24, i32 %242
  %244 = call float @__ocml_ldexp_f32(float noundef %241, i32 noundef %243) #6
  %245 = fneg contract float %244
  %.not662663.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %246 = select contract i1 %.not662663.i, float %245, float %244
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %239, %232
  %247 = phi float [ %236, %232 ], [ %246, %239 ]
  %248 = zext i16 %.sroa.0234.0.copyload.i to i32
  %249 = lshr i32 %248, 10
  %250 = and i32 %249, 31
  %251 = and i32 %248, 1023
  switch i32 %250, label %257 [
    i32 31, label %252
    i32 0, label %259
  ]

252:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %253 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %251, 0
  %254 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %255 = or disjoint i32 %254, %253
  %256 = bitcast i32 %255 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

257:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %258 = or disjoint i32 %251, 1024
  br label %259

259:                                              ; preds = %257, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %260 = phi i32 [ %258, %257 ], [ %251, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %261 = uitofp i32 %260 to float
  %.not664.i = icmp eq i32 %250, 0
  %262 = add nsw i32 %250, -25
  %263 = select i1 %.not664.i, i32 -24, i32 %262
  %264 = call float @__ocml_ldexp_f32(float noundef %261, i32 noundef %263) #6
  %265 = fneg contract float %264
  %.not665666.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %266 = select contract i1 %.not665666.i, float %265, float %264
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i: ; preds = %259, %252
  %267 = phi float [ %256, %252 ], [ %266, %259 ]
  %268 = fmul contract float %247, %267
  %269 = fadd contract float %220, %268
  %270 = or disjoint i64 %219, 1
  %271 = add nuw nsw i64 %270, %212
  %272 = trunc i64 %271 to i32
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %272
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %273, align 2, !tbaa.struct !23
  %274 = shl nuw nsw i64 %270, 4
  %275 = or disjoint i64 %274, %194
  %276 = trunc i64 %275 to i32
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %276
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %277, align 2, !tbaa.struct !23
  %278 = zext i16 %.sroa.0225.0.copyload.i to i32
  %279 = lshr i32 %278, 10
  %280 = and i32 %279, 31
  %281 = and i32 %278, 1023
  switch i32 %280, label %287 [
    i32 31, label %282
    i32 0, label %289
  ]

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %283 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %281, 0
  %284 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %285 = or disjoint i32 %284, %283
  %286 = bitcast i32 %285 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

287:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %288 = or disjoint i32 %281, 1024
  br label %289

289:                                              ; preds = %287, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %290 = phi i32 [ %288, %287 ], [ %281, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i ]
  %291 = uitofp i32 %290 to float
  %.not667.i = icmp eq i32 %280, 0
  %292 = add nsw i32 %280, -25
  %293 = select i1 %.not667.i, i32 -24, i32 %292
  %294 = call float @__ocml_ldexp_f32(float noundef %291, i32 noundef %293) #6
  %295 = fneg contract float %294
  %.not668669.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %296 = select contract i1 %.not668669.i, float %295, float %294
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %289, %282
  %297 = phi float [ %286, %282 ], [ %296, %289 ]
  %298 = zext i16 %.sroa.0216.0.copyload.i to i32
  %299 = lshr i32 %298, 10
  %300 = and i32 %299, 31
  %301 = and i32 %298, 1023
  switch i32 %300, label %307 [
    i32 31, label %302
    i32 0, label %309
  ]

302:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %303 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %301, 0
  %304 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %305 = or disjoint i32 %304, %303
  %306 = bitcast i32 %305 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

307:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %308 = or disjoint i32 %301, 1024
  br label %309

309:                                              ; preds = %307, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %310 = phi i32 [ %308, %307 ], [ %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %311 = uitofp i32 %310 to float
  %.not670.i = icmp eq i32 %300, 0
  %312 = add nsw i32 %300, -25
  %313 = select i1 %.not670.i, i32 -24, i32 %312
  %314 = call float @__ocml_ldexp_f32(float noundef %311, i32 noundef %313) #6
  %315 = fneg contract float %314
  %.not671672.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %316 = select contract i1 %.not671672.i, float %315, float %314
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i: ; preds = %309, %302
  %317 = phi float [ %306, %302 ], [ %316, %309 ]
  %318 = fmul contract float %297, %317
  %319 = fadd contract float %269, %318
  %320 = or disjoint i64 %219, 2
  %321 = add nuw nsw i64 %320, %212
  %322 = trunc i64 %321 to i32
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %322
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %323, align 2, !tbaa.struct !23
  %324 = shl nuw nsw i64 %320, 4
  %325 = or disjoint i64 %324, %194
  %326 = trunc i64 %325 to i32
  %327 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %326
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %327, align 2, !tbaa.struct !23
  %328 = zext i16 %.sroa.0207.0.copyload.i to i32
  %329 = lshr i32 %328, 10
  %330 = and i32 %329, 31
  %331 = and i32 %328, 1023
  switch i32 %330, label %337 [
    i32 31, label %332
    i32 0, label %339
  ]

332:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %333 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not688.i = icmp eq i32 %331, 0
  %334 = select i1 %.not688.i, i32 2139095040, i32 2143289344
  %335 = or disjoint i32 %334, %333
  %336 = bitcast i32 %335 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

337:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %338 = or disjoint i32 %331, 1024
  br label %339

339:                                              ; preds = %337, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %340 = phi i32 [ %338, %337 ], [ %331, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i ]
  %341 = uitofp i32 %340 to float
  %.not673.i = icmp eq i32 %330, 0
  %342 = add nsw i32 %330, -25
  %343 = select i1 %.not673.i, i32 -24, i32 %342
  %344 = call float @__ocml_ldexp_f32(float noundef %341, i32 noundef %343) #6
  %345 = fneg contract float %344
  %.not674675.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %346 = select contract i1 %.not674675.i, float %345, float %344
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %339, %332
  %347 = phi float [ %336, %332 ], [ %346, %339 ]
  %348 = zext i16 %.sroa.0198.0.copyload.i to i32
  %349 = lshr i32 %348, 10
  %350 = and i32 %349, 31
  %351 = and i32 %348, 1023
  switch i32 %350, label %357 [
    i32 31, label %352
    i32 0, label %359
  ]

352:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %353 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not687.i = icmp eq i32 %351, 0
  %354 = select i1 %.not687.i, i32 2139095040, i32 2143289344
  %355 = or disjoint i32 %354, %353
  %356 = bitcast i32 %355 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

357:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %358 = or disjoint i32 %351, 1024
  br label %359

359:                                              ; preds = %357, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %360 = phi i32 [ %358, %357 ], [ %351, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %361 = uitofp i32 %360 to float
  %.not676.i = icmp eq i32 %350, 0
  %362 = add nsw i32 %350, -25
  %363 = select i1 %.not676.i, i32 -24, i32 %362
  %364 = call float @__ocml_ldexp_f32(float noundef %361, i32 noundef %363) #6
  %365 = fneg contract float %364
  %.not677678.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %366 = select contract i1 %.not677678.i, float %365, float %364
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i: ; preds = %359, %352
  %367 = phi float [ %356, %352 ], [ %366, %359 ]
  %368 = fmul contract float %347, %367
  %369 = fadd contract float %319, %368
  %370 = or disjoint i64 %219, 3
  %371 = add nuw nsw i64 %370, %212
  %372 = trunc i64 %371 to i32
  %373 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %372
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %373, align 2, !tbaa.struct !23
  %374 = shl nuw nsw i64 %370, 4
  %375 = or disjoint i64 %374, %194
  %376 = trunc i64 %375 to i32
  %377 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %376
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %377, align 2, !tbaa.struct !23
  %378 = zext i16 %.sroa.0189.0.copyload.i to i32
  %379 = lshr i32 %378, 10
  %380 = and i32 %379, 31
  %381 = and i32 %378, 1023
  switch i32 %380, label %387 [
    i32 31, label %382
    i32 0, label %389
  ]

382:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %383 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not686.i = icmp eq i32 %381, 0
  %384 = select i1 %.not686.i, i32 2139095040, i32 2143289344
  %385 = or disjoint i32 %384, %383
  %386 = bitcast i32 %385 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

387:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %388 = or disjoint i32 %381, 1024
  br label %389

389:                                              ; preds = %387, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %390 = phi i32 [ %388, %387 ], [ %381, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i ]
  %391 = uitofp i32 %390 to float
  %.not679.i = icmp eq i32 %380, 0
  %392 = add nsw i32 %380, -25
  %393 = select i1 %.not679.i, i32 -24, i32 %392
  %394 = call float @__ocml_ldexp_f32(float noundef %391, i32 noundef %393) #6
  %395 = fneg contract float %394
  %.not680681.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %396 = select contract i1 %.not680681.i, float %395, float %394
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i: ; preds = %389, %382
  %397 = phi float [ %386, %382 ], [ %396, %389 ]
  %398 = zext i16 %.sroa.0180.0.copyload.i to i32
  %399 = lshr i32 %398, 10
  %400 = and i32 %399, 31
  %401 = and i32 %398, 1023
  switch i32 %400, label %407 [
    i32 31, label %402
    i32 0, label %409
  ]

402:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %403 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not685.i = icmp eq i32 %401, 0
  %404 = select i1 %.not685.i, i32 2139095040, i32 2143289344
  %405 = or disjoint i32 %404, %403
  %406 = bitcast i32 %405 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

407:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %408 = or disjoint i32 %401, 1024
  br label %409

409:                                              ; preds = %407, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %410 = phi i32 [ %408, %407 ], [ %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i ]
  %411 = uitofp i32 %410 to float
  %.not682.i = icmp eq i32 %400, 0
  %412 = add nsw i32 %400, -25
  %413 = select i1 %.not682.i, i32 -24, i32 %412
  %414 = call float @__ocml_ldexp_f32(float noundef %411, i32 noundef %413) #6
  %415 = fneg contract float %414
  %.not683684.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %416 = select contract i1 %.not683684.i, float %415, float %414
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %409, %402
  %417 = phi float [ %406, %402 ], [ %416, %409 ]
  %418 = fmul contract float %397, %417
  %419 = fadd contract float %369, %418
  %420 = add nuw nsw i64 %219, 4
  %421 = icmp ult i64 %219, 28
  br i1 %421, label %218, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !39

422:                                              ; preds = %._crit_edge714.i
  %423 = shl i32 %.tr.i, 7
  %424 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %425 = icmp eq i64 %424, 0
  call void @llvm.assume(i1 %425)
  %426 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %427 = icmp eq i64 %426, 0
  call void @llvm.assume(i1 %427)
  %428 = sext i32 %3 to i64
  %429 = call i32 @llvm.amdgcn.groupstaticsize()
  %430 = inttoptr i32 %429 to ptr addrspace(3)
  %431 = sext i32 %423 to i64
  %432 = icmp sgt i32 %4, 0
  %433 = icmp ugt i32 %4, 1
  %434 = icmp ugt i32 %4, 2
  %435 = icmp ugt i32 %4, 3
  %436 = icmp ugt i32 %4, 4
  %437 = icmp ugt i32 %4, 5
  %438 = icmp ugt i32 %4, 6
  %439 = icmp ugt i32 %4, 7
  %440 = icmp ugt i32 %4, 8
  %441 = icmp ugt i32 %4, 9
  %442 = icmp ugt i32 %4, 10
  %443 = icmp ugt i32 %4, 11
  %444 = icmp ugt i32 %4, 12
  %445 = icmp ugt i32 %4, 13
  %446 = icmp ugt i32 %4, 14
  %447 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split716.us.i, %422
  %448 = phi i64 [ 0, %422 ], [ %454, %.split716.us.i ]
  %449 = icmp slt i64 %448, %428
  %450 = shl i64 %448, 4
  %.tr661.i = trunc i64 %448 to i32
  %451 = shl i32 %.tr661.i, 4
  %452 = sext i32 %451 to i64
  %453 = add nsw i64 %452, %431
  %.fr717.i = freeze i1 %449
  %brmerge.not.i = select i1 %.fr717.i, i1 %432, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split716.us.i

.split716.us.i:                                   ; preds = %543, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %454 = add nuw nsw i64 %448, 1
  %exitcond725.not.i = icmp eq i64 %454, 8
  br i1 %exitcond725.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !40

.preheader.split.1.i:                             ; preds = %.preheader.i
  %455 = trunc i64 %450 to i32
  %456 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !36
  %458 = getelementptr inbounds float, ptr %9, i64 %453
  store float %457, ptr %458, align 32, !tbaa !36
  br i1 %433, label %.preheader.split.2.i, label %.split716.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %459 = trunc i64 %450 to i32
  %460 = or disjoint i32 %459, 1
  %461 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !36
  %463 = or disjoint i64 %453, 1
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 4, !tbaa !36
  br i1 %434, label %.preheader.split.3.i, label %.split716.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %465 = trunc i64 %450 to i32
  %466 = or disjoint i32 %465, 2
  %467 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !36
  %469 = or disjoint i64 %453, 2
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 8, !tbaa !36
  br i1 %435, label %.preheader.split.4.i, label %.split716.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %471 = trunc i64 %450 to i32
  %472 = or disjoint i32 %471, 3
  %473 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !36
  %475 = or disjoint i64 %453, 3
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 4, !tbaa !36
  br i1 %436, label %.preheader.split.5.i, label %.split716.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %477 = trunc i64 %450 to i32
  %478 = or disjoint i32 %477, 4
  %479 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !36
  %481 = or disjoint i64 %453, 4
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 16, !tbaa !36
  br i1 %437, label %.preheader.split.6.i, label %.split716.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %483 = trunc i64 %450 to i32
  %484 = or disjoint i32 %483, 5
  %485 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !36
  %487 = or disjoint i64 %453, 5
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 4, !tbaa !36
  br i1 %438, label %.preheader.split.7.i, label %.split716.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %489 = trunc i64 %450 to i32
  %490 = or disjoint i32 %489, 6
  %491 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !36
  %493 = or disjoint i64 %453, 6
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 8, !tbaa !36
  br i1 %439, label %.preheader.split.8.i, label %.split716.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %495 = trunc i64 %450 to i32
  %496 = or disjoint i32 %495, 7
  %497 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !36
  %499 = or disjoint i64 %453, 7
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 4, !tbaa !36
  br i1 %440, label %.preheader.split.9.i, label %.split716.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %501 = trunc i64 %450 to i32
  %502 = or disjoint i32 %501, 8
  %503 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !36
  %505 = or disjoint i64 %453, 8
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 32, !tbaa !36
  br i1 %441, label %.preheader.split.10.i, label %.split716.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %507 = trunc i64 %450 to i32
  %508 = or disjoint i32 %507, 9
  %509 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !36
  %511 = or disjoint i64 %453, 9
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 4, !tbaa !36
  br i1 %442, label %.preheader.split.11.i, label %.split716.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %513 = trunc i64 %450 to i32
  %514 = or disjoint i32 %513, 10
  %515 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %514
  %516 = load float, ptr addrspace(3) %515, align 4, !tbaa !36
  %517 = or disjoint i64 %453, 10
  %518 = getelementptr inbounds float, ptr %9, i64 %517
  store float %516, ptr %518, align 8, !tbaa !36
  br i1 %443, label %.preheader.split.12.i, label %.split716.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %519 = trunc i64 %450 to i32
  %520 = or disjoint i32 %519, 11
  %521 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %520
  %522 = load float, ptr addrspace(3) %521, align 4, !tbaa !36
  %523 = or disjoint i64 %453, 11
  %524 = getelementptr inbounds float, ptr %9, i64 %523
  store float %522, ptr %524, align 4, !tbaa !36
  br i1 %444, label %.preheader.split.13.i, label %.split716.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %525 = trunc i64 %450 to i32
  %526 = or disjoint i32 %525, 12
  %527 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !36
  %529 = or disjoint i64 %453, 12
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 16, !tbaa !36
  br i1 %445, label %.preheader.split.14.i, label %.split716.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %531 = trunc i64 %450 to i32
  %532 = or disjoint i32 %531, 13
  %533 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %532
  %534 = load float, ptr addrspace(3) %533, align 4, !tbaa !36
  %535 = or disjoint i64 %453, 13
  %536 = getelementptr inbounds float, ptr %9, i64 %535
  store float %534, ptr %536, align 4, !tbaa !36
  br i1 %446, label %.preheader.split.15.i, label %.split716.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %537 = trunc i64 %450 to i32
  %538 = or disjoint i32 %537, 14
  %539 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %538
  %540 = load float, ptr addrspace(3) %539, align 4, !tbaa !36
  %541 = or disjoint i64 %453, 14
  %542 = getelementptr inbounds float, ptr %9, i64 %541
  store float %540, ptr %542, align 8, !tbaa !36
  br i1 %447, label %543, label %.split716.us.i

543:                                              ; preds = %.preheader.split.15.i
  %544 = trunc i64 %450 to i32
  %545 = or disjoint i32 %544, 15
  %546 = getelementptr inbounds float, ptr addrspace(3) %430, i32 %545
  %547 = load float, ptr addrspace(3) %546, align 4, !tbaa !36
  %548 = or disjoint i64 %453, 15
  %549 = getelementptr inbounds float, ptr %9, i64 %548
  store float %547, ptr %549, align 4, !tbaa !36
  br label %.split716.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge714.i, %.split716.us.i
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
!35 = distinct !{!35, !29, !30, !31}
!36 = !{!37, !37, i64 0}
!37 = !{!"float", !26, i64 0}
!38 = distinct !{!38, !29}
!39 = distinct !{!39, !29}
!40 = distinct !{!40, !29}
;----------------- End AdaptiveCpp IR dump ---------------
