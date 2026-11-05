;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882025/tmp/triton-sycl-cache/compile-_1uo6i2b/kernel.cpp"
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
  br i1 %44, label %45, label %.loopexit558.i

45:                                               ; preds = %._crit_edge.i
  %46 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = sext i32 %5 to i64
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 512
  %54 = zext i32 %41 to i64
  %55 = icmp sgt i32 %3, 0
  %56 = icmp ugt i32 %3, 1
  %57 = icmp ugt i32 %3, 2
  %58 = icmp ugt i32 %3, 3
  %59 = icmp ugt i32 %3, 4
  %60 = icmp ugt i32 %3, 5
  %61 = icmp ugt i32 %3, 6
  %62 = icmp ugt i32 %3, 7
  br label %.preheader557.i

.preheader557.i:                                  ; preds = %.split.us.i, %45
  %63 = phi i64 [ 0, %45 ], [ %73, %.split.us.i ]
  %64 = icmp slt i64 %63, %50
  %65 = shl i64 %63, 3
  %.tr551.i = trunc i64 %63 to i32
  %66 = shl i32 %.tr551.i, 3
  %67 = sext i32 %66 to i64
  %68 = add nsw i64 %67, %54
  %.fr.i = freeze i1 %64
  br i1 %.fr.i, label %.preheader557.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader557.i
  %.tr588.i = trunc i64 %63 to i32
  %69 = shl i32 %.tr588.i, 4
  %70 = add i32 %69, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %52, i32 %70
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader557.split.preheader.i:                  ; preds = %.preheader557.i
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader557.split.preheader.i
  %71 = trunc i64 %65 to i32
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %71
  store i16 0, ptr addrspace(3) %72, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %73 = add nuw nsw i64 %63, 1
  %exitcond.not.i = icmp eq i64 %73, 16
  br i1 %exitcond.not.i, label %.loopexit558.i, label %.preheader557.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader557.split.preheader.i
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0269.0.copyload.i = load i16, ptr %74, align 16, !tbaa.struct !27
  %75 = trunc i64 %65 to i32
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %75
  store i16 %.sroa.0269.0.copyload.i, ptr addrspace(3) %76, align 2, !tbaa.struct !27
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %77 = trunc i64 %65 to i32
  %78 = or disjoint i32 %77, 1
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %78
  store i16 0, ptr addrspace(3) %79, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %80 = or disjoint i64 %68, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %80
  %.sroa.0269.0.copyload.1.i = load i16, ptr %81, align 2, !tbaa.struct !27
  %82 = trunc i64 %65 to i32
  %83 = or disjoint i32 %82, 1
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %83
  store i16 %.sroa.0269.0.copyload.1.i, ptr addrspace(3) %84, align 2, !tbaa.struct !27
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %85 = trunc i64 %65 to i32
  %86 = or disjoint i32 %85, 2
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %86
  store i16 0, ptr addrspace(3) %87, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %88 = or disjoint i64 %68, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %88
  %.sroa.0269.0.copyload.2.i = load i16, ptr %89, align 4, !tbaa.struct !27
  %90 = trunc i64 %65 to i32
  %91 = or disjoint i32 %90, 2
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %91
  store i16 %.sroa.0269.0.copyload.2.i, ptr addrspace(3) %92, align 2, !tbaa.struct !27
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %93 = trunc i64 %65 to i32
  %94 = or disjoint i32 %93, 3
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %94
  store i16 0, ptr addrspace(3) %95, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %96 = or disjoint i64 %68, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %96
  %.sroa.0269.0.copyload.3.i = load i16, ptr %97, align 2, !tbaa.struct !27
  %98 = trunc i64 %65 to i32
  %99 = or disjoint i32 %98, 3
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %99
  store i16 %.sroa.0269.0.copyload.3.i, ptr addrspace(3) %100, align 2, !tbaa.struct !27
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %101 = trunc i64 %65 to i32
  %102 = or disjoint i32 %101, 4
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %102
  store i16 0, ptr addrspace(3) %103, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %104 = or disjoint i64 %68, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0269.0.copyload.4.i = load i16, ptr %105, align 8, !tbaa.struct !27
  %106 = trunc i64 %65 to i32
  %107 = or disjoint i32 %106, 4
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %107
  store i16 %.sroa.0269.0.copyload.4.i, ptr addrspace(3) %108, align 2, !tbaa.struct !27
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %109 = trunc i64 %65 to i32
  %110 = or disjoint i32 %109, 5
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %110
  store i16 0, ptr addrspace(3) %111, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %112 = or disjoint i64 %68, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %112
  %.sroa.0269.0.copyload.5.i = load i16, ptr %113, align 2, !tbaa.struct !27
  %114 = trunc i64 %65 to i32
  %115 = or disjoint i32 %114, 5
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %115
  store i16 %.sroa.0269.0.copyload.5.i, ptr addrspace(3) %116, align 2, !tbaa.struct !27
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %117 = trunc i64 %65 to i32
  %118 = or disjoint i32 %117, 6
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %118
  store i16 0, ptr addrspace(3) %119, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %120 = or disjoint i64 %68, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %120
  %.sroa.0269.0.copyload.6.i = load i16, ptr %121, align 4, !tbaa.struct !27
  %122 = trunc i64 %65 to i32
  %123 = or disjoint i32 %122, 6
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %123
  store i16 %.sroa.0269.0.copyload.6.i, ptr addrspace(3) %124, align 2, !tbaa.struct !27
  br i1 %62, label %125, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

125:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %126 = or disjoint i64 %68, 7
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %126
  %.sroa.0269.0.copyload.7.i = load i16, ptr %127, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %125, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %.sroa.0271.2.7.i = phi i16 [ %.sroa.0269.0.copyload.7.i, %125 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i ]
  %128 = trunc i64 %65 to i32
  %129 = or disjoint i32 %128, 7
  %130 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %129
  store i16 %.sroa.0271.2.7.i, ptr addrspace(3) %130, align 2, !tbaa.struct !27
  br label %.split.us.i

.loopexit558.i:                                   ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %131 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %132 = icmp eq i64 %131, 0
  call void @llvm.assume(i1 %132)
  %133 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %134 = icmp eq i64 %133, 0
  call void @llvm.assume(i1 %134)
  %135 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %136 = icmp ult i64 %135, 256
  call void @llvm.assume(i1 %136)
  %137 = icmp ult i64 %135, 128
  br i1 %137, label %.lr.ph564.i, label %._crit_edge565.i

.lr.ph564.i:                                      ; preds = %.loopexit558.i
  %138 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %139 = inttoptr i32 %138 to ptr addrspace(3)
  %140 = getelementptr inbounds i8, ptr addrspace(3) %139, i32 512
  %141 = getelementptr inbounds i8, ptr addrspace(3) %139, i32 768
  %142 = lshr i64 %135, 4
  %143 = shl nuw nsw i64 %135, 3
  %144 = and i64 %143, 120
  %145 = or disjoint i64 %144, %142
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %146
  %.sroa.0333.0.copyload.i = load i16, ptr addrspace(3) %147, align 2, !tbaa.struct !27
  %148 = trunc i64 %135 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %148
  store i16 %.sroa.0333.0.copyload.i, ptr addrspace(3) %149, align 2, !tbaa.struct !27
  br label %._crit_edge565.i

._crit_edge565.i:                                 ; preds = %.lr.ph564.i, %.loopexit558.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = shl nuw nsw i64 %39, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %152 = icmp ult i64 %151, 256
  call void @llvm.assume(i1 %152)
  %153 = icmp eq i64 %151, 0
  br i1 %153, label %154, label %._crit_edge571.i

154:                                              ; preds = %._crit_edge565.i
  %155 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %156 = icmp eq i64 %155, 0
  call void @llvm.assume(i1 %156)
  %157 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %158 = icmp eq i64 %157, 0
  call void @llvm.assume(i1 %158)
  %159 = sext i32 %4 to i64
  %160 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %161 = inttoptr i32 %160 to ptr addrspace(3)
  %162 = getelementptr inbounds i8, ptr addrspace(3) %161, i32 1024
  %163 = icmp sgt i32 %5, 0
  %164 = icmp ugt i32 %5, 1
  %165 = icmp ugt i32 %5, 2
  %166 = icmp ugt i32 %5, 3
  %167 = icmp ugt i32 %5, 4
  %168 = icmp ugt i32 %5, 5
  %169 = icmp ugt i32 %5, 6
  %170 = icmp ugt i32 %5, 7
  %171 = icmp ugt i32 %5, 8
  %172 = icmp ugt i32 %5, 9
  %173 = icmp ugt i32 %5, 10
  %174 = icmp ugt i32 %5, 11
  %175 = icmp ugt i32 %5, 12
  %176 = icmp ugt i32 %5, 13
  %177 = icmp ugt i32 %5, 14
  %178 = icmp ugt i32 %5, 15
  br label %.preheader556.i

