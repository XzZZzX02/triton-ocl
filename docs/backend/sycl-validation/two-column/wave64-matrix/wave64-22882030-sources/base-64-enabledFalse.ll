;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-sf6acpv9/kernel.cpp"
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
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 33554432
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
  br i1 %40, label %46, label %.lr.ph490.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

46:                                               ; preds = %._crit_edge.i
  %47 = shl i32 %.tr.i, 10
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
  br label %.preheader483.i

.preheader483.i:                                  ; preds = %.split.us.i, %46
  %65 = phi i64 [ 0, %46 ], [ %75, %.split.us.i ]
  %66 = icmp slt i64 %65, %52
  %67 = shl i64 %65, 3
  %.tr477.i = trunc i64 %65 to i32
  %68 = shl i32 %.tr477.i, 3
  %69 = sext i32 %68 to i64
  %70 = add nsw i64 %69, %56
  %.fr.i = freeze i1 %66
  br i1 %.fr.i, label %.preheader483.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.i: ; preds = %.preheader483.i
  %.tr511.i = trunc i64 %65 to i32
  %71 = shl i32 %.tr511.i, 4
  %72 = add i32 %71, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %54, i32 %72
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader483.split.preheader.i:                  ; preds = %.preheader483.i
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.thread.i: ; preds = %.preheader483.split.preheader.i
  %73 = trunc i64 %67 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %73
  store i16 0, ptr addrspace(3) %74, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.i
  %75 = add nuw nsw i64 %65, 1
  %exitcond.not.i = icmp eq i64 %75, 128
  br i1 %exitcond.not.i, label %.lr.ph490.i, label %.preheader483.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i: ; preds = %.preheader483.split.preheader.i
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0239.0.copyload.i = load i16, ptr %76, align 16, !tbaa.struct !25
  %77 = trunc i64 %67 to i32
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %77
  store i16 %.sroa.0239.0.copyload.i, ptr addrspace(3) %78, align 2, !tbaa.struct !25
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.thread.i
  %79 = trunc i64 %67 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %80
  store i16 0, ptr addrspace(3) %81, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i
  %82 = or disjoint i64 %70, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0239.0.copyload.1.i = load i16, ptr %83, align 2, !tbaa.struct !25
  %84 = trunc i64 %67 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %85
  store i16 %.sroa.0239.0.copyload.1.i, ptr addrspace(3) %86, align 2, !tbaa.struct !25
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.thread.i
  %87 = trunc i64 %67 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i
  %90 = or disjoint i64 %70, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0239.0.copyload.2.i = load i16, ptr %91, align 4, !tbaa.struct !25
  %92 = trunc i64 %67 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %93
  store i16 %.sroa.0239.0.copyload.2.i, ptr addrspace(3) %94, align 2, !tbaa.struct !25
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.thread.i
  %95 = trunc i64 %67 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i
  %98 = or disjoint i64 %70, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0239.0.copyload.3.i = load i16, ptr %99, align 2, !tbaa.struct !25
  %100 = trunc i64 %67 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %101
  store i16 %.sroa.0239.0.copyload.3.i, ptr addrspace(3) %102, align 2, !tbaa.struct !25
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.thread.i
  %103 = trunc i64 %67 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i
  %106 = or disjoint i64 %70, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0239.0.copyload.4.i = load i16, ptr %107, align 8, !tbaa.struct !25
  %108 = trunc i64 %67 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %109
  store i16 %.sroa.0239.0.copyload.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.thread.i
  %111 = trunc i64 %67 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i
  %114 = or disjoint i64 %70, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0239.0.copyload.5.i = load i16, ptr %115, align 2, !tbaa.struct !25
  %116 = trunc i64 %67 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %117
  store i16 %.sroa.0239.0.copyload.5.i, ptr addrspace(3) %118, align 2, !tbaa.struct !25
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.thread.i
  %119 = trunc i64 %67 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i
  %122 = or disjoint i64 %70, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0239.0.copyload.6.i = load i16, ptr %123, align 4, !tbaa.struct !25
  %124 = trunc i64 %67 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %125
  store i16 %.sroa.0239.0.copyload.6.i, ptr addrspace(3) %126, align 2, !tbaa.struct !25
  br i1 %64, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

127:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i
  %128 = or disjoint i64 %70, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0239.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i: ; preds = %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i
  %.sroa.0241.2.7.i = phi i16 [ %.sroa.0239.0.copyload.7.i, %127 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.thread.i ]
  %130 = trunc i64 %67 to i32
  %131 = or disjoint i32 %130, 7
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %131
  store i16 %.sroa.0241.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !25
  br label %.split.us.i

.lr.ph490.i:                                      ; preds = %.split.us.i, %._crit_edge.i
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
  %142 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge491.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  br i1 %145, label %157, label %.lr.ph496.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph490.i
  %146 = phi i64 [ %137, %.lr.ph490.i ], [ %155, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %147 = lshr i64 %146, 7
  %148 = shl nuw nsw i64 %146, 3
  %149 = and i64 %148, 1016
  %150 = or disjoint i64 %149, %147
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %151
  %.sroa.0294.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !25
  %153 = trunc i64 %146 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %153
  store i16 %.sroa.0294.0.copyload.i, ptr addrspace(3) %154, align 2, !tbaa.struct !25
  %155 = add nuw nsw i64 %146, 64
  %156 = icmp ult i64 %146, 960
  br i1 %156, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge491.i, !llvm.loop !31

157:                                              ; preds = %._crit_edge491.i
  %158 = shl i32 %.tr.i, 11
  %159 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %160 = icmp eq i64 %159, 0
  call void @llvm.assume(i1 %160)
  %161 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %162 = icmp eq i64 %161, 0
  call void @llvm.assume(i1 %162)
  %163 = sext i32 %5 to i64
  %164 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %165 = inttoptr i32 %164 to ptr addrspace(3)
  %166 = getelementptr inbounds i8, ptr addrspace(3) %165, i32 4608
  %167 = sext i32 %158 to i64
  %168 = icmp sgt i32 %4, 0
  %169 = icmp ugt i32 %4, 1
  %170 = icmp ugt i32 %4, 2
  %171 = icmp ugt i32 %4, 3
  %172 = icmp ugt i32 %4, 4
  %173 = icmp ugt i32 %4, 5
  %174 = icmp ugt i32 %4, 6
  %175 = icmp ugt i32 %4, 7
  %176 = icmp ugt i32 %4, 8
  %177 = icmp ugt i32 %4, 9
  %178 = icmp ugt i32 %4, 10
  %179 = icmp ugt i32 %4, 11
  %180 = icmp ugt i32 %4, 12
  %181 = icmp ugt i32 %4, 13
  %182 = icmp ugt i32 %4, 14
  %183 = icmp ugt i32 %4, 15
  br label %.preheader482.i

.preheader482.i:                                  ; preds = %.split493.us.i, %157
  %184 = phi i64 [ 0, %157 ], [ %194, %.split493.us.i ]
  %185 = icmp slt i64 %184, %163
  %186 = shl i64 %184, 4
  %.tr476.i = trunc i64 %184 to i32
  %187 = shl i32 %.tr476.i, 4
  %188 = sext i32 %187 to i64
  %189 = add nsw i64 %188, %167
  %.fr494.i = freeze i1 %185
  br i1 %.fr494.i, label %.preheader482.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader482.i
  %.tr510.i = trunc i64 %184 to i32
  %190 = shl i32 %.tr510.i, 5
  %191 = add i32 %190, 4608
  %scevgep504.i = getelementptr i8, ptr addrspace(3) %165, i32 %191
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep504.i, i8 0, i32 32, i1 false)
  br label %.split493.us.i

