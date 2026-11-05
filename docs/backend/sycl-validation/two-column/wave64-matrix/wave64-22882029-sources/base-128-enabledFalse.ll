;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-ykdqso62/kernel.cpp"
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
  br i1 %42, label %.preheader483.i, label %.loopexit484.i

.preheader483.i:                                  ; preds = %6
  %43 = shl i32 %.tr.i, 9
  %44 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %45 = icmp eq i64 %44, 0
  call void @llvm.assume(i1 %45)
  %46 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = sext i32 %5 to i64
  %49 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %50 = inttoptr i32 %49 to ptr addrspace(3)
  %51 = getelementptr i8, ptr addrspace(3) %50, i32 512
  %52 = sext i32 %43 to i64
  %53 = icmp sgt i32 %.fr512.i, 0
  br i1 %53, label %.preheader483.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader483.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %51, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i
  %54 = icmp sgt i32 %.fr512.i, 1
  %55 = or disjoint i64 %52, 64
  br i1 %54, label %.preheader483.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %50, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader483.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i, %.split.us.i
  %56 = phi i64 [ %64, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i ], [ 0, %.split.us.i ]
  %57 = icmp slt i64 %56, %48
  br i1 %57, label %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i

58:                                               ; preds = %.preheader483.split.1.i
  %59 = add nuw nsw i64 %55, %56
  %60 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %59
  %.sroa.0239.0.copyload.1.i = load i16, ptr %60, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i: ; preds = %58, %.preheader483.split.1.i
  %.sroa.0241.2.1.i = phi i16 [ %.sroa.0239.0.copyload.1.i, %58 ], [ 0, %.preheader483.split.1.i ]
  %61 = trunc i64 %56 to i32
  %62 = add i32 %61, 64
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %62
  store i16 %.sroa.0241.2.1.i, ptr addrspace(3) %63, align 2, !tbaa.struct !23
  %64 = add nuw nsw i64 %56, 1
  %exitcond.1.not.i = icmp eq i64 %64, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader483.split.1.i, !llvm.loop !26

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.1.i
  %65 = icmp sgt i32 %.fr512.i, 2
  %66 = or disjoint i64 %52, 128
  br i1 %65, label %.preheader483.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %50, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader483.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i, %.split.us.1.i
  %67 = phi i64 [ %75, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i ], [ 0, %.split.us.1.i ]
  %68 = icmp slt i64 %67, %48
  br i1 %68, label %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i

69:                                               ; preds = %.preheader483.split.2.i
  %70 = add nuw nsw i64 %66, %67
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0239.0.copyload.2.i = load i16, ptr %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i: ; preds = %69, %.preheader483.split.2.i
  %.sroa.0241.2.2.i = phi i16 [ %.sroa.0239.0.copyload.2.i, %69 ], [ 0, %.preheader483.split.2.i ]
  %72 = trunc i64 %67 to i32
  %73 = add i32 %72, 128
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %73
  store i16 %.sroa.0241.2.2.i, ptr addrspace(3) %74, align 2, !tbaa.struct !23
  %75 = add nuw nsw i64 %67, 1
  %exitcond.2.not.i = icmp eq i64 %75, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader483.split.2.i, !llvm.loop !26

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.2.i
  %76 = icmp sgt i32 %.fr512.i, 3
  %77 = or disjoint i64 %52, 192
  br i1 %76, label %.preheader483.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %50, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader483.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i, %.split.us.2.i
  %78 = phi i64 [ %86, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i ], [ 0, %.split.us.2.i ]
  %79 = icmp slt i64 %78, %48
  br i1 %79, label %80, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i

