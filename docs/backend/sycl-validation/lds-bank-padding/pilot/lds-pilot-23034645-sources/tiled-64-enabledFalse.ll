;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-_rbqmhpr/kernel.cpp"
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
  %58 = phi i64 [ 0, %46 ], [ %66, %.split.us.i ]
  %59 = icmp slt i64 %58, %52
  %60 = shl i64 %58, 6
  %.tr648.i = trunc i64 %58 to i32
  %61 = shl i32 %.tr648.i, 6
  %62 = sext i32 %61 to i64
  %63 = add nsw i64 %62, %57
  %.fr.i = freeze i1 %59
  br i1 %.fr.i, label %.preheader654.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.us.preheader.i: ; preds = %.preheader654.i
  %.tr686.i = trunc i64 %58 to i32
  %64 = shl i32 %.tr686.i, 7
  %65 = add i32 %64, 8192
  %scevgep.i = getelementptr i8, ptr addrspace(3) %55, i32 %65
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep.i, i8 0, i32 128, i1 false)
  br label %.split.us.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.us.preheader.i
  %66 = add nuw nsw i64 %58, 1
  %exitcond678.not.i = icmp eq i64 %66, 64
  br i1 %exitcond678.not.i, label %.loopexit655.i, label %.preheader654.i, !llvm.loop !25

.preheader654.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i, %.preheader654.i
  %67 = phi i64 [ %75, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i ], [ 0, %.preheader654.i ]
  %68 = icmp slt i64 %67, %53
  br i1 %68, label %69, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i

69:                                               ; preds = %.preheader654.split.i
  %70 = add nuw nsw i64 %63, %67
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %70
  %.sroa.0270.0.copyload.i = load i16, ptr %71, align 2, !tbaa.struct !28
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit8.i.i.i: ; preds = %69, %.preheader654.split.i
  %.sroa.0272.2.i = phi i16 [ %.sroa.0270.0.copyload.i, %69 ], [ 0, %.preheader654.split.i ]
  %72 = add nuw nsw i64 %67, %60
  %73 = trunc i64 %72 to i32
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %73
  store i16 %.sroa.0272.2.i, ptr addrspace(3) %74, align 2, !tbaa.struct !28
  %75 = add nuw nsw i64 %67, 1
  %exitcond.not.i = icmp eq i64 %75, 64
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader654.split.i, !llvm.loop !31

.loopexit655.i:                                   ; preds = %.split.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = shl i32 %.tr.i, 11
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %78 = icmp ult i64 %77, 64
  call void @llvm.assume(i1 %78)
  %79 = icmp eq i64 %77, 0
  br i1 %79, label %80, label %.lr.ph667.i

80:                                               ; preds = %.loopexit655.i
  %81 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %82 = icmp eq i64 %81, 0
  call void @llvm.assume(i1 %82)
  %83 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %84 = icmp eq i64 %83, 0
  call void @llvm.assume(i1 %84)
  %85 = sext i32 %5 to i64
  %86 = sext i32 %4 to i64
  %87 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %88 = inttoptr i32 %87 to ptr addrspace(3)
  %89 = getelementptr inbounds i8, ptr addrspace(3) %88, i32 16384
  %90 = sext i32 %76 to i64
  br label %.preheader653.i

.preheader653.i:                                  ; preds = %.split664.us.i, %80
  %91 = phi i64 [ 0, %80 ], [ %99, %.split664.us.i ]
  %92 = icmp slt i64 %91, %85
  %93 = shl i64 %91, 5
  %.tr647.i = trunc i64 %91 to i32
  %94 = shl i32 %.tr647.i, 5
  %95 = sext i32 %94 to i64
  %96 = add nsw i64 %95, %90
  %.fr665.i = freeze i1 %92
  br i1 %.fr665.i, label %.preheader653.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader653.i
  %.tr685.i = trunc i64 %91 to i32
  %97 = shl i32 %.tr685.i, 6
  %98 = add i32 %97, 16384
  %scevgep679.i = getelementptr i8, ptr addrspace(3) %88, i32 %98
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep679.i, i8 0, i32 64, i1 false)
  br label %.split664.us.i

.split664.us.i:                                   ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %99 = add nuw nsw i64 %91, 1
  %exitcond681.not.i = icmp eq i64 %99, 64
  br i1 %exitcond681.not.i, label %.lr.ph667.i, label %.preheader653.i, !llvm.loop !32

.preheader653.split.i:                            ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader653.i
  %100 = phi i64 [ %108, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader653.i ]
  %101 = icmp slt i64 %100, %86
  br i1 %101, label %102, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

