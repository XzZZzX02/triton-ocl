;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-h7uyfpt6/kernel.cpp"
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
  %.fr469.i = freeze i32 %3
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !14
  %11 = icmp ult i64 %10, 2147483647
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp eq i64 %16, 0
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 2147483648
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
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 4 dereferenceable(512) %35, i8 0, i32 512, i1 false), !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 2147483647
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = shl i32 %.tr.i, 8
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %40 = icmp eq i64 %39, 0
  call void @llvm.assume(i1 %40)
  %41 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %42 = icmp eq i64 %41, 0
  call void @llvm.assume(i1 %42)
  %43 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %44 = icmp eq i64 %43, 0
  call void @llvm.assume(i1 %44)
  %45 = sext i32 %.fr469.i to i64
  %46 = sext i32 %5 to i64
  %47 = getelementptr i8, ptr addrspace(3) %35, i32 512
  %48 = sext i32 %38 to i64
  %49 = icmp sgt i32 %.fr469.i, 0
  br i1 %49, label %.preheader407.split.preheader.i, label %.split.us.thread.i

.split.us.thread.i:                               ; preds = %6
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %47, i8 0, i32 64, i1 false)
  br label %.split.us.1.thread.i

.preheader407.split.preheader.i:                  ; preds = %6
  %50 = icmp sgt i32 %5, 0
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader407.split.preheader.i
  store i16 0, ptr addrspace(3) %47, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.thread.i

.split.us.i:                                      ; preds = %290, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i
  %.sroa.0209.2.31.i = phi i16 [ %.sroa.0207.0.copyload.31.i, %290 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i ]
  %51 = getelementptr i8, ptr addrspace(3) %35, i32 574
  store i16 %.sroa.0209.2.31.i, ptr addrspace(3) %51, align 2, !tbaa.struct !27
  %52 = icmp ugt i32 %.fr469.i, 1
  %53 = or disjoint i64 %48, 32
  br i1 %52, label %.preheader407.split.1.i, label %.split.us.1.thread.i

.split.us.1.thread.i:                             ; preds = %.split.us.i, %.split.us.thread.i
  %scevgep.1.i = getelementptr i8, ptr addrspace(3) %35, i32 576
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.1.i, i8 0, i32 64, i1 false)
  br label %.split.us.2.thread.i

.preheader407.split.1.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %.split.us.i
  %54 = phi i64 [ %62, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i ], [ 0, %.split.us.i ]
  %55 = icmp slt i64 %54, %46
  br i1 %55, label %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i

56:                                               ; preds = %.preheader407.split.1.i
  %57 = add nuw nsw i64 %53, %54
  %58 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0207.0.copyload.1.i = load i16, ptr %58, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %56, %.preheader407.split.1.i
  %.sroa.0209.2.1.i = phi i16 [ %.sroa.0207.0.copyload.1.i, %56 ], [ 0, %.preheader407.split.1.i ]
  %59 = trunc i64 %54 to i32
  %60 = add i32 %59, 32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %60
  store i16 %.sroa.0209.2.1.i, ptr addrspace(3) %61, align 2, !tbaa.struct !27
  %62 = add nuw nsw i64 %54, 1
  %exitcond.1.not.i = icmp eq i64 %62, 32
  br i1 %exitcond.1.not.i, label %.split.us.1.i, label %.preheader407.split.1.i, !llvm.loop !30

.split.us.1.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %63 = icmp sgt i32 %.fr469.i, 2
  %64 = or disjoint i64 %48, 64
  br i1 %63, label %.preheader407.split.2.i, label %.split.us.2.thread.i

.split.us.2.thread.i:                             ; preds = %.split.us.1.i, %.split.us.1.thread.i
  %scevgep.2.i = getelementptr i8, ptr addrspace(3) %35, i32 640
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.2.i, i8 0, i32 64, i1 false)
  br label %.split.us.3.thread.i

.preheader407.split.2.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %.split.us.1.i
  %65 = phi i64 [ %73, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i ], [ 0, %.split.us.1.i ]
  %66 = icmp slt i64 %65, %46
  br i1 %66, label %67, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i

67:                                               ; preds = %.preheader407.split.2.i
  %68 = add nuw nsw i64 %64, %65
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0207.0.copyload.2.i = load i16, ptr %69, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %67, %.preheader407.split.2.i
  %.sroa.0209.2.2.i = phi i16 [ %.sroa.0207.0.copyload.2.i, %67 ], [ 0, %.preheader407.split.2.i ]
  %70 = trunc i64 %65 to i32
  %71 = add i32 %70, 64
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %71
  store i16 %.sroa.0209.2.2.i, ptr addrspace(3) %72, align 2, !tbaa.struct !27
  %73 = add nuw nsw i64 %65, 1
  %exitcond.2.not.i = icmp eq i64 %73, 32
  br i1 %exitcond.2.not.i, label %.split.us.2.i, label %.preheader407.split.2.i, !llvm.loop !30

.split.us.2.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %74 = icmp sgt i32 %.fr469.i, 3
  %75 = or disjoint i64 %48, 96
  br i1 %74, label %.preheader407.split.3.i, label %.split.us.3.thread.i

.split.us.3.thread.i:                             ; preds = %.split.us.2.i, %.split.us.2.thread.i
  %scevgep.3.i = getelementptr i8, ptr addrspace(3) %35, i32 704
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.3.i, i8 0, i32 64, i1 false)
  br label %.split.us.4.thread.i

.preheader407.split.3.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %.split.us.2.i
  %76 = phi i64 [ %84, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i ], [ 0, %.split.us.2.i ]
  %77 = icmp slt i64 %76, %46
  br i1 %77, label %78, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i

78:                                               ; preds = %.preheader407.split.3.i
  %79 = add nuw nsw i64 %75, %76
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %79
  %.sroa.0207.0.copyload.3.i = load i16, ptr %80, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %78, %.preheader407.split.3.i
  %.sroa.0209.2.3.i = phi i16 [ %.sroa.0207.0.copyload.3.i, %78 ], [ 0, %.preheader407.split.3.i ]
  %81 = trunc i64 %76 to i32
  %82 = add i32 %81, 96
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %82
  store i16 %.sroa.0209.2.3.i, ptr addrspace(3) %83, align 2, !tbaa.struct !27
  %84 = add nuw nsw i64 %76, 1
  %exitcond.3.not.i = icmp eq i64 %84, 32
  br i1 %exitcond.3.not.i, label %.split.us.3.i, label %.preheader407.split.3.i, !llvm.loop !30

.split.us.3.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %85 = icmp sgt i32 %.fr469.i, 4
  %86 = or disjoint i64 %48, 128
  br i1 %85, label %.preheader407.split.4.i, label %.split.us.4.thread.i

.split.us.4.thread.i:                             ; preds = %.split.us.3.i, %.split.us.3.thread.i
  %scevgep.4.i = getelementptr i8, ptr addrspace(3) %35, i32 768
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.4.i, i8 0, i32 64, i1 false)
  br label %.split.us.5.thread.i

.preheader407.split.4.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %.split.us.3.i
  %87 = phi i64 [ %95, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i ], [ 0, %.split.us.3.i ]
  %88 = icmp slt i64 %87, %46
  br i1 %88, label %89, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i

