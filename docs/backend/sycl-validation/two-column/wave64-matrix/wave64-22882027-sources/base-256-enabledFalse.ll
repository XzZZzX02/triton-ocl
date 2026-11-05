;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882027/tmp/triton-sycl-cache/compile-7w1k_j63/kernel.cpp"
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
  %41 = shl nuw nsw i64 %39, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %43 = icmp ult i64 %42, 256
  call void @llvm.assume(i1 %43)
  %44 = icmp eq i64 %42, 0
  br i1 %44, label %45, label %._crit_edge566.i

45:                                               ; preds = %._crit_edge.i
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
  %54 = icmp sgt i32 %3, 0
  %55 = icmp ugt i32 %3, 1
  %56 = icmp ugt i32 %3, 2
  %57 = icmp ugt i32 %3, 3
  %58 = icmp ugt i32 %3, 4
  %59 = icmp ugt i32 %3, 5
  %60 = icmp ugt i32 %3, 6
  %61 = icmp ugt i32 %3, 7
  br label %.preheader558.i

.preheader558.i:                                  ; preds = %.split.us.i, %45
  %62 = phi i64 [ 0, %45 ], [ %72, %.split.us.i ]
  %63 = icmp slt i64 %62, %50
  %64 = shl i64 %62, 3
  %.tr552.i = trunc i64 %62 to i32
  %65 = shl i32 %.tr552.i, 3
  %66 = sext i32 %65 to i64
  %67 = add nsw i64 %41, %66
  %.fr.i = freeze i1 %63
  br i1 %.fr.i, label %.preheader558.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader558.i
  %.tr588.i = trunc i64 %62 to i32
  %68 = shl i32 %.tr588.i, 4
  %69 = add i32 %68, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %52, i32 %69
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader558.split.preheader.i:                  ; preds = %.preheader558.i
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader558.split.preheader.i
  %70 = trunc i64 %64 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %70
  store i16 0, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %72 = add nuw nsw i64 %62, 1
  %exitcond.not.i = icmp eq i64 %72, 32
  br i1 %exitcond.not.i, label %._crit_edge566.i, label %.preheader558.i, !llvm.loop !26

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader558.split.preheader.i
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %67
  %.sroa.0269.0.copyload.i = load i16, ptr %73, align 16, !tbaa.struct !23
  %74 = trunc i64 %64 to i32
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %74
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %75, align 2, !tbaa.struct !23
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i
  %76 = trunc i64 %64 to i32
  %77 = or disjoint i32 %76, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %77
  store i16 0, ptr addrspace(3) %78, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  %79 = or disjoint i64 %67, 1
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %79
  %.sroa.0269.0.copyload.1.i = load i16, ptr %80, align 2, !tbaa.struct !23
  %81 = trunc i64 %64 to i32
  %82 = or disjoint i32 %81, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %82
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %83, align 2, !tbaa.struct !23
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i
  %84 = trunc i64 %64 to i32
  %85 = or disjoint i32 %84, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %85
  store i16 0, ptr addrspace(3) %86, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i
  %87 = or disjoint i64 %67, 2
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %87
  %.sroa.0269.0.copyload.2.i = load i16, ptr %88, align 4, !tbaa.struct !23
  %89 = trunc i64 %64 to i32
  %90 = or disjoint i32 %89, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %90
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %91, align 2, !tbaa.struct !23
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i
  %92 = trunc i64 %64 to i32
  %93 = or disjoint i32 %92, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %93
  store i16 0, ptr addrspace(3) %94, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i
  %95 = or disjoint i64 %67, 3
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0269.0.copyload.3.i = load i16, ptr %96, align 2, !tbaa.struct !23
  %97 = trunc i64 %64 to i32
  %98 = or disjoint i32 %97, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %98
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %99, align 2, !tbaa.struct !23
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i
  %100 = trunc i64 %64 to i32
  %101 = or disjoint i32 %100, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %101
  store i16 0, ptr addrspace(3) %102, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i
  %103 = or disjoint i64 %67, 4
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0269.0.copyload.4.i = load i16, ptr %104, align 8, !tbaa.struct !23
  %105 = trunc i64 %64 to i32
  %106 = or disjoint i32 %105, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %106
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %107, align 2, !tbaa.struct !23
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i
  %108 = trunc i64 %64 to i32
  %109 = or disjoint i32 %108, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %109
  store i16 0, ptr addrspace(3) %110, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i
  %111 = or disjoint i64 %67, 5
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %111
  %.sroa.0269.0.copyload.5.i = load i16, ptr %112, align 2, !tbaa.struct !23
  %113 = trunc i64 %64 to i32
  %114 = or disjoint i32 %113, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %114
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %115, align 2, !tbaa.struct !23
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i
  %116 = trunc i64 %64 to i32
  %117 = or disjoint i32 %116, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %117
  store i16 0, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i
  %119 = or disjoint i64 %67, 6
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0269.0.copyload.6.i = load i16, ptr %120, align 4, !tbaa.struct !23
  %121 = trunc i64 %64 to i32
  %122 = or disjoint i32 %121, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %122
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %123, align 2, !tbaa.struct !23
  br i1 %61, label %124, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

124:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i
  %125 = or disjoint i64 %67, 7
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0269.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i: ; preds = %124, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %124 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i ]
  %127 = trunc i64 %64 to i32
  %128 = or disjoint i32 %127, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %128
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  br label %.split.us.i

._crit_edge566.i:                                 ; preds = %.split.us.i, %._crit_edge.i
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
  %135 = icmp ult i64 %134, 256
  call void @llvm.assume(i1 %135)
  %136 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %137 = inttoptr i32 %136 to ptr addrspace(3)
  %138 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 512
  %139 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 1024
  %140 = lshr i64 %134, 5
  %141 = shl nuw nsw i64 %134, 3
  %142 = and i64 %141, 248
  %143 = or disjoint i64 %142, %140
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %144
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %145, align 2, !tbaa.struct !23
  %146 = trunc i64 %134 to i32
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %139, i32 %146
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %147, align 2, !tbaa.struct !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %148 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %149 = icmp ult i64 %148, 256
  call void @llvm.assume(i1 %149)
  %150 = icmp eq i64 %148, 0
  br i1 %150, label %151, label %.lr.ph571.i

151:                                              ; preds = %._crit_edge566.i
  %.tr541.i = trunc i64 %39 to i32
  %152 = shl nuw i32 %.tr541.i, 9
  %153 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %154 = icmp eq i64 %153, 0
  call void @llvm.assume(i1 %154)
  %155 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %156 = icmp eq i64 %155, 0
  call void @llvm.assume(i1 %156)
  %157 = sext i32 %4 to i64
  %158 = sext i32 %5 to i64
  %159 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %160 = inttoptr i32 %159 to ptr addrspace(3)
  %161 = getelementptr inbounds i8, ptr addrspace(3) %160, i32 1536
  %162 = sext i32 %152 to i64
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split568.us.i, %151
  %163 = phi i64 [ 0, %151 ], [ %171, %.split568.us.i ]
  %164 = icmp slt i64 %163, %157
  %165 = shl i64 %163, 5
  %.tr551.i = trunc i64 %163 to i32
  %166 = shl i32 %.tr551.i, 5
  %167 = sext i32 %166 to i64
  %168 = add nsw i64 %167, %162
  %.fr569.i = freeze i1 %164
  br i1 %.fr569.i, label %.preheader557.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr.i = trunc i64 %163 to i32
  %169 = shl i32 %.tr.i, 6
  %170 = add i32 %169, 1536
  %scevgep582.i = getelementptr i8, ptr addrspace(3) %160, i32 %170
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep582.i, i8 0, i32 64, i1 false)
  br label %.split568.us.i

.split568.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %171 = add nuw nsw i64 %163, 1
  %exitcond584.not.i = icmp eq i64 %171, 16
  br i1 %exitcond584.not.i, label %.lr.ph571.i, label %.preheader557.i, !llvm.loop !30

.preheader557.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader557.i
  %172 = phi i64 [ %180, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader557.i ]
  %173 = icmp slt i64 %172, %158
  br i1 %173, label %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

174:                                              ; preds = %.preheader557.split.i
  %175 = add nuw nsw i64 %168, %172
  %176 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %175
  %.sroa.0232.0.copyload.i = load i16, ptr %176, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %174, %.preheader557.split.i
  %.sroa.0234.2.i = phi i16 [ %.sroa.0232.0.copyload.i, %174 ], [ 0, %.preheader557.split.i ]
  %177 = add nuw nsw i64 %172, %165
  %178 = trunc i64 %177 to i32
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %161, i32 %178
  store i16 %.sroa.0234.2.i, ptr addrspace(3) %179, align 2, !tbaa.struct !23
  %180 = add nuw nsw i64 %172, 1
  %exitcond583.not.i = icmp eq i64 %180, 32
  br i1 %exitcond583.not.i, label %.split568.us.i, label %.preheader557.split.i, !llvm.loop !31

