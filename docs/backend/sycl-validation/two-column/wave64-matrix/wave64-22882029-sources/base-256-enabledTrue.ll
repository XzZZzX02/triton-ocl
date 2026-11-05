;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-3voql89o/kernel.cpp"
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
  %.fr512.i = freeze i32 %3
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
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %42 = icmp ult i64 %41, 256
  call void @llvm.assume(i1 %42)
  %43 = icmp eq i64 %41, 0
  br i1 %43, label %.preheader483.i, label %.loopexit484.i

.preheader483.i:                                  ; preds = %._crit_edge.i
  %44 = shl nuw i32 %.tr.i, 9
  %45 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = sext i32 %5 to i64
  %50 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %51 = inttoptr i32 %50 to ptr addrspace(3)
  %52 = getelementptr i8, ptr addrspace(3) %51, i32 512
  %53 = sext i32 %44 to i64
  %54 = icmp sgt i32 %.fr512.i, 0
  br i1 %54, label %.preheader483.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader483.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %52, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %55 = icmp sgt i32 %.fr512.i, 1
  %56 = or disjoint i64 %53, 64
  br i1 %55, label %.preheader483.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %51, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader483.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %.split.us.i
  %57 = phi i64 [ %65, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i ], [ 0, %.split.us.i ]
  %58 = icmp slt i64 %57, %49
  br i1 %58, label %59, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i

59:                                               ; preds = %.preheader483.split.1.i
  %60 = add nuw nsw i64 %56, %57
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %60
  %.sroa.0239.0.copyload.1.i = load i16, ptr %61, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %59, %.preheader483.split.1.i
  %.sroa.0241.2.1.i = phi i16 [ %.sroa.0239.0.copyload.1.i, %59 ], [ 0, %.preheader483.split.1.i ]
  %62 = trunc i64 %57 to i32
  %63 = add i32 %62, 64
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %63
  store i16 %.sroa.0241.2.1.i, ptr addrspace(3) %64, align 2, !tbaa.struct !27
  %65 = add nuw nsw i64 %57, 1
  %exitcond.1.not.i = icmp eq i64 %65, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader483.split.1.i, !llvm.loop !30

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %66 = icmp sgt i32 %.fr512.i, 2
  %67 = or disjoint i64 %53, 128
  br i1 %66, label %.preheader483.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %51, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader483.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %.split.us.1.i
  %68 = phi i64 [ %76, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i ], [ 0, %.split.us.1.i ]
  %69 = icmp slt i64 %68, %49
  br i1 %69, label %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i

70:                                               ; preds = %.preheader483.split.2.i
  %71 = add nuw nsw i64 %67, %68
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %71
  %.sroa.0239.0.copyload.2.i = load i16, ptr %72, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %70, %.preheader483.split.2.i
  %.sroa.0241.2.2.i = phi i16 [ %.sroa.0239.0.copyload.2.i, %70 ], [ 0, %.preheader483.split.2.i ]
  %73 = trunc i64 %68 to i32
  %74 = add i32 %73, 128
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %74
  store i16 %.sroa.0241.2.2.i, ptr addrspace(3) %75, align 2, !tbaa.struct !27
  %76 = add nuw nsw i64 %68, 1
  %exitcond.2.not.i = icmp eq i64 %76, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader483.split.2.i, !llvm.loop !30

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %77 = icmp sgt i32 %.fr512.i, 3
  %78 = or disjoint i64 %53, 192
  br i1 %77, label %.preheader483.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %51, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader483.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %.split.us.2.i
  %79 = phi i64 [ %87, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i ], [ 0, %.split.us.2.i ]
  %80 = icmp slt i64 %79, %49
  br i1 %80, label %81, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i

