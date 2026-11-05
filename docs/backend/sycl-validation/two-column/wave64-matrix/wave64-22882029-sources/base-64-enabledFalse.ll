;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-ey4oifvj/kernel.cpp"
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
  %.fr512.i = freeze i32 %3
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
  br i1 %40, label %.preheader483.i, label %.loopexit484.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 64
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

.preheader483.i:                                  ; preds = %._crit_edge.i
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
  %56 = icmp sgt i32 %.fr512.i, 0
  br i1 %56, label %.preheader483.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader483.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %54, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i
  %57 = icmp sgt i32 %.fr512.i, 1
  %58 = or disjoint i64 %55, 64
  br i1 %57, label %.preheader483.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %53, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader483.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i, %.split.us.i
  %59 = phi i64 [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i ], [ 0, %.split.us.i ]
  %60 = icmp slt i64 %59, %51
  br i1 %60, label %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i

61:                                               ; preds = %.preheader483.split.1.i
  %62 = add nuw nsw i64 %58, %59
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %62
  %.sroa.0239.0.copyload.1.i = load i16, ptr %63, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i: ; preds = %61, %.preheader483.split.1.i
  %.sroa.0241.2.1.i = phi i16 [ %.sroa.0239.0.copyload.1.i, %61 ], [ 0, %.preheader483.split.1.i ]
  %64 = trunc i64 %59 to i32
  %65 = add i32 %64, 64
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %65
  store i16 %.sroa.0241.2.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !25
  %67 = add nuw nsw i64 %59, 1
  %exitcond.1.not.i = icmp eq i64 %67, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader483.split.1.i, !llvm.loop !28

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i
  %68 = icmp sgt i32 %.fr512.i, 2
  %69 = or disjoint i64 %55, 128
  br i1 %68, label %.preheader483.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %53, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader483.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i, %.split.us.1.i
  %70 = phi i64 [ %78, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i ], [ 0, %.split.us.1.i ]
  %71 = icmp slt i64 %70, %51
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i

72:                                               ; preds = %.preheader483.split.2.i
  %73 = add nuw nsw i64 %69, %70
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0239.0.copyload.2.i = load i16, ptr %74, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i: ; preds = %72, %.preheader483.split.2.i
  %.sroa.0241.2.2.i = phi i16 [ %.sroa.0239.0.copyload.2.i, %72 ], [ 0, %.preheader483.split.2.i ]
  %75 = trunc i64 %70 to i32
  %76 = add i32 %75, 128
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %76
  store i16 %.sroa.0241.2.2.i, ptr addrspace(3) %77, align 2, !tbaa.struct !25
  %78 = add nuw nsw i64 %70, 1
  %exitcond.2.not.i = icmp eq i64 %78, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader483.split.2.i, !llvm.loop !28

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i
  %79 = icmp sgt i32 %.fr512.i, 3
  %80 = or disjoint i64 %55, 192
  br i1 %79, label %.preheader483.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %53, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader483.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i, %.split.us.2.i
  %81 = phi i64 [ %89, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i ], [ 0, %.split.us.2.i ]
  %82 = icmp slt i64 %81, %51
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i

83:                                               ; preds = %.preheader483.split.3.i
  %84 = add nuw nsw i64 %80, %81
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %84
  %.sroa.0239.0.copyload.3.i = load i16, ptr %85, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i: ; preds = %83, %.preheader483.split.3.i
  %.sroa.0241.2.3.i = phi i16 [ %.sroa.0239.0.copyload.3.i, %83 ], [ 0, %.preheader483.split.3.i ]
  %86 = trunc i64 %81 to i32
  %87 = add i32 %86, 192
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %87
  store i16 %.sroa.0241.2.3.i, ptr addrspace(3) %88, align 2, !tbaa.struct !25
  %89 = add nuw nsw i64 %81, 1
  %exitcond.3.not.i = icmp eq i64 %89, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader483.split.3.i, !llvm.loop !28

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i
  %90 = icmp sgt i32 %.fr512.i, 4
  %91 = or disjoint i64 %55, 256
  br i1 %90, label %.preheader483.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %53, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader483.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i, %.split.us.3.i
  %92 = phi i64 [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i ], [ 0, %.split.us.3.i ]
  %93 = icmp slt i64 %92, %51
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i

