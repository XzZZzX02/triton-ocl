;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-_30mqbzk/kernel.cpp"
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
  %40 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %42 = icmp ult i64 %41, 128
  call void @llvm.assume(i1 %42)
  %43 = icmp eq i64 %41, 0
  br i1 %43, label %44, label %.loopexit407.i

44:                                               ; preds = %6
  %45 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = sext i32 %3 to i64
  %50 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %51 = inttoptr i32 %50 to ptr addrspace(3)
  %52 = getelementptr inbounds i8, ptr addrspace(3) %51, i32 512
  %53 = zext i32 %40 to i64
  %54 = icmp sgt i32 %5, 0
  %55 = icmp ugt i32 %5, 1
  %56 = icmp ugt i32 %5, 2
  %57 = icmp ugt i32 %5, 3
  %58 = icmp ugt i32 %5, 4
  %59 = icmp ugt i32 %5, 5
  %60 = icmp ugt i32 %5, 6
  %61 = icmp ugt i32 %5, 7
  %62 = icmp ugt i32 %5, 8
  %63 = icmp ugt i32 %5, 9
  %64 = icmp ugt i32 %5, 10
  %65 = icmp ugt i32 %5, 11
  %66 = icmp ugt i32 %5, 12
  %67 = icmp ugt i32 %5, 13
  %68 = icmp ugt i32 %5, 14
  %69 = icmp ugt i32 %5, 15
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split.us.i, %44
  %70 = phi i64 [ 0, %44 ], [ %80, %.split.us.i ]
  %71 = icmp slt i64 %70, %49
  %72 = shl i64 %70, 4
  %.tr400.i = trunc i64 %70 to i32
  %73 = shl i32 %.tr400.i, 4
  %74 = sext i32 %73 to i64
  %75 = add nsw i64 %74, %53
  %.fr.i = freeze i1 %71
  br i1 %.fr.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr431.i = trunc i64 %70 to i32
  %76 = shl i32 %.tr431.i, 5
  %77 = add i32 %76, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %51, i32 %77
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep.i, i8 0, i32 32, i1 false)
  br label %.split.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %78 = trunc i64 %72 to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %78
  store i16 0, ptr addrspace(3) %79, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %80 = add nuw nsw i64 %70, 1
  %exitcond.not.i = icmp eq i64 %80, 8
  br i1 %exitcond.not.i, label %.loopexit407.i, label %.preheader406.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader406.split.preheader.i
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %75
  %.sroa.0207.0.copyload.i = load i16, ptr %81, align 32, !tbaa.struct !27
  %82 = trunc i64 %72 to i32
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %82
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %83, align 2, !tbaa.struct !27
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %84 = trunc i64 %72 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %85
  store i16 0, ptr addrspace(3) %86, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %87 = or disjoint i64 %75, 1
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %87
  %.sroa.0207.0.copyload.1.i = load i16, ptr %88, align 2, !tbaa.struct !27
  %89 = trunc i64 %72 to i32
  %90 = or disjoint i32 %89, 1
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %90
  store i16 %.sroa.0207.0.copyload.1.i, ptr addrspace(3) %91, align 2, !tbaa.struct !27
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %92 = trunc i64 %72 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %93
  store i16 0, ptr addrspace(3) %94, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %95 = or disjoint i64 %75, 2
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0207.0.copyload.2.i = load i16, ptr %96, align 4, !tbaa.struct !27
  %97 = trunc i64 %72 to i32
  %98 = or disjoint i32 %97, 2
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %98
  store i16 %.sroa.0207.0.copyload.2.i, ptr addrspace(3) %99, align 2, !tbaa.struct !27
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %100 = trunc i64 %72 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %101
  store i16 0, ptr addrspace(3) %102, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %103 = or disjoint i64 %75, 3
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0207.0.copyload.3.i = load i16, ptr %104, align 2, !tbaa.struct !27
  %105 = trunc i64 %72 to i32
  %106 = or disjoint i32 %105, 3
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %106
  store i16 %.sroa.0207.0.copyload.3.i, ptr addrspace(3) %107, align 2, !tbaa.struct !27
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %108 = trunc i64 %72 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %109
  store i16 0, ptr addrspace(3) %110, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %111 = or disjoint i64 %75, 4
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %111
  %.sroa.0207.0.copyload.4.i = load i16, ptr %112, align 8, !tbaa.struct !27
  %113 = trunc i64 %72 to i32
  %114 = or disjoint i32 %113, 4
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %114
  store i16 %.sroa.0207.0.copyload.4.i, ptr addrspace(3) %115, align 2, !tbaa.struct !27
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %116 = trunc i64 %72 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %117
  store i16 0, ptr addrspace(3) %118, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %119 = or disjoint i64 %75, 5
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %119
  %.sroa.0207.0.copyload.5.i = load i16, ptr %120, align 2, !tbaa.struct !27
  %121 = trunc i64 %72 to i32
  %122 = or disjoint i32 %121, 5
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %122
  store i16 %.sroa.0207.0.copyload.5.i, ptr addrspace(3) %123, align 2, !tbaa.struct !27
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %124 = trunc i64 %72 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %125
  store i16 0, ptr addrspace(3) %126, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %127 = or disjoint i64 %75, 6
  %128 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %127
  %.sroa.0207.0.copyload.6.i = load i16, ptr %128, align 4, !tbaa.struct !27
  %129 = trunc i64 %72 to i32
  %130 = or disjoint i32 %129, 6
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %130
  store i16 %.sroa.0207.0.copyload.6.i, ptr addrspace(3) %131, align 2, !tbaa.struct !27
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %132 = trunc i64 %72 to i32
  %133 = or disjoint i32 %132, 7
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %133
  store i16 0, ptr addrspace(3) %134, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %135 = or disjoint i64 %75, 7
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %135
  %.sroa.0207.0.copyload.7.i = load i16, ptr %136, align 2, !tbaa.struct !27
  %137 = trunc i64 %72 to i32
  %138 = or disjoint i32 %137, 7
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %138
  store i16 %.sroa.0207.0.copyload.7.i, ptr addrspace(3) %139, align 2, !tbaa.struct !27
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i
  %140 = trunc i64 %72 to i32
  %141 = or disjoint i32 %140, 8
  %142 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %141
  store i16 0, ptr addrspace(3) %142, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i
  %143 = or disjoint i64 %75, 8
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %143
  %.sroa.0207.0.copyload.8.i = load i16, ptr %144, align 16, !tbaa.struct !27
  %145 = trunc i64 %72 to i32
  %146 = or disjoint i32 %145, 8
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %146
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %147, align 2, !tbaa.struct !27
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i
  %148 = trunc i64 %72 to i32
  %149 = or disjoint i32 %148, 9
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %149
  store i16 0, ptr addrspace(3) %150, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i
  %151 = or disjoint i64 %75, 9
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %151
  %.sroa.0207.0.copyload.9.i = load i16, ptr %152, align 2, !tbaa.struct !27
  %153 = trunc i64 %72 to i32
  %154 = or disjoint i32 %153, 9
  %155 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %154
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %155, align 2, !tbaa.struct !27
  br i1 %64, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i
  %156 = trunc i64 %72 to i32
  %157 = or disjoint i32 %156, 10
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %157
  store i16 0, ptr addrspace(3) %158, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i
  %159 = or disjoint i64 %75, 10
  %160 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %159
  %.sroa.0207.0.copyload.10.i = load i16, ptr %160, align 4, !tbaa.struct !27
  %161 = trunc i64 %72 to i32
  %162 = or disjoint i32 %161, 10
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %162
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %163, align 2, !tbaa.struct !27
  br i1 %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i
  %164 = trunc i64 %72 to i32
  %165 = or disjoint i32 %164, 11
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %165
  store i16 0, ptr addrspace(3) %166, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i
  %167 = or disjoint i64 %75, 11
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %167
  %.sroa.0207.0.copyload.11.i = load i16, ptr %168, align 2, !tbaa.struct !27
  %169 = trunc i64 %72 to i32
  %170 = or disjoint i32 %169, 11
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %170
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %171, align 2, !tbaa.struct !27
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i
  %172 = trunc i64 %72 to i32
  %173 = or disjoint i32 %172, 12
  %174 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %173
  store i16 0, ptr addrspace(3) %174, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i
  %175 = or disjoint i64 %75, 12
  %176 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %175
  %.sroa.0207.0.copyload.12.i = load i16, ptr %176, align 8, !tbaa.struct !27
  %177 = trunc i64 %72 to i32
  %178 = or disjoint i32 %177, 12
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %178
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %179, align 2, !tbaa.struct !27
  br i1 %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i
  %180 = trunc i64 %72 to i32
  %181 = or disjoint i32 %180, 13
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %181
  store i16 0, ptr addrspace(3) %182, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i
  %183 = or disjoint i64 %75, 13
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %183
  %.sroa.0207.0.copyload.13.i = load i16, ptr %184, align 2, !tbaa.struct !27
  %185 = trunc i64 %72 to i32
  %186 = or disjoint i32 %185, 13
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %186
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %187, align 2, !tbaa.struct !27
  br i1 %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i
  %188 = trunc i64 %72 to i32
  %189 = or disjoint i32 %188, 14
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %189
  store i16 0, ptr addrspace(3) %190, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i
  %191 = or disjoint i64 %75, 14
  %192 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %191
  %.sroa.0207.0.copyload.14.i = load i16, ptr %192, align 4, !tbaa.struct !27
  %193 = trunc i64 %72 to i32
  %194 = or disjoint i32 %193, 14
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %194
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %195, align 2, !tbaa.struct !27
  br i1 %69, label %196, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

196:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i
  %197 = or disjoint i64 %75, 15
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0207.0.copyload.15.i = load i16, ptr %198, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i: ; preds = %196, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i
  %.sroa.0209.2.15.i = phi i16 [ %.sroa.0207.0.copyload.15.i, %196 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i ]
  %199 = trunc i64 %72 to i32
  %200 = or disjoint i32 %199, 15
  %201 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %200
  store i16 %.sroa.0209.2.15.i, ptr addrspace(3) %201, align 2, !tbaa.struct !27
  br label %.split.us.i

.loopexit407.i:                                   ; preds = %.split.us.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %202 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %203 = icmp ult i64 %202, 128
  call void @llvm.assume(i1 %203)
  %204 = icmp eq i64 %202, 0
  br i1 %204, label %205, label %.lr.ph416.i

205:                                              ; preds = %.loopexit407.i
  %206 = shl nuw i32 %.tr.i, 8
  %207 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %208 = icmp eq i64 %207, 0
  call void @llvm.assume(i1 %208)
  %209 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %210 = icmp eq i64 %209, 0
  call void @llvm.assume(i1 %210)
  %211 = sext i32 %5 to i64
  %212 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %213 = inttoptr i32 %212 to ptr addrspace(3)
  %214 = getelementptr inbounds i8, ptr addrspace(3) %213, i32 768
  %215 = sext i32 %206 to i64
  %216 = icmp sgt i32 %4, 0
  %217 = icmp ugt i32 %4, 1
  %218 = icmp ugt i32 %4, 2
  %219 = icmp ugt i32 %4, 3
  %220 = icmp ugt i32 %4, 4
  %221 = icmp ugt i32 %4, 5
  %222 = icmp ugt i32 %4, 6
  %223 = icmp ugt i32 %4, 7
  %224 = icmp ugt i32 %4, 8
  %225 = icmp ugt i32 %4, 9
  %226 = icmp ugt i32 %4, 10
  %227 = icmp ugt i32 %4, 11
  %228 = icmp ugt i32 %4, 12
  %229 = icmp ugt i32 %4, 13
  %230 = icmp ugt i32 %4, 14
  %231 = icmp ugt i32 %4, 15
  br label %.preheader405.i

