;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-31w8wxyh/kernel.cpp"
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
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 128
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  %36 = trunc i64 %32 to i32
  %37 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %36
  store float 0.000000e+00, ptr addrspace(3) %37, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 16777215
  call void @llvm.assume(i1 %39)
  %.tr.i = trunc i64 %38 to i32
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %41 = icmp ult i64 %40, 128
  call void @llvm.assume(i1 %41)
  %42 = icmp eq i64 %40, 0
  br i1 %42, label %43, label %.lr.ph490.i

43:                                               ; preds = %6
  %44 = shl i32 %.tr.i, 10
  %45 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = sext i32 %5 to i64
  %50 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %51 = inttoptr i32 %50 to ptr addrspace(3)
  %52 = getelementptr inbounds i8, ptr addrspace(3) %51, i32 512
  %53 = sext i32 %44 to i64
  %54 = icmp sgt i32 %3, 0
  %55 = icmp ugt i32 %3, 1
  %56 = icmp ugt i32 %3, 2
  %57 = icmp ugt i32 %3, 3
  %58 = icmp ugt i32 %3, 4
  %59 = icmp ugt i32 %3, 5
  %60 = icmp ugt i32 %3, 6
  %61 = icmp ugt i32 %3, 7
  br label %.preheader483.i

.preheader483.i:                                  ; preds = %.split.us.i, %43
  %62 = phi i64 [ 0, %43 ], [ %72, %.split.us.i ]
  %63 = icmp slt i64 %62, %49
  %64 = shl i64 %62, 3
  %.tr477.i = trunc i64 %62 to i32
  %65 = shl i32 %.tr477.i, 3
  %66 = sext i32 %65 to i64
  %67 = add nsw i64 %66, %53
  %.fr.i = freeze i1 %63
  br i1 %.fr.i, label %.preheader483.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader483.i
  %.tr511.i = trunc i64 %62 to i32
  %68 = shl i32 %.tr511.i, 4
  %69 = add i32 %68, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %51, i32 %69
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader483.split.preheader.i:                  ; preds = %.preheader483.i
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader483.split.preheader.i
  %70 = trunc i64 %64 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %70
  store i16 0, ptr addrspace(3) %71, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %72 = add nuw nsw i64 %62, 1
  %exitcond.not.i = icmp eq i64 %72, 128
  br i1 %exitcond.not.i, label %.lr.ph490.i, label %.preheader483.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader483.split.preheader.i
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %67
  %.sroa.0239.0.copyload.i = load i16, ptr %73, align 16, !tbaa.struct !27
  %74 = trunc i64 %64 to i32
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %74
  store i16 %.sroa.0239.0.copyload.i, ptr addrspace(3) %75, align 2, !tbaa.struct !27
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %76 = trunc i64 %64 to i32
  %77 = or disjoint i32 %76, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %77
  store i16 0, ptr addrspace(3) %78, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %79 = or disjoint i64 %67, 1
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %79
  %.sroa.0239.0.copyload.1.i = load i16, ptr %80, align 2, !tbaa.struct !27
  %81 = trunc i64 %64 to i32
  %82 = or disjoint i32 %81, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %82
  store i16 %.sroa.0239.0.copyload.1.i, ptr addrspace(3) %83, align 2, !tbaa.struct !27
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %84 = trunc i64 %64 to i32
  %85 = or disjoint i32 %84, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %85
  store i16 0, ptr addrspace(3) %86, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %87 = or disjoint i64 %67, 2
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %87
  %.sroa.0239.0.copyload.2.i = load i16, ptr %88, align 4, !tbaa.struct !27
  %89 = trunc i64 %64 to i32
  %90 = or disjoint i32 %89, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %90
  store i16 %.sroa.0239.0.copyload.2.i, ptr addrspace(3) %91, align 2, !tbaa.struct !27
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %92 = trunc i64 %64 to i32
  %93 = or disjoint i32 %92, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %93
  store i16 0, ptr addrspace(3) %94, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %95 = or disjoint i64 %67, 3
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0239.0.copyload.3.i = load i16, ptr %96, align 2, !tbaa.struct !27
  %97 = trunc i64 %64 to i32
  %98 = or disjoint i32 %97, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %98
  store i16 %.sroa.0239.0.copyload.3.i, ptr addrspace(3) %99, align 2, !tbaa.struct !27
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %100 = trunc i64 %64 to i32
  %101 = or disjoint i32 %100, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %101
  store i16 0, ptr addrspace(3) %102, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %103 = or disjoint i64 %67, 4
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0239.0.copyload.4.i = load i16, ptr %104, align 8, !tbaa.struct !27
  %105 = trunc i64 %64 to i32
  %106 = or disjoint i32 %105, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %106
  store i16 %.sroa.0239.0.copyload.4.i, ptr addrspace(3) %107, align 2, !tbaa.struct !27
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %108 = trunc i64 %64 to i32
  %109 = or disjoint i32 %108, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %109
  store i16 0, ptr addrspace(3) %110, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %111 = or disjoint i64 %67, 5
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %111
  %.sroa.0239.0.copyload.5.i = load i16, ptr %112, align 2, !tbaa.struct !27
  %113 = trunc i64 %64 to i32
  %114 = or disjoint i32 %113, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %114
  store i16 %.sroa.0239.0.copyload.5.i, ptr addrspace(3) %115, align 2, !tbaa.struct !27
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %116 = trunc i64 %64 to i32
  %117 = or disjoint i32 %116, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %117
  store i16 0, ptr addrspace(3) %118, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %119 = or disjoint i64 %67, 6
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0239.0.copyload.6.i = load i16, ptr %120, align 4, !tbaa.struct !27
  %121 = trunc i64 %64 to i32
  %122 = or disjoint i32 %121, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %122
  store i16 %.sroa.0239.0.copyload.6.i, ptr addrspace(3) %123, align 2, !tbaa.struct !27
  br i1 %61, label %124, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

124:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %125 = or disjoint i64 %67, 7
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0239.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %124, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %.sroa.0241.2.7.i = phi i16 [ %.sroa.0239.0.copyload.7.i, %124 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i ]
  %127 = trunc i64 %64 to i32
  %128 = or disjoint i32 %127, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %128
  store i16 %.sroa.0241.2.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !27
  br label %.split.us.i

.lr.ph490.i:                                      ; preds = %.split.us.i, %6
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
  %135 = icmp ult i64 %134, 128
  call void @llvm.assume(i1 %135)
  %136 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %137 = inttoptr i32 %136 to ptr addrspace(3)
  %138 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 512
  %139 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

._crit_edge491.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %140 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %141 = icmp ult i64 %140, 128
  call void @llvm.assume(i1 %141)
  %142 = icmp eq i64 %140, 0
  br i1 %142, label %154, label %.lr.ph496.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph490.i
  %143 = phi i64 [ %134, %.lr.ph490.i ], [ %152, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %144 = lshr i64 %143, 7
  %145 = shl nuw nsw i64 %143, 3
  %146 = and i64 %145, 1016
  %147 = or disjoint i64 %146, %144
  %148 = trunc i64 %147 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %148
  %.sroa.0294.0.copyload.i = load i16, ptr addrspace(3) %149, align 2, !tbaa.struct !27
  %150 = trunc i64 %143 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %139, i32 %150
  store i16 %.sroa.0294.0.copyload.i, ptr addrspace(3) %151, align 2, !tbaa.struct !27
  %152 = add nuw nsw i64 %143, 128
  %153 = icmp ult i64 %143, 896
  br i1 %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %._crit_edge491.i, !llvm.loop !34

154:                                              ; preds = %._crit_edge491.i
  %155 = shl i32 %.tr.i, 11
  %156 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %157 = icmp eq i64 %156, 0
  call void @llvm.assume(i1 %157)
  %158 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %159 = icmp eq i64 %158, 0
  call void @llvm.assume(i1 %159)
  %160 = sext i32 %5 to i64
  %161 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %162 = inttoptr i32 %161 to ptr addrspace(3)
  %163 = getelementptr inbounds i8, ptr addrspace(3) %162, i32 4608
  %164 = sext i32 %155 to i64
  %165 = icmp sgt i32 %4, 0
  %166 = icmp ugt i32 %4, 1
  %167 = icmp ugt i32 %4, 2
  %168 = icmp ugt i32 %4, 3
  %169 = icmp ugt i32 %4, 4
  %170 = icmp ugt i32 %4, 5
  %171 = icmp ugt i32 %4, 6
  %172 = icmp ugt i32 %4, 7
  %173 = icmp ugt i32 %4, 8
  %174 = icmp ugt i32 %4, 9
  %175 = icmp ugt i32 %4, 10
  %176 = icmp ugt i32 %4, 11
  %177 = icmp ugt i32 %4, 12
  %178 = icmp ugt i32 %4, 13
  %179 = icmp ugt i32 %4, 14
  %180 = icmp ugt i32 %4, 15
  br label %.preheader482.i

.preheader482.i:                                  ; preds = %.split493.us.i, %154
  %181 = phi i64 [ 0, %154 ], [ %191, %.split493.us.i ]
  %182 = icmp slt i64 %181, %160
  %183 = shl i64 %181, 4
  %.tr476.i = trunc i64 %181 to i32
  %184 = shl i32 %.tr476.i, 4
  %185 = sext i32 %184 to i64
  %186 = add nsw i64 %185, %164
  %.fr494.i = freeze i1 %182
  br i1 %.fr494.i, label %.preheader482.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.us.preheader.i: ; preds = %.preheader482.i
  %.tr510.i = trunc i64 %181 to i32
  %187 = shl i32 %.tr510.i, 5
  %188 = add i32 %187, 4608
  %scevgep504.i = getelementptr i8, ptr addrspace(3) %162, i32 %188
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep504.i, i8 0, i32 32, i1 false)
  br label %.split493.us.i

