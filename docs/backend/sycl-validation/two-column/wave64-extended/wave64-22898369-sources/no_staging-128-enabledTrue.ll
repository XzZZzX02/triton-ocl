;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-0jqtqzk7/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 16777215
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %31 = icmp ult i64 %30, 128
  call void @llvm.assume(i1 %31)
  %32 = icmp eq i64 %30, 0
  br i1 %32, label %33, label %.lr.ph.i

33:                                               ; preds = %6
  %34 = shl nuw i32 %.tr.i, 8
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
  %125 = icmp ult i64 %124, 128
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
  %131 = icmp ult i64 %130, 128
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
  %142 = add nuw nsw i64 %133, 128
  %143 = icmp ult i64 %133, 128
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
  %179 = icmp ult i64 %178, 128
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
  %189 = icmp ult i64 %188, 128
  call void @llvm.assume(i1 %189)
  %190 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %191 = inttoptr i32 %190 to ptr addrspace(3)
  %192 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 1024
  %193 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 2560
  %194 = and i64 %188, 15
  %195 = shl nuw nsw i64 %188, 1
  %196 = and i64 %195, 224
  br label %214

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, %.lr.ph710.i
  %197 = phi i64 [ %178, %.lr.ph710.i ], [ %206, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i ]
  %198 = lshr i64 %197, 4
  %199 = shl nuw nsw i64 %197, 5
  %200 = and i64 %199, 480
  %201 = or disjoint i64 %200, %198
  %202 = trunc i64 %201 to i32
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %182, i32 %202
  %.sroa.0378.0.copyload.i = load i16, ptr addrspace(3) %203, align 2, !tbaa.struct !23
  %204 = trunc i64 %197 to i32
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %204
  store i16 %.sroa.0378.0.copyload.i, ptr addrspace(3) %205, align 2, !tbaa.struct !23
  %206 = add nuw nsw i64 %197, 128
  %207 = icmp ult i64 %197, 384
  br i1 %207, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit7.i.i.i.i, label %.lr.ph713.i, !llvm.loop !35

