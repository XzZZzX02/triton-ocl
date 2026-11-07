;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-thvzyeb9/kernel.cpp"
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
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !10
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 8388608
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
  %33 = icmp ult i64 %32, 256
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %37 = icmp ult i64 %36, 8388607
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = shl i32 %.tr.i, 11
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %40 = icmp ult i64 %39, 256
  call void @llvm.assume(i1 %40)
  %41 = icmp eq i64 %39, 0
  br i1 %41, label %47, label %.lr.ph814.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %42 = phi i64 [ %32, %6 ], [ %45, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %43 = trunc i64 %42 to i32
  %44 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %43
  store float 0.000000e+00, ptr addrspace(3) %44, align 4, !tbaa !19
  %45 = add nuw nsw i64 %42, 256
  %46 = icmp ult i64 %42, 1792
  br i1 %46, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

47:                                               ; preds = %._crit_edge.i
  %48 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %51 = icmp eq i64 %50, 0
  call void @llvm.assume(i1 %51)
  %52 = sext i32 %5 to i64
  %53 = sext i32 %3 to i64
  %54 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %55 = inttoptr i32 %54 to ptr addrspace(3)
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 8192
  %57 = sext i32 %38 to i64
  br label %.preheader804.i

.preheader804.i:                                  ; preds = %.split.us.i, %47
  %58 = phi i64 [ 0, %47 ], [ %66, %.split.us.i ]
  %59 = icmp slt i64 %58, %52
  %60 = shl i64 %58, 5
  %.tr798.i = trunc i64 %58 to i32
  %61 = shl i32 %.tr798.i, 5
  %62 = sext i32 %61 to i64
  %63 = add nsw i64 %62, %57
  %.fr.i = freeze i1 %59
  br i1 %.fr.i, label %.preheader804.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i: ; preds = %.preheader804.i
  %.tr842.i = trunc i64 %58 to i32
  %64 = shl i32 %.tr842.i, 6
  %65 = add i32 %64, 8192
  %scevgep.i = getelementptr i8, ptr addrspace(3) %55, i32 %65
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.i, i8 0, i32 64, i1 false)
  br label %.split.us.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.us.preheader.i
  %66 = add nuw nsw i64 %58, 1
  %exitcond834.not.i = icmp eq i64 %66, 64
  br i1 %exitcond834.not.i, label %.lr.ph814.i, label %.preheader804.i, !llvm.loop !25

.preheader804.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i, %.preheader804.i
  %67 = phi i64 [ %75, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i ], [ 0, %.preheader804.i ]
  %68 = icmp slt i64 %67, %53
  br i1 %68, label %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i

69:                                               ; preds = %.preheader804.split.i
  %70 = add nuw nsw i64 %63, %67
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0332.0.copyload.i = load i16, ptr %71, align 2, !tbaa.struct !28
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i: ; preds = %69, %.preheader804.split.i
  %.sroa.0334.2.i = phi i16 [ %.sroa.0332.0.copyload.i, %69 ], [ 0, %.preheader804.split.i ]
  %72 = add nuw nsw i64 %67, %60
  %73 = trunc i64 %72 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %73
  store i16 %.sroa.0334.2.i, ptr addrspace(3) %74, align 2, !tbaa.struct !28
  %75 = add nuw nsw i64 %67, 1
  %exitcond.not.i = icmp eq i64 %75, 32
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader804.split.i, !llvm.loop !31

.lr.ph814.i:                                      ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %77 = icmp eq i64 %76, 0
  call void @llvm.assume(i1 %77)
  %78 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %79 = icmp eq i64 %78, 0
  call void @llvm.assume(i1 %79)
  %80 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %81 = icmp ult i64 %80, 256
  call void @llvm.assume(i1 %81)
  %82 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %83 = inttoptr i32 %82 to ptr addrspace(3)
  %84 = getelementptr inbounds i8, ptr addrspace(3) %83, i32 8192
  %85 = getelementptr inbounds i8, ptr addrspace(3) %83, i32 12288
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

