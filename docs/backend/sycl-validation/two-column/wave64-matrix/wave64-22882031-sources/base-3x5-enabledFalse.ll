;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-3tg1b_yo/kernel.cpp"
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
  %11 = icmp ult i64 %10, 715827882
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 429496729
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 3
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp ult i64 %18, 5
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 715827883
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 429496730
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %31 = icmp ult i64 %30, 5
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %33 = icmp ult i64 %32, 3
  call void @llvm.assume(i1 %33)
  %34 = mul nuw nsw i64 %32, 5
  %35 = add nuw nsw i64 %34, %30
  %36 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %37 = inttoptr i32 %36 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 715827882
  call void @llvm.assume(i1 %39)
  %.tr.i = trunc i64 %38 to i32
  %40 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %42 = icmp ult i64 %41, 3
  call void @llvm.assume(i1 %42)
  %43 = icmp eq i64 %41, 0
  br i1 %43, label %50, label %.lr.ph576.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %44 = phi i64 [ %35, %6 ], [ %48, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %45 = trunc i64 %44 to i32
  %46 = and i32 %45, 127
  %47 = getelementptr inbounds float, ptr addrspace(3) %37, i32 %46
  store float 0.000000e+00, ptr addrspace(3) %47, align 4, !tbaa !19
  %48 = add nuw nsw i64 %44, 15
  %49 = icmp ult i64 %44, 113
  br i1 %49, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

50:                                               ; preds = %._crit_edge.i
  %51 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %52 = icmp ult i64 %51, 5
  call void @llvm.assume(i1 %52)
  %53 = icmp eq i64 %51, 0
  br i1 %53, label %54, label %.lr.ph576.i

54:                                               ; preds = %50
  %55 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %56 = icmp eq i64 %55, 0
  call void @llvm.assume(i1 %56)
  %57 = sext i32 %5 to i64
  %58 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %59 = inttoptr i32 %58 to ptr addrspace(3)
  %60 = getelementptr inbounds i8, ptr addrspace(3) %59, i32 512
  %61 = sext i32 %40 to i64
  %62 = icmp sgt i32 %3, 0
  %63 = icmp ugt i32 %3, 1
  %64 = icmp ugt i32 %3, 2
  %65 = icmp ugt i32 %3, 3
  %66 = icmp ugt i32 %3, 4
  %67 = icmp ugt i32 %3, 5
  %68 = icmp ugt i32 %3, 6
  %69 = icmp ugt i32 %3, 7
  br label %.preheader561.i

.preheader561.i:                                  ; preds = %.split.us.i, %54
  %70 = phi i64 [ 0, %54 ], [ %80, %.split.us.i ]
  %71 = icmp slt i64 %70, %57
  %72 = shl i64 %70, 3
  %.tr553.i = trunc i64 %70 to i32
  %73 = shl i32 %.tr553.i, 3
  %74 = sext i32 %73 to i64
  %75 = add nsw i64 %74, %61
  %.fr.i = freeze i1 %71
  br i1 %.fr.i, label %.preheader561.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader561.i
  %.tr608.i = trunc i64 %70 to i32
  %76 = shl i32 %.tr608.i, 4
  %77 = add i32 %76, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %59, i32 %77
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader561.split.preheader.i:                  ; preds = %.preheader561.i
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader561.split.preheader.i
  %78 = trunc i64 %72 to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %78
  store i16 0, ptr addrspace(3) %79, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %80 = add nuw nsw i64 %70, 1
  %exitcond.not.i = icmp eq i64 %80, 16
  br i1 %exitcond.not.i, label %.lr.ph576.i, label %.preheader561.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader561.split.preheader.i
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %75
  %.sroa.0269.0.copyload.i = load i16, ptr %81, align 16, !tbaa.struct !25
  %82 = trunc i64 %72 to i32
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %82
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %83, align 2, !tbaa.struct !25
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i
  %84 = trunc i64 %72 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %85
  store i16 0, ptr addrspace(3) %86, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  %87 = or disjoint i64 %75, 1
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %87
  %.sroa.0269.0.copyload.1.i = load i16, ptr %88, align 2, !tbaa.struct !25
  %89 = trunc i64 %72 to i32
  %90 = or disjoint i32 %89, 1
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %90
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %91, align 2, !tbaa.struct !25
  br i1 %64, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i
  %92 = trunc i64 %72 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %93
  store i16 0, ptr addrspace(3) %94, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i
  %95 = or disjoint i64 %75, 2
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0269.0.copyload.2.i = load i16, ptr %96, align 4, !tbaa.struct !25
  %97 = trunc i64 %72 to i32
  %98 = or disjoint i32 %97, 2
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %98
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %99, align 2, !tbaa.struct !25
  br i1 %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i
  %100 = trunc i64 %72 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %101
  store i16 0, ptr addrspace(3) %102, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i
  %103 = or disjoint i64 %75, 3
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0269.0.copyload.3.i = load i16, ptr %104, align 2, !tbaa.struct !25
  %105 = trunc i64 %72 to i32
  %106 = or disjoint i32 %105, 3
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %106
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %107, align 2, !tbaa.struct !25
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i
  %108 = trunc i64 %72 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %109
  store i16 0, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i
  %111 = or disjoint i64 %75, 4
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %111
  %.sroa.0269.0.copyload.4.i = load i16, ptr %112, align 8, !tbaa.struct !25
  %113 = trunc i64 %72 to i32
  %114 = or disjoint i32 %113, 4
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %114
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %115, align 2, !tbaa.struct !25
  br i1 %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i
  %116 = trunc i64 %72 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %117
  store i16 0, ptr addrspace(3) %118, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i
  %119 = or disjoint i64 %75, 5
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0269.0.copyload.5.i = load i16, ptr %120, align 2, !tbaa.struct !25
  %121 = trunc i64 %72 to i32
  %122 = or disjoint i32 %121, 5
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %122
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %123, align 2, !tbaa.struct !25
  br i1 %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i
  %124 = trunc i64 %72 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %125
  store i16 0, ptr addrspace(3) %126, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i
  %127 = or disjoint i64 %75, 6
  %128 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %127
  %.sroa.0269.0.copyload.6.i = load i16, ptr %128, align 4, !tbaa.struct !25
  %129 = trunc i64 %72 to i32
  %130 = or disjoint i32 %129, 6
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %130
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %131, align 2, !tbaa.struct !25
  br i1 %69, label %132, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

132:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i
  %133 = or disjoint i64 %75, 7
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %133
  %.sroa.0269.0.copyload.7.i = load i16, ptr %134, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i: ; preds = %132, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %132 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i ]
  %135 = trunc i64 %72 to i32
  %136 = or disjoint i32 %135, 7
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %60, i32 %136
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %137, align 2, !tbaa.struct !25
  br label %.split.us.i