89:                                               ; preds = %.preheader407.split.4.i
  %90 = add nuw nsw i64 %86, %87
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %90
  %.sroa.0207.0.copyload.4.i = load i16, ptr %91, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %89, %.preheader407.split.4.i
  %.sroa.0209.2.4.i = phi i16 [ %.sroa.0207.0.copyload.4.i, %89 ], [ 0, %.preheader407.split.4.i ]
  %92 = trunc i64 %87 to i32
  %93 = add i32 %92, 128
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %93
  store i16 %.sroa.0209.2.4.i, ptr addrspace(3) %94, align 2, !tbaa.struct !27
  %95 = add nuw nsw i64 %87, 1
  %exitcond.4.not.i = icmp eq i64 %95, 32
  br i1 %exitcond.4.not.i, label %.split.us.4.i, label %.preheader407.split.4.i, !llvm.loop !30

.split.us.4.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %96 = icmp sgt i32 %.fr469.i, 5
  %97 = or disjoint i64 %48, 160
  br i1 %96, label %.preheader407.split.5.i, label %.split.us.5.thread.i

.split.us.5.thread.i:                             ; preds = %.split.us.4.i, %.split.us.4.thread.i
  %scevgep.5.i = getelementptr i8, ptr addrspace(3) %35, i32 832
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.5.i, i8 0, i32 64, i1 false)
  br label %.split.us.6.thread.i

.preheader407.split.5.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %.split.us.4.i
  %98 = phi i64 [ %106, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i ], [ 0, %.split.us.4.i ]
  %99 = icmp slt i64 %98, %46
  br i1 %99, label %100, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i

100:                                              ; preds = %.preheader407.split.5.i
  %101 = add nuw nsw i64 %97, %98
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0207.0.copyload.5.i = load i16, ptr %102, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %100, %.preheader407.split.5.i
  %.sroa.0209.2.5.i = phi i16 [ %.sroa.0207.0.copyload.5.i, %100 ], [ 0, %.preheader407.split.5.i ]
  %103 = trunc i64 %98 to i32
  %104 = add i32 %103, 160
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %104
  store i16 %.sroa.0209.2.5.i, ptr addrspace(3) %105, align 2, !tbaa.struct !27
  %106 = add nuw nsw i64 %98, 1
  %exitcond.5.not.i = icmp eq i64 %106, 32
  br i1 %exitcond.5.not.i, label %.split.us.5.i, label %.preheader407.split.5.i, !llvm.loop !30

.split.us.5.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %107 = icmp sgt i32 %.fr469.i, 6
  %108 = or disjoint i64 %48, 192
  br i1 %107, label %.preheader407.split.6.i, label %.split.us.6.thread.i

.split.us.6.thread.i:                             ; preds = %.split.us.5.i, %.split.us.5.thread.i
  %scevgep.6.i = getelementptr i8, ptr addrspace(3) %35, i32 896
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.6.i, i8 0, i32 64, i1 false)
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i

.preheader407.split.6.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %.split.us.5.i
  %109 = phi i64 [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i ], [ 0, %.split.us.5.i ]
  %110 = icmp slt i64 %109, %46
  br i1 %110, label %111, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i

111:                                              ; preds = %.preheader407.split.6.i
  %112 = add nuw nsw i64 %108, %109
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %112
  %.sroa.0207.0.copyload.6.i = load i16, ptr %113, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %111, %.preheader407.split.6.i
  %.sroa.0209.2.6.i = phi i16 [ %.sroa.0207.0.copyload.6.i, %111 ], [ 0, %.preheader407.split.6.i ]
  %114 = trunc i64 %109 to i32
  %115 = add i32 %114, 192
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %115
  store i16 %.sroa.0209.2.6.i, ptr addrspace(3) %116, align 2, !tbaa.struct !27
  %117 = add nuw nsw i64 %109, 1
  %exitcond.6.not.i = icmp eq i64 %117, 32
  br i1 %exitcond.6.not.i, label %.split.us.6.i, label %.preheader407.split.6.i, !llvm.loop !30

.split.us.6.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %118 = icmp sgt i32 %.fr469.i, 7
  %119 = or disjoint i64 %48, 224
  br i1 %118, label %.preheader407.split.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i: ; preds = %.split.us.6.i, %.split.us.6.thread.i
  %scevgep.7.i = getelementptr i8, ptr addrspace(3) %35, i32 960
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.7.i, i8 0, i32 64, i1 false)
  br label %.split.us.7.i

.preheader407.split.7.i:                          ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %.split.us.6.i
  %120 = phi i64 [ %128, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i ], [ 0, %.split.us.6.i ]
  %121 = icmp slt i64 %120, %46
  br i1 %121, label %122, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

122:                                              ; preds = %.preheader407.split.7.i
  %123 = add nuw nsw i64 %119, %120
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %123
  %.sroa.0207.0.copyload.7.i = load i16, ptr %124, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %122, %.preheader407.split.7.i
  %.sroa.0209.2.7.i = phi i16 [ %.sroa.0207.0.copyload.7.i, %122 ], [ 0, %.preheader407.split.7.i ]
  %125 = trunc i64 %120 to i32
  %126 = add i32 %125, 224
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %126
  store i16 %.sroa.0209.2.7.i, ptr addrspace(3) %127, align 2, !tbaa.struct !27
  %128 = add nuw nsw i64 %120, 1
  %exitcond.7.not.i = icmp eq i64 %128, 32
  br i1 %exitcond.7.not.i, label %.split.us.7.i, label %.preheader407.split.7.i, !llvm.loop !30