94:                                               ; preds = %.preheader483.split.4.i
  %95 = add nuw nsw i64 %91, %92
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %95
  %.sroa.0239.0.copyload.4.i = load i16, ptr %96, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i: ; preds = %94, %.preheader483.split.4.i
  %.sroa.0241.2.4.i = phi i16 [ %.sroa.0239.0.copyload.4.i, %94 ], [ 0, %.preheader483.split.4.i ]
  %97 = trunc i64 %92 to i32
  %98 = add i32 %97, 256
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %98
  store i16 %.sroa.0241.2.4.i, ptr addrspace(3) %99, align 2, !tbaa.struct !25
  %100 = add nuw nsw i64 %92, 1
  %exitcond.4.not.i = icmp eq i64 %100, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader483.split.4.i, !llvm.loop !28

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i
  %101 = icmp sgt i32 %.fr512.i, 5
  %102 = or disjoint i64 %55, 320
  br i1 %101, label %.preheader483.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %53, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader483.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i, %.split.us.4.i
  %103 = phi i64 [ %111, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i ], [ 0, %.split.us.4.i ]
  %104 = icmp slt i64 %103, %51
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i

105:                                              ; preds = %.preheader483.split.5.i
  %106 = add nuw nsw i64 %102, %103
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %106
  %.sroa.0239.0.copyload.5.i = load i16, ptr %107, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i: ; preds = %105, %.preheader483.split.5.i
  %.sroa.0241.2.5.i = phi i16 [ %.sroa.0239.0.copyload.5.i, %105 ], [ 0, %.preheader483.split.5.i ]
  %108 = trunc i64 %103 to i32
  %109 = add i32 %108, 320
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %109
  store i16 %.sroa.0241.2.5.i, ptr addrspace(3) %110, align 2, !tbaa.struct !25
  %111 = add nuw nsw i64 %103, 1
  %exitcond.5.not.i = icmp eq i64 %111, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader483.split.5.i, !llvm.loop !28

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i
  %112 = icmp sgt i32 %.fr512.i, 6
  %113 = or disjoint i64 %55, 384
  br i1 %112, label %.preheader483.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %53, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i

.preheader483.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i, %.split.us.5.i
  %114 = phi i64 [ %122, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i ], [ 0, %.split.us.5.i ]
  %115 = icmp slt i64 %114, %51
  br i1 %115, label %116, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i

116:                                              ; preds = %.preheader483.split.6.i
  %117 = add nuw nsw i64 %113, %114
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0239.0.copyload.6.i = load i16, ptr %118, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i: ; preds = %116, %.preheader483.split.6.i
  %.sroa.0241.2.6.i = phi i16 [ %.sroa.0239.0.copyload.6.i, %116 ], [ 0, %.preheader483.split.6.i ]
  %119 = trunc i64 %114 to i32
  %120 = add i32 %119, 384
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %120
  store i16 %.sroa.0241.2.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !25
  %122 = add nuw nsw i64 %114, 1
  %exitcond.6.not.i = icmp eq i64 %122, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader483.split.6.i, !llvm.loop !28

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i
  %123 = icmp sgt i32 %.fr512.i, 7
  %124 = or disjoint i64 %55, 448
  br i1 %123, label %.preheader483.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %53, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit484.i

.preheader483.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i, %.split.us.6.i
  %125 = phi i64 [ %133, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i ], [ 0, %.split.us.6.i ]
  %126 = icmp slt i64 %125, %51
  br i1 %126, label %127, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

127:                                              ; preds = %.preheader483.split.7.i
  %128 = add nuw nsw i64 %124, %125
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %128
  %.sroa.0239.0.copyload.7.i = load i16, ptr %129, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i: ; preds = %127, %.preheader483.split.7.i
  %.sroa.0241.2.7.i = phi i16 [ %.sroa.0239.0.copyload.7.i, %127 ], [ 0, %.preheader483.split.7.i ]
  %130 = trunc i64 %125 to i32
  %131 = add i32 %130, 448
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %131
  store i16 %.sroa.0241.2.7.i, ptr addrspace(3) %132, align 2, !tbaa.struct !25
  %133 = add nuw nsw i64 %125, 1
  %exitcond.7.not.i = icmp eq i64 %133, 64
  br i1 %exitcond.7.not.i, label %.loopexit484.i, label %.preheader483.split.7.i, !llvm.loop !28

