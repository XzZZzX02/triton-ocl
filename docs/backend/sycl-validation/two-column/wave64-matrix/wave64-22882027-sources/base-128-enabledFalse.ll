;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882027/tmp/triton-sycl-cache/compile-v9ds_2wv/kernel.cpp"
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
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %41 = icmp ult i64 %40, 128
  call void @llvm.assume(i1 %41)
  %42 = icmp eq i64 %40, 0
  br i1 %42, label %43, label %.lr.ph565.i

43:                                               ; preds = %6
  %44 = shl nuw i32 %.tr.i, 8
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
  br label %.preheader558.i

.preheader558.i:                                  ; preds = %.split.us.i, %43
  %62 = phi i64 [ 0, %43 ], [ %72, %.split.us.i ]
  %63 = icmp slt i64 %62, %49
  %64 = shl i64 %62, 3
  %.tr552.i = trunc i64 %62 to i32
  %65 = shl i32 %.tr552.i, 3
  %66 = sext i32 %65 to i64
  %67 = add nsw i64 %66, %53
  %.fr.i = freeze i1 %63
  br i1 %.fr.i, label %.preheader558.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i: ; preds = %.preheader558.i
  %.tr589.i = trunc i64 %62 to i32
  %68 = shl i32 %.tr589.i, 4
  %69 = add i32 %68, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %51, i32 %69
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader558.split.preheader.i:                  ; preds = %.preheader558.i
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.thread.i: ; preds = %.preheader558.split.preheader.i
  %70 = trunc i64 %64 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %70
  store i16 0, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.us.preheader.i
  %72 = add nuw nsw i64 %62, 1
  %exitcond.not.i = icmp eq i64 %72, 32
  br i1 %exitcond.not.i, label %.lr.ph565.i, label %.preheader558.i, !llvm.loop !26

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %.preheader558.split.preheader.i
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

.lr.ph565.i:                                      ; preds = %.split.us.i, %6
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
  %139 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge566.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  br i1 %142, label %154, label %.lr.ph571.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph565.i
  %143 = phi i64 [ %134, %.lr.ph565.i ], [ %152, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %144 = lshr i64 %143, 5
  %145 = shl nuw nsw i64 %143, 3
  %146 = and i64 %145, 248
  %147 = or disjoint i64 %146, %144
  %148 = trunc i64 %147 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %148
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %149, align 2, !tbaa.struct !23
  %150 = trunc i64 %143 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %139, i32 %150
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %151, align 2, !tbaa.struct !23
  %152 = add nuw nsw i64 %143, 128
  %153 = icmp ult i64 %143, 128
  br i1 %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge566.i, !llvm.loop !30

154:                                              ; preds = %._crit_edge566.i
  %155 = shl i32 %.tr.i, 9
  %156 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %157 = icmp eq i64 %156, 0
  call void @llvm.assume(i1 %157)
  %158 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %159 = icmp eq i64 %158, 0
  call void @llvm.assume(i1 %159)
  %160 = sext i32 %4 to i64
  %161 = sext i32 %5 to i64
  %162 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %163 = inttoptr i32 %162 to ptr addrspace(3)
  %164 = getelementptr inbounds i8, ptr addrspace(3) %163, i32 1536
  %165 = sext i32 %155 to i64
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split568.us.i, %154
  %166 = phi i64 [ 0, %154 ], [ %174, %.split568.us.i ]
  %167 = icmp slt i64 %166, %160
  %168 = shl i64 %166, 5
  %.tr551.i = trunc i64 %166 to i32
  %169 = shl i32 %.tr551.i, 5
  %170 = sext i32 %169 to i64
  %171 = add nsw i64 %170, %165
  %.fr569.i = freeze i1 %167
  br i1 %.fr569.i, label %.preheader557.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr588.i = trunc i64 %166 to i32
  %172 = shl i32 %.tr588.i, 6
  %173 = add i32 %172, 1536
  %scevgep582.i = getelementptr i8, ptr addrspace(3) %163, i32 %173
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep582.i, i8 0, i32 64, i1 false)
  br label %.split568.us.i

