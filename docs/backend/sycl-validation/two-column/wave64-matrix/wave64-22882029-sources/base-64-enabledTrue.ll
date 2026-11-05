;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-55agfr2e/kernel.cpp"
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
  %.fr595.i = freeze i32 %3
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
  br i1 %40, label %.preheader564.i, label %.loopexit565.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !23
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !27

.preheader564.i:                                  ; preds = %._crit_edge.i
  %46 = shl i32 %.tr.i, 9
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %50 = icmp eq i64 %49, 0
  call void @llvm.assume(i1 %50)
  %51 = sext i32 %5 to i64
  %52 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %53 = inttoptr i32 %52 to ptr addrspace(3)
  %54 = getelementptr i8, ptr addrspace(3) %53, i32 512
  %55 = sext i32 %46 to i64
  %56 = icmp sgt i32 %.fr595.i, 0
  br i1 %56, label %.preheader564.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader564.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %54, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i
  %57 = icmp sgt i32 %.fr595.i, 1
  %58 = or disjoint i64 %55, 64
  br i1 %57, label %.preheader564.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %53, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader564.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i, %.split.us.i
  %59 = phi i64 [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i ], [ 0, %.split.us.i ]
  %60 = icmp slt i64 %59, %51
  br i1 %60, label %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i

61:                                               ; preds = %.preheader564.split.1.i
  %62 = add nuw nsw i64 %58, %59
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %62
  %.sroa.0260.0.copyload.1.i = load i16, ptr %63, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i: ; preds = %61, %.preheader564.split.1.i
  %.sroa.0262.2.1.i = phi i16 [ %.sroa.0260.0.copyload.1.i, %61 ], [ 0, %.preheader564.split.1.i ]
  %64 = trunc i64 %59 to i32
  %65 = add i32 %64, 64
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %65
  store i16 %.sroa.0262.2.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !29
  %67 = add nuw nsw i64 %59, 1
  %exitcond.1.not.i = icmp eq i64 %67, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader564.split.1.i, !llvm.loop !32

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.1.i
  %68 = icmp sgt i32 %.fr595.i, 2
  %69 = or disjoint i64 %55, 128
  br i1 %68, label %.preheader564.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %53, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader564.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i, %.split.us.1.i
  %70 = phi i64 [ %78, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i ], [ 0, %.split.us.1.i ]
  %71 = icmp slt i64 %70, %51
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i

72:                                               ; preds = %.preheader564.split.2.i
  %73 = add nuw nsw i64 %69, %70
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0260.0.copyload.2.i = load i16, ptr %74, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i: ; preds = %72, %.preheader564.split.2.i
  %.sroa.0262.2.2.i = phi i16 [ %.sroa.0260.0.copyload.2.i, %72 ], [ 0, %.preheader564.split.2.i ]
  %75 = trunc i64 %70 to i32
  %76 = add i32 %75, 128
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %76
  store i16 %.sroa.0262.2.2.i, ptr addrspace(3) %77, align 2, !tbaa.struct !29
  %78 = add nuw nsw i64 %70, 1
  %exitcond.2.not.i = icmp eq i64 %78, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader564.split.2.i, !llvm.loop !32

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.2.i
  %79 = icmp sgt i32 %.fr595.i, 3
  %80 = or disjoint i64 %55, 192
  br i1 %79, label %.preheader564.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %53, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader564.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i, %.split.us.2.i
  %81 = phi i64 [ %89, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i ], [ 0, %.split.us.2.i ]
  %82 = icmp slt i64 %81, %51
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i

83:                                               ; preds = %.preheader564.split.3.i
  %84 = add nuw nsw i64 %80, %81
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0260.0.copyload.3.i = load i16, ptr %85, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i: ; preds = %83, %.preheader564.split.3.i
  %.sroa.0262.2.3.i = phi i16 [ %.sroa.0260.0.copyload.3.i, %83 ], [ 0, %.preheader564.split.3.i ]
  %86 = trunc i64 %81 to i32
  %87 = add i32 %86, 192
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %87
  store i16 %.sroa.0262.2.3.i, ptr addrspace(3) %88, align 2, !tbaa.struct !29
  %89 = add nuw nsw i64 %81, 1
  %exitcond.3.not.i = icmp eq i64 %89, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader564.split.3.i, !llvm.loop !32

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.3.i
  %90 = icmp sgt i32 %.fr595.i, 4
  %91 = or disjoint i64 %55, 256
  br i1 %90, label %.preheader564.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %53, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader564.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i, %.split.us.3.i
  %92 = phi i64 [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i ], [ 0, %.split.us.3.i ]
  %93 = icmp slt i64 %92, %51
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i