.preheader405.i:                                  ; preds = %.split413.us.i, %205
  %232 = phi i64 [ 0, %205 ], [ %242, %.split413.us.i ]
  %233 = icmp slt i64 %232, %211
  %234 = shl i64 %232, 4
  %.tr399.i = trunc i64 %232 to i32
  %235 = shl i32 %.tr399.i, 4
  %236 = sext i32 %235 to i64
  %237 = add nsw i64 %236, %215
  %.fr414.i = freeze i1 %233
  br i1 %.fr414.i, label %.preheader405.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i: ; preds = %.preheader405.i
  %.tr430.i = trunc i64 %232 to i32
  %238 = shl i32 %.tr430.i, 5
  %239 = add i32 %238, 768
  %scevgep424.i = getelementptr i8, ptr addrspace(3) %213, i32 %239
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep424.i, i8 0, i32 32, i1 false)
  br label %.split413.us.i

.preheader405.split.preheader.i:                  ; preds = %.preheader405.i
  br i1 %216, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i: ; preds = %.preheader405.split.preheader.i
  %240 = trunc i64 %234 to i32
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %240
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

.split413.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i
  %242 = add nuw nsw i64 %232, 1
  %exitcond426.not.i = icmp eq i64 %242, 16
  br i1 %exitcond426.not.i, label %.lr.ph416.i, label %.preheader405.i, !llvm.loop !34

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i: ; preds = %.preheader405.split.preheader.i
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %237
  %.sroa.0196.0.copyload.i = load i16, ptr %243, align 32, !tbaa.struct !27
  %244 = trunc i64 %234 to i32
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %244
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %245, align 2, !tbaa.struct !27
  br i1 %217, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i
  %246 = trunc i64 %234 to i32
  %247 = or disjoint i32 %246, 1
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %247
  store i16 0, ptr addrspace(3) %248, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i
  %249 = or disjoint i64 %237, 1
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %249
  %.sroa.0196.0.copyload.1.i = load i16, ptr %250, align 2, !tbaa.struct !27
  %251 = trunc i64 %234 to i32
  %252 = or disjoint i32 %251, 1
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %252
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %253, align 2, !tbaa.struct !27
  br i1 %218, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i
  %254 = trunc i64 %234 to i32
  %255 = or disjoint i32 %254, 2
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %255
  store i16 0, ptr addrspace(3) %256, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i
  %257 = or disjoint i64 %237, 2
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %257
  %.sroa.0196.0.copyload.2.i = load i16, ptr %258, align 4, !tbaa.struct !27
  %259 = trunc i64 %234 to i32
  %260 = or disjoint i32 %259, 2
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %260
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %261, align 2, !tbaa.struct !27
  br i1 %219, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i
  %262 = trunc i64 %234 to i32
  %263 = or disjoint i32 %262, 3
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %263
  store i16 0, ptr addrspace(3) %264, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i
  %265 = or disjoint i64 %237, 3
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %265
  %.sroa.0196.0.copyload.3.i = load i16, ptr %266, align 2, !tbaa.struct !27
  %267 = trunc i64 %234 to i32
  %268 = or disjoint i32 %267, 3
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %268
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %269, align 2, !tbaa.struct !27
  br i1 %220, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i
  %270 = trunc i64 %234 to i32
  %271 = or disjoint i32 %270, 4
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %271
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i
  %273 = or disjoint i64 %237, 4
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %273
  %.sroa.0196.0.copyload.4.i = load i16, ptr %274, align 8, !tbaa.struct !27
  %275 = trunc i64 %234 to i32
  %276 = or disjoint i32 %275, 4
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %276
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %277, align 2, !tbaa.struct !27
  br i1 %221, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i
  %278 = trunc i64 %234 to i32
  %279 = or disjoint i32 %278, 5
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %279
  store i16 0, ptr addrspace(3) %280, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i
  %281 = or disjoint i64 %237, 5
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %281
  %.sroa.0196.0.copyload.5.i = load i16, ptr %282, align 2, !tbaa.struct !27
  %283 = trunc i64 %234 to i32
  %284 = or disjoint i32 %283, 5
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %284
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %285, align 2, !tbaa.struct !27
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i
  %286 = trunc i64 %234 to i32
  %287 = or disjoint i32 %286, 6
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %287
  store i16 0, ptr addrspace(3) %288, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i
  %289 = or disjoint i64 %237, 6
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %289
  %.sroa.0196.0.copyload.6.i = load i16, ptr %290, align 4, !tbaa.struct !27
  %291 = trunc i64 %234 to i32
  %292 = or disjoint i32 %291, 6
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %292
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %293, align 2, !tbaa.struct !27
  br i1 %223, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i
  %294 = trunc i64 %234 to i32
  %295 = or disjoint i32 %294, 7
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %295
  store i16 0, ptr addrspace(3) %296, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i
  %297 = or disjoint i64 %237, 7
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %297
  %.sroa.0196.0.copyload.7.i = load i16, ptr %298, align 2, !tbaa.struct !27
  %299 = trunc i64 %234 to i32
  %300 = or disjoint i32 %299, 7
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %300
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %301, align 2, !tbaa.struct !27
  br i1 %224, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i
  %302 = trunc i64 %234 to i32
  %303 = or disjoint i32 %302, 8
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %303
  store i16 0, ptr addrspace(3) %304, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i
  %305 = or disjoint i64 %237, 8
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %305
  %.sroa.0196.0.copyload.8.i = load i16, ptr %306, align 16, !tbaa.struct !27
  %307 = trunc i64 %234 to i32
  %308 = or disjoint i32 %307, 8
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %308
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %309, align 2, !tbaa.struct !27
  br i1 %225, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i
  %310 = trunc i64 %234 to i32
  %311 = or disjoint i32 %310, 9
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %311
  store i16 0, ptr addrspace(3) %312, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i
  %313 = or disjoint i64 %237, 9
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %313
  %.sroa.0196.0.copyload.9.i = load i16, ptr %314, align 2, !tbaa.struct !27
  %315 = trunc i64 %234 to i32
  %316 = or disjoint i32 %315, 9
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %316
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %317, align 2, !tbaa.struct !27
  br i1 %226, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i
  %318 = trunc i64 %234 to i32
  %319 = or disjoint i32 %318, 10
  %320 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %319
  store i16 0, ptr addrspace(3) %320, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i
  %321 = or disjoint i64 %237, 10
  %322 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %321
  %.sroa.0196.0.copyload.10.i = load i16, ptr %322, align 4, !tbaa.struct !27
  %323 = trunc i64 %234 to i32
  %324 = or disjoint i32 %323, 10
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %324
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %325, align 2, !tbaa.struct !27
  br i1 %227, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i
  %326 = trunc i64 %234 to i32
  %327 = or disjoint i32 %326, 11
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %327
  store i16 0, ptr addrspace(3) %328, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i
  %329 = or disjoint i64 %237, 11
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %329
  %.sroa.0196.0.copyload.11.i = load i16, ptr %330, align 2, !tbaa.struct !27
  %331 = trunc i64 %234 to i32
  %332 = or disjoint i32 %331, 11
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %332
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %333, align 2, !tbaa.struct !27
  br i1 %228, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i
  %334 = trunc i64 %234 to i32
  %335 = or disjoint i32 %334, 12
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %335
  store i16 0, ptr addrspace(3) %336, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i
  %337 = or disjoint i64 %237, 12
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %337
  %.sroa.0196.0.copyload.12.i = load i16, ptr %338, align 8, !tbaa.struct !27
  %339 = trunc i64 %234 to i32
  %340 = or disjoint i32 %339, 12
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %340
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %341, align 2, !tbaa.struct !27
  br i1 %229, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i
  %342 = trunc i64 %234 to i32
  %343 = or disjoint i32 %342, 13
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %343
  store i16 0, ptr addrspace(3) %344, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i
  %345 = or disjoint i64 %237, 13
  %346 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %345
  %.sroa.0196.0.copyload.13.i = load i16, ptr %346, align 2, !tbaa.struct !27
  %347 = trunc i64 %234 to i32
  %348 = or disjoint i32 %347, 13
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %348
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %349, align 2, !tbaa.struct !27
  br i1 %230, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i
  %350 = trunc i64 %234 to i32
  %351 = or disjoint i32 %350, 14
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %351
  store i16 0, ptr addrspace(3) %352, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i
  %353 = or disjoint i64 %237, 14
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %353
  %.sroa.0196.0.copyload.14.i = load i16, ptr %354, align 4, !tbaa.struct !27
  %355 = trunc i64 %234 to i32
  %356 = or disjoint i32 %355, 14
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %356
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %357, align 2, !tbaa.struct !27
  br i1 %231, label %358, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

358:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i
  %359 = or disjoint i64 %237, 15
  %360 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %359
  %.sroa.0196.0.copyload.15.i = load i16, ptr %360, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i: ; preds = %358, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %358 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i ]
  %361 = trunc i64 %234 to i32
  %362 = or disjoint i32 %361, 15
  %363 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %214, i32 %362
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %363, align 2, !tbaa.struct !27
  br label %.split413.us.i

.lr.ph416.i:                                      ; preds = %.split413.us.i, %.loopexit407.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %364 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %365 = icmp eq i64 %364, 0
  call void @llvm.assume(i1 %365)
  %366 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %367 = icmp eq i64 %366, 0
  call void @llvm.assume(i1 %367)
  %368 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %369 = icmp ult i64 %368, 128
  call void @llvm.assume(i1 %369)
  %370 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %371 = inttoptr i32 %370 to ptr addrspace(3)
  %372 = getelementptr inbounds i8, ptr addrspace(3) %371, i32 512
  %373 = getelementptr inbounds i8, ptr addrspace(3) %371, i32 768
  %374 = and i64 %368, 112
  %375 = and i64 %368, 15
  %376 = trunc i64 %368 to i32
  %377 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %376
  %378 = load float, ptr addrspace(3) %377, align 4, !tbaa !23
  br label %382