.split.us.7.i:                                    ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.7.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = shl i32 %.tr.i, 9
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %131 = icmp eq i64 %130, 0
  call void @llvm.assume(i1 %131)
  %132 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %133 = icmp eq i64 %132, 0
  call void @llvm.assume(i1 %133)
  %134 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %135 = icmp eq i64 %134, 0
  call void @llvm.assume(i1 %135)
  %136 = getelementptr inbounds i8, ptr addrspace(3) %35, i32 1024
  %137 = sext i32 %129 to i64
  %138 = icmp sgt i32 %4, 0
  %139 = icmp ugt i32 %4, 1
  %140 = icmp ugt i32 %4, 2
  %141 = icmp ugt i32 %4, 3
  %142 = icmp ugt i32 %4, 4
  %143 = icmp ugt i32 %4, 5
  %144 = icmp ugt i32 %4, 6
  %145 = icmp ugt i32 %4, 7
  %146 = icmp ugt i32 %4, 8
  %147 = icmp ugt i32 %4, 9
  %148 = icmp ugt i32 %4, 10
  %149 = icmp ugt i32 %4, 11
  %150 = icmp ugt i32 %4, 12
  %151 = icmp ugt i32 %4, 13
  %152 = icmp ugt i32 %4, 14
  %153 = icmp ugt i32 %4, 15
  br label %.preheader406.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader407.split.preheader.i
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %48
  %.sroa.0207.0.copyload.i = load i16, ptr %154, align 32, !tbaa.struct !27
  store i16 %.sroa.0207.0.copyload.i, ptr addrspace(3) %47, align 2, !tbaa.struct !27
  %.not519.i = icmp eq i32 %5, 1
  br i1 %.not519.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %155 = getelementptr i8, ptr addrspace(3) %35, i32 514
  store i16 0, ptr addrspace(3) %155, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %156 = or disjoint i64 %48, 1
  %157 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %156
  %.sroa.0207.0.copyload.1423.i = load i16, ptr %157, align 2, !tbaa.struct !27
  %158 = getelementptr i8, ptr addrspace(3) %35, i32 514
  store i16 %.sroa.0207.0.copyload.1423.i, ptr addrspace(3) %158, align 2, !tbaa.struct !27
  %159 = icmp ugt i32 %5, 2
  br i1 %159, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.thread.i
  %160 = getelementptr i8, ptr addrspace(3) %35, i32 516
  store i16 0, ptr addrspace(3) %160, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1426.i
  %161 = or disjoint i64 %48, 2
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %161
  %.sroa.0207.0.copyload.2428.i = load i16, ptr %162, align 4, !tbaa.struct !27
  %163 = getelementptr i8, ptr addrspace(3) %35, i32 516
  store i16 %.sroa.0207.0.copyload.2428.i, ptr addrspace(3) %163, align 2, !tbaa.struct !27
  %.not520.i = icmp eq i32 %5, 3
  br i1 %.not520.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.thread.i
  %164 = getelementptr i8, ptr addrspace(3) %35, i32 518
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2431.i
  %165 = or disjoint i64 %48, 3
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0207.0.copyload.3433.i = load i16, ptr %166, align 2, !tbaa.struct !27
  %167 = getelementptr i8, ptr addrspace(3) %35, i32 518
  store i16 %.sroa.0207.0.copyload.3433.i, ptr addrspace(3) %167, align 2, !tbaa.struct !27
  %168 = icmp ugt i32 %5, 4
  br i1 %168, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.thread.i
  %169 = getelementptr i8, ptr addrspace(3) %35, i32 520
  store i16 0, ptr addrspace(3) %169, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3436.i
  %170 = or disjoint i64 %48, 4
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %170
  %.sroa.0207.0.copyload.4438.i = load i16, ptr %171, align 8, !tbaa.struct !27
  %172 = getelementptr i8, ptr addrspace(3) %35, i32 520
  store i16 %.sroa.0207.0.copyload.4438.i, ptr addrspace(3) %172, align 2, !tbaa.struct !27
  %.not521.i = icmp eq i32 %5, 5
  br i1 %.not521.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.thread.i
  %173 = getelementptr i8, ptr addrspace(3) %35, i32 522
  store i16 0, ptr addrspace(3) %173, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4441.i
  %174 = or disjoint i64 %48, 5
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %174
  %.sroa.0207.0.copyload.5443.i = load i16, ptr %175, align 2, !tbaa.struct !27
  %176 = getelementptr i8, ptr addrspace(3) %35, i32 522
  store i16 %.sroa.0207.0.copyload.5443.i, ptr addrspace(3) %176, align 2, !tbaa.struct !27
  %177 = icmp ugt i32 %5, 6
  br i1 %177, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.thread.i
  %178 = getelementptr i8, ptr addrspace(3) %35, i32 524
  store i16 0, ptr addrspace(3) %178, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5446.i
  %179 = or disjoint i64 %48, 6
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %179
  %.sroa.0207.0.copyload.6448.i = load i16, ptr %180, align 4, !tbaa.struct !27
  %181 = getelementptr i8, ptr addrspace(3) %35, i32 524
  store i16 %.sroa.0207.0.copyload.6448.i, ptr addrspace(3) %181, align 2, !tbaa.struct !27
  %.not522.i = icmp eq i32 %5, 7
  br i1 %.not522.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.thread.i
  %182 = getelementptr i8, ptr addrspace(3) %35, i32 526
  store i16 0, ptr addrspace(3) %182, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6451.i
  %183 = or disjoint i64 %48, 7
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %183
  %.sroa.0207.0.copyload.7453.i = load i16, ptr %184, align 2, !tbaa.struct !27
  %185 = getelementptr i8, ptr addrspace(3) %35, i32 526
  store i16 %.sroa.0207.0.copyload.7453.i, ptr addrspace(3) %185, align 2, !tbaa.struct !27
  %186 = icmp ugt i32 %5, 8
  br i1 %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.thread.i
  %187 = getelementptr i8, ptr addrspace(3) %35, i32 528
  store i16 0, ptr addrspace(3) %187, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7456.i
  %188 = or disjoint i64 %48, 8
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %188
  %.sroa.0207.0.copyload.8.i = load i16, ptr %189, align 16, !tbaa.struct !27
  %190 = getelementptr i8, ptr addrspace(3) %35, i32 528
  store i16 %.sroa.0207.0.copyload.8.i, ptr addrspace(3) %190, align 2, !tbaa.struct !27
  %.not523.i = icmp eq i32 %5, 9
  br i1 %.not523.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i
  %191 = getelementptr i8, ptr addrspace(3) %35, i32 530
  store i16 0, ptr addrspace(3) %191, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i
  %192 = or disjoint i64 %48, 9
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %192
  %.sroa.0207.0.copyload.9.i = load i16, ptr %193, align 2, !tbaa.struct !27
  %194 = getelementptr i8, ptr addrspace(3) %35, i32 530
  store i16 %.sroa.0207.0.copyload.9.i, ptr addrspace(3) %194, align 2, !tbaa.struct !27
  %195 = icmp ugt i32 %5, 10
  br i1 %195, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i
  %196 = getelementptr i8, ptr addrspace(3) %35, i32 532
  store i16 0, ptr addrspace(3) %196, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i
  %197 = or disjoint i64 %48, 10
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %197
  %.sroa.0207.0.copyload.10.i = load i16, ptr %198, align 4, !tbaa.struct !27
  %199 = getelementptr i8, ptr addrspace(3) %35, i32 532
  store i16 %.sroa.0207.0.copyload.10.i, ptr addrspace(3) %199, align 2, !tbaa.struct !27
  %.not524.i = icmp eq i32 %5, 11
  br i1 %.not524.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i
  %200 = getelementptr i8, ptr addrspace(3) %35, i32 534
  store i16 0, ptr addrspace(3) %200, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i
  %201 = or disjoint i64 %48, 11
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %201
  %.sroa.0207.0.copyload.11.i = load i16, ptr %202, align 2, !tbaa.struct !27
  %203 = getelementptr i8, ptr addrspace(3) %35, i32 534
  store i16 %.sroa.0207.0.copyload.11.i, ptr addrspace(3) %203, align 2, !tbaa.struct !27
  %204 = icmp ugt i32 %5, 12
  br i1 %204, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i
  %205 = getelementptr i8, ptr addrspace(3) %35, i32 536
  store i16 0, ptr addrspace(3) %205, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i
  %206 = or disjoint i64 %48, 12
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %206
  %.sroa.0207.0.copyload.12.i = load i16, ptr %207, align 8, !tbaa.struct !27
  %208 = getelementptr i8, ptr addrspace(3) %35, i32 536
  store i16 %.sroa.0207.0.copyload.12.i, ptr addrspace(3) %208, align 2, !tbaa.struct !27
  %.not525.i = icmp eq i32 %5, 13
  br i1 %.not525.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i
  %209 = getelementptr i8, ptr addrspace(3) %35, i32 538
  store i16 0, ptr addrspace(3) %209, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i
  %210 = or disjoint i64 %48, 13
  %211 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %210
  %.sroa.0207.0.copyload.13.i = load i16, ptr %211, align 2, !tbaa.struct !27
  %212 = getelementptr i8, ptr addrspace(3) %35, i32 538
  store i16 %.sroa.0207.0.copyload.13.i, ptr addrspace(3) %212, align 2, !tbaa.struct !27
  %213 = icmp ugt i32 %5, 14
  br i1 %213, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i
  %214 = getelementptr i8, ptr addrspace(3) %35, i32 540
  store i16 0, ptr addrspace(3) %214, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i
  %215 = or disjoint i64 %48, 14
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %215
  %.sroa.0207.0.copyload.14.i = load i16, ptr %216, align 4, !tbaa.struct !27
  %217 = getelementptr i8, ptr addrspace(3) %35, i32 540
  store i16 %.sroa.0207.0.copyload.14.i, ptr addrspace(3) %217, align 2, !tbaa.struct !27
  %.not526.i = icmp eq i32 %5, 15
  br i1 %.not526.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i
  %218 = getelementptr i8, ptr addrspace(3) %35, i32 542
  store i16 0, ptr addrspace(3) %218, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i
  %219 = or disjoint i64 %48, 15
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %219
  %.sroa.0207.0.copyload.15.i = load i16, ptr %220, align 2, !tbaa.struct !27
  %221 = getelementptr i8, ptr addrspace(3) %35, i32 542
  store i16 %.sroa.0207.0.copyload.15.i, ptr addrspace(3) %221, align 2, !tbaa.struct !27
  %222 = icmp ugt i32 %5, 16
  br i1 %222, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.thread.i
  %223 = getelementptr i8, ptr addrspace(3) %35, i32 544
  store i16 0, ptr addrspace(3) %223, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i
  %224 = or disjoint i64 %48, 16
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %224
  %.sroa.0207.0.copyload.16.i = load i16, ptr %225, align 32, !tbaa.struct !27
  %226 = getelementptr i8, ptr addrspace(3) %35, i32 544
  store i16 %.sroa.0207.0.copyload.16.i, ptr addrspace(3) %226, align 2, !tbaa.struct !27
  %.not527.i = icmp eq i32 %5, 17
  br i1 %.not527.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.thread.i
  %227 = getelementptr i8, ptr addrspace(3) %35, i32 546
  store i16 0, ptr addrspace(3) %227, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.16.i
  %228 = or disjoint i64 %48, 17
  %229 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %228
  %.sroa.0207.0.copyload.17.i = load i16, ptr %229, align 2, !tbaa.struct !27
  %230 = getelementptr i8, ptr addrspace(3) %35, i32 546
  store i16 %.sroa.0207.0.copyload.17.i, ptr addrspace(3) %230, align 2, !tbaa.struct !27
  %231 = icmp ugt i32 %5, 18
  br i1 %231, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.thread.i
  %232 = getelementptr i8, ptr addrspace(3) %35, i32 548
  store i16 0, ptr addrspace(3) %232, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.17.i
  %233 = or disjoint i64 %48, 18
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %233
  %.sroa.0207.0.copyload.18.i = load i16, ptr %234, align 4, !tbaa.struct !27
  %235 = getelementptr i8, ptr addrspace(3) %35, i32 548
  store i16 %.sroa.0207.0.copyload.18.i, ptr addrspace(3) %235, align 2, !tbaa.struct !27
  %.not528.i = icmp eq i32 %5, 19
  br i1 %.not528.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.thread.i
  %236 = getelementptr i8, ptr addrspace(3) %35, i32 550
  store i16 0, ptr addrspace(3) %236, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.18.i
  %237 = or disjoint i64 %48, 19
  %238 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %237
  %.sroa.0207.0.copyload.19.i = load i16, ptr %238, align 2, !tbaa.struct !27
  %239 = getelementptr i8, ptr addrspace(3) %35, i32 550
  store i16 %.sroa.0207.0.copyload.19.i, ptr addrspace(3) %239, align 2, !tbaa.struct !27
  %240 = icmp ugt i32 %5, 20
  br i1 %240, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.thread.i
  %241 = getelementptr i8, ptr addrspace(3) %35, i32 552
  store i16 0, ptr addrspace(3) %241, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.19.i
  %242 = or disjoint i64 %48, 20
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %242
  %.sroa.0207.0.copyload.20.i = load i16, ptr %243, align 8, !tbaa.struct !27
  %244 = getelementptr i8, ptr addrspace(3) %35, i32 552
  store i16 %.sroa.0207.0.copyload.20.i, ptr addrspace(3) %244, align 2, !tbaa.struct !27
  %.not529.i = icmp eq i32 %5, 21
  br i1 %.not529.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.thread.i
  %245 = getelementptr i8, ptr addrspace(3) %35, i32 554
  store i16 0, ptr addrspace(3) %245, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.20.i
  %246 = or disjoint i64 %48, 21
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %246
  %.sroa.0207.0.copyload.21.i = load i16, ptr %247, align 2, !tbaa.struct !27
  %248 = getelementptr i8, ptr addrspace(3) %35, i32 554
  store i16 %.sroa.0207.0.copyload.21.i, ptr addrspace(3) %248, align 2, !tbaa.struct !27
  %249 = icmp ugt i32 %5, 22
  br i1 %249, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.thread.i
  %250 = getelementptr i8, ptr addrspace(3) %35, i32 556
  store i16 0, ptr addrspace(3) %250, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.21.i
  %251 = or disjoint i64 %48, 22
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %251
  %.sroa.0207.0.copyload.22.i = load i16, ptr %252, align 4, !tbaa.struct !27
  %253 = getelementptr i8, ptr addrspace(3) %35, i32 556
  store i16 %.sroa.0207.0.copyload.22.i, ptr addrspace(3) %253, align 2, !tbaa.struct !27
  %.not530.i = icmp eq i32 %5, 23
  br i1 %.not530.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.thread.i
  %254 = getelementptr i8, ptr addrspace(3) %35, i32 558
  store i16 0, ptr addrspace(3) %254, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.22.i
  %255 = or disjoint i64 %48, 23
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %255
  %.sroa.0207.0.copyload.23.i = load i16, ptr %256, align 2, !tbaa.struct !27
  %257 = getelementptr i8, ptr addrspace(3) %35, i32 558
  store i16 %.sroa.0207.0.copyload.23.i, ptr addrspace(3) %257, align 2, !tbaa.struct !27
  %258 = icmp ugt i32 %5, 24
  br i1 %258, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.thread.i
  %259 = getelementptr i8, ptr addrspace(3) %35, i32 560
  store i16 0, ptr addrspace(3) %259, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.23.i
  %260 = or disjoint i64 %48, 24
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %260
  %.sroa.0207.0.copyload.24.i = load i16, ptr %261, align 16, !tbaa.struct !27
  %262 = getelementptr i8, ptr addrspace(3) %35, i32 560
  store i16 %.sroa.0207.0.copyload.24.i, ptr addrspace(3) %262, align 2, !tbaa.struct !27
  %.not531.i = icmp eq i32 %5, 25
  br i1 %.not531.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.thread.i
  %263 = getelementptr i8, ptr addrspace(3) %35, i32 562
  store i16 0, ptr addrspace(3) %263, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.24.i
  %264 = or disjoint i64 %48, 25
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %264
  %.sroa.0207.0.copyload.25.i = load i16, ptr %265, align 2, !tbaa.struct !27
  %266 = getelementptr i8, ptr addrspace(3) %35, i32 562
  store i16 %.sroa.0207.0.copyload.25.i, ptr addrspace(3) %266, align 2, !tbaa.struct !27
  %267 = icmp ugt i32 %5, 26
  br i1 %267, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.thread.i
  %268 = getelementptr i8, ptr addrspace(3) %35, i32 564
  store i16 0, ptr addrspace(3) %268, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.25.i
  %269 = or disjoint i64 %48, 26
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %269
  %.sroa.0207.0.copyload.26.i = load i16, ptr %270, align 4, !tbaa.struct !27
  %271 = getelementptr i8, ptr addrspace(3) %35, i32 564
  store i16 %.sroa.0207.0.copyload.26.i, ptr addrspace(3) %271, align 2, !tbaa.struct !27
  %.not532.i = icmp eq i32 %5, 27
  br i1 %.not532.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.thread.i
  %272 = getelementptr i8, ptr addrspace(3) %35, i32 566
  store i16 0, ptr addrspace(3) %272, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.26.i
  %273 = or disjoint i64 %48, 27
  %274 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %273
  %.sroa.0207.0.copyload.27.i = load i16, ptr %274, align 2, !tbaa.struct !27
  %275 = getelementptr i8, ptr addrspace(3) %35, i32 566
  store i16 %.sroa.0207.0.copyload.27.i, ptr addrspace(3) %275, align 2, !tbaa.struct !27
  %276 = icmp ugt i32 %5, 28
  br i1 %276, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.thread.i
  %277 = getelementptr i8, ptr addrspace(3) %35, i32 568
  store i16 0, ptr addrspace(3) %277, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.27.i
  %278 = or disjoint i64 %48, 28
  %279 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %278
  %.sroa.0207.0.copyload.28.i = load i16, ptr %279, align 8, !tbaa.struct !27
  %280 = getelementptr i8, ptr addrspace(3) %35, i32 568
  store i16 %.sroa.0207.0.copyload.28.i, ptr addrspace(3) %280, align 2, !tbaa.struct !27
  %.not533.i = icmp eq i32 %5, 29
  br i1 %.not533.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.thread.i
  %281 = getelementptr i8, ptr addrspace(3) %35, i32 570
  store i16 0, ptr addrspace(3) %281, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.28.i
  %282 = or disjoint i64 %48, 29
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %282
  %.sroa.0207.0.copyload.29.i = load i16, ptr %283, align 2, !tbaa.struct !27
  %284 = getelementptr i8, ptr addrspace(3) %35, i32 570
  store i16 %.sroa.0207.0.copyload.29.i, ptr addrspace(3) %284, align 2, !tbaa.struct !27
  %285 = icmp ugt i32 %5, 30
  br i1 %285, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.thread.i
  %286 = getelementptr i8, ptr addrspace(3) %35, i32 572
  store i16 0, ptr addrspace(3) %286, align 2, !tbaa.struct !27
  br label %.split.us.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.29.i
  %287 = or disjoint i64 %48, 30
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %287
  %.sroa.0207.0.copyload.30.i = load i16, ptr %288, align 4, !tbaa.struct !27
  %289 = getelementptr i8, ptr addrspace(3) %35, i32 572
  store i16 %.sroa.0207.0.copyload.30.i, ptr addrspace(3) %289, align 2, !tbaa.struct !27
  %.not534.i = icmp eq i32 %5, 31
  br i1 %.not534.i, label %.split.us.i, label %290

290:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.30.i
  %291 = or disjoint i64 %48, 31
  %292 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %291
  %.sroa.0207.0.copyload.31.i = load i16, ptr %292, align 2, !tbaa.struct !27
  br label %.split.us.i

.preheader406.i:                                  ; preds = %.split413.us.i, %.split.us.7.i
  %293 = phi i64 [ 0, %.split.us.7.i ], [ %303, %.split413.us.i ]
  %294 = icmp slt i64 %293, %46
  %295 = shl i64 %293, 4
  %.tr400.i = trunc i64 %293 to i32
  %296 = shl i32 %.tr400.i, 4
  %297 = sext i32 %296 to i64
  %298 = add nsw i64 %297, %137
  %.fr414.i = freeze i1 %294
  br i1 %.fr414.i, label %.preheader406.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i: ; preds = %.preheader406.i
  %.tr470.i = trunc i64 %293 to i32
  %299 = shl i32 %.tr470.i, 5
  %300 = add i32 %299, 1024
  %scevgep457.i = getelementptr i8, ptr addrspace(3) %35, i32 %300
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep457.i, i8 0, i32 32, i1 false)
  br label %.split413.us.i

.preheader406.split.preheader.i:                  ; preds = %.preheader406.i
  br i1 %138, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i: ; preds = %.preheader406.split.preheader.i
  %301 = trunc i64 %295 to i32
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %301
  store i16 0, ptr addrspace(3) %302, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

