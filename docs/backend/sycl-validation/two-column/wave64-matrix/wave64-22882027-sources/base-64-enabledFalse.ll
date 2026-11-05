;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882027/tmp/triton-sycl-cache/compile-hbvod7l6/kernel.cpp"
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
  br i1 %40, label %46, label %.lr.ph565.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

46:                                               ; preds = %._crit_edge.i
  %47 = shl i32 %.tr.i, 8
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
  br label %.preheader558.i

.preheader558.i:                                  ; preds = %.split.us.i, %46
  %65 = phi i64 [ 0, %46 ], [ %75, %.split.us.i ]
  %66 = icmp slt i64 %65, %52
  %67 = shl i64 %65, 3
  %.tr552.i = trunc i64 %65 to i32
  %68 = shl i32 %.tr552.i, 3
  %69 = sext i32 %68 to i64
  %70 = add nsw i64 %69, %56
  %.fr.i = freeze i1 %66
  br i1 %.fr.i, label %.preheader558.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader558.i
  %.tr589.i = trunc i64 %65 to i32
  %71 = shl i32 %.tr589.i, 4
  %72 = add i32 %71, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %54, i32 %72
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader558.split.preheader.i:                  ; preds = %.preheader558.i
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader558.split.preheader.i
  %73 = trunc i64 %67 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %73
  store i16 0, ptr addrspace(3) %74, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %75 = add nuw nsw i64 %65, 1
  %exitcond.not.i = icmp eq i64 %75, 32
  br i1 %exitcond.not.i, label %.lr.ph565.i, label %.preheader558.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader558.split.preheader.i
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0269.0.copyload.i = load i16, ptr %76, align 16, !tbaa.struct !25
  %77 = trunc i64 %67 to i32
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %77
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %78, align 2, !tbaa.struct !25
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i
  %79 = trunc i64 %67 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %80
  store i16 0, ptr addrspace(3) %81, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  %82 = or disjoint i64 %70, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0269.0.copyload.1.i = load i16, ptr %83, align 2, !tbaa.struct !25
  %84 = trunc i64 %67 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %85
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %86, align 2, !tbaa.struct !25
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i
  %87 = trunc i64 %67 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i
  %90 = or disjoint i64 %70, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0269.0.copyload.2.i = load i16, ptr %91, align 4, !tbaa.struct !25
  %92 = trunc i64 %67 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %93
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %94, align 2, !tbaa.struct !25
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i
  %95 = trunc i64 %67 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i
  %98 = or disjoint i64 %70, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0269.0.copyload.3.i = load i16, ptr %99, align 2, !tbaa.struct !25
  %100 = trunc i64 %67 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %101
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %102, align 2, !tbaa.struct !25
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i
  %103 = trunc i64 %67 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i
  %106 = or disjoint i64 %70, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0269.0.copyload.4.i = load i16, ptr %107, align 8, !tbaa.struct !25
  %108 = trunc i64 %67 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %109
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i
  %111 = trunc i64 %67 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i
  %114 = or disjoint i64 %70, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0269.0.copyload.5.i = load i16, ptr %115, align 2, !tbaa.struct !25
  %116 = trunc i64 %67 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %117
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %118, align 2, !tbaa.struct !25
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i
  %119 = trunc i64 %67 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i
  %122 = or disjoint i64 %70, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0269.0.copyload.6.i = load i16, ptr %123, align 4, !tbaa.struct !25
  %124 = trunc i64 %67 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %125
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %126, align 2, !tbaa.struct !25
  br i1 %64, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

127:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i
  %128 = or disjoint i64 %70, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0269.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i: ; preds = %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %127 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i ]
  %130 = trunc i64 %67 to i32
  %131 = or disjoint i32 %130, 7
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %131
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !25
  br label %.split.us.i

