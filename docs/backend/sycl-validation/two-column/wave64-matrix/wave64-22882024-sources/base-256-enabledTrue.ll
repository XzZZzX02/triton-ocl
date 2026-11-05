;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-ae_swpx_/kernel.cpp"
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
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 8388608
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
  %33 = icmp ult i64 %32, 256
  call void @llvm.assume(i1 %33)
  %34 = icmp ult i64 %32, 128
  br i1 %34, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %6
  %35 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %36 = inttoptr i32 %35 to ptr addrspace(3)
  %37 = trunc i64 %32 to i32
  %38 = getelementptr inbounds float, ptr addrspace(3) %36, i32 %37
  store float 0.000000e+00, ptr addrspace(3) %38, align 4, !tbaa !23
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %40 = icmp ult i64 %39, 8388607
  call void @llvm.assume(i1 %40)
  %.tr.i = trunc i64 %39 to i32
  %41 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %43 = icmp ult i64 %42, 256
  call void @llvm.assume(i1 %43)
  %44 = icmp eq i64 %42, 0
  br i1 %44, label %45, label %.loopexit407.i

45:                                               ; preds = %._crit_edge.i
  %46 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = sext i32 %3 to i64
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 512
  %54 = zext i32 %41 to i64
  %55 = icmp sgt i32 %5, 0
  %56 = icmp ugt i32 %5, 1
  %57 = icmp ugt i32 %5, 2
  %58 = icmp ugt i32 %5, 3
  %59 = icmp ugt i32 %5, 4
  %60 = icmp ugt i32 %5, 5
  %61 = icmp ugt i32 %5, 6
  %62 = icmp ugt i32 %5, 7
  %63 = icmp ugt i32 %5, 8
  %64 = icmp ugt i32 %5, 9
  %65 = icmp ugt i32 %5, 10
  %66 = icmp ugt i32 %5, 11
  %67 = icmp ugt i32 %5, 12
  %68 = icmp ugt i32 %5, 13
  %69 = icmp ugt i32 %5, 14
  %70 = icmp ugt i32 %5, 15
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split.us.i, %45
  %71 = phi i64 [ 0, %45 ], [ %81, %.split.us.i ]
  %72 = icmp slt i64 %71, %50
  %73 = shl i64 %71, 4
  %.tr400.i = trunc i64 %71 to i32
  %74 = shl i32 %.tr400.i, 4
  %75 = sext i32 %74 to i64
  %76 = add nsw i64 %75, %54
  %.fr.i = freeze i1 %72
  br i1 %.fr.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr431.i = trunc i64 %71 to i32
  %77 = shl i32 %.tr431.i, 5
  %78 = add i32 %77, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %52, i32 %78
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep.i, i8 0, i32 32, i1 false)
  br label %.split.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %79 = trunc i64 %73 to i32
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %79
  store i16 0, ptr addrspace(3) %80, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %81 = add nuw nsw i64 %71, 1
  %exitcond.not.i = icmp eq i64 %81, 8
  br i1 %exitcond.not.i, label %.loopexit407.i, label %.preheader406.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader406.split.preheader.i
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0207.0.copyload.i = load i16, ptr %82, align 32, !tbaa.struct !27
  %83 = trunc i64 %73 to i32
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %83
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %84, align 2, !tbaa.struct !27
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %85 = trunc i64 %73 to i32
  %86 = or disjoint i32 %85, 1
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %86
  store i16 0, ptr addrspace(3) %87, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %88 = or disjoint i64 %76, 1
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %88
  %.sroa.0207.0.copyload.1.i = load i16, ptr %89, align 2, !tbaa.struct !27
  %90 = trunc i64 %73 to i32
  %91 = or disjoint i32 %90, 1
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %91
  store i16 %.sroa.0207.0.copyload.1.i, ptr addrspace(3) %92, align 2, !tbaa.struct !27
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %93 = trunc i64 %73 to i32
  %94 = or disjoint i32 %93, 2
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %94
  store i16 0, ptr addrspace(3) %95, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %96 = or disjoint i64 %76, 2
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %96
  %.sroa.0207.0.copyload.2.i = load i16, ptr %97, align 4, !tbaa.struct !27
  %98 = trunc i64 %73 to i32
  %99 = or disjoint i32 %98, 2
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %99
  store i16 %.sroa.0207.0.copyload.2.i, ptr addrspace(3) %100, align 2, !tbaa.struct !27
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %101 = trunc i64 %73 to i32
  %102 = or disjoint i32 %101, 3
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %102
  store i16 0, ptr addrspace(3) %103, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %104 = or disjoint i64 %76, 3
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0207.0.copyload.3.i = load i16, ptr %105, align 2, !tbaa.struct !27
  %106 = trunc i64 %73 to i32
  %107 = or disjoint i32 %106, 3
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %107
  store i16 %.sroa.0207.0.copyload.3.i, ptr addrspace(3) %108, align 2, !tbaa.struct !27
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %109 = trunc i64 %73 to i32
  %110 = or disjoint i32 %109, 4
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %110
  store i16 0, ptr addrspace(3) %111, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %112 = or disjoint i64 %76, 4
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %112
  %.sroa.0207.0.copyload.4.i = load i16, ptr %113, align 8, !tbaa.struct !27
  %114 = trunc i64 %73 to i32
  %115 = or disjoint i32 %114, 4
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %115
  store i16 %.sroa.0207.0.copyload.4.i, ptr addrspace(3) %116, align 2, !tbaa.struct !27
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %117 = trunc i64 %73 to i32
  %118 = or disjoint i32 %117, 5
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %118
  store i16 0, ptr addrspace(3) %119, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %120 = or disjoint i64 %76, 5
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %120
  %.sroa.0207.0.copyload.5.i = load i16, ptr %121, align 2, !tbaa.struct !27
  %122 = trunc i64 %73 to i32
  %123 = or disjoint i32 %122, 5
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %123
  store i16 %.sroa.0207.0.copyload.5.i, ptr addrspace(3) %124, align 2, !tbaa.struct !27
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %125 = trunc i64 %73 to i32
  %126 = or disjoint i32 %125, 6
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %126
  store i16 0, ptr addrspace(3) %127, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %128 = or disjoint i64 %76, 6
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0207.0.copyload.6.i = load i16, ptr %129, align 4, !tbaa.struct !27
  %130 = trunc i64 %73 to i32
  %131 = or disjoint i32 %130, 6
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %131
  store i16 %.sroa.0207.0.copyload.6.i, ptr addrspace(3) %132, align 2, !tbaa.struct !27
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %133 = trunc i64 %73 to i32
  %134 = or disjoint i32 %133, 7
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %134
  store i16 0, ptr addrspace(3) %135, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %136 = or disjoint i64 %76, 7
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %136
  %.sroa.0207.0.copyload.7.i = load i16, ptr %137, align 2, !tbaa.struct !27
  %138 = trunc i64 %73 to i32
  %139 = or disjoint i32 %138, 7
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %139
  store i16 %.sroa.0207.0.copyload.7.i, ptr addrspace(3) %140, align 2, !tbaa.struct !27
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i
  %141 = trunc i64 %73 to i32
  %142 = or disjoint i32 %141, 8
  %143 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %142
  store i16 0, ptr addrspace(3) %143, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i
  %144 = or disjoint i64 %76, 8
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %144
  %.sroa.0207.0.copyload.8.i = load i16, ptr %145, align 16, !tbaa.struct !27
  %146 = trunc i64 %73 to i32
  %147 = or disjoint i32 %146, 8
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %147
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %148, align 2, !tbaa.struct !27
  br i1 %64, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i
  %149 = trunc i64 %73 to i32
  %150 = or disjoint i32 %149, 9
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %150
  store i16 0, ptr addrspace(3) %151, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i
  %152 = or disjoint i64 %76, 9
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %152
  %.sroa.0207.0.copyload.9.i = load i16, ptr %153, align 2, !tbaa.struct !27
  %154 = trunc i64 %73 to i32
  %155 = or disjoint i32 %154, 9
  %156 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %155
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %156, align 2, !tbaa.struct !27
  br i1 %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i
  %157 = trunc i64 %73 to i32
  %158 = or disjoint i32 %157, 10
  %159 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %158
  store i16 0, ptr addrspace(3) %159, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i
  %160 = or disjoint i64 %76, 10
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %160
  %.sroa.0207.0.copyload.10.i = load i16, ptr %161, align 4, !tbaa.struct !27
  %162 = trunc i64 %73 to i32
  %163 = or disjoint i32 %162, 10
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %163
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %164, align 2, !tbaa.struct !27
  br i1 %66, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i
  %165 = trunc i64 %73 to i32
  %166 = or disjoint i32 %165, 11
  %167 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %166
  store i16 0, ptr addrspace(3) %167, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i
  %168 = or disjoint i64 %76, 11
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %168
  %.sroa.0207.0.copyload.11.i = load i16, ptr %169, align 2, !tbaa.struct !27
  %170 = trunc i64 %73 to i32
  %171 = or disjoint i32 %170, 11
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %171
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %172, align 2, !tbaa.struct !27
  br i1 %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i
  %173 = trunc i64 %73 to i32
  %174 = or disjoint i32 %173, 12
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %174
  store i16 0, ptr addrspace(3) %175, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i
  %176 = or disjoint i64 %76, 12
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %176
  %.sroa.0207.0.copyload.12.i = load i16, ptr %177, align 8, !tbaa.struct !27
  %178 = trunc i64 %73 to i32
  %179 = or disjoint i32 %178, 12
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %179
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %180, align 2, !tbaa.struct !27
  br i1 %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i
  %181 = trunc i64 %73 to i32
  %182 = or disjoint i32 %181, 13
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %182
  store i16 0, ptr addrspace(3) %183, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i
  %184 = or disjoint i64 %76, 13
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %184
  %.sroa.0207.0.copyload.13.i = load i16, ptr %185, align 2, !tbaa.struct !27
  %186 = trunc i64 %73 to i32
  %187 = or disjoint i32 %186, 13
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %187
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %188, align 2, !tbaa.struct !27
  br i1 %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i
  %189 = trunc i64 %73 to i32
  %190 = or disjoint i32 %189, 14
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %190
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i
  %192 = or disjoint i64 %76, 14
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %192
  %.sroa.0207.0.copyload.14.i = load i16, ptr %193, align 4, !tbaa.struct !27
  %194 = trunc i64 %73 to i32
  %195 = or disjoint i32 %194, 14
  %196 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %195
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %196, align 2, !tbaa.struct !27
  br i1 %70, label %197, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

197:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i
  %198 = or disjoint i64 %76, 15
  %199 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %198
  %.sroa.0207.0.copyload.15.i = load i16, ptr %199, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i: ; preds = %197, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i
  %.sroa.0209.2.15.i = phi i16 [ %.sroa.0207.0.copyload.15.i, %197 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i ]
  %200 = trunc i64 %73 to i32
  %201 = or disjoint i32 %200, 15
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %201
  store i16 %.sroa.0209.2.15.i, ptr addrspace(3) %202, align 2, !tbaa.struct !27
  br label %.split.us.i

.loopexit407.i:                                   ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %203 = shl nuw nsw i64 %39, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %204 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %205 = icmp ult i64 %204, 256
  call void @llvm.assume(i1 %205)
  %206 = icmp eq i64 %204, 0
  br i1 %206, label %207, label %.loopexit.i

207:                                              ; preds = %.loopexit407.i
  %208 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %209 = icmp eq i64 %208, 0
  call void @llvm.assume(i1 %209)
  %210 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %211 = icmp eq i64 %210, 0
  call void @llvm.assume(i1 %211)
  %212 = sext i32 %5 to i64
  %213 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %214 = inttoptr i32 %213 to ptr addrspace(3)
  %215 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 768
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

.preheader405.i:                                  ; preds = %.split413.us.i, %207
  %232 = phi i64 [ 0, %207 ], [ %242, %.split413.us.i ]
  %233 = icmp slt i64 %232, %212
  %234 = shl i64 %232, 4
  %.tr399.i = trunc i64 %232 to i32
  %235 = shl i32 %.tr399.i, 4
  %236 = sext i32 %235 to i64
  %237 = add nsw i64 %203, %236
  %.fr414.i = freeze i1 %233
  br i1 %.fr414.i, label %.preheader405.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i: ; preds = %.preheader405.i
  %.tr430.i = trunc i64 %232 to i32
  %238 = shl i32 %.tr430.i, 5
  %239 = add i32 %238, 768
  %scevgep424.i = getelementptr i8, ptr addrspace(3) %214, i32 %239
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep424.i, i8 0, i32 32, i1 false)
  br label %.split413.us.i

