;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882025/tmp/triton-sycl-cache/compile-ee7zbvjv/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 16777216
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
  %33 = icmp ult i64 %32, 128
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  %36 = trunc i64 %32 to i32
  %37 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %36
  store float 0.000000e+00, ptr addrspace(3) %37, align 4, !tbaa !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %39 = icmp ult i64 %38, 16777215
  call void @llvm.assume(i1 %39)
  %.tr.i = trunc i64 %38 to i32
  %40 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %42 = icmp ult i64 %41, 128
  call void @llvm.assume(i1 %42)
  %43 = icmp eq i64 %41, 0
  br i1 %43, label %44, label %._crit_edge565.i

44:                                               ; preds = %6
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
  %53 = zext i32 %40 to i64
  %54 = icmp sgt i32 %3, 0
  %55 = icmp ugt i32 %3, 1
  %56 = icmp ugt i32 %3, 2
  %57 = icmp ugt i32 %3, 3
  %58 = icmp ugt i32 %3, 4
  %59 = icmp ugt i32 %3, 5
  %60 = icmp ugt i32 %3, 6
  %61 = icmp ugt i32 %3, 7
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split.us.i, %44
  %62 = phi i64 [ 0, %44 ], [ %72, %.split.us.i ]
  %63 = icmp slt i64 %62, %49
  %64 = shl i64 %62, 3
  %.tr551.i = trunc i64 %62 to i32
  %65 = shl i32 %.tr551.i, 3
  %66 = sext i32 %65 to i64
  %67 = add nsw i64 %66, %53
  %.fr.i = freeze i1 %63
  br i1 %.fr.i, label %.preheader557.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr588.i = trunc i64 %62 to i32
  %68 = shl i32 %.tr588.i, 4
  %69 = add i32 %68, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %51, i32 %69
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader557.split.preheader.i:                  ; preds = %.preheader557.i
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader557.split.preheader.i
  %70 = trunc i64 %64 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %70
  store i16 0, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %72 = add nuw nsw i64 %62, 1
  %exitcond.not.i = icmp eq i64 %72, 16
  br i1 %exitcond.not.i, label %._crit_edge565.i, label %.preheader557.i, !llvm.loop !26

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader557.split.preheader.i
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %67
  %.sroa.0269.0.copyload.i = load i16, ptr %73, align 16, !tbaa.struct !23
  %74 = trunc i64 %64 to i32
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %74
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %75, align 2, !tbaa.struct !23
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i
  %76 = trunc i64 %64 to i32
  %77 = or disjoint i32 %76, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %77
  store i16 0, ptr addrspace(3) %78, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  %79 = or disjoint i64 %67, 1
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %79
  %.sroa.0269.0.copyload.1.i = load i16, ptr %80, align 2, !tbaa.struct !23
  %81 = trunc i64 %64 to i32
  %82 = or disjoint i32 %81, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %82
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %83, align 2, !tbaa.struct !23
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i
  %84 = trunc i64 %64 to i32
  %85 = or disjoint i32 %84, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %85
  store i16 0, ptr addrspace(3) %86, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.i
  %87 = or disjoint i64 %67, 2
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %87
  %.sroa.0269.0.copyload.2.i = load i16, ptr %88, align 4, !tbaa.struct !23
  %89 = trunc i64 %64 to i32
  %90 = or disjoint i32 %89, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %90
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %91, align 2, !tbaa.struct !23
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.thread.i
  %92 = trunc i64 %64 to i32
  %93 = or disjoint i32 %92, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %93
  store i16 0, ptr addrspace(3) %94, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.2.i
  %95 = or disjoint i64 %67, 3
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0269.0.copyload.3.i = load i16, ptr %96, align 2, !tbaa.struct !23
  %97 = trunc i64 %64 to i32
  %98 = or disjoint i32 %97, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %98
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %99, align 2, !tbaa.struct !23
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.thread.i
  %100 = trunc i64 %64 to i32
  %101 = or disjoint i32 %100, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %101
  store i16 0, ptr addrspace(3) %102, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.3.i
  %103 = or disjoint i64 %67, 4
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0269.0.copyload.4.i = load i16, ptr %104, align 8, !tbaa.struct !23
  %105 = trunc i64 %64 to i32
  %106 = or disjoint i32 %105, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %106
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %107, align 2, !tbaa.struct !23
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.thread.i
  %108 = trunc i64 %64 to i32
  %109 = or disjoint i32 %108, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %109
  store i16 0, ptr addrspace(3) %110, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.4.i
  %111 = or disjoint i64 %67, 5
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %111
  %.sroa.0269.0.copyload.5.i = load i16, ptr %112, align 2, !tbaa.struct !23
  %113 = trunc i64 %64 to i32
  %114 = or disjoint i32 %113, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %114
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %115, align 2, !tbaa.struct !23
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.thread.i
  %116 = trunc i64 %64 to i32
  %117 = or disjoint i32 %116, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %117
  store i16 0, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.5.i
  %119 = or disjoint i64 %67, 6
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0269.0.copyload.6.i = load i16, ptr %120, align 4, !tbaa.struct !23
  %121 = trunc i64 %64 to i32
  %122 = or disjoint i32 %121, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %122
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
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %128
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  br label %.split.us.i

