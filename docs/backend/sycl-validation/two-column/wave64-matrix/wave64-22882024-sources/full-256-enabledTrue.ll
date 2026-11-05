;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-7bb56v60/kernel.cpp"
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
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 8388607
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 256
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.lr.ph.i

34:                                               ; preds = %6
  %35 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %36 = icmp eq i64 %35, 0
  call void @llvm.assume(i1 %36)
  %37 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %38 = icmp eq i64 %37, 0
  call void @llvm.assume(i1 %38)
  %39 = sext i32 %3 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = zext i32 %30 to i64
  %44 = icmp sgt i32 %5, 0
  %45 = icmp ugt i32 %5, 1
  %46 = icmp ugt i32 %5, 2
  %47 = icmp ugt i32 %5, 3
  %48 = icmp ugt i32 %5, 4
  %49 = icmp ugt i32 %5, 5
  %50 = icmp ugt i32 %5, 6
  %51 = icmp ugt i32 %5, 7
  %52 = icmp ugt i32 %5, 8
  %53 = icmp ugt i32 %5, 9
  %54 = icmp ugt i32 %5, 10
  %55 = icmp ugt i32 %5, 11
  %56 = icmp ugt i32 %5, 12
  %57 = icmp ugt i32 %5, 13
  %58 = icmp ugt i32 %5, 14
  %59 = icmp ugt i32 %5, 15
  br label %.preheader553.i

.preheader553.i:                                  ; preds = %.split.us.i, %34
  %60 = phi i64 [ 0, %34 ], [ %70, %.split.us.i ]
  %61 = icmp slt i64 %60, %39
  %62 = shl i64 %60, 4
  %.tr548.i = trunc i64 %60 to i32
  %63 = shl i32 %.tr548.i, 4
  %64 = sext i32 %63 to i64
  %65 = add nsw i64 %64, %43
  %.fr.i = freeze i1 %61
  br i1 %.fr.i, label %.preheader553.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i: ; preds = %.preheader553.i
  %.tr568.i = trunc i64 %60 to i32
  %66 = shl i32 %.tr568.i, 5
  %67 = add i32 %66, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %67
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep.i, i8 0, i32 32, i1 false)
  br label %.split.us.i