.preheader482.split.preheader.i:                  ; preds = %.preheader482.i
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.thread.i: ; preds = %.preheader482.split.preheader.i
  %189 = trunc i64 %183 to i32
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %189
  store i16 0, ptr addrspace(3) %190, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.thread.i

.split493.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.us.preheader.i
  %191 = add nuw nsw i64 %181, 1
  %exitcond506.not.i = icmp eq i64 %191, 128
  br i1 %exitcond506.not.i, label %.lr.ph496.i, label %.preheader482.i, !llvm.loop !35

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i: ; preds = %.preheader482.split.preheader.i
  %192 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %186
  %.sroa.0202.0.copyload.i = load i16, ptr %192, align 32, !tbaa.struct !27
  %193 = trunc i64 %183 to i32
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %193
  store i16 %.sroa.0202.0.copyload.i, ptr addrspace(3) %194, align 2, !tbaa.struct !27
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.thread.i
  %195 = trunc i64 %183 to i32
  %196 = or disjoint i32 %195, 1
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %196
  store i16 0, ptr addrspace(3) %197, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i
  %198 = or disjoint i64 %186, 1
  %199 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %198
  %.sroa.0202.0.copyload.1.i = load i16, ptr %199, align 2, !tbaa.struct !27
  %200 = trunc i64 %183 to i32
  %201 = or disjoint i32 %200, 1
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %201
  store i16 %.sroa.0202.0.copyload.1.i, ptr addrspace(3) %202, align 2, !tbaa.struct !27
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.thread.i
  %203 = trunc i64 %183 to i32
  %204 = or disjoint i32 %203, 2
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %204
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.1.i
  %206 = or disjoint i64 %186, 2
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %206
  %.sroa.0202.0.copyload.2.i = load i16, ptr %207, align 4, !tbaa.struct !27
  %208 = trunc i64 %183 to i32
  %209 = or disjoint i32 %208, 2
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %209
  store i16 %.sroa.0202.0.copyload.2.i, ptr addrspace(3) %210, align 2, !tbaa.struct !27
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.thread.i
  %211 = trunc i64 %183 to i32
  %212 = or disjoint i32 %211, 3
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %212
  store i16 0, ptr addrspace(3) %213, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.2.i
  %214 = or disjoint i64 %186, 3
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %214
  %.sroa.0202.0.copyload.3.i = load i16, ptr %215, align 2, !tbaa.struct !27
  %216 = trunc i64 %183 to i32
  %217 = or disjoint i32 %216, 3
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %217
  store i16 %.sroa.0202.0.copyload.3.i, ptr addrspace(3) %218, align 2, !tbaa.struct !27
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.thread.i
  %219 = trunc i64 %183 to i32
  %220 = or disjoint i32 %219, 4
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %220
  store i16 0, ptr addrspace(3) %221, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.3.i
  %222 = or disjoint i64 %186, 4
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %222
  %.sroa.0202.0.copyload.4.i = load i16, ptr %223, align 8, !tbaa.struct !27
  %224 = trunc i64 %183 to i32
  %225 = or disjoint i32 %224, 4
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %225
  store i16 %.sroa.0202.0.copyload.4.i, ptr addrspace(3) %226, align 2, !tbaa.struct !27
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.thread.i
  %227 = trunc i64 %183 to i32
  %228 = or disjoint i32 %227, 5
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %228
  store i16 0, ptr addrspace(3) %229, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.4.i
  %230 = or disjoint i64 %186, 5
  %231 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %230
  %.sroa.0202.0.copyload.5.i = load i16, ptr %231, align 2, !tbaa.struct !27
  %232 = trunc i64 %183 to i32
  %233 = or disjoint i32 %232, 5
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %233
  store i16 %.sroa.0202.0.copyload.5.i, ptr addrspace(3) %234, align 2, !tbaa.struct !27
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.thread.i
  %235 = trunc i64 %183 to i32
  %236 = or disjoint i32 %235, 6
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %236
  store i16 0, ptr addrspace(3) %237, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.5.i
  %238 = or disjoint i64 %186, 6
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %238
  %.sroa.0202.0.copyload.6.i = load i16, ptr %239, align 4, !tbaa.struct !27
  %240 = trunc i64 %183 to i32
  %241 = or disjoint i32 %240, 6
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %241
  store i16 %.sroa.0202.0.copyload.6.i, ptr addrspace(3) %242, align 2, !tbaa.struct !27
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.thread.i
  %243 = trunc i64 %183 to i32
  %244 = or disjoint i32 %243, 7
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %244
  store i16 0, ptr addrspace(3) %245, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.6.i
  %246 = or disjoint i64 %186, 7
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %246
  %.sroa.0202.0.copyload.7.i = load i16, ptr %247, align 2, !tbaa.struct !27
  %248 = trunc i64 %183 to i32
  %249 = or disjoint i32 %248, 7
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %249
  store i16 %.sroa.0202.0.copyload.7.i, ptr addrspace(3) %250, align 2, !tbaa.struct !27
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.thread.i
  %251 = trunc i64 %183 to i32
  %252 = or disjoint i32 %251, 8
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %252
  store i16 0, ptr addrspace(3) %253, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.7.i
  %254 = or disjoint i64 %186, 8
  %255 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %254
  %.sroa.0202.0.copyload.8.i = load i16, ptr %255, align 16, !tbaa.struct !27
  %256 = trunc i64 %183 to i32
  %257 = or disjoint i32 %256, 8
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %257
  store i16 %.sroa.0202.0.copyload.8.i, ptr addrspace(3) %258, align 2, !tbaa.struct !27
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.thread.i
  %259 = trunc i64 %183 to i32
  %260 = or disjoint i32 %259, 9
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %260
  store i16 0, ptr addrspace(3) %261, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.8.i
  %262 = or disjoint i64 %186, 9
  %263 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %262
  %.sroa.0202.0.copyload.9.i = load i16, ptr %263, align 2, !tbaa.struct !27
  %264 = trunc i64 %183 to i32
  %265 = or disjoint i32 %264, 9
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %265
  store i16 %.sroa.0202.0.copyload.9.i, ptr addrspace(3) %266, align 2, !tbaa.struct !27
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.thread.i
  %267 = trunc i64 %183 to i32
  %268 = or disjoint i32 %267, 10
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %268
  store i16 0, ptr addrspace(3) %269, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.9.i
  %270 = or disjoint i64 %186, 10
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %270
  %.sroa.0202.0.copyload.10.i = load i16, ptr %271, align 4, !tbaa.struct !27
  %272 = trunc i64 %183 to i32
  %273 = or disjoint i32 %272, 10
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %273
  store i16 %.sroa.0202.0.copyload.10.i, ptr addrspace(3) %274, align 2, !tbaa.struct !27
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.thread.i
  %275 = trunc i64 %183 to i32
  %276 = or disjoint i32 %275, 11
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %276
  store i16 0, ptr addrspace(3) %277, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.10.i
  %278 = or disjoint i64 %186, 11
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %278
  %.sroa.0202.0.copyload.11.i = load i16, ptr %279, align 2, !tbaa.struct !27
  %280 = trunc i64 %183 to i32
  %281 = or disjoint i32 %280, 11
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %281
  store i16 %.sroa.0202.0.copyload.11.i, ptr addrspace(3) %282, align 2, !tbaa.struct !27
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.thread.i
  %283 = trunc i64 %183 to i32
  %284 = or disjoint i32 %283, 12
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %284
  store i16 0, ptr addrspace(3) %285, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.11.i
  %286 = or disjoint i64 %186, 12
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %286
  %.sroa.0202.0.copyload.12.i = load i16, ptr %287, align 8, !tbaa.struct !27
  %288 = trunc i64 %183 to i32
  %289 = or disjoint i32 %288, 12
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %289
  store i16 %.sroa.0202.0.copyload.12.i, ptr addrspace(3) %290, align 2, !tbaa.struct !27
  br i1 %178, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.thread.i
  %291 = trunc i64 %183 to i32
  %292 = or disjoint i32 %291, 13
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %292
  store i16 0, ptr addrspace(3) %293, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.12.i
  %294 = or disjoint i64 %186, 13
  %295 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %294
  %.sroa.0202.0.copyload.13.i = load i16, ptr %295, align 2, !tbaa.struct !27
  %296 = trunc i64 %183 to i32
  %297 = or disjoint i32 %296, 13
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %297
  store i16 %.sroa.0202.0.copyload.13.i, ptr addrspace(3) %298, align 2, !tbaa.struct !27
  br i1 %179, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.thread.i
  %299 = trunc i64 %183 to i32
  %300 = or disjoint i32 %299, 14
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %300
  store i16 0, ptr addrspace(3) %301, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.13.i
  %302 = or disjoint i64 %186, 14
  %303 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %302
  %.sroa.0202.0.copyload.14.i = load i16, ptr %303, align 4, !tbaa.struct !27
  %304 = trunc i64 %183 to i32
  %305 = or disjoint i32 %304, 14
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %305
  store i16 %.sroa.0202.0.copyload.14.i, ptr addrspace(3) %306, align 2, !tbaa.struct !27
  br i1 %180, label %307, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.15.i

307:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.i
  %308 = or disjoint i64 %186, 15
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %308
  %.sroa.0202.0.copyload.15.i = load i16, ptr %309, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.15.i: ; preds = %307, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.thread.i
  %.sroa.0204.2.15.i = phi i16 [ %.sroa.0202.0.copyload.15.i, %307 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.14.thread.i ]
  %310 = trunc i64 %183 to i32
  %311 = or disjoint i32 %310, 15
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %163, i32 %311
  store i16 %.sroa.0204.2.15.i, ptr addrspace(3) %312, align 2, !tbaa.struct !27
  br label %.split493.us.i

.lr.ph496.i:                                      ; preds = %.split493.us.i, %._crit_edge491.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %313 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %314 = icmp eq i64 %313, 0
  call void @llvm.assume(i1 %314)
  %315 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %316 = icmp eq i64 %315, 0
  call void @llvm.assume(i1 %316)
  %317 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %318 = icmp ult i64 %317, 128
  call void @llvm.assume(i1 %318)
  %319 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %320 = inttoptr i32 %319 to ptr addrspace(3)
  %321 = getelementptr inbounds i8, ptr addrspace(3) %320, i32 2560
  %322 = getelementptr inbounds i8, ptr addrspace(3) %320, i32 4608
  %323 = and i64 %317, 15
  %324 = trunc i64 %317 to i32
  %325 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %324
  %326 = load float, ptr addrspace(3) %325, align 4, !tbaa !23
  %327 = shl nuw nsw i64 %317, 3
  %328 = and i64 %327, 896
  br label %333

