;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-oyz8eswi/kernel.cpp"
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
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 33554431
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl nuw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 64
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
  %43 = sext i32 %30 to i64
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
  br label %.preheader412.i

.preheader412.i:                                  ; preds = %.split.us.i, %34
  %60 = phi i64 [ 0, %34 ], [ %70, %.split.us.i ]
  %61 = icmp slt i64 %60, %39
  %62 = shl i64 %60, 4
  %.tr407.i = trunc i64 %60 to i32
  %63 = shl i32 %.tr407.i, 4
  %64 = sext i32 %63 to i64
  %65 = add nsw i64 %64, %43
  %.fr.i = freeze i1 %61
  br i1 %.fr.i, label %.preheader412.split.preheader.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.i: ; preds = %.preheader412.i
  %.tr430.i = trunc i64 %60 to i32
  %66 = shl i32 %.tr430.i, 5
  %67 = add i32 %66, 512
  %scevgep.i = getelementptr i8, ptr addrspace(3) %41, i32 %67
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(32) %scevgep.i, i8 0, i32 32, i1 false)
  br label %.split.us.i

.preheader412.split.preheader.i:                  ; preds = %.preheader412.i
  br i1 %44, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i: ; preds = %.preheader412.split.preheader.i
  %68 = trunc i64 %62 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %68
  store i16 0, ptr addrspace(3) %69, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.thread.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.us.preheader.i
  %70 = add nuw nsw i64 %60, 1
  %exitcond.not.i = icmp eq i64 %70, 8
  br i1 %exitcond.not.i, label %.lr.ph.i, label %.preheader412.i, !llvm.loop !28

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i: ; preds = %.preheader412.split.preheader.i
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %65
  %.sroa.0220.0.copyload.i = load i16, ptr %71, align 32, !tbaa.struct !23
  %72 = trunc i64 %62 to i32
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0220.0.copyload.i, ptr addrspace(3) %73, align 2, !tbaa.struct !23
  br i1 %45, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.thread.i
  %74 = trunc i64 %62 to i32
  %75 = or disjoint i32 %74, 1
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %75
  store i16 0, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.i
  %77 = or disjoint i64 %65, 1
  %78 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %77
  %.sroa.0220.0.copyload.1.i = load i16, ptr %78, align 2, !tbaa.struct !23
  %79 = trunc i64 %62 to i32
  %80 = or disjoint i32 %79, 1
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %80
  store i16 %.sroa.0220.0.copyload.1.i, ptr addrspace(3) %81, align 2, !tbaa.struct !23
  br i1 %46, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.thread.i
  %82 = trunc i64 %62 to i32
  %83 = or disjoint i32 %82, 2
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %83
  store i16 0, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.1.i
  %85 = or disjoint i64 %65, 2
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %85
  %.sroa.0220.0.copyload.2.i = load i16, ptr %86, align 4, !tbaa.struct !23
  %87 = trunc i64 %62 to i32
  %88 = or disjoint i32 %87, 2
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %88
  store i16 %.sroa.0220.0.copyload.2.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  br i1 %47, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.thread.i
  %90 = trunc i64 %62 to i32
  %91 = or disjoint i32 %90, 3
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %91
  store i16 0, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.2.i
  %93 = or disjoint i64 %65, 3
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %93
  %.sroa.0220.0.copyload.3.i = load i16, ptr %94, align 2, !tbaa.struct !23
  %95 = trunc i64 %62 to i32
  %96 = or disjoint i32 %95, 3
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %96
  store i16 %.sroa.0220.0.copyload.3.i, ptr addrspace(3) %97, align 2, !tbaa.struct !23
  br i1 %48, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.thread.i
  %98 = trunc i64 %62 to i32
  %99 = or disjoint i32 %98, 4
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %99
  store i16 0, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.3.i
  %101 = or disjoint i64 %65, 4
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %101
  %.sroa.0220.0.copyload.4.i = load i16, ptr %102, align 8, !tbaa.struct !23
  %103 = trunc i64 %62 to i32
  %104 = or disjoint i32 %103, 4
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %104
  store i16 %.sroa.0220.0.copyload.4.i, ptr addrspace(3) %105, align 2, !tbaa.struct !23
  br i1 %49, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.thread.i
  %106 = trunc i64 %62 to i32
  %107 = or disjoint i32 %106, 5
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %107
  store i16 0, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.4.i
  %109 = or disjoint i64 %65, 5
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %109
  %.sroa.0220.0.copyload.5.i = load i16, ptr %110, align 2, !tbaa.struct !23
  %111 = trunc i64 %62 to i32
  %112 = or disjoint i32 %111, 5
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %112
  store i16 %.sroa.0220.0.copyload.5.i, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  br i1 %50, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.thread.i
  %114 = trunc i64 %62 to i32
  %115 = or disjoint i32 %114, 6
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %115
  store i16 0, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.5.i
  %117 = or disjoint i64 %65, 6
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %117
  %.sroa.0220.0.copyload.6.i = load i16, ptr %118, align 4, !tbaa.struct !23
  %119 = trunc i64 %62 to i32
  %120 = or disjoint i32 %119, 6
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %120
  store i16 %.sroa.0220.0.copyload.6.i, ptr addrspace(3) %121, align 2, !tbaa.struct !23
  br i1 %51, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.thread.i
  %122 = trunc i64 %62 to i32
  %123 = or disjoint i32 %122, 7
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %123
  store i16 0, ptr addrspace(3) %124, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.6.i
  %125 = or disjoint i64 %65, 7
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %125
  %.sroa.0220.0.copyload.7.i = load i16, ptr %126, align 2, !tbaa.struct !23
  %127 = trunc i64 %62 to i32
  %128 = or disjoint i32 %127, 7
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %128
  store i16 %.sroa.0220.0.copyload.7.i, ptr addrspace(3) %129, align 2, !tbaa.struct !23
  br i1 %52, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.thread.i
  %130 = trunc i64 %62 to i32
  %131 = or disjoint i32 %130, 8
  %132 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %131
  store i16 0, ptr addrspace(3) %132, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.7.i
  %133 = or disjoint i64 %65, 8
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %133
  %.sroa.0220.0.copyload.8.i = load i16, ptr %134, align 16, !tbaa.struct !23
  %135 = trunc i64 %62 to i32
  %136 = or disjoint i32 %135, 8
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %136
  store i16 %.sroa.0220.0.copyload.8.i, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  br i1 %53, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.thread.i
  %138 = trunc i64 %62 to i32
  %139 = or disjoint i32 %138, 9
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %139
  store i16 0, ptr addrspace(3) %140, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.8.i
  %141 = or disjoint i64 %65, 9
  %142 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %141
  %.sroa.0220.0.copyload.9.i = load i16, ptr %142, align 2, !tbaa.struct !23
  %143 = trunc i64 %62 to i32
  %144 = or disjoint i32 %143, 9
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %144
  store i16 %.sroa.0220.0.copyload.9.i, ptr addrspace(3) %145, align 2, !tbaa.struct !23
  br i1 %54, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.thread.i
  %146 = trunc i64 %62 to i32
  %147 = or disjoint i32 %146, 10
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %147
  store i16 0, ptr addrspace(3) %148, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.9.i
  %149 = or disjoint i64 %65, 10
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %149
  %.sroa.0220.0.copyload.10.i = load i16, ptr %150, align 4, !tbaa.struct !23
  %151 = trunc i64 %62 to i32
  %152 = or disjoint i32 %151, 10
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %152
  store i16 %.sroa.0220.0.copyload.10.i, ptr addrspace(3) %153, align 2, !tbaa.struct !23
  br i1 %55, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.thread.i
  %154 = trunc i64 %62 to i32
  %155 = or disjoint i32 %154, 11
  %156 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %155
  store i16 0, ptr addrspace(3) %156, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.10.i
  %157 = or disjoint i64 %65, 11
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %157
  %.sroa.0220.0.copyload.11.i = load i16, ptr %158, align 2, !tbaa.struct !23
  %159 = trunc i64 %62 to i32
  %160 = or disjoint i32 %159, 11
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %160
  store i16 %.sroa.0220.0.copyload.11.i, ptr addrspace(3) %161, align 2, !tbaa.struct !23
  br i1 %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.thread.i
  %162 = trunc i64 %62 to i32
  %163 = or disjoint i32 %162, 12
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %163
  store i16 0, ptr addrspace(3) %164, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.11.i
  %165 = or disjoint i64 %65, 12
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %165
  %.sroa.0220.0.copyload.12.i = load i16, ptr %166, align 8, !tbaa.struct !23
  %167 = trunc i64 %62 to i32
  %168 = or disjoint i32 %167, 12
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %168
  store i16 %.sroa.0220.0.copyload.12.i, ptr addrspace(3) %169, align 2, !tbaa.struct !23
  br i1 %57, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.thread.i
  %170 = trunc i64 %62 to i32
  %171 = or disjoint i32 %170, 13
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %171
  store i16 0, ptr addrspace(3) %172, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.12.i
  %173 = or disjoint i64 %65, 13
  %174 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %173
  %.sroa.0220.0.copyload.13.i = load i16, ptr %174, align 2, !tbaa.struct !23
  %175 = trunc i64 %62 to i32
  %176 = or disjoint i32 %175, 13
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %176
  store i16 %.sroa.0220.0.copyload.13.i, ptr addrspace(3) %177, align 2, !tbaa.struct !23
  br i1 %58, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.thread.i
  %178 = trunc i64 %62 to i32
  %179 = or disjoint i32 %178, 14
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %179
  store i16 0, ptr addrspace(3) %180, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i: ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.13.i
  %181 = or disjoint i64 %65, 14
  %182 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %181
  %.sroa.0220.0.copyload.14.i = load i16, ptr %182, align 4, !tbaa.struct !23
  %183 = trunc i64 %62 to i32
  %184 = or disjoint i32 %183, 14
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %184
  store i16 %.sroa.0220.0.copyload.14.i, ptr addrspace(3) %185, align 2, !tbaa.struct !23
  br i1 %59, label %186, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i

186:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i
  %187 = or disjoint i64 %65, 15
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %187
  %.sroa.0220.0.copyload.15.i = load i16, ptr %188, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.15.i: ; preds = %186, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i
  %.sroa.0222.2.15.i = phi i16 [ %.sroa.0220.0.copyload.15.i, %186 ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.i ], [ 0, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit5.i.i.14.thread.i ]
  %189 = trunc i64 %62 to i32
  %190 = or disjoint i32 %189, 15
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %190
  store i16 %.sroa.0222.2.15.i, ptr addrspace(3) %191, align 2, !tbaa.struct !23
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
  %197 = icmp ult i64 %196, 64
  call void @llvm.assume(i1 %197)
  %198 = shl i32 %.tr.i, 8
  %199 = sext i32 %5 to i64
  %200 = sext i32 %4 to i64
  %201 = sext i32 %198 to i64
  %202 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %203 = inttoptr i32 %202 to ptr addrspace(3)
  %204 = getelementptr inbounds i8, ptr addrspace(3) %203, i32 768
  %205 = and i64 %196, 15
  %206 = icmp slt i64 %205, %200
  br label %221

.lr.ph419.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %207 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %208 = icmp eq i64 %207, 0
  call void @llvm.assume(i1 %208)
  %209 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %210 = icmp eq i64 %209, 0
  call void @llvm.assume(i1 %210)
  %211 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %212 = icmp ult i64 %211, 64
  call void @llvm.assume(i1 %212)
  %213 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %214 = inttoptr i32 %213 to ptr addrspace(3)
  %215 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 512
  %216 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 768
  %217 = and i64 %211, 7
  %218 = or disjoint i64 %217, 8
  %219 = shl nuw nsw i64 %211, 1
  %220 = and i64 %219, 112
  br label %244

221:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph.i
  %222 = phi i64 [ %196, %.lr.ph.i ], [ %233, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %223 = lshr i64 %222, 4
  %224 = icmp slt i64 %223, %199
  %225 = and i1 %224, %206
  br i1 %225, label %226, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

226:                                              ; preds = %221
  %227 = and i64 %222, 9223372036854775792
  %228 = or disjoint i64 %227, %201
  %229 = or disjoint i64 %228, %205
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %229
  %.sroa.0209.0.copyload.i = load i16, ptr %230, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %226, %221
  %.sroa.0211.1.i = phi i16 [ %.sroa.0209.0.copyload.i, %226 ], [ 0, %221 ]
  %231 = trunc i64 %222 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %204, i32 %231
  store i16 %.sroa.0211.1.i, ptr addrspace(3) %232, align 2, !tbaa.struct !23
  %233 = add nuw nsw i64 %222, 64
  %234 = icmp ult i64 %222, 192
  br i1 %234, label %221, label %.lr.ph419.i, !llvm.loop !32

._crit_edge420.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %235 = or disjoint i64 %220, %217
  %236 = trunc i64 %235 to i32
  %237 = getelementptr inbounds float, ptr addrspace(3) %214, i32 %236
  store float %296, ptr addrspace(3) %237, align 4, !tbaa !33
  %238 = or disjoint i64 %220, %218
  %239 = trunc i64 %238 to i32
  %240 = getelementptr inbounds float, ptr addrspace(3) %214, i32 %239
  store float %321, ptr addrspace(3) %240, align 4, !tbaa !33
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %241 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %242 = icmp ult i64 %241, 64
  call void @llvm.assume(i1 %242)
  %243 = icmp eq i64 %241, 0
  br i1 %243, label %323, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph419.i
  %245 = phi i64 [ 0, %.lr.ph419.i ], [ %322, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %246 = phi float [ 0.000000e+00, %.lr.ph419.i ], [ %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %247 = phi float [ 0.000000e+00, %.lr.ph419.i ], [ %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %248 = add nuw nsw i64 %245, %220
  %249 = trunc i64 %248 to i32
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %249
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %250, align 2, !tbaa.struct !23
  %251 = shl nuw nsw i64 %245, 4
  %252 = or disjoint i64 %251, %217
  %253 = trunc i64 %252 to i32
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %253
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %254, align 2, !tbaa.struct !23
  %255 = zext i16 %.sroa.0194.0.copyload.i to i32
  %256 = lshr i32 %255, 10
  %257 = and i32 %256, 31
  %258 = and i32 %255, 1023
  switch i32 %257, label %264 [
    i32 31, label %259
    i32 0, label %266
  ]

259:                                              ; preds = %244
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %260 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not405.i = icmp eq i32 %258, 0
  %261 = select i1 %.not405.i, i32 2139095040, i32 2143289344
  %262 = or disjoint i32 %261, %260
  %263 = bitcast i32 %262 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

264:                                              ; preds = %244
  %265 = or disjoint i32 %258, 1024
  br label %266

266:                                              ; preds = %264, %244
  %267 = phi i32 [ %265, %264 ], [ %258, %244 ]
  %268 = uitofp i32 %267 to float
  %.not.i = icmp eq i32 %257, 0
  %269 = add nsw i32 %257, -25
  %270 = select i1 %.not.i, i32 -24, i32 %269
  %271 = call float @__ocml_ldexp_f32(float noundef %268, i32 noundef %270) #6
  %272 = fneg contract float %271
  %.not395396.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %273 = select contract i1 %.not395396.i, float %272, float %271
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %266, %259
  %274 = phi float [ %263, %259 ], [ %273, %266 ]
  %275 = zext i16 %.sroa.0185.0.copyload.i to i32
  %276 = lshr i32 %275, 10
  %277 = and i32 %276, 31
  %278 = and i32 %275, 1023
  switch i32 %277, label %284 [
    i32 31, label %279
    i32 0, label %286
  ]

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %280 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not404.i = icmp eq i32 %278, 0
  %281 = select i1 %.not404.i, i32 2139095040, i32 2143289344
  %282 = or disjoint i32 %281, %280
  %283 = bitcast i32 %282 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

284:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %285 = or disjoint i32 %278, 1024
  br label %286

286:                                              ; preds = %284, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %287 = phi i32 [ %285, %284 ], [ %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %288 = uitofp i32 %287 to float
  %.not397.i = icmp eq i32 %277, 0
  %289 = add nsw i32 %277, -25
  %290 = select i1 %.not397.i, i32 -24, i32 %289
  %291 = call float @__ocml_ldexp_f32(float noundef %288, i32 noundef %290) #6
  %292 = fneg contract float %291
  %.not398399.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %293 = select contract i1 %.not398399.i, float %292, float %291
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %286, %279
  %294 = phi float [ %283, %279 ], [ %293, %286 ]
  %295 = fmul contract float %274, %294
  %296 = fadd contract float %247, %295
  %297 = or disjoint i64 %251, %218
  %298 = trunc i64 %297 to i32
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %298
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %299, align 2, !tbaa.struct !23
  %300 = zext i16 %.sroa.0176.0.copyload.i to i32
  %301 = lshr i32 %300, 10
  %302 = and i32 %301, 31
  %303 = and i32 %300, 1023
  switch i32 %302, label %309 [
    i32 31, label %304
    i32 0, label %311
  ]

304:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %305 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not403.i = icmp eq i32 %303, 0
  %306 = select i1 %.not403.i, i32 2139095040, i32 2143289344
  %307 = or disjoint i32 %306, %305
  %308 = bitcast i32 %307 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

309:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %310 = or disjoint i32 %303, 1024
  br label %311

311:                                              ; preds = %309, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %312 = phi i32 [ %310, %309 ], [ %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %313 = uitofp i32 %312 to float
  %.not400.i = icmp eq i32 %302, 0
  %314 = add nsw i32 %302, -25
  %315 = select i1 %.not400.i, i32 -24, i32 %314
  %316 = call float @__ocml_ldexp_f32(float noundef %313, i32 noundef %315) #6
  %317 = fneg contract float %316
  %.not401402.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %318 = select contract i1 %.not401402.i, float %317, float %316
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %311, %304
  %319 = phi float [ %308, %304 ], [ %318, %311 ]
  %320 = fmul contract float %274, %319
  %321 = fadd contract float %246, %320
  %322 = add nuw nsw i64 %245, 1
  %exitcond427.not.i = icmp eq i64 %322, 16
  br i1 %exitcond427.not.i, label %._crit_edge420.i, label %244, !llvm.loop !35

323:                                              ; preds = %._crit_edge420.i
  %324 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %325 = icmp eq i64 %324, 0
  call void @llvm.assume(i1 %325)
  %326 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %327 = icmp eq i64 %326, 0
  call void @llvm.assume(i1 %327)
  %328 = sext i32 %3 to i64
  %329 = call i32 @llvm.amdgcn.groupstaticsize()
  %330 = inttoptr i32 %329 to ptr addrspace(3)
  %331 = sext i32 %30 to i64
  %332 = icmp sgt i32 %4, 0
  %333 = icmp ugt i32 %4, 1
  %334 = icmp ugt i32 %4, 2
  %335 = icmp ugt i32 %4, 3
  %336 = icmp ugt i32 %4, 4
  %337 = icmp ugt i32 %4, 5
  %338 = icmp ugt i32 %4, 6
  %339 = icmp ugt i32 %4, 7
  %340 = icmp ugt i32 %4, 8
  %341 = icmp ugt i32 %4, 9
  %342 = icmp ugt i32 %4, 10
  %343 = icmp ugt i32 %4, 11
  %344 = icmp ugt i32 %4, 12
  %345 = icmp ugt i32 %4, 13
  %346 = icmp ugt i32 %4, 14
  %347 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split422.us.i, %323
  %348 = phi i64 [ 0, %323 ], [ %354, %.split422.us.i ]
  %349 = icmp slt i64 %348, %328
  %350 = shl i64 %348, 4
  %.tr394.i = trunc i64 %348 to i32
  %351 = shl i32 %.tr394.i, 4
  %352 = sext i32 %351 to i64
  %353 = add nsw i64 %352, %331
  %.fr423.i = freeze i1 %349
  %brmerge.not.i = select i1 %.fr423.i, i1 %332, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split422.us.i

.split422.us.i:                                   ; preds = %443, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %354 = add nuw nsw i64 %348, 1
  %exitcond429.not.i = icmp eq i64 %354, 8
  br i1 %exitcond429.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %355 = trunc i64 %350 to i32
  %356 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %355
  %357 = load float, ptr addrspace(3) %356, align 4, !tbaa !33
  %358 = getelementptr inbounds float, ptr %9, i64 %353
  store float %357, ptr %358, align 32, !tbaa !33
  br i1 %333, label %.preheader.split.2.i, label %.split422.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %359 = trunc i64 %350 to i32
  %360 = or disjoint i32 %359, 1
  %361 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %360
  %362 = load float, ptr addrspace(3) %361, align 4, !tbaa !33
  %363 = or disjoint i64 %353, 1
  %364 = getelementptr inbounds float, ptr %9, i64 %363
  store float %362, ptr %364, align 4, !tbaa !33
  br i1 %334, label %.preheader.split.3.i, label %.split422.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %365 = trunc i64 %350 to i32
  %366 = or disjoint i32 %365, 2
  %367 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %366
  %368 = load float, ptr addrspace(3) %367, align 4, !tbaa !33
  %369 = or disjoint i64 %353, 2
  %370 = getelementptr inbounds float, ptr %9, i64 %369
  store float %368, ptr %370, align 8, !tbaa !33
  br i1 %335, label %.preheader.split.4.i, label %.split422.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %371 = trunc i64 %350 to i32
  %372 = or disjoint i32 %371, 3
  %373 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %372
  %374 = load float, ptr addrspace(3) %373, align 4, !tbaa !33
  %375 = or disjoint i64 %353, 3
  %376 = getelementptr inbounds float, ptr %9, i64 %375
  store float %374, ptr %376, align 4, !tbaa !33
  br i1 %336, label %.preheader.split.5.i, label %.split422.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %377 = trunc i64 %350 to i32
  %378 = or disjoint i32 %377, 4
  %379 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !33
  %381 = or disjoint i64 %353, 4
  %382 = getelementptr inbounds float, ptr %9, i64 %381
  store float %380, ptr %382, align 16, !tbaa !33
  br i1 %337, label %.preheader.split.6.i, label %.split422.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %383 = trunc i64 %350 to i32
  %384 = or disjoint i32 %383, 5
  %385 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !33
  %387 = or disjoint i64 %353, 5
  %388 = getelementptr inbounds float, ptr %9, i64 %387
  store float %386, ptr %388, align 4, !tbaa !33
  br i1 %338, label %.preheader.split.7.i, label %.split422.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %389 = trunc i64 %350 to i32
  %390 = or disjoint i32 %389, 6
  %391 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !33
  %393 = or disjoint i64 %353, 6
  %394 = getelementptr inbounds float, ptr %9, i64 %393
  store float %392, ptr %394, align 8, !tbaa !33
  br i1 %339, label %.preheader.split.8.i, label %.split422.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %395 = trunc i64 %350 to i32
  %396 = or disjoint i32 %395, 7
  %397 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %396
  %398 = load float, ptr addrspace(3) %397, align 4, !tbaa !33
  %399 = or disjoint i64 %353, 7
  %400 = getelementptr inbounds float, ptr %9, i64 %399
  store float %398, ptr %400, align 4, !tbaa !33
  br i1 %340, label %.preheader.split.9.i, label %.split422.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %401 = trunc i64 %350 to i32
  %402 = or disjoint i32 %401, 8
  %403 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %402
  %404 = load float, ptr addrspace(3) %403, align 4, !tbaa !33
  %405 = or disjoint i64 %353, 8
  %406 = getelementptr inbounds float, ptr %9, i64 %405
  store float %404, ptr %406, align 32, !tbaa !33
  br i1 %341, label %.preheader.split.10.i, label %.split422.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %407 = trunc i64 %350 to i32
  %408 = or disjoint i32 %407, 9
  %409 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %408
  %410 = load float, ptr addrspace(3) %409, align 4, !tbaa !33
  %411 = or disjoint i64 %353, 9
  %412 = getelementptr inbounds float, ptr %9, i64 %411
  store float %410, ptr %412, align 4, !tbaa !33
  br i1 %342, label %.preheader.split.11.i, label %.split422.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %413 = trunc i64 %350 to i32
  %414 = or disjoint i32 %413, 10
  %415 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %414
  %416 = load float, ptr addrspace(3) %415, align 4, !tbaa !33
  %417 = or disjoint i64 %353, 10
  %418 = getelementptr inbounds float, ptr %9, i64 %417
  store float %416, ptr %418, align 8, !tbaa !33
  br i1 %343, label %.preheader.split.12.i, label %.split422.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %419 = trunc i64 %350 to i32
  %420 = or disjoint i32 %419, 11
  %421 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %420
  %422 = load float, ptr addrspace(3) %421, align 4, !tbaa !33
  %423 = or disjoint i64 %353, 11
  %424 = getelementptr inbounds float, ptr %9, i64 %423
  store float %422, ptr %424, align 4, !tbaa !33
  br i1 %344, label %.preheader.split.13.i, label %.split422.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %425 = trunc i64 %350 to i32
  %426 = or disjoint i32 %425, 12
  %427 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !33
  %429 = or disjoint i64 %353, 12
  %430 = getelementptr inbounds float, ptr %9, i64 %429
  store float %428, ptr %430, align 16, !tbaa !33
  br i1 %345, label %.preheader.split.14.i, label %.split422.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %431 = trunc i64 %350 to i32
  %432 = or disjoint i32 %431, 13
  %433 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %432
  %434 = load float, ptr addrspace(3) %433, align 4, !tbaa !33
  %435 = or disjoint i64 %353, 13
  %436 = getelementptr inbounds float, ptr %9, i64 %435
  store float %434, ptr %436, align 4, !tbaa !33
  br i1 %346, label %.preheader.split.15.i, label %.split422.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %437 = trunc i64 %350 to i32
  %438 = or disjoint i32 %437, 14
  %439 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !33
  %441 = or disjoint i64 %353, 14
  %442 = getelementptr inbounds float, ptr %9, i64 %441
  store float %440, ptr %442, align 8, !tbaa !33
  br i1 %347, label %443, label %.split422.us.i

443:                                              ; preds = %.preheader.split.15.i
  %444 = trunc i64 %350 to i32
  %445 = or disjoint i32 %444, 15
  %446 = getelementptr inbounds float, ptr addrspace(3) %330, i32 %445
  %447 = load float, ptr addrspace(3) %446, align 4, !tbaa !33
  %448 = or disjoint i64 %353, 15
  %449 = getelementptr inbounds float, ptr %9, i64 %448
  store float %447, ptr %449, align 4, !tbaa !33
  br label %.split422.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge420.i, %.split422.us.i
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
!23 = !{i64 0, i64 2, !24}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C++ TBAA"}
!28 = distinct !{!28, !29, !30, !31}
!29 = !{!"llvm.loop.mustprogress"}
!30 = !{!"llvm.loop.vectorize.width", i32 1}
!31 = !{!"llvm.loop.interleave.count", i32 1}
!32 = distinct !{!32, !29, !30, !31}
!33 = !{!34, !34, i64 0}
!34 = !{!"float", !26, i64 0}
!35 = distinct !{!35, !29}
!36 = distinct !{!36, !29}
;----------------- End AdaptiveCpp IR dump ---------------