81:                                               ; preds = %.preheader483.split.3.i
  %82 = add nuw nsw i64 %78, %79
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %82
  %.sroa.0239.0.copyload.3.i = load i16, ptr %83, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %81, %.preheader483.split.3.i
  %.sroa.0241.2.3.i = phi i16 [ %.sroa.0239.0.copyload.3.i, %81 ], [ 0, %.preheader483.split.3.i ]
  %84 = trunc i64 %79 to i32
  %85 = add i32 %84, 192
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %85
  store i16 %.sroa.0241.2.3.i, ptr addrspace(3) %86, align 2, !tbaa.struct !27
  %87 = add nuw nsw i64 %79, 1
  %exitcond.3.not.i = icmp eq i64 %87, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader483.split.3.i, !llvm.loop !30

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %88 = icmp sgt i32 %.fr512.i, 4
  %89 = or disjoint i64 %53, 256
  br i1 %88, label %.preheader483.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %51, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader483.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %.split.us.3.i
  %90 = phi i64 [ %98, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i ], [ 0, %.split.us.3.i ]
  %91 = icmp slt i64 %90, %49
  br i1 %91, label %92, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i

92:                                               ; preds = %.preheader483.split.4.i
  %93 = add nuw nsw i64 %89, %90
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0239.0.copyload.4.i = load i16, ptr %94, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %92, %.preheader483.split.4.i
  %.sroa.0241.2.4.i = phi i16 [ %.sroa.0239.0.copyload.4.i, %92 ], [ 0, %.preheader483.split.4.i ]
  %95 = trunc i64 %90 to i32
  %96 = add i32 %95, 256
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %96
  store i16 %.sroa.0241.2.4.i, ptr addrspace(3) %97, align 2, !tbaa.struct !27
  %98 = add nuw nsw i64 %90, 1
  %exitcond.4.not.i = icmp eq i64 %98, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader483.split.4.i, !llvm.loop !30

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %99 = icmp sgt i32 %.fr512.i, 5
  %100 = or disjoint i64 %53, 320
  br i1 %99, label %.preheader483.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %51, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader483.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %.split.us.4.i
  %101 = phi i64 [ %109, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i ], [ 0, %.split.us.4.i ]
  %102 = icmp slt i64 %101, %49
  br i1 %102, label %103, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i

103:                                              ; preds = %.preheader483.split.5.i
  %104 = add nuw nsw i64 %100, %101
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %104
  %.sroa.0239.0.copyload.5.i = load i16, ptr %105, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %103, %.preheader483.split.5.i
  %.sroa.0241.2.5.i = phi i16 [ %.sroa.0239.0.copyload.5.i, %103 ], [ 0, %.preheader483.split.5.i ]
  %106 = trunc i64 %101 to i32
  %107 = add i32 %106, 320
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %107
  store i16 %.sroa.0241.2.5.i, ptr addrspace(3) %108, align 2, !tbaa.struct !27
  %109 = add nuw nsw i64 %101, 1
  %exitcond.5.not.i = icmp eq i64 %109, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader483.split.5.i, !llvm.loop !30

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %110 = icmp sgt i32 %.fr512.i, 6
  %111 = or disjoint i64 %53, 384
  br i1 %110, label %.preheader483.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %51, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i

.preheader483.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %.split.us.5.i
  %112 = phi i64 [ %120, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %.split.us.5.i ]
  %113 = icmp slt i64 %112, %49
  br i1 %113, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i

114:                                              ; preds = %.preheader483.split.6.i
  %115 = add nuw nsw i64 %111, %112
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %115
  %.sroa.0239.0.copyload.6.i = load i16, ptr %116, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %114, %.preheader483.split.6.i
  %.sroa.0241.2.6.i = phi i16 [ %.sroa.0239.0.copyload.6.i, %114 ], [ 0, %.preheader483.split.6.i ]
  %117 = trunc i64 %112 to i32
  %118 = add i32 %117, 384
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %118
  store i16 %.sroa.0241.2.6.i, ptr addrspace(3) %119, align 2, !tbaa.struct !27
  %120 = add nuw nsw i64 %112, 1
  %exitcond.6.not.i = icmp eq i64 %120, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader483.split.6.i, !llvm.loop !30

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %121 = icmp sgt i32 %.fr512.i, 7
  %122 = or disjoint i64 %53, 448
  br i1 %121, label %.preheader483.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %51, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit484.i

