;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882031/tmp/triton-sycl-cache/compile-0z6vxbs9/kernel.cpp"
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
  %11 = icmp ult i64 %10, 2147483647
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp eq i64 %16, 0
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 2147483648
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
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 4 dereferenceable(512) %35, i8 0, i32 512, i1 false), !tbaa !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 2147483647
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %40 = icmp eq i64 %39, 0
  call void @llvm.assume(i1 %40)
  %41 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %42 = icmp eq i64 %41, 0
  call void @llvm.assume(i1 %42)
  %43 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %44 = icmp eq i64 %43, 0
  call void @llvm.assume(i1 %44)
  %45 = sext i32 %5 to i64
  %46 = sext i32 %3 to i64
  %47 = getelementptr inbounds i8, ptr addrspace(3) %35, i32 512
  %48 = sext i32 %38 to i64
  %49 = icmp sgt i32 %3, 0
  %50 = icmp ugt i32 %3, 1
  %51 = icmp ugt i32 %3, 2
  %52 = icmp ugt i32 %3, 3
  %53 = icmp ugt i32 %3, 4
  %54 = icmp ugt i32 %3, 5
  %55 = icmp ugt i32 %3, 6
  %56 = icmp ugt i32 %3, 7
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split.us.i, %6
  %57 = phi i64 [ 0, %6 ], [ %67, %.split.us.i ]
  %58 = icmp slt i64 %57, %45
  %59 = shl i64 %57, 3
  %.tr551.i = trunc i64 %57 to i32
  %60 = shl i32 %.tr551.i, 3
  %61 = sext i32 %60 to i64
  %62 = add nsw i64 %61, %48
  %.fr.i = freeze i1 %58
  br i1 %.fr.i, label %.preheader557.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr580.i = trunc i64 %57 to i32
  %63 = shl i32 %.tr580.i, 4
  %64 = add i32 %63, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %35, i32 %64
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader557.split.preheader.i:                  ; preds = %.preheader557.i
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader557.split.preheader.i
  %65 = trunc i64 %59 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %65
  store i16 0, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %67 = add nuw nsw i64 %57, 1
  %exitcond.not.i = icmp eq i64 %67, 16
  br i1 %exitcond.not.i, label %125, label %.preheader557.i, !llvm.loop !26

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader557.split.preheader.i
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %62
  %.sroa.0269.0.copyload.i = load i16, ptr %68, align 16, !tbaa.struct !23
  %69 = trunc i64 %59 to i32
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %69
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %70, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i
  %71 = trunc i64 %59 to i32
  %72 = or disjoint i32 %71, 1
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %72
  store i16 0, ptr addrspace(3) %73, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  %74 = or disjoint i64 %62, 1
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %74
  %.sroa.0269.0.copyload.1.i = load i16, ptr %75, align 2, !tbaa.struct !23
  %76 = trunc i64 %59 to i32
  %77 = or disjoint i32 %76, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %77
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %78, align 2, !tbaa.struct !23
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i
  %79 = trunc i64 %59 to i32
  %80 = or disjoint i32 %79, 2
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %80
  store i16 0, ptr addrspace(3) %81, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i
  %82 = or disjoint i64 %62, 2
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0269.0.copyload.2.i = load i16, ptr %83, align 4, !tbaa.struct !23
  %84 = trunc i64 %59 to i32
  %85 = or disjoint i32 %84, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %85
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %86, align 2, !tbaa.struct !23
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i
  %87 = trunc i64 %59 to i32
  %88 = or disjoint i32 %87, 3
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i
  %90 = or disjoint i64 %62, 3
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0269.0.copyload.3.i = load i16, ptr %91, align 2, !tbaa.struct !23
  %92 = trunc i64 %59 to i32
  %93 = or disjoint i32 %92, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %93
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %94, align 2, !tbaa.struct !23
  br i1 %53, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i
  %95 = trunc i64 %59 to i32
  %96 = or disjoint i32 %95, 4
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i
  %98 = or disjoint i64 %62, 4
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0269.0.copyload.4.i = load i16, ptr %99, align 8, !tbaa.struct !23
  %100 = trunc i64 %59 to i32
  %101 = or disjoint i32 %100, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %101
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %102, align 2, !tbaa.struct !23
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i
  %103 = trunc i64 %59 to i32
  %104 = or disjoint i32 %103, 5
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i
  %106 = or disjoint i64 %62, 5
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0269.0.copyload.5.i = load i16, ptr %107, align 2, !tbaa.struct !23
  %108 = trunc i64 %59 to i32
  %109 = or disjoint i32 %108, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %109
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %110, align 2, !tbaa.struct !23
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i
  %111 = trunc i64 %59 to i32
  %112 = or disjoint i32 %111, 6
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i
  %114 = or disjoint i64 %62, 6
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0269.0.copyload.6.i = load i16, ptr %115, align 4, !tbaa.struct !23
  %116 = trunc i64 %59 to i32
  %117 = or disjoint i32 %116, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %117
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  br i1 %56, label %119, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

119:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i
  %120 = or disjoint i64 %62, 7
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %120
  %.sroa.0269.0.copyload.7.i = load i16, ptr %121, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i: ; preds = %119, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %119 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i ]
  %122 = trunc i64 %59 to i32
  %123 = or disjoint i32 %122, 7
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %123
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %124, align 2, !tbaa.struct !23
  br label %.split.us.i

125:                                              ; preds = %.split.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %126 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %127 = icmp eq i64 %126, 0
  call void @llvm.assume(i1 %127)
  %128 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %129 = icmp eq i64 %128, 0
  call void @llvm.assume(i1 %129)
  %130 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %131 = icmp eq i64 %130, 0
  call void @llvm.assume(i1 %131)
  %132 = getelementptr inbounds i8, ptr addrspace(3) %35, i32 768
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

133:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %135 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %136 = icmp eq i64 %135, 0
  call void @llvm.assume(i1 %136)
  %137 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %138 = icmp eq i64 %137, 0
  call void @llvm.assume(i1 %138)
  %139 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %140 = icmp eq i64 %139, 0
  call void @llvm.assume(i1 %140)
  %141 = sext i32 %4 to i64
  %142 = getelementptr inbounds i8, ptr addrspace(3) %35, i32 1024
  %143 = sext i32 %134 to i64
  %144 = icmp sgt i32 %5, 0
  %145 = icmp ugt i32 %5, 1
  %146 = icmp ugt i32 %5, 2
  %147 = icmp ugt i32 %5, 3
  %148 = icmp ugt i32 %5, 4
  %149 = icmp ugt i32 %5, 5
  %150 = icmp ugt i32 %5, 6
  %151 = icmp ugt i32 %5, 7
  %152 = icmp ugt i32 %5, 8
  %153 = icmp ugt i32 %5, 9
  %154 = icmp ugt i32 %5, 10
  %155 = icmp ugt i32 %5, 11
  %156 = icmp ugt i32 %5, 12
  %157 = icmp ugt i32 %5, 13
  %158 = icmp ugt i32 %5, 14
  %159 = icmp ugt i32 %5, 15
  br label %.preheader556.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %125
  %160 = phi i64 [ 0, %125 ], [ %173, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %161 = lshr i64 %160, 4
  %162 = shl nuw nsw i64 %160, 3
  %163 = and i64 %162, 120
  %164 = or disjoint i64 %163, %161
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %165
  %167 = addrspacecast ptr addrspace(3) %166 to ptr
  %168 = load volatile i16, ptr %167, align 2, !tbaa !24
  %169 = trunc i64 %160 to i32
  %170 = and i32 %169, 127
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %170
  %172 = addrspacecast ptr addrspace(3) %171 to ptr
  store volatile i16 %168, ptr %172, align 2, !tbaa !24
  %173 = add nuw nsw i64 %160, 1
  %exitcond571.not.i = icmp eq i64 %173, 128
  br i1 %exitcond571.not.i, label %133, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, !llvm.loop !30

.preheader556.i:                                  ; preds = %.split563.us.i, %133
  %174 = phi i64 [ 0, %133 ], [ %184, %.split563.us.i ]
  %175 = icmp slt i64 %174, %141
  %176 = shl i64 %174, 4
  %.tr550.i = trunc i64 %174 to i32
  %177 = shl i32 %.tr550.i, 4
  %178 = sext i32 %177 to i64
  %179 = add nsw i64 %178, %143
  %.fr564.i = freeze i1 %175
  br i1 %.fr564.i, label %.preheader556.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader556.i
  %.tr581.i = trunc i64 %174 to i32
  %180 = shl i32 %.tr581.i, 5
  %181 = add i32 %180, 1024
  %scevgep572.i = getelementptr i8, ptr addrspace(3) %35, i32 %181
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep572.i, i8 0, i32 32, i1 false)
  br label %.split563.us.i