80:                                               ; preds = %.preheader483.split.3.i
  %81 = add nuw nsw i64 %77, %78
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %81
  %.sroa.0239.0.copyload.3.i = load i16, ptr %82, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i: ; preds = %80, %.preheader483.split.3.i
  %.sroa.0241.2.3.i = phi i16 [ %.sroa.0239.0.copyload.3.i, %80 ], [ 0, %.preheader483.split.3.i ]
  %83 = trunc i64 %78 to i32
  %84 = add i32 %83, 192
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %84
  store i16 %.sroa.0241.2.3.i, ptr addrspace(3) %85, align 2, !tbaa.struct !23
  %86 = add nuw nsw i64 %78, 1
  %exitcond.3.not.i = icmp eq i64 %86, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader483.split.3.i, !llvm.loop !26

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.3.i
  %87 = icmp sgt i32 %.fr512.i, 4
  %88 = or disjoint i64 %52, 256
  br i1 %87, label %.preheader483.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %50, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader483.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i, %.split.us.3.i
  %89 = phi i64 [ %97, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i ], [ 0, %.split.us.3.i ]
  %90 = icmp slt i64 %89, %48
  br i1 %90, label %91, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i

91:                                               ; preds = %.preheader483.split.4.i
  %92 = add nuw nsw i64 %88, %89
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %92
  %.sroa.0239.0.copyload.4.i = load i16, ptr %93, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i: ; preds = %91, %.preheader483.split.4.i
  %.sroa.0241.2.4.i = phi i16 [ %.sroa.0239.0.copyload.4.i, %91 ], [ 0, %.preheader483.split.4.i ]
  %94 = trunc i64 %89 to i32
  %95 = add i32 %94, 256
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %95
  store i16 %.sroa.0241.2.4.i, ptr addrspace(3) %96, align 2, !tbaa.struct !23
  %97 = add nuw nsw i64 %89, 1
  %exitcond.4.not.i = icmp eq i64 %97, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader483.split.4.i, !llvm.loop !26

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.4.i
  %98 = icmp sgt i32 %.fr512.i, 5
  %99 = or disjoint i64 %52, 320
  br i1 %98, label %.preheader483.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %50, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader483.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i, %.split.us.4.i
  %100 = phi i64 [ %108, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i ], [ 0, %.split.us.4.i ]
  %101 = icmp slt i64 %100, %48
  br i1 %101, label %102, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i

102:                                              ; preds = %.preheader483.split.5.i
  %103 = add nuw nsw i64 %99, %100
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0239.0.copyload.5.i = load i16, ptr %104, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i: ; preds = %102, %.preheader483.split.5.i
  %.sroa.0241.2.5.i = phi i16 [ %.sroa.0239.0.copyload.5.i, %102 ], [ 0, %.preheader483.split.5.i ]
  %105 = trunc i64 %100 to i32
  %106 = add i32 %105, 320
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %106
  store i16 %.sroa.0241.2.5.i, ptr addrspace(3) %107, align 2, !tbaa.struct !23
  %108 = add nuw nsw i64 %100, 1
  %exitcond.5.not.i = icmp eq i64 %108, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader483.split.5.i, !llvm.loop !26

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.5.i
  %109 = icmp sgt i32 %.fr512.i, 6
  %110 = or disjoint i64 %52, 384
  br i1 %109, label %.preheader483.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %50, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i

.preheader483.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i, %.split.us.5.i
  %111 = phi i64 [ %119, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i ], [ 0, %.split.us.5.i ]
  %112 = icmp slt i64 %111, %48
  br i1 %112, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i

113:                                              ; preds = %.preheader483.split.6.i
  %114 = add nuw nsw i64 %110, %111
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0239.0.copyload.6.i = load i16, ptr %115, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i: ; preds = %113, %.preheader483.split.6.i
  %.sroa.0241.2.6.i = phi i16 [ %.sroa.0239.0.copyload.6.i, %113 ], [ 0, %.preheader483.split.6.i ]
  %116 = trunc i64 %111 to i32
  %117 = add i32 %116, 384
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %117
  store i16 %.sroa.0241.2.6.i, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  %119 = add nuw nsw i64 %111, 1
  %exitcond.6.not.i = icmp eq i64 %119, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader483.split.6.i, !llvm.loop !26

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.6.i
  %120 = icmp sgt i32 %.fr512.i, 7
  %121 = or disjoint i64 %52, 448
  br i1 %120, label %.preheader483.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %50, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit484.i