102:                                              ; preds = %.preheader653.split.i
  %103 = add nuw nsw i64 %96, %100
  %104 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %103
  %.sroa.0259.0.copyload.i = load i16, ptr %104, align 2, !tbaa.struct !28
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %102, %.preheader653.split.i
  %.sroa.0261.2.i = phi i16 [ %.sroa.0259.0.copyload.i, %102 ], [ 0, %.preheader653.split.i ]
  %105 = add nuw nsw i64 %100, %93
  %106 = trunc i64 %105 to i32
  %107 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %89, i32 %106
  store i16 %.sroa.0261.2.i, ptr addrspace(3) %107, align 2, !tbaa.struct !28
  %108 = add nuw nsw i64 %100, 1
  %exitcond680.not.i = icmp eq i64 %108, 32
  br i1 %exitcond680.not.i, label %.split664.us.i, label %.preheader653.split.i, !llvm.loop !33

.lr.ph667.i:                                      ; preds = %.split664.us.i, %.loopexit655.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %109 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %110 = icmp eq i64 %109, 0
  call void @llvm.assume(i1 %110)
  %111 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %112 = icmp eq i64 %111, 0
  call void @llvm.assume(i1 %112)
  %113 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %114 = icmp ult i64 %113, 64
  call void @llvm.assume(i1 %114)
  %115 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %116 = inttoptr i32 %115 to ptr addrspace(3)
  %117 = getelementptr inbounds i8, ptr addrspace(3) %116, i32 8192
  %118 = getelementptr inbounds i8, ptr addrspace(3) %116, i32 16384
  %119 = and i64 %113, 7
  %120 = or disjoint i64 %119, 8
  %121 = or disjoint i64 %119, 16
  %122 = or disjoint i64 %119, 24
  br label %126

._crit_edge668.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %124 = icmp ult i64 %123, 64
  call void @llvm.assume(i1 %124)
  %125 = icmp eq i64 %123, 0
  br i1 %125, label %280, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

126:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, %.lr.ph667.i
  %127 = phi i64 [ %113, %.lr.ph667.i ], [ %147, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i ]
  %128 = lshr i64 %127, 3
  %129 = shl nuw nsw i64 %128, 5
  %130 = or disjoint i64 %129, %119
  %131 = trunc i64 %130 to i32
  %132 = getelementptr inbounds float, ptr addrspace(3) %116, i32 %131
  %133 = load float, ptr addrspace(3) %132, align 4, !tbaa !19
  %134 = or disjoint i64 %129, %120
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds float, ptr addrspace(3) %116, i32 %135
  %137 = load float, ptr addrspace(3) %136, align 4, !tbaa !19
  %138 = or disjoint i64 %129, %121
  %139 = trunc i64 %138 to i32
  %140 = getelementptr inbounds float, ptr addrspace(3) %116, i32 %139
  %141 = load float, ptr addrspace(3) %140, align 4, !tbaa !19
  %142 = or disjoint i64 %129, %122
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds float, ptr addrspace(3) %116, i32 %143
  %145 = load float, ptr addrspace(3) %144, align 4, !tbaa !19
  %146 = shl nuw nsw i64 %128, 6
  br label %149

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %203, ptr addrspace(3) %132, align 4, !tbaa !19
  store float %228, ptr addrspace(3) %136, align 4, !tbaa !19
  store float %253, ptr addrspace(3) %140, align 4, !tbaa !19
  store float %278, ptr addrspace(3) %144, align 4, !tbaa !19
  %147 = add nuw nsw i64 %127, 64
  %148 = icmp ult i64 %127, 448
  br i1 %148, label %126, label %._crit_edge668.i, !llvm.loop !34

149:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %126
  %150 = phi i64 [ 0, %126 ], [ %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %151 = phi float [ %145, %126 ], [ %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %152 = phi float [ %141, %126 ], [ %253, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %153 = phi float [ %137, %126 ], [ %228, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %154 = phi float [ %133, %126 ], [ %203, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = add nuw i64 %150, %146
  %156 = trunc i64 %155 to i32
  %157 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %117, i32 %156
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %157, align 2, !tbaa.struct !28
  %158 = shl nuw nsw i64 %150, 5
  %159 = or disjoint i64 %158, %119
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %118, i32 %160
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %161, align 2, !tbaa.struct !28
  %162 = zext i16 %.sroa.0224.0.copyload.i to i32
  %163 = lshr i32 %162, 10
  %164 = and i32 %163, 31
  %165 = and i32 %162, 1023
  switch i32 %164, label %171 [
    i32 31, label %166
    i32 0, label %173
  ]

166:                                              ; preds = %149
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %167 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not646.i = icmp eq i32 %165, 0
  %168 = select i1 %.not646.i, i32 2139095040, i32 2143289344
  %169 = or disjoint i32 %168, %167
  %170 = bitcast i32 %169 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

171:                                              ; preds = %149
  %172 = or disjoint i32 %165, 1024
  br label %173

173:                                              ; preds = %171, %149
  %174 = phi i32 [ %172, %171 ], [ %165, %149 ]
  %175 = uitofp i32 %174 to float
  %.not.i = icmp eq i32 %164, 0
  %176 = add nsw i32 %164, -25
  %177 = select i1 %.not.i, i32 -24, i32 %176
  %178 = call float @__ocml_ldexp_f32(float noundef %175, i32 noundef %177) #6
  %179 = fneg contract float %178
  %.not628629.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %180 = select contract i1 %.not628629.i, float %179, float %178
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %173, %166
  %181 = phi float [ %170, %166 ], [ %180, %173 ]
  %182 = zext i16 %.sroa.0215.0.copyload.i to i32
  %183 = lshr i32 %182, 10
  %184 = and i32 %183, 31
  %185 = and i32 %182, 1023
  switch i32 %184, label %191 [
    i32 31, label %186
    i32 0, label %193
  ]

186:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %187 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not645.i = icmp eq i32 %185, 0
  %188 = select i1 %.not645.i, i32 2139095040, i32 2143289344
  %189 = or disjoint i32 %188, %187
  %190 = bitcast i32 %189 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

191:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %192 = or disjoint i32 %185, 1024
  br label %193

193:                                              ; preds = %191, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %194 = phi i32 [ %192, %191 ], [ %185, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %195 = uitofp i32 %194 to float
  %.not630.i = icmp eq i32 %184, 0
  %196 = add nsw i32 %184, -25
  %197 = select i1 %.not630.i, i32 -24, i32 %196
  %198 = call float @__ocml_ldexp_f32(float noundef %195, i32 noundef %197) #6
  %199 = fneg contract float %198
  %.not631632.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %200 = select contract i1 %.not631632.i, float %199, float %198
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %193, %186
  %201 = phi float [ %190, %186 ], [ %200, %193 ]
  %202 = fmul contract float %181, %201
  %203 = fadd contract float %154, %202
  %204 = or disjoint i64 %158, %120
  %205 = trunc i64 %204 to i32
  %206 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %118, i32 %205
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %206, align 2, !tbaa.struct !28
  %207 = zext i16 %.sroa.0206.0.copyload.i to i32
  %208 = lshr i32 %207, 10
  %209 = and i32 %208, 31
  %210 = and i32 %207, 1023
  switch i32 %209, label %216 [
    i32 31, label %211
    i32 0, label %218
  ]

211:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %212 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not644.i = icmp eq i32 %210, 0
  %213 = select i1 %.not644.i, i32 2139095040, i32 2143289344
  %214 = or disjoint i32 %213, %212
  %215 = bitcast i32 %214 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

216:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %217 = or disjoint i32 %210, 1024
  br label %218

218:                                              ; preds = %216, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %219 = phi i32 [ %217, %216 ], [ %210, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %220 = uitofp i32 %219 to float
  %.not633.i = icmp eq i32 %209, 0
  %221 = add nsw i32 %209, -25
  %222 = select i1 %.not633.i, i32 -24, i32 %221
  %223 = call float @__ocml_ldexp_f32(float noundef %220, i32 noundef %222) #6
  %224 = fneg contract float %223
  %.not634635.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %225 = select contract i1 %.not634635.i, float %224, float %223
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i: ; preds = %218, %211
  %226 = phi float [ %215, %211 ], [ %225, %218 ]
  %227 = fmul contract float %181, %226
  %228 = fadd contract float %153, %227
  %229 = or disjoint i64 %158, %121
  %230 = trunc i64 %229 to i32
  %231 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %118, i32 %230
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %231, align 2, !tbaa.struct !28
  %232 = zext i16 %.sroa.0197.0.copyload.i to i32
  %233 = lshr i32 %232, 10
  %234 = and i32 %233, 31
  %235 = and i32 %232, 1023
  switch i32 %234, label %241 [
    i32 31, label %236
    i32 0, label %243
  ]

236:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %237 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not643.i = icmp eq i32 %235, 0
  %238 = select i1 %.not643.i, i32 2139095040, i32 2143289344
  %239 = or disjoint i32 %238, %237
  %240 = bitcast i32 %239 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

241:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %242 = or disjoint i32 %235, 1024
  br label %243

243:                                              ; preds = %241, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i
  %244 = phi i32 [ %242, %241 ], [ %235, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit4.i.i.i ]
  %245 = uitofp i32 %244 to float
  %.not636.i = icmp eq i32 %234, 0
  %246 = add nsw i32 %234, -25
  %247 = select i1 %.not636.i, i32 -24, i32 %246
  %248 = call float @__ocml_ldexp_f32(float noundef %245, i32 noundef %247) #6
  %249 = fneg contract float %248
  %.not637638.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %250 = select contract i1 %.not637638.i, float %249, float %248
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i: ; preds = %243, %236
  %251 = phi float [ %240, %236 ], [ %250, %243 ]
  %252 = fmul contract float %181, %251
  %253 = fadd contract float %152, %252
  %254 = or disjoint i64 %158, %122
  %255 = trunc i64 %254 to i32
  %256 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %118, i32 %255
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %256, align 2, !tbaa.struct !28
  %257 = zext i16 %.sroa.0188.0.copyload.i to i32
  %258 = lshr i32 %257, 10
  %259 = and i32 %258, 31
  %260 = and i32 %257, 1023
  switch i32 %259, label %266 [
    i32 31, label %261
    i32 0, label %268
  ]

261:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %262 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not642.i = icmp eq i32 %260, 0
  %263 = select i1 %.not642.i, i32 2139095040, i32 2143289344
  %264 = or disjoint i32 %263, %262
  %265 = bitcast i32 %264 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

266:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %267 = or disjoint i32 %260, 1024
  br label %268

268:                                              ; preds = %266, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i
  %269 = phi i32 [ %267, %266 ], [ %260, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit3.i.i.i ]
  %270 = uitofp i32 %269 to float
  %.not639.i = icmp eq i32 %259, 0
  %271 = add nsw i32 %259, -25
  %272 = select i1 %.not639.i, i32 -24, i32 %271
  %273 = call float @__ocml_ldexp_f32(float noundef %270, i32 noundef %272) #6
  %274 = fneg contract float %273
  %.not640641.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %275 = select contract i1 %.not640641.i, float %274, float %273
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %268, %261
  %276 = phi float [ %265, %261 ], [ %275, %268 ]
  %277 = fmul contract float %181, %276
  %278 = fadd contract float %151, %277
  %279 = add nuw nsw i64 %150, 1
  %exitcond682.not.i = icmp eq i64 %279, 64
  br i1 %exitcond682.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.i.i, label %149, !llvm.loop !35

280:                                              ; preds = %._crit_edge668.i
  %281 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %282 = icmp eq i64 %281, 0
  call void @llvm.assume(i1 %282)
  %283 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %284 = icmp eq i64 %283, 0
  call void @llvm.assume(i1 %284)
  %285 = sext i32 %3 to i64
  %286 = sext i32 %4 to i64
  %287 = call i32 @llvm.amdgcn.groupstaticsize()
  %288 = inttoptr i32 %287 to ptr addrspace(3)
  %289 = sext i32 %76 to i64
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split670.us.i, %280
  %290 = phi i64 [ 0, %280 ], [ %296, %.split670.us.i ]
  %291 = icmp slt i64 %290, %285
  %292 = shl i64 %290, 5
  %.tr627.i = trunc i64 %290 to i32
  %293 = shl i32 %.tr627.i, 5
  %294 = sext i32 %293 to i64
  %295 = add nsw i64 %294, %289
  %.fr671.i = freeze i1 %291
  br i1 %.fr671.i, label %.preheader.split.i, label %.split670.us.i

.split670.us.i:                                   ; preds = %306, %.preheader.i
  %296 = add nuw nsw i64 %290, 1
  %exitcond684.not.i = icmp eq i64 %296, 64
  br i1 %exitcond684.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.i:                               ; preds = %306, %.preheader.i
  %297 = phi i64 [ %307, %306 ], [ 0, %.preheader.i ]
  %298 = icmp slt i64 %297, %286
  br i1 %298, label %299, label %306

299:                                              ; preds = %.preheader.split.i
  %300 = add nuw nsw i64 %297, %292
  %301 = trunc i64 %300 to i32
  %302 = getelementptr inbounds float, ptr addrspace(3) %288, i32 %301
  %303 = load float, ptr addrspace(3) %302, align 4, !tbaa !19
  %304 = add nuw nsw i64 %295, %297
  %305 = getelementptr inbounds float, ptr %9, i64 %304
  store float %303, ptr %305, align 4, !tbaa !19
  br label %306

306:                                              ; preds = %299, %.preheader.split.i
  %307 = add nuw nsw i64 %297, 1
  %exitcond683.not.i = icmp eq i64 %307, 32
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