.split413.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.us.preheader.i
  %303 = add nuw nsw i64 %293, 1
  %exitcond.not.i = icmp eq i64 %303, 32
  br i1 %exitcond.not.i, label %425, label %.preheader406.i, !llvm.loop !34

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i: ; preds = %.preheader406.split.preheader.i
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %298
  %.sroa.0196.0.copyload.i = load i16, ptr %304, align 32, !tbaa.struct !27
  %305 = trunc i64 %295 to i32
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %305
  store i16 %.sroa.0196.0.copyload.i, ptr addrspace(3) %306, align 2, !tbaa.struct !27
  br i1 %139, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.thread.i
  %307 = trunc i64 %295 to i32
  %308 = or disjoint i32 %307, 1
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %308
  store i16 0, ptr addrspace(3) %309, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.i
  %310 = or disjoint i64 %298, 1
  %311 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %310
  %.sroa.0196.0.copyload.1.i = load i16, ptr %311, align 2, !tbaa.struct !27
  %312 = trunc i64 %295 to i32
  %313 = or disjoint i32 %312, 1
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %313
  store i16 %.sroa.0196.0.copyload.1.i, ptr addrspace(3) %314, align 2, !tbaa.struct !27
  br i1 %140, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.thread.i
  %315 = trunc i64 %295 to i32
  %316 = or disjoint i32 %315, 2
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %316
  store i16 0, ptr addrspace(3) %317, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.1.i
  %318 = or disjoint i64 %298, 2
  %319 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %318
  %.sroa.0196.0.copyload.2.i = load i16, ptr %319, align 4, !tbaa.struct !27
  %320 = trunc i64 %295 to i32
  %321 = or disjoint i32 %320, 2
  %322 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %321
  store i16 %.sroa.0196.0.copyload.2.i, ptr addrspace(3) %322, align 2, !tbaa.struct !27
  br i1 %141, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.thread.i
  %323 = trunc i64 %295 to i32
  %324 = or disjoint i32 %323, 3
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %324
  store i16 0, ptr addrspace(3) %325, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.2.i
  %326 = or disjoint i64 %298, 3
  %327 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %326
  %.sroa.0196.0.copyload.3.i = load i16, ptr %327, align 2, !tbaa.struct !27
  %328 = trunc i64 %295 to i32
  %329 = or disjoint i32 %328, 3
  %330 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %329
  store i16 %.sroa.0196.0.copyload.3.i, ptr addrspace(3) %330, align 2, !tbaa.struct !27
  br i1 %142, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.thread.i
  %331 = trunc i64 %295 to i32
  %332 = or disjoint i32 %331, 4
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %332
  store i16 0, ptr addrspace(3) %333, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.3.i
  %334 = or disjoint i64 %298, 4
  %335 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %334
  %.sroa.0196.0.copyload.4.i = load i16, ptr %335, align 8, !tbaa.struct !27
  %336 = trunc i64 %295 to i32
  %337 = or disjoint i32 %336, 4
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %337
  store i16 %.sroa.0196.0.copyload.4.i, ptr addrspace(3) %338, align 2, !tbaa.struct !27
  br i1 %143, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.thread.i
  %339 = trunc i64 %295 to i32
  %340 = or disjoint i32 %339, 5
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %340
  store i16 0, ptr addrspace(3) %341, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.4.i
  %342 = or disjoint i64 %298, 5
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %342
  %.sroa.0196.0.copyload.5.i = load i16, ptr %343, align 2, !tbaa.struct !27
  %344 = trunc i64 %295 to i32
  %345 = or disjoint i32 %344, 5
  %346 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %345
  store i16 %.sroa.0196.0.copyload.5.i, ptr addrspace(3) %346, align 2, !tbaa.struct !27
  br i1 %144, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.thread.i
  %347 = trunc i64 %295 to i32
  %348 = or disjoint i32 %347, 6
  %349 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %348
  store i16 0, ptr addrspace(3) %349, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.5.i
  %350 = or disjoint i64 %298, 6
  %351 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %350
  %.sroa.0196.0.copyload.6.i = load i16, ptr %351, align 4, !tbaa.struct !27
  %352 = trunc i64 %295 to i32
  %353 = or disjoint i32 %352, 6
  %354 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %353
  store i16 %.sroa.0196.0.copyload.6.i, ptr addrspace(3) %354, align 2, !tbaa.struct !27
  br i1 %145, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.thread.i
  %355 = trunc i64 %295 to i32
  %356 = or disjoint i32 %355, 7
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %356
  store i16 0, ptr addrspace(3) %357, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.6.i
  %358 = or disjoint i64 %298, 7
  %359 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %358
  %.sroa.0196.0.copyload.7.i = load i16, ptr %359, align 2, !tbaa.struct !27
  %360 = trunc i64 %295 to i32
  %361 = or disjoint i32 %360, 7
  %362 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %361
  store i16 %.sroa.0196.0.copyload.7.i, ptr addrspace(3) %362, align 2, !tbaa.struct !27
  br i1 %146, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.thread.i
  %363 = trunc i64 %295 to i32
  %364 = or disjoint i32 %363, 8
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %364
  store i16 0, ptr addrspace(3) %365, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.7.i
  %366 = or disjoint i64 %298, 8
  %367 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %366
  %.sroa.0196.0.copyload.8.i = load i16, ptr %367, align 16, !tbaa.struct !27
  %368 = trunc i64 %295 to i32
  %369 = or disjoint i32 %368, 8
  %370 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %369
  store i16 %.sroa.0196.0.copyload.8.i, ptr addrspace(3) %370, align 2, !tbaa.struct !27
  br i1 %147, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.thread.i
  %371 = trunc i64 %295 to i32
  %372 = or disjoint i32 %371, 9
  %373 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %372
  store i16 0, ptr addrspace(3) %373, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.8.i
  %374 = or disjoint i64 %298, 9
  %375 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %374
  %.sroa.0196.0.copyload.9.i = load i16, ptr %375, align 2, !tbaa.struct !27
  %376 = trunc i64 %295 to i32
  %377 = or disjoint i32 %376, 9
  %378 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %377
  store i16 %.sroa.0196.0.copyload.9.i, ptr addrspace(3) %378, align 2, !tbaa.struct !27
  br i1 %148, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.thread.i
  %379 = trunc i64 %295 to i32
  %380 = or disjoint i32 %379, 10
  %381 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %380
  store i16 0, ptr addrspace(3) %381, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.9.i
  %382 = or disjoint i64 %298, 10
  %383 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %382
  %.sroa.0196.0.copyload.10.i = load i16, ptr %383, align 4, !tbaa.struct !27
  %384 = trunc i64 %295 to i32
  %385 = or disjoint i32 %384, 10
  %386 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %385
  store i16 %.sroa.0196.0.copyload.10.i, ptr addrspace(3) %386, align 2, !tbaa.struct !27
  br i1 %149, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.thread.i
  %387 = trunc i64 %295 to i32
  %388 = or disjoint i32 %387, 11
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %388
  store i16 0, ptr addrspace(3) %389, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.10.i
  %390 = or disjoint i64 %298, 11
  %391 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %390
  %.sroa.0196.0.copyload.11.i = load i16, ptr %391, align 2, !tbaa.struct !27
  %392 = trunc i64 %295 to i32
  %393 = or disjoint i32 %392, 11
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %393
  store i16 %.sroa.0196.0.copyload.11.i, ptr addrspace(3) %394, align 2, !tbaa.struct !27
  br i1 %150, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.thread.i
  %395 = trunc i64 %295 to i32
  %396 = or disjoint i32 %395, 12
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %396
  store i16 0, ptr addrspace(3) %397, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.11.i
  %398 = or disjoint i64 %298, 12
  %399 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %398
  %.sroa.0196.0.copyload.12.i = load i16, ptr %399, align 8, !tbaa.struct !27
  %400 = trunc i64 %295 to i32
  %401 = or disjoint i32 %400, 12
  %402 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %401
  store i16 %.sroa.0196.0.copyload.12.i, ptr addrspace(3) %402, align 2, !tbaa.struct !27
  br i1 %151, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.thread.i
  %403 = trunc i64 %295 to i32
  %404 = or disjoint i32 %403, 13
  %405 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %404
  store i16 0, ptr addrspace(3) %405, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.12.i
  %406 = or disjoint i64 %298, 13
  %407 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %406
  %.sroa.0196.0.copyload.13.i = load i16, ptr %407, align 2, !tbaa.struct !27
  %408 = trunc i64 %295 to i32
  %409 = or disjoint i32 %408, 13
  %410 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %409
  store i16 %.sroa.0196.0.copyload.13.i, ptr addrspace(3) %410, align 2, !tbaa.struct !27
  br i1 %152, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.thread.i
  %411 = trunc i64 %295 to i32
  %412 = or disjoint i32 %411, 14
  %413 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %412
  store i16 0, ptr addrspace(3) %413, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.13.i
  %414 = or disjoint i64 %298, 14
  %415 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %414
  %.sroa.0196.0.copyload.14.i = load i16, ptr %415, align 4, !tbaa.struct !27
  %416 = trunc i64 %295 to i32
  %417 = or disjoint i32 %416, 14
  %418 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %417
  store i16 %.sroa.0196.0.copyload.14.i, ptr addrspace(3) %418, align 2, !tbaa.struct !27
  br i1 %153, label %419, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

419:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i
  %420 = or disjoint i64 %298, 15
  %421 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %420
  %.sroa.0196.0.copyload.15.i = load i16, ptr %421, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.15.i: ; preds = %419, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i
  %.sroa.0198.2.15.i = phi i16 [ %.sroa.0196.0.copyload.15.i, %419 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i.14.thread.i ]
  %422 = trunc i64 %295 to i32
  %423 = or disjoint i32 %422, 15
  %424 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %423
  store i16 %.sroa.0198.2.15.i, ptr addrspace(3) %424, align 2, !tbaa.struct !27
  br label %.split413.us.i

425:                                              ; preds = %.split413.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %426 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %427 = icmp eq i64 %426, 0
  call void @llvm.assume(i1 %427)
  %428 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %429 = icmp eq i64 %428, 0
  call void @llvm.assume(i1 %429)
  %430 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %431 = icmp eq i64 %430, 0
  call void @llvm.assume(i1 %431)
  br label %457

432:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %433 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %434 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %435 = icmp eq i64 %434, 0
  call void @llvm.assume(i1 %435)
  %436 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %437 = icmp eq i64 %436, 0
  call void @llvm.assume(i1 %437)
  %438 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %439 = icmp eq i64 %438, 0
  call void @llvm.assume(i1 %439)
  %440 = sext i32 %433 to i64
  %441 = icmp slt i32 %4, 1
  %442 = icmp ugt i32 %4, 1
  %443 = icmp ugt i32 %4, 2
  %444 = icmp ugt i32 %4, 3
  %445 = icmp ugt i32 %4, 4
  %446 = icmp ugt i32 %4, 5
  %447 = icmp ugt i32 %4, 6
  %448 = icmp ugt i32 %4, 7
  %449 = icmp ugt i32 %4, 8
  %450 = icmp ugt i32 %4, 9
  %451 = icmp ugt i32 %4, 10
  %452 = icmp ugt i32 %4, 11
  %453 = icmp ugt i32 %4, 12
  %454 = icmp ugt i32 %4, 13
  %455 = icmp ugt i32 %4, 14
  %456 = icmp ugt i32 %4, 15
  br label %.preheader.i

457:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %425
  %458 = phi i64 [ 0, %425 ], [ %465, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %459 = and i64 %458, 15
  %460 = trunc i64 %458 to i32
  %461 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !23
  %463 = shl nuw i64 %458, 1
  %464 = and i64 %463, 224
  br label %466

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %517, ptr addrspace(3) %461, align 4, !tbaa !23
  %465 = add nuw nsw i64 %458, 1
  %exitcond466.not.i = icmp eq i64 %465, 128
  br i1 %exitcond466.not.i, label %432, label %457, !llvm.loop !35

466:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %457
  %467 = phi i64 [ 0, %457 ], [ %518, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %468 = phi float [ %462, %457 ], [ %517, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %469 = add nuw nsw i64 %467, %464
  %470 = trunc i64 %469 to i32
  %471 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %47, i32 %470
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %471, align 2, !tbaa.struct !27
  %472 = shl nuw nsw i64 %467, 4
  %473 = or disjoint i64 %472, %459
  %474 = trunc i64 %473 to i32
  %475 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %474
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %475, align 2, !tbaa.struct !27
  %476 = zext i16 %.sroa.0179.0.copyload.i to i32
  %477 = lshr i32 %476, 10
  %478 = and i32 %477, 31
  %479 = and i32 %476, 1023
  switch i32 %478, label %485 [
    i32 31, label %480
    i32 0, label %487
  ]

480:                                              ; preds = %466
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %481 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not399.i = icmp eq i32 %479, 0
  %482 = select i1 %.not399.i, i32 2139095040, i32 2143289344
  %483 = or disjoint i32 %482, %481
  %484 = bitcast i32 %483 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

485:                                              ; preds = %466
  %486 = or disjoint i32 %479, 1024
  br label %487

487:                                              ; preds = %485, %466
  %488 = phi i32 [ %486, %485 ], [ %479, %466 ]
  %489 = uitofp i32 %488 to float
  %.not.i = icmp eq i32 %478, 0
  %490 = add nsw i32 %478, -25
  %491 = select i1 %.not.i, i32 -24, i32 %490
  %492 = call float @__ocml_ldexp_f32(float noundef %489, i32 noundef %491) #6
  %493 = fneg contract float %492
  %.not393394.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %494 = select contract i1 %.not393394.i, float %493, float %492
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i: ; preds = %487, %480
  %495 = phi float [ %484, %480 ], [ %494, %487 ]
  %496 = zext i16 %.sroa.0170.0.copyload.i to i32
  %497 = lshr i32 %496, 10
  %498 = and i32 %497, 31
  %499 = and i32 %496, 1023
  switch i32 %498, label %505 [
    i32 31, label %500
    i32 0, label %507
  ]

500:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %501 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not398.i = icmp eq i32 %499, 0
  %502 = select i1 %.not398.i, i32 2139095040, i32 2143289344
  %503 = or disjoint i32 %502, %501
  %504 = bitcast i32 %503 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

505:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %506 = or disjoint i32 %499, 1024
  br label %507

507:                                              ; preds = %505, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %508 = phi i32 [ %506, %505 ], [ %499, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i ]
  %509 = uitofp i32 %508 to float
  %.not395.i = icmp eq i32 %498, 0
  %510 = add nsw i32 %498, -25
  %511 = select i1 %.not395.i, i32 -24, i32 %510
  %512 = call float @__ocml_ldexp_f32(float noundef %509, i32 noundef %511) #6
  %513 = fneg contract float %512
  %.not396397.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %514 = select contract i1 %.not396397.i, float %513, float %512
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %507, %500
  %515 = phi float [ %504, %500 ], [ %514, %507 ]
  %516 = fmul contract float %495, %515
  %517 = fadd contract float %468, %516
  %518 = add nuw nsw i64 %467, 1
  %exitcond465.not.i = icmp eq i64 %518, 32
  br i1 %exitcond465.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, label %466, !llvm.loop !36

.preheader.i:                                     ; preds = %.split416.us.i, %432
  %519 = phi i64 [ 0, %432 ], [ %525, %.split416.us.i ]
  %520 = icmp sge i64 %519, %45
  %521 = shl i64 %519, 4
  %.tr392.i = trunc i64 %519 to i32
  %522 = shl i32 %.tr392.i, 4
  %523 = sext i32 %522 to i64
  %524 = add nsw i64 %523, %440
  %brmerge.i = select i1 %520, i1 true, i1 %441
  br i1 %brmerge.i, label %.split416.us.i, label %.preheader.split.1.i

.split416.us.i:                                   ; preds = %614, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %525 = add i64 %519, 1
  %exitcond468.not.i = icmp eq i64 %525, 8
  br i1 %exitcond468.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %526 = trunc i64 %521 to i32
  %527 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %526
  %528 = load float, ptr addrspace(3) %527, align 4, !tbaa !23
  %529 = getelementptr inbounds float, ptr %9, i64 %524
  store float %528, ptr %529, align 32, !tbaa !23
  br i1 %442, label %.preheader.split.2.i, label %.split416.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %530 = trunc i64 %521 to i32
  %531 = or disjoint i32 %530, 1
  %532 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %531
  %533 = load float, ptr addrspace(3) %532, align 4, !tbaa !23
  %534 = or disjoint i64 %524, 1
  %535 = getelementptr inbounds float, ptr %9, i64 %534
  store float %533, ptr %535, align 4, !tbaa !23
  br i1 %443, label %.preheader.split.3.i, label %.split416.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %536 = trunc i64 %521 to i32
  %537 = or disjoint i32 %536, 2
  %538 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %537
  %539 = load float, ptr addrspace(3) %538, align 4, !tbaa !23
  %540 = or disjoint i64 %524, 2
  %541 = getelementptr inbounds float, ptr %9, i64 %540
  store float %539, ptr %541, align 8, !tbaa !23
  br i1 %444, label %.preheader.split.4.i, label %.split416.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %542 = trunc i64 %521 to i32
  %543 = or disjoint i32 %542, 3
  %544 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %543
  %545 = load float, ptr addrspace(3) %544, align 4, !tbaa !23
  %546 = or disjoint i64 %524, 3
  %547 = getelementptr inbounds float, ptr %9, i64 %546
  store float %545, ptr %547, align 4, !tbaa !23
  br i1 %445, label %.preheader.split.5.i, label %.split416.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %548 = trunc i64 %521 to i32
  %549 = or disjoint i32 %548, 4
  %550 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %549
  %551 = load float, ptr addrspace(3) %550, align 4, !tbaa !23
  %552 = or disjoint i64 %524, 4
  %553 = getelementptr inbounds float, ptr %9, i64 %552
  store float %551, ptr %553, align 16, !tbaa !23
  br i1 %446, label %.preheader.split.6.i, label %.split416.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %554 = trunc i64 %521 to i32
  %555 = or disjoint i32 %554, 5
  %556 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %555
  %557 = load float, ptr addrspace(3) %556, align 4, !tbaa !23
  %558 = or disjoint i64 %524, 5
  %559 = getelementptr inbounds float, ptr %9, i64 %558
  store float %557, ptr %559, align 4, !tbaa !23
  br i1 %447, label %.preheader.split.7.i, label %.split416.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %560 = trunc i64 %521 to i32
  %561 = or disjoint i32 %560, 6
  %562 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %561
  %563 = load float, ptr addrspace(3) %562, align 4, !tbaa !23
  %564 = or disjoint i64 %524, 6
  %565 = getelementptr inbounds float, ptr %9, i64 %564
  store float %563, ptr %565, align 8, !tbaa !23
  br i1 %448, label %.preheader.split.8.i, label %.split416.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %566 = trunc i64 %521 to i32
  %567 = or disjoint i32 %566, 7
  %568 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %567
  %569 = load float, ptr addrspace(3) %568, align 4, !tbaa !23
  %570 = or disjoint i64 %524, 7
  %571 = getelementptr inbounds float, ptr %9, i64 %570
  store float %569, ptr %571, align 4, !tbaa !23
  br i1 %449, label %.preheader.split.9.i, label %.split416.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %572 = trunc i64 %521 to i32
  %573 = or disjoint i32 %572, 8
  %574 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %573
  %575 = load float, ptr addrspace(3) %574, align 4, !tbaa !23
  %576 = or disjoint i64 %524, 8
  %577 = getelementptr inbounds float, ptr %9, i64 %576
  store float %575, ptr %577, align 32, !tbaa !23
  br i1 %450, label %.preheader.split.10.i, label %.split416.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %578 = trunc i64 %521 to i32
  %579 = or disjoint i32 %578, 9
  %580 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %579
  %581 = load float, ptr addrspace(3) %580, align 4, !tbaa !23
  %582 = or disjoint i64 %524, 9
  %583 = getelementptr inbounds float, ptr %9, i64 %582
  store float %581, ptr %583, align 4, !tbaa !23
  br i1 %451, label %.preheader.split.11.i, label %.split416.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %584 = trunc i64 %521 to i32
  %585 = or disjoint i32 %584, 10
  %586 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %585
  %587 = load float, ptr addrspace(3) %586, align 4, !tbaa !23
  %588 = or disjoint i64 %524, 10
  %589 = getelementptr inbounds float, ptr %9, i64 %588
  store float %587, ptr %589, align 8, !tbaa !23
  br i1 %452, label %.preheader.split.12.i, label %.split416.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %590 = trunc i64 %521 to i32
  %591 = or disjoint i32 %590, 11
  %592 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %591
  %593 = load float, ptr addrspace(3) %592, align 4, !tbaa !23
  %594 = or disjoint i64 %524, 11
  %595 = getelementptr inbounds float, ptr %9, i64 %594
  store float %593, ptr %595, align 4, !tbaa !23
  br i1 %453, label %.preheader.split.13.i, label %.split416.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %596 = trunc i64 %521 to i32
  %597 = or disjoint i32 %596, 12
  %598 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %597
  %599 = load float, ptr addrspace(3) %598, align 4, !tbaa !23
  %600 = or disjoint i64 %524, 12
  %601 = getelementptr inbounds float, ptr %9, i64 %600
  store float %599, ptr %601, align 16, !tbaa !23
  br i1 %454, label %.preheader.split.14.i, label %.split416.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %602 = trunc i64 %521 to i32
  %603 = or disjoint i32 %602, 13
  %604 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %603
  %605 = load float, ptr addrspace(3) %604, align 4, !tbaa !23
  %606 = or disjoint i64 %524, 13
  %607 = getelementptr inbounds float, ptr %9, i64 %606
  store float %605, ptr %607, align 4, !tbaa !23
  br i1 %455, label %.preheader.split.15.i, label %.split416.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %608 = trunc i64 %521 to i32
  %609 = or disjoint i32 %608, 14
  %610 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %609
  %611 = load float, ptr addrspace(3) %610, align 4, !tbaa !23
  %612 = or disjoint i64 %524, 14
  %613 = getelementptr inbounds float, ptr %9, i64 %612
  store float %611, ptr %613, align 8, !tbaa !23
  br i1 %456, label %614, label %.split416.us.i

614:                                              ; preds = %.preheader.split.15.i
  %615 = trunc i64 %521 to i32
  %616 = or disjoint i32 %615, 15
  %617 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %616
  %618 = load float, ptr addrspace(3) %617, align 4, !tbaa !23
  %619 = or disjoint i64 %524, 15
  %620 = getelementptr inbounds float, ptr %9, i64 %619
  store float %618, ptr %620, align 4, !tbaa !23
  br label %.split416.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %.split416.us.i
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="1,1" }
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
!37 = distinct !{!37, !31}
;----------------- End AdaptiveCpp IR dump ---------------