.split568.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %174 = add nuw nsw i64 %166, 1
  %exitcond584.not.i = icmp eq i64 %174, 16
  br i1 %exitcond584.not.i, label %.lr.ph571.i, label %.preheader557.i, !llvm.loop !31

.preheader557.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader557.i
  %175 = phi i64 [ %183, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader557.i ]
  %176 = icmp slt i64 %175, %161
  br i1 %176, label %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

177:                                              ; preds = %.preheader557.split.i
  %178 = add nuw nsw i64 %171, %175
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %178
  %.sroa.0232.0.copyload.i = load i16, ptr %179, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %177, %.preheader557.split.i
  %.sroa.0234.2.i = phi i16 [ %.sroa.0232.0.copyload.i, %177 ], [ 0, %.preheader557.split.i ]
  %180 = add nuw nsw i64 %175, %168
  %181 = trunc i64 %180 to i32
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %164, i32 %181
  store i16 %.sroa.0234.2.i, ptr addrspace(3) %182, align 2, !tbaa.struct !23
  %183 = add nuw nsw i64 %175, 1
  %exitcond583.not.i = icmp eq i64 %183, 32
  br i1 %exitcond583.not.i, label %.split568.us.i, label %.preheader557.split.i, !llvm.loop !32

.lr.ph571.i:                                      ; preds = %.split568.us.i, %._crit_edge566.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %184 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %185 = icmp eq i64 %184, 0
  call void @llvm.assume(i1 %185)
  %186 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %187 = icmp eq i64 %186, 0
  call void @llvm.assume(i1 %187)
  %188 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %189 = icmp ult i64 %188, 128
  call void @llvm.assume(i1 %189)
  %190 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %191 = inttoptr i32 %190 to ptr addrspace(3)
  %192 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 1536
  %193 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph574.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %194 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %195 = icmp eq i64 %194, 0
  call void @llvm.assume(i1 %195)
  %196 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %197 = icmp eq i64 %196, 0
  call void @llvm.assume(i1 %197)
  %198 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %199 = icmp ult i64 %198, 128
  call void @llvm.assume(i1 %199)
  %200 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %201 = inttoptr i32 %200 to ptr addrspace(3)
  %202 = getelementptr inbounds i8, ptr addrspace(3) %201, i32 1024
  %203 = getelementptr inbounds i8, ptr addrspace(3) %201, i32 2560
  %204 = and i64 %198, 15
  %205 = trunc i64 %198 to i32
  %206 = getelementptr inbounds float, ptr addrspace(3) %201, i32 %205
  %207 = load float, ptr addrspace(3) %206, align 4, !tbaa !19
  %208 = shl nuw nsw i64 %198, 1
  %209 = and i64 %208, 224
  br label %225

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph571.i
  %210 = phi i64 [ %188, %.lr.ph571.i ], [ %219, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %211 = lshr i64 %210, 4
  %212 = shl nuw nsw i64 %210, 5
  %213 = and i64 %212, 480
  %214 = or disjoint i64 %213, %211
  %215 = trunc i64 %214 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %215
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %216, align 2, !tbaa.struct !23
  %217 = trunc i64 %210 to i32
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %217
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %218, align 2, !tbaa.struct !23
  %219 = add nuw nsw i64 %210, 128
  %220 = icmp ult i64 %210, 384
  br i1 %220, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph574.i, !llvm.loop !33

._crit_edge575.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %276, ptr addrspace(3) %206, align 4, !tbaa !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %221 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %222 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %223 = icmp ult i64 %222, 128
  call void @llvm.assume(i1 %223)
  %224 = icmp eq i64 %222, 0
  br i1 %224, label %278, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

225:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph574.i
  %226 = phi i64 [ 0, %.lr.ph574.i ], [ %277, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %227 = phi float [ %207, %.lr.ph574.i ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %228 = add nuw nsw i64 %226, %209
  %229 = trunc i64 %228 to i32
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %202, i32 %229
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %230, align 2, !tbaa.struct !23
  %231 = shl nuw nsw i64 %226, 4
  %232 = or disjoint i64 %231, %204
  %233 = trunc i64 %232 to i32
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %203, i32 %233
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %234, align 2, !tbaa.struct !23
  %235 = zext i16 %.sroa.0189.0.copyload.i to i32
  %236 = lshr i32 %235, 10
  %237 = and i32 %236, 31
  %238 = and i32 %235, 1023
  switch i32 %237, label %244 [
    i32 31, label %239
    i32 0, label %246
  ]

239:                                              ; preds = %225
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %240 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %238, 0
  %241 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %242 = or disjoint i32 %241, %240
  %243 = bitcast i32 %242 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

244:                                              ; preds = %225
  %245 = or disjoint i32 %238, 1024
  br label %246

246:                                              ; preds = %244, %225
  %247 = phi i32 [ %245, %244 ], [ %238, %225 ]
  %248 = uitofp i32 %247 to float
  %.not.i = icmp eq i32 %237, 0
  %249 = add nsw i32 %237, -25
  %250 = select i1 %.not.i, i32 -24, i32 %249
  %251 = call float @__ocml_ldexp_f32(float noundef %248, i32 noundef %250) #6
  %252 = fneg contract float %251
  %.not544545.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %253 = select contract i1 %.not544545.i, float %252, float %251
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %246, %239
  %254 = phi float [ %243, %239 ], [ %253, %246 ]
  %255 = zext i16 %.sroa.0180.0.copyload.i to i32
  %256 = lshr i32 %255, 10
  %257 = and i32 %256, 31
  %258 = and i32 %255, 1023
  switch i32 %257, label %264 [
    i32 31, label %259
    i32 0, label %266
  ]

259:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %260 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %258, 0
  %261 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %262 = or disjoint i32 %261, %260
  %263 = bitcast i32 %262 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %265 = or disjoint i32 %258, 1024
  br label %266

266:                                              ; preds = %264, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %267 = phi i32 [ %265, %264 ], [ %258, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %268 = uitofp i32 %267 to float
  %.not546.i = icmp eq i32 %257, 0
  %269 = add nsw i32 %257, -25
  %270 = select i1 %.not546.i, i32 -24, i32 %269
  %271 = call float @__ocml_ldexp_f32(float noundef %268, i32 noundef %270) #6
  %272 = fneg contract float %271
  %.not547548.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %273 = select contract i1 %.not547548.i, float %272, float %271
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %266, %259
  %274 = phi float [ %263, %259 ], [ %273, %266 ]
  %275 = fmul contract float %254, %274
  %276 = fadd contract float %227, %275
  %277 = add nuw nsw i64 %226, 1
  %exitcond585.not.i = icmp eq i64 %277, 32
  br i1 %exitcond585.not.i, label %._crit_edge575.i, label %225, !llvm.loop !34

278:                                              ; preds = %._crit_edge575.i
  %279 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %280 = icmp eq i64 %279, 0
  call void @llvm.assume(i1 %280)
  %281 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %282 = icmp eq i64 %281, 0
  call void @llvm.assume(i1 %282)
  %283 = sext i32 %3 to i64
  %284 = call i32 @llvm.amdgcn.groupstaticsize()
  %285 = inttoptr i32 %284 to ptr addrspace(3)
  %286 = icmp sgt i32 %4, 0
  %287 = icmp ugt i32 %4, 1
  %288 = icmp ugt i32 %4, 2
  %289 = icmp ugt i32 %4, 3
  %290 = icmp ugt i32 %4, 4
  %291 = icmp ugt i32 %4, 5
  %292 = icmp ugt i32 %4, 6
  %293 = icmp ugt i32 %4, 7
  %294 = icmp ugt i32 %4, 8
  %295 = icmp ugt i32 %4, 9
  %296 = icmp ugt i32 %4, 10
  %297 = icmp ugt i32 %4, 11
  %298 = icmp ugt i32 %4, 12
  %299 = icmp ugt i32 %4, 13
  %300 = icmp ugt i32 %4, 14
  %301 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split577.us.i, %278
  %302 = phi i64 [ 0, %278 ], [ %308, %.split577.us.i ]
  %303 = icmp slt i64 %302, %283
  %304 = shl i64 %302, 4
  %.tr543.i = trunc i64 %302 to i32
  %305 = shl i32 %.tr543.i, 4
  %306 = sext i32 %305 to i64
  %307 = add nsw i64 %221, %306
  %.fr578.i = freeze i1 %303
  %brmerge.not.i = select i1 %.fr578.i, i1 %286, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split577.us.i

.split577.us.i:                                   ; preds = %397, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %308 = add nuw nsw i64 %302, 1
  %exitcond587.not.i = icmp eq i64 %308, 8
  br i1 %exitcond587.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %309 = trunc i64 %304 to i32
  %310 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %309
  %311 = load float, ptr addrspace(3) %310, align 4, !tbaa !19
  %312 = getelementptr inbounds float, ptr %9, i64 %307
  store float %311, ptr %312, align 32, !tbaa !19
  br i1 %287, label %.preheader.split.2.i, label %.split577.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %313 = trunc i64 %304 to i32
  %314 = or disjoint i32 %313, 1
  %315 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %314
  %316 = load float, ptr addrspace(3) %315, align 4, !tbaa !19
  %317 = or disjoint i64 %307, 1
  %318 = getelementptr inbounds float, ptr %9, i64 %317
  store float %316, ptr %318, align 4, !tbaa !19
  br i1 %288, label %.preheader.split.3.i, label %.split577.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %319 = trunc i64 %304 to i32
  %320 = or disjoint i32 %319, 2
  %321 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %320
  %322 = load float, ptr addrspace(3) %321, align 4, !tbaa !19
  %323 = or disjoint i64 %307, 2
  %324 = getelementptr inbounds float, ptr %9, i64 %323
  store float %322, ptr %324, align 8, !tbaa !19
  br i1 %289, label %.preheader.split.4.i, label %.split577.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %325 = trunc i64 %304 to i32
  %326 = or disjoint i32 %325, 3
  %327 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %326
  %328 = load float, ptr addrspace(3) %327, align 4, !tbaa !19
  %329 = or disjoint i64 %307, 3
  %330 = getelementptr inbounds float, ptr %9, i64 %329
  store float %328, ptr %330, align 4, !tbaa !19
  br i1 %290, label %.preheader.split.5.i, label %.split577.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %331 = trunc i64 %304 to i32
  %332 = or disjoint i32 %331, 4
  %333 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %332
  %334 = load float, ptr addrspace(3) %333, align 4, !tbaa !19
  %335 = or disjoint i64 %307, 4
  %336 = getelementptr inbounds float, ptr %9, i64 %335
  store float %334, ptr %336, align 16, !tbaa !19
  br i1 %291, label %.preheader.split.6.i, label %.split577.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %337 = trunc i64 %304 to i32
  %338 = or disjoint i32 %337, 5
  %339 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %338
  %340 = load float, ptr addrspace(3) %339, align 4, !tbaa !19
  %341 = or disjoint i64 %307, 5
  %342 = getelementptr inbounds float, ptr %9, i64 %341
  store float %340, ptr %342, align 4, !tbaa !19
  br i1 %292, label %.preheader.split.7.i, label %.split577.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %343 = trunc i64 %304 to i32
  %344 = or disjoint i32 %343, 6
  %345 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %344
  %346 = load float, ptr addrspace(3) %345, align 4, !tbaa !19
  %347 = or disjoint i64 %307, 6
  %348 = getelementptr inbounds float, ptr %9, i64 %347
  store float %346, ptr %348, align 8, !tbaa !19
  br i1 %293, label %.preheader.split.8.i, label %.split577.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %349 = trunc i64 %304 to i32
  %350 = or disjoint i32 %349, 7
  %351 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %350
  %352 = load float, ptr addrspace(3) %351, align 4, !tbaa !19
  %353 = or disjoint i64 %307, 7
  %354 = getelementptr inbounds float, ptr %9, i64 %353
  store float %352, ptr %354, align 4, !tbaa !19
  br i1 %294, label %.preheader.split.9.i, label %.split577.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %355 = trunc i64 %304 to i32
  %356 = or disjoint i32 %355, 8
  %357 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %356
  %358 = load float, ptr addrspace(3) %357, align 4, !tbaa !19
  %359 = or disjoint i64 %307, 8
  %360 = getelementptr inbounds float, ptr %9, i64 %359
  store float %358, ptr %360, align 32, !tbaa !19
  br i1 %295, label %.preheader.split.10.i, label %.split577.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %361 = trunc i64 %304 to i32
  %362 = or disjoint i32 %361, 9
  %363 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %362
  %364 = load float, ptr addrspace(3) %363, align 4, !tbaa !19
  %365 = or disjoint i64 %307, 9
  %366 = getelementptr inbounds float, ptr %9, i64 %365
  store float %364, ptr %366, align 4, !tbaa !19
  br i1 %296, label %.preheader.split.11.i, label %.split577.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %367 = trunc i64 %304 to i32
  %368 = or disjoint i32 %367, 10
  %369 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %368
  %370 = load float, ptr addrspace(3) %369, align 4, !tbaa !19
  %371 = or disjoint i64 %307, 10
  %372 = getelementptr inbounds float, ptr %9, i64 %371
  store float %370, ptr %372, align 8, !tbaa !19
  br i1 %297, label %.preheader.split.12.i, label %.split577.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %373 = trunc i64 %304 to i32
  %374 = or disjoint i32 %373, 11
  %375 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %374
  %376 = load float, ptr addrspace(3) %375, align 4, !tbaa !19
  %377 = or disjoint i64 %307, 11
  %378 = getelementptr inbounds float, ptr %9, i64 %377
  store float %376, ptr %378, align 4, !tbaa !19
  br i1 %298, label %.preheader.split.13.i, label %.split577.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %379 = trunc i64 %304 to i32
  %380 = or disjoint i32 %379, 12
  %381 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %380
  %382 = load float, ptr addrspace(3) %381, align 4, !tbaa !19
  %383 = or disjoint i64 %307, 12
  %384 = getelementptr inbounds float, ptr %9, i64 %383
  store float %382, ptr %384, align 16, !tbaa !19
  br i1 %299, label %.preheader.split.14.i, label %.split577.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %385 = trunc i64 %304 to i32
  %386 = or disjoint i32 %385, 13
  %387 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %386
  %388 = load float, ptr addrspace(3) %387, align 4, !tbaa !19
  %389 = or disjoint i64 %307, 13
  %390 = getelementptr inbounds float, ptr %9, i64 %389
  store float %388, ptr %390, align 4, !tbaa !19
  br i1 %300, label %.preheader.split.15.i, label %.split577.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %391 = trunc i64 %304 to i32
  %392 = or disjoint i32 %391, 14
  %393 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %392
  %394 = load float, ptr addrspace(3) %393, align 4, !tbaa !19
  %395 = or disjoint i64 %307, 14
  %396 = getelementptr inbounds float, ptr %9, i64 %395
  store float %394, ptr %396, align 8, !tbaa !19
  br i1 %301, label %397, label %.split577.us.i

397:                                              ; preds = %.preheader.split.15.i
  %398 = trunc i64 %304 to i32
  %399 = or disjoint i32 %398, 15
  %400 = getelementptr inbounds float, ptr addrspace(3) %285, i32 %399
  %401 = load float, ptr addrspace(3) %400, align 4, !tbaa !19
  %402 = or disjoint i64 %307, 15
  %403 = getelementptr inbounds float, ptr %9, i64 %402
  store float %401, ptr %403, align 4, !tbaa !19
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
!32 = distinct !{!32, !27, !28, !29}
!33 = distinct !{!33, !27, !28, !29}
!34 = distinct !{!34, !27}
!35 = distinct !{!35, !27}
;----------------- End AdaptiveCpp IR dump ---------------
