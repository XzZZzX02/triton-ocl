;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-k4l69ude/kernel.cpp"
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
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 536870911
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp ult i64 %20, 4
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 536870912
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 536870911
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 4
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.lr.ph.i

34:                                               ; preds = %6
  %35 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %36 = icmp ult i64 %35, 4
  call void @llvm.assume(i1 %36)
  %37 = icmp eq i64 %35, 0
  br i1 %37, label %38, label %.lr.ph.i

38:                                               ; preds = %34
  %39 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %40 = icmp ult i64 %39, 4
  call void @llvm.assume(i1 %40)
  %41 = icmp eq i64 %39, 0
  br i1 %41, label %.preheader566.i, label %.lr.ph.i

.preheader566.i:                                  ; preds = %38
  %42 = sext i32 %5 to i64
  %43 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %44 = inttoptr i32 %43 to ptr addrspace(3)
  %45 = getelementptr inbounds i8, ptr addrspace(3) %44, i32 512
  %46 = sext i32 %30 to i64
  %47 = icmp sgt i32 %3, 0
  %48 = icmp ugt i32 %3, 1
  %49 = icmp ugt i32 %3, 2
  %50 = icmp ugt i32 %3, 3
  %51 = icmp ugt i32 %3, 4
  %52 = icmp ugt i32 %3, 5
  %53 = icmp ugt i32 %3, 6
  %54 = icmp ugt i32 %3, 7
  br label %.preheader565.i

.preheader565.i:                                  ; preds = %.split.us.i, %.preheader566.i
  %55 = phi i64 [ 0, %.preheader566.i ], [ %65, %.split.us.i ]
  %56 = icmp slt i64 %55, %42
  %57 = shl i64 %55, 3
  %.tr559.i = trunc i64 %55 to i32
  %58 = shl i32 %.tr559.i, 3
  %59 = sext i32 %58 to i64
  %60 = add nsw i64 %59, %46
  %.fr.i = freeze i1 %56
  br i1 %.fr.i, label %.preheader565.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.us.preheader.i: ; preds = %.preheader565.i
  %.tr598.i = trunc i64 %55 to i32
  %61 = shl i32 %.tr598.i, 4
  %62 = add i32 %61, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %44, i32 %62
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader565.split.preheader.i:                  ; preds = %.preheader565.i
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.thread.i: ; preds = %.preheader565.split.preheader.i
  %63 = trunc i64 %57 to i32
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %63
  store i16 0, ptr addrspace(3) %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.us.preheader.i
  %65 = add nuw nsw i64 %55, 1
  %exitcond.not.i = icmp eq i64 %65, 16
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader565.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i: ; preds = %.preheader565.split.preheader.i
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %60
  %.sroa.0282.0.copyload.i = load i16, ptr %66, align 16, !tbaa.struct !23
  %67 = trunc i64 %57 to i32
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %67
  store i16 %.sroa.0282.0.copyload.i, ptr addrspace(3) %68, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.thread.i
  %69 = trunc i64 %57 to i32
  %70 = or disjoint i32 %69, 1
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %70
  store i16 0, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.i
  %72 = or disjoint i64 %60, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %72
  %.sroa.0282.0.copyload.1.i = load i16, ptr %73, align 2, !tbaa.struct !23
  %74 = trunc i64 %57 to i32
  %75 = or disjoint i32 %74, 1
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %75
  store i16 %.sroa.0282.0.copyload.1.i, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.thread.i
  %77 = trunc i64 %57 to i32
  %78 = or disjoint i32 %77, 2
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %78
  store i16 0, ptr addrspace(3) %79, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.1.i
  %80 = or disjoint i64 %60, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %80
  %.sroa.0282.0.copyload.2.i = load i16, ptr %81, align 4, !tbaa.struct !23
  %82 = trunc i64 %57 to i32
  %83 = or disjoint i32 %82, 2
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %83
  store i16 %.sroa.0282.0.copyload.2.i, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.thread.i
  %85 = trunc i64 %57 to i32
  %86 = or disjoint i32 %85, 3
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %86
  store i16 0, ptr addrspace(3) %87, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.2.i
  %88 = or disjoint i64 %60, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %88
  %.sroa.0282.0.copyload.3.i = load i16, ptr %89, align 2, !tbaa.struct !23
  %90 = trunc i64 %57 to i32
  %91 = or disjoint i32 %90, 3
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %91
  store i16 %.sroa.0282.0.copyload.3.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.thread.i
  %93 = trunc i64 %57 to i32
  %94 = or disjoint i32 %93, 4
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %94
  store i16 0, ptr addrspace(3) %95, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.3.i
  %96 = or disjoint i64 %60, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %96
  %.sroa.0282.0.copyload.4.i = load i16, ptr %97, align 8, !tbaa.struct !23
  %98 = trunc i64 %57 to i32
  %99 = or disjoint i32 %98, 4
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %99
  store i16 %.sroa.0282.0.copyload.4.i, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.thread.i
  %101 = trunc i64 %57 to i32
  %102 = or disjoint i32 %101, 5
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %102
  store i16 0, ptr addrspace(3) %103, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.4.i
  %104 = or disjoint i64 %60, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0282.0.copyload.5.i = load i16, ptr %105, align 2, !tbaa.struct !23
  %106 = trunc i64 %57 to i32
  %107 = or disjoint i32 %106, 5
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %107
  store i16 %.sroa.0282.0.copyload.5.i, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br i1 %53, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.thread.i
  %109 = trunc i64 %57 to i32
  %110 = or disjoint i32 %109, 6
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %110
  store i16 0, ptr addrspace(3) %111, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.5.i
  %112 = or disjoint i64 %60, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %112
  %.sroa.0282.0.copyload.6.i = load i16, ptr %113, align 4, !tbaa.struct !23
  %114 = trunc i64 %57 to i32
  %115 = or disjoint i32 %114, 6
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %115
  store i16 %.sroa.0282.0.copyload.6.i, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  br i1 %54, label %117, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i

117:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i
  %118 = or disjoint i64 %60, 7
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %118
  %.sroa.0282.0.copyload.7.i = load i16, ptr %119, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.7.i: ; preds = %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i
  %.sroa.0284.2.7.i = phi i16 [ %.sroa.0282.0.copyload.7.i, %117 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit19.i.i.6.thread.i ]
  %120 = trunc i64 %57 to i32
  %121 = or disjoint i32 %120, 7
  %122 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %45, i32 %121
  store i16 %.sroa.0284.2.7.i, ptr addrspace(3) %122, align 2, !tbaa.struct !23
  br label %.split.us.i

.lr.ph.i:                                         ; preds = %.split.us.i, %38, %34, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %124 = icmp ult i64 %123, 4
  call void @llvm.assume(i1 %124)
  %125 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %126 = icmp ult i64 %125, 4
  call void @llvm.assume(i1 %126)
  %127 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %128 = icmp ult i64 %127, 4
  call void @llvm.assume(i1 %128)
  %129 = shl nuw nsw i64 %127, 4
  %130 = shl nuw nsw i64 %125, 2
  %131 = or disjoint i64 %129, %130
  %132 = or disjoint i64 %131, %123
  %133 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %134 = inttoptr i32 %133 to ptr addrspace(3)
  %135 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 512
  %136 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i