.preheader556.i:                                  ; preds = %.split567.us.i, %154
  %179 = phi i64 [ 0, %154 ], [ %189, %.split567.us.i ]
  %180 = icmp slt i64 %179, %159
  %181 = shl i64 %179, 4
  %.tr550.i = trunc i64 %179 to i32
  %182 = shl i32 %.tr550.i, 4
  %183 = sext i32 %182 to i64
  %184 = add nsw i64 %150, %183
  %.fr568.i = freeze i1 %180
  br i1 %.fr568.i, label %.preheader556.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.us.preheader.i: ; preds = %.preheader556.i
  %.tr587.i = trunc i64 %179 to i32
  %185 = shl i32 %.tr587.i, 5
  %186 = add i32 %185, 1024
  %scevgep581.i = getelementptr i8, ptr addrspace(3) %161, i32 %186
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep581.i, i8 0, i32 32, i1 false)
  br label %.split567.us.i

.preheader556.split.preheader.i:                  ; preds = %.preheader556.i
  br i1 %163, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.thread.i: ; preds = %.preheader556.split.preheader.i
  %187 = trunc i64 %181 to i32
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %187
  store i16 0, ptr addrspace(3) %188, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i

.split567.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.us.preheader.i
  %189 = add nuw nsw i64 %179, 1
  %exitcond583.not.i = icmp eq i64 %189, 16
  br i1 %exitcond583.not.i, label %._crit_edge571.i, label %.preheader556.i, !llvm.loop !34

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i: ; preds = %.preheader556.split.preheader.i
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %184
  %.sroa.0232.0.copyload.i = load i16, ptr %190, align 32, !tbaa.struct !27
  %191 = trunc i64 %181 to i32
  %192 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %191
  store i16 %.sroa.0232.0.copyload.i, ptr addrspace(3) %192, align 2, !tbaa.struct !27
  br i1 %164, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.thread.i
  %193 = trunc i64 %181 to i32
  %194 = or disjoint i32 %193, 1
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %194
  store i16 0, ptr addrspace(3) %195, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i
  %196 = or disjoint i64 %184, 1
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %196
  %.sroa.0232.0.copyload.1.i = load i16, ptr %197, align 2, !tbaa.struct !27
  %198 = trunc i64 %181 to i32
  %199 = or disjoint i32 %198, 1
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %199
  store i16 %.sroa.0232.0.copyload.1.i, ptr addrspace(3) %200, align 2, !tbaa.struct !27
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.thread.i
  %201 = trunc i64 %181 to i32
  %202 = or disjoint i32 %201, 2
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %202
  store i16 0, ptr addrspace(3) %203, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.1.i
  %204 = or disjoint i64 %184, 2
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %204
  %.sroa.0232.0.copyload.2.i = load i16, ptr %205, align 4, !tbaa.struct !27
  %206 = trunc i64 %181 to i32
  %207 = or disjoint i32 %206, 2
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %207
  store i16 %.sroa.0232.0.copyload.2.i, ptr addrspace(3) %208, align 2, !tbaa.struct !27
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.thread.i
  %209 = trunc i64 %181 to i32
  %210 = or disjoint i32 %209, 3
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %210
  store i16 0, ptr addrspace(3) %211, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.2.i
  %212 = or disjoint i64 %184, 3
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %212
  %.sroa.0232.0.copyload.3.i = load i16, ptr %213, align 2, !tbaa.struct !27
  %214 = trunc i64 %181 to i32
  %215 = or disjoint i32 %214, 3
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %215
  store i16 %.sroa.0232.0.copyload.3.i, ptr addrspace(3) %216, align 2, !tbaa.struct !27
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.thread.i
  %217 = trunc i64 %181 to i32
  %218 = or disjoint i32 %217, 4
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %218
  store i16 0, ptr addrspace(3) %219, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.3.i
  %220 = or disjoint i64 %184, 4
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %220
  %.sroa.0232.0.copyload.4.i = load i16, ptr %221, align 8, !tbaa.struct !27
  %222 = trunc i64 %181 to i32
  %223 = or disjoint i32 %222, 4
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %223
  store i16 %.sroa.0232.0.copyload.4.i, ptr addrspace(3) %224, align 2, !tbaa.struct !27
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.thread.i
  %225 = trunc i64 %181 to i32
  %226 = or disjoint i32 %225, 5
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %226
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.4.i
  %228 = or disjoint i64 %184, 5
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %228
  %.sroa.0232.0.copyload.5.i = load i16, ptr %229, align 2, !tbaa.struct !27
  %230 = trunc i64 %181 to i32
  %231 = or disjoint i32 %230, 5
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %231
  store i16 %.sroa.0232.0.copyload.5.i, ptr addrspace(3) %232, align 2, !tbaa.struct !27
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.thread.i
  %233 = trunc i64 %181 to i32
  %234 = or disjoint i32 %233, 6
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %234
  store i16 0, ptr addrspace(3) %235, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.5.i
  %236 = or disjoint i64 %184, 6
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %236
  %.sroa.0232.0.copyload.6.i = load i16, ptr %237, align 4, !tbaa.struct !27
  %238 = trunc i64 %181 to i32
  %239 = or disjoint i32 %238, 6
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %239
  store i16 %.sroa.0232.0.copyload.6.i, ptr addrspace(3) %240, align 2, !tbaa.struct !27
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.thread.i
  %241 = trunc i64 %181 to i32
  %242 = or disjoint i32 %241, 7
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %242
  store i16 0, ptr addrspace(3) %243, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.6.i
  %244 = or disjoint i64 %184, 7
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %244
  %.sroa.0232.0.copyload.7.i = load i16, ptr %245, align 2, !tbaa.struct !27
  %246 = trunc i64 %181 to i32
  %247 = or disjoint i32 %246, 7
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %247
  store i16 %.sroa.0232.0.copyload.7.i, ptr addrspace(3) %248, align 2, !tbaa.struct !27
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.thread.i
  %249 = trunc i64 %181 to i32
  %250 = or disjoint i32 %249, 8
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %250
  store i16 0, ptr addrspace(3) %251, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.7.i
  %252 = or disjoint i64 %184, 8
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %252
  %.sroa.0232.0.copyload.8.i = load i16, ptr %253, align 16, !tbaa.struct !27
  %254 = trunc i64 %181 to i32
  %255 = or disjoint i32 %254, 8
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %255
  store i16 %.sroa.0232.0.copyload.8.i, ptr addrspace(3) %256, align 2, !tbaa.struct !27
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.thread.i
  %257 = trunc i64 %181 to i32
  %258 = or disjoint i32 %257, 9
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %258
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.8.i
  %260 = or disjoint i64 %184, 9
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %260
  %.sroa.0232.0.copyload.9.i = load i16, ptr %261, align 2, !tbaa.struct !27
  %262 = trunc i64 %181 to i32
  %263 = or disjoint i32 %262, 9
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %263
  store i16 %.sroa.0232.0.copyload.9.i, ptr addrspace(3) %264, align 2, !tbaa.struct !27
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.thread.i
  %265 = trunc i64 %181 to i32
  %266 = or disjoint i32 %265, 10
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %266
  store i16 0, ptr addrspace(3) %267, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.9.i
  %268 = or disjoint i64 %184, 10
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %268
  %.sroa.0232.0.copyload.10.i = load i16, ptr %269, align 4, !tbaa.struct !27
  %270 = trunc i64 %181 to i32
  %271 = or disjoint i32 %270, 10
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %271
  store i16 %.sroa.0232.0.copyload.10.i, ptr addrspace(3) %272, align 2, !tbaa.struct !27
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.thread.i
  %273 = trunc i64 %181 to i32
  %274 = or disjoint i32 %273, 11
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %274
  store i16 0, ptr addrspace(3) %275, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.10.i
  %276 = or disjoint i64 %184, 11
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %276
  %.sroa.0232.0.copyload.11.i = load i16, ptr %277, align 2, !tbaa.struct !27
  %278 = trunc i64 %181 to i32
  %279 = or disjoint i32 %278, 11
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %279
  store i16 %.sroa.0232.0.copyload.11.i, ptr addrspace(3) %280, align 2, !tbaa.struct !27
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.thread.i
  %281 = trunc i64 %181 to i32
  %282 = or disjoint i32 %281, 12
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %282
  store i16 0, ptr addrspace(3) %283, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.11.i
  %284 = or disjoint i64 %184, 12
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %284
  %.sroa.0232.0.copyload.12.i = load i16, ptr %285, align 8, !tbaa.struct !27
  %286 = trunc i64 %181 to i32
  %287 = or disjoint i32 %286, 12
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %287
  store i16 %.sroa.0232.0.copyload.12.i, ptr addrspace(3) %288, align 2, !tbaa.struct !27
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.thread.i
  %289 = trunc i64 %181 to i32
  %290 = or disjoint i32 %289, 13
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %290
  store i16 0, ptr addrspace(3) %291, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.12.i
  %292 = or disjoint i64 %184, 13
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %292
  %.sroa.0232.0.copyload.13.i = load i16, ptr %293, align 2, !tbaa.struct !27
  %294 = trunc i64 %181 to i32
  %295 = or disjoint i32 %294, 13
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %295
  store i16 %.sroa.0232.0.copyload.13.i, ptr addrspace(3) %296, align 2, !tbaa.struct !27
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.thread.i
  %297 = trunc i64 %181 to i32
  %298 = or disjoint i32 %297, 14
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %298
  store i16 0, ptr addrspace(3) %299, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.13.i
  %300 = or disjoint i64 %184, 14
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %300
  %.sroa.0232.0.copyload.14.i = load i16, ptr %301, align 4, !tbaa.struct !27
  %302 = trunc i64 %181 to i32
  %303 = or disjoint i32 %302, 14
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %303
  store i16 %.sroa.0232.0.copyload.14.i, ptr addrspace(3) %304, align 2, !tbaa.struct !27
  br i1 %178, label %305, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i

305:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i
  %306 = or disjoint i64 %184, 15
  %307 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %306
  %.sroa.0232.0.copyload.15.i = load i16, ptr %307, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.15.i: ; preds = %305, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i
  %.sroa.0234.2.15.i = phi i16 [ %.sroa.0232.0.copyload.15.i, %305 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.14.thread.i ]
  %308 = trunc i64 %181 to i32
  %309 = or disjoint i32 %308, 15
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %162, i32 %309
  store i16 %.sroa.0234.2.15.i, ptr addrspace(3) %310, align 2, !tbaa.struct !27
  br label %.split567.us.i

._crit_edge571.i:                                 ; preds = %.split567.us.i, %._crit_edge565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %311 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %312 = icmp eq i64 %311, 0
  call void @llvm.assume(i1 %312)
  %313 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %314 = icmp eq i64 %313, 0
  call void @llvm.assume(i1 %314)
  %315 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %316 = icmp ult i64 %315, 256
  call void @llvm.assume(i1 %316)
  %317 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %318 = inttoptr i32 %317 to ptr addrspace(3)
  %319 = getelementptr inbounds i8, ptr addrspace(3) %318, i32 1024
  %320 = getelementptr inbounds i8, ptr addrspace(3) %318, i32 1536
  %321 = lshr i64 %315, 4
  %322 = shl nuw nsw i64 %315, 4
  %323 = and i64 %322, 240
  %324 = or disjoint i64 %323, %321
  %325 = trunc i64 %324 to i32
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %319, i32 %325
  %.sroa.0332.0.copyload.i = load i16, ptr addrspace(3) %326, align 2, !tbaa.struct !27
  %327 = trunc i64 %315 to i32
  %328 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %320, i32 %327
  store i16 %.sroa.0332.0.copyload.i, ptr addrspace(3) %328, align 2, !tbaa.struct !27
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %329 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %330 = icmp eq i64 %329, 0
  call void @llvm.assume(i1 %330)
  %331 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %332 = icmp eq i64 %331, 0
  call void @llvm.assume(i1 %332)
  %333 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %334 = icmp ult i64 %333, 256
  call void @llvm.assume(i1 %334)
  %335 = icmp ult i64 %333, 128
  br i1 %335, label %.lr.ph573.i, label %._crit_edge574.i

