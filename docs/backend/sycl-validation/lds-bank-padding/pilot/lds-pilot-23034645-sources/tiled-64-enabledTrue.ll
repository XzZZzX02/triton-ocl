;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-zn_w4f9s/kernel.cpp"
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
  br i1 %40, label %46, label %.loopexit655.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %41 = phi i64 [ %32, %6 ], [ %44, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %42
  store float 0.000000e+00, ptr addrspace(3) %43, align 4, !tbaa !19
  %44 = add nuw nsw i64 %41, 64
  %45 = icmp ult i64 %41, 1984
  br i1 %45, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %._crit_edge.i, !llvm.loop !23

46:                                               ; preds = %._crit_edge.i
  %47 = shl i32 %.tr.i, 12
  %48 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %51 = icmp eq i64 %50, 0
  call void @llvm.assume(i1 %51)
  %52 = sext i32 %3 to i64
  %53 = sext i32 %5 to i64
  %54 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %55 = inttoptr i32 %54 to ptr addrspace(3)
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 8192
  %57 = sext i32 %47 to i64
  br label %.preheader654.i

.preheader654.i:                                  ; preds = %.split.us.i, %46
  %58 = phi i64 [ 0, %46 ], [ %67, %.split.us.i ]
  %59 = icmp slt i64 %58, %52
  %60 = mul nuw nsw i64 %58, 66
  %.tr648.i = trunc i64 %58 to i32
  %61 = shl i32 %.tr648.i, 6
  %62 = sext i32 %61 to i64
  %63 = add nsw i64 %62, %57
  %.fr.i = freeze i1 %59
  br i1 %.fr.i, label %.preheader654.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.us.preheader.i: ; preds = %.preheader654.i
  %64 = trunc i64 %58 to i32
  %65 = mul i32 %64, 132
  %66 = add i32 %65, 8192
  %scevgep.i = getelementptr i8, ptr addrspace(3) %55, i32 %66
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.i, i8 0, i32 128, i1 false)
  br label %.split.us.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.us.preheader.i
  %67 = add nuw nsw i64 %58, 1
  %exitcond678.not.i = icmp eq i64 %67, 64
  br i1 %exitcond678.not.i, label %.loopexit655.i, label %.preheader654.i, !llvm.loop !25

.preheader654.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i, %.preheader654.i
  %68 = phi i64 [ %76, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i ], [ 0, %.preheader654.i ]
  %69 = icmp slt i64 %68, %53
  br i1 %69, label %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i

70:                                               ; preds = %.preheader654.split.i
  %71 = add nuw nsw i64 %63, %68
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %71
  %.sroa.0270.0.copyload.i = load i16, ptr %72, align 2, !tbaa.struct !28
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i: ; preds = %70, %.preheader654.split.i
  %.sroa.0272.2.i = phi i16 [ %.sroa.0270.0.copyload.i, %70 ], [ 0, %.preheader654.split.i ]
  %73 = add nuw nsw i64 %68, %60
  %74 = trunc i64 %73 to i32
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %74
  store i16 %.sroa.0272.2.i, ptr addrspace(3) %75, align 2, !tbaa.struct !28
  %76 = add nuw nsw i64 %68, 1
  %exitcond.not.i = icmp eq i64 %76, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader654.split.i, !llvm.loop !31

.loopexit655.i:                                   ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = shl i32 %.tr.i, 11
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %79 = icmp ult i64 %78, 64
  call void @llvm.assume(i1 %79)
  %80 = icmp eq i64 %78, 0
  br i1 %80, label %81, label %.lr.ph667.i

81:                                               ; preds = %.loopexit655.i
  %82 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %83 = icmp eq i64 %82, 0
  call void @llvm.assume(i1 %83)
  %84 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %85 = icmp eq i64 %84, 0
  call void @llvm.assume(i1 %85)
  %86 = sext i32 %5 to i64
  %87 = sext i32 %4 to i64
  %88 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %89 = inttoptr i32 %88 to ptr addrspace(3)
  %90 = getelementptr inbounds i8, ptr addrspace(3) %89, i32 16640
  %91 = sext i32 %77 to i64
  br label %.preheader653.i

.preheader653.i:                                  ; preds = %.split664.us.i, %81
  %92 = phi i64 [ 0, %81 ], [ %100, %.split664.us.i ]
  %93 = icmp slt i64 %92, %86
  %94 = shl i64 %92, 5
  %.tr647.i = trunc i64 %92 to i32
  %95 = shl i32 %.tr647.i, 5
  %96 = sext i32 %95 to i64
  %97 = add nsw i64 %96, %91
  %.fr665.i = freeze i1 %93
  br i1 %.fr665.i, label %.preheader653.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader653.i
  %.tr685.i = trunc i64 %92 to i32
  %98 = shl i32 %.tr685.i, 6
  %99 = add i32 %98, 16640
  %scevgep679.i = getelementptr i8, ptr addrspace(3) %89, i32 %99
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep679.i, i8 0, i32 64, i1 false)
  br label %.split664.us.i

