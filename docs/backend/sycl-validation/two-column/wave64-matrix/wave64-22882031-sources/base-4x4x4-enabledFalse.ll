;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-7_46b4v8/kernel.cpp"
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
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 536870911
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp ult i64 %20, 4
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 536870912
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp ult i64 %28, 4
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp ult i64 %30, 4
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 4
  call void @llvm.assume(i1 %33)
  %34 = shl nuw nsw i64 %32, 4
  %35 = shl nuw nsw i64 %30, 2
  %36 = or disjoint i64 %34, %35
  %37 = or disjoint i64 %36, %28
  %38 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %39 = inttoptr i32 %38 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %41 = icmp ult i64 %40, 536870911
  call void @llvm.assume(i1 %41)
  %.tr.i = trunc i64 %40 to i32
  %42 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %44 = icmp ult i64 %43, 4
  call void @llvm.assume(i1 %44)
  %45 = icmp eq i64 %43, 0
  br i1 %45, label %52, label %.lr.ph574.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %46 = phi i64 [ %37, %6 ], [ %50, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %47 = trunc i64 %46 to i32
  %48 = and i32 %47, 127
  %49 = getelementptr inbounds float, ptr addrspace(3) %39, i32 %48
  store float 0.000000e+00, ptr addrspace(3) %49, align 4, !tbaa !19
  %50 = add nuw nsw i64 %46, 64
  %51 = icmp ult i64 %46, 64
  br i1 %51, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

52:                                               ; preds = %._crit_edge.i
  %53 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %54 = icmp ult i64 %53, 4
  call void @llvm.assume(i1 %54)
  %55 = icmp eq i64 %53, 0
  br i1 %55, label %56, label %.lr.ph574.i

56:                                               ; preds = %52
  %57 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %58 = icmp ult i64 %57, 4
  call void @llvm.assume(i1 %58)
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %.preheader563.i, label %.lr.ph574.i

.preheader563.i:                                  ; preds = %56
  %60 = sext i32 %5 to i64
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr inbounds i8, ptr addrspace(3) %62, i32 512
  %64 = sext i32 %42 to i64
  %65 = icmp sgt i32 %3, 0
  %66 = icmp ugt i32 %3, 1
  %67 = icmp ugt i32 %3, 2
  %68 = icmp ugt i32 %3, 3
  %69 = icmp ugt i32 %3, 4
  %70 = icmp ugt i32 %3, 5
  %71 = icmp ugt i32 %3, 6
  %72 = icmp ugt i32 %3, 7
  br label %.preheader562.i

.preheader562.i:                                  ; preds = %.split.us.i, %.preheader563.i
  %73 = phi i64 [ 0, %.preheader563.i ], [ %83, %.split.us.i ]
  %74 = icmp slt i64 %73, %60
  %75 = shl i64 %73, 3
  %.tr553.i = trunc i64 %73 to i32
  %76 = shl i32 %.tr553.i, 3
  %77 = sext i32 %76 to i64
  %78 = add nsw i64 %77, %64
  %.fr.i = freeze i1 %74
  br i1 %.fr.i, label %.preheader562.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader562.i
  %.tr602.i = trunc i64 %73 to i32
  %79 = shl i32 %.tr602.i, 4
  %80 = add i32 %79, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %62, i32 %80
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader562.split.preheader.i:                  ; preds = %.preheader562.i
  br i1 %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader562.split.preheader.i
  %81 = trunc i64 %75 to i32
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %81
  store i16 0, ptr addrspace(3) %82, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %83 = add nuw nsw i64 %73, 1
  %exitcond.not.i = icmp eq i64 %83, 16
  br i1 %exitcond.not.i, label %.lr.ph574.i, label %.preheader562.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader562.split.preheader.i
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %78
  %.sroa.0269.0.copyload.i = load i16, ptr %84, align 16, !tbaa.struct !25
  %85 = trunc i64 %75 to i32
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %85
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %86, align 2, !tbaa.struct !25
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i
  %87 = trunc i64 %75 to i32
  %88 = or disjoint i32 %87, 1
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  %90 = or disjoint i64 %78, 1
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0269.0.copyload.1.i = load i16, ptr %91, align 2, !tbaa.struct !25
  %92 = trunc i64 %75 to i32
  %93 = or disjoint i32 %92, 1
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %93
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %94, align 2, !tbaa.struct !25
  br i1 %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i
  %95 = trunc i64 %75 to i32
  %96 = or disjoint i32 %95, 2
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i
  %98 = or disjoint i64 %78, 2
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0269.0.copyload.2.i = load i16, ptr %99, align 4, !tbaa.struct !25
  %100 = trunc i64 %75 to i32
  %101 = or disjoint i32 %100, 2
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %101
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %102, align 2, !tbaa.struct !25
  br i1 %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i
  %103 = trunc i64 %75 to i32
  %104 = or disjoint i32 %103, 3
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i
  %106 = or disjoint i64 %78, 3
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0269.0.copyload.3.i = load i16, ptr %107, align 2, !tbaa.struct !25
  %108 = trunc i64 %75 to i32
  %109 = or disjoint i32 %108, 3
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %109
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  br i1 %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i
  %111 = trunc i64 %75 to i32
  %112 = or disjoint i32 %111, 4
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i
  %114 = or disjoint i64 %78, 4
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0269.0.copyload.4.i = load i16, ptr %115, align 8, !tbaa.struct !25
  %116 = trunc i64 %75 to i32
  %117 = or disjoint i32 %116, 4
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %117
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %118, align 2, !tbaa.struct !25
  br i1 %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i
  %119 = trunc i64 %75 to i32
  %120 = or disjoint i32 %119, 5
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i
  %122 = or disjoint i64 %78, 5
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0269.0.copyload.5.i = load i16, ptr %123, align 2, !tbaa.struct !25
  %124 = trunc i64 %75 to i32
  %125 = or disjoint i32 %124, 5
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %125
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %126, align 2, !tbaa.struct !25
  br i1 %71, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i
  %127 = trunc i64 %75 to i32
  %128 = or disjoint i32 %127, 6
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %128
  store i16 0, ptr addrspace(3) %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i
  %130 = or disjoint i64 %78, 6
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %130
  %.sroa.0269.0.copyload.6.i = load i16, ptr %131, align 4, !tbaa.struct !25
  %132 = trunc i64 %75 to i32
  %133 = or disjoint i32 %132, 6
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %133
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %134, align 2, !tbaa.struct !25
  br i1 %72, label %135, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

135:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i
  %136 = or disjoint i64 %78, 7
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %136
  %.sroa.0269.0.copyload.7.i = load i16, ptr %137, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i: ; preds = %135, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %135 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i ]
  %138 = trunc i64 %75 to i32
  %139 = or disjoint i32 %138, 7
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %139
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %140, align 2, !tbaa.struct !25
  br label %.split.us.i