.preheader405.split.preheader.i:                  ; preds = %.preheader405.i
  br i1 %216, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i: ; preds = %.preheader405.split.preheader.i
  %240 = trunc i64 %234 to i32
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %240
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

.split413.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i
  %242 = add nuw nsw i64 %232, 1
  %exitcond426.not.i = icmp eq i64 %242, 16
  br i1 %exitcond426.not.i, label %.loopexit.i, label %.preheader405.i, !llvm.loop !34

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i: ; preds = %.preheader405.split.preheader.i
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %237
  %.sroa.0196.0.copyload.i = load i16, ptr %243, align 32, !tbaa.struct !27
  %244 = trunc i64 %234 to i32
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %244
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %245, align 2, !tbaa.struct !27
  br i1 %217, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i
  %246 = trunc i64 %234 to i32
  %247 = or disjoint i32 %246, 1
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %247
  store i16 0, ptr addrspace(3) %248, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i
  %249 = or disjoint i64 %237, 1
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %249
  %.sroa.0196.0.copyload.1.i = load i16, ptr %250, align 2, !tbaa.struct !27
  %251 = trunc i64 %234 to i32
  %252 = or disjoint i32 %251, 1
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %252
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %253, align 2, !tbaa.struct !27
  br i1 %218, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i
  %254 = trunc i64 %234 to i32
  %255 = or disjoint i32 %254, 2
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %255
  store i16 0, ptr addrspace(3) %256, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i
  %257 = or disjoint i64 %237, 2
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %257
  %.sroa.0196.0.copyload.2.i = load i16, ptr %258, align 4, !tbaa.struct !27
  %259 = trunc i64 %234 to i32
  %260 = or disjoint i32 %259, 2
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %260
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %261, align 2, !tbaa.struct !27
  br i1 %219, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i
  %262 = trunc i64 %234 to i32
  %263 = or disjoint i32 %262, 3
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %263
  store i16 0, ptr addrspace(3) %264, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i
  %265 = or disjoint i64 %237, 3
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %265
  %.sroa.0196.0.copyload.3.i = load i16, ptr %266, align 2, !tbaa.struct !27
  %267 = trunc i64 %234 to i32
  %268 = or disjoint i32 %267, 3
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %268
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %269, align 2, !tbaa.struct !27
  br i1 %220, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i
  %270 = trunc i64 %234 to i32
  %271 = or disjoint i32 %270, 4
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %271
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i
  %273 = or disjoint i64 %237, 4
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %273
  %.sroa.0196.0.copyload.4.i = load i16, ptr %274, align 8, !tbaa.struct !27
  %275 = trunc i64 %234 to i32
  %276 = or disjoint i32 %275, 4
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %276
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %277, align 2, !tbaa.struct !27
  br i1 %221, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i
  %278 = trunc i64 %234 to i32
  %279 = or disjoint i32 %278, 5
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %279
  store i16 0, ptr addrspace(3) %280, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i
  %281 = or disjoint i64 %237, 5
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %281
  %.sroa.0196.0.copyload.5.i = load i16, ptr %282, align 2, !tbaa.struct !27
  %283 = trunc i64 %234 to i32
  %284 = or disjoint i32 %283, 5
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %284
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %285, align 2, !tbaa.struct !27
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i
  %286 = trunc i64 %234 to i32
  %287 = or disjoint i32 %286, 6
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %287
  store i16 0, ptr addrspace(3) %288, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i
  %289 = or disjoint i64 %237, 6
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %289
  %.sroa.0196.0.copyload.6.i = load i16, ptr %290, align 4, !tbaa.struct !27
  %291 = trunc i64 %234 to i32
  %292 = or disjoint i32 %291, 6
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %292
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %293, align 2, !tbaa.struct !27
  br i1 %223, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i
  %294 = trunc i64 %234 to i32
  %295 = or disjoint i32 %294, 7
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %295
  store i16 0, ptr addrspace(3) %296, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i
  %297 = or disjoint i64 %237, 7
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %297
  %.sroa.0196.0.copyload.7.i = load i16, ptr %298, align 2, !tbaa.struct !27
  %299 = trunc i64 %234 to i32
  %300 = or disjoint i32 %299, 7
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %300
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %301, align 2, !tbaa.struct !27
  br i1 %224, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i
  %302 = trunc i64 %234 to i32
  %303 = or disjoint i32 %302, 8
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %303
  store i16 0, ptr addrspace(3) %304, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i
  %305 = or disjoint i64 %237, 8
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %305
  %.sroa.0196.0.copyload.8.i = load i16, ptr %306, align 16, !tbaa.struct !27
  %307 = trunc i64 %234 to i32
  %308 = or disjoint i32 %307, 8
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %308
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %309, align 2, !tbaa.struct !27
  br i1 %225, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i
  %310 = trunc i64 %234 to i32
  %311 = or disjoint i32 %310, 9
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %311
  store i16 0, ptr addrspace(3) %312, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i
  %313 = or disjoint i64 %237, 9
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %313
  %.sroa.0196.0.copyload.9.i = load i16, ptr %314, align 2, !tbaa.struct !27
  %315 = trunc i64 %234 to i32
  %316 = or disjoint i32 %315, 9
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %316
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %317, align 2, !tbaa.struct !27
  br i1 %226, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i
  %318 = trunc i64 %234 to i32
  %319 = or disjoint i32 %318, 10
  %320 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %319
  store i16 0, ptr addrspace(3) %320, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i
  %321 = or disjoint i64 %237, 10
  %322 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %321
  %.sroa.0196.0.copyload.10.i = load i16, ptr %322, align 4, !tbaa.struct !27
  %323 = trunc i64 %234 to i32
  %324 = or disjoint i32 %323, 10
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %324
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %325, align 2, !tbaa.struct !27
  br i1 %227, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i
  %326 = trunc i64 %234 to i32
  %327 = or disjoint i32 %326, 11
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %327
  store i16 0, ptr addrspace(3) %328, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i
  %329 = or disjoint i64 %237, 11
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %329
  %.sroa.0196.0.copyload.11.i = load i16, ptr %330, align 2, !tbaa.struct !27
  %331 = trunc i64 %234 to i32
  %332 = or disjoint i32 %331, 11
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %332
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %333, align 2, !tbaa.struct !27
  br i1 %228, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i
  %334 = trunc i64 %234 to i32
  %335 = or disjoint i32 %334, 12
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %335
  store i16 0, ptr addrspace(3) %336, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i
  %337 = or disjoint i64 %237, 12
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %337
  %.sroa.0196.0.copyload.12.i = load i16, ptr %338, align 8, !tbaa.struct !27
  %339 = trunc i64 %234 to i32
  %340 = or disjoint i32 %339, 12
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %340
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %341, align 2, !tbaa.struct !27
  br i1 %229, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i
  %342 = trunc i64 %234 to i32
  %343 = or disjoint i32 %342, 13
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %343
  store i16 0, ptr addrspace(3) %344, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i
  %345 = or disjoint i64 %237, 13
  %346 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %345
  %.sroa.0196.0.copyload.13.i = load i16, ptr %346, align 2, !tbaa.struct !27
  %347 = trunc i64 %234 to i32
  %348 = or disjoint i32 %347, 13
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %348
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %349, align 2, !tbaa.struct !27
  br i1 %230, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i
  %350 = trunc i64 %234 to i32
  %351 = or disjoint i32 %350, 14
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %351
  store i16 0, ptr addrspace(3) %352, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i
  %353 = or disjoint i64 %237, 14
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %353
  %.sroa.0196.0.copyload.14.i = load i16, ptr %354, align 4, !tbaa.struct !27
  %355 = trunc i64 %234 to i32
  %356 = or disjoint i32 %355, 14
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %356
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
  %363 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %362
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %363, align 2, !tbaa.struct !27
  br label %.split413.us.i

