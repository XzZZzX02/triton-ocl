;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-dmp3bmly/kernel.cpp"
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
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %31 = icmp ult i64 %30, 64
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
  br label %.preheader853.i

.preheader853.i:                                  ; preds = %.split.us.i, %33
  %52 = phi i64 [ 0, %33 ], [ %62, %.split.us.i ]
  %53 = icmp slt i64 %52, %39
  %54 = shl i64 %52, 3
  %.tr847.i = trunc i64 %52 to i32
  %55 = shl i32 %.tr847.i, 3
  %56 = sext i32 %55 to i64
  %57 = add nsw i64 %56, %43
  %.fr.i = freeze i1 %53
  br i1 %.fr.i, label %.preheader853.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.us.preheader.i: ; preds = %.preheader853.i
  %.tr882.i = trunc i64 %52 to i32
  %58 = shl i32 %.tr882.i, 4
  %59 = add i32 %58, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %59
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader853.split.preheader.i:                  ; preds = %.preheader853.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.thread.i: ; preds = %.preheader853.split.preheader.i
  %60 = trunc i64 %54 to i32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %60
  store i16 0, ptr addrspace(3) %61, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.us.preheader.i
  %62 = add nuw nsw i64 %52, 1
  %exitcond.not.i = icmp eq i64 %62, 32
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader853.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.i: ; preds = %.preheader853.split.preheader.i
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0359.0.copyload.i = load i16, ptr %63, align 16, !tbaa.struct !23
  %64 = trunc i64 %54 to i32
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %64
  store i16 %.sroa.0359.0.copyload.i, ptr addrspace(3) %65, align 2, !tbaa.struct !23
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.thread.i
  %66 = trunc i64 %54 to i32
  %67 = or disjoint i32 %66, 1
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %67
  store i16 0, ptr addrspace(3) %68, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.i
  %69 = or disjoint i64 %57, 1
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %69
  %.sroa.0359.0.copyload.1.i = load i16, ptr %70, align 2, !tbaa.struct !23
  %71 = trunc i64 %54 to i32
  %72 = or disjoint i32 %71, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0359.0.copyload.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !23
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.thread.i
  %74 = trunc i64 %54 to i32
  %75 = or disjoint i32 %74, 2
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.1.i
  %77 = or disjoint i64 %57, 2
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0359.0.copyload.2.i = load i16, ptr %78, align 4, !tbaa.struct !23
  %79 = trunc i64 %54 to i32
  %80 = or disjoint i32 %79, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0359.0.copyload.2.i, ptr addrspace(3) %81, align 2, !tbaa.struct !23
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.thread.i
  %82 = trunc i64 %54 to i32
  %83 = or disjoint i32 %82, 3
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.2.i
  %85 = or disjoint i64 %57, 3
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0359.0.copyload.3.i = load i16, ptr %86, align 2, !tbaa.struct !23
  %87 = trunc i64 %54 to i32
  %88 = or disjoint i32 %87, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0359.0.copyload.3.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.thread.i
  %90 = trunc i64 %54 to i32
  %91 = or disjoint i32 %90, 4
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.3.i
  %93 = or disjoint i64 %57, 4
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0359.0.copyload.4.i = load i16, ptr %94, align 8, !tbaa.struct !23
  %95 = trunc i64 %54 to i32
  %96 = or disjoint i32 %95, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0359.0.copyload.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.thread.i
  %98 = trunc i64 %54 to i32
  %99 = or disjoint i32 %98, 5
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.4.i
  %101 = or disjoint i64 %57, 5
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0359.0.copyload.5.i = load i16, ptr %102, align 2, !tbaa.struct !23
  %103 = trunc i64 %54 to i32
  %104 = or disjoint i32 %103, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0359.0.copyload.5.i, ptr addrspace(3) %105, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.thread.i
  %106 = trunc i64 %54 to i32
  %107 = or disjoint i32 %106, 6
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.5.i
  %109 = or disjoint i64 %57, 6
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0359.0.copyload.6.i = load i16, ptr %110, align 4, !tbaa.struct !23
  %111 = trunc i64 %54 to i32
  %112 = or disjoint i32 %111, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0359.0.copyload.6.i, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br i1 %51, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.7.i

114:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.i
  %115 = or disjoint i64 %57, 7
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0359.0.copyload.7.i = load i16, ptr %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.7.i: ; preds = %114, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.thread.i
  %.sroa.0361.2.7.i = phi i16 [ %.sroa.0359.0.copyload.7.i, %114 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit26.i.i.6.thread.i ]
  %117 = trunc i64 %54 to i32
  %118 = or disjoint i32 %117, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %118
  store i16 %.sroa.0361.2.7.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
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
  %129 = getelementptr inbounds i8, ptr addrspace(3) %127, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %131 = icmp ult i64 %130, 64
  call void @llvm.assume(i1 %131)
  %132 = icmp eq i64 %130, 0
  br i1 %132, label %144, label %.lr.ph864.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, %.lr.ph.i
  %133 = phi i64 [ %124, %.lr.ph.i ], [ %142, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i ]
  %134 = lshr i64 %133, 5
  %135 = shl nuw nsw i64 %133, 3
  %136 = and i64 %135, 248
  %137 = or disjoint i64 %136, %134
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %138
  %.sroa.0436.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !23
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %129, i32 %140
  store i16 %.sroa.0436.0.copyload.i, ptr addrspace(3) %141, align 2, !tbaa.struct !23
  %142 = add nuw nsw i64 %133, 64
  %143 = icmp ult i64 %133, 192
  br i1 %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, label %._crit_edge.i, !llvm.loop !32

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
  br label %.preheader852.i