.lr.ph574.i:                                      ; preds = %.split.us.i, %56, %52, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %142 = icmp ult i64 %141, 4
  call void @llvm.assume(i1 %142)
  %143 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %144 = icmp ult i64 %143, 4
  call void @llvm.assume(i1 %144)
  %145 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %146 = icmp ult i64 %145, 4
  call void @llvm.assume(i1 %146)
  %147 = shl nuw nsw i64 %145, 4
  %148 = shl nuw nsw i64 %143, 2
  %149 = or disjoint i64 %147, %148
  %150 = or disjoint i64 %149, %141
  %151 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %152 = inttoptr i32 %151 to ptr addrspace(3)
  %153 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 512
  %154 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge575.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %157 = icmp ult i64 %156, 4
  call void @llvm.assume(i1 %157)
  %158 = icmp eq i64 %156, 0
  br i1 %158, label %172, label %.lr.ph580.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph574.i
  %159 = phi i64 [ %150, %.lr.ph574.i ], [ %170, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %160 = lshr i64 %159, 4
  %161 = and i64 %160, 7
  %162 = shl i64 %159, 3
  %163 = and i64 %162, 120
  %164 = or disjoint i64 %163, %161
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %153, i32 %165
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %166, align 2, !tbaa.struct !25
  %167 = trunc i64 %159 to i32
  %168 = and i32 %167, 127
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %154, i32 %168
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %169, align 2, !tbaa.struct !25
  %170 = add nuw nsw i64 %159, 64
  %171 = icmp ult i64 %159, 64
  br i1 %171, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge575.i, !llvm.loop !31

172:                                              ; preds = %._crit_edge575.i
  %173 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %174 = icmp ult i64 %173, 4
  call void @llvm.assume(i1 %174)
  %175 = icmp eq i64 %173, 0
  br i1 %175, label %176, label %.lr.ph580.i

176:                                              ; preds = %172
  %177 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %178 = icmp ult i64 %177, 4
  call void @llvm.assume(i1 %178)
  %179 = icmp eq i64 %177, 0
  br i1 %179, label %.preheader561.i, label %.lr.ph580.i

.preheader561.i:                                  ; preds = %176
  %180 = sext i32 %4 to i64
  %181 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %182 = inttoptr i32 %181 to ptr addrspace(3)
  %183 = getelementptr inbounds i8, ptr addrspace(3) %182, i32 1024
  %184 = sext i32 %155 to i64
  %185 = icmp sgt i32 %5, 0
  %186 = icmp ugt i32 %5, 1
  %187 = icmp ugt i32 %5, 2
  %188 = icmp ugt i32 %5, 3
  %189 = icmp ugt i32 %5, 4
  %190 = icmp ugt i32 %5, 5
  %191 = icmp ugt i32 %5, 6
  %192 = icmp ugt i32 %5, 7
  %193 = icmp ugt i32 %5, 8
  %194 = icmp ugt i32 %5, 9
  %195 = icmp ugt i32 %5, 10
  %196 = icmp ugt i32 %5, 11
  %197 = icmp ugt i32 %5, 12
  %198 = icmp ugt i32 %5, 13
  %199 = icmp ugt i32 %5, 14
  %200 = icmp ugt i32 %5, 15
  br label %.preheader560.i

.preheader560.i:                                  ; preds = %.split577.us.i, %.preheader561.i
  %201 = phi i64 [ 0, %.preheader561.i ], [ %211, %.split577.us.i ]
  %202 = icmp slt i64 %201, %180
  %203 = shl i64 %201, 4
  %.tr551.i = trunc i64 %201 to i32
  %204 = shl i32 %.tr551.i, 4
  %205 = sext i32 %204 to i64
  %206 = add nsw i64 %205, %184
  %.fr578.i = freeze i1 %202
  br i1 %.fr578.i, label %.preheader560.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader560.i
  %.tr601.i = trunc i64 %201 to i32
  %207 = shl i32 %.tr601.i, 5
  %208 = add i32 %207, 1024
  %scevgep595.i = getelementptr i8, ptr addrspace(3) %182, i32 %208
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep595.i, i8 0, i32 32, i1 false)
  br label %.split577.us.i