94:                                               ; preds = %.preheader564.split.4.i
  %95 = add nuw nsw i64 %91, %92
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0260.0.copyload.4.i = load i16, ptr %96, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i: ; preds = %94, %.preheader564.split.4.i
  %.sroa.0262.2.4.i = phi i16 [ %.sroa.0260.0.copyload.4.i, %94 ], [ 0, %.preheader564.split.4.i ]
  %97 = trunc i64 %92 to i32
  %98 = add i32 %97, 256
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %98
  store i16 %.sroa.0262.2.4.i, ptr addrspace(3) %99, align 2, !tbaa.struct !29
  %100 = add nuw nsw i64 %92, 1
  %exitcond.4.not.i = icmp eq i64 %100, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader564.split.4.i, !llvm.loop !32

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.4.i
  %101 = icmp sgt i32 %.fr595.i, 5
  %102 = or disjoint i64 %55, 320
  br i1 %101, label %.preheader564.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %53, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader564.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i, %.split.us.4.i
  %103 = phi i64 [ %111, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i ], [ 0, %.split.us.4.i ]
  %104 = icmp slt i64 %103, %51
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i

105:                                              ; preds = %.preheader564.split.5.i
  %106 = add nuw nsw i64 %102, %103
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0260.0.copyload.5.i = load i16, ptr %107, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i: ; preds = %105, %.preheader564.split.5.i
  %.sroa.0262.2.5.i = phi i16 [ %.sroa.0260.0.copyload.5.i, %105 ], [ 0, %.preheader564.split.5.i ]
  %108 = trunc i64 %103 to i32
  %109 = add i32 %108, 320
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %109
  store i16 %.sroa.0262.2.5.i, ptr addrspace(3) %110, align 2, !tbaa.struct !29
  %111 = add nuw nsw i64 %103, 1
  %exitcond.5.not.i = icmp eq i64 %111, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader564.split.5.i, !llvm.loop !32

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.5.i
  %112 = icmp sgt i32 %.fr595.i, 6
  %113 = or disjoint i64 %55, 384
  br i1 %112, label %.preheader564.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %53, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.7.i

.preheader564.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i, %.split.us.5.i
  %114 = phi i64 [ %122, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i ], [ 0, %.split.us.5.i ]
  %115 = icmp slt i64 %114, %51
  br i1 %115, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i

116:                                              ; preds = %.preheader564.split.6.i
  %117 = add nuw nsw i64 %113, %114
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0260.0.copyload.6.i = load i16, ptr %118, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i: ; preds = %116, %.preheader564.split.6.i
  %.sroa.0262.2.6.i = phi i16 [ %.sroa.0260.0.copyload.6.i, %116 ], [ 0, %.preheader564.split.6.i ]
  %119 = trunc i64 %114 to i32
  %120 = add i32 %119, 384
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %120
  store i16 %.sroa.0262.2.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !29
  %122 = add nuw nsw i64 %114, 1
  %exitcond.6.not.i = icmp eq i64 %122, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader564.split.6.i, !llvm.loop !32

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.6.i
  %123 = icmp sgt i32 %.fr595.i, 7
  %124 = or disjoint i64 %55, 448
  br i1 %123, label %.preheader564.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %53, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit565.i

.preheader564.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i, %.split.us.6.i
  %125 = phi i64 [ %133, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i ], [ 0, %.split.us.6.i ]
  %126 = icmp slt i64 %125, %51
  br i1 %126, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i

127:                                              ; preds = %.preheader564.split.7.i
  %128 = add nuw nsw i64 %124, %125
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0260.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i: ; preds = %127, %.preheader564.split.7.i
  %.sroa.0262.2.7.i = phi i16 [ %.sroa.0260.0.copyload.7.i, %127 ], [ 0, %.preheader564.split.7.i ]
  %130 = trunc i64 %125 to i32
  %131 = add i32 %130, 448
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %131
  store i16 %.sroa.0262.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !29
  %133 = add nuw nsw i64 %125, 1
  %exitcond.7.not.i = icmp eq i64 %133, 64
  br i1 %exitcond.7.not.i, label %.loopexit565.i, label %.preheader564.split.7.i, !llvm.loop !32