.lr.ph576.i:                                      ; preds = %.split.us.i, %50, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %139 = icmp eq i64 %138, 0
  call void @llvm.assume(i1 %139)
  %140 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %141 = icmp ult i64 %140, 5
  call void @llvm.assume(i1 %141)
  %142 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %143 = icmp ult i64 %142, 3
  call void @llvm.assume(i1 %143)
  %144 = mul nuw nsw i64 %142, 5
  %145 = add nuw nsw i64 %144, %140
  %146 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %147 = inttoptr i32 %146 to ptr addrspace(3)
  %148 = getelementptr inbounds i8, ptr addrspace(3) %147, i32 512
  %149 = getelementptr inbounds i8, ptr addrspace(3) %147, i32 768
  br label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i

._crit_edge577.i:                                 ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %152 = icmp ult i64 %151, 3
  call void @llvm.assume(i1 %152)
  %153 = icmp eq i64 %151, 0
  br i1 %153, label %167, label %.lr.ph582.i

_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i: ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i, %.lr.ph576.i
  %154 = phi i64 [ %145, %.lr.ph576.i ], [ %165, %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i ]
  %155 = shl i64 %154, 3
  %156 = and i64 %155, 120
  %157 = lshr i64 %154, 4
  %158 = and i64 %157, 7
  %159 = or disjoint i64 %156, %158
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %148, i32 %160
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %161, align 2, !tbaa.struct !25
  %162 = trunc i64 %154 to i32
  %163 = and i32 %162, 127
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %149, i32 %163
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %164, align 2, !tbaa.struct !25
  %165 = add nuw nsw i64 %154, 15
  %166 = icmp ult i64 %154, 113
  br i1 %166, label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit.i.i.i, label %._crit_edge577.i, !llvm.loop !31

167:                                              ; preds = %._crit_edge577.i
  %168 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %169 = icmp ult i64 %168, 5
  call void @llvm.assume(i1 %169)
  %170 = icmp eq i64 %168, 0
  br i1 %170, label %171, label %.lr.ph582.i