.preheader483.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i, %.preheader483.i
  %134 = phi i64 [ %141, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i ], [ 0, %.preheader483.i ]
  %135 = icmp slt i64 %134, %51
  br i1 %135, label %136, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i

136:                                              ; preds = %.preheader483.split.i
  %137 = add nuw nsw i64 %134, %55
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %137
  %.sroa.0239.0.copyload.i = load i16, ptr %138, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i: ; preds = %136, %.preheader483.split.i
  %.sroa.0241.2.i = phi i16 [ %.sroa.0239.0.copyload.i, %136 ], [ 0, %.preheader483.split.i ]
  %139 = trunc i64 %134 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %139
  store i16 %.sroa.0241.2.i, ptr addrspace(3) %140, align 2, !tbaa.struct !25
  %141 = add nuw nsw i64 %134, 1
  %exitcond.not.i = icmp eq i64 %141, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader483.split.i, !llvm.loop !28

.loopexit484.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i, %._crit_edge.i
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
  br i1 %144, label %145, label %.lr.ph493.i

145:                                              ; preds = %.loopexit484.i
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
  br label %.preheader482.i

.preheader482.i:                                  ; preds = %.split490.us.i, %145
  %157 = phi i64 [ 0, %145 ], [ %165, %.split490.us.i ]
  %158 = icmp slt i64 %157, %151
  %159 = shl i64 %157, 6
  %.tr476.i = trunc i64 %157 to i32
  %160 = shl i32 %.tr476.i, 6
  %161 = sext i32 %160 to i64
  %162 = add nsw i64 %161, %156
  %.fr491.i = freeze i1 %158
  br i1 %.fr491.i, label %.preheader482.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader482.i
  %.tr511.i = trunc i64 %157 to i32
  %163 = shl i32 %.tr511.i, 7
  %164 = add i32 %163, 1536
  %scevgep505.i = getelementptr i8, ptr addrspace(3) %154, i32 %164
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep505.i, i8 0, i32 128, i1 false)
  br label %.split490.us.i

.split490.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %165 = add nuw nsw i64 %157, 1
  %exitcond507.not.i = icmp eq i64 %165, 16
  br i1 %exitcond507.not.i, label %.lr.ph493.i, label %.preheader482.i, !llvm.loop !31

.preheader482.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader482.i
  %166 = phi i64 [ %174, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader482.i ]
  %167 = icmp slt i64 %166, %152
  br i1 %167, label %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

168:                                              ; preds = %.preheader482.split.i
  %169 = add nuw nsw i64 %162, %166
  %170 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %169
  %.sroa.0228.0.copyload.i = load i16, ptr %170, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %168, %.preheader482.split.i
  %.sroa.0230.2.i = phi i16 [ %.sroa.0228.0.copyload.i, %168 ], [ 0, %.preheader482.split.i ]
  %171 = add nuw nsw i64 %166, %159
  %172 = trunc i64 %171 to i32
  %173 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %155, i32 %172
  store i16 %.sroa.0230.2.i, ptr addrspace(3) %173, align 2, !tbaa.struct !25
  %174 = add nuw nsw i64 %166, 1
  %exitcond506.not.i = icmp eq i64 %174, 64
  br i1 %exitcond506.not.i, label %.split490.us.i, label %.preheader482.split.i, !llvm.loop !32

.lr.ph493.i:                                      ; preds = %.split490.us.i, %.loopexit484.i
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

