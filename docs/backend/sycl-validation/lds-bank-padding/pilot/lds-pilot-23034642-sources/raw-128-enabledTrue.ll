;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-b1rfe9v9/kernel.cpp"
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
  %.fr434.i = freeze i32 %3
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
  br i1 %42, label %.preheader408.i, label %.loopexit409.i

.preheader408.i:                                  ; preds = %6
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
  %53 = icmp sgt i32 %.fr434.i, 0
  br i1 %53, label %.preheader408.split.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %.preheader408.i
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %51, i8 0, i32 128, i1 false)
  br label %.split.us.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %54 = icmp sgt i32 %.fr434.i, 1
  %55 = or disjoint i64 %52, 64
  br i1 %54, label %.preheader408.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %50, i32 644
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.1.i, i8 0, i32 128, i1 false)
  br label %.split.us.2.thread.i

.preheader408.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %.split.us.i
  %56 = phi i64 [ %64, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i ], [ 0, %.split.us.i ]
  %57 = icmp slt i64 %56, %48
  br i1 %57, label %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

58:                                               ; preds = %.preheader408.split.1.i
  %59 = add nuw nsw i64 %55, %56
  %60 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %59
  %.sroa.0207.0.copyload.1.i = load i16, ptr %60, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %58, %.preheader408.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %58 ], [ 0, %.preheader408.split.1.i ]
  %61 = trunc i64 %56 to i32
  %62 = add i32 %61, 66
  %63 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %62
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %63, align 2, !tbaa.struct !23
  %64 = add nuw nsw i64 %56, 1
  %exitcond.1.not.i = icmp eq i64 %64, 64
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader408.split.1.i, !llvm.loop !26

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %65 = icmp sgt i32 %.fr434.i, 2
  %66 = or disjoint i64 %52, 128
  br i1 %65, label %.preheader408.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %50, i32 776
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.2.i, i8 0, i32 128, i1 false)
  br label %.split.us.3.thread.i

.preheader408.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %.split.us.1.i
  %67 = phi i64 [ %75, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i ], [ 0, %.split.us.1.i ]
  %68 = icmp slt i64 %67, %48
  br i1 %68, label %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

69:                                               ; preds = %.preheader408.split.2.i
  %70 = add nuw nsw i64 %66, %67
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0207.0.copyload.2.i = load i16, ptr %71, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %69, %.preheader408.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %69 ], [ 0, %.preheader408.split.2.i ]
  %72 = trunc i64 %67 to i32
  %73 = add i32 %72, 132
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %73
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %74, align 2, !tbaa.struct !23
  %75 = add nuw nsw i64 %67, 1
  %exitcond.2.not.i = icmp eq i64 %75, 64
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader408.split.2.i, !llvm.loop !26

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %76 = icmp sgt i32 %.fr434.i, 3
  %77 = or disjoint i64 %52, 192
  br i1 %76, label %.preheader408.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %50, i32 908
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.3.i, i8 0, i32 128, i1 false)
  br label %.split.us.4.thread.i

.preheader408.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %.split.us.2.i
  %78 = phi i64 [ %86, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i ], [ 0, %.split.us.2.i ]
  %79 = icmp slt i64 %78, %48
  br i1 %79, label %80, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

80:                                               ; preds = %.preheader408.split.3.i
  %81 = add nuw nsw i64 %77, %78
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %81
  %.sroa.0207.0.copyload.3.i = load i16, ptr %82, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %80, %.preheader408.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %80 ], [ 0, %.preheader408.split.3.i ]
  %83 = trunc i64 %78 to i32
  %84 = add i32 %83, 198
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %84
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %85, align 2, !tbaa.struct !23
  %86 = add nuw nsw i64 %78, 1
  %exitcond.3.not.i = icmp eq i64 %86, 64
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader408.split.3.i, !llvm.loop !26

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %87 = icmp sgt i32 %.fr434.i, 4
  %88 = or disjoint i64 %52, 256
  br i1 %87, label %.preheader408.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %50, i32 1040
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.4.i, i8 0, i32 128, i1 false)
  br label %.split.us.5.thread.i