.preheader852.i:                                  ; preds = %.split861.us.i, %144
  %156 = phi i64 [ 0, %144 ], [ %164, %.split861.us.i ]
  %157 = icmp slt i64 %156, %150
  %158 = shl i64 %156, 5
  %.tr846.i = trunc i64 %156 to i32
  %159 = shl i32 %.tr846.i, 5
  %160 = sext i32 %159 to i64
  %161 = add nsw i64 %160, %155
  %.fr862.i = freeze i1 %157
  br i1 %.fr862.i, label %.preheader852.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader852.i
  %.tr881.i = trunc i64 %156 to i32
  %162 = shl i32 %.tr881.i, 6
  %163 = add i32 %162, 1536
  %scevgep876.i = getelementptr i8, ptr addrspace(3) %153, i32 %163
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep876.i, i8 0, i32 64, i1 false)
  br label %.split861.us.i

.split861.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %164 = add nuw nsw i64 %156, 1
  %exitcond878.not.i = icmp eq i64 %164, 16
  br i1 %exitcond878.not.i, label %.lr.ph864.i, label %.preheader852.i, !llvm.loop !33

.preheader852.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader852.i
  %165 = phi i64 [ %173, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader852.i ]
  %166 = icmp slt i64 %165, %151
  br i1 %166, label %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

167:                                              ; preds = %.preheader852.split.i
  %168 = add nuw nsw i64 %161, %165
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %168
  %.sroa.0322.0.copyload.i = load i16, ptr %169, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %167, %.preheader852.split.i
  %.sroa.0324.2.i = phi i16 [ %.sroa.0322.0.copyload.i, %167 ], [ 0, %.preheader852.split.i ]
  %170 = add nuw nsw i64 %165, %158
  %171 = trunc i64 %170 to i32
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %171
  store i16 %.sroa.0324.2.i, ptr addrspace(3) %172, align 2, !tbaa.struct !23
  %173 = add nuw nsw i64 %165, 1
  %exitcond877.not.i = icmp eq i64 %173, 32
  br i1 %exitcond877.not.i, label %.split861.us.i, label %.preheader852.split.i, !llvm.loop !34

.lr.ph864.i:                                      ; preds = %.split861.us.i, %._crit_edge.i
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
  %179 = icmp ult i64 %178, 64
  call void @llvm.assume(i1 %179)
  %180 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %181 = inttoptr i32 %180 to ptr addrspace(3)
  %182 = getelementptr inbounds i8, ptr addrspace(3) %181, i32 1536
  %183 = getelementptr inbounds i8, ptr addrspace(3) %181, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i

.lr.ph867.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i
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
  %189 = icmp ult i64 %188, 64
  call void @llvm.assume(i1 %189)
  %190 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %191 = inttoptr i32 %190 to ptr addrspace(3)
  %192 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 1024
  %193 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 2560
  %194 = and i64 %188, 7
  %195 = lshr i64 %188, 3
  %196 = or disjoint i64 %194, 8
  %197 = shl nuw nsw i64 %195, 5
  br label %219

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i, %.lr.ph864.i
  %198 = phi i64 [ %178, %.lr.ph864.i ], [ %207, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i ]
  %199 = lshr i64 %198, 4
  %200 = shl nuw nsw i64 %198, 5
  %201 = and i64 %200, 480
  %202 = or disjoint i64 %201, %199
  %203 = trunc i64 %202 to i32
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %182, i32 %203
  %.sroa.0437.0.copyload.i = load i16, ptr addrspace(3) %204, align 2, !tbaa.struct !23
  %205 = trunc i64 %198 to i32
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %205
  store i16 %.sroa.0437.0.copyload.i, ptr addrspace(3) %206, align 2, !tbaa.struct !23
  %207 = add nuw nsw i64 %198, 64
  %208 = icmp ult i64 %198, 448
  br i1 %208, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i, label %.lr.ph867.i, !llvm.loop !35