.preheader564.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i, %.preheader564.i
  %134 = phi i64 [ %141, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i ], [ 0, %.preheader564.i ]
  %135 = icmp slt i64 %134, %51
  br i1 %135, label %136, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i

136:                                              ; preds = %.preheader564.split.i
  %137 = add nuw nsw i64 %134, %55
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %137
  %.sroa.0260.0.copyload.i = load i16, ptr %138, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.i: ; preds = %136, %.preheader564.split.i
  %.sroa.0262.2.i = phi i16 [ %.sroa.0260.0.copyload.i, %136 ], [ 0, %.preheader564.split.i ]
  %139 = trunc i64 %134 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %139
  store i16 %.sroa.0262.2.i, ptr addrspace(3) %140, align 2, !tbaa.struct !29
  %141 = add nuw nsw i64 %134, 1
  %exitcond.not.i = icmp eq i64 %141, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader564.split.i, !llvm.loop !32

.loopexit565.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit13.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %142 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %143 = icmp ult i64 %142, 64
  call void @llvm.assume(i1 %143)
  %144 = icmp eq i64 %142, 0
  br i1 %144, label %145, label %.lr.ph575.i

145:                                              ; preds = %.loopexit565.i
  %146 = shl i32 %.tr.i, 10
  %147 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %148 = icmp eq i64 %147, 0
  call void @llvm.assume(i1 %148)
  %149 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %150 = icmp eq i64 %149, 0
  call void @llvm.assume(i1 %150)
  %151 = sext i32 %4 to i64
  %152 = sext i32 %5 to i64
  %153 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %154 = inttoptr i32 %153 to ptr addrspace(3)
  %155 = getelementptr inbounds i8, ptr addrspace(3) %154, i32 1536
  %156 = sext i32 %146 to i64
  br label %.preheader563.i

.preheader563.i:                                  ; preds = %.split572.us.i, %145
  %157 = phi i64 [ 0, %145 ], [ %165, %.split572.us.i ]
  %158 = icmp slt i64 %157, %151
  %159 = shl i64 %157, 6
  %.tr557.i = trunc i64 %157 to i32
  %160 = shl i32 %.tr557.i, 6
  %161 = sext i32 %160 to i64
  %162 = add nsw i64 %161, %156
  %.fr573.i = freeze i1 %158
  br i1 %.fr573.i, label %.preheader563.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader563.i
  %.tr594.i = trunc i64 %157 to i32
  %163 = shl i32 %.tr594.i, 7
  %164 = add i32 %163, 1536
  %scevgep588.i = getelementptr i8, ptr addrspace(3) %154, i32 %164
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep588.i, i8 0, i32 128, i1 false)
  br label %.split572.us.i

.split572.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %165 = add nuw nsw i64 %157, 1
  %exitcond590.not.i = icmp eq i64 %165, 16
  br i1 %exitcond590.not.i, label %.lr.ph575.i, label %.preheader563.i, !llvm.loop !35

.preheader563.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader563.i
  %166 = phi i64 [ %174, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader563.i ]
  %167 = icmp slt i64 %166, %152
  br i1 %167, label %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

168:                                              ; preds = %.preheader563.split.i
  %169 = add nuw nsw i64 %162, %166
  %170 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %169
  %.sroa.0249.0.copyload.i = load i16, ptr %170, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %168, %.preheader563.split.i
  %.sroa.0251.2.i = phi i16 [ %.sroa.0249.0.copyload.i, %168 ], [ 0, %.preheader563.split.i ]
  %171 = add nuw nsw i64 %166, %159
  %172 = trunc i64 %171 to i32
  %173 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %155, i32 %172
  store i16 %.sroa.0251.2.i, ptr addrspace(3) %173, align 2, !tbaa.struct !29
  %174 = add nuw nsw i64 %166, 1
  %exitcond589.not.i = icmp eq i64 %174, 64
  br i1 %exitcond589.not.i, label %.split572.us.i, label %.preheader563.split.i, !llvm.loop !36

