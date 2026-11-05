;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-ku4af2rr/kernel.cpp"
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
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !14
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 33554432
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
  br i1 %40, label %46, label %.lr.ph572.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !23
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !27

46:                                               ; preds = %._crit_edge.i
  %47 = shl i32 %.tr.i, 10
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
  br label %.preheader564.i

.preheader564.i:                                  ; preds = %.split.us.i, %46
  %65 = phi i64 [ 0, %46 ], [ %75, %.split.us.i ]
  %66 = icmp slt i64 %65, %52
  %67 = shl i64 %65, 3
  %.tr558.i = trunc i64 %65 to i32
  %68 = shl i32 %.tr558.i, 3
  %69 = sext i32 %68 to i64
  %70 = add nsw i64 %69, %56
  %.fr.i = freeze i1 %66
  br i1 %.fr.i, label %.preheader564.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.i: ; preds = %.preheader564.i
  %.tr594.i = trunc i64 %65 to i32
  %71 = shl i32 %.tr594.i, 4
  %72 = add i32 %71, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %54, i32 %72
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(16) %scevgep.i, i8 0, i32 16, i1 false)
  br label %.split.us.i

.preheader564.split.preheader.i:                  ; preds = %.preheader564.i
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.thread.i: ; preds = %.preheader564.split.preheader.i
  %73 = trunc i64 %67 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %73
  store i16 0, ptr addrspace(3) %74, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.i
  %75 = add nuw nsw i64 %65, 1
  %exitcond.not.i = icmp eq i64 %75, 128
  br i1 %exitcond.not.i, label %.lr.ph572.i, label %.preheader564.i, !llvm.loop !32

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i: ; preds = %.preheader564.split.preheader.i
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0260.0.copyload.i = load i16, ptr %76, align 16, !tbaa.struct !29
  %77 = trunc i64 %67 to i32
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %77
  store i16 %.sroa.0260.0.copyload.i, ptr addrspace(3) %78, align 2, !tbaa.struct !29
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.thread.i
  %79 = trunc i64 %67 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %80
  store i16 0, ptr addrspace(3) %81, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i
  %82 = or disjoint i64 %70, 1
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0260.0.copyload.1.i = load i16, ptr %83, align 2, !tbaa.struct !29
  %84 = trunc i64 %67 to i32
  %85 = or disjoint i32 %84, 1
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %85
  store i16 %.sroa.0260.0.copyload.1.i, ptr addrspace(3) %86, align 2, !tbaa.struct !29
  br i1 %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.thread.i
  %87 = trunc i64 %67 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %88
  store i16 0, ptr addrspace(3) %89, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i
  %90 = or disjoint i64 %70, 2
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0260.0.copyload.2.i = load i16, ptr %91, align 4, !tbaa.struct !29
  %92 = trunc i64 %67 to i32
  %93 = or disjoint i32 %92, 2
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %93
  store i16 %.sroa.0260.0.copyload.2.i, ptr addrspace(3) %94, align 2, !tbaa.struct !29
  br i1 %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.thread.i
  %95 = trunc i64 %67 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %96
  store i16 0, ptr addrspace(3) %97, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i
  %98 = or disjoint i64 %70, 3
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %98
  %.sroa.0260.0.copyload.3.i = load i16, ptr %99, align 2, !tbaa.struct !29
  %100 = trunc i64 %67 to i32
  %101 = or disjoint i32 %100, 3
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %101
  store i16 %.sroa.0260.0.copyload.3.i, ptr addrspace(3) %102, align 2, !tbaa.struct !29
  br i1 %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.thread.i
  %103 = trunc i64 %67 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %104
  store i16 0, ptr addrspace(3) %105, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i
  %106 = or disjoint i64 %70, 4
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0260.0.copyload.4.i = load i16, ptr %107, align 8, !tbaa.struct !29
  %108 = trunc i64 %67 to i32
  %109 = or disjoint i32 %108, 4
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %109
  store i16 %.sroa.0260.0.copyload.4.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  br i1 %62, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.thread.i
  %111 = trunc i64 %67 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %112
  store i16 0, ptr addrspace(3) %113, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i
  %114 = or disjoint i64 %70, 5
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0260.0.copyload.5.i = load i16, ptr %115, align 2, !tbaa.struct !29
  %116 = trunc i64 %67 to i32
  %117 = or disjoint i32 %116, 5
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %117
  store i16 %.sroa.0260.0.copyload.5.i, ptr addrspace(3) %118, align 2, !tbaa.struct !29
  br i1 %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.thread.i
  %119 = trunc i64 %67 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %120
  store i16 0, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i
  %122 = or disjoint i64 %70, 6
  %123 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %122
  %.sroa.0260.0.copyload.6.i = load i16, ptr %123, align 4, !tbaa.struct !29
  %124 = trunc i64 %67 to i32
  %125 = or disjoint i32 %124, 6
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %125
  store i16 %.sroa.0260.0.copyload.6.i, ptr addrspace(3) %126, align 2, !tbaa.struct !29
  br i1 %64, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i

127:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i
  %128 = or disjoint i64 %70, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0260.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i: ; preds = %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.thread.i
  %.sroa.0262.2.7.i = phi i16 [ %.sroa.0260.0.copyload.7.i, %127 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.thread.i ]
  %130 = trunc i64 %67 to i32
  %131 = or disjoint i32 %130, 7
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %131
  store i16 %.sroa.0262.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !29
  br label %.split.us.i

.lr.ph572.i:                                      ; preds = %.split.us.i, %._crit_edge.i
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
  %142 = getelementptr inbounds i8, ptr addrspace(3) %140, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge573.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  br i1 %145, label %157, label %.lr.ph578.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph572.i
  %146 = phi i64 [ %137, %.lr.ph572.i ], [ %155, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %147 = lshr i64 %146, 7
  %148 = shl nuw nsw i64 %146, 3
  %149 = and i64 %148, 1016
  %150 = or disjoint i64 %149, %147
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %151
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !29
  %153 = trunc i64 %146 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %142, i32 %153
  store i16 %.sroa.0327.0.copyload.i, ptr addrspace(3) %154, align 2, !tbaa.struct !29
  %155 = add nuw nsw i64 %146, 64
  %156 = icmp ult i64 %146, 960
  br i1 %156, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge573.i, !llvm.loop !35

157:                                              ; preds = %._crit_edge573.i
  %158 = shl i32 %.tr.i, 11
  %159 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %160 = icmp eq i64 %159, 0
  call void @llvm.assume(i1 %160)
  %161 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %162 = icmp eq i64 %161, 0
  call void @llvm.assume(i1 %162)
  %163 = sext i32 %5 to i64
  %164 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %165 = inttoptr i32 %164 to ptr addrspace(3)
  %166 = getelementptr inbounds i8, ptr addrspace(3) %165, i32 4608
  %167 = sext i32 %158 to i64
  %168 = icmp sgt i32 %4, 0
  %169 = icmp ugt i32 %4, 1
  %170 = icmp ugt i32 %4, 2
  %171 = icmp ugt i32 %4, 3
  %172 = icmp ugt i32 %4, 4
  %173 = icmp ugt i32 %4, 5
  %174 = icmp ugt i32 %4, 6
  %175 = icmp ugt i32 %4, 7
  %176 = icmp ugt i32 %4, 8
  %177 = icmp ugt i32 %4, 9
  %178 = icmp ugt i32 %4, 10
  %179 = icmp ugt i32 %4, 11
  %180 = icmp ugt i32 %4, 12
  %181 = icmp ugt i32 %4, 13
  %182 = icmp ugt i32 %4, 14
  %183 = icmp ugt i32 %4, 15
  br label %.preheader563.i

.preheader563.i:                                  ; preds = %.split575.us.i, %157
  %184 = phi i64 [ 0, %157 ], [ %194, %.split575.us.i ]
  %185 = icmp slt i64 %184, %163
  %186 = shl i64 %184, 4
  %.tr557.i = trunc i64 %184 to i32
  %187 = shl i32 %.tr557.i, 4
  %188 = sext i32 %187 to i64
  %189 = add nsw i64 %188, %167
  %.fr576.i = freeze i1 %185
  br i1 %.fr576.i, label %.preheader563.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader563.i
  %.tr593.i = trunc i64 %184 to i32
  %190 = shl i32 %.tr593.i, 5
  %191 = add i32 %190, 4608
  %scevgep587.i = getelementptr i8, ptr addrspace(3) %165, i32 %191
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep587.i, i8 0, i32 32, i1 false)
  br label %.split575.us.i