._crit_edge497.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %384, ptr addrspace(3) %325, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %329 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %330 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %331 = icmp ult i64 %330, 128
  call void @llvm.assume(i1 %331)
  %332 = icmp eq i64 %330, 0
  br i1 %332, label %386, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

333:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph496.i
  %334 = phi i64 [ 0, %.lr.ph496.i ], [ %385, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %335 = phi float [ %326, %.lr.ph496.i ], [ %384, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %336 = add nuw nsw i64 %334, %328
  %337 = trunc i64 %336 to i32
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %321, i32 %337
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %338, align 2, !tbaa.struct !27
  %339 = shl nuw nsw i64 %334, 4
  %340 = or disjoint i64 %339, %323
  %341 = trunc i64 %340 to i32
  %342 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %322, i32 %341
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %342, align 2, !tbaa.struct !27
  %343 = zext i16 %.sroa.0185.0.copyload.i to i32
  %344 = lshr i32 %343, 10
  %345 = and i32 %344, 31
  %346 = and i32 %343, 1023
  switch i32 %345, label %352 [
    i32 31, label %347
    i32 0, label %354
  ]

347:                                              ; preds = %333
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %348 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not475.i = icmp eq i32 %346, 0
  %349 = select i1 %.not475.i, i32 2139095040, i32 2143289344
  %350 = or disjoint i32 %349, %348
  %351 = bitcast i32 %350 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

352:                                              ; preds = %333
  %353 = or disjoint i32 %346, 1024
  br label %354

354:                                              ; preds = %352, %333
  %355 = phi i32 [ %353, %352 ], [ %346, %333 ]
  %356 = uitofp i32 %355 to float
  %.not.i = icmp eq i32 %345, 0
  %357 = add nsw i32 %345, -25
  %358 = select i1 %.not.i, i32 -24, i32 %357
  %359 = call float @__ocml_ldexp_f32(float noundef %356, i32 noundef %358) #6
  %360 = fneg contract float %359
  %.not469470.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %361 = select contract i1 %.not469470.i, float %360, float %359
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %354, %347
  %362 = phi float [ %351, %347 ], [ %361, %354 ]
  %363 = zext i16 %.sroa.0176.0.copyload.i to i32
  %364 = lshr i32 %363, 10
  %365 = and i32 %364, 31
  %366 = and i32 %363, 1023
  switch i32 %365, label %372 [
    i32 31, label %367
    i32 0, label %374
  ]

367:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %368 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not474.i = icmp eq i32 %366, 0
  %369 = select i1 %.not474.i, i32 2139095040, i32 2143289344
  %370 = or disjoint i32 %369, %368
  %371 = bitcast i32 %370 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

372:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %373 = or disjoint i32 %366, 1024
  br label %374

374:                                              ; preds = %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %375 = phi i32 [ %373, %372 ], [ %366, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %376 = uitofp i32 %375 to float
  %.not471.i = icmp eq i32 %365, 0
  %377 = add nsw i32 %365, -25
  %378 = select i1 %.not471.i, i32 -24, i32 %377
  %379 = call float @__ocml_ldexp_f32(float noundef %376, i32 noundef %378) #6
  %380 = fneg contract float %379
  %.not472473.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %381 = select contract i1 %.not472473.i, float %380, float %379
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %374, %367
  %382 = phi float [ %371, %367 ], [ %381, %374 ]
  %383 = fmul contract float %362, %382
  %384 = fadd contract float %335, %383
  %385 = add nuw nsw i64 %334, 1
  %exitcond507.not.i = icmp eq i64 %385, 128
  br i1 %exitcond507.not.i, label %._crit_edge497.i, label %333, !llvm.loop !36

386:                                              ; preds = %._crit_edge497.i
  %387 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %388 = icmp eq i64 %387, 0
  call void @llvm.assume(i1 %388)
  %389 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %390 = icmp eq i64 %389, 0
  call void @llvm.assume(i1 %390)
  %391 = sext i32 %3 to i64
  %392 = call i32 @llvm.amdgcn.groupstaticsize()
  %393 = inttoptr i32 %392 to ptr addrspace(3)
  %394 = icmp sgt i32 %4, 0
  %395 = icmp ugt i32 %4, 1
  %396 = icmp ugt i32 %4, 2
  %397 = icmp ugt i32 %4, 3
  %398 = icmp ugt i32 %4, 4
  %399 = icmp ugt i32 %4, 5
  %400 = icmp ugt i32 %4, 6
  %401 = icmp ugt i32 %4, 7
  %402 = icmp ugt i32 %4, 8
  %403 = icmp ugt i32 %4, 9
  %404 = icmp ugt i32 %4, 10
  %405 = icmp ugt i32 %4, 11
  %406 = icmp ugt i32 %4, 12
  %407 = icmp ugt i32 %4, 13
  %408 = icmp ugt i32 %4, 14
  %409 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split499.us.i, %386
  %410 = phi i64 [ 0, %386 ], [ %416, %.split499.us.i ]
  %411 = icmp slt i64 %410, %391
  %412 = shl i64 %410, 4
  %.tr468.i = trunc i64 %410 to i32
  %413 = shl i32 %.tr468.i, 4
  %414 = sext i32 %413 to i64
  %415 = add nsw i64 %329, %414
  %.fr500.i = freeze i1 %411
  %brmerge.not.i = select i1 %.fr500.i, i1 %394, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split499.us.i

.split499.us.i:                                   ; preds = %505, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %416 = add nuw nsw i64 %410, 1
  %exitcond509.not.i = icmp eq i64 %416, 8
  br i1 %exitcond509.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %417 = trunc i64 %412 to i32
  %418 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !23
  %420 = getelementptr inbounds float, ptr %9, i64 %415
  store float %419, ptr %420, align 32, !tbaa !23
  br i1 %395, label %.preheader.split.2.i, label %.split499.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %421 = trunc i64 %412 to i32
  %422 = or disjoint i32 %421, 1
  %423 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %422
  %424 = load float, ptr addrspace(3) %423, align 4, !tbaa !23
  %425 = or disjoint i64 %415, 1
  %426 = getelementptr inbounds float, ptr %9, i64 %425
  store float %424, ptr %426, align 4, !tbaa !23
  br i1 %396, label %.preheader.split.3.i, label %.split499.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %427 = trunc i64 %412 to i32
  %428 = or disjoint i32 %427, 2
  %429 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %428
  %430 = load float, ptr addrspace(3) %429, align 4, !tbaa !23
  %431 = or disjoint i64 %415, 2
  %432 = getelementptr inbounds float, ptr %9, i64 %431
  store float %430, ptr %432, align 8, !tbaa !23
  br i1 %397, label %.preheader.split.4.i, label %.split499.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %433 = trunc i64 %412 to i32
  %434 = or disjoint i32 %433, 3
  %435 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %434
  %436 = load float, ptr addrspace(3) %435, align 4, !tbaa !23
  %437 = or disjoint i64 %415, 3
  %438 = getelementptr inbounds float, ptr %9, i64 %437
  store float %436, ptr %438, align 4, !tbaa !23
  br i1 %398, label %.preheader.split.5.i, label %.split499.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %439 = trunc i64 %412 to i32
  %440 = or disjoint i32 %439, 4
  %441 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %440
  %442 = load float, ptr addrspace(3) %441, align 4, !tbaa !23
  %443 = or disjoint i64 %415, 4
  %444 = getelementptr inbounds float, ptr %9, i64 %443
  store float %442, ptr %444, align 16, !tbaa !23
  br i1 %399, label %.preheader.split.6.i, label %.split499.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %445 = trunc i64 %412 to i32
  %446 = or disjoint i32 %445, 5
  %447 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %446
  %448 = load float, ptr addrspace(3) %447, align 4, !tbaa !23
  %449 = or disjoint i64 %415, 5
  %450 = getelementptr inbounds float, ptr %9, i64 %449
  store float %448, ptr %450, align 4, !tbaa !23
  br i1 %400, label %.preheader.split.7.i, label %.split499.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %451 = trunc i64 %412 to i32
  %452 = or disjoint i32 %451, 6
  %453 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %452
  %454 = load float, ptr addrspace(3) %453, align 4, !tbaa !23
  %455 = or disjoint i64 %415, 6
  %456 = getelementptr inbounds float, ptr %9, i64 %455
  store float %454, ptr %456, align 8, !tbaa !23
  br i1 %401, label %.preheader.split.8.i, label %.split499.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %457 = trunc i64 %412 to i32
  %458 = or disjoint i32 %457, 7
  %459 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %458
  %460 = load float, ptr addrspace(3) %459, align 4, !tbaa !23
  %461 = or disjoint i64 %415, 7
  %462 = getelementptr inbounds float, ptr %9, i64 %461
  store float %460, ptr %462, align 4, !tbaa !23
  br i1 %402, label %.preheader.split.9.i, label %.split499.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %463 = trunc i64 %412 to i32
  %464 = or disjoint i32 %463, 8
  %465 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %464
  %466 = load float, ptr addrspace(3) %465, align 4, !tbaa !23
  %467 = or disjoint i64 %415, 8
  %468 = getelementptr inbounds float, ptr %9, i64 %467
  store float %466, ptr %468, align 32, !tbaa !23
  br i1 %403, label %.preheader.split.10.i, label %.split499.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %469 = trunc i64 %412 to i32
  %470 = or disjoint i32 %469, 9
  %471 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %470
  %472 = load float, ptr addrspace(3) %471, align 4, !tbaa !23
  %473 = or disjoint i64 %415, 9
  %474 = getelementptr inbounds float, ptr %9, i64 %473
  store float %472, ptr %474, align 4, !tbaa !23
  br i1 %404, label %.preheader.split.11.i, label %.split499.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %475 = trunc i64 %412 to i32
  %476 = or disjoint i32 %475, 10
  %477 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !23
  %479 = or disjoint i64 %415, 10
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 8, !tbaa !23
  br i1 %405, label %.preheader.split.12.i, label %.split499.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %481 = trunc i64 %412 to i32
  %482 = or disjoint i32 %481, 11
  %483 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !23
  %485 = or disjoint i64 %415, 11
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 4, !tbaa !23
  br i1 %406, label %.preheader.split.13.i, label %.split499.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %487 = trunc i64 %412 to i32
  %488 = or disjoint i32 %487, 12
  %489 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !23
  %491 = or disjoint i64 %415, 12
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 16, !tbaa !23
  br i1 %407, label %.preheader.split.14.i, label %.split499.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %493 = trunc i64 %412 to i32
  %494 = or disjoint i32 %493, 13
  %495 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !23
  %497 = or disjoint i64 %415, 13
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 4, !tbaa !23
  br i1 %408, label %.preheader.split.15.i, label %.split499.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %499 = trunc i64 %412 to i32
  %500 = or disjoint i32 %499, 14
  %501 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %500
  %502 = load float, ptr addrspace(3) %501, align 4, !tbaa !23
  %503 = or disjoint i64 %415, 14
  %504 = getelementptr inbounds float, ptr %9, i64 %503
  store float %502, ptr %504, align 8, !tbaa !23
  br i1 %409, label %505, label %.split499.us.i

505:                                              ; preds = %.preheader.split.15.i
  %506 = trunc i64 %412 to i32
  %507 = or disjoint i32 %506, 15
  %508 = getelementptr inbounds float, ptr addrspace(3) %393, i32 %507
  %509 = load float, ptr addrspace(3) %508, align 4, !tbaa !23
  %510 = or disjoint i64 %415, 15
  %511 = getelementptr inbounds float, ptr %9, i64 %510
  store float %509, ptr %511, align 4, !tbaa !23
  br label %.split499.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge497.i, %.split499.us.i
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
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !{i64 0, i64 2, !28}
!28 = !{!29, !29, i64 0}
!29 = !{!"short", !25, i64 0}
!30 = distinct !{!30, !31, !32, !33}
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!"llvm.loop.vectorize.width", i32 1}
!33 = !{!"llvm.loop.interleave.count", i32 1}
!34 = distinct !{!34, !31, !32, !33}
!35 = distinct !{!35, !31, !32, !33}
!36 = distinct !{!36, !31}
!37 = distinct !{!37, !31}
;----------------- End AdaptiveCpp IR dump ---------------