.preheader483.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i, %.split.us.6.i
  %122 = phi i64 [ %130, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i ], [ 0, %.split.us.6.i ]
  %123 = icmp slt i64 %122, %48
  br i1 %123, label %124, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

124:                                              ; preds = %.preheader483.split.7.i
  %125 = add nuw nsw i64 %121, %122
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0239.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i: ; preds = %124, %.preheader483.split.7.i
  %.sroa.0241.2.7.i = phi i16 [ %.sroa.0239.0.copyload.7.i, %124 ], [ 0, %.preheader483.split.7.i ]
  %127 = trunc i64 %122 to i32
  %128 = add i32 %127, 448
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %128
  store i16 %.sroa.0241.2.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  %130 = add nuw nsw i64 %122, 1
  %exitcond.7.not.i = icmp eq i64 %130, 64
  br i1 %exitcond.7.not.i, label %.loopexit484.i, label %.preheader483.split.7.i, !llvm.loop !26

.preheader483.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i, %.preheader483.i
  %131 = phi i64 [ %138, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i ], [ 0, %.preheader483.i ]
  %132 = icmp slt i64 %131, %48
  br i1 %132, label %133, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i

133:                                              ; preds = %.preheader483.split.i
  %134 = add nuw nsw i64 %131, %52
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %134
  %.sroa.0239.0.copyload.i = load i16, ptr %135, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.i: ; preds = %133, %.preheader483.split.i
  %.sroa.0241.2.i = phi i16 [ %.sroa.0239.0.copyload.i, %133 ], [ 0, %.preheader483.split.i ]
  %136 = trunc i64 %131 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %136
  store i16 %.sroa.0241.2.i, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  %138 = add nuw nsw i64 %131, 1
  %exitcond.not.i = icmp eq i64 %138, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader483.split.i, !llvm.loop !26

.loopexit484.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit12.i.i.us.preheader.7.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %139 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %140 = icmp ult i64 %139, 128
  call void @llvm.assume(i1 %140)
  %141 = icmp eq i64 %139, 0
  br i1 %141, label %142, label %.lr.ph493.i

142:                                              ; preds = %.loopexit484.i
  %143 = shl i32 %.tr.i, 10
  %144 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %145 = icmp eq i64 %144, 0
  call void @llvm.assume(i1 %145)
  %146 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %147 = icmp eq i64 %146, 0
  call void @llvm.assume(i1 %147)
  %148 = sext i32 %4 to i64
  %149 = sext i32 %5 to i64
  %150 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %151 = inttoptr i32 %150 to ptr addrspace(3)
  %152 = getelementptr inbounds i8, ptr addrspace(3) %151, i32 1536
  %153 = sext i32 %143 to i64
  br label %.preheader482.i

.preheader482.i:                                  ; preds = %.split490.us.i, %142
  %154 = phi i64 [ 0, %142 ], [ %162, %.split490.us.i ]
  %155 = icmp slt i64 %154, %148
  %156 = shl i64 %154, 6
  %.tr476.i = trunc i64 %154 to i32
  %157 = shl i32 %.tr476.i, 6
  %158 = sext i32 %157 to i64
  %159 = add nsw i64 %158, %153
  %.fr491.i = freeze i1 %155
  br i1 %.fr491.i, label %.preheader482.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader482.i
  %.tr511.i = trunc i64 %154 to i32
  %160 = shl i32 %.tr511.i, 7
  %161 = add i32 %160, 1536
  %scevgep505.i = getelementptr i8, ptr addrspace(3) %151, i32 %161
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep505.i, i8 0, i32 128, i1 false)
  br label %.split490.us.i

.split490.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %162 = add nuw nsw i64 %154, 1
  %exitcond507.not.i = icmp eq i64 %162, 16
  br i1 %exitcond507.not.i, label %.lr.ph493.i, label %.preheader482.i, !llvm.loop !30

.preheader482.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader482.i
  %163 = phi i64 [ %171, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader482.i ]
  %164 = icmp slt i64 %163, %149
  br i1 %164, label %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