._crit_edge815.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %86 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %87 = icmp ult i64 %86, 256
  call void @llvm.assume(i1 %87)
  %88 = icmp eq i64 %86, 0
  br i1 %88, label %100, label %.lr.ph820.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph814.i
  %89 = phi i64 [ %80, %.lr.ph814.i ], [ %98, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %90 = lshr i64 %89, 6
  %91 = shl nuw nsw i64 %89, 5
  %92 = and i64 %91, 2016
  %93 = or disjoint i64 %92, %90
  %94 = trunc i64 %93 to i32
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %94
  %.sroa.0431.0.copyload.i = load i16, ptr addrspace(3) %95, align 2, !tbaa.struct !28
  %96 = trunc i64 %89 to i32
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %96
  store i16 %.sroa.0431.0.copyload.i, ptr addrspace(3) %97, align 2, !tbaa.struct !28
  %98 = add nuw nsw i64 %89, 256
  %99 = icmp ult i64 %89, 1792
  br i1 %99, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %._crit_edge815.i, !llvm.loop !32

100:                                              ; preds = %._crit_edge815.i
  %101 = shl i32 %.tr.i, 12
  %102 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %103 = icmp eq i64 %102, 0
  call void @llvm.assume(i1 %103)
  %104 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %105 = icmp eq i64 %104, 0
  call void @llvm.assume(i1 %105)
  %106 = sext i32 %4 to i64
  %107 = sext i32 %5 to i64
  %108 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %109 = inttoptr i32 %108 to ptr addrspace(3)
  %110 = getelementptr inbounds i8, ptr addrspace(3) %109, i32 16384
  %111 = sext i32 %101 to i64
  br label %.preheader803.i

.preheader803.i:                                  ; preds = %.split817.us.i, %100
  %112 = phi i64 [ 0, %100 ], [ %120, %.split817.us.i ]
  %113 = icmp slt i64 %112, %106
  %114 = shl i64 %112, 6
  %.tr797.i = trunc i64 %112 to i32
  %115 = shl i32 %.tr797.i, 6
  %116 = sext i32 %115 to i64
  %117 = add nsw i64 %116, %111
  %.fr818.i = freeze i1 %113
  br i1 %.fr818.i, label %.preheader803.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader803.i
  %.tr841.i = trunc i64 %112 to i32
  %118 = shl i32 %.tr841.i, 7
  %119 = add i32 %118, 16384
  %scevgep835.i = getelementptr i8, ptr addrspace(3) %109, i32 %119
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep835.i, i8 0, i32 128, i1 false)
  br label %.split817.us.i

.split817.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %120 = add nuw nsw i64 %112, 1
  %exitcond837.not.i = icmp eq i64 %120, 64
  br i1 %exitcond837.not.i, label %.lr.ph820.i, label %.preheader803.i, !llvm.loop !33

.preheader803.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader803.i
  %121 = phi i64 [ %129, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader803.i ]
  %122 = icmp slt i64 %121, %107
  br i1 %122, label %123, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

123:                                              ; preds = %.preheader803.split.i
  %124 = add nuw nsw i64 %117, %121
  %125 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %124
  %.sroa.0295.0.copyload.i = load i16, ptr %125, align 2, !tbaa.struct !28
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %123, %.preheader803.split.i
  %.sroa.0297.2.i = phi i16 [ %.sroa.0295.0.copyload.i, %123 ], [ 0, %.preheader803.split.i ]
  %126 = add nuw nsw i64 %121, %114
  %127 = trunc i64 %126 to i32
  %128 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %110, i32 %127
  store i16 %.sroa.0297.2.i, ptr addrspace(3) %128, align 2, !tbaa.struct !28
  %129 = add nuw nsw i64 %121, 1
  %exitcond836.not.i = icmp eq i64 %129, 64
  br i1 %exitcond836.not.i, label %.split817.us.i, label %.preheader803.split.i, !llvm.loop !34

.lr.ph820.i:                                      ; preds = %.split817.us.i, %._crit_edge815.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %131 = icmp eq i64 %130, 0
  call void @llvm.assume(i1 %131)
  %132 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %133 = icmp eq i64 %132, 0
  call void @llvm.assume(i1 %133)
  %134 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %135 = icmp ult i64 %134, 256
  call void @llvm.assume(i1 %135)
  %136 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %137 = inttoptr i32 %136 to ptr addrspace(3)
  %138 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 16384
  %139 = getelementptr inbounds i8, ptr addrspace(3) %137, i32 24576
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i

