;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-ej2903hg/kernel.cpp"
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
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
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
  %36 = shl i32 %.tr.i, 8
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 7
  %44 = icmp slt i64 %43, %38
  br label %55

.lr.ph868.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit34.i.i.i
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
  %54 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit34.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit34.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit34.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0367.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit34.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit34.i.i.i: ; preds = %60, %55
  %.sroa.0369.1.i = phi i16 [ %.sroa.0367.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0369.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  %67 = add nuw nsw i64 %56, 64
  %68 = icmp ult i64 %56, 192
  br i1 %68, label %55, label %.lr.ph868.i, !llvm.loop !28

.lr.ph871.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  %75 = shl i32 %.tr.i, 9
  %76 = sext i32 %4 to i64
  %77 = sext i32 %5 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 1536
  %82 = and i64 %73, 31
  %83 = icmp slt i64 %82, %77
  br label %105

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph868.i
  %84 = phi i64 [ %49, %.lr.ph868.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 5
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 248
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0444.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !23
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0444.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  %93 = add nuw nsw i64 %84, 64
  %94 = icmp ult i64 %84, 192
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph871.i, !llvm.loop !32

.lr.ph874.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 1536
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i

105:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph871.i
  %106 = phi i64 [ %73, %.lr.ph871.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %107 = lshr i64 %106, 5
  %108 = icmp slt i64 %107, %76
  %109 = and i1 %108, %83
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

110:                                              ; preds = %105
  %111 = and i64 %106, 9223372036854775776
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %82
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0326.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %110, %105
  %.sroa.0328.1.i = phi i16 [ %.sroa.0326.0.copyload.i, %110 ], [ 0, %105 ]
  %115 = trunc i64 %106 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0328.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = add nuw nsw i64 %106, 64
  %118 = icmp ult i64 %106, 448
  br i1 %118, label %105, label %.lr.ph874.i, !llvm.loop !33

.lr.ph877.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %120 = icmp eq i64 %119, 0
  call void @llvm.assume(i1 %120)
  %121 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %122 = icmp eq i64 %121, 0
  call void @llvm.assume(i1 %122)
  %123 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %124 = icmp ult i64 %123, 64
  call void @llvm.assume(i1 %124)
  %125 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %126 = inttoptr i32 %125 to ptr addrspace(3)
  %127 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 1024
  %128 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 2560
  %129 = and i64 %123, 7
  %130 = lshr i64 %123, 3
  %131 = or disjoint i64 %129, 8
  %132 = shl nuw nsw i64 %130, 5
  br label %154

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph874.i
  %133 = phi i64 [ %99, %.lr.ph874.i ], [ %142, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %134 = lshr i64 %133, 4
  %135 = shl nuw nsw i64 %133, 5
  %136 = and i64 %135, 480
  %137 = or disjoint i64 %136, %134
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %138
  %.sroa.0445.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !23
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %140
  store i16 %.sroa.0445.0.copyload.i, ptr addrspace(3) %141, align 2, !tbaa.struct !23
  %142 = add nuw nsw i64 %133, 64
  %143 = icmp ult i64 %133, 448
  br i1 %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph877.i, !llvm.loop !34

._crit_edge878.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %144 = shl nuw nsw i64 %130, 4
  %145 = or disjoint i64 %144, %129
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %146
  store float %431, ptr addrspace(3) %147, align 4, !tbaa !35
  %148 = or disjoint i64 %144, %131
  %149 = trunc i64 %148 to i32
  %150 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %149
  store float %456, ptr addrspace(3) %150, align 4, !tbaa !35
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %152 = icmp ult i64 %151, 64
  call void @llvm.assume(i1 %152)
  %153 = icmp eq i64 %151, 0
  br i1 %153, label %459, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

154:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph877.i
  %155 = phi i64 [ 0, %.lr.ph877.i ], [ %457, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = phi float [ 0.000000e+00, %.lr.ph877.i ], [ %456, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %157 = phi float [ 0.000000e+00, %.lr.ph877.i ], [ %431, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %158 = add nuw nsw i64 %155, %132
  %159 = trunc i64 %158 to i32
  %160 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %159
  %.sroa.0285.0.copyload.i = load i16, ptr addrspace(3) %160, align 2, !tbaa.struct !23
  %161 = shl nuw nsw i64 %155, 4
  %162 = or disjoint i64 %161, %129
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %163
  %.sroa.0276.0.copyload.i = load i16, ptr addrspace(3) %164, align 2, !tbaa.struct !23
  %165 = zext i16 %.sroa.0285.0.copyload.i to i32
  %166 = lshr i32 %165, 10
  %167 = and i32 %166, 31
  %168 = and i32 %165, 1023
  switch i32 %167, label %174 [
    i32 31, label %169
    i32 0, label %176
  ]

169:                                              ; preds = %154
  %.sroa.0285.0.copyload.signext.i = sext i16 %.sroa.0285.0.copyload.i to i32
  %170 = and i32 %.sroa.0285.0.copyload.signext.i, -2147483648
  %.not855.i = icmp eq i32 %168, 0
  %171 = select i1 %.not855.i, i32 2139095040, i32 2143289344
  %172 = or disjoint i32 %171, %170
  %173 = bitcast i32 %172 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

174:                                              ; preds = %154
  %175 = or disjoint i32 %168, 1024
  br label %176

176:                                              ; preds = %174, %154
  %177 = phi i32 [ %175, %174 ], [ %168, %154 ]
  %178 = uitofp i32 %177 to float
  %.not.i = icmp eq i32 %167, 0
  %179 = add nsw i32 %167, -25
  %180 = select i1 %.not.i, i32 -24, i32 %179
  %181 = call float @__ocml_ldexp_f32(float noundef %178, i32 noundef %180) #5
  %182 = fneg contract float %181
  %.not809810.i = icmp slt i16 %.sroa.0285.0.copyload.i, 0
  %183 = select contract i1 %.not809810.i, float %182, float %181
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i: ; preds = %176, %169
  %184 = phi float [ %173, %169 ], [ %183, %176 ]
  %185 = zext i16 %.sroa.0276.0.copyload.i to i32
  %186 = lshr i32 %185, 10
  %187 = and i32 %186, 31
  %188 = and i32 %185, 1023
  switch i32 %187, label %194 [
    i32 31, label %189
    i32 0, label %196
  ]

189:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %.sroa.0276.0.copyload.signext.i = sext i16 %.sroa.0276.0.copyload.i to i32
  %190 = and i32 %.sroa.0276.0.copyload.signext.i, -2147483648
  %.not854.i = icmp eq i32 %188, 0
  %191 = select i1 %.not854.i, i32 2139095040, i32 2143289344
  %192 = or disjoint i32 %191, %190
  %193 = bitcast i32 %192 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %195 = or disjoint i32 %188, 1024
  br label %196

196:                                              ; preds = %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %197 = phi i32 [ %195, %194 ], [ %188, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i ]
  %198 = uitofp i32 %197 to float
  %.not811.i = icmp eq i32 %187, 0
  %199 = add nsw i32 %187, -25
  %200 = select i1 %.not811.i, i32 -24, i32 %199
  %201 = call float @__ocml_ldexp_f32(float noundef %198, i32 noundef %200) #5
  %202 = fneg contract float %201
  %.not812813.i = icmp slt i16 %.sroa.0276.0.copyload.i, 0
  %203 = select contract i1 %.not812813.i, float %202, float %201
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i: ; preds = %196, %189
  %204 = phi float [ %193, %189 ], [ %203, %196 ]
  %205 = fmul contract float %184, %204
  %206 = fadd contract float %157, %205
  %207 = or disjoint i64 %161, %131
  %208 = trunc i64 %207 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %208
  %.sroa.0267.0.copyload.i = load i16, ptr addrspace(3) %209, align 2, !tbaa.struct !23
  %210 = zext i16 %.sroa.0267.0.copyload.i to i32
  %211 = lshr i32 %210, 10
  %212 = and i32 %211, 31
  %213 = and i32 %210, 1023
  switch i32 %212, label %219 [
    i32 31, label %214
    i32 0, label %221
  ]

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %.sroa.0267.0.copyload.signext.i = sext i16 %.sroa.0267.0.copyload.i to i32
  %215 = and i32 %.sroa.0267.0.copyload.signext.i, -2147483648
  %.not853.i = icmp eq i32 %213, 0
  %216 = select i1 %.not853.i, i32 2139095040, i32 2143289344
  %217 = or disjoint i32 %216, %215
  %218 = bitcast i32 %217 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %220 = or disjoint i32 %213, 1024
  br label %221

221:                                              ; preds = %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %222 = phi i32 [ %220, %219 ], [ %213, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i ]
  %223 = uitofp i32 %222 to float
  %.not814.i = icmp eq i32 %212, 0
  %224 = add nsw i32 %212, -25
  %225 = select i1 %.not814.i, i32 -24, i32 %224
  %226 = call float @__ocml_ldexp_f32(float noundef %223, i32 noundef %225) #5
  %227 = fneg contract float %226
  %.not815816.i = icmp slt i16 %.sroa.0267.0.copyload.i, 0
  %228 = select contract i1 %.not815816.i, float %227, float %226
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %221, %214
  %229 = phi float [ %218, %214 ], [ %228, %221 ]
  %230 = fmul contract float %184, %229
  %231 = fadd contract float %156, %230
  %232 = or disjoint i64 %155, 1
  %233 = add nuw nsw i64 %232, %132
  %234 = trunc i64 %233 to i32
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %234
  %.sroa.0258.0.copyload.i = load i16, ptr addrspace(3) %235, align 2, !tbaa.struct !23
  %236 = shl nuw nsw i64 %232, 4
  %237 = or disjoint i64 %236, %129
  %238 = trunc i64 %237 to i32
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %238
  %.sroa.0249.0.copyload.i = load i16, ptr addrspace(3) %239, align 2, !tbaa.struct !23
  %240 = zext i16 %.sroa.0258.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0258.0.copyload.signext.i = sext i16 %.sroa.0258.0.copyload.i to i32
  %245 = and i32 %.sroa.0258.0.copyload.signext.i, -2147483648
  %.not852.i = icmp eq i32 %243, 0
  %246 = select i1 %.not852.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not817.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not817.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #5
  %257 = fneg contract float %256
  %.not818819.i = icmp slt i16 %.sroa.0258.0.copyload.i, 0
  %258 = select contract i1 %.not818819.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = zext i16 %.sroa.0249.0.copyload.i to i32
  %261 = lshr i32 %260, 10
  %262 = and i32 %261, 31
  %263 = and i32 %260, 1023
  switch i32 %262, label %269 [
    i32 31, label %264
    i32 0, label %271
  ]

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0249.0.copyload.signext.i = sext i16 %.sroa.0249.0.copyload.i to i32
  %265 = and i32 %.sroa.0249.0.copyload.signext.i, -2147483648
  %.not851.i = icmp eq i32 %263, 0
  %266 = select i1 %.not851.i, i32 2139095040, i32 2143289344
  %267 = or disjoint i32 %266, %265
  %268 = bitcast i32 %267 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %270 = or disjoint i32 %263, 1024
  br label %271

271:                                              ; preds = %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %272 = phi i32 [ %270, %269 ], [ %263, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %273 = uitofp i32 %272 to float
  %.not820.i = icmp eq i32 %262, 0
  %274 = add nsw i32 %262, -25
  %275 = select i1 %.not820.i, i32 -24, i32 %274
  %276 = call float @__ocml_ldexp_f32(float noundef %273, i32 noundef %275) #5
  %277 = fneg contract float %276
  %.not821822.i = icmp slt i16 %.sroa.0249.0.copyload.i, 0
  %278 = select contract i1 %.not821822.i, float %277, float %276
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %271, %264
  %279 = phi float [ %268, %264 ], [ %278, %271 ]
  %280 = fmul contract float %259, %279
  %281 = fadd contract float %206, %280
  %282 = or disjoint i64 %236, %131
  %283 = trunc i64 %282 to i32
  %284 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %283
  %.sroa.0240.0.copyload.i = load i16, ptr addrspace(3) %284, align 2, !tbaa.struct !23
  %285 = zext i16 %.sroa.0240.0.copyload.i to i32
  %286 = lshr i32 %285, 10
  %287 = and i32 %286, 31
  %288 = and i32 %285, 1023
  switch i32 %287, label %294 [
    i32 31, label %289
    i32 0, label %296
  ]

289:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0240.0.copyload.signext.i = sext i16 %.sroa.0240.0.copyload.i to i32
  %290 = and i32 %.sroa.0240.0.copyload.signext.i, -2147483648
  %.not850.i = icmp eq i32 %288, 0
  %291 = select i1 %.not850.i, i32 2139095040, i32 2143289344
  %292 = or disjoint i32 %291, %290
  %293 = bitcast i32 %292 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %295 = or disjoint i32 %288, 1024
  br label %296

296:                                              ; preds = %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %297 = phi i32 [ %295, %294 ], [ %288, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %298 = uitofp i32 %297 to float
  %.not823.i = icmp eq i32 %287, 0
  %299 = add nsw i32 %287, -25
  %300 = select i1 %.not823.i, i32 -24, i32 %299
  %301 = call float @__ocml_ldexp_f32(float noundef %298, i32 noundef %300) #5
  %302 = fneg contract float %301
  %.not824825.i = icmp slt i16 %.sroa.0240.0.copyload.i, 0
  %303 = select contract i1 %.not824825.i, float %302, float %301
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %296, %289
  %304 = phi float [ %293, %289 ], [ %303, %296 ]
  %305 = fmul contract float %259, %304
  %306 = fadd contract float %231, %305
  %307 = or disjoint i64 %155, 2
  %308 = add nuw nsw i64 %307, %132
  %309 = trunc i64 %308 to i32
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %309
  %.sroa.0231.0.copyload.i = load i16, ptr addrspace(3) %310, align 2, !tbaa.struct !23
  %311 = shl nuw nsw i64 %307, 4
  %312 = or disjoint i64 %311, %129
  %313 = trunc i64 %312 to i32
  %314 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %313
  %.sroa.0222.0.copyload.i = load i16, ptr addrspace(3) %314, align 2, !tbaa.struct !23
  %315 = zext i16 %.sroa.0231.0.copyload.i to i32
  %316 = lshr i32 %315, 10
  %317 = and i32 %316, 31
  %318 = and i32 %315, 1023
  switch i32 %317, label %324 [
    i32 31, label %319
    i32 0, label %326
  ]

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0231.0.copyload.signext.i = sext i16 %.sroa.0231.0.copyload.i to i32
  %320 = and i32 %.sroa.0231.0.copyload.signext.i, -2147483648
  %.not849.i = icmp eq i32 %318, 0
  %321 = select i1 %.not849.i, i32 2139095040, i32 2143289344
  %322 = or disjoint i32 %321, %320
  %323 = bitcast i32 %322 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %325 = or disjoint i32 %318, 1024
  br label %326

326:                                              ; preds = %324, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %327 = phi i32 [ %325, %324 ], [ %318, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %328 = uitofp i32 %327 to float
  %.not826.i = icmp eq i32 %317, 0
  %329 = add nsw i32 %317, -25
  %330 = select i1 %.not826.i, i32 -24, i32 %329
  %331 = call float @__ocml_ldexp_f32(float noundef %328, i32 noundef %330) #5
  %332 = fneg contract float %331
  %.not827828.i = icmp slt i16 %.sroa.0231.0.copyload.i, 0
  %333 = select contract i1 %.not827828.i, float %332, float %331
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %326, %319
  %334 = phi float [ %323, %319 ], [ %333, %326 ]
  %335 = zext i16 %.sroa.0222.0.copyload.i to i32
  %336 = lshr i32 %335, 10
  %337 = and i32 %336, 31
  %338 = and i32 %335, 1023
  switch i32 %337, label %344 [
    i32 31, label %339
    i32 0, label %346
  ]

339:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0222.0.copyload.signext.i = sext i16 %.sroa.0222.0.copyload.i to i32
  %340 = and i32 %.sroa.0222.0.copyload.signext.i, -2147483648
  %.not848.i = icmp eq i32 %338, 0
  %341 = select i1 %.not848.i, i32 2139095040, i32 2143289344
  %342 = or disjoint i32 %341, %340
  %343 = bitcast i32 %342 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %345 = or disjoint i32 %338, 1024
  br label %346

346:                                              ; preds = %344, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %347 = phi i32 [ %345, %344 ], [ %338, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %348 = uitofp i32 %347 to float
  %.not829.i = icmp eq i32 %337, 0
  %349 = add nsw i32 %337, -25
  %350 = select i1 %.not829.i, i32 -24, i32 %349
  %351 = call float @__ocml_ldexp_f32(float noundef %348, i32 noundef %350) #5
  %352 = fneg contract float %351
  %.not830831.i = icmp slt i16 %.sroa.0222.0.copyload.i, 0
  %353 = select contract i1 %.not830831.i, float %352, float %351
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %346, %339
  %354 = phi float [ %343, %339 ], [ %353, %346 ]
  %355 = fmul contract float %334, %354
  %356 = fadd contract float %281, %355
  %357 = or disjoint i64 %311, %131
  %358 = trunc i64 %357 to i32
  %359 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %358
  %.sroa.0213.0.copyload.i = load i16, ptr addrspace(3) %359, align 2, !tbaa.struct !23
  %360 = zext i16 %.sroa.0213.0.copyload.i to i32
  %361 = lshr i32 %360, 10
  %362 = and i32 %361, 31
  %363 = and i32 %360, 1023
  switch i32 %362, label %369 [
    i32 31, label %364
    i32 0, label %371
  ]

364:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0213.0.copyload.signext.i = sext i16 %.sroa.0213.0.copyload.i to i32
  %365 = and i32 %.sroa.0213.0.copyload.signext.i, -2147483648
  %.not847.i = icmp eq i32 %363, 0
  %366 = select i1 %.not847.i, i32 2139095040, i32 2143289344
  %367 = or disjoint i32 %366, %365
  %368 = bitcast i32 %367 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %370 = or disjoint i32 %363, 1024
  br label %371

371:                                              ; preds = %369, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %372 = phi i32 [ %370, %369 ], [ %363, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %373 = uitofp i32 %372 to float
  %.not832.i = icmp eq i32 %362, 0
  %374 = add nsw i32 %362, -25
  %375 = select i1 %.not832.i, i32 -24, i32 %374
  %376 = call float @__ocml_ldexp_f32(float noundef %373, i32 noundef %375) #5
  %377 = fneg contract float %376
  %.not833834.i = icmp slt i16 %.sroa.0213.0.copyload.i, 0
  %378 = select contract i1 %.not833834.i, float %377, float %376
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %371, %364
  %379 = phi float [ %368, %364 ], [ %378, %371 ]
  %380 = fmul contract float %334, %379
  %381 = fadd contract float %306, %380
  %382 = or disjoint i64 %155, 3
  %383 = add nuw nsw i64 %382, %132
  %384 = trunc i64 %383 to i32
  %385 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %384
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %385, align 2, !tbaa.struct !23
  %386 = shl nuw nsw i64 %382, 4
  %387 = or disjoint i64 %386, %129
  %388 = trunc i64 %387 to i32
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %388
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %389, align 2, !tbaa.struct !23
  %390 = zext i16 %.sroa.0204.0.copyload.i to i32
  %391 = lshr i32 %390, 10
  %392 = and i32 %391, 31
  %393 = and i32 %390, 1023
  switch i32 %392, label %399 [
    i32 31, label %394
    i32 0, label %401
  ]

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %395 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not846.i = icmp eq i32 %393, 0
  %396 = select i1 %.not846.i, i32 2139095040, i32 2143289344
  %397 = or disjoint i32 %396, %395
  %398 = bitcast i32 %397 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

399:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %400 = or disjoint i32 %393, 1024
  br label %401

401:                                              ; preds = %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %402 = phi i32 [ %400, %399 ], [ %393, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %403 = uitofp i32 %402 to float
  %.not835.i = icmp eq i32 %392, 0
  %404 = add nsw i32 %392, -25
  %405 = select i1 %.not835.i, i32 -24, i32 %404
  %406 = call float @__ocml_ldexp_f32(float noundef %403, i32 noundef %405) #5
  %407 = fneg contract float %406
  %.not836837.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %408 = select contract i1 %.not836837.i, float %407, float %406
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %401, %394
  %409 = phi float [ %398, %394 ], [ %408, %401 ]
  %410 = zext i16 %.sroa.0195.0.copyload.i to i32
  %411 = lshr i32 %410, 10
  %412 = and i32 %411, 31
  %413 = and i32 %410, 1023
  switch i32 %412, label %419 [
    i32 31, label %414
    i32 0, label %421
  ]

414:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %415 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not845.i = icmp eq i32 %413, 0
  %416 = select i1 %.not845.i, i32 2139095040, i32 2143289344
  %417 = or disjoint i32 %416, %415
  %418 = bitcast i32 %417 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

419:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %420 = or disjoint i32 %413, 1024
  br label %421

421:                                              ; preds = %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %422 = phi i32 [ %420, %419 ], [ %413, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %423 = uitofp i32 %422 to float
  %.not838.i = icmp eq i32 %412, 0
  %424 = add nsw i32 %412, -25
  %425 = select i1 %.not838.i, i32 -24, i32 %424
  %426 = call float @__ocml_ldexp_f32(float noundef %423, i32 noundef %425) #5
  %427 = fneg contract float %426
  %.not839840.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %428 = select contract i1 %.not839840.i, float %427, float %426
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %421, %414
  %429 = phi float [ %418, %414 ], [ %428, %421 ]
  %430 = fmul contract float %409, %429
  %431 = fadd contract float %356, %430
  %432 = or disjoint i64 %386, %131
  %433 = trunc i64 %432 to i32
  %434 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %433
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %434, align 2, !tbaa.struct !23
  %435 = zext i16 %.sroa.0186.0.copyload.i to i32
  %436 = lshr i32 %435, 10
  %437 = and i32 %436, 31
  %438 = and i32 %435, 1023
  switch i32 %437, label %444 [
    i32 31, label %439
    i32 0, label %446
  ]

439:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %440 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not844.i = icmp eq i32 %438, 0
  %441 = select i1 %.not844.i, i32 2139095040, i32 2143289344
  %442 = or disjoint i32 %441, %440
  %443 = bitcast i32 %442 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

444:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %445 = or disjoint i32 %438, 1024
  br label %446

446:                                              ; preds = %444, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %447 = phi i32 [ %445, %444 ], [ %438, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %448 = uitofp i32 %447 to float
  %.not841.i = icmp eq i32 %437, 0
  %449 = add nsw i32 %437, -25
  %450 = select i1 %.not841.i, i32 -24, i32 %449
  %451 = call float @__ocml_ldexp_f32(float noundef %448, i32 noundef %450) #5
  %452 = fneg contract float %451
  %.not842843.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %453 = select contract i1 %.not842843.i, float %452, float %451
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %446, %439
  %454 = phi float [ %443, %439 ], [ %453, %446 ]
  %455 = fmul contract float %409, %454
  %456 = fadd contract float %381, %455
  %457 = add nuw nsw i64 %155, 4
  %458 = icmp ult i64 %155, 28
  br i1 %458, label %154, label %._crit_edge878.i, !llvm.loop !37

459:                                              ; preds = %._crit_edge878.i
  %460 = shl nuw i32 %.tr.i, 7
  %461 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %462 = icmp eq i64 %461, 0
  call void @llvm.assume(i1 %462)
  %463 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %464 = icmp eq i64 %463, 0
  call void @llvm.assume(i1 %464)
  %465 = sext i32 %3 to i64
  %466 = call i32 @llvm.amdgcn.groupstaticsize()
  %467 = inttoptr i32 %466 to ptr addrspace(3)
  %468 = sext i32 %460 to i64
  %469 = icmp sgt i32 %4, 0
  %470 = icmp ugt i32 %4, 1
  %471 = icmp ugt i32 %4, 2
  %472 = icmp ugt i32 %4, 3
  %473 = icmp ugt i32 %4, 4
  %474 = icmp ugt i32 %4, 5
  %475 = icmp ugt i32 %4, 6
  %476 = icmp ugt i32 %4, 7
  %477 = icmp ugt i32 %4, 8
  %478 = icmp ugt i32 %4, 9
  %479 = icmp ugt i32 %4, 10
  %480 = icmp ugt i32 %4, 11
  %481 = icmp ugt i32 %4, 12
  %482 = icmp ugt i32 %4, 13
  %483 = icmp ugt i32 %4, 14
  %484 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %459
  %485 = phi i64 [ 0, %459 ], [ %491, %.split.us.i ]
  %486 = icmp slt i64 %485, %465
  %487 = shl i64 %485, 4
  %.tr808.i = trunc i64 %485 to i32
  %488 = shl i32 %.tr808.i, 4
  %489 = sext i32 %488 to i64
  %490 = add nsw i64 %489, %468
  %.fr.i = freeze i1 %486
  %brmerge.not.i = select i1 %.fr.i, i1 %469, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %580, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %491 = add nuw nsw i64 %485, 1
  %exitcond.not.i = icmp eq i64 %491, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %492 = trunc i64 %487 to i32
  %493 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %492
  %494 = load float, ptr addrspace(3) %493, align 4, !tbaa !35
  %495 = getelementptr inbounds float, ptr %9, i64 %490
  store float %494, ptr %495, align 32, !tbaa !35
  br i1 %470, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %496 = trunc i64 %487 to i32
  %497 = or disjoint i32 %496, 1
  %498 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !35
  %500 = or disjoint i64 %490, 1
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 4, !tbaa !35
  br i1 %471, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %502 = trunc i64 %487 to i32
  %503 = or disjoint i32 %502, 2
  %504 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !35
  %506 = or disjoint i64 %490, 2
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 8, !tbaa !35
  br i1 %472, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %508 = trunc i64 %487 to i32
  %509 = or disjoint i32 %508, 3
  %510 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !35
  %512 = or disjoint i64 %490, 3
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 4, !tbaa !35
  br i1 %473, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %514 = trunc i64 %487 to i32
  %515 = or disjoint i32 %514, 4
  %516 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !35
  %518 = or disjoint i64 %490, 4
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 16, !tbaa !35
  br i1 %474, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %520 = trunc i64 %487 to i32
  %521 = or disjoint i32 %520, 5
  %522 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !35
  %524 = or disjoint i64 %490, 5
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 4, !tbaa !35
  br i1 %475, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %526 = trunc i64 %487 to i32
  %527 = or disjoint i32 %526, 6
  %528 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !35
  %530 = or disjoint i64 %490, 6
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 8, !tbaa !35
  br i1 %476, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %532 = trunc i64 %487 to i32
  %533 = or disjoint i32 %532, 7
  %534 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %533
  %535 = load float, ptr addrspace(3) %534, align 4, !tbaa !35
  %536 = or disjoint i64 %490, 7
  %537 = getelementptr inbounds float, ptr %9, i64 %536
  store float %535, ptr %537, align 4, !tbaa !35
  br i1 %477, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %538 = trunc i64 %487 to i32
  %539 = or disjoint i32 %538, 8
  %540 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !35
  %542 = or disjoint i64 %490, 8
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 32, !tbaa !35
  br i1 %478, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %544 = trunc i64 %487 to i32
  %545 = or disjoint i32 %544, 9
  %546 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %545
  %547 = load float, ptr addrspace(3) %546, align 4, !tbaa !35
  %548 = or disjoint i64 %490, 9
  %549 = getelementptr inbounds float, ptr %9, i64 %548
  store float %547, ptr %549, align 4, !tbaa !35
  br i1 %479, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %550 = trunc i64 %487 to i32
  %551 = or disjoint i32 %550, 10
  %552 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %551
  %553 = load float, ptr addrspace(3) %552, align 4, !tbaa !35
  %554 = or disjoint i64 %490, 10
  %555 = getelementptr inbounds float, ptr %9, i64 %554
  store float %553, ptr %555, align 8, !tbaa !35
  br i1 %480, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %556 = trunc i64 %487 to i32
  %557 = or disjoint i32 %556, 11
  %558 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %557
  %559 = load float, ptr addrspace(3) %558, align 4, !tbaa !35
  %560 = or disjoint i64 %490, 11
  %561 = getelementptr inbounds float, ptr %9, i64 %560
  store float %559, ptr %561, align 4, !tbaa !35
  br i1 %481, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %562 = trunc i64 %487 to i32
  %563 = or disjoint i32 %562, 12
  %564 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %563
  %565 = load float, ptr addrspace(3) %564, align 4, !tbaa !35
  %566 = or disjoint i64 %490, 12
  %567 = getelementptr inbounds float, ptr %9, i64 %566
  store float %565, ptr %567, align 16, !tbaa !35
  br i1 %482, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %568 = trunc i64 %487 to i32
  %569 = or disjoint i32 %568, 13
  %570 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %569
  %571 = load float, ptr addrspace(3) %570, align 4, !tbaa !35
  %572 = or disjoint i64 %490, 13
  %573 = getelementptr inbounds float, ptr %9, i64 %572
  store float %571, ptr %573, align 4, !tbaa !35
  br i1 %483, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %574 = trunc i64 %487 to i32
  %575 = or disjoint i32 %574, 14
  %576 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %575
  %577 = load float, ptr addrspace(3) %576, align 4, !tbaa !35
  %578 = or disjoint i64 %490, 14
  %579 = getelementptr inbounds float, ptr %9, i64 %578
  store float %577, ptr %579, align 8, !tbaa !35
  br i1 %484, label %580, label %.split.us.i

580:                                              ; preds = %.preheader.split.15.i
  %581 = trunc i64 %487 to i32
  %582 = or disjoint i32 %581, 15
  %583 = getelementptr inbounds float, ptr addrspace(3) %467, i32 %582
  %584 = load float, ptr addrspace(3) %583, align 4, !tbaa !35
  %585 = or disjoint i64 %490, 15
  %586 = getelementptr inbounds float, ptr %9, i64 %585
  store float %584, ptr %586, align 4, !tbaa !35
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge878.i, %.split.us.i
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
!33 = distinct !{!33, !29, !30, !31}
!34 = distinct !{!34, !29, !30, !31}
!35 = !{!36, !36, i64 0}
!36 = !{!"float", !26, i64 0}
!37 = distinct !{!37, !29}
!38 = distinct !{!38, !29}
;----------------- End AdaptiveCpp IR dump ---------------