.preheader408.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %.split.us.3.i
  %89 = phi i64 [ %97, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i ], [ 0, %.split.us.3.i ]
  %90 = icmp slt i64 %89, %48
  br i1 %90, label %91, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

91:                                               ; preds = %.preheader408.split.4.i
  %92 = add nuw nsw i64 %88, %89
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %92
  %.sroa.0207.0.copyload.4.i = load i16, ptr %93, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %91, %.preheader408.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %91 ], [ 0, %.preheader408.split.4.i ]
  %94 = trunc i64 %89 to i32
  %95 = add i32 %94, 264
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %95
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %96, align 2, !tbaa.struct !23
  %97 = add nuw nsw i64 %89, 1
  %exitcond.4.not.i = icmp eq i64 %97, 64
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader408.split.4.i, !llvm.loop !26

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %98 = icmp sgt i32 %.fr434.i, 5
  %99 = or disjoint i64 %52, 320
  br i1 %98, label %.preheader408.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %50, i32 1172
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.5.i, i8 0, i32 128, i1 false)
  br label %.split.us.6.thread.i

.preheader408.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %.split.us.4.i
  %100 = phi i64 [ %108, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i ], [ 0, %.split.us.4.i ]
  %101 = icmp slt i64 %100, %48
  br i1 %101, label %102, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

102:                                              ; preds = %.preheader408.split.5.i
  %103 = add nuw nsw i64 %99, %100
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %103
  %.sroa.0207.0.copyload.5.i = load i16, ptr %104, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %102, %.preheader408.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %102 ], [ 0, %.preheader408.split.5.i ]
  %105 = trunc i64 %100 to i32
  %106 = add i32 %105, 330
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %106
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %107, align 2, !tbaa.struct !23
  %108 = add nuw nsw i64 %100, 1
  %exitcond.5.not.i = icmp eq i64 %108, 64
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader408.split.5.i, !llvm.loop !26

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %109 = icmp sgt i32 %.fr434.i, 6
  %110 = or disjoint i64 %52, 384
  br i1 %109, label %.preheader408.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %50, i32 1304
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.6.i, i8 0, i32 128, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

.preheader408.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %.split.us.5.i
  %111 = phi i64 [ %119, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i ], [ 0, %.split.us.5.i ]
  %112 = icmp slt i64 %111, %48
  br i1 %112, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

113:                                              ; preds = %.preheader408.split.6.i
  %114 = add nuw nsw i64 %110, %111
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %114
  %.sroa.0207.0.copyload.6.i = load i16, ptr %115, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %113, %.preheader408.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %113 ], [ 0, %.preheader408.split.6.i ]
  %116 = trunc i64 %111 to i32
  %117 = add i32 %116, 396
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %117
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  %119 = add nuw nsw i64 %111, 1
  %exitcond.6.not.i = icmp eq i64 %119, 64
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader408.split.6.i, !llvm.loop !26

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %120 = icmp sgt i32 %.fr434.i, 7
  %121 = or disjoint i64 %52, 448
  br i1 %120, label %.preheader408.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %50, i32 1436
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.7.i, i8 0, i32 128, i1 false)
  br label %.loopexit409.i

.preheader408.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %.split.us.6.i
  %122 = phi i64 [ %130, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i ], [ 0, %.split.us.6.i ]
  %123 = icmp slt i64 %122, %48
  br i1 %123, label %124, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

124:                                              ; preds = %.preheader408.split.7.i
  %125 = add nuw nsw i64 %121, %122
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0207.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %124, %.preheader408.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %124 ], [ 0, %.preheader408.split.7.i ]
  %127 = trunc i64 %122 to i32
  %128 = add i32 %127, 462
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %128
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  %130 = add nuw nsw i64 %122, 1
  %exitcond.7.not.i = icmp eq i64 %130, 64
  br i1 %exitcond.7.not.i, label %.loopexit409.i, label %.preheader408.split.7.i, !llvm.loop !26