.lr.ph565.i:                                      ; preds = %.split.us.i, %._crit_edge.i
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
  %142 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge566.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  br i1 %145, label %157, label %.lr.ph571.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph565.i
  %146 = phi i64 [ %137, %.lr.ph565.i ], [ %155, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %147 = lshr i64 %146, 5
  %148 = shl nuw nsw i64 %146, 3
  %149 = and i64 %148, 248
  %150 = or disjoint i64 %149, %147
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %151
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !25
  %153 = trunc i64 %146 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %153
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %154, align 2, !tbaa.struct !25
  %155 = add nuw nsw i64 %146, 64
  %156 = icmp ult i64 %146, 192
  br i1 %156, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge566.i, !llvm.loop !31

157:                                              ; preds = %._crit_edge566.i
  %158 = shl i32 %.tr.i, 9
  %159 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %160 = icmp eq i64 %159, 0
  call void @llvm.assume(i1 %160)
  %161 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %162 = icmp eq i64 %161, 0
  call void @llvm.assume(i1 %162)
  %163 = sext i32 %4 to i64
  %164 = sext i32 %5 to i64
  %165 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %166 = inttoptr i32 %165 to ptr addrspace(3)
  %167 = getelementptr inbounds i8, ptr addrspace(3) %166, i32 1536
  %168 = sext i32 %158 to i64
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split568.us.i, %157
  %169 = phi i64 [ 0, %157 ], [ %177, %.split568.us.i ]
  %170 = icmp slt i64 %169, %163
  %171 = shl i64 %169, 5
  %.tr551.i = trunc i64 %169 to i32
  %172 = shl i32 %.tr551.i, 5
  %173 = sext i32 %172 to i64
  %174 = add nsw i64 %173, %168
  %.fr569.i = freeze i1 %170
  br i1 %.fr569.i, label %.preheader557.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr588.i = trunc i64 %169 to i32
  %175 = shl i32 %.tr588.i, 6
  %176 = add i32 %175, 1536
  %scevgep582.i = getelementptr i8, ptr addrspace(3) %166, i32 %176
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep582.i, i8 0, i32 64, i1 false)
  br label %.split568.us.i

.split568.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %177 = add nuw nsw i64 %169, 1
  %exitcond584.not.i = icmp eq i64 %177, 16
  br i1 %exitcond584.not.i, label %.lr.ph571.i, label %.preheader557.i, !llvm.loop !32

.preheader557.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader557.i
  %178 = phi i64 [ %186, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader557.i ]
  %179 = icmp slt i64 %178, %164
  br i1 %179, label %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

180:                                              ; preds = %.preheader557.split.i
  %181 = add nuw nsw i64 %174, %178
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %181
  %.sroa.0232.0.copyload.i = load i16, ptr %182, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %180, %.preheader557.split.i
  %.sroa.0234.2.i = phi i16 [ %.sroa.0232.0.copyload.i, %180 ], [ 0, %.preheader557.split.i ]
  %183 = add nuw nsw i64 %178, %171
  %184 = trunc i64 %183 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %167, i32 %184
  store i16 %.sroa.0234.2.i, ptr addrspace(3) %185, align 2, !tbaa.struct !25
  %186 = add nuw nsw i64 %178, 1
  %exitcond583.not.i = icmp eq i64 %186, 32
  br i1 %exitcond583.not.i, label %.split568.us.i, label %.preheader557.split.i, !llvm.loop !33