.lr.ph577.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %138 = icmp ult i64 %137, 4
  call void @llvm.assume(i1 %138)
  %139 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %140 = icmp ult i64 %139, 4
  call void @llvm.assume(i1 %140)
  %141 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %142 = icmp ult i64 %141, 4
  call void @llvm.assume(i1 %142)
  %143 = shl nuw nsw i64 %141, 4
  %144 = shl nuw nsw i64 %139, 2
  %145 = or disjoint i64 %143, %144
  %146 = or disjoint i64 %145, %137
  %147 = shl i32 %.tr.i, 8
  %148 = sext i32 %4 to i64
  %149 = sext i32 %5 to i64
  %150 = sext i32 %147 to i64
  %151 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %152 = inttoptr i32 %151 to ptr addrspace(3)
  %153 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 1024
  br label %181

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, %.lr.ph.i
  %154 = phi i64 [ %132, %.lr.ph.i ], [ %165, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i ]
  %155 = lshr i64 %154, 4
  %156 = and i64 %155, 7
  %157 = shl i64 %154, 3
  %158 = and i64 %157, 120
  %159 = or disjoint i64 %158, %156
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %160
  %.sroa.0323.0.copyload.i = load i16, ptr addrspace(3) %161, align 2, !tbaa.struct !23
  %162 = trunc i64 %154 to i32
  %163 = and i32 %162, 127
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %163
  store i16 %.sroa.0323.0.copyload.i, ptr addrspace(3) %164, align 2, !tbaa.struct !23
  %165 = add nuw nsw i64 %154, 64
  %166 = icmp ult i64 %154, 64
  br i1 %166, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, label %.lr.ph577.i, !llvm.loop !32

.lr.ph580.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %167 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %168 = icmp ult i64 %167, 4
  call void @llvm.assume(i1 %168)
  %169 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %170 = icmp ult i64 %169, 4
  call void @llvm.assume(i1 %170)
  %171 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %172 = icmp ult i64 %171, 4
  call void @llvm.assume(i1 %172)
  %173 = shl nuw nsw i64 %171, 4
  %174 = shl nuw nsw i64 %169, 2
  %175 = or disjoint i64 %173, %174
  %176 = or disjoint i64 %175, %167
  %177 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %178 = inttoptr i32 %177 to ptr addrspace(3)
  %179 = getelementptr inbounds i8, ptr addrspace(3) %178, i32 1024
  %180 = getelementptr inbounds i8, ptr addrspace(3) %178, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i

181:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph577.i
  %182 = phi i64 [ %146, %.lr.ph577.i ], [ %197, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %.frozen.i = freeze i64 %182
  %183 = sdiv i64 %.frozen.i, 16
  %184 = srem i64 %183, 16
  %185 = mul i64 %183, 16
  %.decomposed.i = sub i64 %.frozen.i, %185
  %186 = icmp slt i64 %184, %148
  %187 = icmp slt i64 %.decomposed.i, %149
  %188 = and i1 %187, %186
  br i1 %188, label %189, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

189:                                              ; preds = %181
  %.tr556.i = trunc i64 %184 to i32
  %190 = shl nsw i32 %.tr556.i, 4
  %191 = sext i32 %190 to i64
  %192 = add nsw i64 %.decomposed.i, %150
  %193 = add nsw i64 %192, %191
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %193
  %.sroa.0245.0.copyload.i = load i16, ptr %194, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %189, %181
  %.sroa.0247.1.i = phi i16 [ %.sroa.0245.0.copyload.i, %189 ], [ 0, %181 ]
  %srem557.i = srem i64 %182, 256
  %195 = trunc i64 %srem557.i to i32
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %153, i32 %195
  store i16 %.sroa.0247.1.i, ptr addrspace(3) %196, align 2, !tbaa.struct !23
  %197 = add i64 %182, 64
  %198 = icmp slt i64 %197, 256
  br i1 %198, label %181, label %.lr.ph580.i, !llvm.loop !33

.lr.ph583.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %199 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %200 = icmp ult i64 %199, 4
  call void @llvm.assume(i1 %200)
  %201 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %202 = icmp ult i64 %201, 4
  call void @llvm.assume(i1 %202)
  %203 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %204 = icmp ult i64 %203, 4
  call void @llvm.assume(i1 %204)
  %205 = shl nuw nsw i64 %203, 4
  %206 = shl nuw nsw i64 %201, 2
  %207 = or disjoint i64 %205, %206
  %208 = or disjoint i64 %207, %199
  %209 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %210 = inttoptr i32 %209 to ptr addrspace(3)
  %211 = getelementptr inbounds i8, ptr addrspace(3) %210, i32 768
  %212 = getelementptr inbounds i8, ptr addrspace(3) %210, i32 1536
  br label %229

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %.lr.ph580.i
  %213 = phi i64 [ %176, %.lr.ph580.i ], [ %224, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i ]
  %214 = lshr i64 %213, 4
  %215 = and i64 %214, 15
  %216 = shl i64 %213, 4
  %217 = and i64 %216, 240
  %218 = or disjoint i64 %217, %215
  %219 = trunc i64 %218 to i32
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %179, i32 %219
  %.sroa.0324.0.copyload.i = load i16, ptr addrspace(3) %220, align 2, !tbaa.struct !23
  %221 = trunc i64 %213 to i32
  %222 = and i32 %221, 255
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %180, i32 %222
  store i16 %.sroa.0324.0.copyload.i, ptr addrspace(3) %223, align 2, !tbaa.struct !23
  %224 = add nuw nsw i64 %213, 64
  %225 = icmp ult i64 %213, 192
  br i1 %225, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, label %.lr.ph583.i, !llvm.loop !34

._crit_edge584.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %226 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %227 = icmp ult i64 %226, 4
  call void @llvm.assume(i1 %227)
  %228 = icmp eq i64 %226, 0
  br i1 %228, label %323, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

229:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, %.lr.ph583.i
  %230 = phi i64 [ %208, %.lr.ph583.i ], [ %242, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i ]
  %.frozen612.i = freeze i64 %230
  %231 = sdiv i64 %.frozen612.i, 8
  %232 = srem i64 %231, 8
  %233 = mul i64 %231, 8
  %.decomposed613.i = sub i64 %.frozen612.i, %233
  %234 = add nsw i64 %.decomposed613.i, 8
  %235 = shl nsw i64 %232, 4
  br label %244

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %236 = add nsw i64 %235, %.decomposed613.i
  %237 = trunc i64 %236 to i32
  %238 = getelementptr inbounds float, ptr addrspace(3) %210, i32 %237
  store float %296, ptr addrspace(3) %238, align 4, !tbaa !35
  %239 = add nuw nsw i64 %235, %234
  %240 = trunc i64 %239 to i32
  %241 = getelementptr inbounds float, ptr addrspace(3) %210, i32 %240
  store float %321, ptr addrspace(3) %241, align 4, !tbaa !35
  %242 = add i64 %230, 64
  %243 = icmp ugt i64 %230, 9223372036854775743
  br i1 %243, label %229, label %._crit_edge584.i, !llvm.loop !37

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %229
  %245 = phi i64 [ 0, %229 ], [ %322, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %246 = phi float [ 0.000000e+00, %229 ], [ %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %247 = phi float [ 0.000000e+00, %229 ], [ %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %248 = add nuw nsw i64 %245, %235
  %249 = trunc i64 %248 to i32
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %211, i32 %249
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %250, align 2, !tbaa.struct !23
  %251 = shl nuw nsw i64 %245, 4
  %252 = add nsw i64 %251, %.decomposed613.i
  %253 = trunc i64 %252 to i32
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %212, i32 %253
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %254, align 2, !tbaa.struct !23
  %255 = zext i16 %.sroa.0204.0.copyload.i to i32
  %256 = lshr i32 %255, 10
  %257 = and i32 %256, 31
  %258 = and i32 %255, 1023
  switch i32 %257, label %264 [
    i32 31, label %259
    i32 0, label %266
  ]

259:                                              ; preds = %244
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %260 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not555.i = icmp eq i32 %258, 0
  %261 = select i1 %.not555.i, i32 2139095040, i32 2143289344
  %262 = or disjoint i32 %261, %260
  %263 = bitcast i32 %262 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

264:                                              ; preds = %244
  %265 = or disjoint i32 %258, 1024
  br label %266

266:                                              ; preds = %264, %244
  %267 = phi i32 [ %265, %264 ], [ %258, %244 ]
  %268 = uitofp i32 %267 to float
  %.not.i = icmp eq i32 %257, 0
  %269 = add nsw i32 %257, -25
  %270 = select i1 %.not.i, i32 -24, i32 %269
  %271 = call float @__ocml_ldexp_f32(float noundef %268, i32 noundef %270) #6
  %272 = fneg contract float %271
  %.not545546.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %273 = select contract i1 %.not545546.i, float %272, float %271
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %266, %259
  %274 = phi float [ %263, %259 ], [ %273, %266 ]
  %275 = zext i16 %.sroa.0195.0.copyload.i to i32
  %276 = lshr i32 %275, 10
  %277 = and i32 %276, 31
  %278 = and i32 %275, 1023
  switch i32 %277, label %284 [
    i32 31, label %279
    i32 0, label %286
  ]

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %280 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not554.i = icmp eq i32 %278, 0
  %281 = select i1 %.not554.i, i32 2139095040, i32 2143289344
  %282 = or disjoint i32 %281, %280
  %283 = bitcast i32 %282 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

284:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %285 = or disjoint i32 %278, 1024
  br label %286

286:                                              ; preds = %284, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %287 = phi i32 [ %285, %284 ], [ %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %288 = uitofp i32 %287 to float
  %.not547.i = icmp eq i32 %277, 0
  %289 = add nsw i32 %277, -25
  %290 = select i1 %.not547.i, i32 -24, i32 %289
  %291 = call float @__ocml_ldexp_f32(float noundef %288, i32 noundef %290) #6
  %292 = fneg contract float %291
  %.not548549.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %293 = select contract i1 %.not548549.i, float %292, float %291
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %286, %279
  %294 = phi float [ %283, %279 ], [ %293, %286 ]
  %295 = fmul contract float %274, %294
  %296 = fadd contract float %247, %295
  %297 = add nuw nsw i64 %251, %234
  %298 = trunc i64 %297 to i32
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %212, i32 %298
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %299, align 2, !tbaa.struct !23
  %300 = zext i16 %.sroa.0186.0.copyload.i to i32
  %301 = lshr i32 %300, 10
  %302 = and i32 %301, 31
  %303 = and i32 %300, 1023
  switch i32 %302, label %309 [
    i32 31, label %304
    i32 0, label %311
  ]

304:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %305 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not553.i = icmp eq i32 %303, 0
  %306 = select i1 %.not553.i, i32 2139095040, i32 2143289344
  %307 = or disjoint i32 %306, %305
  %308 = bitcast i32 %307 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

309:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %310 = or disjoint i32 %303, 1024
  br label %311

311:                                              ; preds = %309, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %312 = phi i32 [ %310, %309 ], [ %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %313 = uitofp i32 %312 to float
  %.not550.i = icmp eq i32 %302, 0
  %314 = add nsw i32 %302, -25
  %315 = select i1 %.not550.i, i32 -24, i32 %314
  %316 = call float @__ocml_ldexp_f32(float noundef %313, i32 noundef %315) #6
  %317 = fneg contract float %316
  %.not551552.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %318 = select contract i1 %.not551552.i, float %317, float %316
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %311, %304
  %319 = phi float [ %308, %304 ], [ %318, %311 ]
  %320 = fmul contract float %274, %319
  %321 = fadd contract float %246, %320
  %322 = add nuw nsw i64 %245, 1
  %exitcond595.not.i = icmp eq i64 %322, 16
  br i1 %exitcond595.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, label %244, !llvm.loop !38

323:                                              ; preds = %._crit_edge584.i
  %324 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %325 = icmp ult i64 %324, 4
  call void @llvm.assume(i1 %325)
  %326 = icmp eq i64 %324, 0
  br i1 %326, label %327, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

327:                                              ; preds = %323
  %328 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %329 = icmp ult i64 %328, 4
  call void @llvm.assume(i1 %329)
  %330 = icmp eq i64 %328, 0
  br i1 %330, label %.preheader564.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader564.i:                                  ; preds = %327
  %331 = sext i32 %3 to i64
  %332 = call i32 @llvm.amdgcn.groupstaticsize()
  %333 = inttoptr i32 %332 to ptr addrspace(3)
  %334 = sext i32 %30 to i64
  %335 = icmp sgt i32 %4, 0
  %336 = icmp ugt i32 %4, 1
  %337 = icmp ugt i32 %4, 2
  %338 = icmp ugt i32 %4, 3
  %339 = icmp ugt i32 %4, 4
  %340 = icmp ugt i32 %4, 5
  %341 = icmp ugt i32 %4, 6
  %342 = icmp ugt i32 %4, 7
  %343 = icmp ugt i32 %4, 8
  %344 = icmp ugt i32 %4, 9
  %345 = icmp ugt i32 %4, 10
  %346 = icmp ugt i32 %4, 11
  %347 = icmp ugt i32 %4, 12
  %348 = icmp ugt i32 %4, 13
  %349 = icmp ugt i32 %4, 14
  %350 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split586.us.i, %.preheader564.i
  %351 = phi i64 [ 0, %.preheader564.i ], [ %357, %.split586.us.i ]
  %352 = icmp slt i64 %351, %331
  %353 = shl i64 %351, 4
  %.tr544.i = trunc i64 %351 to i32
  %354 = shl i32 %.tr544.i, 4
  %355 = sext i32 %354 to i64
  %356 = add nsw i64 %355, %334
  %.fr587.i = freeze i1 %352
  %brmerge.not.i = select i1 %.fr587.i, i1 %335, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split586.us.i

.split586.us.i:                                   ; preds = %446, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %357 = add nuw nsw i64 %351, 1
  %exitcond597.not.i = icmp eq i64 %357, 8
  br i1 %exitcond597.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %358 = trunc i64 %353 to i32
  %359 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %358
  %360 = load float, ptr addrspace(3) %359, align 4, !tbaa !35
  %361 = getelementptr inbounds float, ptr %9, i64 %356
  store float %360, ptr %361, align 32, !tbaa !35
  br i1 %336, label %.preheader.split.2.i, label %.split586.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %362 = trunc i64 %353 to i32
  %363 = or disjoint i32 %362, 1
  %364 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %363
  %365 = load float, ptr addrspace(3) %364, align 4, !tbaa !35
  %366 = or disjoint i64 %356, 1
  %367 = getelementptr inbounds float, ptr %9, i64 %366
  store float %365, ptr %367, align 4, !tbaa !35
  br i1 %337, label %.preheader.split.3.i, label %.split586.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %368 = trunc i64 %353 to i32
  %369 = or disjoint i32 %368, 2
  %370 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %369
  %371 = load float, ptr addrspace(3) %370, align 4, !tbaa !35
  %372 = or disjoint i64 %356, 2
  %373 = getelementptr inbounds float, ptr %9, i64 %372
  store float %371, ptr %373, align 8, !tbaa !35
  br i1 %338, label %.preheader.split.4.i, label %.split586.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %374 = trunc i64 %353 to i32
  %375 = or disjoint i32 %374, 3
  %376 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %375
  %377 = load float, ptr addrspace(3) %376, align 4, !tbaa !35
  %378 = or disjoint i64 %356, 3
  %379 = getelementptr inbounds float, ptr %9, i64 %378
  store float %377, ptr %379, align 4, !tbaa !35
  br i1 %339, label %.preheader.split.5.i, label %.split586.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %380 = trunc i64 %353 to i32
  %381 = or disjoint i32 %380, 4
  %382 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %381
  %383 = load float, ptr addrspace(3) %382, align 4, !tbaa !35
  %384 = or disjoint i64 %356, 4
  %385 = getelementptr inbounds float, ptr %9, i64 %384
  store float %383, ptr %385, align 16, !tbaa !35
  br i1 %340, label %.preheader.split.6.i, label %.split586.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %386 = trunc i64 %353 to i32
  %387 = or disjoint i32 %386, 5
  %388 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %387
  %389 = load float, ptr addrspace(3) %388, align 4, !tbaa !35
  %390 = or disjoint i64 %356, 5
  %391 = getelementptr inbounds float, ptr %9, i64 %390
  store float %389, ptr %391, align 4, !tbaa !35
  br i1 %341, label %.preheader.split.7.i, label %.split586.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %392 = trunc i64 %353 to i32
  %393 = or disjoint i32 %392, 6
  %394 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %393
  %395 = load float, ptr addrspace(3) %394, align 4, !tbaa !35
  %396 = or disjoint i64 %356, 6
  %397 = getelementptr inbounds float, ptr %9, i64 %396
  store float %395, ptr %397, align 8, !tbaa !35
  br i1 %342, label %.preheader.split.8.i, label %.split586.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %398 = trunc i64 %353 to i32
  %399 = or disjoint i32 %398, 7
  %400 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %399
  %401 = load float, ptr addrspace(3) %400, align 4, !tbaa !35
  %402 = or disjoint i64 %356, 7
  %403 = getelementptr inbounds float, ptr %9, i64 %402
  store float %401, ptr %403, align 4, !tbaa !35
  br i1 %343, label %.preheader.split.9.i, label %.split586.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %404 = trunc i64 %353 to i32
  %405 = or disjoint i32 %404, 8
  %406 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %405
  %407 = load float, ptr addrspace(3) %406, align 4, !tbaa !35
  %408 = or disjoint i64 %356, 8
  %409 = getelementptr inbounds float, ptr %9, i64 %408
  store float %407, ptr %409, align 32, !tbaa !35
  br i1 %344, label %.preheader.split.10.i, label %.split586.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %410 = trunc i64 %353 to i32
  %411 = or disjoint i32 %410, 9
  %412 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %411
  %413 = load float, ptr addrspace(3) %412, align 4, !tbaa !35
  %414 = or disjoint i64 %356, 9
  %415 = getelementptr inbounds float, ptr %9, i64 %414
  store float %413, ptr %415, align 4, !tbaa !35
  br i1 %345, label %.preheader.split.11.i, label %.split586.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %416 = trunc i64 %353 to i32
  %417 = or disjoint i32 %416, 10
  %418 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !35
  %420 = or disjoint i64 %356, 10
  %421 = getelementptr inbounds float, ptr %9, i64 %420
  store float %419, ptr %421, align 8, !tbaa !35
  br i1 %346, label %.preheader.split.12.i, label %.split586.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %422 = trunc i64 %353 to i32
  %423 = or disjoint i32 %422, 11
  %424 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %423
  %425 = load float, ptr addrspace(3) %424, align 4, !tbaa !35
  %426 = or disjoint i64 %356, 11
  %427 = getelementptr inbounds float, ptr %9, i64 %426
  store float %425, ptr %427, align 4, !tbaa !35
  br i1 %347, label %.preheader.split.13.i, label %.split586.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %428 = trunc i64 %353 to i32
  %429 = or disjoint i32 %428, 12
  %430 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %429
  %431 = load float, ptr addrspace(3) %430, align 4, !tbaa !35
  %432 = or disjoint i64 %356, 12
  %433 = getelementptr inbounds float, ptr %9, i64 %432
  store float %431, ptr %433, align 16, !tbaa !35
  br i1 %348, label %.preheader.split.14.i, label %.split586.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %434 = trunc i64 %353 to i32
  %435 = or disjoint i32 %434, 13
  %436 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %435
  %437 = load float, ptr addrspace(3) %436, align 4, !tbaa !35
  %438 = or disjoint i64 %356, 13
  %439 = getelementptr inbounds float, ptr %9, i64 %438
  store float %437, ptr %439, align 4, !tbaa !35
  br i1 %349, label %.preheader.split.15.i, label %.split586.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %440 = trunc i64 %353 to i32
  %441 = or disjoint i32 %440, 14
  %442 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %441
  %443 = load float, ptr addrspace(3) %442, align 4, !tbaa !35
  %444 = or disjoint i64 %356, 14
  %445 = getelementptr inbounds float, ptr %9, i64 %444
  store float %443, ptr %445, align 8, !tbaa !35
  br i1 %350, label %446, label %.split586.us.i

446:                                              ; preds = %.preheader.split.15.i
  %447 = trunc i64 %353 to i32
  %448 = or disjoint i32 %447, 15
  %449 = getelementptr inbounds float, ptr addrspace(3) %333, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !35
  %451 = or disjoint i64 %356, 15
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 4, !tbaa !35
  br label %.split586.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge584.i, %323, %327, %.split586.us.i
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
!39 = distinct !{!39, !29}
;----------------- End AdaptiveCpp IR dump ---------------