.lr.ph823.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %140 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %141 = icmp eq i64 %140, 0
  call void @llvm.assume(i1 %141)
  %142 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %143 = icmp eq i64 %142, 0
  call void @llvm.assume(i1 %143)
  %144 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %145 = icmp ult i64 %144, 256
  call void @llvm.assume(i1 %145)
  %146 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %147 = inttoptr i32 %146 to ptr addrspace(3)
  %148 = getelementptr inbounds i8, ptr addrspace(3) %147, i32 12288
  %149 = getelementptr inbounds i8, ptr addrspace(3) %147, i32 24576
  %150 = and i64 %144, 15
  %151 = or disjoint i64 %150, 16
  %152 = or disjoint i64 %150, 32
  %153 = or disjoint i64 %150, 48
  br label %168

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, %.lr.ph820.i
  %154 = phi i64 [ %134, %.lr.ph820.i ], [ %163, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i ]
  %155 = lshr i64 %154, 6
  %156 = shl nuw nsw i64 %154, 6
  %157 = and i64 %156, 4032
  %158 = or disjoint i64 %157, %155
  %159 = trunc i64 %158 to i32
  %160 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %159
  %.sroa.0432.0.copyload.i = load i16, ptr addrspace(3) %160, align 2, !tbaa.struct !28
  %161 = trunc i64 %154 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %139, i32 %161
  store i16 %.sroa.0432.0.copyload.i, ptr addrspace(3) %162, align 2, !tbaa.struct !28
  %163 = add nuw nsw i64 %154, 256
  %164 = icmp ult i64 %154, 3840
  br i1 %164, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit12.i.i.i, label %.lr.ph823.i, !llvm.loop !35

._crit_edge824.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %165 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %166 = icmp ult i64 %165, 256
  call void @llvm.assume(i1 %166)
  %167 = icmp eq i64 %165, 0
  br i1 %167, label %321, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

168:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph823.i
  %169 = phi i64 [ %144, %.lr.ph823.i ], [ %188, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %170 = shl nuw nsw i64 %169, 2
  %171 = and i64 %170, 1984
  %172 = or disjoint i64 %171, %150
  %173 = trunc i64 %172 to i32
  %174 = getelementptr inbounds float, ptr addrspace(3) %147, i32 %173
  %175 = load float, ptr addrspace(3) %174, align 4, !tbaa !19
  %176 = or disjoint i64 %171, %151
  %177 = trunc i64 %176 to i32
  %178 = getelementptr inbounds float, ptr addrspace(3) %147, i32 %177
  %179 = load float, ptr addrspace(3) %178, align 4, !tbaa !19
  %180 = or disjoint i64 %171, %152
  %181 = trunc i64 %180 to i32
  %182 = getelementptr inbounds float, ptr addrspace(3) %147, i32 %181
  %183 = load float, ptr addrspace(3) %182, align 4, !tbaa !19
  %184 = or disjoint i64 %171, %153
  %185 = trunc i64 %184 to i32
  %186 = getelementptr inbounds float, ptr addrspace(3) %147, i32 %185
  %187 = load float, ptr addrspace(3) %186, align 4, !tbaa !19
  br label %190

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %244, ptr addrspace(3) %174, align 4, !tbaa !19
  store float %269, ptr addrspace(3) %178, align 4, !tbaa !19
  store float %294, ptr addrspace(3) %182, align 4, !tbaa !19
  store float %319, ptr addrspace(3) %186, align 4, !tbaa !19
  %188 = add nuw nsw i64 %169, 256
  %189 = icmp ult i64 %169, 256
  br i1 %189, label %168, label %._crit_edge824.i, !llvm.loop !36

190:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %168
  %191 = phi i64 [ 0, %168 ], [ %320, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %192 = phi float [ %187, %168 ], [ %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %193 = phi float [ %183, %168 ], [ %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %194 = phi float [ %179, %168 ], [ %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %195 = phi float [ %175, %168 ], [ %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %196 = add nuw nsw i64 %191, %171
  %197 = trunc i64 %196 to i32
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %148, i32 %197
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %198, align 2, !tbaa.struct !28
  %199 = shl nuw nsw i64 %191, 6
  %200 = or disjoint i64 %199, %150
  %201 = trunc i64 %200 to i32
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %149, i32 %201
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %202, align 2, !tbaa.struct !28
  %203 = zext i16 %.sroa.0234.0.copyload.i to i32
  %204 = lshr i32 %203, 10
  %205 = and i32 %204, 31
  %206 = and i32 %203, 1023
  switch i32 %205, label %212 [
    i32 31, label %207
    i32 0, label %214
  ]

207:                                              ; preds = %190
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %208 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not796.i = icmp eq i32 %206, 0
  %209 = select i1 %.not796.i, i32 2139095040, i32 2143289344
  %210 = or disjoint i32 %209, %208
  %211 = bitcast i32 %210 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

212:                                              ; preds = %190
  %213 = or disjoint i32 %206, 1024
  br label %214

214:                                              ; preds = %212, %190
  %215 = phi i32 [ %213, %212 ], [ %206, %190 ]
  %216 = uitofp i32 %215 to float
  %.not.i = icmp eq i32 %205, 0
  %217 = add nsw i32 %205, -25
  %218 = select i1 %.not.i, i32 -24, i32 %217
  %219 = call float @__ocml_ldexp_f32(float noundef %216, i32 noundef %218) #6
  %220 = fneg contract float %219
  %.not778779.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %221 = select contract i1 %.not778779.i, float %220, float %219
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %214, %207
  %222 = phi float [ %211, %207 ], [ %221, %214 ]
  %223 = zext i16 %.sroa.0225.0.copyload.i to i32
  %224 = lshr i32 %223, 10
  %225 = and i32 %224, 31
  %226 = and i32 %223, 1023
  switch i32 %225, label %232 [
    i32 31, label %227
    i32 0, label %234
  ]

227:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %228 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not795.i = icmp eq i32 %226, 0
  %229 = select i1 %.not795.i, i32 2139095040, i32 2143289344
  %230 = or disjoint i32 %229, %228
  %231 = bitcast i32 %230 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

232:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %233 = or disjoint i32 %226, 1024
  br label %234

234:                                              ; preds = %232, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %235 = phi i32 [ %233, %232 ], [ %226, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %236 = uitofp i32 %235 to float
  %.not780.i = icmp eq i32 %225, 0
  %237 = add nsw i32 %225, -25
  %238 = select i1 %.not780.i, i32 -24, i32 %237
  %239 = call float @__ocml_ldexp_f32(float noundef %236, i32 noundef %238) #6
  %240 = fneg contract float %239
  %.not781782.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %241 = select contract i1 %.not781782.i, float %240, float %239
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %234, %227
  %242 = phi float [ %231, %227 ], [ %241, %234 ]
  %243 = fmul contract float %222, %242
  %244 = fadd contract float %195, %243
  %245 = or disjoint i64 %199, %151
  %246 = trunc i64 %245 to i32
  %247 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %149, i32 %246
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %247, align 2, !tbaa.struct !28
  %248 = zext i16 %.sroa.0216.0.copyload.i to i32
  %249 = lshr i32 %248, 10
  %250 = and i32 %249, 31
  %251 = and i32 %248, 1023
  switch i32 %250, label %257 [
    i32 31, label %252
    i32 0, label %259
  ]

252:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %253 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not794.i = icmp eq i32 %251, 0
  %254 = select i1 %.not794.i, i32 2139095040, i32 2143289344
  %255 = or disjoint i32 %254, %253
  %256 = bitcast i32 %255 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

257:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %258 = or disjoint i32 %251, 1024
  br label %259

259:                                              ; preds = %257, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %260 = phi i32 [ %258, %257 ], [ %251, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %261 = uitofp i32 %260 to float
  %.not783.i = icmp eq i32 %250, 0
  %262 = add nsw i32 %250, -25
  %263 = select i1 %.not783.i, i32 -24, i32 %262
  %264 = call float @__ocml_ldexp_f32(float noundef %261, i32 noundef %263) #6
  %265 = fneg contract float %264
  %.not784785.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %266 = select contract i1 %.not784785.i, float %265, float %264
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %259, %252
  %267 = phi float [ %256, %252 ], [ %266, %259 ]
  %268 = fmul contract float %222, %267
  %269 = fadd contract float %194, %268
  %270 = or disjoint i64 %199, %152
  %271 = trunc i64 %270 to i32
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %149, i32 %271
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %272, align 2, !tbaa.struct !28
  %273 = zext i16 %.sroa.0207.0.copyload.i to i32
  %274 = lshr i32 %273, 10
  %275 = and i32 %274, 31
  %276 = and i32 %273, 1023
  switch i32 %275, label %282 [
    i32 31, label %277
    i32 0, label %284
  ]

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %278 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not793.i = icmp eq i32 %276, 0
  %279 = select i1 %.not793.i, i32 2139095040, i32 2143289344
  %280 = or disjoint i32 %279, %278
  %281 = bitcast i32 %280 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %283 = or disjoint i32 %276, 1024
  br label %284

284:                                              ; preds = %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %285 = phi i32 [ %283, %282 ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %286 = uitofp i32 %285 to float
  %.not786.i = icmp eq i32 %275, 0
  %287 = add nsw i32 %275, -25
  %288 = select i1 %.not786.i, i32 -24, i32 %287
  %289 = call float @__ocml_ldexp_f32(float noundef %286, i32 noundef %288) #6
  %290 = fneg contract float %289
  %.not787788.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %291 = select contract i1 %.not787788.i, float %290, float %289
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %284, %277
  %292 = phi float [ %281, %277 ], [ %291, %284 ]
  %293 = fmul contract float %222, %292
  %294 = fadd contract float %193, %293
  %295 = or disjoint i64 %199, %153
  %296 = trunc i64 %295 to i32
  %297 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %149, i32 %296
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %297, align 2, !tbaa.struct !28
  %298 = zext i16 %.sroa.0198.0.copyload.i to i32
  %299 = lshr i32 %298, 10
  %300 = and i32 %299, 31
  %301 = and i32 %298, 1023
  switch i32 %300, label %307 [
    i32 31, label %302
    i32 0, label %309
  ]

302:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %303 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not792.i = icmp eq i32 %301, 0
  %304 = select i1 %.not792.i, i32 2139095040, i32 2143289344
  %305 = or disjoint i32 %304, %303
  %306 = bitcast i32 %305 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

307:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %308 = or disjoint i32 %301, 1024
  br label %309

309:                                              ; preds = %307, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %310 = phi i32 [ %308, %307 ], [ %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %311 = uitofp i32 %310 to float
  %.not789.i = icmp eq i32 %300, 0
  %312 = add nsw i32 %300, -25
  %313 = select i1 %.not789.i, i32 -24, i32 %312
  %314 = call float @__ocml_ldexp_f32(float noundef %311, i32 noundef %313) #6
  %315 = fneg contract float %314
  %.not790791.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %316 = select contract i1 %.not790791.i, float %315, float %314
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %309, %302
  %317 = phi float [ %306, %302 ], [ %316, %309 ]
  %318 = fmul contract float %222, %317
  %319 = fadd contract float %192, %318
  %320 = add nuw nsw i64 %191, 1
  %exitcond838.not.i = icmp eq i64 %320, 64
  br i1 %exitcond838.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %190, !llvm.loop !37

321:                                              ; preds = %._crit_edge824.i
  %322 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %323 = icmp eq i64 %322, 0
  call void @llvm.assume(i1 %323)
  %324 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %325 = icmp eq i64 %324, 0
  call void @llvm.assume(i1 %325)
  %326 = sext i32 %3 to i64
  %327 = sext i32 %4 to i64
  %328 = call i32 @llvm.amdgcn.groupstaticsize()
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = sext i32 %38 to i64
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split826.us.i, %321
  %331 = phi i64 [ 0, %321 ], [ %337, %.split826.us.i ]
  %332 = icmp slt i64 %331, %326
  %333 = shl i64 %331, 6
  %.tr777.i = trunc i64 %331 to i32
  %334 = shl i32 %.tr777.i, 6
  %335 = sext i32 %334 to i64
  %336 = add nsw i64 %335, %330
  %.fr827.i = freeze i1 %332
  br i1 %.fr827.i, label %.preheader.split.i, label %.split826.us.i

.split826.us.i:                                   ; preds = %347, %.preheader.i
  %337 = add nuw nsw i64 %331, 1
  %exitcond840.not.i = icmp eq i64 %337, 32
  br i1 %exitcond840.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.i:                               ; preds = %347, %.preheader.i
  %338 = phi i64 [ %348, %347 ], [ 0, %.preheader.i ]
  %339 = icmp slt i64 %338, %327
  br i1 %339, label %340, label %347

340:                                              ; preds = %.preheader.split.i
  %341 = add nuw nsw i64 %338, %333
  %342 = trunc i64 %341 to i32
  %343 = getelementptr inbounds float, ptr addrspace(3) %329, i32 %342
  %344 = load float, ptr addrspace(3) %343, align 4, !tbaa !19
  %345 = add nuw nsw i64 %336, %338
  %346 = getelementptr inbounds float, ptr %9, i64 %345
  store float %344, ptr %346, align 4, !tbaa !19
  br label %347

347:                                              ; preds = %340, %.preheader.split.i
  %348 = add nuw nsw i64 %338, 1
  %exitcond839.not.i = icmp eq i64 %348, 64
  br i1 %exitcond839.not.i, label %.split826.us.i, label %.preheader.split.i, !llvm.loop !39

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge824.i, %.split826.us.i
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
!25 = distinct !{!25, !24, !26, !27}
!26 = !{!"llvm.loop.vectorize.width", i32 1}
!27 = !{!"llvm.loop.interleave.count", i32 1}
!28 = !{i64 0, i64 2, !29}
!29 = !{!30, !30, i64 0}
!30 = !{!"short", !21, i64 0}
!31 = distinct !{!31, !24, !26, !27}
!32 = distinct !{!32, !24, !26, !27}
!33 = distinct !{!33, !24, !26, !27}
!34 = distinct !{!34, !24, !26, !27}
!35 = distinct !{!35, !24, !26, !27}
!36 = distinct !{!36, !24}
!37 = distinct !{!37, !24}
!38 = distinct !{!38, !24}
!39 = distinct !{!39, !24}
;----------------- End AdaptiveCpp IR dump ---------------
