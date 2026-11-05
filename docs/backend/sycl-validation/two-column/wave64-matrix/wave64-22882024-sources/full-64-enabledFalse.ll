;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-b_st3frg/kernel.cpp"
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
  %39 = sext i32 %3 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = sext i32 %30 to i64
  %44 = icmp sgt i32 %5, 0
  %45 = icmp ugt i32 %5, 1
  %46 = icmp ugt i32 %5, 2
  %47 = icmp ugt i32 %5, 3
  %48 = icmp ugt i32 %5, 4
  %49 = icmp ugt i32 %5, 5
  %50 = icmp ugt i32 %5, 6
  %51 = icmp ugt i32 %5, 7
  %52 = icmp ugt i32 %5, 8
  %53 = icmp ugt i32 %5, 9
  %54 = icmp ugt i32 %5, 10
  %55 = icmp ugt i32 %5, 11
  %56 = icmp ugt i32 %5, 12
  %57 = icmp ugt i32 %5, 13
  %58 = icmp ugt i32 %5, 14
  %59 = icmp ugt i32 %5, 15
  br label %.preheader553.i

.preheader553.i:                                  ; preds = %.split.us.i, %34
  %60 = phi i64 [ 0, %34 ], [ %70, %.split.us.i ]
  %61 = icmp slt i64 %60, %39
  %62 = shl i64 %60, 4
  %.tr548.i = trunc i64 %60 to i32
  %63 = shl i32 %.tr548.i, 4
  %64 = sext i32 %63 to i64
  %65 = add nsw i64 %64, %43
  %.fr.i = freeze i1 %61
  br i1 %.fr.i, label %.preheader553.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.us.preheader.i: ; preds = %.preheader553.i
  %.tr568.i = trunc i64 %60 to i32
  %66 = shl i32 %.tr568.i, 5
  %67 = add i32 %66, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %67
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep.i, i8 0, i32 32, i1 false)
  br label %.split.us.i

