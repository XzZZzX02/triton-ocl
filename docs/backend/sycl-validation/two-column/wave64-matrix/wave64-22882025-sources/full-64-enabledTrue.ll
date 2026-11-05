;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882025/tmp/triton-sycl-cache/compile-4hevrz55/kernel.cpp"
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
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 33554431
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl nuw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 64
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
  br label %.preheader562.i

.preheader562.i:                                  ; preds = %.split.us.i, %34
  %52 = phi i64 [ 0, %34 ], [ %62, %.split.us.i ]
  %53 = icmp slt i64 %52, %39
  %54 = shl i64 %52, 3
  %.tr557.i = trunc i64 %52 to i32
  %55 = shl i32 %.tr557.i, 3
  %56 = sext i32 %55 to i64
  %57 = add nsw i64 %56, %43
  %.fr.i = freeze i1 %53
  br i1 %.fr.i, label %.preheader562.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.us.preheader.i: ; preds = %.preheader562.i
  %.tr586.i = trunc i64 %52 to i32
  %58 = shl i32 %.tr586.i, 4
  %59 = add i32 %58, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %59
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader562.split.preheader.i:                  ; preds = %.preheader562.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.thread.i: ; preds = %.preheader562.split.preheader.i
  %60 = trunc i64 %54 to i32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %60
  store i16 0, ptr addrspace(3) %61, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.us.preheader.i
  %62 = add nuw nsw i64 %52, 1
  %exitcond.not.i = icmp eq i64 %62, 16
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader562.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i: ; preds = %.preheader562.split.preheader.i
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0282.0.copyload.i = load i16, ptr %63, align 16, !tbaa.struct !23
  %64 = trunc i64 %54 to i32
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %64
  store i16 %.sroa.0282.0.copyload.i, ptr addrspace(3) %65, align 2, !tbaa.struct !23
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.thread.i
  %66 = trunc i64 %54 to i32
  %67 = or disjoint i32 %66, 1
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %67
  store i16 0, ptr addrspace(3) %68, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i
  %69 = or disjoint i64 %57, 1
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %69
  %.sroa.0282.0.copyload.1.i = load i16, ptr %70, align 2, !tbaa.struct !23
  %71 = trunc i64 %54 to i32
  %72 = or disjoint i32 %71, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0282.0.copyload.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !23
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i
  %74 = trunc i64 %54 to i32
  %75 = or disjoint i32 %74, 2
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i
  %77 = or disjoint i64 %57, 2
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0282.0.copyload.2.i = load i16, ptr %78, align 4, !tbaa.struct !23
  %79 = trunc i64 %54 to i32
  %80 = or disjoint i32 %79, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0282.0.copyload.2.i, ptr addrspace(3) %81, align 2, !tbaa.struct !23
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i
  %82 = trunc i64 %54 to i32
  %83 = or disjoint i32 %82, 3
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i
  %85 = or disjoint i64 %57, 3
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0282.0.copyload.3.i = load i16, ptr %86, align 2, !tbaa.struct !23
  %87 = trunc i64 %54 to i32
  %88 = or disjoint i32 %87, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0282.0.copyload.3.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i
  %90 = trunc i64 %54 to i32
  %91 = or disjoint i32 %90, 4
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i
  %93 = or disjoint i64 %57, 4
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0282.0.copyload.4.i = load i16, ptr %94, align 8, !tbaa.struct !23
  %95 = trunc i64 %54 to i32
  %96 = or disjoint i32 %95, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0282.0.copyload.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i
  %98 = trunc i64 %54 to i32
  %99 = or disjoint i32 %98, 5
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i
  %101 = or disjoint i64 %57, 5
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0282.0.copyload.5.i = load i16, ptr %102, align 2, !tbaa.struct !23
  %103 = trunc i64 %54 to i32
  %104 = or disjoint i32 %103, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0282.0.copyload.5.i, ptr addrspace(3) %105, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i
  %106 = trunc i64 %54 to i32
  %107 = or disjoint i32 %106, 6
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i
  %109 = or disjoint i64 %57, 6
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0282.0.copyload.6.i = load i16, ptr %110, align 4, !tbaa.struct !23
  %111 = trunc i64 %54 to i32
  %112 = or disjoint i32 %111, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0282.0.copyload.6.i, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br i1 %51, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i

114:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i
  %115 = or disjoint i64 %57, 7
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0282.0.copyload.7.i = load i16, ptr %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i: ; preds = %114, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i
  %.sroa.0284.2.7.i = phi i16 [ %.sroa.0282.0.copyload.7.i, %114 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i ]
  %117 = trunc i64 %54 to i32
  %118 = or disjoint i32 %117, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %118
  store i16 %.sroa.0284.2.7.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
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
  %125 = icmp ult i64 %124, 64
  call void @llvm.assume(i1 %125)
  %126 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %127 = inttoptr i32 %126 to ptr addrspace(3)
  %128 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 512
  %129 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i

.lr.ph569.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i
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
  %135 = icmp ult i64 %134, 64
  call void @llvm.assume(i1 %135)
  %136 = shl i32 %.tr.i, 8
  %137 = sext i32 %4 to i64
  %138 = sext i32 %5 to i64
  %139 = sext i32 %136 to i64
  %140 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %141 = inttoptr i32 %140 to ptr addrspace(3)
  %142 = getelementptr inbounds i8, ptr addrspace(3) %141, i32 1024
  %143 = and i64 %134, 15
  %144 = icmp slt i64 %143, %138
  br label %166

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, %.lr.ph.i
  %145 = phi i64 [ %124, %.lr.ph.i ], [ %154, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i ]
  %146 = lshr i64 %145, 4
  %147 = shl nuw nsw i64 %145, 3
  %148 = and i64 %147, 120
  %149 = or disjoint i64 %148, %146
  %150 = trunc i64 %149 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %150
  %.sroa.0323.0.copyload.i = load i16, ptr addrspace(3) %151, align 2, !tbaa.struct !23
  %152 = trunc i64 %145 to i32
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %129, i32 %152
  store i16 %.sroa.0323.0.copyload.i, ptr addrspace(3) %153, align 2, !tbaa.struct !23
  %154 = add nuw nsw i64 %145, 64
  %155 = icmp ult i64 %145, 64
  br i1 %155, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, label %.lr.ph569.i, !llvm.loop !32

.lr.ph572.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %157 = icmp eq i64 %156, 0
  call void @llvm.assume(i1 %157)
  %158 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %159 = icmp eq i64 %158, 0
  call void @llvm.assume(i1 %159)
  %160 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %161 = icmp ult i64 %160, 64
  call void @llvm.assume(i1 %161)
  %162 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %163 = inttoptr i32 %162 to ptr addrspace(3)
  %164 = getelementptr inbounds i8, ptr addrspace(3) %163, i32 1024
  %165 = getelementptr inbounds i8, ptr addrspace(3) %163, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i

166:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph569.i
  %167 = phi i64 [ %134, %.lr.ph569.i ], [ %178, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %168 = lshr i64 %167, 4
  %169 = icmp slt i64 %168, %137
  %170 = and i1 %169, %144
  br i1 %170, label %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

171:                                              ; preds = %166
  %172 = and i64 %167, 9223372036854775792
  %173 = or disjoint i64 %172, %139
  %174 = or disjoint i64 %173, %143
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %174
  %.sroa.0245.0.copyload.i = load i16, ptr %175, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %171, %166
  %.sroa.0247.1.i = phi i16 [ %.sroa.0245.0.copyload.i, %171 ], [ 0, %166 ]
  %176 = trunc i64 %167 to i32
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %176
  store i16 %.sroa.0247.1.i, ptr addrspace(3) %177, align 2, !tbaa.struct !23
  %178 = add nuw nsw i64 %167, 64
  %179 = icmp ult i64 %167, 192
  br i1 %179, label %166, label %.lr.ph572.i, !llvm.loop !33

.lr.ph575.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i
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
  %185 = icmp ult i64 %184, 64
  call void @llvm.assume(i1 %185)
  %186 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %187 = inttoptr i32 %186 to ptr addrspace(3)
  %188 = getelementptr inbounds i8, ptr addrspace(3) %187, i32 768
  %189 = getelementptr inbounds i8, ptr addrspace(3) %187, i32 1536
  %190 = and i64 %184, 7
  %191 = or disjoint i64 %190, 8
  %192 = shl nuw nsw i64 %184, 1
  %193 = and i64 %192, 112
  br label %214

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %.lr.ph572.i
  %194 = phi i64 [ %160, %.lr.ph572.i ], [ %203, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i ]
  %195 = lshr i64 %194, 4
  %196 = shl nuw nsw i64 %194, 4
  %197 = and i64 %196, 240
  %198 = or disjoint i64 %197, %195
  %199 = trunc i64 %198 to i32
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %199
  %.sroa.0324.0.copyload.i = load i16, ptr addrspace(3) %200, align 2, !tbaa.struct !23
  %201 = trunc i64 %194 to i32
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %165, i32 %201
  store i16 %.sroa.0324.0.copyload.i, ptr addrspace(3) %202, align 2, !tbaa.struct !23
  %203 = add nuw nsw i64 %194, 64
  %204 = icmp ult i64 %194, 192
  br i1 %204, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, label %.lr.ph575.i, !llvm.loop !34

._crit_edge576.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %205 = or disjoint i64 %193, %190
  %206 = trunc i64 %205 to i32
  %207 = getelementptr inbounds float, ptr addrspace(3) %187, i32 %206
  store float %266, ptr addrspace(3) %207, align 4, !tbaa !35
  %208 = or disjoint i64 %193, %191
  %209 = trunc i64 %208 to i32
  %210 = getelementptr inbounds float, ptr addrspace(3) %187, i32 %209
  store float %291, ptr addrspace(3) %210, align 4, !tbaa !35
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %211 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %212 = icmp ult i64 %211, 64
  call void @llvm.assume(i1 %212)
  %213 = icmp eq i64 %211, 0
  br i1 %213, label %293, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph575.i
  %215 = phi i64 [ 0, %.lr.ph575.i ], [ %292, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %216 = phi float [ 0.000000e+00, %.lr.ph575.i ], [ %291, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %217 = phi float [ 0.000000e+00, %.lr.ph575.i ], [ %266, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %218 = add nuw nsw i64 %215, %193
  %219 = trunc i64 %218 to i32
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %188, i32 %219
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %220, align 2, !tbaa.struct !23
  %221 = shl nuw nsw i64 %215, 4
  %222 = or disjoint i64 %221, %190
  %223 = trunc i64 %222 to i32
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %223
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %224, align 2, !tbaa.struct !23
  %225 = zext i16 %.sroa.0204.0.copyload.i to i32
  %226 = lshr i32 %225, 10
  %227 = and i32 %226, 31
  %228 = and i32 %225, 1023
  switch i32 %227, label %234 [
    i32 31, label %229
    i32 0, label %236
  ]

229:                                              ; preds = %214
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %230 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not555.i = icmp eq i32 %228, 0
  %231 = select i1 %.not555.i, i32 2139095040, i32 2143289344
  %232 = or disjoint i32 %231, %230
  %233 = bitcast i32 %232 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

234:                                              ; preds = %214
  %235 = or disjoint i32 %228, 1024
  br label %236

236:                                              ; preds = %234, %214
  %237 = phi i32 [ %235, %234 ], [ %228, %214 ]
  %238 = uitofp i32 %237 to float
  %.not.i = icmp eq i32 %227, 0
  %239 = add nsw i32 %227, -25
  %240 = select i1 %.not.i, i32 -24, i32 %239
  %241 = call float @__ocml_ldexp_f32(float noundef %238, i32 noundef %240) #6
  %242 = fneg contract float %241
  %.not545546.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %243 = select contract i1 %.not545546.i, float %242, float %241
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %236, %229
  %244 = phi float [ %233, %229 ], [ %243, %236 ]
  %245 = zext i16 %.sroa.0195.0.copyload.i to i32
  %246 = lshr i32 %245, 10
  %247 = and i32 %246, 31
  %248 = and i32 %245, 1023
  switch i32 %247, label %254 [
    i32 31, label %249
    i32 0, label %256
  ]

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %250 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not554.i = icmp eq i32 %248, 0
  %251 = select i1 %.not554.i, i32 2139095040, i32 2143289344
  %252 = or disjoint i32 %251, %250
  %253 = bitcast i32 %252 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

254:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %255 = or disjoint i32 %248, 1024
  br label %256

256:                                              ; preds = %254, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %257 = phi i32 [ %255, %254 ], [ %248, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %258 = uitofp i32 %257 to float
  %.not547.i = icmp eq i32 %247, 0
  %259 = add nsw i32 %247, -25
  %260 = select i1 %.not547.i, i32 -24, i32 %259
  %261 = call float @__ocml_ldexp_f32(float noundef %258, i32 noundef %260) #6
  %262 = fneg contract float %261
  %.not548549.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %263 = select contract i1 %.not548549.i, float %262, float %261
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %256, %249
  %264 = phi float [ %253, %249 ], [ %263, %256 ]
  %265 = fmul contract float %244, %264
  %266 = fadd contract float %217, %265
  %267 = or disjoint i64 %221, %191
  %268 = trunc i64 %267 to i32
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %268
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %269, align 2, !tbaa.struct !23
  %270 = zext i16 %.sroa.0186.0.copyload.i to i32
  %271 = lshr i32 %270, 10
  %272 = and i32 %271, 31
  %273 = and i32 %270, 1023
  switch i32 %272, label %279 [
    i32 31, label %274
    i32 0, label %281
  ]

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %275 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not553.i = icmp eq i32 %273, 0
  %276 = select i1 %.not553.i, i32 2139095040, i32 2143289344
  %277 = or disjoint i32 %276, %275
  %278 = bitcast i32 %277 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %280 = or disjoint i32 %273, 1024
  br label %281

281:                                              ; preds = %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %282 = phi i32 [ %280, %279 ], [ %273, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %283 = uitofp i32 %282 to float
  %.not550.i = icmp eq i32 %272, 0
  %284 = add nsw i32 %272, -25
  %285 = select i1 %.not550.i, i32 -24, i32 %284
  %286 = call float @__ocml_ldexp_f32(float noundef %283, i32 noundef %285) #6
  %287 = fneg contract float %286
  %.not551552.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %288 = select contract i1 %.not551552.i, float %287, float %286
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %281, %274
  %289 = phi float [ %278, %274 ], [ %288, %281 ]
  %290 = fmul contract float %244, %289
  %291 = fadd contract float %216, %290
  %292 = add nuw nsw i64 %215, 1
  %exitcond583.not.i = icmp eq i64 %292, 16
  br i1 %exitcond583.not.i, label %._crit_edge576.i, label %214, !llvm.loop !37

293:                                              ; preds = %._crit_edge576.i
  %294 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %295 = icmp eq i64 %294, 0
  call void @llvm.assume(i1 %295)
  %296 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %297 = icmp eq i64 %296, 0
  call void @llvm.assume(i1 %297)
  %298 = sext i32 %3 to i64
  %299 = call i32 @llvm.amdgcn.groupstaticsize()
  %300 = inttoptr i32 %299 to ptr addrspace(3)
  %301 = sext i32 %30 to i64
  %302 = icmp sgt i32 %4, 0
  %303 = icmp ugt i32 %4, 1
  %304 = icmp ugt i32 %4, 2
  %305 = icmp ugt i32 %4, 3
  %306 = icmp ugt i32 %4, 4
  %307 = icmp ugt i32 %4, 5
  %308 = icmp ugt i32 %4, 6
  %309 = icmp ugt i32 %4, 7
  %310 = icmp ugt i32 %4, 8
  %311 = icmp ugt i32 %4, 9
  %312 = icmp ugt i32 %4, 10
  %313 = icmp ugt i32 %4, 11
  %314 = icmp ugt i32 %4, 12
  %315 = icmp ugt i32 %4, 13
  %316 = icmp ugt i32 %4, 14
  %317 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split578.us.i, %293
  %318 = phi i64 [ 0, %293 ], [ %324, %.split578.us.i ]
  %319 = icmp slt i64 %318, %298
  %320 = shl i64 %318, 4
  %.tr544.i = trunc i64 %318 to i32
  %321 = shl i32 %.tr544.i, 4
  %322 = sext i32 %321 to i64
  %323 = add nsw i64 %322, %301
  %.fr579.i = freeze i1 %319
  %brmerge.not.i = select i1 %.fr579.i, i1 %302, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split578.us.i

.split578.us.i:                                   ; preds = %413, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %324 = add nuw nsw i64 %318, 1
  %exitcond585.not.i = icmp eq i64 %324, 8
  br i1 %exitcond585.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %325 = trunc i64 %320 to i32
  %326 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %325
  %327 = load float, ptr addrspace(3) %326, align 4, !tbaa !35
  %328 = getelementptr inbounds float, ptr %9, i64 %323
  store float %327, ptr %328, align 32, !tbaa !35
  br i1 %303, label %.preheader.split.2.i, label %.split578.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %329 = trunc i64 %320 to i32
  %330 = or disjoint i32 %329, 1
  %331 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %330
  %332 = load float, ptr addrspace(3) %331, align 4, !tbaa !35
  %333 = or disjoint i64 %323, 1
  %334 = getelementptr inbounds float, ptr %9, i64 %333
  store float %332, ptr %334, align 4, !tbaa !35
  br i1 %304, label %.preheader.split.3.i, label %.split578.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %335 = trunc i64 %320 to i32
  %336 = or disjoint i32 %335, 2
  %337 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %336
  %338 = load float, ptr addrspace(3) %337, align 4, !tbaa !35
  %339 = or disjoint i64 %323, 2
  %340 = getelementptr inbounds float, ptr %9, i64 %339
  store float %338, ptr %340, align 8, !tbaa !35
  br i1 %305, label %.preheader.split.4.i, label %.split578.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %341 = trunc i64 %320 to i32
  %342 = or disjoint i32 %341, 3
  %343 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %342
  %344 = load float, ptr addrspace(3) %343, align 4, !tbaa !35
  %345 = or disjoint i64 %323, 3
  %346 = getelementptr inbounds float, ptr %9, i64 %345
  store float %344, ptr %346, align 4, !tbaa !35
  br i1 %306, label %.preheader.split.5.i, label %.split578.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %347 = trunc i64 %320 to i32
  %348 = or disjoint i32 %347, 4
  %349 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %348
  %350 = load float, ptr addrspace(3) %349, align 4, !tbaa !35
  %351 = or disjoint i64 %323, 4
  %352 = getelementptr inbounds float, ptr %9, i64 %351
  store float %350, ptr %352, align 16, !tbaa !35
  br i1 %307, label %.preheader.split.6.i, label %.split578.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %353 = trunc i64 %320 to i32
  %354 = or disjoint i32 %353, 5
  %355 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %354
  %356 = load float, ptr addrspace(3) %355, align 4, !tbaa !35
  %357 = or disjoint i64 %323, 5
  %358 = getelementptr inbounds float, ptr %9, i64 %357
  store float %356, ptr %358, align 4, !tbaa !35
  br i1 %308, label %.preheader.split.7.i, label %.split578.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %359 = trunc i64 %320 to i32
  %360 = or disjoint i32 %359, 6
  %361 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %360
  %362 = load float, ptr addrspace(3) %361, align 4, !tbaa !35
  %363 = or disjoint i64 %323, 6
  %364 = getelementptr inbounds float, ptr %9, i64 %363
  store float %362, ptr %364, align 8, !tbaa !35
  br i1 %309, label %.preheader.split.8.i, label %.split578.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %365 = trunc i64 %320 to i32
  %366 = or disjoint i32 %365, 7
  %367 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %366
  %368 = load float, ptr addrspace(3) %367, align 4, !tbaa !35
  %369 = or disjoint i64 %323, 7
  %370 = getelementptr inbounds float, ptr %9, i64 %369
  store float %368, ptr %370, align 4, !tbaa !35
  br i1 %310, label %.preheader.split.9.i, label %.split578.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %371 = trunc i64 %320 to i32
  %372 = or disjoint i32 %371, 8
  %373 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %372
  %374 = load float, ptr addrspace(3) %373, align 4, !tbaa !35
  %375 = or disjoint i64 %323, 8
  %376 = getelementptr inbounds float, ptr %9, i64 %375
  store float %374, ptr %376, align 32, !tbaa !35
  br i1 %311, label %.preheader.split.10.i, label %.split578.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %377 = trunc i64 %320 to i32
  %378 = or disjoint i32 %377, 9
  %379 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !35
  %381 = or disjoint i64 %323, 9
  %382 = getelementptr inbounds float, ptr %9, i64 %381
  store float %380, ptr %382, align 4, !tbaa !35
  br i1 %312, label %.preheader.split.11.i, label %.split578.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %383 = trunc i64 %320 to i32
  %384 = or disjoint i32 %383, 10
  %385 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !35
  %387 = or disjoint i64 %323, 10
  %388 = getelementptr inbounds float, ptr %9, i64 %387
  store float %386, ptr %388, align 8, !tbaa !35
  br i1 %313, label %.preheader.split.12.i, label %.split578.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %389 = trunc i64 %320 to i32
  %390 = or disjoint i32 %389, 11
  %391 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !35
  %393 = or disjoint i64 %323, 11
  %394 = getelementptr inbounds float, ptr %9, i64 %393
  store float %392, ptr %394, align 4, !tbaa !35
  br i1 %314, label %.preheader.split.13.i, label %.split578.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %395 = trunc i64 %320 to i32
  %396 = or disjoint i32 %395, 12
  %397 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %396
  %398 = load float, ptr addrspace(3) %397, align 4, !tbaa !35
  %399 = or disjoint i64 %323, 12
  %400 = getelementptr inbounds float, ptr %9, i64 %399
  store float %398, ptr %400, align 16, !tbaa !35
  br i1 %315, label %.preheader.split.14.i, label %.split578.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %401 = trunc i64 %320 to i32
  %402 = or disjoint i32 %401, 13
  %403 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %402
  %404 = load float, ptr addrspace(3) %403, align 4, !tbaa !35
  %405 = or disjoint i64 %323, 13
  %406 = getelementptr inbounds float, ptr %9, i64 %405
  store float %404, ptr %406, align 4, !tbaa !35
  br i1 %316, label %.preheader.split.15.i, label %.split578.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %407 = trunc i64 %320 to i32
  %408 = or disjoint i32 %407, 14
  %409 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %408
  %410 = load float, ptr addrspace(3) %409, align 4, !tbaa !35
  %411 = or disjoint i64 %323, 14
  %412 = getelementptr inbounds float, ptr %9, i64 %411
  store float %410, ptr %412, align 8, !tbaa !35
  br i1 %317, label %413, label %.split578.us.i

413:                                              ; preds = %.preheader.split.15.i
  %414 = trunc i64 %320 to i32
  %415 = or disjoint i32 %414, 15
  %416 = getelementptr inbounds float, ptr addrspace(3) %300, i32 %415
  %417 = load float, ptr addrspace(3) %416, align 4, !tbaa !35
  %418 = or disjoint i64 %323, 15
  %419 = getelementptr inbounds float, ptr %9, i64 %418
  store float %417, ptr %419, align 4, !tbaa !35
  br label %.split578.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge576.i, %.split578.us.i
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
;----------------- End AdaptiveCpp IR dump ---------------