171:                                              ; preds = %167
  %172 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %173 = icmp eq i64 %172, 0
  call void @llvm.assume(i1 %173)
  %174 = sext i32 %4 to i64
  %175 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %176 = inttoptr i32 %175 to ptr addrspace(3)
  %177 = getelementptr inbounds i8, ptr addrspace(3) %176, i32 1024
  %178 = sext i32 %150 to i64
  %179 = icmp sgt i32 %5, 0
  %180 = icmp ugt i32 %5, 1
  %181 = icmp ugt i32 %5, 2
  %182 = icmp ugt i32 %5, 3
  %183 = icmp ugt i32 %5, 4
  %184 = icmp ugt i32 %5, 5
  %185 = icmp ugt i32 %5, 6
  %186 = icmp ugt i32 %5, 7
  %187 = icmp ugt i32 %5, 8
  %188 = icmp ugt i32 %5, 9
  %189 = icmp ugt i32 %5, 10
  %190 = icmp ugt i32 %5, 11
  %191 = icmp ugt i32 %5, 12
  %192 = icmp ugt i32 %5, 13
  %193 = icmp ugt i32 %5, 14
  %194 = icmp ugt i32 %5, 15
  br label %.preheader560.i

.preheader560.i:                                  ; preds = %.split579.us.i, %171
  %195 = phi i64 [ 0, %171 ], [ %205, %.split579.us.i ]
  %196 = icmp slt i64 %195, %174
  %197 = shl i64 %195, 4
  %.tr551.i = trunc i64 %195 to i32
  %198 = shl i32 %.tr551.i, 4
  %199 = sext i32 %198 to i64
  %200 = add nsw i64 %199, %178
  %.fr580.i = freeze i1 %196
  br i1 %.fr580.i, label %.preheader560.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader560.i
  %.tr607.i = trunc i64 %195 to i32
  %201 = shl i32 %.tr607.i, 5
  %202 = add i32 %201, 1024
  %scevgep601.i = getelementptr i8, ptr addrspace(3) %176, i32 %202
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep601.i, i8 0, i32 32, i1 false)
  br label %.split579.us.i