.loopexit.i:                                      ; preds = %.split413.us.i, %.loopexit407.i
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
  %369 = icmp ult i64 %368, 256
  call void @llvm.assume(i1 %369)
  %370 = icmp ult i64 %368, 128
  br i1 %370, label %.lr.ph416.i, label %._crit_edge417.i

.lr.ph416.i:                                      ; preds = %.loopexit.i
  %371 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %372 = inttoptr i32 %371 to ptr addrspace(3)
  %373 = getelementptr inbounds i8, ptr addrspace(3) %372, i32 512
  %374 = getelementptr inbounds i8, ptr addrspace(3) %372, i32 768
  %375 = and i64 %368, 112
  %376 = and i64 %368, 15
  %377 = trunc i64 %368 to i32
  %378 = getelementptr inbounds float, ptr addrspace(3) %372, i32 %377
  %379 = load float, ptr addrspace(3) %378, align 4, !tbaa !23
  br label %383

._crit_edge417.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.loopexit.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %380 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %381 = icmp ult i64 %380, 256
  call void @llvm.assume(i1 %381)
  %382 = icmp eq i64 %380, 0
  br i1 %382, label %436, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %434, ptr addrspace(3) %378, align 4, !tbaa !23
  br label %._crit_edge417.i

383:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph416.i
  %384 = phi i64 [ 0, %.lr.ph416.i ], [ %435, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %385 = phi float [ %379, %.lr.ph416.i ], [ %434, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %386 = add nuw nsw i64 %384, %375
  %387 = trunc i64 %386 to i32
  %388 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %373, i32 %387
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %388, align 2, !tbaa.struct !27
  %389 = shl nuw nsw i64 %384, 4
  %390 = or disjoint i64 %389, %376
  %391 = trunc i64 %390 to i32
  %392 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %374, i32 %391
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %392, align 2, !tbaa.struct !27
  %393 = zext i16 %.sroa.0179.0.copyload.i to i32
  %394 = lshr i32 %393, 10
  %395 = and i32 %394, 31
  %396 = and i32 %393, 1023
  switch i32 %395, label %402 [
    i32 31, label %397
    i32 0, label %404
  ]

397:                                              ; preds = %383
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %398 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %396, 0
  %399 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %400 = or disjoint i32 %399, %398
  %401 = bitcast i32 %400 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

402:                                              ; preds = %383
  %403 = or disjoint i32 %396, 1024
  br label %404

404:                                              ; preds = %402, %383
  %405 = phi i32 [ %403, %402 ], [ %396, %383 ]
  %406 = uitofp i32 %405 to float
  %.not.i = icmp eq i32 %395, 0
  %407 = add nsw i32 %395, -25
  %408 = select i1 %.not.i, i32 -24, i32 %407
  %409 = call float @__ocml_ldexp_f32(float noundef %406, i32 noundef %408) #6
  %410 = fneg contract float %409
  %.not392393.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %411 = select contract i1 %.not392393.i, float %410, float %409
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i: ; preds = %404, %397
  %412 = phi float [ %401, %397 ], [ %411, %404 ]
  %413 = zext i16 %.sroa.0170.0.copyload.i to i32
  %414 = lshr i32 %413, 10
  %415 = and i32 %414, 31
  %416 = and i32 %413, 1023
  switch i32 %415, label %422 [
    i32 31, label %417
    i32 0, label %424
  ]

417:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %418 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not397.i = icmp eq i32 %416, 0
  %419 = select i1 %.not397.i, i32 2139095040, i32 2143289344
  %420 = or disjoint i32 %419, %418
  %421 = bitcast i32 %420 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

422:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %423 = or disjoint i32 %416, 1024
  br label %424

424:                                              ; preds = %422, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %425 = phi i32 [ %423, %422 ], [ %416, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i ]
  %426 = uitofp i32 %425 to float
  %.not394.i = icmp eq i32 %415, 0
  %427 = add nsw i32 %415, -25
  %428 = select i1 %.not394.i, i32 -24, i32 %427
  %429 = call float @__ocml_ldexp_f32(float noundef %426, i32 noundef %428) #6
  %430 = fneg contract float %429
  %.not395396.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %431 = select contract i1 %.not395396.i, float %430, float %429
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %424, %417
  %432 = phi float [ %421, %417 ], [ %431, %424 ]
  %433 = fmul contract float %412, %432
  %434 = fadd contract float %385, %433
  %435 = add nuw nsw i64 %384, 1
  %exitcond427.not.i = icmp eq i64 %435, 16
  br i1 %exitcond427.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, label %383, !llvm.loop !35

436:                                              ; preds = %._crit_edge417.i
  %437 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %438 = icmp eq i64 %437, 0
  call void @llvm.assume(i1 %438)
  %439 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %440 = icmp eq i64 %439, 0
  call void @llvm.assume(i1 %440)
  %441 = sext i32 %3 to i64
  %442 = call i32 @llvm.amdgcn.groupstaticsize()
  %443 = inttoptr i32 %442 to ptr addrspace(3)
  %444 = zext i32 %41 to i64
  %445 = icmp sgt i32 %4, 0
  %446 = icmp ugt i32 %4, 1
  %447 = icmp ugt i32 %4, 2
  %448 = icmp ugt i32 %4, 3
  %449 = icmp ugt i32 %4, 4
  %450 = icmp ugt i32 %4, 5
  %451 = icmp ugt i32 %4, 6
  %452 = icmp ugt i32 %4, 7
  %453 = icmp ugt i32 %4, 8
  %454 = icmp ugt i32 %4, 9
  %455 = icmp ugt i32 %4, 10
  %456 = icmp ugt i32 %4, 11
  %457 = icmp ugt i32 %4, 12
  %458 = icmp ugt i32 %4, 13
  %459 = icmp ugt i32 %4, 14
  %460 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split419.us.i, %436
  %461 = phi i64 [ 0, %436 ], [ %467, %.split419.us.i ]
  %462 = icmp slt i64 %461, %441
  %463 = shl i64 %461, 4
  %.tr391.i = trunc i64 %461 to i32
  %464 = shl i32 %.tr391.i, 4
  %465 = sext i32 %464 to i64
  %466 = add nsw i64 %465, %444
  %.fr420.i = freeze i1 %462
  %brmerge.not.i = select i1 %.fr420.i, i1 %445, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split419.us.i

.split419.us.i:                                   ; preds = %556, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %467 = add nuw nsw i64 %461, 1
  %exitcond429.not.i = icmp eq i64 %467, 8
  br i1 %exitcond429.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %468 = trunc i64 %463 to i32
  %469 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %468
  %470 = load float, ptr addrspace(3) %469, align 4, !tbaa !23
  %471 = getelementptr inbounds float, ptr %9, i64 %466
  store float %470, ptr %471, align 32, !tbaa !23
  br i1 %446, label %.preheader.split.2.i, label %.split419.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %472 = trunc i64 %463 to i32
  %473 = or disjoint i32 %472, 1
  %474 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !23
  %476 = or disjoint i64 %466, 1
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 4, !tbaa !23
  br i1 %447, label %.preheader.split.3.i, label %.split419.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %478 = trunc i64 %463 to i32
  %479 = or disjoint i32 %478, 2
  %480 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !23
  %482 = or disjoint i64 %466, 2
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 8, !tbaa !23
  br i1 %448, label %.preheader.split.4.i, label %.split419.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %484 = trunc i64 %463 to i32
  %485 = or disjoint i32 %484, 3
  %486 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !23
  %488 = or disjoint i64 %466, 3
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 4, !tbaa !23
  br i1 %449, label %.preheader.split.5.i, label %.split419.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %490 = trunc i64 %463 to i32
  %491 = or disjoint i32 %490, 4
  %492 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !23
  %494 = or disjoint i64 %466, 4
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 16, !tbaa !23
  br i1 %450, label %.preheader.split.6.i, label %.split419.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %496 = trunc i64 %463 to i32
  %497 = or disjoint i32 %496, 5
  %498 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !23
  %500 = or disjoint i64 %466, 5
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 4, !tbaa !23
  br i1 %451, label %.preheader.split.7.i, label %.split419.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %502 = trunc i64 %463 to i32
  %503 = or disjoint i32 %502, 6
  %504 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !23
  %506 = or disjoint i64 %466, 6
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 8, !tbaa !23
  br i1 %452, label %.preheader.split.8.i, label %.split419.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %508 = trunc i64 %463 to i32
  %509 = or disjoint i32 %508, 7
  %510 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !23
  %512 = or disjoint i64 %466, 7
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 4, !tbaa !23
  br i1 %453, label %.preheader.split.9.i, label %.split419.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %514 = trunc i64 %463 to i32
  %515 = or disjoint i32 %514, 8
  %516 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !23
  %518 = or disjoint i64 %466, 8
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 32, !tbaa !23
  br i1 %454, label %.preheader.split.10.i, label %.split419.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %520 = trunc i64 %463 to i32
  %521 = or disjoint i32 %520, 9
  %522 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !23
  %524 = or disjoint i64 %466, 9
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 4, !tbaa !23
  br i1 %455, label %.preheader.split.11.i, label %.split419.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %526 = trunc i64 %463 to i32
  %527 = or disjoint i32 %526, 10
  %528 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !23
  %530 = or disjoint i64 %466, 10
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 8, !tbaa !23
  br i1 %456, label %.preheader.split.12.i, label %.split419.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %532 = trunc i64 %463 to i32
  %533 = or disjoint i32 %532, 11
  %534 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %533
  %535 = load float, ptr addrspace(3) %534, align 4, !tbaa !23
  %536 = or disjoint i64 %466, 11
  %537 = getelementptr inbounds float, ptr %9, i64 %536
  store float %535, ptr %537, align 4, !tbaa !23
  br i1 %457, label %.preheader.split.13.i, label %.split419.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %538 = trunc i64 %463 to i32
  %539 = or disjoint i32 %538, 12
  %540 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !23
  %542 = or disjoint i64 %466, 12
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 16, !tbaa !23
  br i1 %458, label %.preheader.split.14.i, label %.split419.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %544 = trunc i64 %463 to i32
  %545 = or disjoint i32 %544, 13
  %546 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %545
  %547 = load float, ptr addrspace(3) %546, align 4, !tbaa !23
  %548 = or disjoint i64 %466, 13
  %549 = getelementptr inbounds float, ptr %9, i64 %548
  store float %547, ptr %549, align 4, !tbaa !23
  br i1 %459, label %.preheader.split.15.i, label %.split419.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %550 = trunc i64 %463 to i32
  %551 = or disjoint i32 %550, 14
  %552 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %551
  %553 = load float, ptr addrspace(3) %552, align 4, !tbaa !23
  %554 = or disjoint i64 %466, 14
  %555 = getelementptr inbounds float, ptr %9, i64 %554
  store float %553, ptr %555, align 8, !tbaa !23
  br i1 %460, label %556, label %.split419.us.i

556:                                              ; preds = %.preheader.split.15.i
  %557 = trunc i64 %463 to i32
  %558 = or disjoint i32 %557, 15
  %559 = getelementptr inbounds float, ptr addrspace(3) %443, i32 %558
  %560 = load float, ptr addrspace(3) %559, align 4, !tbaa !23
  %561 = or disjoint i64 %466, 15
  %562 = getelementptr inbounds float, ptr %9, i64 %561
  store float %560, ptr %562, align 4, !tbaa !23
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="256,256" }
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
