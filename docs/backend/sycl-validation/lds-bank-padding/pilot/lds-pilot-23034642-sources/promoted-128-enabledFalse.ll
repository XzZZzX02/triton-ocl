;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-ijeok44m/kernel.cpp"
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
  %.fr433.i = freeze i32 %3
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
  br i1 %42, label %.preheader407.i, label %.loopexit408.i

.preheader407.i:                                  ; preds = %6
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
  %53 = icmp sgt i32 %.fr433.i, 0
  br i1 %53, label %.preheader407.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader407.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %51, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %54 = icmp sgt i32 %.fr433.i, 1
  %55 = or disjoint i64 %52, 64
  br i1 %54, label %.preheader407.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %50, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader407.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %56 = phi i64 [ %64, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %57 = icmp slt i64 %56, %48
  br i1 %57, label %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

58:                                               ; preds = %.preheader407.split.1.i
  %59 = add nuw nsw i64 %55, %56
  %60 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %59
  %.sroa.0207.0.copyload.1.i = load i16, ptr %60, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %58, %.preheader407.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %58 ], [ 0, %.preheader407.split.1.i ]
  %61 = trunc i64 %56 to i32
  %62 = add i32 %61, 64
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %62
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %63, align 2, !tbaa.struct !23
  %64 = add nuw nsw i64 %56, 1
  %exitcond.1.not.i = icmp eq i64 %64, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader407.split.1.i, !llvm.loop !26

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %65 = icmp sgt i32 %.fr433.i, 2
  %66 = or disjoint i64 %52, 128
  br i1 %65, label %.preheader407.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %50, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader407.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %67 = phi i64 [ %75, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %68 = icmp slt i64 %67, %48
  br i1 %68, label %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

69:                                               ; preds = %.preheader407.split.2.i
  %70 = add nuw nsw i64 %66, %67
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0207.0.copyload.2.i = load i16, ptr %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %69, %.preheader407.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %69 ], [ 0, %.preheader407.split.2.i ]
  %72 = trunc i64 %67 to i32
  %73 = add i32 %72, 128
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %73
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %74, align 2, !tbaa.struct !23
  %75 = add nuw nsw i64 %67, 1
  %exitcond.2.not.i = icmp eq i64 %75, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader407.split.2.i, !llvm.loop !26

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %76 = icmp sgt i32 %.fr433.i, 3
  %77 = or disjoint i64 %52, 192
  br i1 %76, label %.preheader407.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %50, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader407.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %78 = phi i64 [ %86, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %79 = icmp slt i64 %78, %48
  br i1 %79, label %80, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

80:                                               ; preds = %.preheader407.split.3.i
  %81 = add nuw nsw i64 %77, %78
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %81
  %.sroa.0207.0.copyload.3.i = load i16, ptr %82, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %80, %.preheader407.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %80 ], [ 0, %.preheader407.split.3.i ]
  %83 = trunc i64 %78 to i32
  %84 = add i32 %83, 192
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %84
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %85, align 2, !tbaa.struct !23
  %86 = add nuw nsw i64 %78, 1
  %exitcond.3.not.i = icmp eq i64 %86, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader407.split.3.i, !llvm.loop !26

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %87 = icmp sgt i32 %.fr433.i, 4
  %88 = or disjoint i64 %52, 256
  br i1 %87, label %.preheader407.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %50, i32 1024
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader407.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %89 = phi i64 [ %97, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %90 = icmp slt i64 %89, %48
  br i1 %90, label %91, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

91:                                               ; preds = %.preheader407.split.4.i
  %92 = add nuw nsw i64 %88, %89
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %92
  %.sroa.0207.0.copyload.4.i = load i16, ptr %93, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %91, %.preheader407.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %91 ], [ 0, %.preheader407.split.4.i ]
  %94 = trunc i64 %89 to i32
  %95 = add i32 %94, 256
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %95
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %96, align 2, !tbaa.struct !23
  %97 = add nuw nsw i64 %89, 1
  %exitcond.4.not.i = icmp eq i64 %97, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader407.split.4.i, !llvm.loop !26

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %98 = icmp sgt i32 %.fr433.i, 5
  %99 = or disjoint i64 %52, 320
  br i1 %98, label %.preheader407.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %50, i32 1152
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader407.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %100 = phi i64 [ %108, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %101 = icmp slt i64 %100, %48
  br i1 %101, label %102, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

102:                                              ; preds = %.preheader407.split.5.i
  %103 = add nuw nsw i64 %99, %100
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0207.0.copyload.5.i = load i16, ptr %104, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %102, %.preheader407.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %102 ], [ 0, %.preheader407.split.5.i ]
  %105 = trunc i64 %100 to i32
  %106 = add i32 %105, 320
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %106
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %107, align 2, !tbaa.struct !23
  %108 = add nuw nsw i64 %100, 1
  %exitcond.5.not.i = icmp eq i64 %108, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader407.split.5.i, !llvm.loop !26

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %109 = icmp sgt i32 %.fr433.i, 6
  %110 = or disjoint i64 %52, 384
  br i1 %109, label %.preheader407.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %50, i32 1280
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader407.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %111 = phi i64 [ %119, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %112 = icmp slt i64 %111, %48
  br i1 %112, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

113:                                              ; preds = %.preheader407.split.6.i
  %114 = add nuw nsw i64 %110, %111
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0207.0.copyload.6.i = load i16, ptr %115, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %113, %.preheader407.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %113 ], [ 0, %.preheader407.split.6.i ]
  %116 = trunc i64 %111 to i32
  %117 = add i32 %116, 384
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %117
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  %119 = add nuw nsw i64 %111, 1
  %exitcond.6.not.i = icmp eq i64 %119, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader407.split.6.i, !llvm.loop !26

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %120 = icmp sgt i32 %.fr433.i, 7
  %121 = or disjoint i64 %52, 448
  br i1 %120, label %.preheader407.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %50, i32 1408
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit408.i