.preheader483.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %.split.us.6.i
  %123 = phi i64 [ %131, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i ], [ 0, %.split.us.6.i ]
  %124 = icmp slt i64 %123, %49
  br i1 %124, label %125, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

125:                                              ; preds = %.preheader483.split.7.i
  %126 = add nuw nsw i64 %122, %123
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %126
  %.sroa.0239.0.copyload.7.i = load i16, ptr %127, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %125, %.preheader483.split.7.i
  %.sroa.0241.2.7.i = phi i16 [ %.sroa.0239.0.copyload.7.i, %125 ], [ 0, %.preheader483.split.7.i ]
  %128 = trunc i64 %123 to i32
  %129 = add i32 %128, 448
  %130 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %129
  store i16 %.sroa.0241.2.7.i, ptr addrspace(3) %130, align 2, !tbaa.struct !27
  %131 = add nuw nsw i64 %123, 1
  %exitcond.7.not.i = icmp eq i64 %131, 64
  br i1 %exitcond.7.not.i, label %.loopexit484.i, label %.preheader483.split.7.i, !llvm.loop !30

.preheader483.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %.preheader483.i
  %132 = phi i64 [ %139, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ], [ 0, %.preheader483.i ]
  %133 = icmp slt i64 %132, %49
  br i1 %133, label %134, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

134:                                              ; preds = %.preheader483.split.i
  %135 = add nuw nsw i64 %132, %53
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %135
  %.sroa.0239.0.copyload.i = load i16, ptr %136, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %134, %.preheader483.split.i
  %.sroa.0241.2.i = phi i16 [ %.sroa.0239.0.copyload.i, %134 ], [ 0, %.preheader483.split.i ]
  %137 = trunc i64 %132 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %137
  store i16 %.sroa.0241.2.i, ptr addrspace(3) %138, align 2, !tbaa.struct !27
  %139 = add nuw nsw i64 %132, 1
  %exitcond.not.i = icmp eq i64 %139, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader483.split.i, !llvm.loop !30

.loopexit484.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %140 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %141 = icmp ult i64 %140, 256
  call void @llvm.assume(i1 %141)
  %142 = icmp eq i64 %140, 0
  br i1 %142, label %143, label %.lr.ph493.i

143:                                              ; preds = %.loopexit484.i
  %144 = shl i32 %.tr.i, 10
  %145 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %146 = icmp eq i64 %145, 0
  call void @llvm.assume(i1 %146)
  %147 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %148 = icmp eq i64 %147, 0
  call void @llvm.assume(i1 %148)
  %149 = sext i32 %4 to i64
  %150 = sext i32 %5 to i64
  %151 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %152 = inttoptr i32 %151 to ptr addrspace(3)
  %153 = getelementptr inbounds i8, ptr addrspace(3) %152, i32 1536
  %154 = sext i32 %144 to i64
  br label %.preheader482.i

.preheader482.i:                                  ; preds = %.split490.us.i, %143
  %155 = phi i64 [ 0, %143 ], [ %163, %.split490.us.i ]
  %156 = icmp slt i64 %155, %149
  %157 = shl i64 %155, 6
  %.tr476.i = trunc i64 %155 to i32
  %158 = shl i32 %.tr476.i, 6
  %159 = sext i32 %158 to i64
  %160 = add nsw i64 %159, %154
  %.fr491.i = freeze i1 %156
  br i1 %.fr491.i, label %.preheader482.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.us.preheader.i: ; preds = %.preheader482.i
  %.tr511.i = trunc i64 %155 to i32
  %161 = shl i32 %.tr511.i, 7
  %162 = add i32 %161, 1536
  %scevgep505.i = getelementptr i8, ptr addrspace(3) %152, i32 %162
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep505.i, i8 0, i32 128, i1 false)
  br label %.split490.us.i

.split490.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.us.preheader.i
  %163 = add nuw nsw i64 %155, 1
  %exitcond507.not.i = icmp eq i64 %163, 16
  br i1 %exitcond507.not.i, label %.lr.ph493.i, label %.preheader482.i, !llvm.loop !34

.preheader482.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i, %.preheader482.i
  %164 = phi i64 [ %172, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i ], [ 0, %.preheader482.i ]
  %165 = icmp slt i64 %164, %150
  br i1 %165, label %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i