.lr.ph571.i:                                      ; preds = %.split568.us.i, %._crit_edge566.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %187 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %188 = icmp eq i64 %187, 0
  call void @llvm.assume(i1 %188)
  %189 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %190 = icmp eq i64 %189, 0
  call void @llvm.assume(i1 %190)
  %191 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %192 = icmp ult i64 %191, 64
  call void @llvm.assume(i1 %192)
  %193 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %194 = inttoptr i32 %193 to ptr addrspace(3)
  %195 = getelementptr inbounds i8, ptr addrspace(3) %194, i32 1536
  %196 = getelementptr inbounds i8, ptr addrspace(3) %194, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph574.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %197 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %198 = icmp eq i64 %197, 0
  call void @llvm.assume(i1 %198)
  %199 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %200 = icmp eq i64 %199, 0
  call void @llvm.assume(i1 %200)
  %201 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %202 = icmp ult i64 %201, 64
  call void @llvm.assume(i1 %202)
  %203 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %204 = inttoptr i32 %203 to ptr addrspace(3)
  %205 = getelementptr inbounds i8, ptr addrspace(3) %204, i32 1024
  %206 = getelementptr inbounds i8, ptr addrspace(3) %204, i32 2560
  %207 = and i64 %201, 15
  br label %222

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph571.i
  %208 = phi i64 [ %191, %.lr.ph571.i ], [ %217, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %209 = lshr i64 %208, 4
  %210 = shl nuw nsw i64 %208, 5
  %211 = and i64 %210, 480
  %212 = or disjoint i64 %211, %209
  %213 = trunc i64 %212 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %195, i32 %213
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %214, align 2, !tbaa.struct !25
  %215 = trunc i64 %208 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %196, i32 %215
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %216, align 2, !tbaa.struct !25
  %217 = add nuw nsw i64 %208, 64
  %218 = icmp ult i64 %208, 448
  br i1 %218, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph574.i, !llvm.loop !34

._crit_edge575.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %219 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %220 = icmp ult i64 %219, 64
  call void @llvm.assume(i1 %220)
  %221 = icmp eq i64 %219, 0
  br i1 %221, label %284, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

222:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph574.i
  %223 = phi i64 [ %201, %.lr.ph574.i ], [ %229, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %224 = trunc i64 %223 to i32
  %225 = getelementptr inbounds float, ptr addrspace(3) %204, i32 %224
  %226 = load float, ptr addrspace(3) %225, align 4, !tbaa !19
  %227 = shl nuw nsw i64 %223, 1
  %228 = and i64 %227, 224
  br label %231

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %282, ptr addrspace(3) %225, align 4, !tbaa !19
  %229 = add nuw nsw i64 %223, 64
  %230 = icmp ult i64 %223, 64
  br i1 %230, label %222, label %._crit_edge575.i, !llvm.loop !35

231:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %222
  %232 = phi i64 [ 0, %222 ], [ %283, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %233 = phi float [ %226, %222 ], [ %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %234 = add nuw nsw i64 %232, %228
  %235 = trunc i64 %234 to i32
  %236 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %205, i32 %235
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %236, align 2, !tbaa.struct !25
  %237 = shl nuw nsw i64 %232, 4
  %238 = or disjoint i64 %237, %207
  %239 = trunc i64 %238 to i32
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %206, i32 %239
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %240, align 2, !tbaa.struct !25
  %241 = zext i16 %.sroa.0189.0.copyload.i to i32
  %242 = lshr i32 %241, 10
  %243 = and i32 %242, 31
  %244 = and i32 %241, 1023
  switch i32 %243, label %250 [
    i32 31, label %245
    i32 0, label %252
  ]

245:                                              ; preds = %231
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %246 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %244, 0
  %247 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %248 = or disjoint i32 %247, %246
  %249 = bitcast i32 %248 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

250:                                              ; preds = %231
  %251 = or disjoint i32 %244, 1024
  br label %252

252:                                              ; preds = %250, %231
  %253 = phi i32 [ %251, %250 ], [ %244, %231 ]
  %254 = uitofp i32 %253 to float
  %.not.i = icmp eq i32 %243, 0
  %255 = add nsw i32 %243, -25
  %256 = select i1 %.not.i, i32 -24, i32 %255
  %257 = call float @__ocml_ldexp_f32(float noundef %254, i32 noundef %256) #6
  %258 = fneg contract float %257
  %.not544545.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %259 = select contract i1 %.not544545.i, float %258, float %257
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %252, %245
  %260 = phi float [ %249, %245 ], [ %259, %252 ]
  %261 = zext i16 %.sroa.0180.0.copyload.i to i32
  %262 = lshr i32 %261, 10
  %263 = and i32 %262, 31
  %264 = and i32 %261, 1023
  switch i32 %263, label %270 [
    i32 31, label %265
    i32 0, label %272
  ]

265:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %266 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %264, 0
  %267 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %268 = or disjoint i32 %267, %266
  %269 = bitcast i32 %268 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

270:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %271 = or disjoint i32 %264, 1024
  br label %272

272:                                              ; preds = %270, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %273 = phi i32 [ %271, %270 ], [ %264, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %274 = uitofp i32 %273 to float
  %.not546.i = icmp eq i32 %263, 0
  %275 = add nsw i32 %263, -25
  %276 = select i1 %.not546.i, i32 -24, i32 %275
  %277 = call float @__ocml_ldexp_f32(float noundef %274, i32 noundef %276) #6
  %278 = fneg contract float %277
  %.not547548.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %279 = select contract i1 %.not547548.i, float %278, float %277
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %272, %265
  %280 = phi float [ %269, %265 ], [ %279, %272 ]
  %281 = fmul contract float %260, %280
  %282 = fadd contract float %233, %281
  %283 = add nuw nsw i64 %232, 1
  %exitcond585.not.i = icmp eq i64 %283, 32
  br i1 %exitcond585.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %231, !llvm.loop !36

284:                                              ; preds = %._crit_edge575.i
  %285 = shl nuw i32 %.tr.i, 7
  %286 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %287 = icmp eq i64 %286, 0
  call void @llvm.assume(i1 %287)
  %288 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %289 = icmp eq i64 %288, 0
  call void @llvm.assume(i1 %289)
  %290 = sext i32 %3 to i64
  %291 = call i32 @llvm.amdgcn.groupstaticsize()
  %292 = inttoptr i32 %291 to ptr addrspace(3)
  %293 = sext i32 %285 to i64
  %294 = icmp sgt i32 %4, 0
  %295 = icmp ugt i32 %4, 1
  %296 = icmp ugt i32 %4, 2
  %297 = icmp ugt i32 %4, 3
  %298 = icmp ugt i32 %4, 4
  %299 = icmp ugt i32 %4, 5
  %300 = icmp ugt i32 %4, 6
  %301 = icmp ugt i32 %4, 7
  %302 = icmp ugt i32 %4, 8
  %303 = icmp ugt i32 %4, 9
  %304 = icmp ugt i32 %4, 10
  %305 = icmp ugt i32 %4, 11
  %306 = icmp ugt i32 %4, 12
  %307 = icmp ugt i32 %4, 13
  %308 = icmp ugt i32 %4, 14
  %309 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split577.us.i, %284
  %310 = phi i64 [ 0, %284 ], [ %316, %.split577.us.i ]
  %311 = icmp slt i64 %310, %290
  %312 = shl i64 %310, 4
  %.tr543.i = trunc i64 %310 to i32
  %313 = shl i32 %.tr543.i, 4
  %314 = sext i32 %313 to i64
  %315 = add nsw i64 %314, %293
  %.fr578.i = freeze i1 %311
  %brmerge.not.i = select i1 %.fr578.i, i1 %294, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split577.us.i

.split577.us.i:                                   ; preds = %405, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %316 = add nuw nsw i64 %310, 1
  %exitcond587.not.i = icmp eq i64 %316, 8
  br i1 %exitcond587.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %317 = trunc i64 %312 to i32
  %318 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %317
  %319 = load float, ptr addrspace(3) %318, align 4, !tbaa !19
  %320 = getelementptr inbounds float, ptr %9, i64 %315
  store float %319, ptr %320, align 32, !tbaa !19
  br i1 %295, label %.preheader.split.2.i, label %.split577.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %321 = trunc i64 %312 to i32
  %322 = or disjoint i32 %321, 1
  %323 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %322
  %324 = load float, ptr addrspace(3) %323, align 4, !tbaa !19
  %325 = or disjoint i64 %315, 1
  %326 = getelementptr inbounds float, ptr %9, i64 %325
  store float %324, ptr %326, align 4, !tbaa !19
  br i1 %296, label %.preheader.split.3.i, label %.split577.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %327 = trunc i64 %312 to i32
  %328 = or disjoint i32 %327, 2
  %329 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %328
  %330 = load float, ptr addrspace(3) %329, align 4, !tbaa !19
  %331 = or disjoint i64 %315, 2
  %332 = getelementptr inbounds float, ptr %9, i64 %331
  store float %330, ptr %332, align 8, !tbaa !19
  br i1 %297, label %.preheader.split.4.i, label %.split577.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %333 = trunc i64 %312 to i32
  %334 = or disjoint i32 %333, 3
  %335 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %334
  %336 = load float, ptr addrspace(3) %335, align 4, !tbaa !19
  %337 = or disjoint i64 %315, 3
  %338 = getelementptr inbounds float, ptr %9, i64 %337
  store float %336, ptr %338, align 4, !tbaa !19
  br i1 %298, label %.preheader.split.5.i, label %.split577.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %339 = trunc i64 %312 to i32
  %340 = or disjoint i32 %339, 4
  %341 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %340
  %342 = load float, ptr addrspace(3) %341, align 4, !tbaa !19
  %343 = or disjoint i64 %315, 4
  %344 = getelementptr inbounds float, ptr %9, i64 %343
  store float %342, ptr %344, align 16, !tbaa !19
  br i1 %299, label %.preheader.split.6.i, label %.split577.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %345 = trunc i64 %312 to i32
  %346 = or disjoint i32 %345, 5
  %347 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %346
  %348 = load float, ptr addrspace(3) %347, align 4, !tbaa !19
  %349 = or disjoint i64 %315, 5
  %350 = getelementptr inbounds float, ptr %9, i64 %349
  store float %348, ptr %350, align 4, !tbaa !19
  br i1 %300, label %.preheader.split.7.i, label %.split577.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %351 = trunc i64 %312 to i32
  %352 = or disjoint i32 %351, 6
  %353 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %352
  %354 = load float, ptr addrspace(3) %353, align 4, !tbaa !19
  %355 = or disjoint i64 %315, 6
  %356 = getelementptr inbounds float, ptr %9, i64 %355
  store float %354, ptr %356, align 8, !tbaa !19
  br i1 %301, label %.preheader.split.8.i, label %.split577.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %357 = trunc i64 %312 to i32
  %358 = or disjoint i32 %357, 7
  %359 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %358
  %360 = load float, ptr addrspace(3) %359, align 4, !tbaa !19
  %361 = or disjoint i64 %315, 7
  %362 = getelementptr inbounds float, ptr %9, i64 %361
  store float %360, ptr %362, align 4, !tbaa !19
  br i1 %302, label %.preheader.split.9.i, label %.split577.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %363 = trunc i64 %312 to i32
  %364 = or disjoint i32 %363, 8
  %365 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %364
  %366 = load float, ptr addrspace(3) %365, align 4, !tbaa !19
  %367 = or disjoint i64 %315, 8
  %368 = getelementptr inbounds float, ptr %9, i64 %367
  store float %366, ptr %368, align 32, !tbaa !19
  br i1 %303, label %.preheader.split.10.i, label %.split577.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %369 = trunc i64 %312 to i32
  %370 = or disjoint i32 %369, 9
  %371 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %370
  %372 = load float, ptr addrspace(3) %371, align 4, !tbaa !19
  %373 = or disjoint i64 %315, 9
  %374 = getelementptr inbounds float, ptr %9, i64 %373
  store float %372, ptr %374, align 4, !tbaa !19
  br i1 %304, label %.preheader.split.11.i, label %.split577.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %375 = trunc i64 %312 to i32
  %376 = or disjoint i32 %375, 10
  %377 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %376
  %378 = load float, ptr addrspace(3) %377, align 4, !tbaa !19
  %379 = or disjoint i64 %315, 10
  %380 = getelementptr inbounds float, ptr %9, i64 %379
  store float %378, ptr %380, align 8, !tbaa !19
  br i1 %305, label %.preheader.split.12.i, label %.split577.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %381 = trunc i64 %312 to i32
  %382 = or disjoint i32 %381, 11
  %383 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %382
  %384 = load float, ptr addrspace(3) %383, align 4, !tbaa !19
  %385 = or disjoint i64 %315, 11
  %386 = getelementptr inbounds float, ptr %9, i64 %385
  store float %384, ptr %386, align 4, !tbaa !19
  br i1 %306, label %.preheader.split.13.i, label %.split577.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %387 = trunc i64 %312 to i32
  %388 = or disjoint i32 %387, 12
  %389 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %388
  %390 = load float, ptr addrspace(3) %389, align 4, !tbaa !19
  %391 = or disjoint i64 %315, 12
  %392 = getelementptr inbounds float, ptr %9, i64 %391
  store float %390, ptr %392, align 16, !tbaa !19
  br i1 %307, label %.preheader.split.14.i, label %.split577.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %393 = trunc i64 %312 to i32
  %394 = or disjoint i32 %393, 13
  %395 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %394
  %396 = load float, ptr addrspace(3) %395, align 4, !tbaa !19
  %397 = or disjoint i64 %315, 13
  %398 = getelementptr inbounds float, ptr %9, i64 %397
  store float %396, ptr %398, align 4, !tbaa !19
  br i1 %308, label %.preheader.split.15.i, label %.split577.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %399 = trunc i64 %312 to i32
  %400 = or disjoint i32 %399, 14
  %401 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %400
  %402 = load float, ptr addrspace(3) %401, align 4, !tbaa !19
  %403 = or disjoint i64 %315, 14
  %404 = getelementptr inbounds float, ptr %9, i64 %403
  store float %402, ptr %404, align 8, !tbaa !19
  br i1 %309, label %405, label %.split577.us.i

405:                                              ; preds = %.preheader.split.15.i
  %406 = trunc i64 %312 to i32
  %407 = or disjoint i32 %406, 15
  %408 = getelementptr inbounds float, ptr addrspace(3) %292, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !19
  %410 = or disjoint i64 %315, 15
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 4, !tbaa !19
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
!34 = distinct !{!34, !24, !29, !30}
!35 = distinct !{!35, !24}
!36 = distinct !{!36, !24}
!37 = distinct !{!37, !24}
;----------------- End AdaptiveCpp IR dump ---------------