.preheader553.split.preheader.i:                  ; preds = %.preheader553.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i: ; preds = %.preheader553.split.preheader.i
  %68 = trunc i64 %62 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %68
  store i16 0, ptr addrspace(3) %69, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.us.preheader.i
  %70 = add nuw nsw i64 %60, 1
  %exitcond.not.i = icmp eq i64 %70, 8
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader553.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %.preheader553.split.preheader.i
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %65
  %.sroa.0259.0.copyload.i = load i16, ptr %71, align 32, !tbaa.struct !23
  %72 = trunc i64 %62 to i32
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0259.0.copyload.i, ptr addrspace(3) %73, align 2, !tbaa.struct !23
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.thread.i
  %74 = trunc i64 %62 to i32
  %75 = or disjoint i32 %74, 1
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  %77 = or disjoint i64 %65, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0259.0.copyload.1.i = load i16, ptr %78, align 2, !tbaa.struct !23
  %79 = trunc i64 %62 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0259.0.copyload.1.i, ptr addrspace(3) %81, align 2, !tbaa.struct !23
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.thread.i
  %82 = trunc i64 %62 to i32
  %83 = or disjoint i32 %82, 2
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.1.i
  %85 = or disjoint i64 %65, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0259.0.copyload.2.i = load i16, ptr %86, align 4, !tbaa.struct !23
  %87 = trunc i64 %62 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0259.0.copyload.2.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.thread.i
  %90 = trunc i64 %62 to i32
  %91 = or disjoint i32 %90, 3
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.2.i
  %93 = or disjoint i64 %65, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0259.0.copyload.3.i = load i16, ptr %94, align 2, !tbaa.struct !23
  %95 = trunc i64 %62 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0259.0.copyload.3.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.thread.i
  %98 = trunc i64 %62 to i32
  %99 = or disjoint i32 %98, 4
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.3.i
  %101 = or disjoint i64 %65, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0259.0.copyload.4.i = load i16, ptr %102, align 8, !tbaa.struct !23
  %103 = trunc i64 %62 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0259.0.copyload.4.i, ptr addrspace(3) %105, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.thread.i
  %106 = trunc i64 %62 to i32
  %107 = or disjoint i32 %106, 5
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.4.i
  %109 = or disjoint i64 %65, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0259.0.copyload.5.i = load i16, ptr %110, align 2, !tbaa.struct !23
  %111 = trunc i64 %62 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0259.0.copyload.5.i, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.thread.i
  %114 = trunc i64 %62 to i32
  %115 = or disjoint i32 %114, 6
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %115
  store i16 0, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.5.i
  %117 = or disjoint i64 %65, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0259.0.copyload.6.i = load i16, ptr %118, align 4, !tbaa.struct !23
  %119 = trunc i64 %62 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %120
  store i16 %.sroa.0259.0.copyload.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !23
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.thread.i
  %122 = trunc i64 %62 to i32
  %123 = or disjoint i32 %122, 7
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %123
  store i16 0, ptr addrspace(3) %124, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.6.i
  %125 = or disjoint i64 %65, 7
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0259.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !23
  %127 = trunc i64 %62 to i32
  %128 = or disjoint i32 %127, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %128
  store i16 %.sroa.0259.0.copyload.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.thread.i
  %130 = trunc i64 %62 to i32
  %131 = or disjoint i32 %130, 8
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %131
  store i16 0, ptr addrspace(3) %132, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.7.i
  %133 = or disjoint i64 %65, 8
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %133
  %.sroa.0259.0.copyload.8.i = load i16, ptr %134, align 16, !tbaa.struct !23
  %135 = trunc i64 %62 to i32
  %136 = or disjoint i32 %135, 8
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %136
  store i16 %.sroa.0259.0.copyload.8.i, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  br i1 %53, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.thread.i
  %138 = trunc i64 %62 to i32
  %139 = or disjoint i32 %138, 9
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %139
  store i16 0, ptr addrspace(3) %140, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.8.i
  %141 = or disjoint i64 %65, 9
  %142 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %141
  %.sroa.0259.0.copyload.9.i = load i16, ptr %142, align 2, !tbaa.struct !23
  %143 = trunc i64 %62 to i32
  %144 = or disjoint i32 %143, 9
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %144
  store i16 %.sroa.0259.0.copyload.9.i, ptr addrspace(3) %145, align 2, !tbaa.struct !23
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.thread.i
  %146 = trunc i64 %62 to i32
  %147 = or disjoint i32 %146, 10
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %147
  store i16 0, ptr addrspace(3) %148, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.9.i
  %149 = or disjoint i64 %65, 10
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %149
  %.sroa.0259.0.copyload.10.i = load i16, ptr %150, align 4, !tbaa.struct !23
  %151 = trunc i64 %62 to i32
  %152 = or disjoint i32 %151, 10
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %152
  store i16 %.sroa.0259.0.copyload.10.i, ptr addrspace(3) %153, align 2, !tbaa.struct !23
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.thread.i
  %154 = trunc i64 %62 to i32
  %155 = or disjoint i32 %154, 11
  %156 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %155
  store i16 0, ptr addrspace(3) %156, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.10.i
  %157 = or disjoint i64 %65, 11
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %157
  %.sroa.0259.0.copyload.11.i = load i16, ptr %158, align 2, !tbaa.struct !23
  %159 = trunc i64 %62 to i32
  %160 = or disjoint i32 %159, 11
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %160
  store i16 %.sroa.0259.0.copyload.11.i, ptr addrspace(3) %161, align 2, !tbaa.struct !23
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.thread.i
  %162 = trunc i64 %62 to i32
  %163 = or disjoint i32 %162, 12
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %163
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.11.i
  %165 = or disjoint i64 %65, 12
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0259.0.copyload.12.i = load i16, ptr %166, align 8, !tbaa.struct !23
  %167 = trunc i64 %62 to i32
  %168 = or disjoint i32 %167, 12
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %168
  store i16 %.sroa.0259.0.copyload.12.i, ptr addrspace(3) %169, align 2, !tbaa.struct !23
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.thread.i
  %170 = trunc i64 %62 to i32
  %171 = or disjoint i32 %170, 13
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %171
  store i16 0, ptr addrspace(3) %172, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.12.i
  %173 = or disjoint i64 %65, 13
  %174 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %173
  %.sroa.0259.0.copyload.13.i = load i16, ptr %174, align 2, !tbaa.struct !23
  %175 = trunc i64 %62 to i32
  %176 = or disjoint i32 %175, 13
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %176
  store i16 %.sroa.0259.0.copyload.13.i, ptr addrspace(3) %177, align 2, !tbaa.struct !23
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.thread.i
  %178 = trunc i64 %62 to i32
  %179 = or disjoint i32 %178, 14
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %179
  store i16 0, ptr addrspace(3) %180, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.13.i
  %181 = or disjoint i64 %65, 14
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %181
  %.sroa.0259.0.copyload.14.i = load i16, ptr %182, align 4, !tbaa.struct !23
  %183 = trunc i64 %62 to i32
  %184 = or disjoint i32 %183, 14
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %184
  store i16 %.sroa.0259.0.copyload.14.i, ptr addrspace(3) %185, align 2, !tbaa.struct !23
  br i1 %59, label %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

186:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i
  %187 = or disjoint i64 %65, 15
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %187
  %.sroa.0259.0.copyload.15.i = load i16, ptr %188, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.15.i: ; preds = %186, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i
  %.sroa.0261.2.15.i = phi i16 [ %.sroa.0259.0.copyload.15.i, %186 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.14.thread.i ]
  %189 = trunc i64 %62 to i32
  %190 = or disjoint i32 %189, 15
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %190
  store i16 %.sroa.0261.2.15.i, ptr addrspace(3) %191, align 2, !tbaa.struct !23
  br label %.split.us.i

.lr.ph.i:                                         ; preds = %.split.us.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %192 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %193 = icmp eq i64 %192, 0
  call void @llvm.assume(i1 %193)
  %194 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %195 = icmp eq i64 %194, 0
  call void @llvm.assume(i1 %195)
  %196 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %197 = icmp ult i64 %196, 256
  call void @llvm.assume(i1 %197)
  %198 = sext i32 %5 to i64
  %199 = sext i32 %4 to i64
  %200 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %201 = inttoptr i32 %200 to ptr addrspace(3)
  %202 = getelementptr inbounds i8, ptr addrspace(3) %201, i32 768
  %203 = and i64 %196, 15
  %204 = lshr i64 %196, 4
  %205 = icmp slt i64 %204, %198
  %206 = icmp slt i64 %203, %199
  %207 = and i1 %205, %206
  br i1 %207, label %223, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %223, %.lr.ph.i
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %223 ], [ 0, %.lr.ph.i ]
  %208 = trunc i64 %196 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %202, i32 %208
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %209, align 2, !tbaa.struct !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %210 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %211 = icmp eq i64 %210, 0
  call void @llvm.assume(i1 %211)
  %212 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %213 = icmp eq i64 %212, 0
  call void @llvm.assume(i1 %213)
  %214 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %215 = icmp ult i64 %214, 256
  call void @llvm.assume(i1 %215)
  %216 = icmp ult i64 %214, 128
  br i1 %216, label %.lr.ph559.i, label %._crit_edge560.i

.lr.ph559.i:                                      ; preds = %._crit_edge.i
  %217 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %218 = inttoptr i32 %217 to ptr addrspace(3)
  %219 = getelementptr inbounds i8, ptr addrspace(3) %218, i32 512
  %220 = getelementptr inbounds i8, ptr addrspace(3) %218, i32 768
  %221 = and i64 %214, 112
  %222 = and i64 %214, 15
  br label %235

223:                                              ; preds = %.lr.ph.i
  %224 = shl nuw nsw i64 %28, 8
  %225 = and i64 %196, 240
  %226 = or disjoint i64 %225, %224
  %227 = or disjoint i64 %226, %203
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %227
  %.sroa.0248.0.copyload.i = load i16, ptr %228, align 2, !tbaa.struct !23
  br label %._crit_edge.i