._crit_edge417.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %433, ptr addrspace(3) %377, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %379 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %380 = icmp ult i64 %379, 128
  call void @llvm.assume(i1 %380)
  %381 = icmp eq i64 %379, 0
  br i1 %381, label %435, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

382:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph416.i
  %383 = phi i64 [ 0, %.lr.ph416.i ], [ %434, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %384 = phi float [ %378, %.lr.ph416.i ], [ %433, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %385 = add nuw nsw i64 %383, %374
  %386 = trunc i64 %385 to i32
  %387 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %372, i32 %386
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %387, align 2, !tbaa.struct !27
  %388 = shl nuw nsw i64 %383, 4
  %389 = or disjoint i64 %388, %375
  %390 = trunc i64 %389 to i32
  %391 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %373, i32 %390
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %391, align 2, !tbaa.struct !27
  %392 = zext i16 %.sroa.0179.0.copyload.i to i32
  %393 = lshr i32 %392, 10
  %394 = and i32 %393, 31
  %395 = and i32 %392, 1023
  switch i32 %394, label %401 [
    i32 31, label %396
    i32 0, label %403
  ]

396:                                              ; preds = %382
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %397 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %395, 0
  %398 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %399 = or disjoint i32 %398, %397
  %400 = bitcast i32 %399 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

401:                                              ; preds = %382
  %402 = or disjoint i32 %395, 1024
  br label %403

403:                                              ; preds = %401, %382
  %404 = phi i32 [ %402, %401 ], [ %395, %382 ]
  %405 = uitofp i32 %404 to float
  %.not.i = icmp eq i32 %394, 0
  %406 = add nsw i32 %394, -25
  %407 = select i1 %.not.i, i32 -24, i32 %406
  %408 = call float @__ocml_ldexp_f32(float noundef %405, i32 noundef %407) #6
  %409 = fneg contract float %408
  %.not392393.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %410 = select contract i1 %.not392393.i, float %409, float %408
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i: ; preds = %403, %396
  %411 = phi float [ %400, %396 ], [ %410, %403 ]
  %412 = zext i16 %.sroa.0170.0.copyload.i to i32
  %413 = lshr i32 %412, 10
  %414 = and i32 %413, 31
  %415 = and i32 %412, 1023
  switch i32 %414, label %421 [
    i32 31, label %416
    i32 0, label %423
  ]

416:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %417 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not397.i = icmp eq i32 %415, 0
  %418 = select i1 %.not397.i, i32 2139095040, i32 2143289344
  %419 = or disjoint i32 %418, %417
  %420 = bitcast i32 %419 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

421:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %422 = or disjoint i32 %415, 1024
  br label %423

423:                                              ; preds = %421, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %424 = phi i32 [ %422, %421 ], [ %415, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i ]
  %425 = uitofp i32 %424 to float
  %.not394.i = icmp eq i32 %414, 0
  %426 = add nsw i32 %414, -25
  %427 = select i1 %.not394.i, i32 -24, i32 %426
  %428 = call float @__ocml_ldexp_f32(float noundef %425, i32 noundef %427) #6
  %429 = fneg contract float %428
  %.not395396.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %430 = select contract i1 %.not395396.i, float %429, float %428
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %423, %416
  %431 = phi float [ %420, %416 ], [ %430, %423 ]
  %432 = fmul contract float %411, %431
  %433 = fadd contract float %384, %432
  %434 = add nuw nsw i64 %383, 1
  %exitcond427.not.i = icmp eq i64 %434, 16
  br i1 %exitcond427.not.i, label %._crit_edge417.i, label %382, !llvm.loop !35

435:                                              ; preds = %._crit_edge417.i
  %436 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %437 = icmp eq i64 %436, 0
  call void @llvm.assume(i1 %437)
  %438 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %439 = icmp eq i64 %438, 0
  call void @llvm.assume(i1 %439)
  %440 = sext i32 %3 to i64
  %441 = call i32 @llvm.amdgcn.groupstaticsize()
  %442 = inttoptr i32 %441 to ptr addrspace(3)
  %443 = zext i32 %40 to i64
  %444 = icmp sgt i32 %4, 0
  %445 = icmp ugt i32 %4, 1
  %446 = icmp ugt i32 %4, 2
  %447 = icmp ugt i32 %4, 3
  %448 = icmp ugt i32 %4, 4
  %449 = icmp ugt i32 %4, 5
  %450 = icmp ugt i32 %4, 6
  %451 = icmp ugt i32 %4, 7
  %452 = icmp ugt i32 %4, 8
  %453 = icmp ugt i32 %4, 9
  %454 = icmp ugt i32 %4, 10
  %455 = icmp ugt i32 %4, 11
  %456 = icmp ugt i32 %4, 12
  %457 = icmp ugt i32 %4, 13
  %458 = icmp ugt i32 %4, 14
  %459 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split419.us.i, %435
  %460 = phi i64 [ 0, %435 ], [ %466, %.split419.us.i ]
  %461 = icmp slt i64 %460, %440
  %462 = shl i64 %460, 4
  %.tr391.i = trunc i64 %460 to i32
  %463 = shl i32 %.tr391.i, 4
  %464 = sext i32 %463 to i64
  %465 = add nsw i64 %464, %443
  %.fr420.i = freeze i1 %461
  %brmerge.not.i = select i1 %.fr420.i, i1 %444, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split419.us.i

.split419.us.i:                                   ; preds = %555, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %466 = add nuw nsw i64 %460, 1
  %exitcond429.not.i = icmp eq i64 %466, 8
  br i1 %exitcond429.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %467 = trunc i64 %462 to i32
  %468 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !23
  %470 = getelementptr inbounds float, ptr %9, i64 %465
  store float %469, ptr %470, align 32, !tbaa !23
  br i1 %445, label %.preheader.split.2.i, label %.split419.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %471 = trunc i64 %462 to i32
  %472 = or disjoint i32 %471, 1
  %473 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !23
  %475 = or disjoint i64 %465, 1
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 4, !tbaa !23
  br i1 %446, label %.preheader.split.3.i, label %.split419.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %477 = trunc i64 %462 to i32
  %478 = or disjoint i32 %477, 2
  %479 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !23
  %481 = or disjoint i64 %465, 2
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 8, !tbaa !23
  br i1 %447, label %.preheader.split.4.i, label %.split419.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %483 = trunc i64 %462 to i32
  %484 = or disjoint i32 %483, 3
  %485 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %484
  %486 = load float, ptr addrspace(3) %485, align 4, !tbaa !23
  %487 = or disjoint i64 %465, 3
  %488 = getelementptr inbounds float, ptr %9, i64 %487
  store float %486, ptr %488, align 4, !tbaa !23
  br i1 %448, label %.preheader.split.5.i, label %.split419.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %489 = trunc i64 %462 to i32
  %490 = or disjoint i32 %489, 4
  %491 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %490
  %492 = load float, ptr addrspace(3) %491, align 4, !tbaa !23
  %493 = or disjoint i64 %465, 4
  %494 = getelementptr inbounds float, ptr %9, i64 %493
  store float %492, ptr %494, align 16, !tbaa !23
  br i1 %449, label %.preheader.split.6.i, label %.split419.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %495 = trunc i64 %462 to i32
  %496 = or disjoint i32 %495, 5
  %497 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %496
  %498 = load float, ptr addrspace(3) %497, align 4, !tbaa !23
  %499 = or disjoint i64 %465, 5
  %500 = getelementptr inbounds float, ptr %9, i64 %499
  store float %498, ptr %500, align 4, !tbaa !23
  br i1 %450, label %.preheader.split.7.i, label %.split419.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %501 = trunc i64 %462 to i32
  %502 = or disjoint i32 %501, 6
  %503 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %502
  %504 = load float, ptr addrspace(3) %503, align 4, !tbaa !23
  %505 = or disjoint i64 %465, 6
  %506 = getelementptr inbounds float, ptr %9, i64 %505
  store float %504, ptr %506, align 8, !tbaa !23
  br i1 %451, label %.preheader.split.8.i, label %.split419.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %507 = trunc i64 %462 to i32
  %508 = or disjoint i32 %507, 7
  %509 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %508
  %510 = load float, ptr addrspace(3) %509, align 4, !tbaa !23
  %511 = or disjoint i64 %465, 7
  %512 = getelementptr inbounds float, ptr %9, i64 %511
  store float %510, ptr %512, align 4, !tbaa !23
  br i1 %452, label %.preheader.split.9.i, label %.split419.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %513 = trunc i64 %462 to i32
  %514 = or disjoint i32 %513, 8
  %515 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %514
  %516 = load float, ptr addrspace(3) %515, align 4, !tbaa !23
  %517 = or disjoint i64 %465, 8
  %518 = getelementptr inbounds float, ptr %9, i64 %517
  store float %516, ptr %518, align 32, !tbaa !23
  br i1 %453, label %.preheader.split.10.i, label %.split419.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %519 = trunc i64 %462 to i32
  %520 = or disjoint i32 %519, 9
  %521 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %520
  %522 = load float, ptr addrspace(3) %521, align 4, !tbaa !23
  %523 = or disjoint i64 %465, 9
  %524 = getelementptr inbounds float, ptr %9, i64 %523
  store float %522, ptr %524, align 4, !tbaa !23
  br i1 %454, label %.preheader.split.11.i, label %.split419.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %525 = trunc i64 %462 to i32
  %526 = or disjoint i32 %525, 10
  %527 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !23
  %529 = or disjoint i64 %465, 10
  %530 = getelementptr inbounds float, ptr %9, i64 %529
  store float %528, ptr %530, align 8, !tbaa !23
  br i1 %455, label %.preheader.split.12.i, label %.split419.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %531 = trunc i64 %462 to i32
  %532 = or disjoint i32 %531, 11
  %533 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %532
  %534 = load float, ptr addrspace(3) %533, align 4, !tbaa !23
  %535 = or disjoint i64 %465, 11
  %536 = getelementptr inbounds float, ptr %9, i64 %535
  store float %534, ptr %536, align 4, !tbaa !23
  br i1 %456, label %.preheader.split.13.i, label %.split419.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %537 = trunc i64 %462 to i32
  %538 = or disjoint i32 %537, 12
  %539 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %538
  %540 = load float, ptr addrspace(3) %539, align 4, !tbaa !23
  %541 = or disjoint i64 %465, 12
  %542 = getelementptr inbounds float, ptr %9, i64 %541
  store float %540, ptr %542, align 16, !tbaa !23
  br i1 %457, label %.preheader.split.14.i, label %.split419.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %543 = trunc i64 %462 to i32
  %544 = or disjoint i32 %543, 13
  %545 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %544
  %546 = load float, ptr addrspace(3) %545, align 4, !tbaa !23
  %547 = or disjoint i64 %465, 13
  %548 = getelementptr inbounds float, ptr %9, i64 %547
  store float %546, ptr %548, align 4, !tbaa !23
  br i1 %458, label %.preheader.split.15.i, label %.split419.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %549 = trunc i64 %462 to i32
  %550 = or disjoint i32 %549, 14
  %551 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %550
  %552 = load float, ptr addrspace(3) %551, align 4, !tbaa !23
  %553 = or disjoint i64 %465, 14
  %554 = getelementptr inbounds float, ptr %9, i64 %553
  store float %552, ptr %554, align 8, !tbaa !23
  br i1 %459, label %555, label %.split419.us.i

555:                                              ; preds = %.preheader.split.15.i
  %556 = trunc i64 %462 to i32
  %557 = or disjoint i32 %556, 15
  %558 = getelementptr inbounds float, ptr addrspace(3) %442, i32 %557
  %559 = load float, ptr addrspace(3) %558, align 4, !tbaa !23
  %560 = or disjoint i64 %465, 15
  %561 = getelementptr inbounds float, ptr %9, i64 %560
  store float %559, ptr %561, align 4, !tbaa !23
  br label %.split419.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge417.i, %.split419.us.i
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
!35 = distinct !{!35, !31}
!36 = distinct !{!36, !31}
;----------------- End AdaptiveCpp IR dump ---------------