.preheader563.split.preheader.i:                  ; preds = %.preheader563.i
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader563.split.preheader.i
  %192 = trunc i64 %186 to i32
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %192
  store i16 0, ptr addrspace(3) %193, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split575.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %194 = add nuw nsw i64 %184, 1
  %exitcond589.not.i = icmp eq i64 %194, 128
  br i1 %exitcond589.not.i, label %.lr.ph578.i, label %.preheader563.i, !llvm.loop !36

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader563.split.preheader.i
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %189
  %.sroa.0223.0.copyload.i = load i16, ptr %195, align 32, !tbaa.struct !29
  %196 = trunc i64 %186 to i32
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %196
  store i16 %.sroa.0223.0.copyload.i, ptr addrspace(3) %197, align 2, !tbaa.struct !29
  br i1 %169, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %198 = trunc i64 %186 to i32
  %199 = or disjoint i32 %198, 1
  %200 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %199
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %201 = or disjoint i64 %189, 1
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %201
  %.sroa.0223.0.copyload.1.i = load i16, ptr %202, align 2, !tbaa.struct !29
  %203 = trunc i64 %186 to i32
  %204 = or disjoint i32 %203, 1
  %205 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %204
  store i16 %.sroa.0223.0.copyload.1.i, ptr addrspace(3) %205, align 2, !tbaa.struct !29
  br i1 %170, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %206 = trunc i64 %186 to i32
  %207 = or disjoint i32 %206, 2
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %207
  store i16 0, ptr addrspace(3) %208, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %209 = or disjoint i64 %189, 2
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %209
  %.sroa.0223.0.copyload.2.i = load i16, ptr %210, align 4, !tbaa.struct !29
  %211 = trunc i64 %186 to i32
  %212 = or disjoint i32 %211, 2
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %212
  store i16 %.sroa.0223.0.copyload.2.i, ptr addrspace(3) %213, align 2, !tbaa.struct !29
  br i1 %171, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %214 = trunc i64 %186 to i32
  %215 = or disjoint i32 %214, 3
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %215
  store i16 0, ptr addrspace(3) %216, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %217 = or disjoint i64 %189, 3
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %217
  %.sroa.0223.0.copyload.3.i = load i16, ptr %218, align 2, !tbaa.struct !29
  %219 = trunc i64 %186 to i32
  %220 = or disjoint i32 %219, 3
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %220
  store i16 %.sroa.0223.0.copyload.3.i, ptr addrspace(3) %221, align 2, !tbaa.struct !29
  br i1 %172, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %222 = trunc i64 %186 to i32
  %223 = or disjoint i32 %222, 4
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %223
  store i16 0, ptr addrspace(3) %224, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %225 = or disjoint i64 %189, 4
  %226 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %225
  %.sroa.0223.0.copyload.4.i = load i16, ptr %226, align 8, !tbaa.struct !29
  %227 = trunc i64 %186 to i32
  %228 = or disjoint i32 %227, 4
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %228
  store i16 %.sroa.0223.0.copyload.4.i, ptr addrspace(3) %229, align 2, !tbaa.struct !29
  br i1 %173, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %230 = trunc i64 %186 to i32
  %231 = or disjoint i32 %230, 5
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %231
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %233 = or disjoint i64 %189, 5
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %233
  %.sroa.0223.0.copyload.5.i = load i16, ptr %234, align 2, !tbaa.struct !29
  %235 = trunc i64 %186 to i32
  %236 = or disjoint i32 %235, 5
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %236
  store i16 %.sroa.0223.0.copyload.5.i, ptr addrspace(3) %237, align 2, !tbaa.struct !29
  br i1 %174, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %238 = trunc i64 %186 to i32
  %239 = or disjoint i32 %238, 6
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %239
  store i16 0, ptr addrspace(3) %240, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %241 = or disjoint i64 %189, 6
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %241
  %.sroa.0223.0.copyload.6.i = load i16, ptr %242, align 4, !tbaa.struct !29
  %243 = trunc i64 %186 to i32
  %244 = or disjoint i32 %243, 6
  %245 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %244
  store i16 %.sroa.0223.0.copyload.6.i, ptr addrspace(3) %245, align 2, !tbaa.struct !29
  br i1 %175, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %246 = trunc i64 %186 to i32
  %247 = or disjoint i32 %246, 7
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %247
  store i16 0, ptr addrspace(3) %248, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %249 = or disjoint i64 %189, 7
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %249
  %.sroa.0223.0.copyload.7.i = load i16, ptr %250, align 2, !tbaa.struct !29
  %251 = trunc i64 %186 to i32
  %252 = or disjoint i32 %251, 7
  %253 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %252
  store i16 %.sroa.0223.0.copyload.7.i, ptr addrspace(3) %253, align 2, !tbaa.struct !29
  br i1 %176, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %254 = trunc i64 %186 to i32
  %255 = or disjoint i32 %254, 8
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %255
  store i16 0, ptr addrspace(3) %256, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %257 = or disjoint i64 %189, 8
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %257
  %.sroa.0223.0.copyload.8.i = load i16, ptr %258, align 16, !tbaa.struct !29
  %259 = trunc i64 %186 to i32
  %260 = or disjoint i32 %259, 8
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %260
  store i16 %.sroa.0223.0.copyload.8.i, ptr addrspace(3) %261, align 2, !tbaa.struct !29
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %262 = trunc i64 %186 to i32
  %263 = or disjoint i32 %262, 9
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %263
  store i16 0, ptr addrspace(3) %264, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %265 = or disjoint i64 %189, 9
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %265
  %.sroa.0223.0.copyload.9.i = load i16, ptr %266, align 2, !tbaa.struct !29
  %267 = trunc i64 %186 to i32
  %268 = or disjoint i32 %267, 9
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %268
  store i16 %.sroa.0223.0.copyload.9.i, ptr addrspace(3) %269, align 2, !tbaa.struct !29
  br i1 %178, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %270 = trunc i64 %186 to i32
  %271 = or disjoint i32 %270, 10
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %271
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %273 = or disjoint i64 %189, 10
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %273
  %.sroa.0223.0.copyload.10.i = load i16, ptr %274, align 4, !tbaa.struct !29
  %275 = trunc i64 %186 to i32
  %276 = or disjoint i32 %275, 10
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %276
  store i16 %.sroa.0223.0.copyload.10.i, ptr addrspace(3) %277, align 2, !tbaa.struct !29
  br i1 %179, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %278 = trunc i64 %186 to i32
  %279 = or disjoint i32 %278, 11
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %279
  store i16 0, ptr addrspace(3) %280, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %281 = or disjoint i64 %189, 11
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %281
  %.sroa.0223.0.copyload.11.i = load i16, ptr %282, align 2, !tbaa.struct !29
  %283 = trunc i64 %186 to i32
  %284 = or disjoint i32 %283, 11
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %284
  store i16 %.sroa.0223.0.copyload.11.i, ptr addrspace(3) %285, align 2, !tbaa.struct !29
  br i1 %180, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %286 = trunc i64 %186 to i32
  %287 = or disjoint i32 %286, 12
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %287
  store i16 0, ptr addrspace(3) %288, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %289 = or disjoint i64 %189, 12
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %289
  %.sroa.0223.0.copyload.12.i = load i16, ptr %290, align 8, !tbaa.struct !29
  %291 = trunc i64 %186 to i32
  %292 = or disjoint i32 %291, 12
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %292
  store i16 %.sroa.0223.0.copyload.12.i, ptr addrspace(3) %293, align 2, !tbaa.struct !29
  br i1 %181, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %294 = trunc i64 %186 to i32
  %295 = or disjoint i32 %294, 13
  %296 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %295
  store i16 0, ptr addrspace(3) %296, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %297 = or disjoint i64 %189, 13
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %297
  %.sroa.0223.0.copyload.13.i = load i16, ptr %298, align 2, !tbaa.struct !29
  %299 = trunc i64 %186 to i32
  %300 = or disjoint i32 %299, 13
  %301 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %300
  store i16 %.sroa.0223.0.copyload.13.i, ptr addrspace(3) %301, align 2, !tbaa.struct !29
  br i1 %182, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %302 = trunc i64 %186 to i32
  %303 = or disjoint i32 %302, 14
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %303
  store i16 0, ptr addrspace(3) %304, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %305 = or disjoint i64 %189, 14
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %305
  %.sroa.0223.0.copyload.14.i = load i16, ptr %306, align 4, !tbaa.struct !29
  %307 = trunc i64 %186 to i32
  %308 = or disjoint i32 %307, 14
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %308
  store i16 %.sroa.0223.0.copyload.14.i, ptr addrspace(3) %309, align 2, !tbaa.struct !29
  br i1 %183, label %310, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

310:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %311 = or disjoint i64 %189, 15
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %311
  %.sroa.0223.0.copyload.15.i = load i16, ptr %312, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %310, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0225.2.15.i = phi i16 [ %.sroa.0223.0.copyload.15.i, %310 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %313 = trunc i64 %186 to i32
  %314 = or disjoint i32 %313, 15
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %166, i32 %314
  store i16 %.sroa.0225.2.15.i, ptr addrspace(3) %315, align 2, !tbaa.struct !29
  br label %.split575.us.i

.lr.ph578.i:                                      ; preds = %.split575.us.i, %._crit_edge573.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %316 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %317 = icmp eq i64 %316, 0
  call void @llvm.assume(i1 %317)
  %318 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %319 = icmp eq i64 %318, 0
  call void @llvm.assume(i1 %319)
  %320 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %321 = icmp ult i64 %320, 64
  call void @llvm.assume(i1 %321)
  %322 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %323 = inttoptr i32 %322 to ptr addrspace(3)
  %324 = getelementptr inbounds i8, ptr addrspace(3) %323, i32 2560
  %325 = getelementptr inbounds i8, ptr addrspace(3) %323, i32 4608
  %326 = and i64 %320, 7
  %327 = lshr i64 %320, 3
  %328 = shl nuw nsw i64 %327, 4
  %329 = or disjoint i64 %328, %326
  %330 = trunc i64 %329 to i32
  %331 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %330
  %332 = load float, ptr addrspace(3) %331, align 4, !tbaa !23
  %333 = or disjoint i64 %326, 8
  %334 = or disjoint i64 %328, %333
  %335 = trunc i64 %334 to i32
  %336 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %335
  %337 = load float, ptr addrspace(3) %336, align 4, !tbaa !23
  %338 = shl nuw nsw i64 %327, 7
  br label %342

._crit_edge579.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %394, ptr addrspace(3) %331, align 4, !tbaa !23
  store float %419, ptr addrspace(3) %336, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %339 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %340 = icmp ult i64 %339, 64
  call void @llvm.assume(i1 %340)
  %341 = icmp eq i64 %339, 0
  br i1 %341, label %421, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

342:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph578.i
  %343 = phi i64 [ 0, %.lr.ph578.i ], [ %420, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %344 = phi float [ %337, %.lr.ph578.i ], [ %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %345 = phi float [ %332, %.lr.ph578.i ], [ %394, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %346 = add nuw nsw i64 %343, %338
  %347 = trunc i64 %346 to i32
  %348 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %324, i32 %347
  %.sroa.0200.0.copyload.i = load i16, ptr addrspace(3) %348, align 2, !tbaa.struct !29
  %349 = shl nuw nsw i64 %343, 4
  %350 = or disjoint i64 %349, %326
  %351 = trunc i64 %350 to i32
  %352 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %325, i32 %351
  %.sroa.0191.0.copyload.i = load i16, ptr addrspace(3) %352, align 2, !tbaa.struct !29
  %353 = zext i16 %.sroa.0200.0.copyload.i to i32
  %354 = lshr i32 %353, 10
  %355 = and i32 %354, 31
  %356 = and i32 %353, 1023
  switch i32 %355, label %362 [
    i32 31, label %357
    i32 0, label %364
  ]

357:                                              ; preds = %342
  %.sroa.0200.0.copyload.signext.i = sext i16 %.sroa.0200.0.copyload.i to i32
  %358 = and i32 %.sroa.0200.0.copyload.signext.i, -2147483648
  %.not556.i = icmp eq i32 %356, 0
  %359 = select i1 %.not556.i, i32 2139095040, i32 2143289344
  %360 = or disjoint i32 %359, %358
  %361 = bitcast i32 %360 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

362:                                              ; preds = %342
  %363 = or disjoint i32 %356, 1024
  br label %364

364:                                              ; preds = %362, %342
  %365 = phi i32 [ %363, %362 ], [ %356, %342 ]
  %366 = uitofp i32 %365 to float
  %.not.i = icmp eq i32 %355, 0
  %367 = add nsw i32 %355, -25
  %368 = select i1 %.not.i, i32 -24, i32 %367
  %369 = call float @__ocml_ldexp_f32(float noundef %366, i32 noundef %368) #6
  %370 = fneg contract float %369
  %.not546547.i = icmp slt i16 %.sroa.0200.0.copyload.i, 0
  %371 = select contract i1 %.not546547.i, float %370, float %369
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %364, %357
  %372 = phi float [ %361, %357 ], [ %371, %364 ]
  %373 = zext i16 %.sroa.0191.0.copyload.i to i32
  %374 = lshr i32 %373, 10
  %375 = and i32 %374, 31
  %376 = and i32 %373, 1023
  switch i32 %375, label %382 [
    i32 31, label %377
    i32 0, label %384
  ]

377:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0191.0.copyload.signext.i = sext i16 %.sroa.0191.0.copyload.i to i32
  %378 = and i32 %.sroa.0191.0.copyload.signext.i, -2147483648
  %.not555.i = icmp eq i32 %376, 0
  %379 = select i1 %.not555.i, i32 2139095040, i32 2143289344
  %380 = or disjoint i32 %379, %378
  %381 = bitcast i32 %380 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

382:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %383 = or disjoint i32 %376, 1024
  br label %384

384:                                              ; preds = %382, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %385 = phi i32 [ %383, %382 ], [ %376, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %386 = uitofp i32 %385 to float
  %.not548.i = icmp eq i32 %375, 0
  %387 = add nsw i32 %375, -25
  %388 = select i1 %.not548.i, i32 -24, i32 %387
  %389 = call float @__ocml_ldexp_f32(float noundef %386, i32 noundef %388) #6
  %390 = fneg contract float %389
  %.not549550.i = icmp slt i16 %.sroa.0191.0.copyload.i, 0
  %391 = select contract i1 %.not549550.i, float %390, float %389
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %384, %377
  %392 = phi float [ %381, %377 ], [ %391, %384 ]
  %393 = fmul contract float %372, %392
  %394 = fadd contract float %345, %393
  %395 = or disjoint i64 %349, %333
  %396 = trunc i64 %395 to i32
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %325, i32 %396
  %.sroa.0182.0.copyload.i = load i16, ptr addrspace(3) %397, align 2, !tbaa.struct !29
  %398 = zext i16 %.sroa.0182.0.copyload.i to i32
  %399 = lshr i32 %398, 10
  %400 = and i32 %399, 31
  %401 = and i32 %398, 1023
  switch i32 %400, label %407 [
    i32 31, label %402
    i32 0, label %409
  ]

402:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0182.0.copyload.signext.i = sext i16 %.sroa.0182.0.copyload.i to i32
  %403 = and i32 %.sroa.0182.0.copyload.signext.i, -2147483648
  %.not554.i = icmp eq i32 %401, 0
  %404 = select i1 %.not554.i, i32 2139095040, i32 2143289344
  %405 = or disjoint i32 %404, %403
  %406 = bitcast i32 %405 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

407:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %408 = or disjoint i32 %401, 1024
  br label %409

409:                                              ; preds = %407, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %410 = phi i32 [ %408, %407 ], [ %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %411 = uitofp i32 %410 to float
  %.not551.i = icmp eq i32 %400, 0
  %412 = add nsw i32 %400, -25
  %413 = select i1 %.not551.i, i32 -24, i32 %412
  %414 = call float @__ocml_ldexp_f32(float noundef %411, i32 noundef %413) #6
  %415 = fneg contract float %414
  %.not552553.i = icmp slt i16 %.sroa.0182.0.copyload.i, 0
  %416 = select contract i1 %.not552553.i, float %415, float %414
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %409, %402
  %417 = phi float [ %406, %402 ], [ %416, %409 ]
  %418 = fmul contract float %372, %417
  %419 = fadd contract float %344, %418
  %420 = add nuw nsw i64 %343, 1
  %exitcond590.not.i = icmp eq i64 %420, 128
  br i1 %exitcond590.not.i, label %._crit_edge579.i, label %342, !llvm.loop !37

421:                                              ; preds = %._crit_edge579.i
  %422 = shl nuw i32 %.tr.i, 7
  %423 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %424 = icmp eq i64 %423, 0
  call void @llvm.assume(i1 %424)
  %425 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %426 = icmp eq i64 %425, 0
  call void @llvm.assume(i1 %426)
  %427 = sext i32 %3 to i64
  %428 = call i32 @llvm.amdgcn.groupstaticsize()
  %429 = inttoptr i32 %428 to ptr addrspace(3)
  %430 = sext i32 %422 to i64
  %431 = icmp sgt i32 %4, 0
  %432 = icmp ugt i32 %4, 1
  %433 = icmp ugt i32 %4, 2
  %434 = icmp ugt i32 %4, 3
  %435 = icmp ugt i32 %4, 4
  %436 = icmp ugt i32 %4, 5
  %437 = icmp ugt i32 %4, 6
  %438 = icmp ugt i32 %4, 7
  %439 = icmp ugt i32 %4, 8
  %440 = icmp ugt i32 %4, 9
  %441 = icmp ugt i32 %4, 10
  %442 = icmp ugt i32 %4, 11
  %443 = icmp ugt i32 %4, 12
  %444 = icmp ugt i32 %4, 13
  %445 = icmp ugt i32 %4, 14
  %446 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split581.us.i, %421
  %447 = phi i64 [ 0, %421 ], [ %453, %.split581.us.i ]
  %448 = icmp slt i64 %447, %427
  %449 = shl i64 %447, 4
  %.tr545.i = trunc i64 %447 to i32
  %450 = shl i32 %.tr545.i, 4
  %451 = sext i32 %450 to i64
  %452 = add nsw i64 %451, %430
  %.fr582.i = freeze i1 %448
  %brmerge.not.i = select i1 %.fr582.i, i1 %431, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split581.us.i

.split581.us.i:                                   ; preds = %542, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %453 = add nuw nsw i64 %447, 1
  %exitcond592.not.i = icmp eq i64 %453, 8
  br i1 %exitcond592.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %454 = trunc i64 %449 to i32
  %455 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !23
  %457 = getelementptr inbounds float, ptr %9, i64 %452
  store float %456, ptr %457, align 32, !tbaa !23
  br i1 %432, label %.preheader.split.2.i, label %.split581.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %458 = trunc i64 %449 to i32
  %459 = or disjoint i32 %458, 1
  %460 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %459
  %461 = load float, ptr addrspace(3) %460, align 4, !tbaa !23
  %462 = or disjoint i64 %452, 1
  %463 = getelementptr inbounds float, ptr %9, i64 %462
  store float %461, ptr %463, align 4, !tbaa !23
  br i1 %433, label %.preheader.split.3.i, label %.split581.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %464 = trunc i64 %449 to i32
  %465 = or disjoint i32 %464, 2
  %466 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %465
  %467 = load float, ptr addrspace(3) %466, align 4, !tbaa !23
  %468 = or disjoint i64 %452, 2
  %469 = getelementptr inbounds float, ptr %9, i64 %468
  store float %467, ptr %469, align 8, !tbaa !23
  br i1 %434, label %.preheader.split.4.i, label %.split581.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %470 = trunc i64 %449 to i32
  %471 = or disjoint i32 %470, 3
  %472 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %471
  %473 = load float, ptr addrspace(3) %472, align 4, !tbaa !23
  %474 = or disjoint i64 %452, 3
  %475 = getelementptr inbounds float, ptr %9, i64 %474
  store float %473, ptr %475, align 4, !tbaa !23
  br i1 %435, label %.preheader.split.5.i, label %.split581.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %476 = trunc i64 %449 to i32
  %477 = or disjoint i32 %476, 4
  %478 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %477
  %479 = load float, ptr addrspace(3) %478, align 4, !tbaa !23
  %480 = or disjoint i64 %452, 4
  %481 = getelementptr inbounds float, ptr %9, i64 %480
  store float %479, ptr %481, align 16, !tbaa !23
  br i1 %436, label %.preheader.split.6.i, label %.split581.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %482 = trunc i64 %449 to i32
  %483 = or disjoint i32 %482, 5
  %484 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %483
  %485 = load float, ptr addrspace(3) %484, align 4, !tbaa !23
  %486 = or disjoint i64 %452, 5
  %487 = getelementptr inbounds float, ptr %9, i64 %486
  store float %485, ptr %487, align 4, !tbaa !23
  br i1 %437, label %.preheader.split.7.i, label %.split581.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %488 = trunc i64 %449 to i32
  %489 = or disjoint i32 %488, 6
  %490 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %489
  %491 = load float, ptr addrspace(3) %490, align 4, !tbaa !23
  %492 = or disjoint i64 %452, 6
  %493 = getelementptr inbounds float, ptr %9, i64 %492
  store float %491, ptr %493, align 8, !tbaa !23
  br i1 %438, label %.preheader.split.8.i, label %.split581.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %494 = trunc i64 %449 to i32
  %495 = or disjoint i32 %494, 7
  %496 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %495
  %497 = load float, ptr addrspace(3) %496, align 4, !tbaa !23
  %498 = or disjoint i64 %452, 7
  %499 = getelementptr inbounds float, ptr %9, i64 %498
  store float %497, ptr %499, align 4, !tbaa !23
  br i1 %439, label %.preheader.split.9.i, label %.split581.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %500 = trunc i64 %449 to i32
  %501 = or disjoint i32 %500, 8
  %502 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %501
  %503 = load float, ptr addrspace(3) %502, align 4, !tbaa !23
  %504 = or disjoint i64 %452, 8
  %505 = getelementptr inbounds float, ptr %9, i64 %504
  store float %503, ptr %505, align 32, !tbaa !23
  br i1 %440, label %.preheader.split.10.i, label %.split581.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %506 = trunc i64 %449 to i32
  %507 = or disjoint i32 %506, 9
  %508 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %507
  %509 = load float, ptr addrspace(3) %508, align 4, !tbaa !23
  %510 = or disjoint i64 %452, 9
  %511 = getelementptr inbounds float, ptr %9, i64 %510
  store float %509, ptr %511, align 4, !tbaa !23
  br i1 %441, label %.preheader.split.11.i, label %.split581.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %512 = trunc i64 %449 to i32
  %513 = or disjoint i32 %512, 10
  %514 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %513
  %515 = load float, ptr addrspace(3) %514, align 4, !tbaa !23
  %516 = or disjoint i64 %452, 10
  %517 = getelementptr inbounds float, ptr %9, i64 %516
  store float %515, ptr %517, align 8, !tbaa !23
  br i1 %442, label %.preheader.split.12.i, label %.split581.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %518 = trunc i64 %449 to i32
  %519 = or disjoint i32 %518, 11
  %520 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %519
  %521 = load float, ptr addrspace(3) %520, align 4, !tbaa !23
  %522 = or disjoint i64 %452, 11
  %523 = getelementptr inbounds float, ptr %9, i64 %522
  store float %521, ptr %523, align 4, !tbaa !23
  br i1 %443, label %.preheader.split.13.i, label %.split581.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %524 = trunc i64 %449 to i32
  %525 = or disjoint i32 %524, 12
  %526 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %525
  %527 = load float, ptr addrspace(3) %526, align 4, !tbaa !23
  %528 = or disjoint i64 %452, 12
  %529 = getelementptr inbounds float, ptr %9, i64 %528
  store float %527, ptr %529, align 16, !tbaa !23
  br i1 %444, label %.preheader.split.14.i, label %.split581.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %530 = trunc i64 %449 to i32
  %531 = or disjoint i32 %530, 13
  %532 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %531
  %533 = load float, ptr addrspace(3) %532, align 4, !tbaa !23
  %534 = or disjoint i64 %452, 13
  %535 = getelementptr inbounds float, ptr %9, i64 %534
  store float %533, ptr %535, align 4, !tbaa !23
  br i1 %445, label %.preheader.split.15.i, label %.split581.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %536 = trunc i64 %449 to i32
  %537 = or disjoint i32 %536, 14
  %538 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %537
  %539 = load float, ptr addrspace(3) %538, align 4, !tbaa !23
  %540 = or disjoint i64 %452, 14
  %541 = getelementptr inbounds float, ptr %9, i64 %540
  store float %539, ptr %541, align 8, !tbaa !23
  br i1 %446, label %542, label %.split581.us.i

542:                                              ; preds = %.preheader.split.15.i
  %543 = trunc i64 %449 to i32
  %544 = or disjoint i32 %543, 15
  %545 = getelementptr inbounds float, ptr addrspace(3) %429, i32 %544
  %546 = load float, ptr addrspace(3) %545, align 4, !tbaa !23
  %547 = or disjoint i64 %452, 15
  %548 = getelementptr inbounds float, ptr %9, i64 %547
  store float %546, ptr %548, align 4, !tbaa !23
  br label %.split581.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge579.i, %.split581.us.i
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
!10 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
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
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = !{i64 0, i64 2, !30}
!30 = !{!31, !31, i64 0}
!31 = !{!"short", !25, i64 0}
!32 = distinct !{!32, !28, !33, !34}
!33 = !{!"llvm.loop.vectorize.width", i32 1}
!34 = !{!"llvm.loop.interleave.count", i32 1}
!35 = distinct !{!35, !28, !33, !34}
!36 = distinct !{!36, !28, !33, !34}
!37 = distinct !{!37, !28}
!38 = distinct !{!38, !28}
;----------------- End AdaptiveCpp IR dump ---------------