.lr.ph571.i:                                      ; preds = %.split568.us.i, %._crit_edge566.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %181 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %182 = icmp eq i64 %181, 0
  call void @llvm.assume(i1 %182)
  %183 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %184 = icmp eq i64 %183, 0
  call void @llvm.assume(i1 %184)
  %185 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %186 = icmp ult i64 %185, 256
  call void @llvm.assume(i1 %186)
  %187 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %188 = inttoptr i32 %187 to ptr addrspace(3)
  %189 = getelementptr inbounds i8, ptr addrspace(3) %188, i32 1536
  %190 = getelementptr inbounds i8, ptr addrspace(3) %188, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

._crit_edge572.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %191 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %192 = icmp eq i64 %191, 0
  call void @llvm.assume(i1 %192)
  %193 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %194 = icmp eq i64 %193, 0
  call void @llvm.assume(i1 %194)
  %195 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %196 = icmp ult i64 %195, 256
  call void @llvm.assume(i1 %196)
  %197 = icmp ult i64 %195, 128
  br i1 %197, label %.lr.ph574.i, label %._crit_edge575.i

.lr.ph574.i:                                      ; preds = %._crit_edge572.i
  %198 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %199 = inttoptr i32 %198 to ptr addrspace(3)
  %200 = getelementptr inbounds i8, ptr addrspace(3) %199, i32 1024
  %201 = getelementptr inbounds i8, ptr addrspace(3) %199, i32 2560
  %202 = and i64 %195, 15
  %203 = trunc i64 %195 to i32
  %204 = getelementptr inbounds float, ptr addrspace(3) %199, i32 %203
  %205 = load float, ptr addrspace(3) %204, align 4, !tbaa !19
  %206 = shl nuw nsw i64 %195, 1
  %207 = and i64 %206, 224
  br label %223

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph571.i
  %208 = phi i64 [ %185, %.lr.ph571.i ], [ %217, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %209 = lshr i64 %208, 4
  %210 = shl nuw nsw i64 %208, 5
  %211 = and i64 %210, 480
  %212 = or disjoint i64 %211, %209
  %213 = trunc i64 %212 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %189, i32 %213
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %214, align 2, !tbaa.struct !23
  %215 = trunc i64 %208 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %215
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %216, align 2, !tbaa.struct !23
  %217 = add nuw nsw i64 %208, 256
  %218 = icmp ult i64 %208, 256
  br i1 %218, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %._crit_edge572.i, !llvm.loop !32

._crit_edge575.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %._crit_edge572.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %219 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %220 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %221 = icmp ult i64 %220, 256
  call void @llvm.assume(i1 %221)
  %222 = icmp eq i64 %220, 0
  br i1 %222, label %276, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %274, ptr addrspace(3) %204, align 4, !tbaa !19
  br label %._crit_edge575.i

223:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph574.i
  %224 = phi i64 [ 0, %.lr.ph574.i ], [ %275, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %225 = phi float [ %205, %.lr.ph574.i ], [ %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %226 = add nuw nsw i64 %224, %207
  %227 = trunc i64 %226 to i32
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %200, i32 %227
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %228, align 2, !tbaa.struct !23
  %229 = shl nuw nsw i64 %224, 4
  %230 = or disjoint i64 %229, %202
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %201, i32 %231
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !23
  %233 = zext i16 %.sroa.0189.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %223
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %238 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %236, 0
  %239 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

242:                                              ; preds = %223
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %223
  %245 = phi i32 [ %243, %242 ], [ %236, %223 ]
  %246 = uitofp i32 %245 to float
  %.not.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #6
  %250 = fneg contract float %249
  %.not544545.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %251 = select contract i1 %.not544545.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = zext i16 %.sroa.0180.0.copyload.i to i32
  %254 = lshr i32 %253, 10
  %255 = and i32 %254, 31
  %256 = and i32 %253, 1023
  switch i32 %255, label %262 [
    i32 31, label %257
    i32 0, label %264
  ]

257:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %258 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %256, 0
  %259 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %260 = or disjoint i32 %259, %258
  %261 = bitcast i32 %260 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %263 = or disjoint i32 %256, 1024
  br label %264

264:                                              ; preds = %262, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %265 = phi i32 [ %263, %262 ], [ %256, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %266 = uitofp i32 %265 to float
  %.not546.i = icmp eq i32 %255, 0
  %267 = add nsw i32 %255, -25
  %268 = select i1 %.not546.i, i32 -24, i32 %267
  %269 = call float @__ocml_ldexp_f32(float noundef %266, i32 noundef %268) #6
  %270 = fneg contract float %269
  %.not547548.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %271 = select contract i1 %.not547548.i, float %270, float %269
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %264, %257
  %272 = phi float [ %261, %257 ], [ %271, %264 ]
  %273 = fmul contract float %252, %272
  %274 = fadd contract float %225, %273
  %275 = add nuw nsw i64 %224, 1
  %exitcond585.not.i = icmp eq i64 %275, 32
  br i1 %exitcond585.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %223, !llvm.loop !33

276:                                              ; preds = %._crit_edge575.i
  %277 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %278 = icmp eq i64 %277, 0
  call void @llvm.assume(i1 %278)
  %279 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %280 = icmp eq i64 %279, 0
  call void @llvm.assume(i1 %280)
  %281 = sext i32 %3 to i64
  %282 = call i32 @llvm.amdgcn.groupstaticsize()
  %283 = inttoptr i32 %282 to ptr addrspace(3)
  %284 = icmp sgt i32 %4, 0
  %285 = icmp ugt i32 %4, 1
  %286 = icmp ugt i32 %4, 2
  %287 = icmp ugt i32 %4, 3
  %288 = icmp ugt i32 %4, 4
  %289 = icmp ugt i32 %4, 5
  %290 = icmp ugt i32 %4, 6
  %291 = icmp ugt i32 %4, 7
  %292 = icmp ugt i32 %4, 8
  %293 = icmp ugt i32 %4, 9
  %294 = icmp ugt i32 %4, 10
  %295 = icmp ugt i32 %4, 11
  %296 = icmp ugt i32 %4, 12
  %297 = icmp ugt i32 %4, 13
  %298 = icmp ugt i32 %4, 14
  %299 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split577.us.i, %276
  %300 = phi i64 [ 0, %276 ], [ %306, %.split577.us.i ]
  %301 = icmp slt i64 %300, %281
  %302 = shl i64 %300, 4
  %.tr543.i = trunc i64 %300 to i32
  %303 = shl i32 %.tr543.i, 4
  %304 = sext i32 %303 to i64
  %305 = add nsw i64 %219, %304
  %.fr578.i = freeze i1 %301
  %brmerge.not.i = select i1 %.fr578.i, i1 %284, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split577.us.i

.split577.us.i:                                   ; preds = %395, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %306 = add nuw nsw i64 %300, 1
  %exitcond587.not.i = icmp eq i64 %306, 8
  br i1 %exitcond587.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %307 = trunc i64 %302 to i32
  %308 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %307
  %309 = load float, ptr addrspace(3) %308, align 4, !tbaa !19
  %310 = getelementptr inbounds float, ptr %9, i64 %305
  store float %309, ptr %310, align 32, !tbaa !19
  br i1 %285, label %.preheader.split.2.i, label %.split577.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %311 = trunc i64 %302 to i32
  %312 = or disjoint i32 %311, 1
  %313 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %312
  %314 = load float, ptr addrspace(3) %313, align 4, !tbaa !19
  %315 = or disjoint i64 %305, 1
  %316 = getelementptr inbounds float, ptr %9, i64 %315
  store float %314, ptr %316, align 4, !tbaa !19
  br i1 %286, label %.preheader.split.3.i, label %.split577.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %317 = trunc i64 %302 to i32
  %318 = or disjoint i32 %317, 2
  %319 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %318
  %320 = load float, ptr addrspace(3) %319, align 4, !tbaa !19
  %321 = or disjoint i64 %305, 2
  %322 = getelementptr inbounds float, ptr %9, i64 %321
  store float %320, ptr %322, align 8, !tbaa !19
  br i1 %287, label %.preheader.split.4.i, label %.split577.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %323 = trunc i64 %302 to i32
  %324 = or disjoint i32 %323, 3
  %325 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %324
  %326 = load float, ptr addrspace(3) %325, align 4, !tbaa !19
  %327 = or disjoint i64 %305, 3
  %328 = getelementptr inbounds float, ptr %9, i64 %327
  store float %326, ptr %328, align 4, !tbaa !19
  br i1 %288, label %.preheader.split.5.i, label %.split577.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %329 = trunc i64 %302 to i32
  %330 = or disjoint i32 %329, 4
  %331 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %330
  %332 = load float, ptr addrspace(3) %331, align 4, !tbaa !19
  %333 = or disjoint i64 %305, 4
  %334 = getelementptr inbounds float, ptr %9, i64 %333
  store float %332, ptr %334, align 16, !tbaa !19
  br i1 %289, label %.preheader.split.6.i, label %.split577.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %335 = trunc i64 %302 to i32
  %336 = or disjoint i32 %335, 5
  %337 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %336
  %338 = load float, ptr addrspace(3) %337, align 4, !tbaa !19
  %339 = or disjoint i64 %305, 5
  %340 = getelementptr inbounds float, ptr %9, i64 %339
  store float %338, ptr %340, align 4, !tbaa !19
  br i1 %290, label %.preheader.split.7.i, label %.split577.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %341 = trunc i64 %302 to i32
  %342 = or disjoint i32 %341, 6
  %343 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %342
  %344 = load float, ptr addrspace(3) %343, align 4, !tbaa !19
  %345 = or disjoint i64 %305, 6
  %346 = getelementptr inbounds float, ptr %9, i64 %345
  store float %344, ptr %346, align 8, !tbaa !19
  br i1 %291, label %.preheader.split.8.i, label %.split577.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %347 = trunc i64 %302 to i32
  %348 = or disjoint i32 %347, 7
  %349 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %348
  %350 = load float, ptr addrspace(3) %349, align 4, !tbaa !19
  %351 = or disjoint i64 %305, 7
  %352 = getelementptr inbounds float, ptr %9, i64 %351
  store float %350, ptr %352, align 4, !tbaa !19
  br i1 %292, label %.preheader.split.9.i, label %.split577.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %353 = trunc i64 %302 to i32
  %354 = or disjoint i32 %353, 8
  %355 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %354
  %356 = load float, ptr addrspace(3) %355, align 4, !tbaa !19
  %357 = or disjoint i64 %305, 8
  %358 = getelementptr inbounds float, ptr %9, i64 %357
  store float %356, ptr %358, align 32, !tbaa !19
  br i1 %293, label %.preheader.split.10.i, label %.split577.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %359 = trunc i64 %302 to i32
  %360 = or disjoint i32 %359, 9
  %361 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %360
  %362 = load float, ptr addrspace(3) %361, align 4, !tbaa !19
  %363 = or disjoint i64 %305, 9
  %364 = getelementptr inbounds float, ptr %9, i64 %363
  store float %362, ptr %364, align 4, !tbaa !19
  br i1 %294, label %.preheader.split.11.i, label %.split577.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %365 = trunc i64 %302 to i32
  %366 = or disjoint i32 %365, 10
  %367 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %366
  %368 = load float, ptr addrspace(3) %367, align 4, !tbaa !19
  %369 = or disjoint i64 %305, 10
  %370 = getelementptr inbounds float, ptr %9, i64 %369
  store float %368, ptr %370, align 8, !tbaa !19
  br i1 %295, label %.preheader.split.12.i, label %.split577.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %371 = trunc i64 %302 to i32
  %372 = or disjoint i32 %371, 11
  %373 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %372
  %374 = load float, ptr addrspace(3) %373, align 4, !tbaa !19
  %375 = or disjoint i64 %305, 11
  %376 = getelementptr inbounds float, ptr %9, i64 %375
  store float %374, ptr %376, align 4, !tbaa !19
  br i1 %296, label %.preheader.split.13.i, label %.split577.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %377 = trunc i64 %302 to i32
  %378 = or disjoint i32 %377, 12
  %379 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !19
  %381 = or disjoint i64 %305, 12
  %382 = getelementptr inbounds float, ptr %9, i64 %381
  store float %380, ptr %382, align 16, !tbaa !19
  br i1 %297, label %.preheader.split.14.i, label %.split577.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %383 = trunc i64 %302 to i32
  %384 = or disjoint i32 %383, 13
  %385 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !19
  %387 = or disjoint i64 %305, 13
  %388 = getelementptr inbounds float, ptr %9, i64 %387
  store float %386, ptr %388, align 4, !tbaa !19
  br i1 %298, label %.preheader.split.15.i, label %.split577.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %389 = trunc i64 %302 to i32
  %390 = or disjoint i32 %389, 14
  %391 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !19
  %393 = or disjoint i64 %305, 14
  %394 = getelementptr inbounds float, ptr %9, i64 %393
  store float %392, ptr %394, align 8, !tbaa !19
  br i1 %299, label %395, label %.split577.us.i

395:                                              ; preds = %.preheader.split.15.i
  %396 = trunc i64 %302 to i32
  %397 = or disjoint i32 %396, 15
  %398 = getelementptr inbounds float, ptr addrspace(3) %283, i32 %397
  %399 = load float, ptr addrspace(3) %398, align 4, !tbaa !19
  %400 = or disjoint i64 %305, 15
  %401 = getelementptr inbounds float, ptr %9, i64 %400
  store float %399, ptr %401, align 4, !tbaa !19
  br label %.split577.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge575.i, %.split577.us.i
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
!32 = distinct !{!32, !27, !28, !29}
!33 = distinct !{!33, !27}
!34 = distinct !{!34, !27}
;----------------- End AdaptiveCpp IR dump ---------------