166:                                              ; preds = %.preheader482.split.i
  %167 = add nuw nsw i64 %160, %164
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %167
  %.sroa.0228.0.copyload.i = load i16, ptr %168, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i.i: ; preds = %166, %.preheader482.split.i
  %.sroa.0230.2.i = phi i16 [ %.sroa.0228.0.copyload.i, %166 ], [ 0, %.preheader482.split.i ]
  %169 = add nuw nsw i64 %164, %157
  %170 = trunc i64 %169 to i32
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %153, i32 %170
  store i16 %.sroa.0230.2.i, ptr addrspace(3) %171, align 2, !tbaa.struct !27
  %172 = add nuw nsw i64 %164, 1
  %exitcond506.not.i = icmp eq i64 %172, 64
  br i1 %exitcond506.not.i, label %.split490.us.i, label %.preheader482.split.i, !llvm.loop !35

.lr.ph493.i:                                      ; preds = %.split490.us.i, %.loopexit484.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %173 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %174 = icmp eq i64 %173, 0
  call void @llvm.assume(i1 %174)
  %175 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %176 = icmp eq i64 %175, 0
  call void @llvm.assume(i1 %176)
  %177 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %178 = icmp ult i64 %177, 256
  call void @llvm.assume(i1 %178)
  %179 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %180 = inttoptr i32 %179 to ptr addrspace(3)
  %181 = getelementptr inbounds i8, ptr addrspace(3) %180, i32 1536
  %182 = getelementptr inbounds i8, ptr addrspace(3) %180, i32 3584
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

._crit_edge494.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %183 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %184 = icmp eq i64 %183, 0
  call void @llvm.assume(i1 %184)
  %185 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %186 = icmp eq i64 %185, 0
  call void @llvm.assume(i1 %186)
  %187 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %188 = icmp ult i64 %187, 256
  call void @llvm.assume(i1 %188)
  %189 = icmp ult i64 %187, 128
  br i1 %189, label %.lr.ph496.i, label %._crit_edge497.i