.preheader482.split.preheader.i:                  ; preds = %.preheader482.i
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader482.split.preheader.i
  %192 = trunc i64 %186 to i32
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %192
  store i16 0, ptr addrspace(3) %193, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split493.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %194 = add nuw nsw i64 %184, 1
  %exitcond506.not.i = icmp eq i64 %194, 128
  br i1 %exitcond506.not.i, label %.lr.ph496.i, label %.preheader482.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader482.split.preheader.i
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %189
  %.sroa.0202.0.copyload.i = load i16, ptr %195, align 32, !tbaa.struct !25
  %196 = trunc i64 %186 to i32
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %196
  store i16 %.sroa.0202.0.copyload.i, ptr addrspace(3) %197, align 2, !tbaa.struct !25
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %198 = trunc i64 %186 to i32
  %199 = or disjoint i32 %198, 1
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %199
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %201 = or disjoint i64 %189, 1
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %201
  %.sroa.0202.0.copyload.1.i = load i16, ptr %202, align 2, !tbaa.struct !25
  %203 = trunc i64 %186 to i32
  %204 = or disjoint i32 %203, 1
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %204
  store i16 %.sroa.0202.0.copyload.1.i, ptr addrspace(3) %205, align 2, !tbaa.struct !25
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %206 = trunc i64 %186 to i32
  %207 = or disjoint i32 %206, 2
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %207
  store i16 0, ptr addrspace(3) %208, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %209 = or disjoint i64 %189, 2
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %209
  %.sroa.0202.0.copyload.2.i = load i16, ptr %210, align 4, !tbaa.struct !25
  %211 = trunc i64 %186 to i32
  %212 = or disjoint i32 %211, 2
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %212
  store i16 %.sroa.0202.0.copyload.2.i, ptr addrspace(3) %213, align 2, !tbaa.struct !25
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %214 = trunc i64 %186 to i32
  %215 = or disjoint i32 %214, 3
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %215
  store i16 0, ptr addrspace(3) %216, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %217 = or disjoint i64 %189, 3
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %217
  %.sroa.0202.0.copyload.3.i = load i16, ptr %218, align 2, !tbaa.struct !25
  %219 = trunc i64 %186 to i32
  %220 = or disjoint i32 %219, 3
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %220
  store i16 %.sroa.0202.0.copyload.3.i, ptr addrspace(3) %221, align 2, !tbaa.struct !25
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %222 = trunc i64 %186 to i32
  %223 = or disjoint i32 %222, 4
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %223
  store i16 0, ptr addrspace(3) %224, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %225 = or disjoint i64 %189, 4
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %225
  %.sroa.0202.0.copyload.4.i = load i16, ptr %226, align 8, !tbaa.struct !25
  %227 = trunc i64 %186 to i32
  %228 = or disjoint i32 %227, 4
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %228
  store i16 %.sroa.0202.0.copyload.4.i, ptr addrspace(3) %229, align 2, !tbaa.struct !25
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %230 = trunc i64 %186 to i32
  %231 = or disjoint i32 %230, 5
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %231
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %233 = or disjoint i64 %189, 5
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %233
  %.sroa.0202.0.copyload.5.i = load i16, ptr %234, align 2, !tbaa.struct !25
  %235 = trunc i64 %186 to i32
  %236 = or disjoint i32 %235, 5
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %236
  store i16 %.sroa.0202.0.copyload.5.i, ptr addrspace(3) %237, align 2, !tbaa.struct !25
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %238 = trunc i64 %186 to i32
  %239 = or disjoint i32 %238, 6
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %239
  store i16 0, ptr addrspace(3) %240, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %241 = or disjoint i64 %189, 6
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %241
  %.sroa.0202.0.copyload.6.i = load i16, ptr %242, align 4, !tbaa.struct !25
  %243 = trunc i64 %186 to i32
  %244 = or disjoint i32 %243, 6
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %244
  store i16 %.sroa.0202.0.copyload.6.i, ptr addrspace(3) %245, align 2, !tbaa.struct !25
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %246 = trunc i64 %186 to i32
  %247 = or disjoint i32 %246, 7
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %247
  store i16 0, ptr addrspace(3) %248, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %249 = or disjoint i64 %189, 7
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %249
  %.sroa.0202.0.copyload.7.i = load i16, ptr %250, align 2, !tbaa.struct !25
  %251 = trunc i64 %186 to i32
  %252 = or disjoint i32 %251, 7
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %252
  store i16 %.sroa.0202.0.copyload.7.i, ptr addrspace(3) %253, align 2, !tbaa.struct !25
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %254 = trunc i64 %186 to i32
  %255 = or disjoint i32 %254, 8
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %255
  store i16 0, ptr addrspace(3) %256, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %257 = or disjoint i64 %189, 8
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %257
  %.sroa.0202.0.copyload.8.i = load i16, ptr %258, align 16, !tbaa.struct !25
  %259 = trunc i64 %186 to i32
  %260 = or disjoint i32 %259, 8
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %260
  store i16 %.sroa.0202.0.copyload.8.i, ptr addrspace(3) %261, align 2, !tbaa.struct !25
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %262 = trunc i64 %186 to i32
  %263 = or disjoint i32 %262, 9
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %263
  store i16 0, ptr addrspace(3) %264, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %265 = or disjoint i64 %189, 9
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %265
  %.sroa.0202.0.copyload.9.i = load i16, ptr %266, align 2, !tbaa.struct !25
  %267 = trunc i64 %186 to i32
  %268 = or disjoint i32 %267, 9
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %268
  store i16 %.sroa.0202.0.copyload.9.i, ptr addrspace(3) %269, align 2, !tbaa.struct !25
  br i1 %178, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %270 = trunc i64 %186 to i32
  %271 = or disjoint i32 %270, 10
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %271
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %273 = or disjoint i64 %189, 10
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %273
  %.sroa.0202.0.copyload.10.i = load i16, ptr %274, align 4, !tbaa.struct !25
  %275 = trunc i64 %186 to i32
  %276 = or disjoint i32 %275, 10
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %276
  store i16 %.sroa.0202.0.copyload.10.i, ptr addrspace(3) %277, align 2, !tbaa.struct !25
  br i1 %179, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %278 = trunc i64 %186 to i32
  %279 = or disjoint i32 %278, 11
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %279
  store i16 0, ptr addrspace(3) %280, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %281 = or disjoint i64 %189, 11
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %281
  %.sroa.0202.0.copyload.11.i = load i16, ptr %282, align 2, !tbaa.struct !25
  %283 = trunc i64 %186 to i32
  %284 = or disjoint i32 %283, 11
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %284
  store i16 %.sroa.0202.0.copyload.11.i, ptr addrspace(3) %285, align 2, !tbaa.struct !25
  br i1 %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %286 = trunc i64 %186 to i32
  %287 = or disjoint i32 %286, 12
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %287
  store i16 0, ptr addrspace(3) %288, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %289 = or disjoint i64 %189, 12
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %289
  %.sroa.0202.0.copyload.12.i = load i16, ptr %290, align 8, !tbaa.struct !25
  %291 = trunc i64 %186 to i32
  %292 = or disjoint i32 %291, 12
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %292
  store i16 %.sroa.0202.0.copyload.12.i, ptr addrspace(3) %293, align 2, !tbaa.struct !25
  br i1 %181, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %294 = trunc i64 %186 to i32
  %295 = or disjoint i32 %294, 13
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %295
  store i16 0, ptr addrspace(3) %296, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %297 = or disjoint i64 %189, 13
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %297
  %.sroa.0202.0.copyload.13.i = load i16, ptr %298, align 2, !tbaa.struct !25
  %299 = trunc i64 %186 to i32
  %300 = or disjoint i32 %299, 13
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %300
  store i16 %.sroa.0202.0.copyload.13.i, ptr addrspace(3) %301, align 2, !tbaa.struct !25
  br i1 %182, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %302 = trunc i64 %186 to i32
  %303 = or disjoint i32 %302, 14
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %303
  store i16 0, ptr addrspace(3) %304, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %305 = or disjoint i64 %189, 14
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %305
  %.sroa.0202.0.copyload.14.i = load i16, ptr %306, align 4, !tbaa.struct !25
  %307 = trunc i64 %186 to i32
  %308 = or disjoint i32 %307, 14
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %308
  store i16 %.sroa.0202.0.copyload.14.i, ptr addrspace(3) %309, align 2, !tbaa.struct !25
  br i1 %183, label %310, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

310:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %311 = or disjoint i64 %189, 15
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %311
  %.sroa.0202.0.copyload.15.i = load i16, ptr %312, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %310, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0204.2.15.i = phi i16 [ %.sroa.0202.0.copyload.15.i, %310 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %313 = trunc i64 %186 to i32
  %314 = or disjoint i32 %313, 15
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %314
  store i16 %.sroa.0204.2.15.i, ptr addrspace(3) %315, align 2, !tbaa.struct !25
  br label %.split493.us.i

.lr.ph496.i:                                      ; preds = %.split493.us.i, %._crit_edge491.i
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
  %321 = icmp ult i64 %320, 64
  call void @llvm.assume(i1 %321)
  %322 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %323 = inttoptr i32 %322 to ptr addrspace(3)
  %324 = getelementptr inbounds i8, ptr addrspace(3) %323, i32 2560
  %325 = getelementptr inbounds i8, ptr addrspace(3) %323, i32 4608
  %326 = and i64 %320, 15
  br label %330

._crit_edge497.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %327 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %328 = icmp ult i64 %327, 64
  call void @llvm.assume(i1 %328)
  %329 = icmp eq i64 %327, 0
  br i1 %329, label %392, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

330:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph496.i
  %331 = phi i64 [ %320, %.lr.ph496.i ], [ %337, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %332 = trunc i64 %331 to i32
  %333 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %332
  %334 = load float, ptr addrspace(3) %333, align 4, !tbaa !19
  %335 = shl nuw nsw i64 %331, 3
  %336 = and i64 %335, 896
  br label %339

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %390, ptr addrspace(3) %333, align 4, !tbaa !19
  %337 = add nuw nsw i64 %331, 64
  %338 = icmp ult i64 %331, 64
  br i1 %338, label %330, label %._crit_edge497.i, !llvm.loop !33

339:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %330
  %340 = phi i64 [ 0, %330 ], [ %391, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %341 = phi float [ %334, %330 ], [ %390, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %342 = add nuw nsw i64 %340, %336
  %343 = trunc i64 %342 to i32
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %324, i32 %343
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %344, align 2, !tbaa.struct !25
  %345 = shl nuw nsw i64 %340, 4
  %346 = or disjoint i64 %345, %326
  %347 = trunc i64 %346 to i32
  %348 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %325, i32 %347
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %348, align 2, !tbaa.struct !25
  %349 = zext i16 %.sroa.0185.0.copyload.i to i32
  %350 = lshr i32 %349, 10
  %351 = and i32 %350, 31
  %352 = and i32 %349, 1023
  switch i32 %351, label %358 [
    i32 31, label %353
    i32 0, label %360
  ]

353:                                              ; preds = %339
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %354 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not475.i = icmp eq i32 %352, 0
  %355 = select i1 %.not475.i, i32 2139095040, i32 2143289344
  %356 = or disjoint i32 %355, %354
  %357 = bitcast i32 %356 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

358:                                              ; preds = %339
  %359 = or disjoint i32 %352, 1024
  br label %360

360:                                              ; preds = %358, %339
  %361 = phi i32 [ %359, %358 ], [ %352, %339 ]
  %362 = uitofp i32 %361 to float
  %.not.i = icmp eq i32 %351, 0
  %363 = add nsw i32 %351, -25
  %364 = select i1 %.not.i, i32 -24, i32 %363
  %365 = call float @__ocml_ldexp_f32(float noundef %362, i32 noundef %364) #6
  %366 = fneg contract float %365
  %.not469470.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %367 = select contract i1 %.not469470.i, float %366, float %365
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %360, %353
  %368 = phi float [ %357, %353 ], [ %367, %360 ]
  %369 = zext i16 %.sroa.0176.0.copyload.i to i32
  %370 = lshr i32 %369, 10
  %371 = and i32 %370, 31
  %372 = and i32 %369, 1023
  switch i32 %371, label %378 [
    i32 31, label %373
    i32 0, label %380
  ]

373:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %374 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not474.i = icmp eq i32 %372, 0
  %375 = select i1 %.not474.i, i32 2139095040, i32 2143289344
  %376 = or disjoint i32 %375, %374
  %377 = bitcast i32 %376 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

378:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %379 = or disjoint i32 %372, 1024
  br label %380

380:                                              ; preds = %378, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %381 = phi i32 [ %379, %378 ], [ %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %382 = uitofp i32 %381 to float
  %.not471.i = icmp eq i32 %371, 0
  %383 = add nsw i32 %371, -25
  %384 = select i1 %.not471.i, i32 -24, i32 %383
  %385 = call float @__ocml_ldexp_f32(float noundef %382, i32 noundef %384) #6
  %386 = fneg contract float %385
  %.not472473.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %387 = select contract i1 %.not472473.i, float %386, float %385
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %380, %373
  %388 = phi float [ %377, %373 ], [ %387, %380 ]
  %389 = fmul contract float %368, %388
  %390 = fadd contract float %341, %389
  %391 = add nuw nsw i64 %340, 1
  %exitcond507.not.i = icmp eq i64 %391, 128
  br i1 %exitcond507.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %339, !llvm.loop !34

392:                                              ; preds = %._crit_edge497.i
  %393 = shl nuw i32 %.tr.i, 7
  %394 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %395 = icmp eq i64 %394, 0
  call void @llvm.assume(i1 %395)
  %396 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %397 = icmp eq i64 %396, 0
  call void @llvm.assume(i1 %397)
  %398 = sext i32 %3 to i64
  %399 = call i32 @llvm.amdgcn.groupstaticsize()
  %400 = inttoptr i32 %399 to ptr addrspace(3)
  %401 = sext i32 %393 to i64
  %402 = icmp sgt i32 %4, 0
  %403 = icmp ugt i32 %4, 1
  %404 = icmp ugt i32 %4, 2
  %405 = icmp ugt i32 %4, 3
  %406 = icmp ugt i32 %4, 4
  %407 = icmp ugt i32 %4, 5
  %408 = icmp ugt i32 %4, 6
  %409 = icmp ugt i32 %4, 7
  %410 = icmp ugt i32 %4, 8
  %411 = icmp ugt i32 %4, 9
  %412 = icmp ugt i32 %4, 10
  %413 = icmp ugt i32 %4, 11
  %414 = icmp ugt i32 %4, 12
  %415 = icmp ugt i32 %4, 13
  %416 = icmp ugt i32 %4, 14
  %417 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split499.us.i, %392
  %418 = phi i64 [ 0, %392 ], [ %424, %.split499.us.i ]
  %419 = icmp slt i64 %418, %398
  %420 = shl i64 %418, 4
  %.tr468.i = trunc i64 %418 to i32
  %421 = shl i32 %.tr468.i, 4
  %422 = sext i32 %421 to i64
  %423 = add nsw i64 %422, %401
  %.fr500.i = freeze i1 %419
  %brmerge.not.i = select i1 %.fr500.i, i1 %402, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split499.us.i

.split499.us.i:                                   ; preds = %513, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %424 = add nuw nsw i64 %418, 1
  %exitcond509.not.i = icmp eq i64 %424, 8
  br i1 %exitcond509.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %425 = trunc i64 %420 to i32
  %426 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !19
  %428 = getelementptr inbounds float, ptr %9, i64 %423
  store float %427, ptr %428, align 32, !tbaa !19
  br i1 %403, label %.preheader.split.2.i, label %.split499.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %429 = trunc i64 %420 to i32
  %430 = or disjoint i32 %429, 1
  %431 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !19
  %433 = or disjoint i64 %423, 1
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 4, !tbaa !19
  br i1 %404, label %.preheader.split.3.i, label %.split499.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %435 = trunc i64 %420 to i32
  %436 = or disjoint i32 %435, 2
  %437 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !19
  %439 = or disjoint i64 %423, 2
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 8, !tbaa !19
  br i1 %405, label %.preheader.split.4.i, label %.split499.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %441 = trunc i64 %420 to i32
  %442 = or disjoint i32 %441, 3
  %443 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !19
  %445 = or disjoint i64 %423, 3
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 4, !tbaa !19
  br i1 %406, label %.preheader.split.5.i, label %.split499.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %447 = trunc i64 %420 to i32
  %448 = or disjoint i32 %447, 4
  %449 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !19
  %451 = or disjoint i64 %423, 4
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 16, !tbaa !19
  br i1 %407, label %.preheader.split.6.i, label %.split499.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %453 = trunc i64 %420 to i32
  %454 = or disjoint i32 %453, 5
  %455 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !19
  %457 = or disjoint i64 %423, 5
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 4, !tbaa !19
  br i1 %408, label %.preheader.split.7.i, label %.split499.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %459 = trunc i64 %420 to i32
  %460 = or disjoint i32 %459, 6
  %461 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !19
  %463 = or disjoint i64 %423, 6
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 8, !tbaa !19
  br i1 %409, label %.preheader.split.8.i, label %.split499.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %465 = trunc i64 %420 to i32
  %466 = or disjoint i32 %465, 7
  %467 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !19
  %469 = or disjoint i64 %423, 7
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 4, !tbaa !19
  br i1 %410, label %.preheader.split.9.i, label %.split499.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %471 = trunc i64 %420 to i32
  %472 = or disjoint i32 %471, 8
  %473 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !19
  %475 = or disjoint i64 %423, 8
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 32, !tbaa !19
  br i1 %411, label %.preheader.split.10.i, label %.split499.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %477 = trunc i64 %420 to i32
  %478 = or disjoint i32 %477, 9
  %479 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !19
  %481 = or disjoint i64 %423, 9
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 4, !tbaa !19
  br i1 %412, label %.preheader.split.11.i, label %.split499.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %483 = trunc i64 %420 to i32
  %484 = or disjoint i32 %483, 10
  %485 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !19
  %487 = or disjoint i64 %423, 10
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 8, !tbaa !19
  br i1 %413, label %.preheader.split.12.i, label %.split499.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %489 = trunc i64 %420 to i32
  %490 = or disjoint i32 %489, 11
  %491 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !19
  %493 = or disjoint i64 %423, 11
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 4, !tbaa !19
  br i1 %414, label %.preheader.split.13.i, label %.split499.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %495 = trunc i64 %420 to i32
  %496 = or disjoint i32 %495, 12
  %497 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !19
  %499 = or disjoint i64 %423, 12
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 16, !tbaa !19
  br i1 %415, label %.preheader.split.14.i, label %.split499.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %501 = trunc i64 %420 to i32
  %502 = or disjoint i32 %501, 13
  %503 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !19
  %505 = or disjoint i64 %423, 13
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 4, !tbaa !19
  br i1 %416, label %.preheader.split.15.i, label %.split499.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %507 = trunc i64 %420 to i32
  %508 = or disjoint i32 %507, 14
  %509 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !19
  %511 = or disjoint i64 %423, 14
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 8, !tbaa !19
  br i1 %417, label %513, label %.split499.us.i

513:                                              ; preds = %.preheader.split.15.i
  %514 = trunc i64 %420 to i32
  %515 = or disjoint i32 %514, 15
  %516 = getelementptr inbounds float, ptr addrspace(3) %400, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !19
  %518 = or disjoint i64 %423, 15
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 4, !tbaa !19
  br label %.split499.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge497.i, %.split499.us.i
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
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{i64 0, i64 2, !26}
!26 = !{!27, !27, i64 0}
!27 = !{!"short", !21, i64 0}
!28 = distinct !{!28, !24, !29, !30}
!29 = !{!"llvm.loop.vectorize.width", i32 1}
!30 = !{!"llvm.loop.interleave.count", i32 1}
!31 = distinct !{!31, !24, !29, !30}
!32 = distinct !{!32, !24, !29, !30}
!33 = distinct !{!33, !24}
!34 = distinct !{!34, !24}
!35 = distinct !{!35, !24}
;----------------- End AdaptiveCpp IR dump ---------------