.lr.ph575.i:                                      ; preds = %.split572.us.i, %.loopexit565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %175 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %176 = icmp eq i64 %175, 0
  call void @llvm.assume(i1 %176)
  %177 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %178 = icmp eq i64 %177, 0
  call void @llvm.assume(i1 %178)
  %179 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %180 = icmp ult i64 %179, 64
  call void @llvm.assume(i1 %180)
  %181 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %182 = inttoptr i32 %181 to ptr addrspace(3)
  %183 = getelementptr inbounds i8, ptr addrspace(3) %182, i32 1536
  %184 = getelementptr inbounds i8, ptr addrspace(3) %182, i32 3584
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

.lr.ph578.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %185 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %186 = icmp eq i64 %185, 0
  call void @llvm.assume(i1 %186)
  %187 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %188 = icmp eq i64 %187, 0
  call void @llvm.assume(i1 %188)
  %189 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %190 = icmp ult i64 %189, 64
  call void @llvm.assume(i1 %190)
  %191 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %192 = inttoptr i32 %191 to ptr addrspace(3)
  %193 = getelementptr inbounds i8, ptr addrspace(3) %192, i32 512
  %194 = getelementptr inbounds i8, ptr addrspace(3) %192, i32 3584
  %195 = and i64 %189, 7
  %196 = lshr i64 %189, 3
  %197 = shl nuw nsw i64 %196, 4
  %198 = or disjoint i64 %197, %195
  %199 = trunc i64 %198 to i32
  %200 = getelementptr inbounds float, ptr addrspace(3) %192, i32 %199
  %201 = load float, ptr addrspace(3) %200, align 4, !tbaa !23
  %202 = or disjoint i64 %195, 8
  %203 = or disjoint i64 %197, %202
  %204 = trunc i64 %203 to i32
  %205 = getelementptr inbounds float, ptr addrspace(3) %192, i32 %204
  %206 = load float, ptr addrspace(3) %205, align 4, !tbaa !23
  %207 = shl nuw nsw i64 %196, 6
  br label %222

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph575.i
  %208 = phi i64 [ %179, %.lr.ph575.i ], [ %217, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %209 = lshr i64 %208, 4
  %210 = shl nuw nsw i64 %208, 6
  %211 = and i64 %210, 960
  %212 = or disjoint i64 %211, %209
  %213 = trunc i64 %212 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %213
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %214, align 2, !tbaa.struct !29
  %215 = trunc i64 %208 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %184, i32 %215
  store i16 %.sroa.0327.0.copyload.i, ptr addrspace(3) %216, align 2, !tbaa.struct !29
  %217 = add nuw nsw i64 %208, 64
  %218 = icmp ult i64 %208, 960
  br i1 %218, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph578.i, !llvm.loop !37

._crit_edge579.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %274, ptr addrspace(3) %200, align 4, !tbaa !23
  store float %299, ptr addrspace(3) %205, align 4, !tbaa !23
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
  br i1 %221, label %301, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

222:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph578.i
  %223 = phi i64 [ 0, %.lr.ph578.i ], [ %300, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %224 = phi float [ %206, %.lr.ph578.i ], [ %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %225 = phi float [ %201, %.lr.ph578.i ], [ %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %226 = add nuw nsw i64 %223, %207
  %227 = trunc i64 %226 to i32
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %227
  %.sroa.0200.0.copyload.i = load i16, ptr addrspace(3) %228, align 2, !tbaa.struct !29
  %229 = shl nuw nsw i64 %223, 4
  %230 = or disjoint i64 %229, %195
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %194, i32 %231
  %.sroa.0191.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !29
  %233 = zext i16 %.sroa.0200.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %222
  %.sroa.0200.0.copyload.signext.i = sext i16 %.sroa.0200.0.copyload.i to i32
  %238 = and i32 %.sroa.0200.0.copyload.signext.i, -2147483648
  %.not556.i = icmp eq i32 %236, 0
  %239 = select i1 %.not556.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

242:                                              ; preds = %222
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %222
  %245 = phi i32 [ %243, %242 ], [ %236, %222 ]
  %246 = uitofp i32 %245 to float
  %.not.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #6
  %250 = fneg contract float %249
  %.not546547.i = icmp slt i16 %.sroa.0200.0.copyload.i, 0
  %251 = select contract i1 %.not546547.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = zext i16 %.sroa.0191.0.copyload.i to i32
  %254 = lshr i32 %253, 10
  %255 = and i32 %254, 31
  %256 = and i32 %253, 1023
  switch i32 %255, label %262 [
    i32 31, label %257
    i32 0, label %264
  ]

257:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0191.0.copyload.signext.i = sext i16 %.sroa.0191.0.copyload.i to i32
  %258 = and i32 %.sroa.0191.0.copyload.signext.i, -2147483648
  %.not555.i = icmp eq i32 %256, 0
  %259 = select i1 %.not555.i, i32 2139095040, i32 2143289344
  %260 = or disjoint i32 %259, %258
  %261 = bitcast i32 %260 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %263 = or disjoint i32 %256, 1024
  br label %264

264:                                              ; preds = %262, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %265 = phi i32 [ %263, %262 ], [ %256, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %266 = uitofp i32 %265 to float
  %.not548.i = icmp eq i32 %255, 0
  %267 = add nsw i32 %255, -25
  %268 = select i1 %.not548.i, i32 -24, i32 %267
  %269 = call float @__ocml_ldexp_f32(float noundef %266, i32 noundef %268) #6
  %270 = fneg contract float %269
  %.not549550.i = icmp slt i16 %.sroa.0191.0.copyload.i, 0
  %271 = select contract i1 %.not549550.i, float %270, float %269
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %264, %257
  %272 = phi float [ %261, %257 ], [ %271, %264 ]
  %273 = fmul contract float %252, %272
  %274 = fadd contract float %225, %273
  %275 = or disjoint i64 %229, %202
  %276 = trunc i64 %275 to i32
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %194, i32 %276
  %.sroa.0182.0.copyload.i = load i16, ptr addrspace(3) %277, align 2, !tbaa.struct !29
  %278 = zext i16 %.sroa.0182.0.copyload.i to i32
  %279 = lshr i32 %278, 10
  %280 = and i32 %279, 31
  %281 = and i32 %278, 1023
  switch i32 %280, label %287 [
    i32 31, label %282
    i32 0, label %289
  ]

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0182.0.copyload.signext.i = sext i16 %.sroa.0182.0.copyload.i to i32
  %283 = and i32 %.sroa.0182.0.copyload.signext.i, -2147483648
  %.not554.i = icmp eq i32 %281, 0
  %284 = select i1 %.not554.i, i32 2139095040, i32 2143289344
  %285 = or disjoint i32 %284, %283
  %286 = bitcast i32 %285 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

287:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %288 = or disjoint i32 %281, 1024
  br label %289

289:                                              ; preds = %287, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %290 = phi i32 [ %288, %287 ], [ %281, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %291 = uitofp i32 %290 to float
  %.not551.i = icmp eq i32 %280, 0
  %292 = add nsw i32 %280, -25
  %293 = select i1 %.not551.i, i32 -24, i32 %292
  %294 = call float @__ocml_ldexp_f32(float noundef %291, i32 noundef %293) #6
  %295 = fneg contract float %294
  %.not552553.i = icmp slt i16 %.sroa.0182.0.copyload.i, 0
  %296 = select contract i1 %.not552553.i, float %295, float %294
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %289, %282
  %297 = phi float [ %286, %282 ], [ %296, %289 ]
  %298 = fmul contract float %252, %297
  %299 = fadd contract float %224, %298
  %300 = add nuw nsw i64 %223, 1
  %exitcond591.not.i = icmp eq i64 %300, 64
  br i1 %exitcond591.not.i, label %._crit_edge579.i, label %222, !llvm.loop !38

301:                                              ; preds = %._crit_edge579.i
  %302 = shl nuw i32 %.tr.i, 7
  %303 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %304 = icmp eq i64 %303, 0
  call void @llvm.assume(i1 %304)
  %305 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %306 = icmp eq i64 %305, 0
  call void @llvm.assume(i1 %306)
  %307 = sext i32 %.fr595.i to i64
  %308 = call i32 @llvm.amdgcn.groupstaticsize()
  %309 = inttoptr i32 %308 to ptr addrspace(3)
  %310 = sext i32 %302 to i64
  %311 = icmp slt i32 %4, 1
  %312 = icmp ugt i32 %4, 1
  %313 = icmp ugt i32 %4, 2
  %314 = icmp ugt i32 %4, 3
  %315 = icmp ugt i32 %4, 4
  %316 = icmp ugt i32 %4, 5
  %317 = icmp ugt i32 %4, 6
  %318 = icmp ugt i32 %4, 7
  %319 = icmp ugt i32 %4, 8
  %320 = icmp ugt i32 %4, 9
  %321 = icmp ugt i32 %4, 10
  %322 = icmp ugt i32 %4, 11
  %323 = icmp ugt i32 %4, 12
  %324 = icmp ugt i32 %4, 13
  %325 = icmp ugt i32 %4, 14
  %326 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split581.us.i, %301
  %327 = phi i64 [ 0, %301 ], [ %333, %.split581.us.i ]
  %328 = icmp sge i64 %327, %307
  %329 = shl i64 %327, 4
  %.tr545.i = trunc i64 %327 to i32
  %330 = shl i32 %.tr545.i, 4
  %331 = sext i32 %330 to i64
  %332 = add nsw i64 %331, %310
  %brmerge.i = select i1 %328, i1 true, i1 %311
  br i1 %brmerge.i, label %.split581.us.i, label %.preheader.split.1.i

.split581.us.i:                                   ; preds = %422, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %333 = add i64 %327, 1
  %exitcond593.not.i = icmp eq i64 %333, 8
  br i1 %exitcond593.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %334 = trunc i64 %329 to i32
  %335 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %334
  %336 = load float, ptr addrspace(3) %335, align 4, !tbaa !23
  %337 = getelementptr inbounds float, ptr %9, i64 %332
  store float %336, ptr %337, align 32, !tbaa !23
  br i1 %312, label %.preheader.split.2.i, label %.split581.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %338 = trunc i64 %329 to i32
  %339 = or disjoint i32 %338, 1
  %340 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %339
  %341 = load float, ptr addrspace(3) %340, align 4, !tbaa !23
  %342 = or disjoint i64 %332, 1
  %343 = getelementptr inbounds float, ptr %9, i64 %342
  store float %341, ptr %343, align 4, !tbaa !23
  br i1 %313, label %.preheader.split.3.i, label %.split581.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %344 = trunc i64 %329 to i32
  %345 = or disjoint i32 %344, 2
  %346 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %345
  %347 = load float, ptr addrspace(3) %346, align 4, !tbaa !23
  %348 = or disjoint i64 %332, 2
  %349 = getelementptr inbounds float, ptr %9, i64 %348
  store float %347, ptr %349, align 8, !tbaa !23
  br i1 %314, label %.preheader.split.4.i, label %.split581.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %350 = trunc i64 %329 to i32
  %351 = or disjoint i32 %350, 3
  %352 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %351
  %353 = load float, ptr addrspace(3) %352, align 4, !tbaa !23
  %354 = or disjoint i64 %332, 3
  %355 = getelementptr inbounds float, ptr %9, i64 %354
  store float %353, ptr %355, align 4, !tbaa !23
  br i1 %315, label %.preheader.split.5.i, label %.split581.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %356 = trunc i64 %329 to i32
  %357 = or disjoint i32 %356, 4
  %358 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %357
  %359 = load float, ptr addrspace(3) %358, align 4, !tbaa !23
  %360 = or disjoint i64 %332, 4
  %361 = getelementptr inbounds float, ptr %9, i64 %360
  store float %359, ptr %361, align 16, !tbaa !23
  br i1 %316, label %.preheader.split.6.i, label %.split581.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %362 = trunc i64 %329 to i32
  %363 = or disjoint i32 %362, 5
  %364 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %363
  %365 = load float, ptr addrspace(3) %364, align 4, !tbaa !23
  %366 = or disjoint i64 %332, 5
  %367 = getelementptr inbounds float, ptr %9, i64 %366
  store float %365, ptr %367, align 4, !tbaa !23
  br i1 %317, label %.preheader.split.7.i, label %.split581.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %368 = trunc i64 %329 to i32
  %369 = or disjoint i32 %368, 6
  %370 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %369
  %371 = load float, ptr addrspace(3) %370, align 4, !tbaa !23
  %372 = or disjoint i64 %332, 6
  %373 = getelementptr inbounds float, ptr %9, i64 %372
  store float %371, ptr %373, align 8, !tbaa !23
  br i1 %318, label %.preheader.split.8.i, label %.split581.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %374 = trunc i64 %329 to i32
  %375 = or disjoint i32 %374, 7
  %376 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %375
  %377 = load float, ptr addrspace(3) %376, align 4, !tbaa !23
  %378 = or disjoint i64 %332, 7
  %379 = getelementptr inbounds float, ptr %9, i64 %378
  store float %377, ptr %379, align 4, !tbaa !23
  br i1 %319, label %.preheader.split.9.i, label %.split581.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %380 = trunc i64 %329 to i32
  %381 = or disjoint i32 %380, 8
  %382 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %381
  %383 = load float, ptr addrspace(3) %382, align 4, !tbaa !23
  %384 = or disjoint i64 %332, 8
  %385 = getelementptr inbounds float, ptr %9, i64 %384
  store float %383, ptr %385, align 32, !tbaa !23
  br i1 %320, label %.preheader.split.10.i, label %.split581.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %386 = trunc i64 %329 to i32
  %387 = or disjoint i32 %386, 9
  %388 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %387
  %389 = load float, ptr addrspace(3) %388, align 4, !tbaa !23
  %390 = or disjoint i64 %332, 9
  %391 = getelementptr inbounds float, ptr %9, i64 %390
  store float %389, ptr %391, align 4, !tbaa !23
  br i1 %321, label %.preheader.split.11.i, label %.split581.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %392 = trunc i64 %329 to i32
  %393 = or disjoint i32 %392, 10
  %394 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %393
  %395 = load float, ptr addrspace(3) %394, align 4, !tbaa !23
  %396 = or disjoint i64 %332, 10
  %397 = getelementptr inbounds float, ptr %9, i64 %396
  store float %395, ptr %397, align 8, !tbaa !23
  br i1 %322, label %.preheader.split.12.i, label %.split581.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %398 = trunc i64 %329 to i32
  %399 = or disjoint i32 %398, 11
  %400 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %399
  %401 = load float, ptr addrspace(3) %400, align 4, !tbaa !23
  %402 = or disjoint i64 %332, 11
  %403 = getelementptr inbounds float, ptr %9, i64 %402
  store float %401, ptr %403, align 4, !tbaa !23
  br i1 %323, label %.preheader.split.13.i, label %.split581.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %404 = trunc i64 %329 to i32
  %405 = or disjoint i32 %404, 12
  %406 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %405
  %407 = load float, ptr addrspace(3) %406, align 4, !tbaa !23
  %408 = or disjoint i64 %332, 12
  %409 = getelementptr inbounds float, ptr %9, i64 %408
  store float %407, ptr %409, align 16, !tbaa !23
  br i1 %324, label %.preheader.split.14.i, label %.split581.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %410 = trunc i64 %329 to i32
  %411 = or disjoint i32 %410, 13
  %412 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %411
  %413 = load float, ptr addrspace(3) %412, align 4, !tbaa !23
  %414 = or disjoint i64 %332, 13
  %415 = getelementptr inbounds float, ptr %9, i64 %414
  store float %413, ptr %415, align 4, !tbaa !23
  br i1 %325, label %.preheader.split.15.i, label %.split581.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %416 = trunc i64 %329 to i32
  %417 = or disjoint i32 %416, 14
  %418 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !23
  %420 = or disjoint i64 %332, 14
  %421 = getelementptr inbounds float, ptr %9, i64 %420
  store float %419, ptr %421, align 8, !tbaa !23
  br i1 %326, label %422, label %.split581.us.i

422:                                              ; preds = %.preheader.split.15.i
  %423 = trunc i64 %329 to i32
  %424 = or disjoint i32 %423, 15
  %425 = getelementptr inbounds float, ptr addrspace(3) %309, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !23
  %427 = or disjoint i64 %332, 15
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 4, !tbaa !23
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
!37 = distinct !{!37, !28, !33, !34}
!38 = distinct !{!38, !28}
!39 = distinct !{!39, !28}
;----------------- End AdaptiveCpp IR dump ---------------