.preheader560.split.preheader.i:                  ; preds = %.preheader560.i
  br i1 %185, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader560.split.preheader.i
  %209 = trunc i64 %203 to i32
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %209
  store i16 0, ptr addrspace(3) %210, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split577.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %211 = add nuw nsw i64 %201, 1
  %exitcond597.not.i = icmp eq i64 %211, 16
  br i1 %exitcond597.not.i, label %.lr.ph580.i, label %.preheader560.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader560.split.preheader.i
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %206
  %.sroa.0232.0.copyload.i = load i16, ptr %212, align 32, !tbaa.struct !25
  %213 = trunc i64 %203 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %213
  store i16 %.sroa.0232.0.copyload.i, ptr addrspace(3) %214, align 2, !tbaa.struct !25
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %215 = trunc i64 %203 to i32
  %216 = or disjoint i32 %215, 1
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %216
  store i16 0, ptr addrspace(3) %217, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %218 = or disjoint i64 %206, 1
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %218
  %.sroa.0232.0.copyload.1.i = load i16, ptr %219, align 2, !tbaa.struct !25
  %220 = trunc i64 %203 to i32
  %221 = or disjoint i32 %220, 1
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %221
  store i16 %.sroa.0232.0.copyload.1.i, ptr addrspace(3) %222, align 2, !tbaa.struct !25
  br i1 %187, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %223 = trunc i64 %203 to i32
  %224 = or disjoint i32 %223, 2
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %224
  store i16 0, ptr addrspace(3) %225, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %226 = or disjoint i64 %206, 2
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %226
  %.sroa.0232.0.copyload.2.i = load i16, ptr %227, align 4, !tbaa.struct !25
  %228 = trunc i64 %203 to i32
  %229 = or disjoint i32 %228, 2
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %229
  store i16 %.sroa.0232.0.copyload.2.i, ptr addrspace(3) %230, align 2, !tbaa.struct !25
  br i1 %188, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %231 = trunc i64 %203 to i32
  %232 = or disjoint i32 %231, 3
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %232
  store i16 0, ptr addrspace(3) %233, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %234 = or disjoint i64 %206, 3
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %234
  %.sroa.0232.0.copyload.3.i = load i16, ptr %235, align 2, !tbaa.struct !25
  %236 = trunc i64 %203 to i32
  %237 = or disjoint i32 %236, 3
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %237
  store i16 %.sroa.0232.0.copyload.3.i, ptr addrspace(3) %238, align 2, !tbaa.struct !25
  br i1 %189, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %239 = trunc i64 %203 to i32
  %240 = or disjoint i32 %239, 4
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %240
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %242 = or disjoint i64 %206, 4
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %242
  %.sroa.0232.0.copyload.4.i = load i16, ptr %243, align 8, !tbaa.struct !25
  %244 = trunc i64 %203 to i32
  %245 = or disjoint i32 %244, 4
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %245
  store i16 %.sroa.0232.0.copyload.4.i, ptr addrspace(3) %246, align 2, !tbaa.struct !25
  br i1 %190, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %247 = trunc i64 %203 to i32
  %248 = or disjoint i32 %247, 5
  %249 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %248
  store i16 0, ptr addrspace(3) %249, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %250 = or disjoint i64 %206, 5
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %250
  %.sroa.0232.0.copyload.5.i = load i16, ptr %251, align 2, !tbaa.struct !25
  %252 = trunc i64 %203 to i32
  %253 = or disjoint i32 %252, 5
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %253
  store i16 %.sroa.0232.0.copyload.5.i, ptr addrspace(3) %254, align 2, !tbaa.struct !25
  br i1 %191, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %255 = trunc i64 %203 to i32
  %256 = or disjoint i32 %255, 6
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %256
  store i16 0, ptr addrspace(3) %257, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %258 = or disjoint i64 %206, 6
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %258
  %.sroa.0232.0.copyload.6.i = load i16, ptr %259, align 4, !tbaa.struct !25
  %260 = trunc i64 %203 to i32
  %261 = or disjoint i32 %260, 6
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %261
  store i16 %.sroa.0232.0.copyload.6.i, ptr addrspace(3) %262, align 2, !tbaa.struct !25
  br i1 %192, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %263 = trunc i64 %203 to i32
  %264 = or disjoint i32 %263, 7
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %264
  store i16 0, ptr addrspace(3) %265, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %266 = or disjoint i64 %206, 7
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %266
  %.sroa.0232.0.copyload.7.i = load i16, ptr %267, align 2, !tbaa.struct !25
  %268 = trunc i64 %203 to i32
  %269 = or disjoint i32 %268, 7
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %269
  store i16 %.sroa.0232.0.copyload.7.i, ptr addrspace(3) %270, align 2, !tbaa.struct !25
  br i1 %193, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %271 = trunc i64 %203 to i32
  %272 = or disjoint i32 %271, 8
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %272
  store i16 0, ptr addrspace(3) %273, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %274 = or disjoint i64 %206, 8
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %274
  %.sroa.0232.0.copyload.8.i = load i16, ptr %275, align 16, !tbaa.struct !25
  %276 = trunc i64 %203 to i32
  %277 = or disjoint i32 %276, 8
  %278 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %277
  store i16 %.sroa.0232.0.copyload.8.i, ptr addrspace(3) %278, align 2, !tbaa.struct !25
  br i1 %194, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %279 = trunc i64 %203 to i32
  %280 = or disjoint i32 %279, 9
  %281 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %280
  store i16 0, ptr addrspace(3) %281, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %282 = or disjoint i64 %206, 9
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %282
  %.sroa.0232.0.copyload.9.i = load i16, ptr %283, align 2, !tbaa.struct !25
  %284 = trunc i64 %203 to i32
  %285 = or disjoint i32 %284, 9
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %285
  store i16 %.sroa.0232.0.copyload.9.i, ptr addrspace(3) %286, align 2, !tbaa.struct !25
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %287 = trunc i64 %203 to i32
  %288 = or disjoint i32 %287, 10
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %288
  store i16 0, ptr addrspace(3) %289, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %290 = or disjoint i64 %206, 10
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %290
  %.sroa.0232.0.copyload.10.i = load i16, ptr %291, align 4, !tbaa.struct !25
  %292 = trunc i64 %203 to i32
  %293 = or disjoint i32 %292, 10
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %293
  store i16 %.sroa.0232.0.copyload.10.i, ptr addrspace(3) %294, align 2, !tbaa.struct !25
  br i1 %196, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %295 = trunc i64 %203 to i32
  %296 = or disjoint i32 %295, 11
  %297 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %296
  store i16 0, ptr addrspace(3) %297, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %298 = or disjoint i64 %206, 11
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %298
  %.sroa.0232.0.copyload.11.i = load i16, ptr %299, align 2, !tbaa.struct !25
  %300 = trunc i64 %203 to i32
  %301 = or disjoint i32 %300, 11
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %301
  store i16 %.sroa.0232.0.copyload.11.i, ptr addrspace(3) %302, align 2, !tbaa.struct !25
  br i1 %197, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %303 = trunc i64 %203 to i32
  %304 = or disjoint i32 %303, 12
  %305 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %304
  store i16 0, ptr addrspace(3) %305, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %306 = or disjoint i64 %206, 12
  %307 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %306
  %.sroa.0232.0.copyload.12.i = load i16, ptr %307, align 8, !tbaa.struct !25
  %308 = trunc i64 %203 to i32
  %309 = or disjoint i32 %308, 12
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %309
  store i16 %.sroa.0232.0.copyload.12.i, ptr addrspace(3) %310, align 2, !tbaa.struct !25
  br i1 %198, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %311 = trunc i64 %203 to i32
  %312 = or disjoint i32 %311, 13
  %313 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %312
  store i16 0, ptr addrspace(3) %313, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %314 = or disjoint i64 %206, 13
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %314
  %.sroa.0232.0.copyload.13.i = load i16, ptr %315, align 2, !tbaa.struct !25
  %316 = trunc i64 %203 to i32
  %317 = or disjoint i32 %316, 13
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %317
  store i16 %.sroa.0232.0.copyload.13.i, ptr addrspace(3) %318, align 2, !tbaa.struct !25
  br i1 %199, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %319 = trunc i64 %203 to i32
  %320 = or disjoint i32 %319, 14
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %320
  store i16 0, ptr addrspace(3) %321, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %322 = or disjoint i64 %206, 14
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0232.0.copyload.14.i = load i16, ptr %323, align 4, !tbaa.struct !25
  %324 = trunc i64 %203 to i32
  %325 = or disjoint i32 %324, 14
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %325
  store i16 %.sroa.0232.0.copyload.14.i, ptr addrspace(3) %326, align 2, !tbaa.struct !25
  br i1 %200, label %327, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

327:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %328 = or disjoint i64 %206, 15
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %328
  %.sroa.0232.0.copyload.15.i = load i16, ptr %329, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %327, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0234.2.15.i = phi i16 [ %.sroa.0232.0.copyload.15.i, %327 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %330 = trunc i64 %203 to i32
  %331 = or disjoint i32 %330, 15
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %331
  store i16 %.sroa.0234.2.15.i, ptr addrspace(3) %332, align 2, !tbaa.struct !25
  br label %.split577.us.i

.lr.ph580.i:                                      ; preds = %.split577.us.i, %176, %172, %._crit_edge575.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %333 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %334 = icmp ult i64 %333, 4
  call void @llvm.assume(i1 %334)
  %335 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %336 = icmp ult i64 %335, 4
  call void @llvm.assume(i1 %336)
  %337 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %338 = icmp ult i64 %337, 4
  call void @llvm.assume(i1 %338)
  %339 = shl nuw nsw i64 %337, 4
  %340 = shl nuw nsw i64 %335, 2
  %341 = or disjoint i64 %339, %340
  %342 = or disjoint i64 %341, %333
  %343 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %344 = inttoptr i32 %343 to ptr addrspace(3)
  %345 = getelementptr inbounds i8, ptr addrspace(3) %344, i32 1024
  %346 = getelementptr inbounds i8, ptr addrspace(3) %344, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph583.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %347 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %348 = icmp ult i64 %347, 4
  call void @llvm.assume(i1 %348)
  %349 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %350 = icmp ult i64 %349, 4
  call void @llvm.assume(i1 %350)
  %351 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %352 = icmp ult i64 %351, 4
  call void @llvm.assume(i1 %352)
  %353 = shl nuw nsw i64 %351, 4
  %354 = shl nuw nsw i64 %349, 2
  %355 = or disjoint i64 %353, %354
  %356 = or disjoint i64 %355, %347
  %357 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %358 = inttoptr i32 %357 to ptr addrspace(3)
  %359 = getelementptr inbounds i8, ptr addrspace(3) %358, i32 768
  %360 = getelementptr inbounds i8, ptr addrspace(3) %358, i32 1536
  br label %377

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph580.i
  %361 = phi i64 [ %342, %.lr.ph580.i ], [ %372, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %362 = lshr i64 %361, 4
  %363 = and i64 %362, 15
  %364 = shl i64 %361, 4
  %365 = and i64 %364, 240
  %366 = or disjoint i64 %365, %363
  %367 = trunc i64 %366 to i32
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %345, i32 %367
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %368, align 2, !tbaa.struct !25
  %369 = trunc i64 %361 to i32
  %370 = and i32 %369, 255
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %346, i32 %370
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %371, align 2, !tbaa.struct !25
  %372 = add nuw nsw i64 %361, 64
  %373 = icmp ult i64 %361, 192
  br i1 %373, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph583.i, !llvm.loop !33

._crit_edge584.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %374 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %375 = icmp ult i64 %374, 4
  call void @llvm.assume(i1 %375)
  %376 = icmp eq i64 %374, 0
  br i1 %376, label %441, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

377:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph583.i
  %378 = phi i64 [ %356, %.lr.ph583.i ], [ %386, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %.frozen.i = freeze i64 %378
  %379 = sdiv i64 %.frozen.i, 16
  %380 = srem i64 %379, 8
  %381 = mul i64 %379, 16
  %.decomposed.i = sub i64 %.frozen.i, %381
  %382 = shl nsw i64 %380, 4
  %srem.i = srem i64 %378, 128
  %383 = trunc i64 %srem.i to i32
  %384 = getelementptr inbounds float, ptr addrspace(3) %358, i32 %383
  %385 = load float, ptr addrspace(3) %384, align 4, !tbaa !19
  br label %388

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %439, ptr addrspace(3) %384, align 4, !tbaa !19
  %386 = add i64 %378, 64
  %387 = icmp slt i64 %386, 128
  br i1 %387, label %377, label %._crit_edge584.i, !llvm.loop !34

388:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %377
  %389 = phi i64 [ 0, %377 ], [ %440, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %390 = phi float [ %385, %377 ], [ %439, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %391 = add nuw nsw i64 %389, %382
  %392 = trunc i64 %391 to i32
  %393 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %359, i32 %392
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %393, align 2, !tbaa.struct !25
  %394 = shl nuw nsw i64 %389, 4
  %395 = add nsw i64 %394, %.decomposed.i
  %396 = trunc i64 %395 to i32
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %360, i32 %396
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %397, align 2, !tbaa.struct !25
  %398 = zext i16 %.sroa.0189.0.copyload.i to i32
  %399 = lshr i32 %398, 10
  %400 = and i32 %399, 31
  %401 = and i32 %398, 1023
  switch i32 %400, label %407 [
    i32 31, label %402
    i32 0, label %409
  ]

402:                                              ; preds = %388
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %403 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %401, 0
  %404 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %405 = or disjoint i32 %404, %403
  %406 = bitcast i32 %405 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

407:                                              ; preds = %388
  %408 = or disjoint i32 %401, 1024
  br label %409

409:                                              ; preds = %407, %388
  %410 = phi i32 [ %408, %407 ], [ %401, %388 ]
  %411 = uitofp i32 %410 to float
  %.not.i = icmp eq i32 %400, 0
  %412 = add nsw i32 %400, -25
  %413 = select i1 %.not.i, i32 -24, i32 %412
  %414 = call float @__ocml_ldexp_f32(float noundef %411, i32 noundef %413) #6
  %415 = fneg contract float %414
  %.not543544.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %416 = select contract i1 %.not543544.i, float %415, float %414
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %409, %402
  %417 = phi float [ %406, %402 ], [ %416, %409 ]
  %418 = zext i16 %.sroa.0180.0.copyload.i to i32
  %419 = lshr i32 %418, 10
  %420 = and i32 %419, 31
  %421 = and i32 %418, 1023
  switch i32 %420, label %427 [
    i32 31, label %422
    i32 0, label %429
  ]

422:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %423 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %421, 0
  %424 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %425 = or disjoint i32 %424, %423
  %426 = bitcast i32 %425 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

427:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %428 = or disjoint i32 %421, 1024
  br label %429

429:                                              ; preds = %427, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %430 = phi i32 [ %428, %427 ], [ %421, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %431 = uitofp i32 %430 to float
  %.not545.i = icmp eq i32 %420, 0
  %432 = add nsw i32 %420, -25
  %433 = select i1 %.not545.i, i32 -24, i32 %432
  %434 = call float @__ocml_ldexp_f32(float noundef %431, i32 noundef %433) #6
  %435 = fneg contract float %434
  %.not546547.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %436 = select contract i1 %.not546547.i, float %435, float %434
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %429, %422
  %437 = phi float [ %426, %422 ], [ %436, %429 ]
  %438 = fmul contract float %417, %437
  %439 = fadd contract float %390, %438
  %440 = add nuw nsw i64 %389, 1
  %exitcond598.not.i = icmp eq i64 %440, 16
  br i1 %exitcond598.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %388, !llvm.loop !35

441:                                              ; preds = %._crit_edge584.i
  %442 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %443 = icmp ult i64 %442, 4
  call void @llvm.assume(i1 %443)
  %444 = icmp eq i64 %442, 0
  br i1 %444, label %445, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

445:                                              ; preds = %441
  %446 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %447 = icmp ult i64 %446, 4
  call void @llvm.assume(i1 %447)
  %448 = icmp eq i64 %446, 0
  br i1 %448, label %.preheader559.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader559.i:                                  ; preds = %445
  %449 = sext i32 %3 to i64
  %450 = call i32 @llvm.amdgcn.groupstaticsize()
  %451 = inttoptr i32 %450 to ptr addrspace(3)
  %452 = sext i32 %42 to i64
  %453 = icmp sgt i32 %4, 0
  %454 = icmp ugt i32 %4, 1
  %455 = icmp ugt i32 %4, 2
  %456 = icmp ugt i32 %4, 3
  %457 = icmp ugt i32 %4, 4
  %458 = icmp ugt i32 %4, 5
  %459 = icmp ugt i32 %4, 6
  %460 = icmp ugt i32 %4, 7
  %461 = icmp ugt i32 %4, 8
  %462 = icmp ugt i32 %4, 9
  %463 = icmp ugt i32 %4, 10
  %464 = icmp ugt i32 %4, 11
  %465 = icmp ugt i32 %4, 12
  %466 = icmp ugt i32 %4, 13
  %467 = icmp ugt i32 %4, 14
  %468 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split586.us.i, %.preheader559.i
  %469 = phi i64 [ 0, %.preheader559.i ], [ %475, %.split586.us.i ]
  %470 = icmp slt i64 %469, %449
  %471 = shl i64 %469, 4
  %.tr542.i = trunc i64 %469 to i32
  %472 = shl i32 %.tr542.i, 4
  %473 = sext i32 %472 to i64
  %474 = add nsw i64 %473, %452
  %.fr587.i = freeze i1 %470
  %brmerge.not.i = select i1 %.fr587.i, i1 %453, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split586.us.i

.split586.us.i:                                   ; preds = %564, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %475 = add nuw nsw i64 %469, 1
  %exitcond600.not.i = icmp eq i64 %475, 8
  br i1 %exitcond600.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %476 = trunc i64 %471 to i32
  %477 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !19
  %479 = getelementptr inbounds float, ptr %9, i64 %474
  store float %478, ptr %479, align 32, !tbaa !19
  br i1 %454, label %.preheader.split.2.i, label %.split586.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %480 = trunc i64 %471 to i32
  %481 = or disjoint i32 %480, 1
  %482 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %481
  %483 = load float, ptr addrspace(3) %482, align 4, !tbaa !19
  %484 = or disjoint i64 %474, 1
  %485 = getelementptr inbounds float, ptr %9, i64 %484
  store float %483, ptr %485, align 4, !tbaa !19
  br i1 %455, label %.preheader.split.3.i, label %.split586.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %486 = trunc i64 %471 to i32
  %487 = or disjoint i32 %486, 2
  %488 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %487
  %489 = load float, ptr addrspace(3) %488, align 4, !tbaa !19
  %490 = or disjoint i64 %474, 2
  %491 = getelementptr inbounds float, ptr %9, i64 %490
  store float %489, ptr %491, align 8, !tbaa !19
  br i1 %456, label %.preheader.split.4.i, label %.split586.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %492 = trunc i64 %471 to i32
  %493 = or disjoint i32 %492, 3
  %494 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %493
  %495 = load float, ptr addrspace(3) %494, align 4, !tbaa !19
  %496 = or disjoint i64 %474, 3
  %497 = getelementptr inbounds float, ptr %9, i64 %496
  store float %495, ptr %497, align 4, !tbaa !19
  br i1 %457, label %.preheader.split.5.i, label %.split586.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %498 = trunc i64 %471 to i32
  %499 = or disjoint i32 %498, 4
  %500 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %499
  %501 = load float, ptr addrspace(3) %500, align 4, !tbaa !19
  %502 = or disjoint i64 %474, 4
  %503 = getelementptr inbounds float, ptr %9, i64 %502
  store float %501, ptr %503, align 16, !tbaa !19
  br i1 %458, label %.preheader.split.6.i, label %.split586.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %504 = trunc i64 %471 to i32
  %505 = or disjoint i32 %504, 5
  %506 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %505
  %507 = load float, ptr addrspace(3) %506, align 4, !tbaa !19
  %508 = or disjoint i64 %474, 5
  %509 = getelementptr inbounds float, ptr %9, i64 %508
  store float %507, ptr %509, align 4, !tbaa !19
  br i1 %459, label %.preheader.split.7.i, label %.split586.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %510 = trunc i64 %471 to i32
  %511 = or disjoint i32 %510, 6
  %512 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %511
  %513 = load float, ptr addrspace(3) %512, align 4, !tbaa !19
  %514 = or disjoint i64 %474, 6
  %515 = getelementptr inbounds float, ptr %9, i64 %514
  store float %513, ptr %515, align 8, !tbaa !19
  br i1 %460, label %.preheader.split.8.i, label %.split586.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %516 = trunc i64 %471 to i32
  %517 = or disjoint i32 %516, 7
  %518 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %517
  %519 = load float, ptr addrspace(3) %518, align 4, !tbaa !19
  %520 = or disjoint i64 %474, 7
  %521 = getelementptr inbounds float, ptr %9, i64 %520
  store float %519, ptr %521, align 4, !tbaa !19
  br i1 %461, label %.preheader.split.9.i, label %.split586.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %522 = trunc i64 %471 to i32
  %523 = or disjoint i32 %522, 8
  %524 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %523
  %525 = load float, ptr addrspace(3) %524, align 4, !tbaa !19
  %526 = or disjoint i64 %474, 8
  %527 = getelementptr inbounds float, ptr %9, i64 %526
  store float %525, ptr %527, align 32, !tbaa !19
  br i1 %462, label %.preheader.split.10.i, label %.split586.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %528 = trunc i64 %471 to i32
  %529 = or disjoint i32 %528, 9
  %530 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %529
  %531 = load float, ptr addrspace(3) %530, align 4, !tbaa !19
  %532 = or disjoint i64 %474, 9
  %533 = getelementptr inbounds float, ptr %9, i64 %532
  store float %531, ptr %533, align 4, !tbaa !19
  br i1 %463, label %.preheader.split.11.i, label %.split586.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %534 = trunc i64 %471 to i32
  %535 = or disjoint i32 %534, 10
  %536 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %535
  %537 = load float, ptr addrspace(3) %536, align 4, !tbaa !19
  %538 = or disjoint i64 %474, 10
  %539 = getelementptr inbounds float, ptr %9, i64 %538
  store float %537, ptr %539, align 8, !tbaa !19
  br i1 %464, label %.preheader.split.12.i, label %.split586.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %540 = trunc i64 %471 to i32
  %541 = or disjoint i32 %540, 11
  %542 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %541
  %543 = load float, ptr addrspace(3) %542, align 4, !tbaa !19
  %544 = or disjoint i64 %474, 11
  %545 = getelementptr inbounds float, ptr %9, i64 %544
  store float %543, ptr %545, align 4, !tbaa !19
  br i1 %465, label %.preheader.split.13.i, label %.split586.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %546 = trunc i64 %471 to i32
  %547 = or disjoint i32 %546, 12
  %548 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %547
  %549 = load float, ptr addrspace(3) %548, align 4, !tbaa !19
  %550 = or disjoint i64 %474, 12
  %551 = getelementptr inbounds float, ptr %9, i64 %550
  store float %549, ptr %551, align 16, !tbaa !19
  br i1 %466, label %.preheader.split.14.i, label %.split586.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %552 = trunc i64 %471 to i32
  %553 = or disjoint i32 %552, 13
  %554 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %553
  %555 = load float, ptr addrspace(3) %554, align 4, !tbaa !19
  %556 = or disjoint i64 %474, 13
  %557 = getelementptr inbounds float, ptr %9, i64 %556
  store float %555, ptr %557, align 4, !tbaa !19
  br i1 %467, label %.preheader.split.15.i, label %.split586.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %558 = trunc i64 %471 to i32
  %559 = or disjoint i32 %558, 14
  %560 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %559
  %561 = load float, ptr addrspace(3) %560, align 4, !tbaa !19
  %562 = or disjoint i64 %474, 14
  %563 = getelementptr inbounds float, ptr %9, i64 %562
  store float %561, ptr %563, align 8, !tbaa !19
  br i1 %468, label %564, label %.split586.us.i

564:                                              ; preds = %.preheader.split.15.i
  %565 = trunc i64 %471 to i32
  %566 = or disjoint i32 %565, 15
  %567 = getelementptr inbounds float, ptr addrspace(3) %451, i32 %566
  %568 = load float, ptr addrspace(3) %567, align 4, !tbaa !19
  %569 = or disjoint i64 %474, 15
  %570 = getelementptr inbounds float, ptr %9, i64 %569
  store float %568, ptr %570, align 4, !tbaa !19
  br label %.split586.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge584.i, %441, %445, %.split586.us.i
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
!33 = distinct !{!33, !24, !29, !30}
!34 = distinct !{!34, !24}
!35 = distinct !{!35, !24}
!36 = distinct !{!36, !24}
;----------------- End AdaptiveCpp IR dump ---------------