.preheader560.split.preheader.i:                  ; preds = %.preheader560.i
  br i1 %179, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader560.split.preheader.i
  %203 = trunc i64 %197 to i32
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %203
  store i16 0, ptr addrspace(3) %204, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split579.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %205 = add nuw nsw i64 %195, 1
  %exitcond603.not.i = icmp eq i64 %205, 16
  br i1 %exitcond603.not.i, label %.lr.ph582.i, label %.preheader560.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader560.split.preheader.i
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %200
  %.sroa.0232.0.copyload.i = load i16, ptr %206, align 32, !tbaa.struct !25
  %207 = trunc i64 %197 to i32
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %207
  store i16 %.sroa.0232.0.copyload.i, ptr addrspace(3) %208, align 2, !tbaa.struct !25
  br i1 %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %209 = trunc i64 %197 to i32
  %210 = or disjoint i32 %209, 1
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %210
  store i16 0, ptr addrspace(3) %211, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %212 = or disjoint i64 %200, 1
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %212
  %.sroa.0232.0.copyload.1.i = load i16, ptr %213, align 2, !tbaa.struct !25
  %214 = trunc i64 %197 to i32
  %215 = or disjoint i32 %214, 1
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %215
  store i16 %.sroa.0232.0.copyload.1.i, ptr addrspace(3) %216, align 2, !tbaa.struct !25
  br i1 %181, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %217 = trunc i64 %197 to i32
  %218 = or disjoint i32 %217, 2
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %218
  store i16 0, ptr addrspace(3) %219, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %220 = or disjoint i64 %200, 2
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %220
  %.sroa.0232.0.copyload.2.i = load i16, ptr %221, align 4, !tbaa.struct !25
  %222 = trunc i64 %197 to i32
  %223 = or disjoint i32 %222, 2
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %223
  store i16 %.sroa.0232.0.copyload.2.i, ptr addrspace(3) %224, align 2, !tbaa.struct !25
  br i1 %182, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %225 = trunc i64 %197 to i32
  %226 = or disjoint i32 %225, 3
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %226
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %228 = or disjoint i64 %200, 3
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %228
  %.sroa.0232.0.copyload.3.i = load i16, ptr %229, align 2, !tbaa.struct !25
  %230 = trunc i64 %197 to i32
  %231 = or disjoint i32 %230, 3
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %231
  store i16 %.sroa.0232.0.copyload.3.i, ptr addrspace(3) %232, align 2, !tbaa.struct !25
  br i1 %183, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %233 = trunc i64 %197 to i32
  %234 = or disjoint i32 %233, 4
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %234
  store i16 0, ptr addrspace(3) %235, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %236 = or disjoint i64 %200, 4
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %236
  %.sroa.0232.0.copyload.4.i = load i16, ptr %237, align 8, !tbaa.struct !25
  %238 = trunc i64 %197 to i32
  %239 = or disjoint i32 %238, 4
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %239
  store i16 %.sroa.0232.0.copyload.4.i, ptr addrspace(3) %240, align 2, !tbaa.struct !25
  br i1 %184, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %241 = trunc i64 %197 to i32
  %242 = or disjoint i32 %241, 5
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %242
  store i16 0, ptr addrspace(3) %243, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %244 = or disjoint i64 %200, 5
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %244
  %.sroa.0232.0.copyload.5.i = load i16, ptr %245, align 2, !tbaa.struct !25
  %246 = trunc i64 %197 to i32
  %247 = or disjoint i32 %246, 5
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %247
  store i16 %.sroa.0232.0.copyload.5.i, ptr addrspace(3) %248, align 2, !tbaa.struct !25
  br i1 %185, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %249 = trunc i64 %197 to i32
  %250 = or disjoint i32 %249, 6
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %250
  store i16 0, ptr addrspace(3) %251, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %252 = or disjoint i64 %200, 6
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %252
  %.sroa.0232.0.copyload.6.i = load i16, ptr %253, align 4, !tbaa.struct !25
  %254 = trunc i64 %197 to i32
  %255 = or disjoint i32 %254, 6
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %255
  store i16 %.sroa.0232.0.copyload.6.i, ptr addrspace(3) %256, align 2, !tbaa.struct !25
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %257 = trunc i64 %197 to i32
  %258 = or disjoint i32 %257, 7
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %258
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %260 = or disjoint i64 %200, 7
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %260
  %.sroa.0232.0.copyload.7.i = load i16, ptr %261, align 2, !tbaa.struct !25
  %262 = trunc i64 %197 to i32
  %263 = or disjoint i32 %262, 7
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %263
  store i16 %.sroa.0232.0.copyload.7.i, ptr addrspace(3) %264, align 2, !tbaa.struct !25
  br i1 %187, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %265 = trunc i64 %197 to i32
  %266 = or disjoint i32 %265, 8
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %266
  store i16 0, ptr addrspace(3) %267, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %268 = or disjoint i64 %200, 8
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %268
  %.sroa.0232.0.copyload.8.i = load i16, ptr %269, align 16, !tbaa.struct !25
  %270 = trunc i64 %197 to i32
  %271 = or disjoint i32 %270, 8
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %271
  store i16 %.sroa.0232.0.copyload.8.i, ptr addrspace(3) %272, align 2, !tbaa.struct !25
  br i1 %188, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %273 = trunc i64 %197 to i32
  %274 = or disjoint i32 %273, 9
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %274
  store i16 0, ptr addrspace(3) %275, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %276 = or disjoint i64 %200, 9
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %276
  %.sroa.0232.0.copyload.9.i = load i16, ptr %277, align 2, !tbaa.struct !25
  %278 = trunc i64 %197 to i32
  %279 = or disjoint i32 %278, 9
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %279
  store i16 %.sroa.0232.0.copyload.9.i, ptr addrspace(3) %280, align 2, !tbaa.struct !25
  br i1 %189, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %281 = trunc i64 %197 to i32
  %282 = or disjoint i32 %281, 10
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %282
  store i16 0, ptr addrspace(3) %283, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %284 = or disjoint i64 %200, 10
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %284
  %.sroa.0232.0.copyload.10.i = load i16, ptr %285, align 4, !tbaa.struct !25
  %286 = trunc i64 %197 to i32
  %287 = or disjoint i32 %286, 10
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %287
  store i16 %.sroa.0232.0.copyload.10.i, ptr addrspace(3) %288, align 2, !tbaa.struct !25
  br i1 %190, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %289 = trunc i64 %197 to i32
  %290 = or disjoint i32 %289, 11
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %290
  store i16 0, ptr addrspace(3) %291, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %292 = or disjoint i64 %200, 11
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %292
  %.sroa.0232.0.copyload.11.i = load i16, ptr %293, align 2, !tbaa.struct !25
  %294 = trunc i64 %197 to i32
  %295 = or disjoint i32 %294, 11
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %295
  store i16 %.sroa.0232.0.copyload.11.i, ptr addrspace(3) %296, align 2, !tbaa.struct !25
  br i1 %191, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %297 = trunc i64 %197 to i32
  %298 = or disjoint i32 %297, 12
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %298
  store i16 0, ptr addrspace(3) %299, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %300 = or disjoint i64 %200, 12
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %300
  %.sroa.0232.0.copyload.12.i = load i16, ptr %301, align 8, !tbaa.struct !25
  %302 = trunc i64 %197 to i32
  %303 = or disjoint i32 %302, 12
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %303
  store i16 %.sroa.0232.0.copyload.12.i, ptr addrspace(3) %304, align 2, !tbaa.struct !25
  br i1 %192, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %305 = trunc i64 %197 to i32
  %306 = or disjoint i32 %305, 13
  %307 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %306
  store i16 0, ptr addrspace(3) %307, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %308 = or disjoint i64 %200, 13
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %308
  %.sroa.0232.0.copyload.13.i = load i16, ptr %309, align 2, !tbaa.struct !25
  %310 = trunc i64 %197 to i32
  %311 = or disjoint i32 %310, 13
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %311
  store i16 %.sroa.0232.0.copyload.13.i, ptr addrspace(3) %312, align 2, !tbaa.struct !25
  br i1 %193, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %313 = trunc i64 %197 to i32
  %314 = or disjoint i32 %313, 14
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %314
  store i16 0, ptr addrspace(3) %315, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %316 = or disjoint i64 %200, 14
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %316
  %.sroa.0232.0.copyload.14.i = load i16, ptr %317, align 4, !tbaa.struct !25
  %318 = trunc i64 %197 to i32
  %319 = or disjoint i32 %318, 14
  %320 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %319
  store i16 %.sroa.0232.0.copyload.14.i, ptr addrspace(3) %320, align 2, !tbaa.struct !25
  br i1 %194, label %321, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

321:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %322 = or disjoint i64 %200, 15
  %323 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %322
  %.sroa.0232.0.copyload.15.i = load i16, ptr %323, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %321, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0234.2.15.i = phi i16 [ %.sroa.0232.0.copyload.15.i, %321 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %324 = trunc i64 %197 to i32
  %325 = or disjoint i32 %324, 15
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %177, i32 %325
  store i16 %.sroa.0234.2.15.i, ptr addrspace(3) %326, align 2, !tbaa.struct !25
  br label %.split579.us.i

.lr.ph582.i:                                      ; preds = %.split579.us.i, %167, %._crit_edge577.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %327 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %328 = icmp eq i64 %327, 0
  call void @llvm.assume(i1 %328)
  %329 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %330 = icmp ult i64 %329, 5
  call void @llvm.assume(i1 %330)
  %331 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %332 = icmp ult i64 %331, 3
  call void @llvm.assume(i1 %332)
  %333 = mul nuw nsw i64 %331, 5
  %334 = add nuw nsw i64 %333, %329
  %335 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %336 = inttoptr i32 %335 to ptr addrspace(3)
  %337 = getelementptr inbounds i8, ptr addrspace(3) %336, i32 1024
  %338 = getelementptr inbounds i8, ptr addrspace(3) %336, i32 1536
  br label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i

.lr.ph585.i:                                      ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %339 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %340 = icmp eq i64 %339, 0
  call void @llvm.assume(i1 %340)
  %341 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %342 = icmp ult i64 %341, 5
  call void @llvm.assume(i1 %342)
  %343 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %344 = icmp ult i64 %343, 3
  call void @llvm.assume(i1 %344)
  %345 = mul nuw nsw i64 %343, 5
  %346 = add nuw nsw i64 %345, %341
  %347 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = getelementptr inbounds i8, ptr addrspace(3) %348, i32 768
  %350 = getelementptr inbounds i8, ptr addrspace(3) %348, i32 1536
  br label %367

_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i: ; preds = %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i, %.lr.ph582.i
  %351 = phi i64 [ %334, %.lr.ph582.i ], [ %362, %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i ]
  %352 = shl i64 %351, 4
  %353 = and i64 %352, 240
  %354 = lshr i64 %351, 4
  %355 = and i64 %354, 15
  %356 = or disjoint i64 %353, %355
  %357 = trunc i64 %356 to i32
  %358 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %337, i32 %357
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %358, align 2, !tbaa.struct !25
  %359 = trunc i64 %351 to i32
  %360 = and i32 %359, 255
  %361 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %338, i32 %360
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %361, align 2, !tbaa.struct !25
  %362 = add nuw nsw i64 %351, 15
  %363 = icmp ult i64 %351, 241
  br i1 %363, label %_Z34triton_sycl_single_lane_half_storeP27triton_sycl_float16_storageILi10ELi15EES0_m.exit16.i.i.i, label %.lr.ph585.i, !llvm.loop !33

._crit_edge586.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %364 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %365 = icmp ult i64 %364, 3
  call void @llvm.assume(i1 %365)
  %366 = icmp eq i64 %364, 0
  br i1 %366, label %431, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

367:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph585.i
  %368 = phi i64 [ %346, %.lr.ph585.i ], [ %376, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %.frozen.i = freeze i64 %368
  %369 = sdiv i64 %.frozen.i, 16
  %370 = srem i64 %369, 8
  %371 = mul i64 %369, 16
  %.decomposed.i = sub i64 %.frozen.i, %371
  %372 = shl nsw i64 %370, 4
  %srem.i = srem i64 %368, 128
  %373 = trunc i64 %srem.i to i32
  %374 = getelementptr inbounds float, ptr addrspace(3) %348, i32 %373
  %375 = load float, ptr addrspace(3) %374, align 4, !tbaa !19
  br label %378

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %429, ptr addrspace(3) %374, align 4, !tbaa !19
  %376 = add i64 %368, 15
  %377 = icmp slt i64 %376, 128
  br i1 %377, label %367, label %._crit_edge586.i, !llvm.loop !34

378:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %367
  %379 = phi i64 [ 0, %367 ], [ %430, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %380 = phi float [ %375, %367 ], [ %429, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %381 = add nuw nsw i64 %379, %372
  %382 = trunc i64 %381 to i32
  %383 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %349, i32 %382
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %383, align 2, !tbaa.struct !25
  %384 = shl nuw nsw i64 %379, 4
  %385 = add nsw i64 %384, %.decomposed.i
  %386 = trunc i64 %385 to i32
  %387 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %350, i32 %386
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %387, align 2, !tbaa.struct !25
  %388 = zext i16 %.sroa.0189.0.copyload.i to i32
  %389 = lshr i32 %388, 10
  %390 = and i32 %389, 31
  %391 = and i32 %388, 1023
  switch i32 %390, label %397 [
    i32 31, label %392
    i32 0, label %399
  ]

392:                                              ; preds = %378
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %393 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %391, 0
  %394 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %395 = or disjoint i32 %394, %393
  %396 = bitcast i32 %395 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

397:                                              ; preds = %378
  %398 = or disjoint i32 %391, 1024
  br label %399

399:                                              ; preds = %397, %378
  %400 = phi i32 [ %398, %397 ], [ %391, %378 ]
  %401 = uitofp i32 %400 to float
  %.not.i = icmp eq i32 %390, 0
  %402 = add nsw i32 %390, -25
  %403 = select i1 %.not.i, i32 -24, i32 %402
  %404 = call float @__ocml_ldexp_f32(float noundef %401, i32 noundef %403) #6
  %405 = fneg contract float %404
  %.not543544.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %406 = select contract i1 %.not543544.i, float %405, float %404
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %399, %392
  %407 = phi float [ %396, %392 ], [ %406, %399 ]
  %408 = zext i16 %.sroa.0180.0.copyload.i to i32
  %409 = lshr i32 %408, 10
  %410 = and i32 %409, 31
  %411 = and i32 %408, 1023
  switch i32 %410, label %417 [
    i32 31, label %412
    i32 0, label %419
  ]

412:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %413 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %411, 0
  %414 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %415 = or disjoint i32 %414, %413
  %416 = bitcast i32 %415 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

417:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %418 = or disjoint i32 %411, 1024
  br label %419

419:                                              ; preds = %417, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %420 = phi i32 [ %418, %417 ], [ %411, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %421 = uitofp i32 %420 to float
  %.not545.i = icmp eq i32 %410, 0
  %422 = add nsw i32 %410, -25
  %423 = select i1 %.not545.i, i32 -24, i32 %422
  %424 = call float @__ocml_ldexp_f32(float noundef %421, i32 noundef %423) #6
  %425 = fneg contract float %424
  %.not546547.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %426 = select contract i1 %.not546547.i, float %425, float %424
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %419, %412
  %427 = phi float [ %416, %412 ], [ %426, %419 ]
  %428 = fmul contract float %407, %427
  %429 = fadd contract float %380, %428
  %430 = add nuw nsw i64 %379, 1
  %exitcond604.not.i = icmp eq i64 %430, 16
  br i1 %exitcond604.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %378, !llvm.loop !35

431:                                              ; preds = %._crit_edge586.i
  %432 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %433 = icmp ult i64 %432, 5
  call void @llvm.assume(i1 %433)
  %434 = icmp eq i64 %432, 0
  br i1 %434, label %435, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

435:                                              ; preds = %431
  %436 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %437 = icmp eq i64 %436, 0
  call void @llvm.assume(i1 %437)
  %438 = sext i32 %3 to i64
  %439 = call i32 @llvm.amdgcn.groupstaticsize()
  %440 = inttoptr i32 %439 to ptr addrspace(3)
  %441 = sext i32 %40 to i64
  %442 = icmp sgt i32 %4, 0
  %443 = icmp ugt i32 %4, 1
  %444 = icmp ugt i32 %4, 2
  %445 = icmp ugt i32 %4, 3
  %446 = icmp ugt i32 %4, 4
  %447 = icmp ugt i32 %4, 5
  %448 = icmp ugt i32 %4, 6
  %449 = icmp ugt i32 %4, 7
  %450 = icmp ugt i32 %4, 8
  %451 = icmp ugt i32 %4, 9
  %452 = icmp ugt i32 %4, 10
  %453 = icmp ugt i32 %4, 11
  %454 = icmp ugt i32 %4, 12
  %455 = icmp ugt i32 %4, 13
  %456 = icmp ugt i32 %4, 14
  %457 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split588.us.i, %435
  %458 = phi i64 [ 0, %435 ], [ %464, %.split588.us.i ]
  %459 = icmp slt i64 %458, %438
  %460 = shl i64 %458, 4
  %.tr542.i = trunc i64 %458 to i32
  %461 = shl i32 %.tr542.i, 4
  %462 = sext i32 %461 to i64
  %463 = add nsw i64 %462, %441
  %.fr589.i = freeze i1 %459
  %brmerge.not.i = select i1 %.fr589.i, i1 %442, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split588.us.i

.split588.us.i:                                   ; preds = %553, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %464 = add nuw nsw i64 %458, 1
  %exitcond606.not.i = icmp eq i64 %464, 8
  br i1 %exitcond606.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %465 = trunc i64 %460 to i32
  %466 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %465
  %467 = load float, ptr addrspace(3) %466, align 4, !tbaa !19
  %468 = getelementptr inbounds float, ptr %9, i64 %463
  store float %467, ptr %468, align 32, !tbaa !19
  br i1 %443, label %.preheader.split.2.i, label %.split588.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %469 = trunc i64 %460 to i32
  %470 = or disjoint i32 %469, 1
  %471 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %470
  %472 = load float, ptr addrspace(3) %471, align 4, !tbaa !19
  %473 = or disjoint i64 %463, 1
  %474 = getelementptr inbounds float, ptr %9, i64 %473
  store float %472, ptr %474, align 4, !tbaa !19
  br i1 %444, label %.preheader.split.3.i, label %.split588.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %475 = trunc i64 %460 to i32
  %476 = or disjoint i32 %475, 2
  %477 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !19
  %479 = or disjoint i64 %463, 2
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 8, !tbaa !19
  br i1 %445, label %.preheader.split.4.i, label %.split588.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %481 = trunc i64 %460 to i32
  %482 = or disjoint i32 %481, 3
  %483 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !19
  %485 = or disjoint i64 %463, 3
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 4, !tbaa !19
  br i1 %446, label %.preheader.split.5.i, label %.split588.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %487 = trunc i64 %460 to i32
  %488 = or disjoint i32 %487, 4
  %489 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !19
  %491 = or disjoint i64 %463, 4
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 16, !tbaa !19
  br i1 %447, label %.preheader.split.6.i, label %.split588.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %493 = trunc i64 %460 to i32
  %494 = or disjoint i32 %493, 5
  %495 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !19
  %497 = or disjoint i64 %463, 5
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 4, !tbaa !19
  br i1 %448, label %.preheader.split.7.i, label %.split588.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %499 = trunc i64 %460 to i32
  %500 = or disjoint i32 %499, 6
  %501 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %500
  %502 = load float, ptr addrspace(3) %501, align 4, !tbaa !19
  %503 = or disjoint i64 %463, 6
  %504 = getelementptr inbounds float, ptr %9, i64 %503
  store float %502, ptr %504, align 8, !tbaa !19
  br i1 %449, label %.preheader.split.8.i, label %.split588.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %505 = trunc i64 %460 to i32
  %506 = or disjoint i32 %505, 7
  %507 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %506
  %508 = load float, ptr addrspace(3) %507, align 4, !tbaa !19
  %509 = or disjoint i64 %463, 7
  %510 = getelementptr inbounds float, ptr %9, i64 %509
  store float %508, ptr %510, align 4, !tbaa !19
  br i1 %450, label %.preheader.split.9.i, label %.split588.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %511 = trunc i64 %460 to i32
  %512 = or disjoint i32 %511, 8
  %513 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %512
  %514 = load float, ptr addrspace(3) %513, align 4, !tbaa !19
  %515 = or disjoint i64 %463, 8
  %516 = getelementptr inbounds float, ptr %9, i64 %515
  store float %514, ptr %516, align 32, !tbaa !19
  br i1 %451, label %.preheader.split.10.i, label %.split588.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %517 = trunc i64 %460 to i32
  %518 = or disjoint i32 %517, 9
  %519 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %518
  %520 = load float, ptr addrspace(3) %519, align 4, !tbaa !19
  %521 = or disjoint i64 %463, 9
  %522 = getelementptr inbounds float, ptr %9, i64 %521
  store float %520, ptr %522, align 4, !tbaa !19
  br i1 %452, label %.preheader.split.11.i, label %.split588.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %523 = trunc i64 %460 to i32
  %524 = or disjoint i32 %523, 10
  %525 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !19
  %527 = or disjoint i64 %463, 10
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 8, !tbaa !19
  br i1 %453, label %.preheader.split.12.i, label %.split588.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %529 = trunc i64 %460 to i32
  %530 = or disjoint i32 %529, 11
  %531 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %530
  %532 = load float, ptr addrspace(3) %531, align 4, !tbaa !19
  %533 = or disjoint i64 %463, 11
  %534 = getelementptr inbounds float, ptr %9, i64 %533
  store float %532, ptr %534, align 4, !tbaa !19
  br i1 %454, label %.preheader.split.13.i, label %.split588.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %535 = trunc i64 %460 to i32
  %536 = or disjoint i32 %535, 12
  %537 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %536
  %538 = load float, ptr addrspace(3) %537, align 4, !tbaa !19
  %539 = or disjoint i64 %463, 12
  %540 = getelementptr inbounds float, ptr %9, i64 %539
  store float %538, ptr %540, align 16, !tbaa !19
  br i1 %455, label %.preheader.split.14.i, label %.split588.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %541 = trunc i64 %460 to i32
  %542 = or disjoint i32 %541, 13
  %543 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %542
  %544 = load float, ptr addrspace(3) %543, align 4, !tbaa !19
  %545 = or disjoint i64 %463, 13
  %546 = getelementptr inbounds float, ptr %9, i64 %545
  store float %544, ptr %546, align 4, !tbaa !19
  br i1 %456, label %.preheader.split.15.i, label %.split588.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %547 = trunc i64 %460 to i32
  %548 = or disjoint i32 %547, 14
  %549 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %548
  %550 = load float, ptr addrspace(3) %549, align 4, !tbaa !19
  %551 = or disjoint i64 %463, 14
  %552 = getelementptr inbounds float, ptr %9, i64 %551
  store float %550, ptr %552, align 8, !tbaa !19
  br i1 %457, label %553, label %.split588.us.i

553:                                              ; preds = %.preheader.split.15.i
  %554 = trunc i64 %460 to i32
  %555 = or disjoint i32 %554, 15
  %556 = getelementptr inbounds float, ptr addrspace(3) %440, i32 %555
  %557 = load float, ptr addrspace(3) %556, align 4, !tbaa !19
  %558 = or disjoint i64 %463, 15
  %559 = getelementptr inbounds float, ptr %9, i64 %558
  store float %557, ptr %559, align 4, !tbaa !19
  br label %.split588.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge586.i, %431, %.split588.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="15,15" }
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