.preheader556.split.preheader.i:                  ; preds = %.preheader556.i
  br i1 %144, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader556.split.preheader.i
  %182 = trunc i64 %176 to i32
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %182
  store i16 0, ptr addrspace(3) %183, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split563.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %184 = add nuw nsw i64 %174, 1
  %exitcond574.not.i = icmp eq i64 %184, 16
  br i1 %exitcond574.not.i, label %306, label %.preheader556.i, !llvm.loop !31

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader556.split.preheader.i
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %179
  %.sroa.0232.0.copyload.i = load i16, ptr %185, align 32, !tbaa.struct !23
  %186 = trunc i64 %176 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %186
  store i16 %.sroa.0232.0.copyload.i, ptr addrspace(3) %187, align 2, !tbaa.struct !23
  br i1 %145, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %188 = trunc i64 %176 to i32
  %189 = or disjoint i32 %188, 1
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %189
  store i16 0, ptr addrspace(3) %190, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %191 = or disjoint i64 %179, 1
  %192 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %191
  %.sroa.0232.0.copyload.1.i = load i16, ptr %192, align 2, !tbaa.struct !23
  %193 = trunc i64 %176 to i32
  %194 = or disjoint i32 %193, 1
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %194
  store i16 %.sroa.0232.0.copyload.1.i, ptr addrspace(3) %195, align 2, !tbaa.struct !23
  br i1 %146, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %196 = trunc i64 %176 to i32
  %197 = or disjoint i32 %196, 2
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %197
  store i16 0, ptr addrspace(3) %198, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %199 = or disjoint i64 %179, 2
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %199
  %.sroa.0232.0.copyload.2.i = load i16, ptr %200, align 4, !tbaa.struct !23
  %201 = trunc i64 %176 to i32
  %202 = or disjoint i32 %201, 2
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %202
  store i16 %.sroa.0232.0.copyload.2.i, ptr addrspace(3) %203, align 2, !tbaa.struct !23
  br i1 %147, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %204 = trunc i64 %176 to i32
  %205 = or disjoint i32 %204, 3
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %205
  store i16 0, ptr addrspace(3) %206, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %207 = or disjoint i64 %179, 3
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %207
  %.sroa.0232.0.copyload.3.i = load i16, ptr %208, align 2, !tbaa.struct !23
  %209 = trunc i64 %176 to i32
  %210 = or disjoint i32 %209, 3
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %210
  store i16 %.sroa.0232.0.copyload.3.i, ptr addrspace(3) %211, align 2, !tbaa.struct !23
  br i1 %148, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %212 = trunc i64 %176 to i32
  %213 = or disjoint i32 %212, 4
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %213
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %215 = or disjoint i64 %179, 4
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %215
  %.sroa.0232.0.copyload.4.i = load i16, ptr %216, align 8, !tbaa.struct !23
  %217 = trunc i64 %176 to i32
  %218 = or disjoint i32 %217, 4
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %218
  store i16 %.sroa.0232.0.copyload.4.i, ptr addrspace(3) %219, align 2, !tbaa.struct !23
  br i1 %149, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %220 = trunc i64 %176 to i32
  %221 = or disjoint i32 %220, 5
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %221
  store i16 0, ptr addrspace(3) %222, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %223 = or disjoint i64 %179, 5
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %223
  %.sroa.0232.0.copyload.5.i = load i16, ptr %224, align 2, !tbaa.struct !23
  %225 = trunc i64 %176 to i32
  %226 = or disjoint i32 %225, 5
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %226
  store i16 %.sroa.0232.0.copyload.5.i, ptr addrspace(3) %227, align 2, !tbaa.struct !23
  br i1 %150, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %228 = trunc i64 %176 to i32
  %229 = or disjoint i32 %228, 6
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %229
  store i16 0, ptr addrspace(3) %230, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %231 = or disjoint i64 %179, 6
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %231
  %.sroa.0232.0.copyload.6.i = load i16, ptr %232, align 4, !tbaa.struct !23
  %233 = trunc i64 %176 to i32
  %234 = or disjoint i32 %233, 6
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %234
  store i16 %.sroa.0232.0.copyload.6.i, ptr addrspace(3) %235, align 2, !tbaa.struct !23
  br i1 %151, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %236 = trunc i64 %176 to i32
  %237 = or disjoint i32 %236, 7
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %237
  store i16 0, ptr addrspace(3) %238, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %239 = or disjoint i64 %179, 7
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %239
  %.sroa.0232.0.copyload.7.i = load i16, ptr %240, align 2, !tbaa.struct !23
  %241 = trunc i64 %176 to i32
  %242 = or disjoint i32 %241, 7
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %242
  store i16 %.sroa.0232.0.copyload.7.i, ptr addrspace(3) %243, align 2, !tbaa.struct !23
  br i1 %152, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %244 = trunc i64 %176 to i32
  %245 = or disjoint i32 %244, 8
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %245
  store i16 0, ptr addrspace(3) %246, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %247 = or disjoint i64 %179, 8
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %247
  %.sroa.0232.0.copyload.8.i = load i16, ptr %248, align 16, !tbaa.struct !23
  %249 = trunc i64 %176 to i32
  %250 = or disjoint i32 %249, 8
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %250
  store i16 %.sroa.0232.0.copyload.8.i, ptr addrspace(3) %251, align 2, !tbaa.struct !23
  br i1 %153, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %252 = trunc i64 %176 to i32
  %253 = or disjoint i32 %252, 9
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %253
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %255 = or disjoint i64 %179, 9
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %255
  %.sroa.0232.0.copyload.9.i = load i16, ptr %256, align 2, !tbaa.struct !23
  %257 = trunc i64 %176 to i32
  %258 = or disjoint i32 %257, 9
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %258
  store i16 %.sroa.0232.0.copyload.9.i, ptr addrspace(3) %259, align 2, !tbaa.struct !23
  br i1 %154, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %260 = trunc i64 %176 to i32
  %261 = or disjoint i32 %260, 10
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %261
  store i16 0, ptr addrspace(3) %262, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %263 = or disjoint i64 %179, 10
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %263
  %.sroa.0232.0.copyload.10.i = load i16, ptr %264, align 4, !tbaa.struct !23
  %265 = trunc i64 %176 to i32
  %266 = or disjoint i32 %265, 10
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %266
  store i16 %.sroa.0232.0.copyload.10.i, ptr addrspace(3) %267, align 2, !tbaa.struct !23
  br i1 %155, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %268 = trunc i64 %176 to i32
  %269 = or disjoint i32 %268, 11
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %269
  store i16 0, ptr addrspace(3) %270, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %271 = or disjoint i64 %179, 11
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %271
  %.sroa.0232.0.copyload.11.i = load i16, ptr %272, align 2, !tbaa.struct !23
  %273 = trunc i64 %176 to i32
  %274 = or disjoint i32 %273, 11
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %274
  store i16 %.sroa.0232.0.copyload.11.i, ptr addrspace(3) %275, align 2, !tbaa.struct !23
  br i1 %156, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %276 = trunc i64 %176 to i32
  %277 = or disjoint i32 %276, 12
  %278 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %277
  store i16 0, ptr addrspace(3) %278, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %279 = or disjoint i64 %179, 12
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %279
  %.sroa.0232.0.copyload.12.i = load i16, ptr %280, align 8, !tbaa.struct !23
  %281 = trunc i64 %176 to i32
  %282 = or disjoint i32 %281, 12
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %282
  store i16 %.sroa.0232.0.copyload.12.i, ptr addrspace(3) %283, align 2, !tbaa.struct !23
  br i1 %157, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %284 = trunc i64 %176 to i32
  %285 = or disjoint i32 %284, 13
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %285
  store i16 0, ptr addrspace(3) %286, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %287 = or disjoint i64 %179, 13
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %287
  %.sroa.0232.0.copyload.13.i = load i16, ptr %288, align 2, !tbaa.struct !23
  %289 = trunc i64 %176 to i32
  %290 = or disjoint i32 %289, 13
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %290
  store i16 %.sroa.0232.0.copyload.13.i, ptr addrspace(3) %291, align 2, !tbaa.struct !23
  br i1 %158, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %292 = trunc i64 %176 to i32
  %293 = or disjoint i32 %292, 14
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %293
  store i16 0, ptr addrspace(3) %294, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %295 = or disjoint i64 %179, 14
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %295
  %.sroa.0232.0.copyload.14.i = load i16, ptr %296, align 4, !tbaa.struct !23
  %297 = trunc i64 %176 to i32
  %298 = or disjoint i32 %297, 14
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %298
  store i16 %.sroa.0232.0.copyload.14.i, ptr addrspace(3) %299, align 2, !tbaa.struct !23
  br i1 %159, label %300, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

300:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %301 = or disjoint i64 %179, 15
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %301
  %.sroa.0232.0.copyload.15.i = load i16, ptr %302, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %300, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0234.2.15.i = phi i16 [ %.sroa.0232.0.copyload.15.i, %300 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %303 = trunc i64 %176 to i32
  %304 = or disjoint i32 %303, 15
  %305 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %304
  store i16 %.sroa.0234.2.15.i, ptr addrspace(3) %305, align 2, !tbaa.struct !23
  br label %.split563.us.i

306:                                              ; preds = %.split563.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %307 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %308 = icmp eq i64 %307, 0
  call void @llvm.assume(i1 %308)
  %309 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %310 = icmp eq i64 %309, 0
  call void @llvm.assume(i1 %310)
  %311 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %312 = icmp eq i64 %311, 0
  call void @llvm.assume(i1 %312)
  %313 = getelementptr inbounds i8, ptr addrspace(3) %35, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

314:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %315 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %316 = icmp eq i64 %315, 0
  call void @llvm.assume(i1 %316)
  %317 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %318 = icmp eq i64 %317, 0
  call void @llvm.assume(i1 %318)
  %319 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %320 = icmp eq i64 %319, 0
  call void @llvm.assume(i1 %320)
  br label %358

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %306
  %321 = phi i64 [ 0, %306 ], [ %334, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %322 = lshr i64 %321, 4
  %323 = shl nuw nsw i64 %321, 4
  %324 = and i64 %323, 240
  %325 = or disjoint i64 %324, %322
  %326 = trunc i64 %325 to i32
  %327 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %326
  %328 = addrspacecast ptr addrspace(3) %327 to ptr
  %329 = load volatile i16, ptr %328, align 2, !tbaa !24
  %330 = trunc i64 %321 to i32
  %331 = and i32 %330, 255
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %313, i32 %331
  %333 = addrspacecast ptr addrspace(3) %332 to ptr
  store volatile i16 %329, ptr %333, align 2, !tbaa !24
  %334 = add nuw nsw i64 %321, 1
  %exitcond575.not.i = icmp eq i64 %334, 256
  br i1 %exitcond575.not.i, label %314, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, !llvm.loop !32

335:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %336 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %337 = icmp eq i64 %336, 0
  call void @llvm.assume(i1 %337)
  %338 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %339 = icmp eq i64 %338, 0
  call void @llvm.assume(i1 %339)
  %340 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %341 = icmp eq i64 %340, 0
  call void @llvm.assume(i1 %341)
  %342 = icmp sgt i32 %4, 0
  %343 = icmp ugt i32 %4, 1
  %344 = icmp ugt i32 %4, 2
  %345 = icmp ugt i32 %4, 3
  %346 = icmp ugt i32 %4, 4
  %347 = icmp ugt i32 %4, 5
  %348 = icmp ugt i32 %4, 6
  %349 = icmp ugt i32 %4, 7
  %350 = icmp ugt i32 %4, 8
  %351 = icmp ugt i32 %4, 9
  %352 = icmp ugt i32 %4, 10
  %353 = icmp ugt i32 %4, 11
  %354 = icmp ugt i32 %4, 12
  %355 = icmp ugt i32 %4, 13
  %356 = icmp ugt i32 %4, 14
  %357 = icmp ugt i32 %4, 15
  br label %.preheader.i

358:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %314
  %359 = phi i64 [ 0, %314 ], [ %365, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %360 = and i64 %359, 112
  %361 = and i64 %359, 15
  %362 = trunc i64 %359 to i32
  %363 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %362
  %364 = load float, ptr addrspace(3) %363, align 4, !tbaa !19
  br label %366

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %417, ptr addrspace(3) %363, align 4, !tbaa !19
  %365 = add nuw nsw i64 %359, 1
  %exitcond577.not.i = icmp eq i64 %365, 128
  br i1 %exitcond577.not.i, label %335, label %358, !llvm.loop !33

366:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %358
  %367 = phi i64 [ 0, %358 ], [ %418, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %368 = phi float [ %364, %358 ], [ %417, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %369 = add nuw nsw i64 %367, %360
  %370 = trunc i64 %369 to i32
  %371 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %370
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %371, align 2, !tbaa.struct !23
  %372 = shl nuw nsw i64 %367, 4
  %373 = or disjoint i64 %372, %361
  %374 = trunc i64 %373 to i32
  %375 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %313, i32 %374
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %375, align 2, !tbaa.struct !23
  %376 = zext i16 %.sroa.0189.0.copyload.i to i32
  %377 = lshr i32 %376, 10
  %378 = and i32 %377, 31
  %379 = and i32 %376, 1023
  switch i32 %378, label %385 [
    i32 31, label %380
    i32 0, label %387
  ]

380:                                              ; preds = %366
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %381 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %379, 0
  %382 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %383 = or disjoint i32 %382, %381
  %384 = bitcast i32 %383 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

385:                                              ; preds = %366
  %386 = or disjoint i32 %379, 1024
  br label %387

387:                                              ; preds = %385, %366
  %388 = phi i32 [ %386, %385 ], [ %379, %366 ]
  %389 = uitofp i32 %388 to float
  %.not.i = icmp eq i32 %378, 0
  %390 = add nsw i32 %378, -25
  %391 = select i1 %.not.i, i32 -24, i32 %390
  %392 = call float @__ocml_ldexp_f32(float noundef %389, i32 noundef %391) #6
  %393 = fneg contract float %392
  %.not543544.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %394 = select contract i1 %.not543544.i, float %393, float %392
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %387, %380
  %395 = phi float [ %384, %380 ], [ %394, %387 ]
  %396 = zext i16 %.sroa.0180.0.copyload.i to i32
  %397 = lshr i32 %396, 10
  %398 = and i32 %397, 31
  %399 = and i32 %396, 1023
  switch i32 %398, label %405 [
    i32 31, label %400
    i32 0, label %407
  ]

400:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %401 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %399, 0
  %402 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %403 = or disjoint i32 %402, %401
  %404 = bitcast i32 %403 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

405:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %406 = or disjoint i32 %399, 1024
  br label %407

407:                                              ; preds = %405, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %408 = phi i32 [ %406, %405 ], [ %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %409 = uitofp i32 %408 to float
  %.not545.i = icmp eq i32 %398, 0
  %410 = add nsw i32 %398, -25
  %411 = select i1 %.not545.i, i32 -24, i32 %410
  %412 = call float @__ocml_ldexp_f32(float noundef %409, i32 noundef %411) #6
  %413 = fneg contract float %412
  %.not546547.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %414 = select contract i1 %.not546547.i, float %413, float %412
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %407, %400
  %415 = phi float [ %404, %400 ], [ %414, %407 ]
  %416 = fmul contract float %395, %415
  %417 = fadd contract float %368, %416
  %418 = add nuw nsw i64 %367, 1
  %exitcond576.not.i = icmp eq i64 %418, 16
  br i1 %exitcond576.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %366, !llvm.loop !34

.preheader.i:                                     ; preds = %.split566.us.i, %335
  %419 = phi i64 [ 0, %335 ], [ %425, %.split566.us.i ]
  %420 = icmp slt i64 %419, %46
  %421 = shl i64 %419, 4
  %.tr542.i = trunc i64 %419 to i32
  %422 = shl i32 %.tr542.i, 4
  %423 = sext i32 %422 to i64
  %424 = add nsw i64 %423, %48
  %.fr567.i = freeze i1 %420
  %brmerge.not.i = select i1 %.fr567.i, i1 %342, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split566.us.i

.split566.us.i:                                   ; preds = %514, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %425 = add nuw nsw i64 %419, 1
  %exitcond579.not.i = icmp eq i64 %425, 8
  br i1 %exitcond579.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %426 = trunc i64 %421 to i32
  %427 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !19
  %429 = getelementptr inbounds float, ptr %9, i64 %424
  store float %428, ptr %429, align 32, !tbaa !19
  br i1 %343, label %.preheader.split.2.i, label %.split566.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %430 = trunc i64 %421 to i32
  %431 = or disjoint i32 %430, 1
  %432 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %431
  %433 = load float, ptr addrspace(3) %432, align 4, !tbaa !19
  %434 = or disjoint i64 %424, 1
  %435 = getelementptr inbounds float, ptr %9, i64 %434
  store float %433, ptr %435, align 4, !tbaa !19
  br i1 %344, label %.preheader.split.3.i, label %.split566.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %436 = trunc i64 %421 to i32
  %437 = or disjoint i32 %436, 2
  %438 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %437
  %439 = load float, ptr addrspace(3) %438, align 4, !tbaa !19
  %440 = or disjoint i64 %424, 2
  %441 = getelementptr inbounds float, ptr %9, i64 %440
  store float %439, ptr %441, align 8, !tbaa !19
  br i1 %345, label %.preheader.split.4.i, label %.split566.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %442 = trunc i64 %421 to i32
  %443 = or disjoint i32 %442, 3
  %444 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %443
  %445 = load float, ptr addrspace(3) %444, align 4, !tbaa !19
  %446 = or disjoint i64 %424, 3
  %447 = getelementptr inbounds float, ptr %9, i64 %446
  store float %445, ptr %447, align 4, !tbaa !19
  br i1 %346, label %.preheader.split.5.i, label %.split566.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %448 = trunc i64 %421 to i32
  %449 = or disjoint i32 %448, 4
  %450 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !19
  %452 = or disjoint i64 %424, 4
  %453 = getelementptr inbounds float, ptr %9, i64 %452
  store float %451, ptr %453, align 16, !tbaa !19
  br i1 %347, label %.preheader.split.6.i, label %.split566.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %454 = trunc i64 %421 to i32
  %455 = or disjoint i32 %454, 5
  %456 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !19
  %458 = or disjoint i64 %424, 5
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 4, !tbaa !19
  br i1 %348, label %.preheader.split.7.i, label %.split566.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %460 = trunc i64 %421 to i32
  %461 = or disjoint i32 %460, 6
  %462 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !19
  %464 = or disjoint i64 %424, 6
  %465 = getelementptr inbounds float, ptr %9, i64 %464
  store float %463, ptr %465, align 8, !tbaa !19
  br i1 %349, label %.preheader.split.8.i, label %.split566.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %466 = trunc i64 %421 to i32
  %467 = or disjoint i32 %466, 7
  %468 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !19
  %470 = or disjoint i64 %424, 7
  %471 = getelementptr inbounds float, ptr %9, i64 %470
  store float %469, ptr %471, align 4, !tbaa !19
  br i1 %350, label %.preheader.split.9.i, label %.split566.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %472 = trunc i64 %421 to i32
  %473 = or disjoint i32 %472, 8
  %474 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !19
  %476 = or disjoint i64 %424, 8
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 32, !tbaa !19
  br i1 %351, label %.preheader.split.10.i, label %.split566.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %478 = trunc i64 %421 to i32
  %479 = or disjoint i32 %478, 9
  %480 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !19
  %482 = or disjoint i64 %424, 9
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 4, !tbaa !19
  br i1 %352, label %.preheader.split.11.i, label %.split566.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %484 = trunc i64 %421 to i32
  %485 = or disjoint i32 %484, 10
  %486 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !19
  %488 = or disjoint i64 %424, 10
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 8, !tbaa !19
  br i1 %353, label %.preheader.split.12.i, label %.split566.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %490 = trunc i64 %421 to i32
  %491 = or disjoint i32 %490, 11
  %492 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !19
  %494 = or disjoint i64 %424, 11
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 4, !tbaa !19
  br i1 %354, label %.preheader.split.13.i, label %.split566.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %496 = trunc i64 %421 to i32
  %497 = or disjoint i32 %496, 12
  %498 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !19
  %500 = or disjoint i64 %424, 12
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 16, !tbaa !19
  br i1 %355, label %.preheader.split.14.i, label %.split566.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %502 = trunc i64 %421 to i32
  %503 = or disjoint i32 %502, 13
  %504 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !19
  %506 = or disjoint i64 %424, 13
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 4, !tbaa !19
  br i1 %356, label %.preheader.split.15.i, label %.split566.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %508 = trunc i64 %421 to i32
  %509 = or disjoint i32 %508, 14
  %510 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !19
  %512 = or disjoint i64 %424, 14
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 8, !tbaa !19
  br i1 %357, label %514, label %.split566.us.i

514:                                              ; preds = %.preheader.split.15.i
  %515 = trunc i64 %421 to i32
  %516 = or disjoint i32 %515, 15
  %517 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %516
  %518 = load float, ptr addrspace(3) %517, align 4, !tbaa !19
  %519 = or disjoint i64 %424, 15
  %520 = getelementptr inbounds float, ptr %9, i64 %519
  store float %518, ptr %520, align 4, !tbaa !19
  br label %.split566.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %.split566.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="1,1" }
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
!35 = distinct !{!35, !27}
;----------------- End AdaptiveCpp IR dump ---------------