._crit_edge868.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %209 = shl nuw nsw i64 %195, 4
  %210 = or disjoint i64 %209, %194
  %211 = trunc i64 %210 to i32
  %212 = getelementptr inbounds float, ptr addrspace(3) %191, i32 %211
  store float %496, ptr addrspace(3) %212, align 4, !tbaa !36
  %213 = or disjoint i64 %209, %196
  %214 = trunc i64 %213 to i32
  %215 = getelementptr inbounds float, ptr addrspace(3) %191, i32 %214
  store float %521, ptr addrspace(3) %215, align 4, !tbaa !36
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %216 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %217 = icmp ult i64 %216, 64
  call void @llvm.assume(i1 %217)
  %218 = icmp eq i64 %216, 0
  br i1 %218, label %524, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph867.i
  %220 = phi i64 [ 0, %.lr.ph867.i ], [ %522, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %221 = phi float [ 0.000000e+00, %.lr.ph867.i ], [ %521, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %222 = phi float [ 0.000000e+00, %.lr.ph867.i ], [ %496, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %223 = add nuw nsw i64 %220, %197
  %224 = trunc i64 %223 to i32
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %224
  %.sroa.0285.0.copyload.i = load i16, ptr addrspace(3) %225, align 2, !tbaa.struct !23
  %226 = shl nuw nsw i64 %220, 4
  %227 = or disjoint i64 %226, %194
  %228 = trunc i64 %227 to i32
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %228
  %.sroa.0276.0.copyload.i = load i16, ptr addrspace(3) %229, align 2, !tbaa.struct !23
  %230 = zext i16 %.sroa.0285.0.copyload.i to i32
  %231 = lshr i32 %230, 10
  %232 = and i32 %231, 31
  %233 = and i32 %230, 1023
  switch i32 %232, label %239 [
    i32 31, label %234
    i32 0, label %241
  ]

234:                                              ; preds = %219
  %.sroa.0285.0.copyload.signext.i = sext i16 %.sroa.0285.0.copyload.i to i32
  %235 = and i32 %.sroa.0285.0.copyload.signext.i, -2147483648
  %.not845.i = icmp eq i32 %233, 0
  %236 = select i1 %.not845.i, i32 2139095040, i32 2143289344
  %237 = or disjoint i32 %236, %235
  %238 = bitcast i32 %237 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

239:                                              ; preds = %219
  %240 = or disjoint i32 %233, 1024
  br label %241

241:                                              ; preds = %239, %219
  %242 = phi i32 [ %240, %239 ], [ %233, %219 ]
  %243 = uitofp i32 %242 to float
  %.not.i = icmp eq i32 %232, 0
  %244 = add nsw i32 %232, -25
  %245 = select i1 %.not.i, i32 -24, i32 %244
  %246 = call float @__ocml_ldexp_f32(float noundef %243, i32 noundef %245) #6
  %247 = fneg contract float %246
  %.not799800.i = icmp slt i16 %.sroa.0285.0.copyload.i, 0
  %248 = select contract i1 %.not799800.i, float %247, float %246
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %241, %234
  %249 = phi float [ %238, %234 ], [ %248, %241 ]
  %250 = zext i16 %.sroa.0276.0.copyload.i to i32
  %251 = lshr i32 %250, 10
  %252 = and i32 %251, 31
  %253 = and i32 %250, 1023
  switch i32 %252, label %259 [
    i32 31, label %254
    i32 0, label %261
  ]

254:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0276.0.copyload.signext.i = sext i16 %.sroa.0276.0.copyload.i to i32
  %255 = and i32 %.sroa.0276.0.copyload.signext.i, -2147483648
  %.not844.i = icmp eq i32 %253, 0
  %256 = select i1 %.not844.i, i32 2139095040, i32 2143289344
  %257 = or disjoint i32 %256, %255
  %258 = bitcast i32 %257 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

259:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %260 = or disjoint i32 %253, 1024
  br label %261

261:                                              ; preds = %259, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %262 = phi i32 [ %260, %259 ], [ %253, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %263 = uitofp i32 %262 to float
  %.not801.i = icmp eq i32 %252, 0
  %264 = add nsw i32 %252, -25
  %265 = select i1 %.not801.i, i32 -24, i32 %264
  %266 = call float @__ocml_ldexp_f32(float noundef %263, i32 noundef %265) #6
  %267 = fneg contract float %266
  %.not802803.i = icmp slt i16 %.sroa.0276.0.copyload.i, 0
  %268 = select contract i1 %.not802803.i, float %267, float %266
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %261, %254
  %269 = phi float [ %258, %254 ], [ %268, %261 ]
  %270 = fmul contract float %249, %269
  %271 = fadd contract float %222, %270
  %272 = or disjoint i64 %226, %196
  %273 = trunc i64 %272 to i32
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %273
  %.sroa.0267.0.copyload.i = load i16, ptr addrspace(3) %274, align 2, !tbaa.struct !23
  %275 = zext i16 %.sroa.0267.0.copyload.i to i32
  %276 = lshr i32 %275, 10
  %277 = and i32 %276, 31
  %278 = and i32 %275, 1023
  switch i32 %277, label %284 [
    i32 31, label %279
    i32 0, label %286
  ]

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0267.0.copyload.signext.i = sext i16 %.sroa.0267.0.copyload.i to i32
  %280 = and i32 %.sroa.0267.0.copyload.signext.i, -2147483648
  %.not843.i = icmp eq i32 %278, 0
  %281 = select i1 %.not843.i, i32 2139095040, i32 2143289344
  %282 = or disjoint i32 %281, %280
  %283 = bitcast i32 %282 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

284:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %285 = or disjoint i32 %278, 1024
  br label %286

286:                                              ; preds = %284, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %287 = phi i32 [ %285, %284 ], [ %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %288 = uitofp i32 %287 to float
  %.not804.i = icmp eq i32 %277, 0
  %289 = add nsw i32 %277, -25
  %290 = select i1 %.not804.i, i32 -24, i32 %289
  %291 = call float @__ocml_ldexp_f32(float noundef %288, i32 noundef %290) #6
  %292 = fneg contract float %291
  %.not805806.i = icmp slt i16 %.sroa.0267.0.copyload.i, 0
  %293 = select contract i1 %.not805806.i, float %292, float %291
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %286, %279
  %294 = phi float [ %283, %279 ], [ %293, %286 ]
  %295 = fmul contract float %249, %294
  %296 = fadd contract float %221, %295
  %297 = or disjoint i64 %220, 1
  %298 = add nuw nsw i64 %297, %197
  %299 = trunc i64 %298 to i32
  %300 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %299
  %.sroa.0258.0.copyload.i = load i16, ptr addrspace(3) %300, align 2, !tbaa.struct !23
  %301 = shl nuw nsw i64 %297, 4
  %302 = or disjoint i64 %301, %194
  %303 = trunc i64 %302 to i32
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %303
  %.sroa.0249.0.copyload.i = load i16, ptr addrspace(3) %304, align 2, !tbaa.struct !23
  %305 = zext i16 %.sroa.0258.0.copyload.i to i32
  %306 = lshr i32 %305, 10
  %307 = and i32 %306, 31
  %308 = and i32 %305, 1023
  switch i32 %307, label %314 [
    i32 31, label %309
    i32 0, label %316
  ]

309:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0258.0.copyload.signext.i = sext i16 %.sroa.0258.0.copyload.i to i32
  %310 = and i32 %.sroa.0258.0.copyload.signext.i, -2147483648
  %.not842.i = icmp eq i32 %308, 0
  %311 = select i1 %.not842.i, i32 2139095040, i32 2143289344
  %312 = or disjoint i32 %311, %310
  %313 = bitcast i32 %312 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %315 = or disjoint i32 %308, 1024
  br label %316

316:                                              ; preds = %314, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %317 = phi i32 [ %315, %314 ], [ %308, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %318 = uitofp i32 %317 to float
  %.not807.i = icmp eq i32 %307, 0
  %319 = add nsw i32 %307, -25
  %320 = select i1 %.not807.i, i32 -24, i32 %319
  %321 = call float @__ocml_ldexp_f32(float noundef %318, i32 noundef %320) #6
  %322 = fneg contract float %321
  %.not808809.i = icmp slt i16 %.sroa.0258.0.copyload.i, 0
  %323 = select contract i1 %.not808809.i, float %322, float %321
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %316, %309
  %324 = phi float [ %313, %309 ], [ %323, %316 ]
  %325 = zext i16 %.sroa.0249.0.copyload.i to i32
  %326 = lshr i32 %325, 10
  %327 = and i32 %326, 31
  %328 = and i32 %325, 1023
  switch i32 %327, label %334 [
    i32 31, label %329
    i32 0, label %336
  ]

329:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0249.0.copyload.signext.i = sext i16 %.sroa.0249.0.copyload.i to i32
  %330 = and i32 %.sroa.0249.0.copyload.signext.i, -2147483648
  %.not841.i = icmp eq i32 %328, 0
  %331 = select i1 %.not841.i, i32 2139095040, i32 2143289344
  %332 = or disjoint i32 %331, %330
  %333 = bitcast i32 %332 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

334:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %335 = or disjoint i32 %328, 1024
  br label %336

336:                                              ; preds = %334, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %337 = phi i32 [ %335, %334 ], [ %328, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %338 = uitofp i32 %337 to float
  %.not810.i = icmp eq i32 %327, 0
  %339 = add nsw i32 %327, -25
  %340 = select i1 %.not810.i, i32 -24, i32 %339
  %341 = call float @__ocml_ldexp_f32(float noundef %338, i32 noundef %340) #6
  %342 = fneg contract float %341
  %.not811812.i = icmp slt i16 %.sroa.0249.0.copyload.i, 0
  %343 = select contract i1 %.not811812.i, float %342, float %341
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %336, %329
  %344 = phi float [ %333, %329 ], [ %343, %336 ]
  %345 = fmul contract float %324, %344
  %346 = fadd contract float %271, %345
  %347 = or disjoint i64 %301, %196
  %348 = trunc i64 %347 to i32
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %348
  %.sroa.0240.0.copyload.i = load i16, ptr addrspace(3) %349, align 2, !tbaa.struct !23
  %350 = zext i16 %.sroa.0240.0.copyload.i to i32
  %351 = lshr i32 %350, 10
  %352 = and i32 %351, 31
  %353 = and i32 %350, 1023
  switch i32 %352, label %359 [
    i32 31, label %354
    i32 0, label %361
  ]

354:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0240.0.copyload.signext.i = sext i16 %.sroa.0240.0.copyload.i to i32
  %355 = and i32 %.sroa.0240.0.copyload.signext.i, -2147483648
  %.not840.i = icmp eq i32 %353, 0
  %356 = select i1 %.not840.i, i32 2139095040, i32 2143289344
  %357 = or disjoint i32 %356, %355
  %358 = bitcast i32 %357 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

359:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %360 = or disjoint i32 %353, 1024
  br label %361

361:                                              ; preds = %359, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %362 = phi i32 [ %360, %359 ], [ %353, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %363 = uitofp i32 %362 to float
  %.not813.i = icmp eq i32 %352, 0
  %364 = add nsw i32 %352, -25
  %365 = select i1 %.not813.i, i32 -24, i32 %364
  %366 = call float @__ocml_ldexp_f32(float noundef %363, i32 noundef %365) #6
  %367 = fneg contract float %366
  %.not814815.i = icmp slt i16 %.sroa.0240.0.copyload.i, 0
  %368 = select contract i1 %.not814815.i, float %367, float %366
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %361, %354
  %369 = phi float [ %358, %354 ], [ %368, %361 ]
  %370 = fmul contract float %324, %369
  %371 = fadd contract float %296, %370
  %372 = or disjoint i64 %220, 2
  %373 = add nuw nsw i64 %372, %197
  %374 = trunc i64 %373 to i32
  %375 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %374
  %.sroa.0231.0.copyload.i = load i16, ptr addrspace(3) %375, align 2, !tbaa.struct !23
  %376 = shl nuw nsw i64 %372, 4
  %377 = or disjoint i64 %376, %194
  %378 = trunc i64 %377 to i32
  %379 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %378
  %.sroa.0222.0.copyload.i = load i16, ptr addrspace(3) %379, align 2, !tbaa.struct !23
  %380 = zext i16 %.sroa.0231.0.copyload.i to i32
  %381 = lshr i32 %380, 10
  %382 = and i32 %381, 31
  %383 = and i32 %380, 1023
  switch i32 %382, label %389 [
    i32 31, label %384
    i32 0, label %391
  ]

384:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0231.0.copyload.signext.i = sext i16 %.sroa.0231.0.copyload.i to i32
  %385 = and i32 %.sroa.0231.0.copyload.signext.i, -2147483648
  %.not839.i = icmp eq i32 %383, 0
  %386 = select i1 %.not839.i, i32 2139095040, i32 2143289344
  %387 = or disjoint i32 %386, %385
  %388 = bitcast i32 %387 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

389:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %390 = or disjoint i32 %383, 1024
  br label %391

391:                                              ; preds = %389, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %392 = phi i32 [ %390, %389 ], [ %383, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %393 = uitofp i32 %392 to float
  %.not816.i = icmp eq i32 %382, 0
  %394 = add nsw i32 %382, -25
  %395 = select i1 %.not816.i, i32 -24, i32 %394
  %396 = call float @__ocml_ldexp_f32(float noundef %393, i32 noundef %395) #6
  %397 = fneg contract float %396
  %.not817818.i = icmp slt i16 %.sroa.0231.0.copyload.i, 0
  %398 = select contract i1 %.not817818.i, float %397, float %396
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %391, %384
  %399 = phi float [ %388, %384 ], [ %398, %391 ]
  %400 = zext i16 %.sroa.0222.0.copyload.i to i32
  %401 = lshr i32 %400, 10
  %402 = and i32 %401, 31
  %403 = and i32 %400, 1023
  switch i32 %402, label %409 [
    i32 31, label %404
    i32 0, label %411
  ]

404:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0222.0.copyload.signext.i = sext i16 %.sroa.0222.0.copyload.i to i32
  %405 = and i32 %.sroa.0222.0.copyload.signext.i, -2147483648
  %.not838.i = icmp eq i32 %403, 0
  %406 = select i1 %.not838.i, i32 2139095040, i32 2143289344
  %407 = or disjoint i32 %406, %405
  %408 = bitcast i32 %407 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

409:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %410 = or disjoint i32 %403, 1024
  br label %411

411:                                              ; preds = %409, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %412 = phi i32 [ %410, %409 ], [ %403, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %413 = uitofp i32 %412 to float
  %.not819.i = icmp eq i32 %402, 0
  %414 = add nsw i32 %402, -25
  %415 = select i1 %.not819.i, i32 -24, i32 %414
  %416 = call float @__ocml_ldexp_f32(float noundef %413, i32 noundef %415) #6
  %417 = fneg contract float %416
  %.not820821.i = icmp slt i16 %.sroa.0222.0.copyload.i, 0
  %418 = select contract i1 %.not820821.i, float %417, float %416
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %411, %404
  %419 = phi float [ %408, %404 ], [ %418, %411 ]
  %420 = fmul contract float %399, %419
  %421 = fadd contract float %346, %420
  %422 = or disjoint i64 %376, %196
  %423 = trunc i64 %422 to i32
  %424 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %423
  %.sroa.0213.0.copyload.i = load i16, ptr addrspace(3) %424, align 2, !tbaa.struct !23
  %425 = zext i16 %.sroa.0213.0.copyload.i to i32
  %426 = lshr i32 %425, 10
  %427 = and i32 %426, 31
  %428 = and i32 %425, 1023
  switch i32 %427, label %434 [
    i32 31, label %429
    i32 0, label %436
  ]

429:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0213.0.copyload.signext.i = sext i16 %.sroa.0213.0.copyload.i to i32
  %430 = and i32 %.sroa.0213.0.copyload.signext.i, -2147483648
  %.not837.i = icmp eq i32 %428, 0
  %431 = select i1 %.not837.i, i32 2139095040, i32 2143289344
  %432 = or disjoint i32 %431, %430
  %433 = bitcast i32 %432 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

434:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %435 = or disjoint i32 %428, 1024
  br label %436

436:                                              ; preds = %434, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %437 = phi i32 [ %435, %434 ], [ %428, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %438 = uitofp i32 %437 to float
  %.not822.i = icmp eq i32 %427, 0
  %439 = add nsw i32 %427, -25
  %440 = select i1 %.not822.i, i32 -24, i32 %439
  %441 = call float @__ocml_ldexp_f32(float noundef %438, i32 noundef %440) #6
  %442 = fneg contract float %441
  %.not823824.i = icmp slt i16 %.sroa.0213.0.copyload.i, 0
  %443 = select contract i1 %.not823824.i, float %442, float %441
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %436, %429
  %444 = phi float [ %433, %429 ], [ %443, %436 ]
  %445 = fmul contract float %399, %444
  %446 = fadd contract float %371, %445
  %447 = or disjoint i64 %220, 3
  %448 = add nuw nsw i64 %447, %197
  %449 = trunc i64 %448 to i32
  %450 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %449
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %450, align 2, !tbaa.struct !23
  %451 = shl nuw nsw i64 %447, 4
  %452 = or disjoint i64 %451, %194
  %453 = trunc i64 %452 to i32
  %454 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %453
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %454, align 2, !tbaa.struct !23
  %455 = zext i16 %.sroa.0204.0.copyload.i to i32
  %456 = lshr i32 %455, 10
  %457 = and i32 %456, 31
  %458 = and i32 %455, 1023
  switch i32 %457, label %464 [
    i32 31, label %459
    i32 0, label %466
  ]

459:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %460 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not836.i = icmp eq i32 %458, 0
  %461 = select i1 %.not836.i, i32 2139095040, i32 2143289344
  %462 = or disjoint i32 %461, %460
  %463 = bitcast i32 %462 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

464:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %465 = or disjoint i32 %458, 1024
  br label %466

466:                                              ; preds = %464, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %467 = phi i32 [ %465, %464 ], [ %458, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %468 = uitofp i32 %467 to float
  %.not825.i = icmp eq i32 %457, 0
  %469 = add nsw i32 %457, -25
  %470 = select i1 %.not825.i, i32 -24, i32 %469
  %471 = call float @__ocml_ldexp_f32(float noundef %468, i32 noundef %470) #6
  %472 = fneg contract float %471
  %.not826827.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %473 = select contract i1 %.not826827.i, float %472, float %471
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %466, %459
  %474 = phi float [ %463, %459 ], [ %473, %466 ]
  %475 = zext i16 %.sroa.0195.0.copyload.i to i32
  %476 = lshr i32 %475, 10
  %477 = and i32 %476, 31
  %478 = and i32 %475, 1023
  switch i32 %477, label %484 [
    i32 31, label %479
    i32 0, label %486
  ]

479:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %480 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not835.i = icmp eq i32 %478, 0
  %481 = select i1 %.not835.i, i32 2139095040, i32 2143289344
  %482 = or disjoint i32 %481, %480
  %483 = bitcast i32 %482 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

484:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %485 = or disjoint i32 %478, 1024
  br label %486

486:                                              ; preds = %484, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %487 = phi i32 [ %485, %484 ], [ %478, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %488 = uitofp i32 %487 to float
  %.not828.i = icmp eq i32 %477, 0
  %489 = add nsw i32 %477, -25
  %490 = select i1 %.not828.i, i32 -24, i32 %489
  %491 = call float @__ocml_ldexp_f32(float noundef %488, i32 noundef %490) #6
  %492 = fneg contract float %491
  %.not829830.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %493 = select contract i1 %.not829830.i, float %492, float %491
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %486, %479
  %494 = phi float [ %483, %479 ], [ %493, %486 ]
  %495 = fmul contract float %474, %494
  %496 = fadd contract float %421, %495
  %497 = or disjoint i64 %451, %196
  %498 = trunc i64 %497 to i32
  %499 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %498
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %499, align 2, !tbaa.struct !23
  %500 = zext i16 %.sroa.0186.0.copyload.i to i32
  %501 = lshr i32 %500, 10
  %502 = and i32 %501, 31
  %503 = and i32 %500, 1023
  switch i32 %502, label %509 [
    i32 31, label %504
    i32 0, label %511
  ]

504:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %505 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not834.i = icmp eq i32 %503, 0
  %506 = select i1 %.not834.i, i32 2139095040, i32 2143289344
  %507 = or disjoint i32 %506, %505
  %508 = bitcast i32 %507 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

509:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %510 = or disjoint i32 %503, 1024
  br label %511

511:                                              ; preds = %509, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %512 = phi i32 [ %510, %509 ], [ %503, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %513 = uitofp i32 %512 to float
  %.not831.i = icmp eq i32 %502, 0
  %514 = add nsw i32 %502, -25
  %515 = select i1 %.not831.i, i32 -24, i32 %514
  %516 = call float @__ocml_ldexp_f32(float noundef %513, i32 noundef %515) #6
  %517 = fneg contract float %516
  %.not832833.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %518 = select contract i1 %.not832833.i, float %517, float %516
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %511, %504
  %519 = phi float [ %508, %504 ], [ %518, %511 ]
  %520 = fmul contract float %474, %519
  %521 = fadd contract float %446, %520
  %522 = add nuw nsw i64 %220, 4
  %523 = icmp ult i64 %220, 28
  br i1 %523, label %219, label %._crit_edge868.i, !llvm.loop !38

524:                                              ; preds = %._crit_edge868.i
  %525 = shl nuw i32 %.tr.i, 7
  %526 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %527 = icmp eq i64 %526, 0
  call void @llvm.assume(i1 %527)
  %528 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %529 = icmp eq i64 %528, 0
  call void @llvm.assume(i1 %529)
  %530 = sext i32 %3 to i64
  %531 = call i32 @llvm.amdgcn.groupstaticsize()
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = sext i32 %525 to i64
  %534 = icmp sgt i32 %4, 0
  %535 = icmp ugt i32 %4, 1
  %536 = icmp ugt i32 %4, 2
  %537 = icmp ugt i32 %4, 3
  %538 = icmp ugt i32 %4, 4
  %539 = icmp ugt i32 %4, 5
  %540 = icmp ugt i32 %4, 6
  %541 = icmp ugt i32 %4, 7
  %542 = icmp ugt i32 %4, 8
  %543 = icmp ugt i32 %4, 9
  %544 = icmp ugt i32 %4, 10
  %545 = icmp ugt i32 %4, 11
  %546 = icmp ugt i32 %4, 12
  %547 = icmp ugt i32 %4, 13
  %548 = icmp ugt i32 %4, 14
  %549 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split870.us.i, %524
  %550 = phi i64 [ 0, %524 ], [ %556, %.split870.us.i ]
  %551 = icmp slt i64 %550, %530
  %552 = shl i64 %550, 4
  %.tr798.i = trunc i64 %550 to i32
  %553 = shl i32 %.tr798.i, 4
  %554 = sext i32 %553 to i64
  %555 = add nsw i64 %554, %533
  %.fr871.i = freeze i1 %551
  %brmerge.not.i = select i1 %.fr871.i, i1 %534, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split870.us.i

.split870.us.i:                                   ; preds = %645, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %556 = add nuw nsw i64 %550, 1
  %exitcond880.not.i = icmp eq i64 %556, 8
  br i1 %exitcond880.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %557 = trunc i64 %552 to i32
  %558 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %557
  %559 = load float, ptr addrspace(3) %558, align 4, !tbaa !36
  %560 = getelementptr inbounds float, ptr %9, i64 %555
  store float %559, ptr %560, align 32, !tbaa !36
  br i1 %535, label %.preheader.split.2.i, label %.split870.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %561 = trunc i64 %552 to i32
  %562 = or disjoint i32 %561, 1
  %563 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %562
  %564 = load float, ptr addrspace(3) %563, align 4, !tbaa !36
  %565 = or disjoint i64 %555, 1
  %566 = getelementptr inbounds float, ptr %9, i64 %565
  store float %564, ptr %566, align 4, !tbaa !36
  br i1 %536, label %.preheader.split.3.i, label %.split870.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %567 = trunc i64 %552 to i32
  %568 = or disjoint i32 %567, 2
  %569 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %568
  %570 = load float, ptr addrspace(3) %569, align 4, !tbaa !36
  %571 = or disjoint i64 %555, 2
  %572 = getelementptr inbounds float, ptr %9, i64 %571
  store float %570, ptr %572, align 8, !tbaa !36
  br i1 %537, label %.preheader.split.4.i, label %.split870.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %573 = trunc i64 %552 to i32
  %574 = or disjoint i32 %573, 3
  %575 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %574
  %576 = load float, ptr addrspace(3) %575, align 4, !tbaa !36
  %577 = or disjoint i64 %555, 3
  %578 = getelementptr inbounds float, ptr %9, i64 %577
  store float %576, ptr %578, align 4, !tbaa !36
  br i1 %538, label %.preheader.split.5.i, label %.split870.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %579 = trunc i64 %552 to i32
  %580 = or disjoint i32 %579, 4
  %581 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %580
  %582 = load float, ptr addrspace(3) %581, align 4, !tbaa !36
  %583 = or disjoint i64 %555, 4
  %584 = getelementptr inbounds float, ptr %9, i64 %583
  store float %582, ptr %584, align 16, !tbaa !36
  br i1 %539, label %.preheader.split.6.i, label %.split870.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %585 = trunc i64 %552 to i32
  %586 = or disjoint i32 %585, 5
  %587 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %586
  %588 = load float, ptr addrspace(3) %587, align 4, !tbaa !36
  %589 = or disjoint i64 %555, 5
  %590 = getelementptr inbounds float, ptr %9, i64 %589
  store float %588, ptr %590, align 4, !tbaa !36
  br i1 %540, label %.preheader.split.7.i, label %.split870.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %591 = trunc i64 %552 to i32
  %592 = or disjoint i32 %591, 6
  %593 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %592
  %594 = load float, ptr addrspace(3) %593, align 4, !tbaa !36
  %595 = or disjoint i64 %555, 6
  %596 = getelementptr inbounds float, ptr %9, i64 %595
  store float %594, ptr %596, align 8, !tbaa !36
  br i1 %541, label %.preheader.split.8.i, label %.split870.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %597 = trunc i64 %552 to i32
  %598 = or disjoint i32 %597, 7
  %599 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %598
  %600 = load float, ptr addrspace(3) %599, align 4, !tbaa !36
  %601 = or disjoint i64 %555, 7
  %602 = getelementptr inbounds float, ptr %9, i64 %601
  store float %600, ptr %602, align 4, !tbaa !36
  br i1 %542, label %.preheader.split.9.i, label %.split870.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %603 = trunc i64 %552 to i32
  %604 = or disjoint i32 %603, 8
  %605 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %604
  %606 = load float, ptr addrspace(3) %605, align 4, !tbaa !36
  %607 = or disjoint i64 %555, 8
  %608 = getelementptr inbounds float, ptr %9, i64 %607
  store float %606, ptr %608, align 32, !tbaa !36
  br i1 %543, label %.preheader.split.10.i, label %.split870.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %609 = trunc i64 %552 to i32
  %610 = or disjoint i32 %609, 9
  %611 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %610
  %612 = load float, ptr addrspace(3) %611, align 4, !tbaa !36
  %613 = or disjoint i64 %555, 9
  %614 = getelementptr inbounds float, ptr %9, i64 %613
  store float %612, ptr %614, align 4, !tbaa !36
  br i1 %544, label %.preheader.split.11.i, label %.split870.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %615 = trunc i64 %552 to i32
  %616 = or disjoint i32 %615, 10
  %617 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %616
  %618 = load float, ptr addrspace(3) %617, align 4, !tbaa !36
  %619 = or disjoint i64 %555, 10
  %620 = getelementptr inbounds float, ptr %9, i64 %619
  store float %618, ptr %620, align 8, !tbaa !36
  br i1 %545, label %.preheader.split.12.i, label %.split870.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %621 = trunc i64 %552 to i32
  %622 = or disjoint i32 %621, 11
  %623 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %622
  %624 = load float, ptr addrspace(3) %623, align 4, !tbaa !36
  %625 = or disjoint i64 %555, 11
  %626 = getelementptr inbounds float, ptr %9, i64 %625
  store float %624, ptr %626, align 4, !tbaa !36
  br i1 %546, label %.preheader.split.13.i, label %.split870.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %627 = trunc i64 %552 to i32
  %628 = or disjoint i32 %627, 12
  %629 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %628
  %630 = load float, ptr addrspace(3) %629, align 4, !tbaa !36
  %631 = or disjoint i64 %555, 12
  %632 = getelementptr inbounds float, ptr %9, i64 %631
  store float %630, ptr %632, align 16, !tbaa !36
  br i1 %547, label %.preheader.split.14.i, label %.split870.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %633 = trunc i64 %552 to i32
  %634 = or disjoint i32 %633, 13
  %635 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %634
  %636 = load float, ptr addrspace(3) %635, align 4, !tbaa !36
  %637 = or disjoint i64 %555, 13
  %638 = getelementptr inbounds float, ptr %9, i64 %637
  store float %636, ptr %638, align 4, !tbaa !36
  br i1 %548, label %.preheader.split.15.i, label %.split870.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %639 = trunc i64 %552 to i32
  %640 = or disjoint i32 %639, 14
  %641 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %640
  %642 = load float, ptr addrspace(3) %641, align 4, !tbaa !36
  %643 = or disjoint i64 %555, 14
  %644 = getelementptr inbounds float, ptr %9, i64 %643
  store float %642, ptr %644, align 8, !tbaa !36
  br i1 %549, label %645, label %.split870.us.i

645:                                              ; preds = %.preheader.split.15.i
  %646 = trunc i64 %552 to i32
  %647 = or disjoint i32 %646, 15
  %648 = getelementptr inbounds float, ptr addrspace(3) %532, i32 %647
  %649 = load float, ptr addrspace(3) %648, align 4, !tbaa !36
  %650 = or disjoint i64 %555, 15
  %651 = getelementptr inbounds float, ptr %9, i64 %650
  store float %649, ptr %651, align 4, !tbaa !36
  br label %.split870.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge868.i, %.split870.us.i
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
!35 = distinct !{!35, !29, !30, !31}
!36 = !{!37, !37, i64 0}
!37 = !{!"float", !26, i64 0}
!38 = distinct !{!38, !29}
!39 = distinct !{!39, !29}
;----------------- End AdaptiveCpp IR dump ---------------