._crit_edge714.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %208 = trunc i64 %188 to i32
  %209 = getelementptr inbounds float, ptr addrspace(3) %191, i32 %208
  store float %415, ptr addrspace(3) %209, align 4, !tbaa !36
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %210 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %211 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %212 = icmp ult i64 %211, 128
  call void @llvm.assume(i1 %212)
  %213 = icmp eq i64 %211, 0
  br i1 %213, label %418, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph713.i
  %215 = phi i64 [ 0, %.lr.ph713.i ], [ %416, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %216 = phi float [ 0.000000e+00, %.lr.ph713.i ], [ %415, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %217 = add nuw nsw i64 %215, %196
  %218 = trunc i64 %217 to i32
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %218
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %219, align 2, !tbaa.struct !23
  %220 = shl nuw nsw i64 %215, 4
  %221 = or disjoint i64 %220, %194
  %222 = trunc i64 %221 to i32
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %222
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %223, align 2, !tbaa.struct !23
  %224 = zext i16 %.sroa.0243.0.copyload.i to i32
  %225 = lshr i32 %224, 10
  %226 = and i32 %225, 31
  %227 = and i32 %224, 1023
  switch i32 %226, label %233 [
    i32 31, label %228
    i32 0, label %235
  ]

228:                                              ; preds = %214
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %229 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not692.i = icmp eq i32 %227, 0
  %230 = select i1 %.not692.i, i32 2139095040, i32 2143289344
  %231 = or disjoint i32 %230, %229
  %232 = bitcast i32 %231 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

233:                                              ; preds = %214
  %234 = or disjoint i32 %227, 1024
  br label %235

235:                                              ; preds = %233, %214
  %236 = phi i32 [ %234, %233 ], [ %227, %214 ]
  %237 = uitofp i32 %236 to float
  %.not.i = icmp eq i32 %226, 0
  %238 = add nsw i32 %226, -25
  %239 = select i1 %.not.i, i32 -24, i32 %238
  %240 = call float @__ocml_ldexp_f32(float noundef %237, i32 noundef %239) #6
  %241 = fneg contract float %240
  %.not662663.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %242 = select contract i1 %.not662663.i, float %241, float %240
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %235, %228
  %243 = phi float [ %232, %228 ], [ %242, %235 ]
  %244 = zext i16 %.sroa.0234.0.copyload.i to i32
  %245 = lshr i32 %244, 10
  %246 = and i32 %245, 31
  %247 = and i32 %244, 1023
  switch i32 %246, label %253 [
    i32 31, label %248
    i32 0, label %255
  ]

248:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %249 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not691.i = icmp eq i32 %247, 0
  %250 = select i1 %.not691.i, i32 2139095040, i32 2143289344
  %251 = or disjoint i32 %250, %249
  %252 = bitcast i32 %251 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

253:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %254 = or disjoint i32 %247, 1024
  br label %255

255:                                              ; preds = %253, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %256 = phi i32 [ %254, %253 ], [ %247, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %257 = uitofp i32 %256 to float
  %.not664.i = icmp eq i32 %246, 0
  %258 = add nsw i32 %246, -25
  %259 = select i1 %.not664.i, i32 -24, i32 %258
  %260 = call float @__ocml_ldexp_f32(float noundef %257, i32 noundef %259) #6
  %261 = fneg contract float %260
  %.not665666.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %262 = select contract i1 %.not665666.i, float %261, float %260
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i: ; preds = %255, %248
  %263 = phi float [ %252, %248 ], [ %262, %255 ]
  %264 = fmul contract float %243, %263
  %265 = fadd contract float %216, %264
  %266 = or disjoint i64 %215, 1
  %267 = add nuw nsw i64 %266, %196
  %268 = trunc i64 %267 to i32
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %268
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %269, align 2, !tbaa.struct !23
  %270 = shl nuw nsw i64 %266, 4
  %271 = or disjoint i64 %270, %194
  %272 = trunc i64 %271 to i32
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %272
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %273, align 2, !tbaa.struct !23
  %274 = zext i16 %.sroa.0225.0.copyload.i to i32
  %275 = lshr i32 %274, 10
  %276 = and i32 %275, 31
  %277 = and i32 %274, 1023
  switch i32 %276, label %283 [
    i32 31, label %278
    i32 0, label %285
  ]

278:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %279 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not690.i = icmp eq i32 %277, 0
  %280 = select i1 %.not690.i, i32 2139095040, i32 2143289344
  %281 = or disjoint i32 %280, %279
  %282 = bitcast i32 %281 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

283:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %284 = or disjoint i32 %277, 1024
  br label %285

285:                                              ; preds = %283, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %286 = phi i32 [ %284, %283 ], [ %277, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i ]
  %287 = uitofp i32 %286 to float
  %.not667.i = icmp eq i32 %276, 0
  %288 = add nsw i32 %276, -25
  %289 = select i1 %.not667.i, i32 -24, i32 %288
  %290 = call float @__ocml_ldexp_f32(float noundef %287, i32 noundef %289) #6
  %291 = fneg contract float %290
  %.not668669.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %292 = select contract i1 %.not668669.i, float %291, float %290
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %285, %278
  %293 = phi float [ %282, %278 ], [ %292, %285 ]
  %294 = zext i16 %.sroa.0216.0.copyload.i to i32
  %295 = lshr i32 %294, 10
  %296 = and i32 %295, 31
  %297 = and i32 %294, 1023
  switch i32 %296, label %303 [
    i32 31, label %298
    i32 0, label %305
  ]

298:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %299 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not689.i = icmp eq i32 %297, 0
  %300 = select i1 %.not689.i, i32 2139095040, i32 2143289344
  %301 = or disjoint i32 %300, %299
  %302 = bitcast i32 %301 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

303:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %304 = or disjoint i32 %297, 1024
  br label %305

305:                                              ; preds = %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %306 = phi i32 [ %304, %303 ], [ %297, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %307 = uitofp i32 %306 to float
  %.not670.i = icmp eq i32 %296, 0
  %308 = add nsw i32 %296, -25
  %309 = select i1 %.not670.i, i32 -24, i32 %308
  %310 = call float @__ocml_ldexp_f32(float noundef %307, i32 noundef %309) #6
  %311 = fneg contract float %310
  %.not671672.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %312 = select contract i1 %.not671672.i, float %311, float %310
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i: ; preds = %305, %298
  %313 = phi float [ %302, %298 ], [ %312, %305 ]
  %314 = fmul contract float %293, %313
  %315 = fadd contract float %265, %314
  %316 = or disjoint i64 %215, 2
  %317 = add nuw nsw i64 %316, %196
  %318 = trunc i64 %317 to i32
  %319 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %318
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %319, align 2, !tbaa.struct !23
  %320 = shl nuw nsw i64 %316, 4
  %321 = or disjoint i64 %320, %194
  %322 = trunc i64 %321 to i32
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %322
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %323, align 2, !tbaa.struct !23
  %324 = zext i16 %.sroa.0207.0.copyload.i to i32
  %325 = lshr i32 %324, 10
  %326 = and i32 %325, 31
  %327 = and i32 %324, 1023
  switch i32 %326, label %333 [
    i32 31, label %328
    i32 0, label %335
  ]

328:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %329 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not688.i = icmp eq i32 %327, 0
  %330 = select i1 %.not688.i, i32 2139095040, i32 2143289344
  %331 = or disjoint i32 %330, %329
  %332 = bitcast i32 %331 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

333:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %334 = or disjoint i32 %327, 1024
  br label %335

335:                                              ; preds = %333, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i
  %336 = phi i32 [ %334, %333 ], [ %327, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i.i ]
  %337 = uitofp i32 %336 to float
  %.not673.i = icmp eq i32 %326, 0
  %338 = add nsw i32 %326, -25
  %339 = select i1 %.not673.i, i32 -24, i32 %338
  %340 = call float @__ocml_ldexp_f32(float noundef %337, i32 noundef %339) #6
  %341 = fneg contract float %340
  %.not674675.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %342 = select contract i1 %.not674675.i, float %341, float %340
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %335, %328
  %343 = phi float [ %332, %328 ], [ %342, %335 ]
  %344 = zext i16 %.sroa.0198.0.copyload.i to i32
  %345 = lshr i32 %344, 10
  %346 = and i32 %345, 31
  %347 = and i32 %344, 1023
  switch i32 %346, label %353 [
    i32 31, label %348
    i32 0, label %355
  ]

348:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %349 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not687.i = icmp eq i32 %347, 0
  %350 = select i1 %.not687.i, i32 2139095040, i32 2143289344
  %351 = or disjoint i32 %350, %349
  %352 = bitcast i32 %351 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

353:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %354 = or disjoint i32 %347, 1024
  br label %355

355:                                              ; preds = %353, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %356 = phi i32 [ %354, %353 ], [ %347, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %357 = uitofp i32 %356 to float
  %.not676.i = icmp eq i32 %346, 0
  %358 = add nsw i32 %346, -25
  %359 = select i1 %.not676.i, i32 -24, i32 %358
  %360 = call float @__ocml_ldexp_f32(float noundef %357, i32 noundef %359) #6
  %361 = fneg contract float %360
  %.not677678.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %362 = select contract i1 %.not677678.i, float %361, float %360
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i: ; preds = %355, %348
  %363 = phi float [ %352, %348 ], [ %362, %355 ]
  %364 = fmul contract float %343, %363
  %365 = fadd contract float %315, %364
  %366 = or disjoint i64 %215, 3
  %367 = add nuw nsw i64 %366, %196
  %368 = trunc i64 %367 to i32
  %369 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %368
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %369, align 2, !tbaa.struct !23
  %370 = shl nuw nsw i64 %366, 4
  %371 = or disjoint i64 %370, %194
  %372 = trunc i64 %371 to i32
  %373 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %372
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %373, align 2, !tbaa.struct !23
  %374 = zext i16 %.sroa.0189.0.copyload.i to i32
  %375 = lshr i32 %374, 10
  %376 = and i32 %375, 31
  %377 = and i32 %374, 1023
  switch i32 %376, label %383 [
    i32 31, label %378
    i32 0, label %385
  ]

378:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %379 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not686.i = icmp eq i32 %377, 0
  %380 = select i1 %.not686.i, i32 2139095040, i32 2143289344
  %381 = or disjoint i32 %380, %379
  %382 = bitcast i32 %381 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

383:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %384 = or disjoint i32 %377, 1024
  br label %385

385:                                              ; preds = %383, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %386 = phi i32 [ %384, %383 ], [ %377, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i ]
  %387 = uitofp i32 %386 to float
  %.not679.i = icmp eq i32 %376, 0
  %388 = add nsw i32 %376, -25
  %389 = select i1 %.not679.i, i32 -24, i32 %388
  %390 = call float @__ocml_ldexp_f32(float noundef %387, i32 noundef %389) #6
  %391 = fneg contract float %390
  %.not680681.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %392 = select contract i1 %.not680681.i, float %391, float %390
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i: ; preds = %385, %378
  %393 = phi float [ %382, %378 ], [ %392, %385 ]
  %394 = zext i16 %.sroa.0180.0.copyload.i to i32
  %395 = lshr i32 %394, 10
  %396 = and i32 %395, 31
  %397 = and i32 %394, 1023
  switch i32 %396, label %403 [
    i32 31, label %398
    i32 0, label %405
  ]

398:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %399 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not685.i = icmp eq i32 %397, 0
  %400 = select i1 %.not685.i, i32 2139095040, i32 2143289344
  %401 = or disjoint i32 %400, %399
  %402 = bitcast i32 %401 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

403:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %404 = or disjoint i32 %397, 1024
  br label %405

405:                                              ; preds = %403, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %406 = phi i32 [ %404, %403 ], [ %397, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i ]
  %407 = uitofp i32 %406 to float
  %.not682.i = icmp eq i32 %396, 0
  %408 = add nsw i32 %396, -25
  %409 = select i1 %.not682.i, i32 -24, i32 %408
  %410 = call float @__ocml_ldexp_f32(float noundef %407, i32 noundef %409) #6
  %411 = fneg contract float %410
  %.not683684.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %412 = select contract i1 %.not683684.i, float %411, float %410
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %405, %398
  %413 = phi float [ %402, %398 ], [ %412, %405 ]
  %414 = fmul contract float %393, %413
  %415 = fadd contract float %365, %414
  %416 = add nuw nsw i64 %215, 4
  %417 = icmp ult i64 %215, 28
  br i1 %417, label %214, label %._crit_edge714.i, !llvm.loop !38

418:                                              ; preds = %._crit_edge714.i
  %419 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %420 = icmp eq i64 %419, 0
  call void @llvm.assume(i1 %420)
  %421 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %422 = icmp eq i64 %421, 0
  call void @llvm.assume(i1 %422)
  %423 = sext i32 %3 to i64
  %424 = call i32 @llvm.amdgcn.groupstaticsize()
  %425 = inttoptr i32 %424 to ptr addrspace(3)
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

.preheader.i:                                     ; preds = %.split716.us.i, %418
  %442 = phi i64 [ 0, %418 ], [ %448, %.split716.us.i ]
  %443 = icmp slt i64 %442, %423
  %444 = shl i64 %442, 4
  %.tr661.i = trunc i64 %442 to i32
  %445 = shl i32 %.tr661.i, 4
  %446 = sext i32 %445 to i64
  %447 = add nsw i64 %210, %446
  %.fr717.i = freeze i1 %443
  %brmerge.not.i = select i1 %.fr717.i, i1 %426, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split716.us.i

.split716.us.i:                                   ; preds = %537, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %448 = add nuw nsw i64 %442, 1
  %exitcond725.not.i = icmp eq i64 %448, 8
  br i1 %exitcond725.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %449 = trunc i64 %444 to i32
  %450 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !36
  %452 = getelementptr inbounds float, ptr %9, i64 %447
  store float %451, ptr %452, align 32, !tbaa !36
  br i1 %427, label %.preheader.split.2.i, label %.split716.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %453 = trunc i64 %444 to i32
  %454 = or disjoint i32 %453, 1
  %455 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !36
  %457 = or disjoint i64 %447, 1
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 4, !tbaa !36
  br i1 %428, label %.preheader.split.3.i, label %.split716.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %459 = trunc i64 %444 to i32
  %460 = or disjoint i32 %459, 2
  %461 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !36
  %463 = or disjoint i64 %447, 2
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 8, !tbaa !36
  br i1 %429, label %.preheader.split.4.i, label %.split716.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %465 = trunc i64 %444 to i32
  %466 = or disjoint i32 %465, 3
  %467 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !36
  %469 = or disjoint i64 %447, 3
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 4, !tbaa !36
  br i1 %430, label %.preheader.split.5.i, label %.split716.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %471 = trunc i64 %444 to i32
  %472 = or disjoint i32 %471, 4
  %473 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !36
  %475 = or disjoint i64 %447, 4
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 16, !tbaa !36
  br i1 %431, label %.preheader.split.6.i, label %.split716.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %477 = trunc i64 %444 to i32
  %478 = or disjoint i32 %477, 5
  %479 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !36
  %481 = or disjoint i64 %447, 5
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 4, !tbaa !36
  br i1 %432, label %.preheader.split.7.i, label %.split716.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %483 = trunc i64 %444 to i32
  %484 = or disjoint i32 %483, 6
  %485 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !36
  %487 = or disjoint i64 %447, 6
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 8, !tbaa !36
  br i1 %433, label %.preheader.split.8.i, label %.split716.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %489 = trunc i64 %444 to i32
  %490 = or disjoint i32 %489, 7
  %491 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !36
  %493 = or disjoint i64 %447, 7
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 4, !tbaa !36
  br i1 %434, label %.preheader.split.9.i, label %.split716.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %495 = trunc i64 %444 to i32
  %496 = or disjoint i32 %495, 8
  %497 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !36
  %499 = or disjoint i64 %447, 8
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 32, !tbaa !36
  br i1 %435, label %.preheader.split.10.i, label %.split716.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %501 = trunc i64 %444 to i32
  %502 = or disjoint i32 %501, 9
  %503 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !36
  %505 = or disjoint i64 %447, 9
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 4, !tbaa !36
  br i1 %436, label %.preheader.split.11.i, label %.split716.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %507 = trunc i64 %444 to i32
  %508 = or disjoint i32 %507, 10
  %509 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !36
  %511 = or disjoint i64 %447, 10
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 8, !tbaa !36
  br i1 %437, label %.preheader.split.12.i, label %.split716.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %513 = trunc i64 %444 to i32
  %514 = or disjoint i32 %513, 11
  %515 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %514
  %516 = load float, ptr addrspace(3) %515, align 4, !tbaa !36
  %517 = or disjoint i64 %447, 11
  %518 = getelementptr inbounds float, ptr %9, i64 %517
  store float %516, ptr %518, align 4, !tbaa !36
  br i1 %438, label %.preheader.split.13.i, label %.split716.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %519 = trunc i64 %444 to i32
  %520 = or disjoint i32 %519, 12
  %521 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %520
  %522 = load float, ptr addrspace(3) %521, align 4, !tbaa !36
  %523 = or disjoint i64 %447, 12
  %524 = getelementptr inbounds float, ptr %9, i64 %523
  store float %522, ptr %524, align 16, !tbaa !36
  br i1 %439, label %.preheader.split.14.i, label %.split716.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %525 = trunc i64 %444 to i32
  %526 = or disjoint i32 %525, 13
  %527 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !36
  %529 = or disjoint i64 %447, 13
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 4, !tbaa !36
  br i1 %440, label %.preheader.split.15.i, label %.split716.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %531 = trunc i64 %444 to i32
  %532 = or disjoint i32 %531, 14
  %533 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %532
  %534 = load float, ptr addrspace(3) %533, align 4, !tbaa !36
  %535 = or disjoint i64 %447, 14
  %536 = getelementptr inbounds float, ptr %9, i64 %535
  store float %534, ptr %536, align 8, !tbaa !36
  br i1 %441, label %537, label %.split716.us.i

537:                                              ; preds = %.preheader.split.15.i
  %538 = trunc i64 %444 to i32
  %539 = or disjoint i32 %538, 15
  %540 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !36
  %542 = or disjoint i64 %447, 15
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 4, !tbaa !36
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
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
;----------------- End AdaptiveCpp IR dump ---------------