.preheader407.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %122 = phi i64 [ %130, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %123 = icmp slt i64 %122, %48
  br i1 %123, label %124, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

124:                                              ; preds = %.preheader407.split.7.i
  %125 = add nuw nsw i64 %121, %122
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0207.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %124, %.preheader407.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %124 ], [ 0, %.preheader407.split.7.i ]
  %127 = trunc i64 %122 to i32
  %128 = add i32 %127, 448
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %128
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  %130 = add nuw nsw i64 %122, 1
  %exitcond.7.not.i = icmp eq i64 %130, 64
  br i1 %exitcond.7.not.i, label %.loopexit408.i, label %.preheader407.split.7.i, !llvm.loop !26

.preheader407.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %.preheader407.i
  %131 = phi i64 [ %138, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i ], [ 0, %.preheader407.i ]
  %132 = icmp slt i64 %131, %48
  br i1 %132, label %133, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

133:                                              ; preds = %.preheader407.split.i
  %134 = add nuw nsw i64 %131, %52
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %134
  %.sroa.0207.0.copyload.i = load i16, ptr %135, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %133, %.preheader407.split.i
  %.sroa.0209.2.i = phi i16 [ %.sroa.0207.0.copyload.i, %133 ], [ 0, %.preheader407.split.i ]
  %136 = trunc i64 %131 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %136
  store i16 %.sroa.0209.2.i, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  %138 = add nuw nsw i64 %131, 1
  %exitcond.not.i = icmp eq i64 %138, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader407.split.i, !llvm.loop !26

.loopexit408.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %6
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
  br i1 %141, label %142, label %.lr.ph417.i