.lr.ph496.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  %195 = and i64 %189, 15
  br label %210

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph493.i
  %196 = phi i64 [ %179, %.lr.ph493.i ], [ %205, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %197 = lshr i64 %196, 4
  %198 = shl nuw nsw i64 %196, 6
  %199 = and i64 %198, 960
  %200 = or disjoint i64 %199, %197
  %201 = trunc i64 %200 to i32
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %183, i32 %201
  %.sroa.0294.0.copyload.i = load i16, ptr addrspace(3) %202, align 2, !tbaa.struct !25
  %203 = trunc i64 %196 to i32
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %184, i32 %203
  store i16 %.sroa.0294.0.copyload.i, ptr addrspace(3) %204, align 2, !tbaa.struct !25
  %205 = add nuw nsw i64 %196, 64
  %206 = icmp ult i64 %196, 960
  br i1 %206, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph496.i, !llvm.loop !33

._crit_edge497.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %207 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %208 = icmp ult i64 %207, 64
  call void @llvm.assume(i1 %208)
  %209 = icmp eq i64 %207, 0
  br i1 %209, label %272, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

210:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph496.i
  %211 = phi i64 [ %189, %.lr.ph496.i ], [ %217, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %212 = trunc i64 %211 to i32
  %213 = getelementptr inbounds float, ptr addrspace(3) %192, i32 %212
  %214 = load float, ptr addrspace(3) %213, align 4, !tbaa !19
  %215 = shl nuw nsw i64 %211, 2
  %216 = and i64 %215, 448
  br label %219

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %270, ptr addrspace(3) %213, align 4, !tbaa !19
  %217 = add nuw nsw i64 %211, 64
  %218 = icmp ult i64 %211, 64
  br i1 %218, label %210, label %._crit_edge497.i, !llvm.loop !34

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %210
  %220 = phi i64 [ 0, %210 ], [ %271, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %221 = phi float [ %214, %210 ], [ %270, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %222 = add nuw nsw i64 %220, %216
  %223 = trunc i64 %222 to i32
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %223
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %224, align 2, !tbaa.struct !25
  %225 = shl nuw nsw i64 %220, 4
  %226 = or disjoint i64 %225, %195
  %227 = trunc i64 %226 to i32
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %194, i32 %227
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %228, align 2, !tbaa.struct !25
  %229 = zext i16 %.sroa.0185.0.copyload.i to i32
  %230 = lshr i32 %229, 10
  %231 = and i32 %230, 31
  %232 = and i32 %229, 1023
  switch i32 %231, label %238 [
    i32 31, label %233
    i32 0, label %240
  ]

233:                                              ; preds = %219
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %234 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not475.i = icmp eq i32 %232, 0
  %235 = select i1 %.not475.i, i32 2139095040, i32 2143289344
  %236 = or disjoint i32 %235, %234
  %237 = bitcast i32 %236 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

238:                                              ; preds = %219
  %239 = or disjoint i32 %232, 1024
  br label %240

240:                                              ; preds = %238, %219
  %241 = phi i32 [ %239, %238 ], [ %232, %219 ]
  %242 = uitofp i32 %241 to float
  %.not.i = icmp eq i32 %231, 0
  %243 = add nsw i32 %231, -25
  %244 = select i1 %.not.i, i32 -24, i32 %243
  %245 = call float @__ocml_ldexp_f32(float noundef %242, i32 noundef %244) #6
  %246 = fneg contract float %245
  %.not469470.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %247 = select contract i1 %.not469470.i, float %246, float %245
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %240, %233
  %248 = phi float [ %237, %233 ], [ %247, %240 ]
  %249 = zext i16 %.sroa.0176.0.copyload.i to i32
  %250 = lshr i32 %249, 10
  %251 = and i32 %250, 31
  %252 = and i32 %249, 1023
  switch i32 %251, label %258 [
    i32 31, label %253
    i32 0, label %260
  ]

253:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %254 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not474.i = icmp eq i32 %252, 0
  %255 = select i1 %.not474.i, i32 2139095040, i32 2143289344
  %256 = or disjoint i32 %255, %254
  %257 = bitcast i32 %256 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

258:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %259 = or disjoint i32 %252, 1024
  br label %260

260:                                              ; preds = %258, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %261 = phi i32 [ %259, %258 ], [ %252, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %262 = uitofp i32 %261 to float
  %.not471.i = icmp eq i32 %251, 0
  %263 = add nsw i32 %251, -25
  %264 = select i1 %.not471.i, i32 -24, i32 %263
  %265 = call float @__ocml_ldexp_f32(float noundef %262, i32 noundef %264) #6
  %266 = fneg contract float %265
  %.not472473.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %267 = select contract i1 %.not472473.i, float %266, float %265
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %260, %253
  %268 = phi float [ %257, %253 ], [ %267, %260 ]
  %269 = fmul contract float %248, %268
  %270 = fadd contract float %221, %269
  %271 = add nuw nsw i64 %220, 1
  %exitcond508.not.i = icmp eq i64 %271, 64
  br i1 %exitcond508.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %219, !llvm.loop !35

272:                                              ; preds = %._crit_edge497.i
  %273 = shl nuw i32 %.tr.i, 7
  %274 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %275 = icmp eq i64 %274, 0
  call void @llvm.assume(i1 %275)
  %276 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %277 = icmp eq i64 %276, 0
  call void @llvm.assume(i1 %277)
  %278 = sext i32 %.fr512.i to i64
  %279 = call i32 @llvm.amdgcn.groupstaticsize()
  %280 = inttoptr i32 %279 to ptr addrspace(3)
  %281 = sext i32 %273 to i64
  %282 = icmp slt i32 %4, 1
  %283 = icmp ugt i32 %4, 1
  %284 = icmp ugt i32 %4, 2
  %285 = icmp ugt i32 %4, 3
  %286 = icmp ugt i32 %4, 4
  %287 = icmp ugt i32 %4, 5
  %288 = icmp ugt i32 %4, 6
  %289 = icmp ugt i32 %4, 7
  %290 = icmp ugt i32 %4, 8
  %291 = icmp ugt i32 %4, 9
  %292 = icmp ugt i32 %4, 10
  %293 = icmp ugt i32 %4, 11
  %294 = icmp ugt i32 %4, 12
  %295 = icmp ugt i32 %4, 13
  %296 = icmp ugt i32 %4, 14
  %297 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split499.us.i, %272
  %298 = phi i64 [ 0, %272 ], [ %304, %.split499.us.i ]
  %299 = icmp sge i64 %298, %278
  %300 = shl i64 %298, 4
  %.tr468.i = trunc i64 %298 to i32
  %301 = shl i32 %.tr468.i, 4
  %302 = sext i32 %301 to i64
  %303 = add nsw i64 %302, %281
  %brmerge.i = select i1 %299, i1 true, i1 %282
  br i1 %brmerge.i, label %.split499.us.i, label %.preheader.split.1.i

.split499.us.i:                                   ; preds = %393, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %304 = add i64 %298, 1
  %exitcond510.not.i = icmp eq i64 %304, 8
  br i1 %exitcond510.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %305 = trunc i64 %300 to i32
  %306 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %305
  %307 = load float, ptr addrspace(3) %306, align 4, !tbaa !19
  %308 = getelementptr inbounds float, ptr %9, i64 %303
  store float %307, ptr %308, align 32, !tbaa !19
  br i1 %283, label %.preheader.split.2.i, label %.split499.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %309 = trunc i64 %300 to i32
  %310 = or disjoint i32 %309, 1
  %311 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !19
  %313 = or disjoint i64 %303, 1
  %314 = getelementptr inbounds float, ptr %9, i64 %313
  store float %312, ptr %314, align 4, !tbaa !19
  br i1 %284, label %.preheader.split.3.i, label %.split499.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %315 = trunc i64 %300 to i32
  %316 = or disjoint i32 %315, 2
  %317 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %316
  %318 = load float, ptr addrspace(3) %317, align 4, !tbaa !19
  %319 = or disjoint i64 %303, 2
  %320 = getelementptr inbounds float, ptr %9, i64 %319
  store float %318, ptr %320, align 8, !tbaa !19
  br i1 %285, label %.preheader.split.4.i, label %.split499.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %321 = trunc i64 %300 to i32
  %322 = or disjoint i32 %321, 3
  %323 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %322
  %324 = load float, ptr addrspace(3) %323, align 4, !tbaa !19
  %325 = or disjoint i64 %303, 3
  %326 = getelementptr inbounds float, ptr %9, i64 %325
  store float %324, ptr %326, align 4, !tbaa !19
  br i1 %286, label %.preheader.split.5.i, label %.split499.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %327 = trunc i64 %300 to i32
  %328 = or disjoint i32 %327, 4
  %329 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %328
  %330 = load float, ptr addrspace(3) %329, align 4, !tbaa !19
  %331 = or disjoint i64 %303, 4
  %332 = getelementptr inbounds float, ptr %9, i64 %331
  store float %330, ptr %332, align 16, !tbaa !19
  br i1 %287, label %.preheader.split.6.i, label %.split499.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %333 = trunc i64 %300 to i32
  %334 = or disjoint i32 %333, 5
  %335 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %334
  %336 = load float, ptr addrspace(3) %335, align 4, !tbaa !19
  %337 = or disjoint i64 %303, 5
  %338 = getelementptr inbounds float, ptr %9, i64 %337
  store float %336, ptr %338, align 4, !tbaa !19
  br i1 %288, label %.preheader.split.7.i, label %.split499.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %339 = trunc i64 %300 to i32
  %340 = or disjoint i32 %339, 6
  %341 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %340
  %342 = load float, ptr addrspace(3) %341, align 4, !tbaa !19
  %343 = or disjoint i64 %303, 6
  %344 = getelementptr inbounds float, ptr %9, i64 %343
  store float %342, ptr %344, align 8, !tbaa !19
  br i1 %289, label %.preheader.split.8.i, label %.split499.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %345 = trunc i64 %300 to i32
  %346 = or disjoint i32 %345, 7
  %347 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %346
  %348 = load float, ptr addrspace(3) %347, align 4, !tbaa !19
  %349 = or disjoint i64 %303, 7
  %350 = getelementptr inbounds float, ptr %9, i64 %349
  store float %348, ptr %350, align 4, !tbaa !19
  br i1 %290, label %.preheader.split.9.i, label %.split499.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %351 = trunc i64 %300 to i32
  %352 = or disjoint i32 %351, 8
  %353 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %352
  %354 = load float, ptr addrspace(3) %353, align 4, !tbaa !19
  %355 = or disjoint i64 %303, 8
  %356 = getelementptr inbounds float, ptr %9, i64 %355
  store float %354, ptr %356, align 32, !tbaa !19
  br i1 %291, label %.preheader.split.10.i, label %.split499.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %357 = trunc i64 %300 to i32
  %358 = or disjoint i32 %357, 9
  %359 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %358
  %360 = load float, ptr addrspace(3) %359, align 4, !tbaa !19
  %361 = or disjoint i64 %303, 9
  %362 = getelementptr inbounds float, ptr %9, i64 %361
  store float %360, ptr %362, align 4, !tbaa !19
  br i1 %292, label %.preheader.split.11.i, label %.split499.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %363 = trunc i64 %300 to i32
  %364 = or disjoint i32 %363, 10
  %365 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %364
  %366 = load float, ptr addrspace(3) %365, align 4, !tbaa !19
  %367 = or disjoint i64 %303, 10
  %368 = getelementptr inbounds float, ptr %9, i64 %367
  store float %366, ptr %368, align 8, !tbaa !19
  br i1 %293, label %.preheader.split.12.i, label %.split499.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %369 = trunc i64 %300 to i32
  %370 = or disjoint i32 %369, 11
  %371 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %370
  %372 = load float, ptr addrspace(3) %371, align 4, !tbaa !19
  %373 = or disjoint i64 %303, 11
  %374 = getelementptr inbounds float, ptr %9, i64 %373
  store float %372, ptr %374, align 4, !tbaa !19
  br i1 %294, label %.preheader.split.13.i, label %.split499.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %375 = trunc i64 %300 to i32
  %376 = or disjoint i32 %375, 12
  %377 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %376
  %378 = load float, ptr addrspace(3) %377, align 4, !tbaa !19
  %379 = or disjoint i64 %303, 12
  %380 = getelementptr inbounds float, ptr %9, i64 %379
  store float %378, ptr %380, align 16, !tbaa !19
  br i1 %295, label %.preheader.split.14.i, label %.split499.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %381 = trunc i64 %300 to i32
  %382 = or disjoint i32 %381, 13
  %383 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %382
  %384 = load float, ptr addrspace(3) %383, align 4, !tbaa !19
  %385 = or disjoint i64 %303, 13
  %386 = getelementptr inbounds float, ptr %9, i64 %385
  store float %384, ptr %386, align 4, !tbaa !19
  br i1 %296, label %.preheader.split.15.i, label %.split499.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %387 = trunc i64 %300 to i32
  %388 = or disjoint i32 %387, 14
  %389 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %388
  %390 = load float, ptr addrspace(3) %389, align 4, !tbaa !19
  %391 = or disjoint i64 %303, 14
  %392 = getelementptr inbounds float, ptr %9, i64 %391
  store float %390, ptr %392, align 8, !tbaa !19
  br i1 %297, label %393, label %.split499.us.i

393:                                              ; preds = %.preheader.split.15.i
  %394 = trunc i64 %300 to i32
  %395 = or disjoint i32 %394, 15
  %396 = getelementptr inbounds float, ptr addrspace(3) %280, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !19
  %398 = or disjoint i64 %303, 15
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 4, !tbaa !19
  br label %.split499.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge497.i, %.split499.us.i
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
!34 = distinct !{!34, !24}
!35 = distinct !{!35, !24}
!36 = distinct !{!36, !24}
;----------------- End AdaptiveCpp IR dump ---------------