.preheader408.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %.preheader408.i
  %131 = phi i64 [ %138, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i ], [ 0, %.preheader408.i ]
  %132 = icmp slt i64 %131, %48
  br i1 %132, label %133, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

133:                                              ; preds = %.preheader408.split.i
  %134 = add nuw nsw i64 %131, %52
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %134
  %.sroa.0207.0.copyload.i = load i16, ptr %135, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %133, %.preheader408.split.i
  %.sroa.0209.2.i = phi i16 [ %.sroa.0207.0.copyload.i, %133 ], [ 0, %.preheader408.split.i ]
  %136 = trunc i64 %131 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %136
  store i16 %.sroa.0209.2.i, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  %138 = add nuw nsw i64 %131, 1
  %exitcond.not.i = icmp eq i64 %138, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader408.split.i, !llvm.loop !26

.loopexit409.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.7.i, %6
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
  br i1 %141, label %142, label %.lr.ph418.i

142:                                              ; preds = %.loopexit409.i
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
  %151 = getelementptr inbounds i8, ptr addrspace(3) %150, i32 1568
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
  br label %.preheader407.i

.preheader407.i:                                  ; preds = %.split415.us.i, %142
  %169 = phi i64 [ 0, %142 ], [ %179, %.split415.us.i ]
  %170 = icmp slt i64 %169, %148
  %171 = shl i64 %169, 4
  %.tr400.i = trunc i64 %169 to i32
  %172 = shl i32 %.tr400.i, 4
  %173 = sext i32 %172 to i64
  %174 = add nsw i64 %173, %152
  %.fr416.i = freeze i1 %170
  br i1 %.fr416.i, label %.preheader407.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader407.i
  %.tr433.i = trunc i64 %169 to i32
  %175 = shl i32 %.tr433.i, 5
  %176 = add i32 %175, 1568
  %scevgep427.i = getelementptr i8, ptr addrspace(3) %150, i32 %176
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep427.i, i8 0, i32 32, i1 false)
  br label %.split415.us.i

.preheader407.split.preheader.i:                  ; preds = %.preheader407.i
  br i1 %153, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.thread.i: ; preds = %.preheader407.split.preheader.i
  %177 = trunc i64 %171 to i32
  %178 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %151, i32 %177
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.1.thread.i

.split415.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %179 = add nuw nsw i64 %169, 1
  %exitcond429.not.i = icmp eq i64 %179, 64
  br i1 %exitcond429.not.i, label %.lr.ph418.i, label %.preheader407.i, !llvm.loop !30

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %.preheader407.split.preheader.i
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
  br label %.split415.us.i

.lr.ph418.i:                                      ; preds = %.split415.us.i, %.loopexit409.i
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
  %310 = getelementptr inbounds i8, ptr addrspace(3) %308, i32 1568
  %311 = and i64 %305, 15
  %312 = lshr i64 %305, 4
  %313 = mul nuw nsw i64 %312, 66
  %314 = trunc i64 %305 to i32
  %315 = getelementptr inbounds float, ptr addrspace(3) %308, i32 %314
  %.pre.i = load float, ptr addrspace(3) %315, align 4, !tbaa !19
  br label %320

._crit_edge419.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %316 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %317 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %318 = icmp ult i64 %317, 128
  call void @llvm.assume(i1 %318)
  %319 = icmp eq i64 %317, 0
  br i1 %319, label %373, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

320:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph418.i
  %321 = phi float [ %.pre.i, %.lr.ph418.i ], [ %371, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %322 = phi i64 [ 0, %.lr.ph418.i ], [ %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %323 = add nuw nsw i64 %322, %313
  %324 = trunc i64 %323 to i32
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %309, i32 %324
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %325, align 2, !tbaa.struct !23
  %326 = shl nuw nsw i64 %322, 4
  %327 = or disjoint i64 %326, %311
  %328 = trunc i64 %327 to i32
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %310, i32 %328
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %329, align 2, !tbaa.struct !23
  %330 = zext i16 %.sroa.0185.0.copyload.i to i32
  %331 = lshr i32 %330, 10
  %332 = and i32 %331, 31
  %333 = and i32 %330, 1023
  switch i32 %332, label %339 [
    i32 31, label %334
    i32 0, label %341
  ]

334:                                              ; preds = %320
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %335 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %333, 0
  %336 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %337 = or disjoint i32 %336, %335
  %338 = bitcast i32 %337 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

339:                                              ; preds = %320
  %340 = or disjoint i32 %333, 1024
  br label %341

341:                                              ; preds = %339, %320
  %342 = phi i32 [ %340, %339 ], [ %333, %320 ]
  %343 = uitofp i32 %342 to float
  %.not.i = icmp eq i32 %332, 0
  %344 = add nsw i32 %332, -25
  %345 = select i1 %.not.i, i32 -24, i32 %344
  %346 = call float @__ocml_ldexp_f32(float noundef %343, i32 noundef %345) #6
  %347 = fneg contract float %346
  %.not393394.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %348 = select contract i1 %.not393394.i, float %347, float %346
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %341, %334
  %349 = phi float [ %338, %334 ], [ %348, %341 ]
  %350 = zext i16 %.sroa.0176.0.copyload.i to i32
  %351 = lshr i32 %350, 10
  %352 = and i32 %351, 31
  %353 = and i32 %350, 1023
  switch i32 %352, label %359 [
    i32 31, label %354
    i32 0, label %361
  ]

354:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %355 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %353, 0
  %356 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %357 = or disjoint i32 %356, %355
  %358 = bitcast i32 %357 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

359:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %360 = or disjoint i32 %353, 1024
  br label %361

361:                                              ; preds = %359, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %362 = phi i32 [ %360, %359 ], [ %353, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %363 = uitofp i32 %362 to float
  %.not395.i = icmp eq i32 %352, 0
  %364 = add nsw i32 %352, -25
  %365 = select i1 %.not395.i, i32 -24, i32 %364
  %366 = call float @__ocml_ldexp_f32(float noundef %363, i32 noundef %365) #6
  %367 = fneg contract float %366
  %.not396397.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %368 = select contract i1 %.not396397.i, float %367, float %366
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %361, %354
  %369 = phi float [ %358, %354 ], [ %368, %361 ]
  %370 = fmul contract float %349, %369
  %371 = fadd contract float %321, %370
  store float %371, ptr addrspace(3) %315, align 4, !tbaa !19
  %372 = add nuw nsw i64 %322, 1
  %exitcond430.not.i = icmp eq i64 %372, 64
  br i1 %exitcond430.not.i, label %._crit_edge419.i, label %320, !llvm.loop !31

373:                                              ; preds = %._crit_edge419.i
  %374 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %375 = icmp eq i64 %374, 0
  call void @llvm.assume(i1 %375)
  %376 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %377 = icmp eq i64 %376, 0
  call void @llvm.assume(i1 %377)
  %378 = sext i32 %.fr434.i to i64
  %379 = call i32 @llvm.amdgcn.groupstaticsize()
  %380 = inttoptr i32 %379 to ptr addrspace(3)
  %381 = icmp slt i32 %4, 1
  %382 = icmp ugt i32 %4, 1
  %383 = icmp ugt i32 %4, 2
  %384 = icmp ugt i32 %4, 3
  %385 = icmp ugt i32 %4, 4
  %386 = icmp ugt i32 %4, 5
  %387 = icmp ugt i32 %4, 6
  %388 = icmp ugt i32 %4, 7
  %389 = icmp ugt i32 %4, 8
  %390 = icmp ugt i32 %4, 9
  %391 = icmp ugt i32 %4, 10
  %392 = icmp ugt i32 %4, 11
  %393 = icmp ugt i32 %4, 12
  %394 = icmp ugt i32 %4, 13
  %395 = icmp ugt i32 %4, 14
  %396 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split421.us.i, %373
  %397 = phi i64 [ 0, %373 ], [ %403, %.split421.us.i ]
  %398 = icmp sge i64 %397, %378
  %399 = shl i64 %397, 4
  %.tr392.i = trunc i64 %397 to i32
  %400 = shl i32 %.tr392.i, 4
  %401 = sext i32 %400 to i64
  %402 = add nsw i64 %316, %401
  %brmerge.i = select i1 %398, i1 true, i1 %381
  br i1 %brmerge.i, label %.split421.us.i, label %.preheader.split.1.i

.split421.us.i:                                   ; preds = %492, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %403 = add i64 %397, 1
  %exitcond432.not.i = icmp eq i64 %403, 8
  br i1 %exitcond432.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %404 = trunc i64 %399 to i32
  %405 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %404
  %406 = load float, ptr addrspace(3) %405, align 4, !tbaa !19
  %407 = getelementptr inbounds float, ptr %9, i64 %402
  store float %406, ptr %407, align 32, !tbaa !19
  br i1 %382, label %.preheader.split.2.i, label %.split421.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %408 = trunc i64 %399 to i32
  %409 = or disjoint i32 %408, 1
  %410 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %409
  %411 = load float, ptr addrspace(3) %410, align 4, !tbaa !19
  %412 = or disjoint i64 %402, 1
  %413 = getelementptr inbounds float, ptr %9, i64 %412
  store float %411, ptr %413, align 4, !tbaa !19
  br i1 %383, label %.preheader.split.3.i, label %.split421.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %414 = trunc i64 %399 to i32
  %415 = or disjoint i32 %414, 2
  %416 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %415
  %417 = load float, ptr addrspace(3) %416, align 4, !tbaa !19
  %418 = or disjoint i64 %402, 2
  %419 = getelementptr inbounds float, ptr %9, i64 %418
  store float %417, ptr %419, align 8, !tbaa !19
  br i1 %384, label %.preheader.split.4.i, label %.split421.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %420 = trunc i64 %399 to i32
  %421 = or disjoint i32 %420, 3
  %422 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %421
  %423 = load float, ptr addrspace(3) %422, align 4, !tbaa !19
  %424 = or disjoint i64 %402, 3
  %425 = getelementptr inbounds float, ptr %9, i64 %424
  store float %423, ptr %425, align 4, !tbaa !19
  br i1 %385, label %.preheader.split.5.i, label %.split421.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %426 = trunc i64 %399 to i32
  %427 = or disjoint i32 %426, 4
  %428 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %427
  %429 = load float, ptr addrspace(3) %428, align 4, !tbaa !19
  %430 = or disjoint i64 %402, 4
  %431 = getelementptr inbounds float, ptr %9, i64 %430
  store float %429, ptr %431, align 16, !tbaa !19
  br i1 %386, label %.preheader.split.6.i, label %.split421.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %432 = trunc i64 %399 to i32
  %433 = or disjoint i32 %432, 5
  %434 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %433
  %435 = load float, ptr addrspace(3) %434, align 4, !tbaa !19
  %436 = or disjoint i64 %402, 5
  %437 = getelementptr inbounds float, ptr %9, i64 %436
  store float %435, ptr %437, align 4, !tbaa !19
  br i1 %387, label %.preheader.split.7.i, label %.split421.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %438 = trunc i64 %399 to i32
  %439 = or disjoint i32 %438, 6
  %440 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %439
  %441 = load float, ptr addrspace(3) %440, align 4, !tbaa !19
  %442 = or disjoint i64 %402, 6
  %443 = getelementptr inbounds float, ptr %9, i64 %442
  store float %441, ptr %443, align 8, !tbaa !19
  br i1 %388, label %.preheader.split.8.i, label %.split421.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %444 = trunc i64 %399 to i32
  %445 = or disjoint i32 %444, 7
  %446 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %445
  %447 = load float, ptr addrspace(3) %446, align 4, !tbaa !19
  %448 = or disjoint i64 %402, 7
  %449 = getelementptr inbounds float, ptr %9, i64 %448
  store float %447, ptr %449, align 4, !tbaa !19
  br i1 %389, label %.preheader.split.9.i, label %.split421.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %450 = trunc i64 %399 to i32
  %451 = or disjoint i32 %450, 8
  %452 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %451
  %453 = load float, ptr addrspace(3) %452, align 4, !tbaa !19
  %454 = or disjoint i64 %402, 8
  %455 = getelementptr inbounds float, ptr %9, i64 %454
  store float %453, ptr %455, align 32, !tbaa !19
  br i1 %390, label %.preheader.split.10.i, label %.split421.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %456 = trunc i64 %399 to i32
  %457 = or disjoint i32 %456, 9
  %458 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %457
  %459 = load float, ptr addrspace(3) %458, align 4, !tbaa !19
  %460 = or disjoint i64 %402, 9
  %461 = getelementptr inbounds float, ptr %9, i64 %460
  store float %459, ptr %461, align 4, !tbaa !19
  br i1 %391, label %.preheader.split.11.i, label %.split421.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %462 = trunc i64 %399 to i32
  %463 = or disjoint i32 %462, 10
  %464 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %463
  %465 = load float, ptr addrspace(3) %464, align 4, !tbaa !19
  %466 = or disjoint i64 %402, 10
  %467 = getelementptr inbounds float, ptr %9, i64 %466
  store float %465, ptr %467, align 8, !tbaa !19
  br i1 %392, label %.preheader.split.12.i, label %.split421.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %468 = trunc i64 %399 to i32
  %469 = or disjoint i32 %468, 11
  %470 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %469
  %471 = load float, ptr addrspace(3) %470, align 4, !tbaa !19
  %472 = or disjoint i64 %402, 11
  %473 = getelementptr inbounds float, ptr %9, i64 %472
  store float %471, ptr %473, align 4, !tbaa !19
  br i1 %393, label %.preheader.split.13.i, label %.split421.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %474 = trunc i64 %399 to i32
  %475 = or disjoint i32 %474, 12
  %476 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %475
  %477 = load float, ptr addrspace(3) %476, align 4, !tbaa !19
  %478 = or disjoint i64 %402, 12
  %479 = getelementptr inbounds float, ptr %9, i64 %478
  store float %477, ptr %479, align 16, !tbaa !19
  br i1 %394, label %.preheader.split.14.i, label %.split421.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %480 = trunc i64 %399 to i32
  %481 = or disjoint i32 %480, 13
  %482 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %481
  %483 = load float, ptr addrspace(3) %482, align 4, !tbaa !19
  %484 = or disjoint i64 %402, 13
  %485 = getelementptr inbounds float, ptr %9, i64 %484
  store float %483, ptr %485, align 4, !tbaa !19
  br i1 %395, label %.preheader.split.15.i, label %.split421.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %486 = trunc i64 %399 to i32
  %487 = or disjoint i32 %486, 14
  %488 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %487
  %489 = load float, ptr addrspace(3) %488, align 4, !tbaa !19
  %490 = or disjoint i64 %402, 14
  %491 = getelementptr inbounds float, ptr %9, i64 %490
  store float %489, ptr %491, align 8, !tbaa !19
  br i1 %396, label %492, label %.split421.us.i

492:                                              ; preds = %.preheader.split.15.i
  %493 = trunc i64 %399 to i32
  %494 = or disjoint i32 %493, 15
  %495 = getelementptr inbounds float, ptr addrspace(3) %380, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !19
  %497 = or disjoint i64 %402, 15
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 4, !tbaa !19
  br label %.split421.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge419.i, %.split421.us.i
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