._crit_edge560.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %229 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %230 = icmp ult i64 %229, 256
  call void @llvm.assume(i1 %230)
  %231 = icmp eq i64 %229, 0
  br i1 %231, label %439, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %232 = trunc i64 %214 to i32
  %233 = and i32 %232, 127
  %234 = getelementptr inbounds float, ptr addrspace(3) %218, i32 %233
  store float %436, ptr addrspace(3) %234, align 4, !tbaa !32
  br label %._crit_edge560.i

235:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph559.i
  %236 = phi i64 [ 0, %.lr.ph559.i ], [ %437, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %237 = phi float [ 0.000000e+00, %.lr.ph559.i ], [ %436, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %238 = add nuw nsw i64 %236, %221
  %239 = trunc i64 %238 to i32
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %219, i32 %239
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %240, align 2, !tbaa.struct !23
  %241 = shl nuw nsw i64 %236, 4
  %242 = or disjoint i64 %241, %222
  %243 = trunc i64 %242 to i32
  %244 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %220, i32 %243
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %244, align 2, !tbaa.struct !23
  %245 = zext i16 %.sroa.0233.0.copyload.i to i32
  %246 = lshr i32 %245, 10
  %247 = and i32 %246, 31
  %248 = and i32 %245, 1023
  switch i32 %247, label %254 [
    i32 31, label %249
    i32 0, label %256
  ]

249:                                              ; preds = %235
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %250 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %248, 0
  %251 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %252 = or disjoint i32 %251, %250
  %253 = bitcast i32 %252 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

254:                                              ; preds = %235
  %255 = or disjoint i32 %248, 1024
  br label %256

256:                                              ; preds = %254, %235
  %257 = phi i32 [ %255, %254 ], [ %248, %235 ]
  %258 = uitofp i32 %257 to float
  %.not.i = icmp eq i32 %247, 0
  %259 = add nsw i32 %247, -25
  %260 = select i1 %.not.i, i32 -24, i32 %259
  %261 = call float @__ocml_ldexp_f32(float noundef %258, i32 noundef %260) #6
  %262 = fneg contract float %261
  %.not516517.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %263 = select contract i1 %.not516517.i, float %262, float %261
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %256, %249
  %264 = phi float [ %253, %249 ], [ %263, %256 ]
  %265 = zext i16 %.sroa.0224.0.copyload.i to i32
  %266 = lshr i32 %265, 10
  %267 = and i32 %266, 31
  %268 = and i32 %265, 1023
  switch i32 %267, label %274 [
    i32 31, label %269
    i32 0, label %276
  ]

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %270 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %268, 0
  %271 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %272 = or disjoint i32 %271, %270
  %273 = bitcast i32 %272 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %275 = or disjoint i32 %268, 1024
  br label %276

276:                                              ; preds = %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %277 = phi i32 [ %275, %274 ], [ %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %278 = uitofp i32 %277 to float
  %.not518.i = icmp eq i32 %267, 0
  %279 = add nsw i32 %267, -25
  %280 = select i1 %.not518.i, i32 -24, i32 %279
  %281 = call float @__ocml_ldexp_f32(float noundef %278, i32 noundef %280) #6
  %282 = fneg contract float %281
  %.not519520.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %283 = select contract i1 %.not519520.i, float %282, float %281
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %276, %269
  %284 = phi float [ %273, %269 ], [ %283, %276 ]
  %285 = fmul contract float %264, %284
  %286 = fadd contract float %237, %285
  %287 = or disjoint i64 %236, 1
  %288 = add nuw nsw i64 %287, %221
  %289 = trunc i64 %288 to i32
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %219, i32 %289
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %290, align 2, !tbaa.struct !23
  %291 = shl nuw nsw i64 %287, 4
  %292 = or disjoint i64 %291, %222
  %293 = trunc i64 %292 to i32
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %220, i32 %293
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %294, align 2, !tbaa.struct !23
  %295 = zext i16 %.sroa.0215.0.copyload.i to i32
  %296 = lshr i32 %295, 10
  %297 = and i32 %296, 31
  %298 = and i32 %295, 1023
  switch i32 %297, label %304 [
    i32 31, label %299
    i32 0, label %306
  ]

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %300 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not544.i = icmp eq i32 %298, 0
  %301 = select i1 %.not544.i, i32 2139095040, i32 2143289344
  %302 = or disjoint i32 %301, %300
  %303 = bitcast i32 %302 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

304:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %305 = or disjoint i32 %298, 1024
  br label %306

306:                                              ; preds = %304, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %307 = phi i32 [ %305, %304 ], [ %298, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %308 = uitofp i32 %307 to float
  %.not521.i = icmp eq i32 %297, 0
  %309 = add nsw i32 %297, -25
  %310 = select i1 %.not521.i, i32 -24, i32 %309
  %311 = call float @__ocml_ldexp_f32(float noundef %308, i32 noundef %310) #6
  %312 = fneg contract float %311
  %.not522523.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %313 = select contract i1 %.not522523.i, float %312, float %311
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %306, %299
  %314 = phi float [ %303, %299 ], [ %313, %306 ]
  %315 = zext i16 %.sroa.0206.0.copyload.i to i32
  %316 = lshr i32 %315, 10
  %317 = and i32 %316, 31
  %318 = and i32 %315, 1023
  switch i32 %317, label %324 [
    i32 31, label %319
    i32 0, label %326
  ]

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %320 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not543.i = icmp eq i32 %318, 0
  %321 = select i1 %.not543.i, i32 2139095040, i32 2143289344
  %322 = or disjoint i32 %321, %320
  %323 = bitcast i32 %322 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %325 = or disjoint i32 %318, 1024
  br label %326

326:                                              ; preds = %324, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %327 = phi i32 [ %325, %324 ], [ %318, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %328 = uitofp i32 %327 to float
  %.not524.i = icmp eq i32 %317, 0
  %329 = add nsw i32 %317, -25
  %330 = select i1 %.not524.i, i32 -24, i32 %329
  %331 = call float @__ocml_ldexp_f32(float noundef %328, i32 noundef %330) #6
  %332 = fneg contract float %331
  %.not525526.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %333 = select contract i1 %.not525526.i, float %332, float %331
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %326, %319
  %334 = phi float [ %323, %319 ], [ %333, %326 ]
  %335 = fmul contract float %314, %334
  %336 = fadd contract float %286, %335
  %337 = or disjoint i64 %236, 2
  %338 = add nuw nsw i64 %337, %221
  %339 = trunc i64 %338 to i32
  %340 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %219, i32 %339
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %340, align 2, !tbaa.struct !23
  %341 = shl nuw nsw i64 %337, 4
  %342 = or disjoint i64 %341, %222
  %343 = trunc i64 %342 to i32
  %344 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %220, i32 %343
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %344, align 2, !tbaa.struct !23
  %345 = zext i16 %.sroa.0197.0.copyload.i to i32
  %346 = lshr i32 %345, 10
  %347 = and i32 %346, 31
  %348 = and i32 %345, 1023
  switch i32 %347, label %354 [
    i32 31, label %349
    i32 0, label %356
  ]

349:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %350 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not542.i = icmp eq i32 %348, 0
  %351 = select i1 %.not542.i, i32 2139095040, i32 2143289344
  %352 = or disjoint i32 %351, %350
  %353 = bitcast i32 %352 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

354:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %355 = or disjoint i32 %348, 1024
  br label %356

356:                                              ; preds = %354, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %357 = phi i32 [ %355, %354 ], [ %348, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %358 = uitofp i32 %357 to float
  %.not527.i = icmp eq i32 %347, 0
  %359 = add nsw i32 %347, -25
  %360 = select i1 %.not527.i, i32 -24, i32 %359
  %361 = call float @__ocml_ldexp_f32(float noundef %358, i32 noundef %360) #6
  %362 = fneg contract float %361
  %.not528529.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %363 = select contract i1 %.not528529.i, float %362, float %361
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %356, %349
  %364 = phi float [ %353, %349 ], [ %363, %356 ]
  %365 = zext i16 %.sroa.0188.0.copyload.i to i32
  %366 = lshr i32 %365, 10
  %367 = and i32 %366, 31
  %368 = and i32 %365, 1023
  switch i32 %367, label %374 [
    i32 31, label %369
    i32 0, label %376
  ]

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %370 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not541.i = icmp eq i32 %368, 0
  %371 = select i1 %.not541.i, i32 2139095040, i32 2143289344
  %372 = or disjoint i32 %371, %370
  %373 = bitcast i32 %372 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i

374:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %375 = or disjoint i32 %368, 1024
  br label %376

376:                                              ; preds = %374, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %377 = phi i32 [ %375, %374 ], [ %368, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %378 = uitofp i32 %377 to float
  %.not530.i = icmp eq i32 %367, 0
  %379 = add nsw i32 %367, -25
  %380 = select i1 %.not530.i, i32 -24, i32 %379
  %381 = call float @__ocml_ldexp_f32(float noundef %378, i32 noundef %380) #6
  %382 = fneg contract float %381
  %.not531532.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %383 = select contract i1 %.not531532.i, float %382, float %381
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i: ; preds = %376, %369
  %384 = phi float [ %373, %369 ], [ %383, %376 ]
  %385 = fmul contract float %364, %384
  %386 = fadd contract float %336, %385
  %387 = or disjoint i64 %236, 3
  %388 = add nuw nsw i64 %387, %221
  %389 = trunc i64 %388 to i32
  %390 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %219, i32 %389
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %390, align 2, !tbaa.struct !23
  %391 = shl nuw nsw i64 %387, 4
  %392 = or disjoint i64 %391, %222
  %393 = trunc i64 %392 to i32
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %220, i32 %393
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %394, align 2, !tbaa.struct !23
  %395 = zext i16 %.sroa.0179.0.copyload.i to i32
  %396 = lshr i32 %395, 10
  %397 = and i32 %396, 31
  %398 = and i32 %395, 1023
  switch i32 %397, label %404 [
    i32 31, label %399
    i32 0, label %406
  ]

399:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %400 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not540.i = icmp eq i32 %398, 0
  %401 = select i1 %.not540.i, i32 2139095040, i32 2143289344
  %402 = or disjoint i32 %401, %400
  %403 = bitcast i32 %402 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

404:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i
  %405 = or disjoint i32 %398, 1024
  br label %406

406:                                              ; preds = %404, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i
  %407 = phi i32 [ %405, %404 ], [ %398, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i ]
  %408 = uitofp i32 %407 to float
  %.not533.i = icmp eq i32 %397, 0
  %409 = add nsw i32 %397, -25
  %410 = select i1 %.not533.i, i32 -24, i32 %409
  %411 = call float @__ocml_ldexp_f32(float noundef %408, i32 noundef %410) #6
  %412 = fneg contract float %411
  %.not534535.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %413 = select contract i1 %.not534535.i, float %412, float %411
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i: ; preds = %406, %399
  %414 = phi float [ %403, %399 ], [ %413, %406 ]
  %415 = zext i16 %.sroa.0170.0.copyload.i to i32
  %416 = lshr i32 %415, 10
  %417 = and i32 %416, 31
  %418 = and i32 %415, 1023
  switch i32 %417, label %424 [
    i32 31, label %419
    i32 0, label %426
  ]

419:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %420 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not539.i = icmp eq i32 %418, 0
  %421 = select i1 %.not539.i, i32 2139095040, i32 2143289344
  %422 = or disjoint i32 %421, %420
  %423 = bitcast i32 %422 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

424:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %425 = or disjoint i32 %418, 1024
  br label %426

426:                                              ; preds = %424, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %427 = phi i32 [ %425, %424 ], [ %418, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i ]
  %428 = uitofp i32 %427 to float
  %.not536.i = icmp eq i32 %417, 0
  %429 = add nsw i32 %417, -25
  %430 = select i1 %.not536.i, i32 -24, i32 %429
  %431 = call float @__ocml_ldexp_f32(float noundef %428, i32 noundef %430) #6
  %432 = fneg contract float %431
  %.not537538.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %433 = select contract i1 %.not537538.i, float %432, float %431
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %426, %419
  %434 = phi float [ %423, %419 ], [ %433, %426 ]
  %435 = fmul contract float %414, %434
  %436 = fadd contract float %386, %435
  %437 = add nuw nsw i64 %236, 4
  %438 = icmp ult i64 %236, 12
  br i1 %438, label %235, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !34

439:                                              ; preds = %._crit_edge560.i
  %440 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %441 = icmp eq i64 %440, 0
  call void @llvm.assume(i1 %441)
  %442 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %443 = icmp eq i64 %442, 0
  call void @llvm.assume(i1 %443)
  %444 = sext i32 %3 to i64
  %445 = call i32 @llvm.amdgcn.groupstaticsize()
  %446 = inttoptr i32 %445 to ptr addrspace(3)
  %447 = zext i32 %30 to i64
  %448 = icmp sgt i32 %4, 0
  %449 = icmp ugt i32 %4, 1
  %450 = icmp ugt i32 %4, 2
  %451 = icmp ugt i32 %4, 3
  %452 = icmp ugt i32 %4, 4
  %453 = icmp ugt i32 %4, 5
  %454 = icmp ugt i32 %4, 6
  %455 = icmp ugt i32 %4, 7
  %456 = icmp ugt i32 %4, 8
  %457 = icmp ugt i32 %4, 9
  %458 = icmp ugt i32 %4, 10
  %459 = icmp ugt i32 %4, 11
  %460 = icmp ugt i32 %4, 12
  %461 = icmp ugt i32 %4, 13
  %462 = icmp ugt i32 %4, 14
  %463 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split562.us.i, %439
  %464 = phi i64 [ 0, %439 ], [ %470, %.split562.us.i ]
  %465 = icmp slt i64 %464, %444
  %466 = shl i64 %464, 4
  %.tr515.i = trunc i64 %464 to i32
  %467 = shl i32 %.tr515.i, 4
  %468 = sext i32 %467 to i64
  %469 = add nsw i64 %468, %447
  %.fr563.i = freeze i1 %465
  %brmerge.not.i = select i1 %.fr563.i, i1 %448, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split562.us.i

.split562.us.i:                                   ; preds = %559, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %470 = add nuw nsw i64 %464, 1
  %exitcond567.not.i = icmp eq i64 %470, 8
  br i1 %exitcond567.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %471 = trunc i64 %466 to i32
  %472 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %471
  %473 = load float, ptr addrspace(3) %472, align 4, !tbaa !32
  %474 = getelementptr inbounds float, ptr %9, i64 %469
  store float %473, ptr %474, align 32, !tbaa !32
  br i1 %449, label %.preheader.split.2.i, label %.split562.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %475 = trunc i64 %466 to i32
  %476 = or disjoint i32 %475, 1
  %477 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !32
  %479 = or disjoint i64 %469, 1
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 4, !tbaa !32
  br i1 %450, label %.preheader.split.3.i, label %.split562.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %481 = trunc i64 %466 to i32
  %482 = or disjoint i32 %481, 2
  %483 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !32
  %485 = or disjoint i64 %469, 2
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 8, !tbaa !32
  br i1 %451, label %.preheader.split.4.i, label %.split562.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %487 = trunc i64 %466 to i32
  %488 = or disjoint i32 %487, 3
  %489 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !32
  %491 = or disjoint i64 %469, 3
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 4, !tbaa !32
  br i1 %452, label %.preheader.split.5.i, label %.split562.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %493 = trunc i64 %466 to i32
  %494 = or disjoint i32 %493, 4
  %495 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !32
  %497 = or disjoint i64 %469, 4
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 16, !tbaa !32
  br i1 %453, label %.preheader.split.6.i, label %.split562.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %499 = trunc i64 %466 to i32
  %500 = or disjoint i32 %499, 5
  %501 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %500
  %502 = load float, ptr addrspace(3) %501, align 4, !tbaa !32
  %503 = or disjoint i64 %469, 5
  %504 = getelementptr inbounds float, ptr %9, i64 %503
  store float %502, ptr %504, align 4, !tbaa !32
  br i1 %454, label %.preheader.split.7.i, label %.split562.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %505 = trunc i64 %466 to i32
  %506 = or disjoint i32 %505, 6
  %507 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %506
  %508 = load float, ptr addrspace(3) %507, align 4, !tbaa !32
  %509 = or disjoint i64 %469, 6
  %510 = getelementptr inbounds float, ptr %9, i64 %509
  store float %508, ptr %510, align 8, !tbaa !32
  br i1 %455, label %.preheader.split.8.i, label %.split562.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %511 = trunc i64 %466 to i32
  %512 = or disjoint i32 %511, 7
  %513 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %512
  %514 = load float, ptr addrspace(3) %513, align 4, !tbaa !32
  %515 = or disjoint i64 %469, 7
  %516 = getelementptr inbounds float, ptr %9, i64 %515
  store float %514, ptr %516, align 4, !tbaa !32
  br i1 %456, label %.preheader.split.9.i, label %.split562.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %517 = trunc i64 %466 to i32
  %518 = or disjoint i32 %517, 8
  %519 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %518
  %520 = load float, ptr addrspace(3) %519, align 4, !tbaa !32
  %521 = or disjoint i64 %469, 8
  %522 = getelementptr inbounds float, ptr %9, i64 %521
  store float %520, ptr %522, align 32, !tbaa !32
  br i1 %457, label %.preheader.split.10.i, label %.split562.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %523 = trunc i64 %466 to i32
  %524 = or disjoint i32 %523, 9
  %525 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !32
  %527 = or disjoint i64 %469, 9
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 4, !tbaa !32
  br i1 %458, label %.preheader.split.11.i, label %.split562.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %529 = trunc i64 %466 to i32
  %530 = or disjoint i32 %529, 10
  %531 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %530
  %532 = load float, ptr addrspace(3) %531, align 4, !tbaa !32
  %533 = or disjoint i64 %469, 10
  %534 = getelementptr inbounds float, ptr %9, i64 %533
  store float %532, ptr %534, align 8, !tbaa !32
  br i1 %459, label %.preheader.split.12.i, label %.split562.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %535 = trunc i64 %466 to i32
  %536 = or disjoint i32 %535, 11
  %537 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %536
  %538 = load float, ptr addrspace(3) %537, align 4, !tbaa !32
  %539 = or disjoint i64 %469, 11
  %540 = getelementptr inbounds float, ptr %9, i64 %539
  store float %538, ptr %540, align 4, !tbaa !32
  br i1 %460, label %.preheader.split.13.i, label %.split562.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %541 = trunc i64 %466 to i32
  %542 = or disjoint i32 %541, 12
  %543 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %542
  %544 = load float, ptr addrspace(3) %543, align 4, !tbaa !32
  %545 = or disjoint i64 %469, 12
  %546 = getelementptr inbounds float, ptr %9, i64 %545
  store float %544, ptr %546, align 16, !tbaa !32
  br i1 %461, label %.preheader.split.14.i, label %.split562.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %547 = trunc i64 %466 to i32
  %548 = or disjoint i32 %547, 13
  %549 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %548
  %550 = load float, ptr addrspace(3) %549, align 4, !tbaa !32
  %551 = or disjoint i64 %469, 13
  %552 = getelementptr inbounds float, ptr %9, i64 %551
  store float %550, ptr %552, align 4, !tbaa !32
  br i1 %462, label %.preheader.split.15.i, label %.split562.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %553 = trunc i64 %466 to i32
  %554 = or disjoint i32 %553, 14
  %555 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %554
  %556 = load float, ptr addrspace(3) %555, align 4, !tbaa !32
  %557 = or disjoint i64 %469, 14
  %558 = getelementptr inbounds float, ptr %9, i64 %557
  store float %556, ptr %558, align 8, !tbaa !32
  br i1 %463, label %559, label %.split562.us.i

559:                                              ; preds = %.preheader.split.15.i
  %560 = trunc i64 %466 to i32
  %561 = or disjoint i32 %560, 15
  %562 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %561
  %563 = load float, ptr addrspace(3) %562, align 4, !tbaa !32
  %564 = or disjoint i64 %469, 15
  %565 = getelementptr inbounds float, ptr %9, i64 %564
  store float %563, ptr %565, align 4, !tbaa !32
  br label %.split562.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge560.i, %.split562.us.i
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
!23 = !{i64 0, i64 2, !24}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C++ TBAA"}
!28 = distinct !{!28, !29, !30, !31}
!29 = !{!"llvm.loop.mustprogress"}
!30 = !{!"llvm.loop.vectorize.width", i32 1}
!31 = !{!"llvm.loop.interleave.count", i32 1}
!32 = !{!33, !33, i64 0}
!33 = !{!"float", !26, i64 0}
!34 = distinct !{!34, !29}
!35 = distinct !{!35, !29}
;----------------- End AdaptiveCpp IR dump ---------------