.preheader553.split.preheader.i:                  ; preds = %.preheader553.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.thread.i: ; preds = %.preheader553.split.preheader.i
  %68 = trunc i64 %62 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %68
  store i16 0, ptr addrspace(3) %69, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.us.preheader.i
  %70 = add nuw nsw i64 %60, 1
  %exitcond.not.i = icmp eq i64 %70, 8
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader553.i, !llvm.loop !24

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i: ; preds = %.preheader553.split.preheader.i
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %65
  %.sroa.0259.0.copyload.i = load i16, ptr %71, align 32, !tbaa.struct !19
  %72 = trunc i64 %62 to i32
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0259.0.copyload.i, ptr addrspace(3) %73, align 2, !tbaa.struct !19
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.thread.i
  %74 = trunc i64 %62 to i32
  %75 = or disjoint i32 %74, 1
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i
  %77 = or disjoint i64 %65, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0259.0.copyload.1.i = load i16, ptr %78, align 2, !tbaa.struct !19
  %79 = trunc i64 %62 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0259.0.copyload.1.i, ptr addrspace(3) %81, align 2, !tbaa.struct !19
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.thread.i
  %82 = trunc i64 %62 to i32
  %83 = or disjoint i32 %82, 2
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.1.i
  %85 = or disjoint i64 %65, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0259.0.copyload.2.i = load i16, ptr %86, align 4, !tbaa.struct !19
  %87 = trunc i64 %62 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0259.0.copyload.2.i, ptr addrspace(3) %89, align 2, !tbaa.struct !19
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.thread.i
  %90 = trunc i64 %62 to i32
  %91 = or disjoint i32 %90, 3
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.2.i
  %93 = or disjoint i64 %65, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0259.0.copyload.3.i = load i16, ptr %94, align 2, !tbaa.struct !19
  %95 = trunc i64 %62 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0259.0.copyload.3.i, ptr addrspace(3) %97, align 2, !tbaa.struct !19
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.thread.i
  %98 = trunc i64 %62 to i32
  %99 = or disjoint i32 %98, 4
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.3.i
  %101 = or disjoint i64 %65, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0259.0.copyload.4.i = load i16, ptr %102, align 8, !tbaa.struct !19
  %103 = trunc i64 %62 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0259.0.copyload.4.i, ptr addrspace(3) %105, align 2, !tbaa.struct !19
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.thread.i
  %106 = trunc i64 %62 to i32
  %107 = or disjoint i32 %106, 5
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.4.i
  %109 = or disjoint i64 %65, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0259.0.copyload.5.i = load i16, ptr %110, align 2, !tbaa.struct !19
  %111 = trunc i64 %62 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0259.0.copyload.5.i, ptr addrspace(3) %113, align 2, !tbaa.struct !19
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.thread.i
  %114 = trunc i64 %62 to i32
  %115 = or disjoint i32 %114, 6
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %115
  store i16 0, ptr addrspace(3) %116, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.5.i
  %117 = or disjoint i64 %65, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0259.0.copyload.6.i = load i16, ptr %118, align 4, !tbaa.struct !19
  %119 = trunc i64 %62 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %120
  store i16 %.sroa.0259.0.copyload.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !19
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.thread.i
  %122 = trunc i64 %62 to i32
  %123 = or disjoint i32 %122, 7
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %123
  store i16 0, ptr addrspace(3) %124, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.6.i
  %125 = or disjoint i64 %65, 7
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0259.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !19
  %127 = trunc i64 %62 to i32
  %128 = or disjoint i32 %127, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %128
  store i16 %.sroa.0259.0.copyload.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !19
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.thread.i
  %130 = trunc i64 %62 to i32
  %131 = or disjoint i32 %130, 8
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %131
  store i16 0, ptr addrspace(3) %132, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.7.i
  %133 = or disjoint i64 %65, 8
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %133
  %.sroa.0259.0.copyload.8.i = load i16, ptr %134, align 16, !tbaa.struct !19
  %135 = trunc i64 %62 to i32
  %136 = or disjoint i32 %135, 8
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %136
  store i16 %.sroa.0259.0.copyload.8.i, ptr addrspace(3) %137, align 2, !tbaa.struct !19
  br i1 %53, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.thread.i
  %138 = trunc i64 %62 to i32
  %139 = or disjoint i32 %138, 9
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %139
  store i16 0, ptr addrspace(3) %140, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.8.i
  %141 = or disjoint i64 %65, 9
  %142 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %141
  %.sroa.0259.0.copyload.9.i = load i16, ptr %142, align 2, !tbaa.struct !19
  %143 = trunc i64 %62 to i32
  %144 = or disjoint i32 %143, 9
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %144
  store i16 %.sroa.0259.0.copyload.9.i, ptr addrspace(3) %145, align 2, !tbaa.struct !19
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.thread.i
  %146 = trunc i64 %62 to i32
  %147 = or disjoint i32 %146, 10
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %147
  store i16 0, ptr addrspace(3) %148, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.9.i
  %149 = or disjoint i64 %65, 10
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %149
  %.sroa.0259.0.copyload.10.i = load i16, ptr %150, align 4, !tbaa.struct !19
  %151 = trunc i64 %62 to i32
  %152 = or disjoint i32 %151, 10
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %152
  store i16 %.sroa.0259.0.copyload.10.i, ptr addrspace(3) %153, align 2, !tbaa.struct !19
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.thread.i
  %154 = trunc i64 %62 to i32
  %155 = or disjoint i32 %154, 11
  %156 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %155
  store i16 0, ptr addrspace(3) %156, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.10.i
  %157 = or disjoint i64 %65, 11
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %157
  %.sroa.0259.0.copyload.11.i = load i16, ptr %158, align 2, !tbaa.struct !19
  %159 = trunc i64 %62 to i32
  %160 = or disjoint i32 %159, 11
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %160
  store i16 %.sroa.0259.0.copyload.11.i, ptr addrspace(3) %161, align 2, !tbaa.struct !19
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.thread.i
  %162 = trunc i64 %62 to i32
  %163 = or disjoint i32 %162, 12
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %163
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.11.i
  %165 = or disjoint i64 %65, 12
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0259.0.copyload.12.i = load i16, ptr %166, align 8, !tbaa.struct !19
  %167 = trunc i64 %62 to i32
  %168 = or disjoint i32 %167, 12
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %168
  store i16 %.sroa.0259.0.copyload.12.i, ptr addrspace(3) %169, align 2, !tbaa.struct !19
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.thread.i
  %170 = trunc i64 %62 to i32
  %171 = or disjoint i32 %170, 13
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %171
  store i16 0, ptr addrspace(3) %172, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.12.i
  %173 = or disjoint i64 %65, 13
  %174 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %173
  %.sroa.0259.0.copyload.13.i = load i16, ptr %174, align 2, !tbaa.struct !19
  %175 = trunc i64 %62 to i32
  %176 = or disjoint i32 %175, 13
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %176
  store i16 %.sroa.0259.0.copyload.13.i, ptr addrspace(3) %177, align 2, !tbaa.struct !19
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.thread.i
  %178 = trunc i64 %62 to i32
  %179 = or disjoint i32 %178, 14
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %179
  store i16 0, ptr addrspace(3) %180, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.13.i
  %181 = or disjoint i64 %65, 14
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %181
  %.sroa.0259.0.copyload.14.i = load i16, ptr %182, align 4, !tbaa.struct !19
  %183 = trunc i64 %62 to i32
  %184 = or disjoint i32 %183, 14
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %184
  store i16 %.sroa.0259.0.copyload.14.i, ptr addrspace(3) %185, align 2, !tbaa.struct !19
  br i1 %59, label %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.15.i

186:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.i
  %187 = or disjoint i64 %65, 15
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %187
  %.sroa.0259.0.copyload.15.i = load i16, ptr %188, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.15.i: ; preds = %186, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.thread.i
  %.sroa.0261.2.15.i = phi i16 [ %.sroa.0259.0.copyload.15.i, %186 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.14.thread.i ]
  %189 = trunc i64 %62 to i32
  %190 = or disjoint i32 %189, 15
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %190
  store i16 %.sroa.0261.2.15.i, ptr addrspace(3) %191, align 2, !tbaa.struct !19
  br label %.split.us.i

.lr.ph.i:                                         ; preds = %.split.us.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %192 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %193 = icmp eq i64 %192, 0
  call void @llvm.assume(i1 %193)
  %194 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %195 = icmp eq i64 %194, 0
  call void @llvm.assume(i1 %195)
  %196 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %197 = icmp ult i64 %196, 64
  call void @llvm.assume(i1 %197)
  %198 = shl i32 %.tr.i, 8
  %199 = sext i32 %5 to i64
  %200 = sext i32 %4 to i64
  %201 = sext i32 %198 to i64
  %202 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %203 = inttoptr i32 %202 to ptr addrspace(3)
  %204 = getelementptr inbounds i8, ptr addrspace(3) %203, i32 768
  %205 = and i64 %196, 15
  %206 = icmp slt i64 %205, %200
  br label %218

.lr.ph559.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %207 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %208 = icmp eq i64 %207, 0
  call void @llvm.assume(i1 %208)
  %209 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %210 = icmp eq i64 %209, 0
  call void @llvm.assume(i1 %210)
  %211 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %212 = icmp ult i64 %211, 64
  call void @llvm.assume(i1 %212)
  %213 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %214 = inttoptr i32 %213 to ptr addrspace(3)
  %215 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 512
  %216 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 768
  %217 = and i64 %211, 15
  br label %235

218:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph.i
  %219 = phi i64 [ %196, %.lr.ph.i ], [ %230, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %220 = lshr i64 %219, 4
  %221 = icmp slt i64 %220, %199
  %222 = and i1 %221, %206
  br i1 %222, label %223, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

223:                                              ; preds = %218
  %224 = and i64 %219, 9223372036854775792
  %225 = or disjoint i64 %224, %201
  %226 = or disjoint i64 %225, %205
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %226
  %.sroa.0248.0.copyload.i = load i16, ptr %227, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %223, %218
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %223 ], [ 0, %218 ]
  %228 = trunc i64 %219 to i32
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %204, i32 %228
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %229, align 2, !tbaa.struct !19
  %230 = add nuw nsw i64 %219, 64
  %231 = icmp ult i64 %219, 192
  br i1 %231, label %218, label %.lr.ph559.i, !llvm.loop !28

._crit_edge560.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %232 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %233 = icmp ult i64 %232, 64
  call void @llvm.assume(i1 %233)
  %234 = icmp eq i64 %232, 0
  br i1 %234, label %447, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

235:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph559.i
  %236 = phi i64 [ %211, %.lr.ph559.i ], [ %241, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %237 = and i64 %236, 112
  br label %243

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %238 = trunc i64 %236 to i32
  %239 = and i32 %238, 127
  %240 = getelementptr inbounds float, ptr addrspace(3) %214, i32 %239
  store float %444, ptr addrspace(3) %240, align 4, !tbaa !29
  %241 = add nuw nsw i64 %236, 64
  %242 = icmp ult i64 %236, 64
  br i1 %242, label %235, label %._crit_edge560.i, !llvm.loop !31

243:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %235
  %244 = phi i64 [ 0, %235 ], [ %445, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %245 = phi float [ 0.000000e+00, %235 ], [ %444, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %246 = add nuw nsw i64 %244, %237
  %247 = trunc i64 %246 to i32
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %247
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %248, align 2, !tbaa.struct !19
  %249 = shl nuw nsw i64 %244, 4
  %250 = or disjoint i64 %249, %217
  %251 = trunc i64 %250 to i32
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %251
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %252, align 2, !tbaa.struct !19
  %253 = zext i16 %.sroa.0233.0.copyload.i to i32
  %254 = lshr i32 %253, 10
  %255 = and i32 %254, 31
  %256 = and i32 %253, 1023
  switch i32 %255, label %262 [
    i32 31, label %257
    i32 0, label %264
  ]

257:                                              ; preds = %243
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %258 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %256, 0
  %259 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %260 = or disjoint i32 %259, %258
  %261 = bitcast i32 %260 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

262:                                              ; preds = %243
  %263 = or disjoint i32 %256, 1024
  br label %264

264:                                              ; preds = %262, %243
  %265 = phi i32 [ %263, %262 ], [ %256, %243 ]
  %266 = uitofp i32 %265 to float
  %.not.i = icmp eq i32 %255, 0
  %267 = add nsw i32 %255, -25
  %268 = select i1 %.not.i, i32 -24, i32 %267
  %269 = call float @__ocml_ldexp_f32(float noundef %266, i32 noundef %268) #6
  %270 = fneg contract float %269
  %.not516517.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %271 = select contract i1 %.not516517.i, float %270, float %269
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %264, %257
  %272 = phi float [ %261, %257 ], [ %271, %264 ]
  %273 = zext i16 %.sroa.0224.0.copyload.i to i32
  %274 = lshr i32 %273, 10
  %275 = and i32 %274, 31
  %276 = and i32 %273, 1023
  switch i32 %275, label %282 [
    i32 31, label %277
    i32 0, label %284
  ]

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %278 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %276, 0
  %279 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %280 = or disjoint i32 %279, %278
  %281 = bitcast i32 %280 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %283 = or disjoint i32 %276, 1024
  br label %284

284:                                              ; preds = %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %285 = phi i32 [ %283, %282 ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %286 = uitofp i32 %285 to float
  %.not518.i = icmp eq i32 %275, 0
  %287 = add nsw i32 %275, -25
  %288 = select i1 %.not518.i, i32 -24, i32 %287
  %289 = call float @__ocml_ldexp_f32(float noundef %286, i32 noundef %288) #6
  %290 = fneg contract float %289
  %.not519520.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %291 = select contract i1 %.not519520.i, float %290, float %289
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %284, %277
  %292 = phi float [ %281, %277 ], [ %291, %284 ]
  %293 = fmul contract float %272, %292
  %294 = fadd contract float %245, %293
  %295 = or disjoint i64 %244, 1
  %296 = add nuw nsw i64 %295, %237
  %297 = trunc i64 %296 to i32
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %297
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %298, align 2, !tbaa.struct !19
  %299 = shl nuw nsw i64 %295, 4
  %300 = or disjoint i64 %299, %217
  %301 = trunc i64 %300 to i32
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %301
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %302, align 2, !tbaa.struct !19
  %303 = zext i16 %.sroa.0215.0.copyload.i to i32
  %304 = lshr i32 %303, 10
  %305 = and i32 %304, 31
  %306 = and i32 %303, 1023
  switch i32 %305, label %312 [
    i32 31, label %307
    i32 0, label %314
  ]

307:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %308 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not544.i = icmp eq i32 %306, 0
  %309 = select i1 %.not544.i, i32 2139095040, i32 2143289344
  %310 = or disjoint i32 %309, %308
  %311 = bitcast i32 %310 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

312:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %313 = or disjoint i32 %306, 1024
  br label %314

314:                                              ; preds = %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %315 = phi i32 [ %313, %312 ], [ %306, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %316 = uitofp i32 %315 to float
  %.not521.i = icmp eq i32 %305, 0
  %317 = add nsw i32 %305, -25
  %318 = select i1 %.not521.i, i32 -24, i32 %317
  %319 = call float @__ocml_ldexp_f32(float noundef %316, i32 noundef %318) #6
  %320 = fneg contract float %319
  %.not522523.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %321 = select contract i1 %.not522523.i, float %320, float %319
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %314, %307
  %322 = phi float [ %311, %307 ], [ %321, %314 ]
  %323 = zext i16 %.sroa.0206.0.copyload.i to i32
  %324 = lshr i32 %323, 10
  %325 = and i32 %324, 31
  %326 = and i32 %323, 1023
  switch i32 %325, label %332 [
    i32 31, label %327
    i32 0, label %334
  ]

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %328 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not543.i = icmp eq i32 %326, 0
  %329 = select i1 %.not543.i, i32 2139095040, i32 2143289344
  %330 = or disjoint i32 %329, %328
  %331 = bitcast i32 %330 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

332:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %333 = or disjoint i32 %326, 1024
  br label %334

334:                                              ; preds = %332, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %335 = phi i32 [ %333, %332 ], [ %326, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %336 = uitofp i32 %335 to float
  %.not524.i = icmp eq i32 %325, 0
  %337 = add nsw i32 %325, -25
  %338 = select i1 %.not524.i, i32 -24, i32 %337
  %339 = call float @__ocml_ldexp_f32(float noundef %336, i32 noundef %338) #6
  %340 = fneg contract float %339
  %.not525526.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %341 = select contract i1 %.not525526.i, float %340, float %339
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %334, %327
  %342 = phi float [ %331, %327 ], [ %341, %334 ]
  %343 = fmul contract float %322, %342
  %344 = fadd contract float %294, %343
  %345 = or disjoint i64 %244, 2
  %346 = add nuw nsw i64 %345, %237
  %347 = trunc i64 %346 to i32
  %348 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %347
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %348, align 2, !tbaa.struct !19
  %349 = shl nuw nsw i64 %345, 4
  %350 = or disjoint i64 %349, %217
  %351 = trunc i64 %350 to i32
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %351
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %352, align 2, !tbaa.struct !19
  %353 = zext i16 %.sroa.0197.0.copyload.i to i32
  %354 = lshr i32 %353, 10
  %355 = and i32 %354, 31
  %356 = and i32 %353, 1023
  switch i32 %355, label %362 [
    i32 31, label %357
    i32 0, label %364
  ]

357:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %358 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not542.i = icmp eq i32 %356, 0
  %359 = select i1 %.not542.i, i32 2139095040, i32 2143289344
  %360 = or disjoint i32 %359, %358
  %361 = bitcast i32 %360 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

362:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %363 = or disjoint i32 %356, 1024
  br label %364

364:                                              ; preds = %362, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %365 = phi i32 [ %363, %362 ], [ %356, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %366 = uitofp i32 %365 to float
  %.not527.i = icmp eq i32 %355, 0
  %367 = add nsw i32 %355, -25
  %368 = select i1 %.not527.i, i32 -24, i32 %367
  %369 = call float @__ocml_ldexp_f32(float noundef %366, i32 noundef %368) #6
  %370 = fneg contract float %369
  %.not528529.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %371 = select contract i1 %.not528529.i, float %370, float %369
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %364, %357
  %372 = phi float [ %361, %357 ], [ %371, %364 ]
  %373 = zext i16 %.sroa.0188.0.copyload.i to i32
  %374 = lshr i32 %373, 10
  %375 = and i32 %374, 31
  %376 = and i32 %373, 1023
  switch i32 %375, label %382 [
    i32 31, label %377
    i32 0, label %384
  ]

377:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %378 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not541.i = icmp eq i32 %376, 0
  %379 = select i1 %.not541.i, i32 2139095040, i32 2143289344
  %380 = or disjoint i32 %379, %378
  %381 = bitcast i32 %380 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

382:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %383 = or disjoint i32 %376, 1024
  br label %384

384:                                              ; preds = %382, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %385 = phi i32 [ %383, %382 ], [ %376, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %386 = uitofp i32 %385 to float
  %.not530.i = icmp eq i32 %375, 0
  %387 = add nsw i32 %375, -25
  %388 = select i1 %.not530.i, i32 -24, i32 %387
  %389 = call float @__ocml_ldexp_f32(float noundef %386, i32 noundef %388) #6
  %390 = fneg contract float %389
  %.not531532.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %391 = select contract i1 %.not531532.i, float %390, float %389
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %384, %377
  %392 = phi float [ %381, %377 ], [ %391, %384 ]
  %393 = fmul contract float %372, %392
  %394 = fadd contract float %344, %393
  %395 = or disjoint i64 %244, 3
  %396 = add nuw nsw i64 %395, %237
  %397 = trunc i64 %396 to i32
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %397
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %398, align 2, !tbaa.struct !19
  %399 = shl nuw nsw i64 %395, 4
  %400 = or disjoint i64 %399, %217
  %401 = trunc i64 %400 to i32
  %402 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %401
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %402, align 2, !tbaa.struct !19
  %403 = zext i16 %.sroa.0179.0.copyload.i to i32
  %404 = lshr i32 %403, 10
  %405 = and i32 %404, 31
  %406 = and i32 %403, 1023
  switch i32 %405, label %412 [
    i32 31, label %407
    i32 0, label %414
  ]

407:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %408 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not540.i = icmp eq i32 %406, 0
  %409 = select i1 %.not540.i, i32 2139095040, i32 2143289344
  %410 = or disjoint i32 %409, %408
  %411 = bitcast i32 %410 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

412:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %413 = or disjoint i32 %406, 1024
  br label %414

414:                                              ; preds = %412, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %415 = phi i32 [ %413, %412 ], [ %406, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %416 = uitofp i32 %415 to float
  %.not533.i = icmp eq i32 %405, 0
  %417 = add nsw i32 %405, -25
  %418 = select i1 %.not533.i, i32 -24, i32 %417
  %419 = call float @__ocml_ldexp_f32(float noundef %416, i32 noundef %418) #6
  %420 = fneg contract float %419
  %.not534535.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %421 = select contract i1 %.not534535.i, float %420, float %419
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %414, %407
  %422 = phi float [ %411, %407 ], [ %421, %414 ]
  %423 = zext i16 %.sroa.0170.0.copyload.i to i32
  %424 = lshr i32 %423, 10
  %425 = and i32 %424, 31
  %426 = and i32 %423, 1023
  switch i32 %425, label %432 [
    i32 31, label %427
    i32 0, label %434
  ]

427:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %428 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not539.i = icmp eq i32 %426, 0
  %429 = select i1 %.not539.i, i32 2139095040, i32 2143289344
  %430 = or disjoint i32 %429, %428
  %431 = bitcast i32 %430 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

432:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %433 = or disjoint i32 %426, 1024
  br label %434

434:                                              ; preds = %432, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %435 = phi i32 [ %433, %432 ], [ %426, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %436 = uitofp i32 %435 to float
  %.not536.i = icmp eq i32 %425, 0
  %437 = add nsw i32 %425, -25
  %438 = select i1 %.not536.i, i32 -24, i32 %437
  %439 = call float @__ocml_ldexp_f32(float noundef %436, i32 noundef %438) #6
  %440 = fneg contract float %439
  %.not537538.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %441 = select contract i1 %.not537538.i, float %440, float %439
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %434, %427
  %442 = phi float [ %431, %427 ], [ %441, %434 ]
  %443 = fmul contract float %422, %442
  %444 = fadd contract float %394, %443
  %445 = add nuw nsw i64 %244, 4
  %446 = icmp ult i64 %244, 12
  br i1 %446, label %243, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, !llvm.loop !32

447:                                              ; preds = %._crit_edge560.i
  %448 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %449 = icmp eq i64 %448, 0
  call void @llvm.assume(i1 %449)
  %450 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %451 = icmp eq i64 %450, 0
  call void @llvm.assume(i1 %451)
  %452 = sext i32 %3 to i64
  %453 = call i32 @llvm.amdgcn.groupstaticsize()
  %454 = inttoptr i32 %453 to ptr addrspace(3)
  %455 = sext i32 %30 to i64
  %456 = icmp sgt i32 %4, 0
  %457 = icmp ugt i32 %4, 1
  %458 = icmp ugt i32 %4, 2
  %459 = icmp ugt i32 %4, 3
  %460 = icmp ugt i32 %4, 4
  %461 = icmp ugt i32 %4, 5
  %462 = icmp ugt i32 %4, 6
  %463 = icmp ugt i32 %4, 7
  %464 = icmp ugt i32 %4, 8
  %465 = icmp ugt i32 %4, 9
  %466 = icmp ugt i32 %4, 10
  %467 = icmp ugt i32 %4, 11
  %468 = icmp ugt i32 %4, 12
  %469 = icmp ugt i32 %4, 13
  %470 = icmp ugt i32 %4, 14
  %471 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split562.us.i, %447
  %472 = phi i64 [ 0, %447 ], [ %478, %.split562.us.i ]
  %473 = icmp slt i64 %472, %452
  %474 = shl i64 %472, 4
  %.tr515.i = trunc i64 %472 to i32
  %475 = shl i32 %.tr515.i, 4
  %476 = sext i32 %475 to i64
  %477 = add nsw i64 %476, %455
  %.fr563.i = freeze i1 %473
  %brmerge.not.i = select i1 %.fr563.i, i1 %456, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split562.us.i

.split562.us.i:                                   ; preds = %567, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %478 = add nuw nsw i64 %472, 1
  %exitcond567.not.i = icmp eq i64 %478, 8
  br i1 %exitcond567.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %479 = trunc i64 %474 to i32
  %480 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !29
  %482 = getelementptr inbounds float, ptr %9, i64 %477
  store float %481, ptr %482, align 32, !tbaa !29
  br i1 %457, label %.preheader.split.2.i, label %.split562.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %483 = trunc i64 %474 to i32
  %484 = or disjoint i32 %483, 1
  %485 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !29
  %487 = or disjoint i64 %477, 1
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 4, !tbaa !29
  br i1 %458, label %.preheader.split.3.i, label %.split562.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %489 = trunc i64 %474 to i32
  %490 = or disjoint i32 %489, 2
  %491 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !29
  %493 = or disjoint i64 %477, 2
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 8, !tbaa !29
  br i1 %459, label %.preheader.split.4.i, label %.split562.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %495 = trunc i64 %474 to i32
  %496 = or disjoint i32 %495, 3
  %497 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !29
  %499 = or disjoint i64 %477, 3
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 4, !tbaa !29
  br i1 %460, label %.preheader.split.5.i, label %.split562.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %501 = trunc i64 %474 to i32
  %502 = or disjoint i32 %501, 4
  %503 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !29
  %505 = or disjoint i64 %477, 4
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 16, !tbaa !29
  br i1 %461, label %.preheader.split.6.i, label %.split562.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %507 = trunc i64 %474 to i32
  %508 = or disjoint i32 %507, 5
  %509 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !29
  %511 = or disjoint i64 %477, 5
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 4, !tbaa !29
  br i1 %462, label %.preheader.split.7.i, label %.split562.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %513 = trunc i64 %474 to i32
  %514 = or disjoint i32 %513, 6
  %515 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %514
  %516 = load float, ptr addrspace(3) %515, align 4, !tbaa !29
  %517 = or disjoint i64 %477, 6
  %518 = getelementptr inbounds float, ptr %9, i64 %517
  store float %516, ptr %518, align 8, !tbaa !29
  br i1 %463, label %.preheader.split.8.i, label %.split562.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %519 = trunc i64 %474 to i32
  %520 = or disjoint i32 %519, 7
  %521 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %520
  %522 = load float, ptr addrspace(3) %521, align 4, !tbaa !29
  %523 = or disjoint i64 %477, 7
  %524 = getelementptr inbounds float, ptr %9, i64 %523
  store float %522, ptr %524, align 4, !tbaa !29
  br i1 %464, label %.preheader.split.9.i, label %.split562.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %525 = trunc i64 %474 to i32
  %526 = or disjoint i32 %525, 8
  %527 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !29
  %529 = or disjoint i64 %477, 8
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 32, !tbaa !29
  br i1 %465, label %.preheader.split.10.i, label %.split562.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %531 = trunc i64 %474 to i32
  %532 = or disjoint i32 %531, 9
  %533 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %532
  %534 = load float, ptr addrspace(3) %533, align 4, !tbaa !29
  %535 = or disjoint i64 %477, 9
  %536 = getelementptr inbounds float, ptr %9, i64 %535
  store float %534, ptr %536, align 4, !tbaa !29
  br i1 %466, label %.preheader.split.11.i, label %.split562.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %537 = trunc i64 %474 to i32
  %538 = or disjoint i32 %537, 10
  %539 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %538
  %540 = load float, ptr addrspace(3) %539, align 4, !tbaa !29
  %541 = or disjoint i64 %477, 10
  %542 = getelementptr inbounds float, ptr %9, i64 %541
  store float %540, ptr %542, align 8, !tbaa !29
  br i1 %467, label %.preheader.split.12.i, label %.split562.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %543 = trunc i64 %474 to i32
  %544 = or disjoint i32 %543, 11
  %545 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %544
  %546 = load float, ptr addrspace(3) %545, align 4, !tbaa !29
  %547 = or disjoint i64 %477, 11
  %548 = getelementptr inbounds float, ptr %9, i64 %547
  store float %546, ptr %548, align 4, !tbaa !29
  br i1 %468, label %.preheader.split.13.i, label %.split562.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %549 = trunc i64 %474 to i32
  %550 = or disjoint i32 %549, 12
  %551 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %550
  %552 = load float, ptr addrspace(3) %551, align 4, !tbaa !29
  %553 = or disjoint i64 %477, 12
  %554 = getelementptr inbounds float, ptr %9, i64 %553
  store float %552, ptr %554, align 16, !tbaa !29
  br i1 %469, label %.preheader.split.14.i, label %.split562.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %555 = trunc i64 %474 to i32
  %556 = or disjoint i32 %555, 13
  %557 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %556
  %558 = load float, ptr addrspace(3) %557, align 4, !tbaa !29
  %559 = or disjoint i64 %477, 13
  %560 = getelementptr inbounds float, ptr %9, i64 %559
  store float %558, ptr %560, align 4, !tbaa !29
  br i1 %470, label %.preheader.split.15.i, label %.split562.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %561 = trunc i64 %474 to i32
  %562 = or disjoint i32 %561, 14
  %563 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %562
  %564 = load float, ptr addrspace(3) %563, align 4, !tbaa !29
  %565 = or disjoint i64 %477, 14
  %566 = getelementptr inbounds float, ptr %9, i64 %565
  store float %564, ptr %566, align 8, !tbaa !29
  br i1 %471, label %567, label %.split562.us.i

567:                                              ; preds = %.preheader.split.15.i
  %568 = trunc i64 %474 to i32
  %569 = or disjoint i32 %568, 15
  %570 = getelementptr inbounds float, ptr addrspace(3) %454, i32 %569
  %571 = load float, ptr addrspace(3) %570, align 4, !tbaa !29
  %572 = or disjoint i64 %477, 15
  %573 = getelementptr inbounds float, ptr %9, i64 %572
  store float %571, ptr %573, align 4, !tbaa !29
  br label %.split562.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge560.i, %.split562.us.i
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
!19 = !{i64 0, i64 2, !20}
!20 = !{!21, !21, i64 0}
!21 = !{!"short", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = distinct !{!24, !25, !26, !27}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{!"llvm.loop.vectorize.width", i32 1}
!27 = !{!"llvm.loop.interleave.count", i32 1}
!28 = distinct !{!28, !25, !26, !27}
!29 = !{!30, !30, i64 0}
!30 = !{!"float", !22, i64 0}
!31 = distinct !{!31, !25}
!32 = distinct !{!32, !25}
!33 = distinct !{!33, !25}
;----------------- End AdaptiveCpp IR dump ---------------