165:                                              ; preds = %.preheader482.split.i
  %166 = add nuw nsw i64 %159, %163
  %167 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %166
  %.sroa.0228.0.copyload.i = load i16, ptr %167, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %165, %.preheader482.split.i
  %.sroa.0230.2.i = phi i16 [ %.sroa.0228.0.copyload.i, %165 ], [ 0, %.preheader482.split.i ]
  %168 = add nuw nsw i64 %163, %156
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %152, i32 %169
  store i16 %.sroa.0230.2.i, ptr addrspace(3) %170, align 2, !tbaa.struct !23
  %171 = add nuw nsw i64 %163, 1
  %exitcond506.not.i = icmp eq i64 %171, 64
  br i1 %exitcond506.not.i, label %.split490.us.i, label %.preheader482.split.i, !llvm.loop !31

.lr.ph493.i:                                      ; preds = %.split490.us.i, %.loopexit484.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %172 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %173 = icmp eq i64 %172, 0
  call void @llvm.assume(i1 %173)
  %174 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %175 = icmp eq i64 %174, 0
  call void @llvm.assume(i1 %175)
  %176 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %177 = icmp ult i64 %176, 128
  call void @llvm.assume(i1 %177)
  %178 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %179 = inttoptr i32 %178 to ptr addrspace(3)
  %180 = getelementptr inbounds i8, ptr addrspace(3) %179, i32 1536
  %181 = getelementptr inbounds i8, ptr addrspace(3) %179, i32 3584
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