._crit_edge565.i:                                 ; preds = %.split.us.i, %6
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
  %139 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 768
  %140 = lshr i64 %134, 4
  %141 = shl nuw nsw i64 %134, 3
  %142 = and i64 %141, 120
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
  %149 = icmp ult i64 %148, 128
  call void @llvm.assume(i1 %149)
  %150 = icmp eq i64 %148, 0
  br i1 %150, label %151, label %.lr.ph570.i

151:                                              ; preds = %._crit_edge565.i
  %152 = shl nuw i32 %.tr.i, 8
  %153 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %154 = icmp eq i64 %153, 0
  call void @llvm.assume(i1 %154)
  %155 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %156 = icmp eq i64 %155, 0
  call void @llvm.assume(i1 %156)
  %157 = sext i32 %4 to i64
  %158 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %159 = inttoptr i32 %158 to ptr addrspace(3)
  %160 = getelementptr inbounds i8, ptr addrspace(3) %159, i32 1024
  %161 = sext i32 %152 to i64
  %162 = icmp sgt i32 %5, 0
  %163 = icmp ugt i32 %5, 1
  %164 = icmp ugt i32 %5, 2
  %165 = icmp ugt i32 %5, 3
  %166 = icmp ugt i32 %5, 4
  %167 = icmp ugt i32 %5, 5
  %168 = icmp ugt i32 %5, 6
  %169 = icmp ugt i32 %5, 7
  %170 = icmp ugt i32 %5, 8
  %171 = icmp ugt i32 %5, 9
  %172 = icmp ugt i32 %5, 10
  %173 = icmp ugt i32 %5, 11
  %174 = icmp ugt i32 %5, 12
  %175 = icmp ugt i32 %5, 13
  %176 = icmp ugt i32 %5, 14
  %177 = icmp ugt i32 %5, 15
  br label %.preheader556.i

.preheader556.i:                                  ; preds = %.split567.us.i, %151
  %178 = phi i64 [ 0, %151 ], [ %188, %.split567.us.i ]
  %179 = icmp slt i64 %178, %157
  %180 = shl i64 %178, 4
  %.tr550.i = trunc i64 %178 to i32
  %181 = shl i32 %.tr550.i, 4
  %182 = sext i32 %181 to i64
  %183 = add nsw i64 %182, %161
  %.fr568.i = freeze i1 %179
  br i1 %.fr568.i, label %.preheader556.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader556.i
  %.tr587.i = trunc i64 %178 to i32
  %184 = shl i32 %.tr587.i, 5
  %185 = add i32 %184, 1024
  %scevgep581.i = getelementptr i8, ptr addrspace(3) %159, i32 %185
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep581.i, i8 0, i32 32, i1 false)
  br label %.split567.us.i