.split664.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %100 = add nuw nsw i64 %92, 1
  %exitcond681.not.i = icmp eq i64 %100, 64
  br i1 %exitcond681.not.i, label %.lr.ph667.i, label %.preheader653.i, !llvm.loop !32

.preheader653.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader653.i
  %101 = phi i64 [ %109, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader653.i ]
  %102 = icmp slt i64 %101, %87
  br i1 %102, label %103, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

103:                                              ; preds = %.preheader653.split.i
  %104 = add nuw nsw i64 %97, %101
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %104
  %.sroa.0259.0.copyload.i = load i16, ptr %105, align 2, !tbaa.struct !28
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %103, %.preheader653.split.i
  %.sroa.0261.2.i = phi i16 [ %.sroa.0259.0.copyload.i, %103 ], [ 0, %.preheader653.split.i ]
  %106 = add nuw nsw i64 %101, %94
  %107 = trunc i64 %106 to i32
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %90, i32 %107
  store i16 %.sroa.0261.2.i, ptr addrspace(3) %108, align 2, !tbaa.struct !28
  %109 = add nuw nsw i64 %101, 1
  %exitcond680.not.i = icmp eq i64 %109, 32
  br i1 %exitcond680.not.i, label %.split664.us.i, label %.preheader653.split.i, !llvm.loop !33

.lr.ph667.i:                                      ; preds = %.split664.us.i, %.loopexit655.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %111 = icmp eq i64 %110, 0
  call void @llvm.assume(i1 %111)
  %112 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %113 = icmp eq i64 %112, 0
  call void @llvm.assume(i1 %113)
  %114 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %115 = icmp ult i64 %114, 64
  call void @llvm.assume(i1 %115)
  %116 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %117 = inttoptr i32 %116 to ptr addrspace(3)
  %118 = getelementptr inbounds i8, ptr addrspace(3) %117, i32 8192
  %119 = getelementptr inbounds i8, ptr addrspace(3) %117, i32 16640
  %120 = and i64 %114, 7
  %121 = or disjoint i64 %120, 8
  %122 = or disjoint i64 %120, 16
  %123 = or disjoint i64 %120, 24
  br label %127

._crit_edge668.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %125 = icmp ult i64 %124, 64
  call void @llvm.assume(i1 %125)
  %126 = icmp eq i64 %124, 0
  br i1 %126, label %281, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

127:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph667.i
  %128 = phi i64 [ %114, %.lr.ph667.i ], [ %148, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %129 = lshr i64 %128, 3
  %130 = shl nuw nsw i64 %129, 5
  %131 = or disjoint i64 %130, %120
  %132 = trunc i64 %131 to i32
  %133 = getelementptr inbounds float, ptr addrspace(3) %117, i32 %132
  %134 = load float, ptr addrspace(3) %133, align 4, !tbaa !19
  %135 = or disjoint i64 %130, %121
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds float, ptr addrspace(3) %117, i32 %136
  %138 = load float, ptr addrspace(3) %137, align 4, !tbaa !19
  %139 = or disjoint i64 %130, %122
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds float, ptr addrspace(3) %117, i32 %140
  %142 = load float, ptr addrspace(3) %141, align 4, !tbaa !19
  %143 = or disjoint i64 %130, %123
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds float, ptr addrspace(3) %117, i32 %144
  %146 = load float, ptr addrspace(3) %145, align 4, !tbaa !19
  %147 = mul nuw nsw i64 %129, 66
  br label %150

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %204, ptr addrspace(3) %133, align 4, !tbaa !19
  store float %229, ptr addrspace(3) %137, align 4, !tbaa !19
  store float %254, ptr addrspace(3) %141, align 4, !tbaa !19
  store float %279, ptr addrspace(3) %145, align 4, !tbaa !19
  %148 = add nuw nsw i64 %128, 64
  %149 = icmp ult i64 %128, 448
  br i1 %149, label %127, label %._crit_edge668.i, !llvm.loop !34

150:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %127
  %151 = phi i64 [ 0, %127 ], [ %280, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %152 = phi float [ %146, %127 ], [ %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %153 = phi float [ %142, %127 ], [ %254, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %154 = phi float [ %138, %127 ], [ %229, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = phi float [ %134, %127 ], [ %204, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = add nuw i64 %151, %147
  %157 = trunc i64 %156 to i32
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %118, i32 %157
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %158, align 2, !tbaa.struct !28
  %159 = shl nuw nsw i64 %151, 5
  %160 = or disjoint i64 %159, %120
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %119, i32 %161
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %162, align 2, !tbaa.struct !28
  %163 = zext i16 %.sroa.0224.0.copyload.i to i32
  %164 = lshr i32 %163, 10
  %165 = and i32 %164, 31
  %166 = and i32 %163, 1023
  switch i32 %165, label %172 [
    i32 31, label %167
    i32 0, label %174
  ]

167:                                              ; preds = %150
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %168 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not646.i = icmp eq i32 %166, 0
  %169 = select i1 %.not646.i, i32 2139095040, i32 2143289344
  %170 = or disjoint i32 %169, %168
  %171 = bitcast i32 %170 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

172:                                              ; preds = %150
  %173 = or disjoint i32 %166, 1024
  br label %174

174:                                              ; preds = %172, %150
  %175 = phi i32 [ %173, %172 ], [ %166, %150 ]
  %176 = uitofp i32 %175 to float
  %.not.i = icmp eq i32 %165, 0
  %177 = add nsw i32 %165, -25
  %178 = select i1 %.not.i, i32 -24, i32 %177
  %179 = call float @__ocml_ldexp_f32(float noundef %176, i32 noundef %178) #6
  %180 = fneg contract float %179
  %.not628629.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %181 = select contract i1 %.not628629.i, float %180, float %179
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %174, %167
  %182 = phi float [ %171, %167 ], [ %181, %174 ]
  %183 = zext i16 %.sroa.0215.0.copyload.i to i32
  %184 = lshr i32 %183, 10
  %185 = and i32 %184, 31
  %186 = and i32 %183, 1023
  switch i32 %185, label %192 [
    i32 31, label %187
    i32 0, label %194
  ]

187:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %188 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not645.i = icmp eq i32 %186, 0
  %189 = select i1 %.not645.i, i32 2139095040, i32 2143289344
  %190 = or disjoint i32 %189, %188
  %191 = bitcast i32 %190 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

192:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %193 = or disjoint i32 %186, 1024
  br label %194

194:                                              ; preds = %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %195 = phi i32 [ %193, %192 ], [ %186, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %196 = uitofp i32 %195 to float
  %.not630.i = icmp eq i32 %185, 0
  %197 = add nsw i32 %185, -25
  %198 = select i1 %.not630.i, i32 -24, i32 %197
  %199 = call float @__ocml_ldexp_f32(float noundef %196, i32 noundef %198) #6
  %200 = fneg contract float %199
  %.not631632.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %201 = select contract i1 %.not631632.i, float %200, float %199
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %194, %187
  %202 = phi float [ %191, %187 ], [ %201, %194 ]
  %203 = fmul contract float %182, %202
  %204 = fadd contract float %155, %203
  %205 = or disjoint i64 %159, %121
  %206 = trunc i64 %205 to i32
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %119, i32 %206
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %207, align 2, !tbaa.struct !28
  %208 = zext i16 %.sroa.0206.0.copyload.i to i32
  %209 = lshr i32 %208, 10
  %210 = and i32 %209, 31
  %211 = and i32 %208, 1023
  switch i32 %210, label %217 [
    i32 31, label %212
    i32 0, label %219
  ]

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %213 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not644.i = icmp eq i32 %211, 0
  %214 = select i1 %.not644.i, i32 2139095040, i32 2143289344
  %215 = or disjoint i32 %214, %213
  %216 = bitcast i32 %215 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %218 = or disjoint i32 %211, 1024
  br label %219

219:                                              ; preds = %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %220 = phi i32 [ %218, %217 ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %221 = uitofp i32 %220 to float
  %.not633.i = icmp eq i32 %210, 0
  %222 = add nsw i32 %210, -25
  %223 = select i1 %.not633.i, i32 -24, i32 %222
  %224 = call float @__ocml_ldexp_f32(float noundef %221, i32 noundef %223) #6
  %225 = fneg contract float %224
  %.not634635.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %226 = select contract i1 %.not634635.i, float %225, float %224
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %219, %212
  %227 = phi float [ %216, %212 ], [ %226, %219 ]
  %228 = fmul contract float %182, %227
  %229 = fadd contract float %154, %228
  %230 = or disjoint i64 %159, %122
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %119, i32 %231
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !28
  %233 = zext i16 %.sroa.0197.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %238 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not643.i = icmp eq i32 %236, 0
  %239 = select i1 %.not643.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %245 = phi i32 [ %243, %242 ], [ %236, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %246 = uitofp i32 %245 to float
  %.not636.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not636.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #6
  %250 = fneg contract float %249
  %.not637638.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %251 = select contract i1 %.not637638.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = fmul contract float %182, %252
  %254 = fadd contract float %153, %253
  %255 = or disjoint i64 %159, %123
  %256 = trunc i64 %255 to i32
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %119, i32 %256
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %257, align 2, !tbaa.struct !28
  %258 = zext i16 %.sroa.0188.0.copyload.i to i32
  %259 = lshr i32 %258, 10
  %260 = and i32 %259, 31
  %261 = and i32 %258, 1023
  switch i32 %260, label %267 [
    i32 31, label %262
    i32 0, label %269
  ]

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %263 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not642.i = icmp eq i32 %261, 0
  %264 = select i1 %.not642.i, i32 2139095040, i32 2143289344
  %265 = or disjoint i32 %264, %263
  %266 = bitcast i32 %265 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %268 = or disjoint i32 %261, 1024
  br label %269

269:                                              ; preds = %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %270 = phi i32 [ %268, %267 ], [ %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %271 = uitofp i32 %270 to float
  %.not639.i = icmp eq i32 %260, 0
  %272 = add nsw i32 %260, -25
  %273 = select i1 %.not639.i, i32 -24, i32 %272
  %274 = call float @__ocml_ldexp_f32(float noundef %271, i32 noundef %273) #6
  %275 = fneg contract float %274
  %.not640641.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %276 = select contract i1 %.not640641.i, float %275, float %274
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %269, %262
  %277 = phi float [ %266, %262 ], [ %276, %269 ]
  %278 = fmul contract float %182, %277
  %279 = fadd contract float %152, %278
  %280 = add nuw nsw i64 %151, 1
  %exitcond682.not.i = icmp eq i64 %280, 64
  br i1 %exitcond682.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %150, !llvm.loop !35

281:                                              ; preds = %._crit_edge668.i
  %282 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %283 = icmp eq i64 %282, 0
  call void @llvm.assume(i1 %283)
  %284 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %285 = icmp eq i64 %284, 0
  call void @llvm.assume(i1 %285)
  %286 = sext i32 %3 to i64
  %287 = sext i32 %4 to i64
  %288 = call i32 @llvm.amdgcn.groupstaticsize()
  %289 = inttoptr i32 %288 to ptr addrspace(3)
  %290 = sext i32 %77 to i64
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split670.us.i, %281
  %291 = phi i64 [ 0, %281 ], [ %297, %.split670.us.i ]
  %292 = icmp slt i64 %291, %286
  %293 = shl i64 %291, 5
  %.tr627.i = trunc i64 %291 to i32
  %294 = shl i32 %.tr627.i, 5
  %295 = sext i32 %294 to i64
  %296 = add nsw i64 %295, %290
  %.fr671.i = freeze i1 %292
  br i1 %.fr671.i, label %.preheader.split.i, label %.split670.us.i

.split670.us.i:                                   ; preds = %307, %.preheader.i
  %297 = add nuw nsw i64 %291, 1
  %exitcond684.not.i = icmp eq i64 %297, 64
  br i1 %exitcond684.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.i:                               ; preds = %307, %.preheader.i
  %298 = phi i64 [ %308, %307 ], [ 0, %.preheader.i ]
  %299 = icmp slt i64 %298, %287
  br i1 %299, label %300, label %307

300:                                              ; preds = %.preheader.split.i
  %301 = add nuw nsw i64 %298, %293
  %302 = trunc i64 %301 to i32
  %303 = getelementptr inbounds float, ptr addrspace(3) %289, i32 %302
  %304 = load float, ptr addrspace(3) %303, align 4, !tbaa !19
  %305 = add nuw nsw i64 %296, %298
  %306 = getelementptr inbounds float, ptr %9, i64 %305
  store float %304, ptr %306, align 4, !tbaa !19
  br label %307

307:                                              ; preds = %300, %.preheader.split.i
  %308 = add nuw nsw i64 %298, 1
  %exitcond683.not.i = icmp eq i64 %308, 32
  br i1 %exitcond683.not.i, label %.split670.us.i, label %.preheader.split.i, !llvm.loop !37

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge668.i, %.split670.us.i
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
!25 = distinct !{!25, !24, !26, !27}
!26 = !{!"llvm.loop.vectorize.width", i32 1}
!27 = !{!"llvm.loop.interleave.count", i32 1}
!28 = !{i64 0, i64 2, !29}
!29 = !{!30, !30, i64 0}
!30 = !{!"short", !21, i64 0}
!31 = distinct !{!31, !24, !26, !27}
!32 = distinct !{!32, !24, !26, !27}
!33 = distinct !{!33, !24, !26, !27}
!34 = distinct !{!34, !24}
!35 = distinct !{!35, !24}
!36 = distinct !{!36, !24}
!37 = distinct !{!37, !24}
;----------------- End AdaptiveCpp IR dump ---------------
