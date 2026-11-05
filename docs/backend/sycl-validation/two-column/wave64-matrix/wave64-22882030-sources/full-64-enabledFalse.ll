;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-v_lbmd60/kernel.cpp"
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

; Function Attrs: nounwind
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #4 {
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !10
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 33554431
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 64
  call void @llvm.assume(i1 %35)
  %36 = shl i32 %.tr.i, 10
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 7
  %44 = icmp slt i64 %43, %38
  br label %55

.lr.ph640.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %50 = icmp ult i64 %49, 64
  call void @llvm.assume(i1 %50)
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 512
  %54 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0295.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %60, %55
  %.sroa.0297.1.i = phi i16 [ %.sroa.0295.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0297.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !19
  %67 = add nuw nsw i64 %56, 64
  %68 = icmp ult i64 %56, 960
  br i1 %68, label %55, label %.lr.ph640.i, !llvm.loop !24

.lr.ph643.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %70 = icmp eq i64 %69, 0
  call void @llvm.assume(i1 %70)
  %71 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %72 = icmp eq i64 %71, 0
  call void @llvm.assume(i1 %72)
  %73 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %74 = icmp ult i64 %73, 64
  call void @llvm.assume(i1 %74)
  %75 = shl i32 %.tr.i, 11
  %76 = sext i32 %5 to i64
  %77 = sext i32 %4 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 4608
  %82 = and i64 %73, 15
  %83 = icmp slt i64 %82, %77
  br label %106

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph640.i
  %84 = phi i64 [ %49, %.lr.ph640.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 7
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 1016
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0348.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !19
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0348.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  %93 = add nuw nsw i64 %84, 64
  %94 = icmp ult i64 %84, 960
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph643.i, !llvm.loop !28

.lr.ph646.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %96 = icmp eq i64 %95, 0
  call void @llvm.assume(i1 %96)
  %97 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %98 = icmp eq i64 %97, 0
  call void @llvm.assume(i1 %98)
  %99 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %100 = icmp ult i64 %99, 64
  call void @llvm.assume(i1 %100)
  %101 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %102 = inttoptr i32 %101 to ptr addrspace(3)
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 2560
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 4608
  %105 = and i64 %99, 15
  br label %123

106:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph643.i
  %107 = phi i64 [ %73, %.lr.ph643.i ], [ %118, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %108 = lshr i64 %107, 4
  %109 = icmp slt i64 %108, %76
  %110 = and i1 %109, %83
  br i1 %110, label %111, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

111:                                              ; preds = %106
  %112 = and i64 %107, 9223372036854775792
  %113 = or disjoint i64 %112, %78
  %114 = or disjoint i64 %113, %82
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %114
  %.sroa.0254.0.copyload.i = load i16, ptr %115, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %111, %106
  %.sroa.0256.1.i = phi i16 [ %.sroa.0254.0.copyload.i, %111 ], [ 0, %106 ]
  %116 = trunc i64 %107 to i32
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %116
  store i16 %.sroa.0256.1.i, ptr addrspace(3) %117, align 2, !tbaa.struct !19
  %118 = add nuw nsw i64 %107, 64
  %119 = icmp ult i64 %107, 1984
  br i1 %119, label %106, label %.lr.ph646.i, !llvm.loop !29

._crit_edge647.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %121 = icmp ult i64 %120, 64
  call void @llvm.assume(i1 %121)
  %122 = icmp eq i64 %120, 0
  br i1 %122, label %336, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

123:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i, %.lr.ph646.i
  %124 = phi i64 [ %99, %.lr.ph646.i ], [ %130, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i ]
  %125 = shl nuw nsw i64 %124, 3
  %126 = and i64 %125, 896
  br label %132

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %127 = trunc i64 %124 to i32
  %128 = and i32 %127, 127
  %129 = getelementptr inbounds float, ptr addrspace(3) %102, i32 %128
  store float %333, ptr addrspace(3) %129, align 4, !tbaa !30
  %130 = add nuw nsw i64 %124, 64
  %131 = icmp ult i64 %124, 64
  br i1 %131, label %123, label %._crit_edge647.i, !llvm.loop !32

132:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %123
  %133 = phi i64 [ 0, %123 ], [ %334, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %134 = phi float [ 0.000000e+00, %123 ], [ %333, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %135 = add nuw nsw i64 %133, %126
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %136
  %.sroa.0239.0.copyload.i = load i16, ptr addrspace(3) %137, align 2, !tbaa.struct !19
  %138 = shl nuw nsw i64 %133, 4
  %139 = or disjoint i64 %138, %105
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %140
  %.sroa.0230.0.copyload.i = load i16, ptr addrspace(3) %141, align 2, !tbaa.struct !19
  %142 = zext i16 %.sroa.0239.0.copyload.i to i32
  %143 = lshr i32 %142, 10
  %144 = and i32 %143, 31
  %145 = and i32 %142, 1023
  switch i32 %144, label %151 [
    i32 31, label %146
    i32 0, label %153
  ]

146:                                              ; preds = %132
  %.sroa.0239.0.copyload.signext.i = sext i16 %.sroa.0239.0.copyload.i to i32
  %147 = and i32 %.sroa.0239.0.copyload.signext.i, -2147483648
  %.not628.i = icmp eq i32 %145, 0
  %148 = select i1 %.not628.i, i32 2139095040, i32 2143289344
  %149 = or disjoint i32 %148, %147
  %150 = bitcast i32 %149 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

151:                                              ; preds = %132
  %152 = or disjoint i32 %145, 1024
  br label %153

153:                                              ; preds = %151, %132
  %154 = phi i32 [ %152, %151 ], [ %145, %132 ]
  %155 = uitofp i32 %154 to float
  %.not.i = icmp eq i32 %144, 0
  %156 = add nsw i32 %144, -25
  %157 = select i1 %.not.i, i32 -24, i32 %156
  %158 = call float @__ocml_ldexp_f32(float noundef %155, i32 noundef %157) #5
  %159 = fneg contract float %158
  %.not598599.i = icmp slt i16 %.sroa.0239.0.copyload.i, 0
  %160 = select contract i1 %.not598599.i, float %159, float %158
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %153, %146
  %161 = phi float [ %150, %146 ], [ %160, %153 ]
  %162 = zext i16 %.sroa.0230.0.copyload.i to i32
  %163 = lshr i32 %162, 10
  %164 = and i32 %163, 31
  %165 = and i32 %162, 1023
  switch i32 %164, label %171 [
    i32 31, label %166
    i32 0, label %173
  ]

166:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0230.0.copyload.signext.i = sext i16 %.sroa.0230.0.copyload.i to i32
  %167 = and i32 %.sroa.0230.0.copyload.signext.i, -2147483648
  %.not627.i = icmp eq i32 %165, 0
  %168 = select i1 %.not627.i, i32 2139095040, i32 2143289344
  %169 = or disjoint i32 %168, %167
  %170 = bitcast i32 %169 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

171:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %172 = or disjoint i32 %165, 1024
  br label %173

173:                                              ; preds = %171, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %174 = phi i32 [ %172, %171 ], [ %165, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %175 = uitofp i32 %174 to float
  %.not600.i = icmp eq i32 %164, 0
  %176 = add nsw i32 %164, -25
  %177 = select i1 %.not600.i, i32 -24, i32 %176
  %178 = call float @__ocml_ldexp_f32(float noundef %175, i32 noundef %177) #5
  %179 = fneg contract float %178
  %.not601602.i = icmp slt i16 %.sroa.0230.0.copyload.i, 0
  %180 = select contract i1 %.not601602.i, float %179, float %178
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %173, %166
  %181 = phi float [ %170, %166 ], [ %180, %173 ]
  %182 = fmul contract float %161, %181
  %183 = fadd contract float %134, %182
  %184 = or disjoint i64 %133, 1
  %185 = add nuw nsw i64 %184, %126
  %186 = trunc i64 %185 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %186
  %.sroa.0221.0.copyload.i = load i16, ptr addrspace(3) %187, align 2, !tbaa.struct !19
  %188 = shl nuw nsw i64 %184, 4
  %189 = or disjoint i64 %188, %105
  %190 = trunc i64 %189 to i32
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %190
  %.sroa.0212.0.copyload.i = load i16, ptr addrspace(3) %191, align 2, !tbaa.struct !19
  %192 = zext i16 %.sroa.0221.0.copyload.i to i32
  %193 = lshr i32 %192, 10
  %194 = and i32 %193, 31
  %195 = and i32 %192, 1023
  switch i32 %194, label %201 [
    i32 31, label %196
    i32 0, label %203
  ]

196:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0221.0.copyload.signext.i = sext i16 %.sroa.0221.0.copyload.i to i32
  %197 = and i32 %.sroa.0221.0.copyload.signext.i, -2147483648
  %.not626.i = icmp eq i32 %195, 0
  %198 = select i1 %.not626.i, i32 2139095040, i32 2143289344
  %199 = or disjoint i32 %198, %197
  %200 = bitcast i32 %199 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

201:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %202 = or disjoint i32 %195, 1024
  br label %203

203:                                              ; preds = %201, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %204 = phi i32 [ %202, %201 ], [ %195, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %205 = uitofp i32 %204 to float
  %.not603.i = icmp eq i32 %194, 0
  %206 = add nsw i32 %194, -25
  %207 = select i1 %.not603.i, i32 -24, i32 %206
  %208 = call float @__ocml_ldexp_f32(float noundef %205, i32 noundef %207) #5
  %209 = fneg contract float %208
  %.not604605.i = icmp slt i16 %.sroa.0221.0.copyload.i, 0
  %210 = select contract i1 %.not604605.i, float %209, float %208
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %203, %196
  %211 = phi float [ %200, %196 ], [ %210, %203 ]
  %212 = zext i16 %.sroa.0212.0.copyload.i to i32
  %213 = lshr i32 %212, 10
  %214 = and i32 %213, 31
  %215 = and i32 %212, 1023
  switch i32 %214, label %221 [
    i32 31, label %216
    i32 0, label %223
  ]

216:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0212.0.copyload.signext.i = sext i16 %.sroa.0212.0.copyload.i to i32
  %217 = and i32 %.sroa.0212.0.copyload.signext.i, -2147483648
  %.not625.i = icmp eq i32 %215, 0
  %218 = select i1 %.not625.i, i32 2139095040, i32 2143289344
  %219 = or disjoint i32 %218, %217
  %220 = bitcast i32 %219 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

221:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %222 = or disjoint i32 %215, 1024
  br label %223

223:                                              ; preds = %221, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %224 = phi i32 [ %222, %221 ], [ %215, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %225 = uitofp i32 %224 to float
  %.not606.i = icmp eq i32 %214, 0
  %226 = add nsw i32 %214, -25
  %227 = select i1 %.not606.i, i32 -24, i32 %226
  %228 = call float @__ocml_ldexp_f32(float noundef %225, i32 noundef %227) #5
  %229 = fneg contract float %228
  %.not607608.i = icmp slt i16 %.sroa.0212.0.copyload.i, 0
  %230 = select contract i1 %.not607608.i, float %229, float %228
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %223, %216
  %231 = phi float [ %220, %216 ], [ %230, %223 ]
  %232 = fmul contract float %211, %231
  %233 = fadd contract float %183, %232
  %234 = or disjoint i64 %133, 2
  %235 = add nuw nsw i64 %234, %126
  %236 = trunc i64 %235 to i32
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %236
  %.sroa.0203.0.copyload.i = load i16, ptr addrspace(3) %237, align 2, !tbaa.struct !19
  %238 = shl nuw nsw i64 %234, 4
  %239 = or disjoint i64 %238, %105
  %240 = trunc i64 %239 to i32
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %240
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %241, align 2, !tbaa.struct !19
  %242 = zext i16 %.sroa.0203.0.copyload.i to i32
  %243 = lshr i32 %242, 10
  %244 = and i32 %243, 31
  %245 = and i32 %242, 1023
  switch i32 %244, label %251 [
    i32 31, label %246
    i32 0, label %253
  ]

246:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0203.0.copyload.signext.i = sext i16 %.sroa.0203.0.copyload.i to i32
  %247 = and i32 %.sroa.0203.0.copyload.signext.i, -2147483648
  %.not624.i = icmp eq i32 %245, 0
  %248 = select i1 %.not624.i, i32 2139095040, i32 2143289344
  %249 = or disjoint i32 %248, %247
  %250 = bitcast i32 %249 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

251:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %252 = or disjoint i32 %245, 1024
  br label %253

253:                                              ; preds = %251, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %254 = phi i32 [ %252, %251 ], [ %245, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %255 = uitofp i32 %254 to float
  %.not609.i = icmp eq i32 %244, 0
  %256 = add nsw i32 %244, -25
  %257 = select i1 %.not609.i, i32 -24, i32 %256
  %258 = call float @__ocml_ldexp_f32(float noundef %255, i32 noundef %257) #5
  %259 = fneg contract float %258
  %.not610611.i = icmp slt i16 %.sroa.0203.0.copyload.i, 0
  %260 = select contract i1 %.not610611.i, float %259, float %258
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %253, %246
  %261 = phi float [ %250, %246 ], [ %260, %253 ]
  %262 = zext i16 %.sroa.0194.0.copyload.i to i32
  %263 = lshr i32 %262, 10
  %264 = and i32 %263, 31
  %265 = and i32 %262, 1023
  switch i32 %264, label %271 [
    i32 31, label %266
    i32 0, label %273
  ]

266:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %267 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not623.i = icmp eq i32 %265, 0
  %268 = select i1 %.not623.i, i32 2139095040, i32 2143289344
  %269 = or disjoint i32 %268, %267
  %270 = bitcast i32 %269 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

271:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %272 = or disjoint i32 %265, 1024
  br label %273

273:                                              ; preds = %271, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %274 = phi i32 [ %272, %271 ], [ %265, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %275 = uitofp i32 %274 to float
  %.not612.i = icmp eq i32 %264, 0
  %276 = add nsw i32 %264, -25
  %277 = select i1 %.not612.i, i32 -24, i32 %276
  %278 = call float @__ocml_ldexp_f32(float noundef %275, i32 noundef %277) #5
  %279 = fneg contract float %278
  %.not613614.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %280 = select contract i1 %.not613614.i, float %279, float %278
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %273, %266
  %281 = phi float [ %270, %266 ], [ %280, %273 ]
  %282 = fmul contract float %261, %281
  %283 = fadd contract float %233, %282
  %284 = or disjoint i64 %133, 3
  %285 = add nuw nsw i64 %284, %126
  %286 = trunc i64 %285 to i32
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %286
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %287, align 2, !tbaa.struct !19
  %288 = shl nuw nsw i64 %284, 4
  %289 = or disjoint i64 %288, %105
  %290 = trunc i64 %289 to i32
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %290
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %291, align 2, !tbaa.struct !19
  %292 = zext i16 %.sroa.0185.0.copyload.i to i32
  %293 = lshr i32 %292, 10
  %294 = and i32 %293, 31
  %295 = and i32 %292, 1023
  switch i32 %294, label %301 [
    i32 31, label %296
    i32 0, label %303
  ]

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %297 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not622.i = icmp eq i32 %295, 0
  %298 = select i1 %.not622.i, i32 2139095040, i32 2143289344
  %299 = or disjoint i32 %298, %297
  %300 = bitcast i32 %299 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

301:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %302 = or disjoint i32 %295, 1024
  br label %303

303:                                              ; preds = %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %304 = phi i32 [ %302, %301 ], [ %295, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %305 = uitofp i32 %304 to float
  %.not615.i = icmp eq i32 %294, 0
  %306 = add nsw i32 %294, -25
  %307 = select i1 %.not615.i, i32 -24, i32 %306
  %308 = call float @__ocml_ldexp_f32(float noundef %305, i32 noundef %307) #5
  %309 = fneg contract float %308
  %.not616617.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %310 = select contract i1 %.not616617.i, float %309, float %308
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %303, %296
  %311 = phi float [ %300, %296 ], [ %310, %303 ]
  %312 = zext i16 %.sroa.0176.0.copyload.i to i32
  %313 = lshr i32 %312, 10
  %314 = and i32 %313, 31
  %315 = and i32 %312, 1023
  switch i32 %314, label %321 [
    i32 31, label %316
    i32 0, label %323
  ]

316:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %317 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not621.i = icmp eq i32 %315, 0
  %318 = select i1 %.not621.i, i32 2139095040, i32 2143289344
  %319 = or disjoint i32 %318, %317
  %320 = bitcast i32 %319 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

321:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %322 = or disjoint i32 %315, 1024
  br label %323

323:                                              ; preds = %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %324 = phi i32 [ %322, %321 ], [ %315, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %325 = uitofp i32 %324 to float
  %.not618.i = icmp eq i32 %314, 0
  %326 = add nsw i32 %314, -25
  %327 = select i1 %.not618.i, i32 -24, i32 %326
  %328 = call float @__ocml_ldexp_f32(float noundef %325, i32 noundef %327) #5
  %329 = fneg contract float %328
  %.not619620.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %330 = select contract i1 %.not619620.i, float %329, float %328
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %323, %316
  %331 = phi float [ %320, %316 ], [ %330, %323 ]
  %332 = fmul contract float %311, %331
  %333 = fadd contract float %283, %332
  %334 = add nuw nsw i64 %133, 4
  %335 = icmp ult i64 %133, 124
  br i1 %335, label %132, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i, !llvm.loop !33

336:                                              ; preds = %._crit_edge647.i
  %337 = shl nuw i32 %.tr.i, 7
  %338 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %339 = icmp eq i64 %338, 0
  call void @llvm.assume(i1 %339)
  %340 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %341 = icmp eq i64 %340, 0
  call void @llvm.assume(i1 %341)
  %342 = sext i32 %3 to i64
  %343 = call i32 @llvm.amdgcn.groupstaticsize()
  %344 = inttoptr i32 %343 to ptr addrspace(3)
  %345 = sext i32 %337 to i64
  %346 = icmp sgt i32 %4, 0
  %347 = icmp ugt i32 %4, 1
  %348 = icmp ugt i32 %4, 2
  %349 = icmp ugt i32 %4, 3
  %350 = icmp ugt i32 %4, 4
  %351 = icmp ugt i32 %4, 5
  %352 = icmp ugt i32 %4, 6
  %353 = icmp ugt i32 %4, 7
  %354 = icmp ugt i32 %4, 8
  %355 = icmp ugt i32 %4, 9
  %356 = icmp ugt i32 %4, 10
  %357 = icmp ugt i32 %4, 11
  %358 = icmp ugt i32 %4, 12
  %359 = icmp ugt i32 %4, 13
  %360 = icmp ugt i32 %4, 14
  %361 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %336
  %362 = phi i64 [ 0, %336 ], [ %368, %.split.us.i ]
  %363 = icmp slt i64 %362, %342
  %364 = shl i64 %362, 4
  %.tr597.i = trunc i64 %362 to i32
  %365 = shl i32 %.tr597.i, 4
  %366 = sext i32 %365 to i64
  %367 = add nsw i64 %366, %345
  %.fr.i = freeze i1 %363
  %brmerge.not.i = select i1 %.fr.i, i1 %346, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %457, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %368 = add nuw nsw i64 %362, 1
  %exitcond.not.i = icmp eq i64 %368, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %369 = trunc i64 %364 to i32
  %370 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %369
  %371 = load float, ptr addrspace(3) %370, align 4, !tbaa !30
  %372 = getelementptr inbounds float, ptr %9, i64 %367
  store float %371, ptr %372, align 32, !tbaa !30
  br i1 %347, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %373 = trunc i64 %364 to i32
  %374 = or disjoint i32 %373, 1
  %375 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %374
  %376 = load float, ptr addrspace(3) %375, align 4, !tbaa !30
  %377 = or disjoint i64 %367, 1
  %378 = getelementptr inbounds float, ptr %9, i64 %377
  store float %376, ptr %378, align 4, !tbaa !30
  br i1 %348, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %379 = trunc i64 %364 to i32
  %380 = or disjoint i32 %379, 2
  %381 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %380
  %382 = load float, ptr addrspace(3) %381, align 4, !tbaa !30
  %383 = or disjoint i64 %367, 2
  %384 = getelementptr inbounds float, ptr %9, i64 %383
  store float %382, ptr %384, align 8, !tbaa !30
  br i1 %349, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %385 = trunc i64 %364 to i32
  %386 = or disjoint i32 %385, 3
  %387 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %386
  %388 = load float, ptr addrspace(3) %387, align 4, !tbaa !30
  %389 = or disjoint i64 %367, 3
  %390 = getelementptr inbounds float, ptr %9, i64 %389
  store float %388, ptr %390, align 4, !tbaa !30
  br i1 %350, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %391 = trunc i64 %364 to i32
  %392 = or disjoint i32 %391, 4
  %393 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %392
  %394 = load float, ptr addrspace(3) %393, align 4, !tbaa !30
  %395 = or disjoint i64 %367, 4
  %396 = getelementptr inbounds float, ptr %9, i64 %395
  store float %394, ptr %396, align 16, !tbaa !30
  br i1 %351, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %397 = trunc i64 %364 to i32
  %398 = or disjoint i32 %397, 5
  %399 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %398
  %400 = load float, ptr addrspace(3) %399, align 4, !tbaa !30
  %401 = or disjoint i64 %367, 5
  %402 = getelementptr inbounds float, ptr %9, i64 %401
  store float %400, ptr %402, align 4, !tbaa !30
  br i1 %352, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %403 = trunc i64 %364 to i32
  %404 = or disjoint i32 %403, 6
  %405 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %404
  %406 = load float, ptr addrspace(3) %405, align 4, !tbaa !30
  %407 = or disjoint i64 %367, 6
  %408 = getelementptr inbounds float, ptr %9, i64 %407
  store float %406, ptr %408, align 8, !tbaa !30
  br i1 %353, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %409 = trunc i64 %364 to i32
  %410 = or disjoint i32 %409, 7
  %411 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %410
  %412 = load float, ptr addrspace(3) %411, align 4, !tbaa !30
  %413 = or disjoint i64 %367, 7
  %414 = getelementptr inbounds float, ptr %9, i64 %413
  store float %412, ptr %414, align 4, !tbaa !30
  br i1 %354, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %415 = trunc i64 %364 to i32
  %416 = or disjoint i32 %415, 8
  %417 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %416
  %418 = load float, ptr addrspace(3) %417, align 4, !tbaa !30
  %419 = or disjoint i64 %367, 8
  %420 = getelementptr inbounds float, ptr %9, i64 %419
  store float %418, ptr %420, align 32, !tbaa !30
  br i1 %355, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %421 = trunc i64 %364 to i32
  %422 = or disjoint i32 %421, 9
  %423 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %422
  %424 = load float, ptr addrspace(3) %423, align 4, !tbaa !30
  %425 = or disjoint i64 %367, 9
  %426 = getelementptr inbounds float, ptr %9, i64 %425
  store float %424, ptr %426, align 4, !tbaa !30
  br i1 %356, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %427 = trunc i64 %364 to i32
  %428 = or disjoint i32 %427, 10
  %429 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %428
  %430 = load float, ptr addrspace(3) %429, align 4, !tbaa !30
  %431 = or disjoint i64 %367, 10
  %432 = getelementptr inbounds float, ptr %9, i64 %431
  store float %430, ptr %432, align 8, !tbaa !30
  br i1 %357, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %433 = trunc i64 %364 to i32
  %434 = or disjoint i32 %433, 11
  %435 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %434
  %436 = load float, ptr addrspace(3) %435, align 4, !tbaa !30
  %437 = or disjoint i64 %367, 11
  %438 = getelementptr inbounds float, ptr %9, i64 %437
  store float %436, ptr %438, align 4, !tbaa !30
  br i1 %358, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %439 = trunc i64 %364 to i32
  %440 = or disjoint i32 %439, 12
  %441 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %440
  %442 = load float, ptr addrspace(3) %441, align 4, !tbaa !30
  %443 = or disjoint i64 %367, 12
  %444 = getelementptr inbounds float, ptr %9, i64 %443
  store float %442, ptr %444, align 16, !tbaa !30
  br i1 %359, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %445 = trunc i64 %364 to i32
  %446 = or disjoint i32 %445, 13
  %447 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %446
  %448 = load float, ptr addrspace(3) %447, align 4, !tbaa !30
  %449 = or disjoint i64 %367, 13
  %450 = getelementptr inbounds float, ptr %9, i64 %449
  store float %448, ptr %450, align 4, !tbaa !30
  br i1 %360, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %451 = trunc i64 %364 to i32
  %452 = or disjoint i32 %451, 14
  %453 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %452
  %454 = load float, ptr addrspace(3) %453, align 4, !tbaa !30
  %455 = or disjoint i64 %367, 14
  %456 = getelementptr inbounds float, ptr %9, i64 %455
  store float %454, ptr %456, align 8, !tbaa !30
  br i1 %361, label %457, label %.split.us.i

457:                                              ; preds = %.preheader.split.15.i
  %458 = trunc i64 %364 to i32
  %459 = or disjoint i32 %458, 15
  %460 = getelementptr inbounds float, ptr addrspace(3) %344, i32 %459
  %461 = load float, ptr addrspace(3) %460, align 4, !tbaa !30
  %462 = or disjoint i64 %367, 15
  %463 = getelementptr inbounds float, ptr %9, i64 %462
  store float %461, ptr %463, align 4, !tbaa !30
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge647.i, %.split.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="64,64" }
attributes #5 = { nounwind }

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
!19 = !{i64 0, i64 2, !20}
!20 = !{!21, !21, i64 0}
!21 = !{!"short", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = distinct !{!24, !25, !26, !27}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{!"llvm.loop.vectorize.width", i32 1}
!27 = !{!"llvm.loop.interleave.count", i32 1}
!28 = distinct !{!28, !25, !26, !27}
!29 = distinct !{!29, !25, !26, !27}
!30 = !{!31, !31, i64 0}
!31 = !{!"float", !22, i64 0}
!32 = distinct !{!32, !25}
!33 = distinct !{!33, !25}
!34 = distinct !{!34, !25}
;----------------- End AdaptiveCpp IR dump ---------------