.lr.ph496.i:                                      ; preds = %._crit_edge494.i
  %190 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %191 = inttoptr i32 %190 to ptr addrspace(3)
  %192 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 512
  %193 = getelementptr inbounds i8, ptr addrspace(3) %191, i32 3584
  %194 = and i64 %187, 15
  %195 = trunc i64 %187 to i32
  %196 = getelementptr inbounds float, ptr addrspace(3) %191, i32 %195
  %197 = load float, ptr addrspace(3) %196, align 4, !tbaa !23
  %198 = shl nuw nsw i64 %187, 2
  %199 = and i64 %198, 448
  br label %215

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph493.i
  %200 = phi i64 [ %177, %.lr.ph493.i ], [ %209, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %201 = lshr i64 %200, 4
  %202 = shl nuw nsw i64 %200, 6
  %203 = and i64 %202, 960
  %204 = or disjoint i64 %203, %201
  %205 = trunc i64 %204 to i32
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %181, i32 %205
  %.sroa.0294.0.copyload.i = load i16, ptr addrspace(3) %206, align 2, !tbaa.struct !27
  %207 = trunc i64 %200 to i32
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %182, i32 %207
  store i16 %.sroa.0294.0.copyload.i, ptr addrspace(3) %208, align 2, !tbaa.struct !27
  %209 = add nuw nsw i64 %200, 256
  %210 = icmp ult i64 %200, 768
  br i1 %210, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %._crit_edge494.i, !llvm.loop !36

._crit_edge497.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge494.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %211 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %212 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %213 = icmp ult i64 %212, 256
  call void @llvm.assume(i1 %213)
  %214 = icmp eq i64 %212, 0
  br i1 %214, label %268, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %266, ptr addrspace(3) %196, align 4, !tbaa !23
  br label %._crit_edge497.i

215:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph496.i
  %216 = phi i64 [ 0, %.lr.ph496.i ], [ %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %217 = phi float [ %197, %.lr.ph496.i ], [ %266, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %218 = add nuw nsw i64 %216, %199
  %219 = trunc i64 %218 to i32
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %192, i32 %219
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %220, align 2, !tbaa.struct !27
  %221 = shl nuw nsw i64 %216, 4
  %222 = or disjoint i64 %221, %194
  %223 = trunc i64 %222 to i32
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %193, i32 %223
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %224, align 2, !tbaa.struct !27
  %225 = zext i16 %.sroa.0185.0.copyload.i to i32
  %226 = lshr i32 %225, 10
  %227 = and i32 %226, 31
  %228 = and i32 %225, 1023
  switch i32 %227, label %234 [
    i32 31, label %229
    i32 0, label %236
  ]

229:                                              ; preds = %215
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %230 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not475.i = icmp eq i32 %228, 0
  %231 = select i1 %.not475.i, i32 2139095040, i32 2143289344
  %232 = or disjoint i32 %231, %230
  %233 = bitcast i32 %232 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

234:                                              ; preds = %215
  %235 = or disjoint i32 %228, 1024
  br label %236

236:                                              ; preds = %234, %215
  %237 = phi i32 [ %235, %234 ], [ %228, %215 ]
  %238 = uitofp i32 %237 to float
  %.not.i = icmp eq i32 %227, 0
  %239 = add nsw i32 %227, -25
  %240 = select i1 %.not.i, i32 -24, i32 %239
  %241 = call float @__ocml_ldexp_f32(float noundef %238, i32 noundef %240) #6
  %242 = fneg contract float %241
  %.not469470.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %243 = select contract i1 %.not469470.i, float %242, float %241
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %236, %229
  %244 = phi float [ %233, %229 ], [ %243, %236 ]
  %245 = zext i16 %.sroa.0176.0.copyload.i to i32
  %246 = lshr i32 %245, 10
  %247 = and i32 %246, 31
  %248 = and i32 %245, 1023
  switch i32 %247, label %254 [
    i32 31, label %249
    i32 0, label %256
  ]

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %250 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not474.i = icmp eq i32 %248, 0
  %251 = select i1 %.not474.i, i32 2139095040, i32 2143289344
  %252 = or disjoint i32 %251, %250
  %253 = bitcast i32 %252 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

254:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %255 = or disjoint i32 %248, 1024
  br label %256

256:                                              ; preds = %254, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %257 = phi i32 [ %255, %254 ], [ %248, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %258 = uitofp i32 %257 to float
  %.not471.i = icmp eq i32 %247, 0
  %259 = add nsw i32 %247, -25
  %260 = select i1 %.not471.i, i32 -24, i32 %259
  %261 = call float @__ocml_ldexp_f32(float noundef %258, i32 noundef %260) #6
  %262 = fneg contract float %261
  %.not472473.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %263 = select contract i1 %.not472473.i, float %262, float %261
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %256, %249
  %264 = phi float [ %253, %249 ], [ %263, %256 ]
  %265 = fmul contract float %244, %264
  %266 = fadd contract float %217, %265
  %267 = add nuw nsw i64 %216, 1
  %exitcond508.not.i = icmp eq i64 %267, 64
  br i1 %exitcond508.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, label %215, !llvm.loop !37

268:                                              ; preds = %._crit_edge497.i
  %269 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %270 = icmp eq i64 %269, 0
  call void @llvm.assume(i1 %270)
  %271 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %272 = icmp eq i64 %271, 0
  call void @llvm.assume(i1 %272)
  %273 = sext i32 %.fr512.i to i64
  %274 = call i32 @llvm.amdgcn.groupstaticsize()
  %275 = inttoptr i32 %274 to ptr addrspace(3)
  %276 = icmp slt i32 %4, 1
  %277 = icmp ugt i32 %4, 1
  %278 = icmp ugt i32 %4, 2
  %279 = icmp ugt i32 %4, 3
  %280 = icmp ugt i32 %4, 4
  %281 = icmp ugt i32 %4, 5
  %282 = icmp ugt i32 %4, 6
  %283 = icmp ugt i32 %4, 7
  %284 = icmp ugt i32 %4, 8
  %285 = icmp ugt i32 %4, 9
  %286 = icmp ugt i32 %4, 10
  %287 = icmp ugt i32 %4, 11
  %288 = icmp ugt i32 %4, 12
  %289 = icmp ugt i32 %4, 13
  %290 = icmp ugt i32 %4, 14
  %291 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split499.us.i, %268
  %292 = phi i64 [ 0, %268 ], [ %298, %.split499.us.i ]
  %293 = icmp sge i64 %292, %273
  %294 = shl i64 %292, 4
  %.tr468.i = trunc i64 %292 to i32
  %295 = shl i32 %.tr468.i, 4
  %296 = sext i32 %295 to i64
  %297 = add nsw i64 %211, %296
  %brmerge.i = select i1 %293, i1 true, i1 %276
  br i1 %brmerge.i, label %.split499.us.i, label %.preheader.split.1.i

.split499.us.i:                                   ; preds = %387, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %298 = add i64 %292, 1
  %exitcond510.not.i = icmp eq i64 %298, 8
  br i1 %exitcond510.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %299 = trunc i64 %294 to i32
  %300 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %299
  %301 = load float, ptr addrspace(3) %300, align 4, !tbaa !23
  %302 = getelementptr inbounds float, ptr %9, i64 %297
  store float %301, ptr %302, align 32, !tbaa !23
  br i1 %277, label %.preheader.split.2.i, label %.split499.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %303 = trunc i64 %294 to i32
  %304 = or disjoint i32 %303, 1
  %305 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %304
  %306 = load float, ptr addrspace(3) %305, align 4, !tbaa !23
  %307 = or disjoint i64 %297, 1
  %308 = getelementptr inbounds float, ptr %9, i64 %307
  store float %306, ptr %308, align 4, !tbaa !23
  br i1 %278, label %.preheader.split.3.i, label %.split499.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %309 = trunc i64 %294 to i32
  %310 = or disjoint i32 %309, 2
  %311 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !23
  %313 = or disjoint i64 %297, 2
  %314 = getelementptr inbounds float, ptr %9, i64 %313
  store float %312, ptr %314, align 8, !tbaa !23
  br i1 %279, label %.preheader.split.4.i, label %.split499.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %315 = trunc i64 %294 to i32
  %316 = or disjoint i32 %315, 3
  %317 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %316
  %318 = load float, ptr addrspace(3) %317, align 4, !tbaa !23
  %319 = or disjoint i64 %297, 3
  %320 = getelementptr inbounds float, ptr %9, i64 %319
  store float %318, ptr %320, align 4, !tbaa !23
  br i1 %280, label %.preheader.split.5.i, label %.split499.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %321 = trunc i64 %294 to i32
  %322 = or disjoint i32 %321, 4
  %323 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %322
  %324 = load float, ptr addrspace(3) %323, align 4, !tbaa !23
  %325 = or disjoint i64 %297, 4
  %326 = getelementptr inbounds float, ptr %9, i64 %325
  store float %324, ptr %326, align 16, !tbaa !23
  br i1 %281, label %.preheader.split.6.i, label %.split499.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %327 = trunc i64 %294 to i32
  %328 = or disjoint i32 %327, 5
  %329 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %328
  %330 = load float, ptr addrspace(3) %329, align 4, !tbaa !23
  %331 = or disjoint i64 %297, 5
  %332 = getelementptr inbounds float, ptr %9, i64 %331
  store float %330, ptr %332, align 4, !tbaa !23
  br i1 %282, label %.preheader.split.7.i, label %.split499.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %333 = trunc i64 %294 to i32
  %334 = or disjoint i32 %333, 6
  %335 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %334
  %336 = load float, ptr addrspace(3) %335, align 4, !tbaa !23
  %337 = or disjoint i64 %297, 6
  %338 = getelementptr inbounds float, ptr %9, i64 %337
  store float %336, ptr %338, align 8, !tbaa !23
  br i1 %283, label %.preheader.split.8.i, label %.split499.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %339 = trunc i64 %294 to i32
  %340 = or disjoint i32 %339, 7
  %341 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %340
  %342 = load float, ptr addrspace(3) %341, align 4, !tbaa !23
  %343 = or disjoint i64 %297, 7
  %344 = getelementptr inbounds float, ptr %9, i64 %343
  store float %342, ptr %344, align 4, !tbaa !23
  br i1 %284, label %.preheader.split.9.i, label %.split499.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %345 = trunc i64 %294 to i32
  %346 = or disjoint i32 %345, 8
  %347 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %346
  %348 = load float, ptr addrspace(3) %347, align 4, !tbaa !23
  %349 = or disjoint i64 %297, 8
  %350 = getelementptr inbounds float, ptr %9, i64 %349
  store float %348, ptr %350, align 32, !tbaa !23
  br i1 %285, label %.preheader.split.10.i, label %.split499.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %351 = trunc i64 %294 to i32
  %352 = or disjoint i32 %351, 9
  %353 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %352
  %354 = load float, ptr addrspace(3) %353, align 4, !tbaa !23
  %355 = or disjoint i64 %297, 9
  %356 = getelementptr inbounds float, ptr %9, i64 %355
  store float %354, ptr %356, align 4, !tbaa !23
  br i1 %286, label %.preheader.split.11.i, label %.split499.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %357 = trunc i64 %294 to i32
  %358 = or disjoint i32 %357, 10
  %359 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %358
  %360 = load float, ptr addrspace(3) %359, align 4, !tbaa !23
  %361 = or disjoint i64 %297, 10
  %362 = getelementptr inbounds float, ptr %9, i64 %361
  store float %360, ptr %362, align 8, !tbaa !23
  br i1 %287, label %.preheader.split.12.i, label %.split499.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %363 = trunc i64 %294 to i32
  %364 = or disjoint i32 %363, 11
  %365 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %364
  %366 = load float, ptr addrspace(3) %365, align 4, !tbaa !23
  %367 = or disjoint i64 %297, 11
  %368 = getelementptr inbounds float, ptr %9, i64 %367
  store float %366, ptr %368, align 4, !tbaa !23
  br i1 %288, label %.preheader.split.13.i, label %.split499.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %369 = trunc i64 %294 to i32
  %370 = or disjoint i32 %369, 12
  %371 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %370
  %372 = load float, ptr addrspace(3) %371, align 4, !tbaa !23
  %373 = or disjoint i64 %297, 12
  %374 = getelementptr inbounds float, ptr %9, i64 %373
  store float %372, ptr %374, align 16, !tbaa !23
  br i1 %289, label %.preheader.split.14.i, label %.split499.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %375 = trunc i64 %294 to i32
  %376 = or disjoint i32 %375, 13
  %377 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %376
  %378 = load float, ptr addrspace(3) %377, align 4, !tbaa !23
  %379 = or disjoint i64 %297, 13
  %380 = getelementptr inbounds float, ptr %9, i64 %379
  store float %378, ptr %380, align 4, !tbaa !23
  br i1 %290, label %.preheader.split.15.i, label %.split499.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %381 = trunc i64 %294 to i32
  %382 = or disjoint i32 %381, 14
  %383 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %382
  %384 = load float, ptr addrspace(3) %383, align 4, !tbaa !23
  %385 = or disjoint i64 %297, 14
  %386 = getelementptr inbounds float, ptr %9, i64 %385
  store float %384, ptr %386, align 8, !tbaa !23
  br i1 %291, label %387, label %.split499.us.i

387:                                              ; preds = %.preheader.split.15.i
  %388 = trunc i64 %294 to i32
  %389 = or disjoint i32 %388, 15
  %390 = getelementptr inbounds float, ptr addrspace(3) %275, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !23
  %392 = or disjoint i64 %297, 15
  %393 = getelementptr inbounds float, ptr %9, i64 %392
  store float %391, ptr %393, align 4, !tbaa !23
  br label %.split499.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge497.i, %.split499.us.i
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
!35 = distinct !{!35, !31, !32, !33}
!36 = distinct !{!36, !31, !32, !33}
!37 = distinct !{!37, !31}
!38 = distinct !{!38, !31}
;----------------- End AdaptiveCpp IR dump ---------------