142:                                              ; preds = %.loopexit408.i
  %143 = shl i32 %.tr.i, 10
  %144 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %145 = icmp eq i64 %144, 0
  call void @llvm.assume(i1 %145)
  %146 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %147 = icmp eq i64 %146, 0
  call void @llvm.assume(i1 %147)
  %148 = sext i32 %5 to i64
  %149 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %150 = inttoptr i32 %149 to ptr addrspace(3)
  %151 = getelementptr inbounds i8, ptr addrspace(3) %150, i32 1536
  %152 = sext i32 %143 to i64
  %153 = icmp sgt i32 %4, 0
  %154 = icmp ugt i32 %4, 1
  %155 = icmp ugt i32 %4, 2
  %156 = icmp ugt i32 %4, 3
  %157 = icmp ugt i32 %4, 4
  %158 = icmp ugt i32 %4, 5
  %159 = icmp ugt i32 %4, 6
  %160 = icmp ugt i32 %4, 7
  %161 = icmp ugt i32 %4, 8
  %162 = icmp ugt i32 %4, 9
  %163 = icmp ugt i32 %4, 10
  %164 = icmp ugt i32 %4, 11
  %165 = icmp ugt i32 %4, 12
  %166 = icmp ugt i32 %4, 13
  %167 = icmp ugt i32 %4, 14
  %168 = icmp ugt i32 %4, 15
  br label %.preheader406.i