.preheader556.split.preheader.i:                  ; preds = %.preheader556.i
  br i1 %162, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader556.split.preheader.i
  %186 = trunc i64 %180 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %186
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split567.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %188 = add nuw nsw i64 %178, 1
  %exitcond583.not.i = icmp eq i64 %188, 16
  br i1 %exitcond583.not.i, label %.lr.ph570.i, label %.preheader556.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader556.split.preheader.i
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %183
  %.sroa.0232.0.copyload.i = load i16, ptr %189, align 32, !tbaa.struct !23
  %190 = trunc i64 %180 to i32
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %190
  store i16 %.sroa.0232.0.copyload.i, ptr addrspace(3) %191, align 2, !tbaa.struct !23
  br i1 %163, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %192 = trunc i64 %180 to i32
  %193 = or disjoint i32 %192, 1
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %193
  store i16 0, ptr addrspace(3) %194, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %195 = or disjoint i64 %183, 1
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %195
  %.sroa.0232.0.copyload.1.i = load i16, ptr %196, align 2, !tbaa.struct !23
  %197 = trunc i64 %180 to i32
  %198 = or disjoint i32 %197, 1
  %199 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %198
  store i16 %.sroa.0232.0.copyload.1.i, ptr addrspace(3) %199, align 2, !tbaa.struct !23
  br i1 %164, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %200 = trunc i64 %180 to i32
  %201 = or disjoint i32 %200, 2
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %201
  store i16 0, ptr addrspace(3) %202, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %203 = or disjoint i64 %183, 2
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %203
  %.sroa.0232.0.copyload.2.i = load i16, ptr %204, align 4, !tbaa.struct !23
  %205 = trunc i64 %180 to i32
  %206 = or disjoint i32 %205, 2
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %206
  store i16 %.sroa.0232.0.copyload.2.i, ptr addrspace(3) %207, align 2, !tbaa.struct !23
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %208 = trunc i64 %180 to i32
  %209 = or disjoint i32 %208, 3
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %209
  store i16 0, ptr addrspace(3) %210, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %211 = or disjoint i64 %183, 3
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %211
  %.sroa.0232.0.copyload.3.i = load i16, ptr %212, align 2, !tbaa.struct !23
  %213 = trunc i64 %180 to i32
  %214 = or disjoint i32 %213, 3
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %214
  store i16 %.sroa.0232.0.copyload.3.i, ptr addrspace(3) %215, align 2, !tbaa.struct !23
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %216 = trunc i64 %180 to i32
  %217 = or disjoint i32 %216, 4
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %217
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %219 = or disjoint i64 %183, 4
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %219
  %.sroa.0232.0.copyload.4.i = load i16, ptr %220, align 8, !tbaa.struct !23
  %221 = trunc i64 %180 to i32
  %222 = or disjoint i32 %221, 4
  %223 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %222
  store i16 %.sroa.0232.0.copyload.4.i, ptr addrspace(3) %223, align 2, !tbaa.struct !23
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %224 = trunc i64 %180 to i32
  %225 = or disjoint i32 %224, 5
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %225
  store i16 0, ptr addrspace(3) %226, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %227 = or disjoint i64 %183, 5
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %227
  %.sroa.0232.0.copyload.5.i = load i16, ptr %228, align 2, !tbaa.struct !23
  %229 = trunc i64 %180 to i32
  %230 = or disjoint i32 %229, 5
  %231 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %230
  store i16 %.sroa.0232.0.copyload.5.i, ptr addrspace(3) %231, align 2, !tbaa.struct !23
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %232 = trunc i64 %180 to i32
  %233 = or disjoint i32 %232, 6
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %233
  store i16 0, ptr addrspace(3) %234, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %235 = or disjoint i64 %183, 6
  %236 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %235
  %.sroa.0232.0.copyload.6.i = load i16, ptr %236, align 4, !tbaa.struct !23
  %237 = trunc i64 %180 to i32
  %238 = or disjoint i32 %237, 6
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %238
  store i16 %.sroa.0232.0.copyload.6.i, ptr addrspace(3) %239, align 2, !tbaa.struct !23
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %240 = trunc i64 %180 to i32
  %241 = or disjoint i32 %240, 7
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %241
  store i16 0, ptr addrspace(3) %242, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %243 = or disjoint i64 %183, 7
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %243
  %.sroa.0232.0.copyload.7.i = load i16, ptr %244, align 2, !tbaa.struct !23
  %245 = trunc i64 %180 to i32
  %246 = or disjoint i32 %245, 7
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %246
  store i16 %.sroa.0232.0.copyload.7.i, ptr addrspace(3) %247, align 2, !tbaa.struct !23
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %248 = trunc i64 %180 to i32
  %249 = or disjoint i32 %248, 8
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %249
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %251 = or disjoint i64 %183, 8
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %251
  %.sroa.0232.0.copyload.8.i = load i16, ptr %252, align 16, !tbaa.struct !23
  %253 = trunc i64 %180 to i32
  %254 = or disjoint i32 %253, 8
  %255 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %254
  store i16 %.sroa.0232.0.copyload.8.i, ptr addrspace(3) %255, align 2, !tbaa.struct !23
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %256 = trunc i64 %180 to i32
  %257 = or disjoint i32 %256, 9
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %257
  store i16 0, ptr addrspace(3) %258, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %259 = or disjoint i64 %183, 9
  %260 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %259
  %.sroa.0232.0.copyload.9.i = load i16, ptr %260, align 2, !tbaa.struct !23
  %261 = trunc i64 %180 to i32
  %262 = or disjoint i32 %261, 9
  %263 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %262
  store i16 %.sroa.0232.0.copyload.9.i, ptr addrspace(3) %263, align 2, !tbaa.struct !23
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %264 = trunc i64 %180 to i32
  %265 = or disjoint i32 %264, 10
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %265
  store i16 0, ptr addrspace(3) %266, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %267 = or disjoint i64 %183, 10
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %267
  %.sroa.0232.0.copyload.10.i = load i16, ptr %268, align 4, !tbaa.struct !23
  %269 = trunc i64 %180 to i32
  %270 = or disjoint i32 %269, 10
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %270
  store i16 %.sroa.0232.0.copyload.10.i, ptr addrspace(3) %271, align 2, !tbaa.struct !23
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %272 = trunc i64 %180 to i32
  %273 = or disjoint i32 %272, 11
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %273
  store i16 0, ptr addrspace(3) %274, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %275 = or disjoint i64 %183, 11
  %276 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %275
  %.sroa.0232.0.copyload.11.i = load i16, ptr %276, align 2, !tbaa.struct !23
  %277 = trunc i64 %180 to i32
  %278 = or disjoint i32 %277, 11
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %278
  store i16 %.sroa.0232.0.copyload.11.i, ptr addrspace(3) %279, align 2, !tbaa.struct !23
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %280 = trunc i64 %180 to i32
  %281 = or disjoint i32 %280, 12
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %281
  store i16 0, ptr addrspace(3) %282, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %283 = or disjoint i64 %183, 12
  %284 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %283
  %.sroa.0232.0.copyload.12.i = load i16, ptr %284, align 8, !tbaa.struct !23
  %285 = trunc i64 %180 to i32
  %286 = or disjoint i32 %285, 12
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %286
  store i16 %.sroa.0232.0.copyload.12.i, ptr addrspace(3) %287, align 2, !tbaa.struct !23
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %288 = trunc i64 %180 to i32
  %289 = or disjoint i32 %288, 13
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %289
  store i16 0, ptr addrspace(3) %290, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %291 = or disjoint i64 %183, 13
  %292 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %291
  %.sroa.0232.0.copyload.13.i = load i16, ptr %292, align 2, !tbaa.struct !23
  %293 = trunc i64 %180 to i32
  %294 = or disjoint i32 %293, 13
  %295 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %294
  store i16 %.sroa.0232.0.copyload.13.i, ptr addrspace(3) %295, align 2, !tbaa.struct !23
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %296 = trunc i64 %180 to i32
  %297 = or disjoint i32 %296, 14
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %297
  store i16 0, ptr addrspace(3) %298, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %299 = or disjoint i64 %183, 14
  %300 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %299
  %.sroa.0232.0.copyload.14.i = load i16, ptr %300, align 4, !tbaa.struct !23
  %301 = trunc i64 %180 to i32
  %302 = or disjoint i32 %301, 14
  %303 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %302
  store i16 %.sroa.0232.0.copyload.14.i, ptr addrspace(3) %303, align 2, !tbaa.struct !23
  br i1 %177, label %304, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

304:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %305 = or disjoint i64 %183, 15
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %305
  %.sroa.0232.0.copyload.15.i = load i16, ptr %306, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %304, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0234.2.15.i = phi i16 [ %.sroa.0232.0.copyload.15.i, %304 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %307 = trunc i64 %180 to i32
  %308 = or disjoint i32 %307, 15
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %160, i32 %308
  store i16 %.sroa.0234.2.15.i, ptr addrspace(3) %309, align 2, !tbaa.struct !23
  br label %.split567.us.i

.lr.ph570.i:                                      ; preds = %.split567.us.i, %._crit_edge565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %310 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %311 = icmp eq i64 %310, 0
  call void @llvm.assume(i1 %311)
  %312 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %313 = icmp eq i64 %312, 0
  call void @llvm.assume(i1 %313)
  %314 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %315 = icmp ult i64 %314, 128
  call void @llvm.assume(i1 %315)
  %316 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %317 = inttoptr i32 %316 to ptr addrspace(3)
  %318 = getelementptr inbounds i8, ptr addrspace(3) %317, i32 1024
  %319 = getelementptr inbounds i8, ptr addrspace(3) %317, i32 1536
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph573.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %320 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %321 = icmp eq i64 %320, 0
  call void @llvm.assume(i1 %321)
  %322 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %323 = icmp eq i64 %322, 0
  call void @llvm.assume(i1 %323)
  %324 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %325 = icmp ult i64 %324, 128
  call void @llvm.assume(i1 %325)
  %326 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %327 = inttoptr i32 %326 to ptr addrspace(3)
  %328 = getelementptr inbounds i8, ptr addrspace(3) %327, i32 768
  %329 = getelementptr inbounds i8, ptr addrspace(3) %327, i32 1536
  %330 = and i64 %324, 112
  %331 = and i64 %324, 15
  %332 = trunc i64 %324 to i32
  %333 = getelementptr inbounds float, ptr addrspace(3) %327, i32 %332
  %334 = load float, ptr addrspace(3) %333, align 4, !tbaa !19
  br label %349

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph570.i
  %335 = phi i64 [ %314, %.lr.ph570.i ], [ %344, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %336 = lshr i64 %335, 4
  %337 = shl nuw nsw i64 %335, 4
  %338 = and i64 %337, 240
  %339 = or disjoint i64 %338, %336
  %340 = trunc i64 %339 to i32
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %318, i32 %340
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %341, align 2, !tbaa.struct !23
  %342 = trunc i64 %335 to i32
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %319, i32 %342
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %343, align 2, !tbaa.struct !23
  %344 = add nuw nsw i64 %335, 128
  %345 = icmp ult i64 %335, 128
  br i1 %345, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph573.i, !llvm.loop !31

._crit_edge574.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %400, ptr addrspace(3) %333, align 4, !tbaa !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %346 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %347 = icmp ult i64 %346, 128
  call void @llvm.assume(i1 %347)
  %348 = icmp eq i64 %346, 0
  br i1 %348, label %402, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

349:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph573.i
  %350 = phi i64 [ 0, %.lr.ph573.i ], [ %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %351 = phi float [ %334, %.lr.ph573.i ], [ %400, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %352 = add nuw nsw i64 %350, %330
  %353 = trunc i64 %352 to i32
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %328, i32 %353
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %354, align 2, !tbaa.struct !23
  %355 = shl nuw nsw i64 %350, 4
  %356 = or disjoint i64 %355, %331
  %357 = trunc i64 %356 to i32
  %358 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %329, i32 %357
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %358, align 2, !tbaa.struct !23
  %359 = zext i16 %.sroa.0189.0.copyload.i to i32
  %360 = lshr i32 %359, 10
  %361 = and i32 %360, 31
  %362 = and i32 %359, 1023
  switch i32 %361, label %368 [
    i32 31, label %363
    i32 0, label %370
  ]

363:                                              ; preds = %349
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %364 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %362, 0
  %365 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %366 = or disjoint i32 %365, %364
  %367 = bitcast i32 %366 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

368:                                              ; preds = %349
  %369 = or disjoint i32 %362, 1024
  br label %370

370:                                              ; preds = %368, %349
  %371 = phi i32 [ %369, %368 ], [ %362, %349 ]
  %372 = uitofp i32 %371 to float
  %.not.i = icmp eq i32 %361, 0
  %373 = add nsw i32 %361, -25
  %374 = select i1 %.not.i, i32 -24, i32 %373
  %375 = call float @__ocml_ldexp_f32(float noundef %372, i32 noundef %374) #6
  %376 = fneg contract float %375
  %.not543544.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %377 = select contract i1 %.not543544.i, float %376, float %375
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %370, %363
  %378 = phi float [ %367, %363 ], [ %377, %370 ]
  %379 = zext i16 %.sroa.0180.0.copyload.i to i32
  %380 = lshr i32 %379, 10
  %381 = and i32 %380, 31
  %382 = and i32 %379, 1023
  switch i32 %381, label %388 [
    i32 31, label %383
    i32 0, label %390
  ]

383:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %384 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %382, 0
  %385 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %386 = or disjoint i32 %385, %384
  %387 = bitcast i32 %386 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

388:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %389 = or disjoint i32 %382, 1024
  br label %390

390:                                              ; preds = %388, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %391 = phi i32 [ %389, %388 ], [ %382, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %392 = uitofp i32 %391 to float
  %.not545.i = icmp eq i32 %381, 0
  %393 = add nsw i32 %381, -25
  %394 = select i1 %.not545.i, i32 -24, i32 %393
  %395 = call float @__ocml_ldexp_f32(float noundef %392, i32 noundef %394) #6
  %396 = fneg contract float %395
  %.not546547.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %397 = select contract i1 %.not546547.i, float %396, float %395
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %390, %383
  %398 = phi float [ %387, %383 ], [ %397, %390 ]
  %399 = fmul contract float %378, %398
  %400 = fadd contract float %351, %399
  %401 = add nuw nsw i64 %350, 1
  %exitcond584.not.i = icmp eq i64 %401, 16
  br i1 %exitcond584.not.i, label %._crit_edge574.i, label %349, !llvm.loop !32

402:                                              ; preds = %._crit_edge574.i
  %403 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %404 = icmp eq i64 %403, 0
  call void @llvm.assume(i1 %404)
  %405 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %406 = icmp eq i64 %405, 0
  call void @llvm.assume(i1 %406)
  %407 = sext i32 %3 to i64
  %408 = call i32 @llvm.amdgcn.groupstaticsize()
  %409 = inttoptr i32 %408 to ptr addrspace(3)
  %410 = zext i32 %40 to i64
  %411 = icmp sgt i32 %4, 0
  %412 = icmp ugt i32 %4, 1
  %413 = icmp ugt i32 %4, 2
  %414 = icmp ugt i32 %4, 3
  %415 = icmp ugt i32 %4, 4
  %416 = icmp ugt i32 %4, 5
  %417 = icmp ugt i32 %4, 6
  %418 = icmp ugt i32 %4, 7
  %419 = icmp ugt i32 %4, 8
  %420 = icmp ugt i32 %4, 9
  %421 = icmp ugt i32 %4, 10
  %422 = icmp ugt i32 %4, 11
  %423 = icmp ugt i32 %4, 12
  %424 = icmp ugt i32 %4, 13
  %425 = icmp ugt i32 %4, 14
  %426 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split576.us.i, %402
  %427 = phi i64 [ 0, %402 ], [ %433, %.split576.us.i ]
  %428 = icmp slt i64 %427, %407
  %429 = shl i64 %427, 4
  %.tr542.i = trunc i64 %427 to i32
  %430 = shl i32 %.tr542.i, 4
  %431 = sext i32 %430 to i64
  %432 = add nsw i64 %431, %410
  %.fr577.i = freeze i1 %428
  %brmerge.not.i = select i1 %.fr577.i, i1 %411, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split576.us.i

.split576.us.i:                                   ; preds = %522, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %433 = add nuw nsw i64 %427, 1
  %exitcond586.not.i = icmp eq i64 %433, 8
  br i1 %exitcond586.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %434 = trunc i64 %429 to i32
  %435 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %434
  %436 = load float, ptr addrspace(3) %435, align 4, !tbaa !19
  %437 = getelementptr inbounds float, ptr %9, i64 %432
  store float %436, ptr %437, align 32, !tbaa !19
  br i1 %412, label %.preheader.split.2.i, label %.split576.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %438 = trunc i64 %429 to i32
  %439 = or disjoint i32 %438, 1
  %440 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %439
  %441 = load float, ptr addrspace(3) %440, align 4, !tbaa !19
  %442 = or disjoint i64 %432, 1
  %443 = getelementptr inbounds float, ptr %9, i64 %442
  store float %441, ptr %443, align 4, !tbaa !19
  br i1 %413, label %.preheader.split.3.i, label %.split576.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %444 = trunc i64 %429 to i32
  %445 = or disjoint i32 %444, 2
  %446 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %445
  %447 = load float, ptr addrspace(3) %446, align 4, !tbaa !19
  %448 = or disjoint i64 %432, 2
  %449 = getelementptr inbounds float, ptr %9, i64 %448
  store float %447, ptr %449, align 8, !tbaa !19
  br i1 %414, label %.preheader.split.4.i, label %.split576.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %450 = trunc i64 %429 to i32
  %451 = or disjoint i32 %450, 3
  %452 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %451
  %453 = load float, ptr addrspace(3) %452, align 4, !tbaa !19
  %454 = or disjoint i64 %432, 3
  %455 = getelementptr inbounds float, ptr %9, i64 %454
  store float %453, ptr %455, align 4, !tbaa !19
  br i1 %415, label %.preheader.split.5.i, label %.split576.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %456 = trunc i64 %429 to i32
  %457 = or disjoint i32 %456, 4
  %458 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %457
  %459 = load float, ptr addrspace(3) %458, align 4, !tbaa !19
  %460 = or disjoint i64 %432, 4
  %461 = getelementptr inbounds float, ptr %9, i64 %460
  store float %459, ptr %461, align 16, !tbaa !19
  br i1 %416, label %.preheader.split.6.i, label %.split576.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %462 = trunc i64 %429 to i32
  %463 = or disjoint i32 %462, 5
  %464 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %463
  %465 = load float, ptr addrspace(3) %464, align 4, !tbaa !19
  %466 = or disjoint i64 %432, 5
  %467 = getelementptr inbounds float, ptr %9, i64 %466
  store float %465, ptr %467, align 4, !tbaa !19
  br i1 %417, label %.preheader.split.7.i, label %.split576.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %468 = trunc i64 %429 to i32
  %469 = or disjoint i32 %468, 6
  %470 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %469
  %471 = load float, ptr addrspace(3) %470, align 4, !tbaa !19
  %472 = or disjoint i64 %432, 6
  %473 = getelementptr inbounds float, ptr %9, i64 %472
  store float %471, ptr %473, align 8, !tbaa !19
  br i1 %418, label %.preheader.split.8.i, label %.split576.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %474 = trunc i64 %429 to i32
  %475 = or disjoint i32 %474, 7
  %476 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %475
  %477 = load float, ptr addrspace(3) %476, align 4, !tbaa !19
  %478 = or disjoint i64 %432, 7
  %479 = getelementptr inbounds float, ptr %9, i64 %478
  store float %477, ptr %479, align 4, !tbaa !19
  br i1 %419, label %.preheader.split.9.i, label %.split576.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %480 = trunc i64 %429 to i32
  %481 = or disjoint i32 %480, 8
  %482 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %481
  %483 = load float, ptr addrspace(3) %482, align 4, !tbaa !19
  %484 = or disjoint i64 %432, 8
  %485 = getelementptr inbounds float, ptr %9, i64 %484
  store float %483, ptr %485, align 32, !tbaa !19
  br i1 %420, label %.preheader.split.10.i, label %.split576.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %486 = trunc i64 %429 to i32
  %487 = or disjoint i32 %486, 9
  %488 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %487
  %489 = load float, ptr addrspace(3) %488, align 4, !tbaa !19
  %490 = or disjoint i64 %432, 9
  %491 = getelementptr inbounds float, ptr %9, i64 %490
  store float %489, ptr %491, align 4, !tbaa !19
  br i1 %421, label %.preheader.split.11.i, label %.split576.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %492 = trunc i64 %429 to i32
  %493 = or disjoint i32 %492, 10
  %494 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %493
  %495 = load float, ptr addrspace(3) %494, align 4, !tbaa !19
  %496 = or disjoint i64 %432, 10
  %497 = getelementptr inbounds float, ptr %9, i64 %496
  store float %495, ptr %497, align 8, !tbaa !19
  br i1 %422, label %.preheader.split.12.i, label %.split576.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %498 = trunc i64 %429 to i32
  %499 = or disjoint i32 %498, 11
  %500 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %499
  %501 = load float, ptr addrspace(3) %500, align 4, !tbaa !19
  %502 = or disjoint i64 %432, 11
  %503 = getelementptr inbounds float, ptr %9, i64 %502
  store float %501, ptr %503, align 4, !tbaa !19
  br i1 %423, label %.preheader.split.13.i, label %.split576.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %504 = trunc i64 %429 to i32
  %505 = or disjoint i32 %504, 12
  %506 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %505
  %507 = load float, ptr addrspace(3) %506, align 4, !tbaa !19
  %508 = or disjoint i64 %432, 12
  %509 = getelementptr inbounds float, ptr %9, i64 %508
  store float %507, ptr %509, align 16, !tbaa !19
  br i1 %424, label %.preheader.split.14.i, label %.split576.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %510 = trunc i64 %429 to i32
  %511 = or disjoint i32 %510, 13
  %512 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %511
  %513 = load float, ptr addrspace(3) %512, align 4, !tbaa !19
  %514 = or disjoint i64 %432, 13
  %515 = getelementptr inbounds float, ptr %9, i64 %514
  store float %513, ptr %515, align 4, !tbaa !19
  br i1 %425, label %.preheader.split.15.i, label %.split576.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %516 = trunc i64 %429 to i32
  %517 = or disjoint i32 %516, 14
  %518 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %517
  %519 = load float, ptr addrspace(3) %518, align 4, !tbaa !19
  %520 = or disjoint i64 %432, 14
  %521 = getelementptr inbounds float, ptr %9, i64 %520
  store float %519, ptr %521, align 8, !tbaa !19
  br i1 %426, label %522, label %.split576.us.i

522:                                              ; preds = %.preheader.split.15.i
  %523 = trunc i64 %429 to i32
  %524 = or disjoint i32 %523, 15
  %525 = getelementptr inbounds float, ptr addrspace(3) %409, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !19
  %527 = or disjoint i64 %432, 15
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 4, !tbaa !19
  br label %.split576.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge574.i, %.split576.us.i
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
!32 = distinct !{!32, !27}
!33 = distinct !{!33, !27}
;----------------- End AdaptiveCpp IR dump ---------------