.lr.ph573.i:                                      ; preds = %._crit_edge571.i
  %336 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %337 = inttoptr i32 %336 to ptr addrspace(3)
  %338 = getelementptr inbounds i8, ptr addrspace(3) %337, i32 768
  %339 = getelementptr inbounds i8, ptr addrspace(3) %337, i32 1536
  %340 = and i64 %333, 112
  %341 = and i64 %333, 15
  %342 = trunc i64 %333 to i32
  %343 = getelementptr inbounds float, ptr addrspace(3) %337, i32 %342
  %344 = load float, ptr addrspace(3) %343, align 4, !tbaa !23
  br label %348

._crit_edge574.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge571.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %345 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %346 = icmp ult i64 %345, 256
  call void @llvm.assume(i1 %346)
  %347 = icmp eq i64 %345, 0
  br i1 %347, label %401, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %399, ptr addrspace(3) %343, align 4, !tbaa !23
  br label %._crit_edge574.i

348:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph573.i
  %349 = phi i64 [ 0, %.lr.ph573.i ], [ %400, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %350 = phi float [ %344, %.lr.ph573.i ], [ %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %351 = add nuw nsw i64 %349, %340
  %352 = trunc i64 %351 to i32
  %353 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %338, i32 %352
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %353, align 2, !tbaa.struct !27
  %354 = shl nuw nsw i64 %349, 4
  %355 = or disjoint i64 %354, %341
  %356 = trunc i64 %355 to i32
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %339, i32 %356
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %357, align 2, !tbaa.struct !27
  %358 = zext i16 %.sroa.0189.0.copyload.i to i32
  %359 = lshr i32 %358, 10
  %360 = and i32 %359, 31
  %361 = and i32 %358, 1023
  switch i32 %360, label %367 [
    i32 31, label %362
    i32 0, label %369
  ]

362:                                              ; preds = %348
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %363 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %361, 0
  %364 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %365 = or disjoint i32 %364, %363
  %366 = bitcast i32 %365 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

367:                                              ; preds = %348
  %368 = or disjoint i32 %361, 1024
  br label %369

369:                                              ; preds = %367, %348
  %370 = phi i32 [ %368, %367 ], [ %361, %348 ]
  %371 = uitofp i32 %370 to float
  %.not.i = icmp eq i32 %360, 0
  %372 = add nsw i32 %360, -25
  %373 = select i1 %.not.i, i32 -24, i32 %372
  %374 = call float @__ocml_ldexp_f32(float noundef %371, i32 noundef %373) #6
  %375 = fneg contract float %374
  %.not543544.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %376 = select contract i1 %.not543544.i, float %375, float %374
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %369, %362
  %377 = phi float [ %366, %362 ], [ %376, %369 ]
  %378 = zext i16 %.sroa.0180.0.copyload.i to i32
  %379 = lshr i32 %378, 10
  %380 = and i32 %379, 31
  %381 = and i32 %378, 1023
  switch i32 %380, label %387 [
    i32 31, label %382
    i32 0, label %389
  ]

382:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %383 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %381, 0
  %384 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %385 = or disjoint i32 %384, %383
  %386 = bitcast i32 %385 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

387:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %388 = or disjoint i32 %381, 1024
  br label %389

389:                                              ; preds = %387, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %390 = phi i32 [ %388, %387 ], [ %381, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %391 = uitofp i32 %390 to float
  %.not545.i = icmp eq i32 %380, 0
  %392 = add nsw i32 %380, -25
  %393 = select i1 %.not545.i, i32 -24, i32 %392
  %394 = call float @__ocml_ldexp_f32(float noundef %391, i32 noundef %393) #6
  %395 = fneg contract float %394
  %.not546547.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %396 = select contract i1 %.not546547.i, float %395, float %394
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %389, %382
  %397 = phi float [ %386, %382 ], [ %396, %389 ]
  %398 = fmul contract float %377, %397
  %399 = fadd contract float %350, %398
  %400 = add nuw nsw i64 %349, 1
  %exitcond584.not.i = icmp eq i64 %400, 16
  br i1 %exitcond584.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, label %348, !llvm.loop !35

401:                                              ; preds = %._crit_edge574.i
  %402 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %403 = icmp eq i64 %402, 0
  call void @llvm.assume(i1 %403)
  %404 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %405 = icmp eq i64 %404, 0
  call void @llvm.assume(i1 %405)
  %406 = sext i32 %3 to i64
  %407 = call i32 @llvm.amdgcn.groupstaticsize()
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = zext i32 %41 to i64
  %410 = icmp sgt i32 %4, 0
  %411 = icmp ugt i32 %4, 1
  %412 = icmp ugt i32 %4, 2
  %413 = icmp ugt i32 %4, 3
  %414 = icmp ugt i32 %4, 4
  %415 = icmp ugt i32 %4, 5
  %416 = icmp ugt i32 %4, 6
  %417 = icmp ugt i32 %4, 7
  %418 = icmp ugt i32 %4, 8
  %419 = icmp ugt i32 %4, 9
  %420 = icmp ugt i32 %4, 10
  %421 = icmp ugt i32 %4, 11
  %422 = icmp ugt i32 %4, 12
  %423 = icmp ugt i32 %4, 13
  %424 = icmp ugt i32 %4, 14
  %425 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split576.us.i, %401
  %426 = phi i64 [ 0, %401 ], [ %432, %.split576.us.i ]
  %427 = icmp slt i64 %426, %406
  %428 = shl i64 %426, 4
  %.tr542.i = trunc i64 %426 to i32
  %429 = shl i32 %.tr542.i, 4
  %430 = sext i32 %429 to i64
  %431 = add nsw i64 %430, %409
  %.fr577.i = freeze i1 %427
  %brmerge.not.i = select i1 %.fr577.i, i1 %410, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split576.us.i

.split576.us.i:                                   ; preds = %521, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %432 = add nuw nsw i64 %426, 1
  %exitcond586.not.i = icmp eq i64 %432, 8
  br i1 %exitcond586.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %433 = trunc i64 %428 to i32
  %434 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %433
  %435 = load float, ptr addrspace(3) %434, align 4, !tbaa !23
  %436 = getelementptr inbounds float, ptr %9, i64 %431
  store float %435, ptr %436, align 32, !tbaa !23
  br i1 %411, label %.preheader.split.2.i, label %.split576.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %437 = trunc i64 %428 to i32
  %438 = or disjoint i32 %437, 1
  %439 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !23
  %441 = or disjoint i64 %431, 1
  %442 = getelementptr inbounds float, ptr %9, i64 %441
  store float %440, ptr %442, align 4, !tbaa !23
  br i1 %412, label %.preheader.split.3.i, label %.split576.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %443 = trunc i64 %428 to i32
  %444 = or disjoint i32 %443, 2
  %445 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %444
  %446 = load float, ptr addrspace(3) %445, align 4, !tbaa !23
  %447 = or disjoint i64 %431, 2
  %448 = getelementptr inbounds float, ptr %9, i64 %447
  store float %446, ptr %448, align 8, !tbaa !23
  br i1 %413, label %.preheader.split.4.i, label %.split576.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %449 = trunc i64 %428 to i32
  %450 = or disjoint i32 %449, 3
  %451 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %450
  %452 = load float, ptr addrspace(3) %451, align 4, !tbaa !23
  %453 = or disjoint i64 %431, 3
  %454 = getelementptr inbounds float, ptr %9, i64 %453
  store float %452, ptr %454, align 4, !tbaa !23
  br i1 %414, label %.preheader.split.5.i, label %.split576.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %455 = trunc i64 %428 to i32
  %456 = or disjoint i32 %455, 4
  %457 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %456
  %458 = load float, ptr addrspace(3) %457, align 4, !tbaa !23
  %459 = or disjoint i64 %431, 4
  %460 = getelementptr inbounds float, ptr %9, i64 %459
  store float %458, ptr %460, align 16, !tbaa !23
  br i1 %415, label %.preheader.split.6.i, label %.split576.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %461 = trunc i64 %428 to i32
  %462 = or disjoint i32 %461, 5
  %463 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %462
  %464 = load float, ptr addrspace(3) %463, align 4, !tbaa !23
  %465 = or disjoint i64 %431, 5
  %466 = getelementptr inbounds float, ptr %9, i64 %465
  store float %464, ptr %466, align 4, !tbaa !23
  br i1 %416, label %.preheader.split.7.i, label %.split576.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %467 = trunc i64 %428 to i32
  %468 = or disjoint i32 %467, 6
  %469 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %468
  %470 = load float, ptr addrspace(3) %469, align 4, !tbaa !23
  %471 = or disjoint i64 %431, 6
  %472 = getelementptr inbounds float, ptr %9, i64 %471
  store float %470, ptr %472, align 8, !tbaa !23
  br i1 %417, label %.preheader.split.8.i, label %.split576.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %473 = trunc i64 %428 to i32
  %474 = or disjoint i32 %473, 7
  %475 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !23
  %477 = or disjoint i64 %431, 7
  %478 = getelementptr inbounds float, ptr %9, i64 %477
  store float %476, ptr %478, align 4, !tbaa !23
  br i1 %418, label %.preheader.split.9.i, label %.split576.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %479 = trunc i64 %428 to i32
  %480 = or disjoint i32 %479, 8
  %481 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %480
  %482 = load float, ptr addrspace(3) %481, align 4, !tbaa !23
  %483 = or disjoint i64 %431, 8
  %484 = getelementptr inbounds float, ptr %9, i64 %483
  store float %482, ptr %484, align 32, !tbaa !23
  br i1 %419, label %.preheader.split.10.i, label %.split576.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %485 = trunc i64 %428 to i32
  %486 = or disjoint i32 %485, 9
  %487 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %486
  %488 = load float, ptr addrspace(3) %487, align 4, !tbaa !23
  %489 = or disjoint i64 %431, 9
  %490 = getelementptr inbounds float, ptr %9, i64 %489
  store float %488, ptr %490, align 4, !tbaa !23
  br i1 %420, label %.preheader.split.11.i, label %.split576.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %491 = trunc i64 %428 to i32
  %492 = or disjoint i32 %491, 10
  %493 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %492
  %494 = load float, ptr addrspace(3) %493, align 4, !tbaa !23
  %495 = or disjoint i64 %431, 10
  %496 = getelementptr inbounds float, ptr %9, i64 %495
  store float %494, ptr %496, align 8, !tbaa !23
  br i1 %421, label %.preheader.split.12.i, label %.split576.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %497 = trunc i64 %428 to i32
  %498 = or disjoint i32 %497, 11
  %499 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %498
  %500 = load float, ptr addrspace(3) %499, align 4, !tbaa !23
  %501 = or disjoint i64 %431, 11
  %502 = getelementptr inbounds float, ptr %9, i64 %501
  store float %500, ptr %502, align 4, !tbaa !23
  br i1 %422, label %.preheader.split.13.i, label %.split576.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %503 = trunc i64 %428 to i32
  %504 = or disjoint i32 %503, 12
  %505 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %504
  %506 = load float, ptr addrspace(3) %505, align 4, !tbaa !23
  %507 = or disjoint i64 %431, 12
  %508 = getelementptr inbounds float, ptr %9, i64 %507
  store float %506, ptr %508, align 16, !tbaa !23
  br i1 %423, label %.preheader.split.14.i, label %.split576.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %509 = trunc i64 %428 to i32
  %510 = or disjoint i32 %509, 13
  %511 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %510
  %512 = load float, ptr addrspace(3) %511, align 4, !tbaa !23
  %513 = or disjoint i64 %431, 13
  %514 = getelementptr inbounds float, ptr %9, i64 %513
  store float %512, ptr %514, align 4, !tbaa !23
  br i1 %424, label %.preheader.split.15.i, label %.split576.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %515 = trunc i64 %428 to i32
  %516 = or disjoint i32 %515, 14
  %517 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %516
  %518 = load float, ptr addrspace(3) %517, align 4, !tbaa !23
  %519 = or disjoint i64 %431, 14
  %520 = getelementptr inbounds float, ptr %9, i64 %519
  store float %518, ptr %520, align 8, !tbaa !23
  br i1 %425, label %521, label %.split576.us.i

521:                                              ; preds = %.preheader.split.15.i
  %522 = trunc i64 %428 to i32
  %523 = or disjoint i32 %522, 15
  %524 = getelementptr inbounds float, ptr addrspace(3) %408, i32 %523
  %525 = load float, ptr addrspace(3) %524, align 4, !tbaa !23
  %526 = or disjoint i64 %431, 15
  %527 = getelementptr inbounds float, ptr %9, i64 %526
  store float %525, ptr %527, align 4, !tbaa !23
  br label %.split576.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge574.i, %.split576.us.i
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