.preheader406.i:                                  ; preds = %.split414.us.i, %142
  %169 = phi i64 [ 0, %142 ], [ %179, %.split414.us.i ]
  %170 = icmp slt i64 %169, %148
  %171 = shl i64 %169, 4
  %.tr400.i = trunc i64 %169 to i32
  %172 = shl i32 %.tr400.i, 4
  %173 = sext i32 %172 to i64
  %174 = add nsw i64 %173, %152
  %.fr415.i = freeze i1 %170
  br i1 %.fr415.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr432.i = trunc i64 %169 to i32
  %175 = shl i32 %.tr432.i, 5
  %176 = add i32 %175, 1536
  %scevgep426.i = getelementptr i8, ptr addrspace(3) %150, i32 %176
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep426.i, i8 0, i32 32, i1 false)
  br label %.split414.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %153, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %177 = trunc i64 %171 to i32
  %178 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %177
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split414.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %179 = add nuw nsw i64 %169, 1
  %exitcond428.not.i = icmp eq i64 %179, 64
  br i1 %exitcond428.not.i, label %.lr.ph417.i, label %.preheader406.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader406.split.preheader.i
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %174
  %.sroa.0196.0.copyload.i = load i16, ptr %180, align 32, !tbaa.struct !23
  %181 = trunc i64 %171 to i32
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %181
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %182, align 2, !tbaa.struct !23
  br i1 %154, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i
  %183 = trunc i64 %171 to i32
  %184 = or disjoint i32 %183, 1
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %184
  store i16 0, ptr addrspace(3) %185, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  %186 = or disjoint i64 %174, 1
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %186
  %.sroa.0196.0.copyload.1.i = load i16, ptr %187, align 2, !tbaa.struct !23
  %188 = trunc i64 %171 to i32
  %189 = or disjoint i32 %188, 1
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %189
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %190, align 2, !tbaa.struct !23
  br i1 %155, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i
  %191 = trunc i64 %171 to i32
  %192 = or disjoint i32 %191, 2
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %192
  store i16 0, ptr addrspace(3) %193, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.i
  %194 = or disjoint i64 %174, 2
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %194
  %.sroa.0196.0.copyload.2.i = load i16, ptr %195, align 4, !tbaa.struct !23
  %196 = trunc i64 %171 to i32
  %197 = or disjoint i32 %196, 2
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %197
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %198, align 2, !tbaa.struct !23
  br i1 %156, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.thread.i
  %199 = trunc i64 %171 to i32
  %200 = or disjoint i32 %199, 3
  %201 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %200
  store i16 0, ptr addrspace(3) %201, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.2.i
  %202 = or disjoint i64 %174, 3
  %203 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %202
  %.sroa.0196.0.copyload.3.i = load i16, ptr %203, align 2, !tbaa.struct !23
  %204 = trunc i64 %171 to i32
  %205 = or disjoint i32 %204, 3
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %205
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %206, align 2, !tbaa.struct !23
  br i1 %157, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.thread.i
  %207 = trunc i64 %171 to i32
  %208 = or disjoint i32 %207, 4
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %208
  store i16 0, ptr addrspace(3) %209, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.3.i
  %210 = or disjoint i64 %174, 4
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %210
  %.sroa.0196.0.copyload.4.i = load i16, ptr %211, align 8, !tbaa.struct !23
  %212 = trunc i64 %171 to i32
  %213 = or disjoint i32 %212, 4
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %213
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %214, align 2, !tbaa.struct !23
  br i1 %158, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.thread.i
  %215 = trunc i64 %171 to i32
  %216 = or disjoint i32 %215, 5
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %216
  store i16 0, ptr addrspace(3) %217, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.4.i
  %218 = or disjoint i64 %174, 5
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %218
  %.sroa.0196.0.copyload.5.i = load i16, ptr %219, align 2, !tbaa.struct !23
  %220 = trunc i64 %171 to i32
  %221 = or disjoint i32 %220, 5
  %222 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %221
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %222, align 2, !tbaa.struct !23
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.thread.i
  %223 = trunc i64 %171 to i32
  %224 = or disjoint i32 %223, 6
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %224
  store i16 0, ptr addrspace(3) %225, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.5.i
  %226 = or disjoint i64 %174, 6
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %226
  %.sroa.0196.0.copyload.6.i = load i16, ptr %227, align 4, !tbaa.struct !23
  %228 = trunc i64 %171 to i32
  %229 = or disjoint i32 %228, 6
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %229
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %230, align 2, !tbaa.struct !23
  br i1 %160, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.thread.i
  %231 = trunc i64 %171 to i32
  %232 = or disjoint i32 %231, 7
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %232
  store i16 0, ptr addrspace(3) %233, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.6.i
  %234 = or disjoint i64 %174, 7
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %234
  %.sroa.0196.0.copyload.7.i = load i16, ptr %235, align 2, !tbaa.struct !23
  %236 = trunc i64 %171 to i32
  %237 = or disjoint i32 %236, 7
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %237
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %238, align 2, !tbaa.struct !23
  br i1 %161, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.thread.i
  %239 = trunc i64 %171 to i32
  %240 = or disjoint i32 %239, 8
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %240
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.7.i
  %242 = or disjoint i64 %174, 8
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %242
  %.sroa.0196.0.copyload.8.i = load i16, ptr %243, align 16, !tbaa.struct !23
  %244 = trunc i64 %171 to i32
  %245 = or disjoint i32 %244, 8
  %246 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %245
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %246, align 2, !tbaa.struct !23
  br i1 %162, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.thread.i
  %247 = trunc i64 %171 to i32
  %248 = or disjoint i32 %247, 9
  %249 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %248
  store i16 0, ptr addrspace(3) %249, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.8.i
  %250 = or disjoint i64 %174, 9
  %251 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %250
  %.sroa.0196.0.copyload.9.i = load i16, ptr %251, align 2, !tbaa.struct !23
  %252 = trunc i64 %171 to i32
  %253 = or disjoint i32 %252, 9
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %253
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %254, align 2, !tbaa.struct !23
  br i1 %163, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.thread.i
  %255 = trunc i64 %171 to i32
  %256 = or disjoint i32 %255, 10
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %256
  store i16 0, ptr addrspace(3) %257, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.9.i
  %258 = or disjoint i64 %174, 10
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %258
  %.sroa.0196.0.copyload.10.i = load i16, ptr %259, align 4, !tbaa.struct !23
  %260 = trunc i64 %171 to i32
  %261 = or disjoint i32 %260, 10
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %261
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %262, align 2, !tbaa.struct !23
  br i1 %164, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.thread.i
  %263 = trunc i64 %171 to i32
  %264 = or disjoint i32 %263, 11
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %264
  store i16 0, ptr addrspace(3) %265, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.10.i
  %266 = or disjoint i64 %174, 11
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %266
  %.sroa.0196.0.copyload.11.i = load i16, ptr %267, align 2, !tbaa.struct !23
  %268 = trunc i64 %171 to i32
  %269 = or disjoint i32 %268, 11
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %269
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %270, align 2, !tbaa.struct !23
  br i1 %165, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.thread.i
  %271 = trunc i64 %171 to i32
  %272 = or disjoint i32 %271, 12
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %272
  store i16 0, ptr addrspace(3) %273, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.11.i
  %274 = or disjoint i64 %174, 12
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %274
  %.sroa.0196.0.copyload.12.i = load i16, ptr %275, align 8, !tbaa.struct !23
  %276 = trunc i64 %171 to i32
  %277 = or disjoint i32 %276, 12
  %278 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %277
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %278, align 2, !tbaa.struct !23
  br i1 %166, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.thread.i
  %279 = trunc i64 %171 to i32
  %280 = or disjoint i32 %279, 13
  %281 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %280
  store i16 0, ptr addrspace(3) %281, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.12.i
  %282 = or disjoint i64 %174, 13
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %282
  %.sroa.0196.0.copyload.13.i = load i16, ptr %283, align 2, !tbaa.struct !23
  %284 = trunc i64 %171 to i32
  %285 = or disjoint i32 %284, 13
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %285
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %286, align 2, !tbaa.struct !23
  br i1 %167, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.thread.i
  %287 = trunc i64 %171 to i32
  %288 = or disjoint i32 %287, 14
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %288
  store i16 0, ptr addrspace(3) %289, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.13.i
  %290 = or disjoint i64 %174, 14
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %290
  %.sroa.0196.0.copyload.14.i = load i16, ptr %291, align 4, !tbaa.struct !23
  %292 = trunc i64 %171 to i32
  %293 = or disjoint i32 %292, 14
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %293
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %294, align 2, !tbaa.struct !23
  br i1 %168, label %295, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

295:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i
  %296 = or disjoint i64 %174, 15
  %297 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %296
  %.sroa.0196.0.copyload.15.i = load i16, ptr %297, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i: ; preds = %295, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %295 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.14.thread.i ]
  %298 = trunc i64 %171 to i32
  %299 = or disjoint i32 %298, 15
  %300 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %299
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %300, align 2, !tbaa.struct !23
  br label %.split414.us.i

.lr.ph417.i:                                      ; preds = %.split414.us.i, %.loopexit408.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %301 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %302 = icmp eq i64 %301, 0
  call void @llvm.assume(i1 %302)
  %303 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %304 = icmp eq i64 %303, 0
  call void @llvm.assume(i1 %304)
  %305 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %306 = icmp ult i64 %305, 128
  call void @llvm.assume(i1 %306)
  %307 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %308 = inttoptr i32 %307 to ptr addrspace(3)
  %309 = getelementptr inbounds i8, ptr addrspace(3) %308, i32 512
  %310 = getelementptr inbounds i8, ptr addrspace(3) %308, i32 1536
  %311 = and i64 %305, 15
  %312 = trunc i64 %305 to i32
  %313 = getelementptr inbounds float, ptr addrspace(3) %308, i32 %312
  %314 = load float, ptr addrspace(3) %313, align 4, !tbaa !19
  %315 = shl nuw nsw i64 %305, 2
  %316 = and i64 %315, 448
  br label %321

._crit_edge418.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %372, ptr addrspace(3) %313, align 4, !tbaa !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %317 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %318 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %319 = icmp ult i64 %318, 128
  call void @llvm.assume(i1 %319)
  %320 = icmp eq i64 %318, 0
  br i1 %320, label %374, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

321:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph417.i
  %322 = phi i64 [ 0, %.lr.ph417.i ], [ %373, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %323 = phi float [ %314, %.lr.ph417.i ], [ %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %324 = add nuw nsw i64 %322, %316
  %325 = trunc i64 %324 to i32
  %326 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %309, i32 %325
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %326, align 2, !tbaa.struct !23
  %327 = shl nuw nsw i64 %322, 4
  %328 = or disjoint i64 %327, %311
  %329 = trunc i64 %328 to i32
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %310, i32 %329
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %330, align 2, !tbaa.struct !23
  %331 = zext i16 %.sroa.0179.0.copyload.i to i32
  %332 = lshr i32 %331, 10
  %333 = and i32 %332, 31
  %334 = and i32 %331, 1023
  switch i32 %333, label %340 [
    i32 31, label %335
    i32 0, label %342
  ]

335:                                              ; preds = %321
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %336 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %334, 0
  %337 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %338 = or disjoint i32 %337, %336
  %339 = bitcast i32 %338 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

340:                                              ; preds = %321
  %341 = or disjoint i32 %334, 1024
  br label %342

342:                                              ; preds = %340, %321
  %343 = phi i32 [ %341, %340 ], [ %334, %321 ]
  %344 = uitofp i32 %343 to float
  %.not.i = icmp eq i32 %333, 0
  %345 = add nsw i32 %333, -25
  %346 = select i1 %.not.i, i32 -24, i32 %345
  %347 = call float @__ocml_ldexp_f32(float noundef %344, i32 noundef %346) #6
  %348 = fneg contract float %347
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %349 = select contract i1 %.not393394.i, float %348, float %347
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %342, %335
  %350 = phi float [ %339, %335 ], [ %349, %342 ]
  %351 = zext i16 %.sroa.0170.0.copyload.i to i32
  %352 = lshr i32 %351, 10
  %353 = and i32 %352, 31
  %354 = and i32 %351, 1023
  switch i32 %353, label %360 [
    i32 31, label %355
    i32 0, label %362
  ]

355:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %356 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %354, 0
  %357 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %358 = or disjoint i32 %357, %356
  %359 = bitcast i32 %358 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

360:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %361 = or disjoint i32 %354, 1024
  br label %362

362:                                              ; preds = %360, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %363 = phi i32 [ %361, %360 ], [ %354, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %364 = uitofp i32 %363 to float
  %.not395.i = icmp eq i32 %353, 0
  %365 = add nsw i32 %353, -25
  %366 = select i1 %.not395.i, i32 -24, i32 %365
  %367 = call float @__ocml_ldexp_f32(float noundef %364, i32 noundef %366) #6
  %368 = fneg contract float %367
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %369 = select contract i1 %.not396397.i, float %368, float %367
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %362, %355
  %370 = phi float [ %359, %355 ], [ %369, %362 ]
  %371 = fmul contract float %350, %370
  %372 = fadd contract float %323, %371
  %373 = add nuw nsw i64 %322, 1
  %exitcond429.not.i = icmp eq i64 %373, 64
  br i1 %exitcond429.not.i, label %._crit_edge418.i, label %321, !llvm.loop !31

374:                                              ; preds = %._crit_edge418.i
  %375 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %376 = icmp eq i64 %375, 0
  call void @llvm.assume(i1 %376)
  %377 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %378 = icmp eq i64 %377, 0
  call void @llvm.assume(i1 %378)
  %379 = sext i32 %.fr433.i to i64
  %380 = call i32 @llvm.amdgcn.groupstaticsize()
  %381 = inttoptr i32 %380 to ptr addrspace(3)
  %382 = icmp slt i32 %4, 1
  %383 = icmp ugt i32 %4, 1
  %384 = icmp ugt i32 %4, 2
  %385 = icmp ugt i32 %4, 3
  %386 = icmp ugt i32 %4, 4
  %387 = icmp ugt i32 %4, 5
  %388 = icmp ugt i32 %4, 6
  %389 = icmp ugt i32 %4, 7
  %390 = icmp ugt i32 %4, 8
  %391 = icmp ugt i32 %4, 9
  %392 = icmp ugt i32 %4, 10
  %393 = icmp ugt i32 %4, 11
  %394 = icmp ugt i32 %4, 12
  %395 = icmp ugt i32 %4, 13
  %396 = icmp ugt i32 %4, 14
  %397 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split420.us.i, %374
  %398 = phi i64 [ 0, %374 ], [ %404, %.split420.us.i ]
  %399 = icmp sge i64 %398, %379
  %400 = shl i64 %398, 4
  %.tr392.i = trunc i64 %398 to i32
  %401 = shl i32 %.tr392.i, 4
  %402 = sext i32 %401 to i64
  %403 = add nsw i64 %317, %402
  %brmerge.i = select i1 %399, i1 true, i1 %382
  br i1 %brmerge.i, label %.split420.us.i, label %.preheader.split.1.i

.split420.us.i:                                   ; preds = %493, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %404 = add i64 %398, 1
  %exitcond431.not.i = icmp eq i64 %404, 8
  br i1 %exitcond431.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %405 = trunc i64 %400 to i32
  %406 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %405
  %407 = load float, ptr addrspace(3) %406, align 4, !tbaa !19
  %408 = getelementptr inbounds float, ptr %9, i64 %403
  store float %407, ptr %408, align 32, !tbaa !19
  br i1 %383, label %.preheader.split.2.i, label %.split420.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %409 = trunc i64 %400 to i32
  %410 = or disjoint i32 %409, 1
  %411 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %410
  %412 = load float, ptr addrspace(3) %411, align 4, !tbaa !19
  %413 = or disjoint i64 %403, 1
  %414 = getelementptr inbounds float, ptr %9, i64 %413
  store float %412, ptr %414, align 4, !tbaa !19
  br i1 %384, label %.preheader.split.3.i, label %.split420.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %415 = trunc i64 %400 to i32
  %416 = or disjoint i32 %415, 2
  %417 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %416
  %418 = load float, ptr addrspace(3) %417, align 4, !tbaa !19
  %419 = or disjoint i64 %403, 2
  %420 = getelementptr inbounds float, ptr %9, i64 %419
  store float %418, ptr %420, align 8, !tbaa !19
  br i1 %385, label %.preheader.split.4.i, label %.split420.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %421 = trunc i64 %400 to i32
  %422 = or disjoint i32 %421, 3
  %423 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %422
  %424 = load float, ptr addrspace(3) %423, align 4, !tbaa !19
  %425 = or disjoint i64 %403, 3
  %426 = getelementptr inbounds float, ptr %9, i64 %425
  store float %424, ptr %426, align 4, !tbaa !19
  br i1 %386, label %.preheader.split.5.i, label %.split420.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %427 = trunc i64 %400 to i32
  %428 = or disjoint i32 %427, 4
  %429 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %428
  %430 = load float, ptr addrspace(3) %429, align 4, !tbaa !19
  %431 = or disjoint i64 %403, 4
  %432 = getelementptr inbounds float, ptr %9, i64 %431
  store float %430, ptr %432, align 16, !tbaa !19
  br i1 %387, label %.preheader.split.6.i, label %.split420.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %433 = trunc i64 %400 to i32
  %434 = or disjoint i32 %433, 5
  %435 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %434
  %436 = load float, ptr addrspace(3) %435, align 4, !tbaa !19
  %437 = or disjoint i64 %403, 5
  %438 = getelementptr inbounds float, ptr %9, i64 %437
  store float %436, ptr %438, align 4, !tbaa !19
  br i1 %388, label %.preheader.split.7.i, label %.split420.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %439 = trunc i64 %400 to i32
  %440 = or disjoint i32 %439, 6
  %441 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %440
  %442 = load float, ptr addrspace(3) %441, align 4, !tbaa !19
  %443 = or disjoint i64 %403, 6
  %444 = getelementptr inbounds float, ptr %9, i64 %443
  store float %442, ptr %444, align 8, !tbaa !19
  br i1 %389, label %.preheader.split.8.i, label %.split420.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %445 = trunc i64 %400 to i32
  %446 = or disjoint i32 %445, 7
  %447 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %446
  %448 = load float, ptr addrspace(3) %447, align 4, !tbaa !19
  %449 = or disjoint i64 %403, 7
  %450 = getelementptr inbounds float, ptr %9, i64 %449
  store float %448, ptr %450, align 4, !tbaa !19
  br i1 %390, label %.preheader.split.9.i, label %.split420.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %451 = trunc i64 %400 to i32
  %452 = or disjoint i32 %451, 8
  %453 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %452
  %454 = load float, ptr addrspace(3) %453, align 4, !tbaa !19
  %455 = or disjoint i64 %403, 8
  %456 = getelementptr inbounds float, ptr %9, i64 %455
  store float %454, ptr %456, align 32, !tbaa !19
  br i1 %391, label %.preheader.split.10.i, label %.split420.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %457 = trunc i64 %400 to i32
  %458 = or disjoint i32 %457, 9
  %459 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %458
  %460 = load float, ptr addrspace(3) %459, align 4, !tbaa !19
  %461 = or disjoint i64 %403, 9
  %462 = getelementptr inbounds float, ptr %9, i64 %461
  store float %460, ptr %462, align 4, !tbaa !19
  br i1 %392, label %.preheader.split.11.i, label %.split420.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %463 = trunc i64 %400 to i32
  %464 = or disjoint i32 %463, 10
  %465 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %464
  %466 = load float, ptr addrspace(3) %465, align 4, !tbaa !19
  %467 = or disjoint i64 %403, 10
  %468 = getelementptr inbounds float, ptr %9, i64 %467
  store float %466, ptr %468, align 8, !tbaa !19
  br i1 %393, label %.preheader.split.12.i, label %.split420.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %469 = trunc i64 %400 to i32
  %470 = or disjoint i32 %469, 11
  %471 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %470
  %472 = load float, ptr addrspace(3) %471, align 4, !tbaa !19
  %473 = or disjoint i64 %403, 11
  %474 = getelementptr inbounds float, ptr %9, i64 %473
  store float %472, ptr %474, align 4, !tbaa !19
  br i1 %394, label %.preheader.split.13.i, label %.split420.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %475 = trunc i64 %400 to i32
  %476 = or disjoint i32 %475, 12
  %477 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !19
  %479 = or disjoint i64 %403, 12
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 16, !tbaa !19
  br i1 %395, label %.preheader.split.14.i, label %.split420.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %481 = trunc i64 %400 to i32
  %482 = or disjoint i32 %481, 13
  %483 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !19
  %485 = or disjoint i64 %403, 13
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 4, !tbaa !19
  br i1 %396, label %.preheader.split.15.i, label %.split420.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %487 = trunc i64 %400 to i32
  %488 = or disjoint i32 %487, 14
  %489 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !19
  %491 = or disjoint i64 %403, 14
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 8, !tbaa !19
  br i1 %397, label %493, label %.split420.us.i

493:                                              ; preds = %.preheader.split.15.i
  %494 = trunc i64 %400 to i32
  %495 = or disjoint i32 %494, 15
  %496 = getelementptr inbounds float, ptr addrspace(3) %381, i32 %495
  %497 = load float, ptr addrspace(3) %496, align 4, !tbaa !19
  %498 = or disjoint i64 %403, 15
  %499 = getelementptr inbounds float, ptr %9, i64 %498
  store float %497, ptr %499, align 4, !tbaa !19
  br label %.split420.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge418.i, %.split420.us.i
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
!31 = distinct !{!31, !27}
!32 = distinct !{!32, !27}
;----------------- End AdaptiveCpp IR dump ---------------
