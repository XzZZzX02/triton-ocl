;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882024/tmp/triton-sycl-cache/compile-dfyzmmco/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !17
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !20
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 16777215
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl nuw nsw i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 128
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
  %197 = icmp ult i64 %196, 128
  call void @llvm.assume(i1 %197)
  %198 = shl nuw i32 %.tr.i, 8
  %199 = sext i32 %5 to i64
  %200 = sext i32 %4 to i64
  %201 = sext i32 %198 to i64
  %202 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %203 = inttoptr i32 %202 to ptr addrspace(3)
  %204 = getelementptr inbounds i8, ptr addrspace(3) %203, i32 768
  %205 = and i64 %196, 15
  %206 = icmp slt i64 %205, %200
  br label %219

.lr.ph559.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i.i
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
  %212 = icmp ult i64 %211, 128
  call void @llvm.assume(i1 %212)
  %213 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %214 = inttoptr i32 %213 to ptr addrspace(3)
  %215 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 512
  %216 = getelementptr inbounds i8, ptr addrspace(3) %214, i32 768
  %217 = and i64 %211, 112
  %218 = and i64 %211, 15
  br label %238

219:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i.i, %.lr.ph.i
  %220 = phi i64 [ %196, %.lr.ph.i ], [ %231, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i.i ]
  %221 = lshr i64 %220, 4
  %222 = icmp slt i64 %221, %199
  %223 = and i1 %222, %206
  br i1 %223, label %224, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i.i

224:                                              ; preds = %219
  %225 = and i64 %220, 9223372036854775792
  %226 = or disjoint i64 %225, %201
  %227 = or disjoint i64 %226, %205
  %228 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %227
  %.sroa.0248.0.copyload.i = load i16, ptr %228, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit10.i.i.i.i: ; preds = %224, %219
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %224 ], [ 0, %219 ]
  %229 = trunc i64 %220 to i32
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %204, i32 %229
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %230, align 2, !tbaa.struct !23
  %231 = add nuw nsw i64 %220, 128
  %232 = icmp ult i64 %220, 128
  br i1 %232, label %219, label %.lr.ph559.i, !llvm.loop !32

._crit_edge560.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %233 = trunc i64 %211 to i32
  %234 = getelementptr inbounds float, ptr addrspace(3) %214, i32 %233
  store float %439, ptr addrspace(3) %234, align 4, !tbaa !33
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %235 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %236 = icmp ult i64 %235, 128
  call void @llvm.assume(i1 %236)
  %237 = icmp eq i64 %235, 0
  br i1 %237, label %442, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

238:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph559.i
  %239 = phi i64 [ 0, %.lr.ph559.i ], [ %440, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %240 = phi float [ 0.000000e+00, %.lr.ph559.i ], [ %439, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %241 = add nuw nsw i64 %239, %217
  %242 = trunc i64 %241 to i32
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %242
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %243, align 2, !tbaa.struct !23
  %244 = shl nuw nsw i64 %239, 4
  %245 = or disjoint i64 %244, %218
  %246 = trunc i64 %245 to i32
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %246
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %247, align 2, !tbaa.struct !23
  %248 = zext i16 %.sroa.0233.0.copyload.i to i32
  %249 = lshr i32 %248, 10
  %250 = and i32 %249, 31
  %251 = and i32 %248, 1023
  switch i32 %250, label %257 [
    i32 31, label %252
    i32 0, label %259
  ]

252:                                              ; preds = %238
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %253 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %251, 0
  %254 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %255 = or disjoint i32 %254, %253
  %256 = bitcast i32 %255 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

257:                                              ; preds = %238
  %258 = or disjoint i32 %251, 1024
  br label %259

259:                                              ; preds = %257, %238
  %260 = phi i32 [ %258, %257 ], [ %251, %238 ]
  %261 = uitofp i32 %260 to float
  %.not.i = icmp eq i32 %250, 0
  %262 = add nsw i32 %250, -25
  %263 = select i1 %.not.i, i32 -24, i32 %262
  %264 = call float @__ocml_ldexp_f32(float noundef %261, i32 noundef %263) #6
  %265 = fneg contract float %264
  %.not516517.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %266 = select contract i1 %.not516517.i, float %265, float %264
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %259, %252
  %267 = phi float [ %256, %252 ], [ %266, %259 ]
  %268 = zext i16 %.sroa.0224.0.copyload.i to i32
  %269 = lshr i32 %268, 10
  %270 = and i32 %269, 31
  %271 = and i32 %268, 1023
  switch i32 %270, label %277 [
    i32 31, label %272
    i32 0, label %279
  ]

272:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %273 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %271, 0
  %274 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %275 = or disjoint i32 %274, %273
  %276 = bitcast i32 %275 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %278 = or disjoint i32 %271, 1024
  br label %279

279:                                              ; preds = %277, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %280 = phi i32 [ %278, %277 ], [ %271, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %281 = uitofp i32 %280 to float
  %.not518.i = icmp eq i32 %270, 0
  %282 = add nsw i32 %270, -25
  %283 = select i1 %.not518.i, i32 -24, i32 %282
  %284 = call float @__ocml_ldexp_f32(float noundef %281, i32 noundef %283) #6
  %285 = fneg contract float %284
  %.not519520.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %286 = select contract i1 %.not519520.i, float %285, float %284
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %279, %272
  %287 = phi float [ %276, %272 ], [ %286, %279 ]
  %288 = fmul contract float %267, %287
  %289 = fadd contract float %240, %288
  %290 = or disjoint i64 %239, 1
  %291 = add nuw nsw i64 %290, %217
  %292 = trunc i64 %291 to i32
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %292
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %293, align 2, !tbaa.struct !23
  %294 = shl nuw nsw i64 %290, 4
  %295 = or disjoint i64 %294, %218
  %296 = trunc i64 %295 to i32
  %297 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %296
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %297, align 2, !tbaa.struct !23
  %298 = zext i16 %.sroa.0215.0.copyload.i to i32
  %299 = lshr i32 %298, 10
  %300 = and i32 %299, 31
  %301 = and i32 %298, 1023
  switch i32 %300, label %307 [
    i32 31, label %302
    i32 0, label %309
  ]

302:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %303 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not544.i = icmp eq i32 %301, 0
  %304 = select i1 %.not544.i, i32 2139095040, i32 2143289344
  %305 = or disjoint i32 %304, %303
  %306 = bitcast i32 %305 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

307:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %308 = or disjoint i32 %301, 1024
  br label %309

309:                                              ; preds = %307, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %310 = phi i32 [ %308, %307 ], [ %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %311 = uitofp i32 %310 to float
  %.not521.i = icmp eq i32 %300, 0
  %312 = add nsw i32 %300, -25
  %313 = select i1 %.not521.i, i32 -24, i32 %312
  %314 = call float @__ocml_ldexp_f32(float noundef %311, i32 noundef %313) #6
  %315 = fneg contract float %314
  %.not522523.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %316 = select contract i1 %.not522523.i, float %315, float %314
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %309, %302
  %317 = phi float [ %306, %302 ], [ %316, %309 ]
  %318 = zext i16 %.sroa.0206.0.copyload.i to i32
  %319 = lshr i32 %318, 10
  %320 = and i32 %319, 31
  %321 = and i32 %318, 1023
  switch i32 %320, label %327 [
    i32 31, label %322
    i32 0, label %329
  ]

322:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %323 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not543.i = icmp eq i32 %321, 0
  %324 = select i1 %.not543.i, i32 2139095040, i32 2143289344
  %325 = or disjoint i32 %324, %323
  %326 = bitcast i32 %325 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %328 = or disjoint i32 %321, 1024
  br label %329

329:                                              ; preds = %327, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %330 = phi i32 [ %328, %327 ], [ %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %331 = uitofp i32 %330 to float
  %.not524.i = icmp eq i32 %320, 0
  %332 = add nsw i32 %320, -25
  %333 = select i1 %.not524.i, i32 -24, i32 %332
  %334 = call float @__ocml_ldexp_f32(float noundef %331, i32 noundef %333) #6
  %335 = fneg contract float %334
  %.not525526.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %336 = select contract i1 %.not525526.i, float %335, float %334
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %329, %322
  %337 = phi float [ %326, %322 ], [ %336, %329 ]
  %338 = fmul contract float %317, %337
  %339 = fadd contract float %289, %338
  %340 = or disjoint i64 %239, 2
  %341 = add nuw nsw i64 %340, %217
  %342 = trunc i64 %341 to i32
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %342
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %343, align 2, !tbaa.struct !23
  %344 = shl nuw nsw i64 %340, 4
  %345 = or disjoint i64 %344, %218
  %346 = trunc i64 %345 to i32
  %347 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %346
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %347, align 2, !tbaa.struct !23
  %348 = zext i16 %.sroa.0197.0.copyload.i to i32
  %349 = lshr i32 %348, 10
  %350 = and i32 %349, 31
  %351 = and i32 %348, 1023
  switch i32 %350, label %357 [
    i32 31, label %352
    i32 0, label %359
  ]

352:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %353 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not542.i = icmp eq i32 %351, 0
  %354 = select i1 %.not542.i, i32 2139095040, i32 2143289344
  %355 = or disjoint i32 %354, %353
  %356 = bitcast i32 %355 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

357:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %358 = or disjoint i32 %351, 1024
  br label %359

359:                                              ; preds = %357, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %360 = phi i32 [ %358, %357 ], [ %351, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %361 = uitofp i32 %360 to float
  %.not527.i = icmp eq i32 %350, 0
  %362 = add nsw i32 %350, -25
  %363 = select i1 %.not527.i, i32 -24, i32 %362
  %364 = call float @__ocml_ldexp_f32(float noundef %361, i32 noundef %363) #6
  %365 = fneg contract float %364
  %.not528529.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %366 = select contract i1 %.not528529.i, float %365, float %364
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %359, %352
  %367 = phi float [ %356, %352 ], [ %366, %359 ]
  %368 = zext i16 %.sroa.0188.0.copyload.i to i32
  %369 = lshr i32 %368, 10
  %370 = and i32 %369, 31
  %371 = and i32 %368, 1023
  switch i32 %370, label %377 [
    i32 31, label %372
    i32 0, label %379
  ]

372:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %373 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not541.i = icmp eq i32 %371, 0
  %374 = select i1 %.not541.i, i32 2139095040, i32 2143289344
  %375 = or disjoint i32 %374, %373
  %376 = bitcast i32 %375 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i

377:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %378 = or disjoint i32 %371, 1024
  br label %379

379:                                              ; preds = %377, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %380 = phi i32 [ %378, %377 ], [ %371, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %381 = uitofp i32 %380 to float
  %.not530.i = icmp eq i32 %370, 0
  %382 = add nsw i32 %370, -25
  %383 = select i1 %.not530.i, i32 -24, i32 %382
  %384 = call float @__ocml_ldexp_f32(float noundef %381, i32 noundef %383) #6
  %385 = fneg contract float %384
  %.not531532.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %386 = select contract i1 %.not531532.i, float %385, float %384
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i: ; preds = %379, %372
  %387 = phi float [ %376, %372 ], [ %386, %379 ]
  %388 = fmul contract float %367, %387
  %389 = fadd contract float %339, %388
  %390 = or disjoint i64 %239, 3
  %391 = add nuw nsw i64 %390, %217
  %392 = trunc i64 %391 to i32
  %393 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %215, i32 %392
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %393, align 2, !tbaa.struct !23
  %394 = shl nuw nsw i64 %390, 4
  %395 = or disjoint i64 %394, %218
  %396 = trunc i64 %395 to i32
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %216, i32 %396
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %397, align 2, !tbaa.struct !23
  %398 = zext i16 %.sroa.0179.0.copyload.i to i32
  %399 = lshr i32 %398, 10
  %400 = and i32 %399, 31
  %401 = and i32 %398, 1023
  switch i32 %400, label %407 [
    i32 31, label %402
    i32 0, label %409
  ]

402:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %403 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not540.i = icmp eq i32 %401, 0
  %404 = select i1 %.not540.i, i32 2139095040, i32 2143289344
  %405 = or disjoint i32 %404, %403
  %406 = bitcast i32 %405 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

407:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i
  %408 = or disjoint i32 %401, 1024
  br label %409

409:                                              ; preds = %407, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i
  %410 = phi i32 [ %408, %407 ], [ %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i.i ]
  %411 = uitofp i32 %410 to float
  %.not533.i = icmp eq i32 %400, 0
  %412 = add nsw i32 %400, -25
  %413 = select i1 %.not533.i, i32 -24, i32 %412
  %414 = call float @__ocml_ldexp_f32(float noundef %411, i32 noundef %413) #6
  %415 = fneg contract float %414
  %.not534535.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %416 = select contract i1 %.not534535.i, float %415, float %414
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i: ; preds = %409, %402
  %417 = phi float [ %406, %402 ], [ %416, %409 ]
  %418 = zext i16 %.sroa.0170.0.copyload.i to i32
  %419 = lshr i32 %418, 10
  %420 = and i32 %419, 31
  %421 = and i32 %418, 1023
  switch i32 %420, label %427 [
    i32 31, label %422
    i32 0, label %429
  ]

422:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %423 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not539.i = icmp eq i32 %421, 0
  %424 = select i1 %.not539.i, i32 2139095040, i32 2143289344
  %425 = or disjoint i32 %424, %423
  %426 = bitcast i32 %425 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

427:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %428 = or disjoint i32 %421, 1024
  br label %429

429:                                              ; preds = %427, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i
  %430 = phi i32 [ %428, %427 ], [ %421, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i.i ]
  %431 = uitofp i32 %430 to float
  %.not536.i = icmp eq i32 %420, 0
  %432 = add nsw i32 %420, -25
  %433 = select i1 %.not536.i, i32 -24, i32 %432
  %434 = call float @__ocml_ldexp_f32(float noundef %431, i32 noundef %433) #6
  %435 = fneg contract float %434
  %.not537538.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %436 = select contract i1 %.not537538.i, float %435, float %434
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %429, %422
  %437 = phi float [ %426, %422 ], [ %436, %429 ]
  %438 = fmul contract float %417, %437
  %439 = fadd contract float %389, %438
  %440 = add nuw nsw i64 %239, 4
  %441 = icmp ult i64 %239, 12
  br i1 %441, label %238, label %._crit_edge560.i, !llvm.loop !35

442:                                              ; preds = %._crit_edge560.i
  %443 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %444 = icmp eq i64 %443, 0
  call void @llvm.assume(i1 %444)
  %445 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %446 = icmp eq i64 %445, 0
  call void @llvm.assume(i1 %446)
  %447 = sext i32 %3 to i64
  %448 = call i32 @llvm.amdgcn.groupstaticsize()
  %449 = inttoptr i32 %448 to ptr addrspace(3)
  %450 = zext i32 %30 to i64
  %451 = icmp sgt i32 %4, 0
  %452 = icmp ugt i32 %4, 1
  %453 = icmp ugt i32 %4, 2
  %454 = icmp ugt i32 %4, 3
  %455 = icmp ugt i32 %4, 4
  %456 = icmp ugt i32 %4, 5
  %457 = icmp ugt i32 %4, 6
  %458 = icmp ugt i32 %4, 7
  %459 = icmp ugt i32 %4, 8
  %460 = icmp ugt i32 %4, 9
  %461 = icmp ugt i32 %4, 10
  %462 = icmp ugt i32 %4, 11
  %463 = icmp ugt i32 %4, 12
  %464 = icmp ugt i32 %4, 13
  %465 = icmp ugt i32 %4, 14
  %466 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split562.us.i, %442
  %467 = phi i64 [ 0, %442 ], [ %473, %.split562.us.i ]
  %468 = icmp slt i64 %467, %447
  %469 = shl i64 %467, 4
  %.tr515.i = trunc i64 %467 to i32
  %470 = shl i32 %.tr515.i, 4
  %471 = sext i32 %470 to i64
  %472 = add nsw i64 %471, %450
  %.fr563.i = freeze i1 %468
  %brmerge.not.i = select i1 %.fr563.i, i1 %451, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split562.us.i

.split562.us.i:                                   ; preds = %562, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %473 = add nuw nsw i64 %467, 1
  %exitcond567.not.i = icmp eq i64 %473, 8
  br i1 %exitcond567.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %474 = trunc i64 %469 to i32
  %475 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !33
  %477 = getelementptr inbounds float, ptr %9, i64 %472
  store float %476, ptr %477, align 32, !tbaa !33
  br i1 %452, label %.preheader.split.2.i, label %.split562.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %478 = trunc i64 %469 to i32
  %479 = or disjoint i32 %478, 1
  %480 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !33
  %482 = or disjoint i64 %472, 1
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 4, !tbaa !33
  br i1 %453, label %.preheader.split.3.i, label %.split562.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %484 = trunc i64 %469 to i32
  %485 = or disjoint i32 %484, 2
  %486 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !33
  %488 = or disjoint i64 %472, 2
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 8, !tbaa !33
  br i1 %454, label %.preheader.split.4.i, label %.split562.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %490 = trunc i64 %469 to i32
  %491 = or disjoint i32 %490, 3
  %492 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !33
  %494 = or disjoint i64 %472, 3
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 4, !tbaa !33
  br i1 %455, label %.preheader.split.5.i, label %.split562.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %496 = trunc i64 %469 to i32
  %497 = or disjoint i32 %496, 4
  %498 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !33
  %500 = or disjoint i64 %472, 4
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 16, !tbaa !33
  br i1 %456, label %.preheader.split.6.i, label %.split562.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %502 = trunc i64 %469 to i32
  %503 = or disjoint i32 %502, 5
  %504 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !33
  %506 = or disjoint i64 %472, 5
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 4, !tbaa !33
  br i1 %457, label %.preheader.split.7.i, label %.split562.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %508 = trunc i64 %469 to i32
  %509 = or disjoint i32 %508, 6
  %510 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !33
  %512 = or disjoint i64 %472, 6
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 8, !tbaa !33
  br i1 %458, label %.preheader.split.8.i, label %.split562.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %514 = trunc i64 %469 to i32
  %515 = or disjoint i32 %514, 7
  %516 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !33
  %518 = or disjoint i64 %472, 7
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 4, !tbaa !33
  br i1 %459, label %.preheader.split.9.i, label %.split562.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %520 = trunc i64 %469 to i32
  %521 = or disjoint i32 %520, 8
  %522 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !33
  %524 = or disjoint i64 %472, 8
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 32, !tbaa !33
  br i1 %460, label %.preheader.split.10.i, label %.split562.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %526 = trunc i64 %469 to i32
  %527 = or disjoint i32 %526, 9
  %528 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !33
  %530 = or disjoint i64 %472, 9
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 4, !tbaa !33
  br i1 %461, label %.preheader.split.11.i, label %.split562.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %532 = trunc i64 %469 to i32
  %533 = or disjoint i32 %532, 10
  %534 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %533
  %535 = load float, ptr addrspace(3) %534, align 4, !tbaa !33
  %536 = or disjoint i64 %472, 10
  %537 = getelementptr inbounds float, ptr %9, i64 %536
  store float %535, ptr %537, align 8, !tbaa !33
  br i1 %462, label %.preheader.split.12.i, label %.split562.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %538 = trunc i64 %469 to i32
  %539 = or disjoint i32 %538, 11
  %540 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !33
  %542 = or disjoint i64 %472, 11
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 4, !tbaa !33
  br i1 %463, label %.preheader.split.13.i, label %.split562.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %544 = trunc i64 %469 to i32
  %545 = or disjoint i32 %544, 12
  %546 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %545
  %547 = load float, ptr addrspace(3) %546, align 4, !tbaa !33
  %548 = or disjoint i64 %472, 12
  %549 = getelementptr inbounds float, ptr %9, i64 %548
  store float %547, ptr %549, align 16, !tbaa !33
  br i1 %464, label %.preheader.split.14.i, label %.split562.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %550 = trunc i64 %469 to i32
  %551 = or disjoint i32 %550, 13
  %552 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %551
  %553 = load float, ptr addrspace(3) %552, align 4, !tbaa !33
  %554 = or disjoint i64 %472, 13
  %555 = getelementptr inbounds float, ptr %9, i64 %554
  store float %553, ptr %555, align 4, !tbaa !33
  br i1 %465, label %.preheader.split.15.i, label %.split562.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %556 = trunc i64 %469 to i32
  %557 = or disjoint i32 %556, 14
  %558 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %557
  %559 = load float, ptr addrspace(3) %558, align 4, !tbaa !33
  %560 = or disjoint i64 %472, 14
  %561 = getelementptr inbounds float, ptr %9, i64 %560
  store float %559, ptr %561, align 8, !tbaa !33
  br i1 %466, label %562, label %.split562.us.i

562:                                              ; preds = %.preheader.split.15.i
  %563 = trunc i64 %469 to i32
  %564 = or disjoint i32 %563, 15
  %565 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %564
  %566 = load float, ptr addrspace(3) %565, align 4, !tbaa !33
  %567 = or disjoint i64 %472, 15
  %568 = getelementptr inbounds float, ptr %9, i64 %567
  store float %566, ptr %568, align 4, !tbaa !33
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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
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
!32 = distinct !{!32, !29, !30, !31}
!33 = !{!34, !34, i64 0}
!34 = !{!"float", !26, i64 0}
!35 = distinct !{!35, !29}
!36 = distinct !{!36, !29}
;----------------- End AdaptiveCpp IR dump ---------------