.lr.ph496.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %182 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %183 = icmp eq i64 %182, 0
  call void @llvm.assume(i1 %183)
  %184 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %185 = icmp eq i64 %184, 0
  call void @llvm.assume(i1 %185)
  %186 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %187 = icmp ult i64 %186, 128
  call void @llvm.assume(i1 %187)
  %188 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %189 = inttoptr i32 %188 to ptr addrspace(3)
  %190 = getelementptr inbounds i8, ptr addrspace(3) %189, i32 512
  %191 = getelementptr inbounds i8, ptr addrspace(3) %189, i32 3584
  %192 = and i64 %186, 15
  %193 = trunc i64 %186 to i32
  %194 = getelementptr inbounds float, ptr addrspace(3) %189, i32 %193
  %195 = load float, ptr addrspace(3) %194, align 4, !tbaa !19
  %196 = shl nuw nsw i64 %186, 2
  %197 = and i64 %196, 448
  br label %213

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph493.i
  %198 = phi i64 [ %176, %.lr.ph493.i ], [ %207, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %199 = lshr i64 %198, 4
  %200 = shl nuw nsw i64 %198, 6
  %201 = and i64 %200, 960
  %202 = or disjoint i64 %201, %199
  %203 = trunc i64 %202 to i32
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %180, i32 %203
  %.sroa.0294.0.copyload.i = load i16, ptr addrspace(3) %204, align 2, !tbaa.struct !23
  %205 = trunc i64 %198 to i32
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %181, i32 %205
  store i16 %.sroa.0294.0.copyload.i, ptr addrspace(3) %206, align 2, !tbaa.struct !23
  %207 = add nuw nsw i64 %198, 128
  %208 = icmp ult i64 %198, 896
  br i1 %208, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph496.i, !llvm.loop !32

._crit_edge497.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %264, ptr addrspace(3) %194, align 4, !tbaa !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %209 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %210 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %211 = icmp ult i64 %210, 128
  call void @llvm.assume(i1 %211)
  %212 = icmp eq i64 %210, 0
  br i1 %212, label %266, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

213:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph496.i
  %214 = phi i64 [ 0, %.lr.ph496.i ], [ %265, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %215 = phi float [ %195, %.lr.ph496.i ], [ %264, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %216 = add nuw nsw i64 %214, %197
  %217 = trunc i64 %216 to i32
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %190, i32 %217
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %218, align 2, !tbaa.struct !23
  %219 = shl nuw nsw i64 %214, 4
  %220 = or disjoint i64 %219, %192
  %221 = trunc i64 %220 to i32
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %191, i32 %221
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %222, align 2, !tbaa.struct !23
  %223 = zext i16 %.sroa.0185.0.copyload.i to i32
  %224 = lshr i32 %223, 10
  %225 = and i32 %224, 31
  %226 = and i32 %223, 1023
  switch i32 %225, label %232 [
    i32 31, label %227
    i32 0, label %234
  ]

227:                                              ; preds = %213
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %228 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not475.i = icmp eq i32 %226, 0
  %229 = select i1 %.not475.i, i32 2139095040, i32 2143289344
  %230 = or disjoint i32 %229, %228
  %231 = bitcast i32 %230 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

232:                                              ; preds = %213
  %233 = or disjoint i32 %226, 1024
  br label %234

234:                                              ; preds = %232, %213
  %235 = phi i32 [ %233, %232 ], [ %226, %213 ]
  %236 = uitofp i32 %235 to float
  %.not.i = icmp eq i32 %225, 0
  %237 = add nsw i32 %225, -25
  %238 = select i1 %.not.i, i32 -24, i32 %237
  %239 = call float @__ocml_ldexp_f32(float noundef %236, i32 noundef %238) #6
  %240 = fneg contract float %239
  %.not469470.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %241 = select contract i1 %.not469470.i, float %240, float %239
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %234, %227
  %242 = phi float [ %231, %227 ], [ %241, %234 ]
  %243 = zext i16 %.sroa.0176.0.copyload.i to i32
  %244 = lshr i32 %243, 10
  %245 = and i32 %244, 31
  %246 = and i32 %243, 1023
  switch i32 %245, label %252 [
    i32 31, label %247
    i32 0, label %254
  ]

247:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %248 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not474.i = icmp eq i32 %246, 0
  %249 = select i1 %.not474.i, i32 2139095040, i32 2143289344
  %250 = or disjoint i32 %249, %248
  %251 = bitcast i32 %250 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

252:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %253 = or disjoint i32 %246, 1024
  br label %254

254:                                              ; preds = %252, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %255 = phi i32 [ %253, %252 ], [ %246, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %256 = uitofp i32 %255 to float
  %.not471.i = icmp eq i32 %245, 0
  %257 = add nsw i32 %245, -25
  %258 = select i1 %.not471.i, i32 -24, i32 %257
  %259 = call float @__ocml_ldexp_f32(float noundef %256, i32 noundef %258) #6
  %260 = fneg contract float %259
  %.not472473.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %261 = select contract i1 %.not472473.i, float %260, float %259
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %254, %247
  %262 = phi float [ %251, %247 ], [ %261, %254 ]
  %263 = fmul contract float %242, %262
  %264 = fadd contract float %215, %263
  %265 = add nuw nsw i64 %214, 1
  %exitcond508.not.i = icmp eq i64 %265, 64
  br i1 %exitcond508.not.i, label %._crit_edge497.i, label %213, !llvm.loop !33

266:                                              ; preds = %._crit_edge497.i
  %267 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %268 = icmp eq i64 %267, 0
  call void @llvm.assume(i1 %268)
  %269 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %270 = icmp eq i64 %269, 0
  call void @llvm.assume(i1 %270)
  %271 = sext i32 %.fr512.i to i64
  %272 = call i32 @llvm.amdgcn.groupstaticsize()
  %273 = inttoptr i32 %272 to ptr addrspace(3)
  %274 = icmp slt i32 %4, 1
  %275 = icmp ugt i32 %4, 1
  %276 = icmp ugt i32 %4, 2
  %277 = icmp ugt i32 %4, 3
  %278 = icmp ugt i32 %4, 4
  %279 = icmp ugt i32 %4, 5
  %280 = icmp ugt i32 %4, 6
  %281 = icmp ugt i32 %4, 7
  %282 = icmp ugt i32 %4, 8
  %283 = icmp ugt i32 %4, 9
  %284 = icmp ugt i32 %4, 10
  %285 = icmp ugt i32 %4, 11
  %286 = icmp ugt i32 %4, 12
  %287 = icmp ugt i32 %4, 13
  %288 = icmp ugt i32 %4, 14
  %289 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split499.us.i, %266
  %290 = phi i64 [ 0, %266 ], [ %296, %.split499.us.i ]
  %291 = icmp sge i64 %290, %271
  %292 = shl i64 %290, 4
  %.tr468.i = trunc i64 %290 to i32
  %293 = shl i32 %.tr468.i, 4
  %294 = sext i32 %293 to i64
  %295 = add nsw i64 %209, %294
  %brmerge.i = select i1 %291, i1 true, i1 %274
  br i1 %brmerge.i, label %.split499.us.i, label %.preheader.split.1.i

.split499.us.i:                                   ; preds = %385, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %296 = add i64 %290, 1
  %exitcond510.not.i = icmp eq i64 %296, 8
  br i1 %exitcond510.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %297 = trunc i64 %292 to i32
  %298 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %297
  %299 = load float, ptr addrspace(3) %298, align 4, !tbaa !19
  %300 = getelementptr inbounds float, ptr %9, i64 %295
  store float %299, ptr %300, align 32, !tbaa !19
  br i1 %275, label %.preheader.split.2.i, label %.split499.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %301 = trunc i64 %292 to i32
  %302 = or disjoint i32 %301, 1
  %303 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %302
  %304 = load float, ptr addrspace(3) %303, align 4, !tbaa !19
  %305 = or disjoint i64 %295, 1
  %306 = getelementptr inbounds float, ptr %9, i64 %305
  store float %304, ptr %306, align 4, !tbaa !19
  br i1 %276, label %.preheader.split.3.i, label %.split499.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %307 = trunc i64 %292 to i32
  %308 = or disjoint i32 %307, 2
  %309 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %308
  %310 = load float, ptr addrspace(3) %309, align 4, !tbaa !19
  %311 = or disjoint i64 %295, 2
  %312 = getelementptr inbounds float, ptr %9, i64 %311
  store float %310, ptr %312, align 8, !tbaa !19
  br i1 %277, label %.preheader.split.4.i, label %.split499.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %313 = trunc i64 %292 to i32
  %314 = or disjoint i32 %313, 3
  %315 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %314
  %316 = load float, ptr addrspace(3) %315, align 4, !tbaa !19
  %317 = or disjoint i64 %295, 3
  %318 = getelementptr inbounds float, ptr %9, i64 %317
  store float %316, ptr %318, align 4, !tbaa !19
  br i1 %278, label %.preheader.split.5.i, label %.split499.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %319 = trunc i64 %292 to i32
  %320 = or disjoint i32 %319, 4
  %321 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %320
  %322 = load float, ptr addrspace(3) %321, align 4, !tbaa !19
  %323 = or disjoint i64 %295, 4
  %324 = getelementptr inbounds float, ptr %9, i64 %323
  store float %322, ptr %324, align 16, !tbaa !19
  br i1 %279, label %.preheader.split.6.i, label %.split499.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %325 = trunc i64 %292 to i32
  %326 = or disjoint i32 %325, 5
  %327 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %326
  %328 = load float, ptr addrspace(3) %327, align 4, !tbaa !19
  %329 = or disjoint i64 %295, 5
  %330 = getelementptr inbounds float, ptr %9, i64 %329
  store float %328, ptr %330, align 4, !tbaa !19
  br i1 %280, label %.preheader.split.7.i, label %.split499.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %331 = trunc i64 %292 to i32
  %332 = or disjoint i32 %331, 6
  %333 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %332
  %334 = load float, ptr addrspace(3) %333, align 4, !tbaa !19
  %335 = or disjoint i64 %295, 6
  %336 = getelementptr inbounds float, ptr %9, i64 %335
  store float %334, ptr %336, align 8, !tbaa !19
  br i1 %281, label %.preheader.split.8.i, label %.split499.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %337 = trunc i64 %292 to i32
  %338 = or disjoint i32 %337, 7
  %339 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %338
  %340 = load float, ptr addrspace(3) %339, align 4, !tbaa !19
  %341 = or disjoint i64 %295, 7
  %342 = getelementptr inbounds float, ptr %9, i64 %341
  store float %340, ptr %342, align 4, !tbaa !19
  br i1 %282, label %.preheader.split.9.i, label %.split499.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %343 = trunc i64 %292 to i32
  %344 = or disjoint i32 %343, 8
  %345 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %344
  %346 = load float, ptr addrspace(3) %345, align 4, !tbaa !19
  %347 = or disjoint i64 %295, 8
  %348 = getelementptr inbounds float, ptr %9, i64 %347
  store float %346, ptr %348, align 32, !tbaa !19
  br i1 %283, label %.preheader.split.10.i, label %.split499.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %349 = trunc i64 %292 to i32
  %350 = or disjoint i32 %349, 9
  %351 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %350
  %352 = load float, ptr addrspace(3) %351, align 4, !tbaa !19
  %353 = or disjoint i64 %295, 9
  %354 = getelementptr inbounds float, ptr %9, i64 %353
  store float %352, ptr %354, align 4, !tbaa !19
  br i1 %284, label %.preheader.split.11.i, label %.split499.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %355 = trunc i64 %292 to i32
  %356 = or disjoint i32 %355, 10
  %357 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %356
  %358 = load float, ptr addrspace(3) %357, align 4, !tbaa !19
  %359 = or disjoint i64 %295, 10
  %360 = getelementptr inbounds float, ptr %9, i64 %359
  store float %358, ptr %360, align 8, !tbaa !19
  br i1 %285, label %.preheader.split.12.i, label %.split499.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %361 = trunc i64 %292 to i32
  %362 = or disjoint i32 %361, 11
  %363 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %362
  %364 = load float, ptr addrspace(3) %363, align 4, !tbaa !19
  %365 = or disjoint i64 %295, 11
  %366 = getelementptr inbounds float, ptr %9, i64 %365
  store float %364, ptr %366, align 4, !tbaa !19
  br i1 %286, label %.preheader.split.13.i, label %.split499.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %367 = trunc i64 %292 to i32
  %368 = or disjoint i32 %367, 12
  %369 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %368
  %370 = load float, ptr addrspace(3) %369, align 4, !tbaa !19
  %371 = or disjoint i64 %295, 12
  %372 = getelementptr inbounds float, ptr %9, i64 %371
  store float %370, ptr %372, align 16, !tbaa !19
  br i1 %287, label %.preheader.split.14.i, label %.split499.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %373 = trunc i64 %292 to i32
  %374 = or disjoint i32 %373, 13
  %375 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %374
  %376 = load float, ptr addrspace(3) %375, align 4, !tbaa !19
  %377 = or disjoint i64 %295, 13
  %378 = getelementptr inbounds float, ptr %9, i64 %377
  store float %376, ptr %378, align 4, !tbaa !19
  br i1 %288, label %.preheader.split.15.i, label %.split499.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %379 = trunc i64 %292 to i32
  %380 = or disjoint i32 %379, 14
  %381 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %380
  %382 = load float, ptr addrspace(3) %381, align 4, !tbaa !19
  %383 = or disjoint i64 %295, 14
  %384 = getelementptr inbounds float, ptr %9, i64 %383
  store float %382, ptr %384, align 8, !tbaa !19
  br i1 %289, label %385, label %.split499.us.i

385:                                              ; preds = %.preheader.split.15.i
  %386 = trunc i64 %292 to i32
  %387 = or disjoint i32 %386, 15
  %388 = getelementptr inbounds float, ptr addrspace(3) %273, i32 %387
  %389 = load float, ptr addrspace(3) %388, align 4, !tbaa !19
  %390 = or disjoint i64 %295, 15
  %391 = getelementptr inbounds float, ptr %9, i64 %390
  store float %389, ptr %391, align 4, !tbaa !19
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
!33 = distinct !{!33, !27}
!34 = distinct !{!34, !27}
;----------------- End AdaptiveCpp IR dump ---------------
