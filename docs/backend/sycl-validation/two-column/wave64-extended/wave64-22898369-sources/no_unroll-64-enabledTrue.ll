;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-mw2uqtiq/kernel.cpp"
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

.lr.ph574.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i
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

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0286.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i: ; preds = %60, %55
  %.sroa.0288.1.i = phi i16 [ %.sroa.0286.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0288.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  %67 = add nuw nsw i64 %56, 64
  %68 = icmp ult i64 %56, 192
  br i1 %68, label %55, label %.lr.ph574.i, !llvm.loop !28

.lr.ph577.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph574.i
  %84 = phi i64 [ %49, %.lr.ph574.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 5
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 248
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !23
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0327.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  %93 = add nuw nsw i64 %84, 64
  %94 = icmp ult i64 %84, 192
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph577.i, !llvm.loop !32

.lr.ph580.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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

105:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph577.i
  %106 = phi i64 [ %73, %.lr.ph577.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %107 = lshr i64 %106, 5
  %108 = icmp slt i64 %107, %76
  %109 = and i1 %108, %83
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

110:                                              ; preds = %105
  %111 = and i64 %106, 9223372036854775776
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %82
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0245.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %110, %105
  %.sroa.0247.1.i = phi i16 [ %.sroa.0245.0.copyload.i, %110 ], [ 0, %105 ]
  %115 = trunc i64 %106 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0247.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = add nuw nsw i64 %106, 64
  %118 = icmp ult i64 %106, 448
  br i1 %118, label %105, label %.lr.ph580.i, !llvm.loop !33

.lr.ph583.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph580.i
  %133 = phi i64 [ %99, %.lr.ph580.i ], [ %142, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %134 = lshr i64 %133, 4
  %135 = shl nuw nsw i64 %133, 5
  %136 = and i64 %135, 480
  %137 = or disjoint i64 %136, %134
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %138
  %.sroa.0328.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !23
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %140
  store i16 %.sroa.0328.0.copyload.i, ptr addrspace(3) %141, align 2, !tbaa.struct !23
  %142 = add nuw nsw i64 %133, 64
  %143 = icmp ult i64 %133, 448
  br i1 %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph583.i, !llvm.loop !34

._crit_edge584.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %144 = shl nuw nsw i64 %130, 4
  %145 = or disjoint i64 %144, %129
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %146
  store float %206, ptr addrspace(3) %147, align 4, !tbaa !35
  %148 = or disjoint i64 %144, %131
  %149 = trunc i64 %148 to i32
  %150 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %149
  store float %231, ptr addrspace(3) %150, align 4, !tbaa !35
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
  br i1 %153, label %233, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

154:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph583.i
  %155 = phi i64 [ 0, %.lr.ph583.i ], [ %232, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = phi float [ 0.000000e+00, %.lr.ph583.i ], [ %231, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %157 = phi float [ 0.000000e+00, %.lr.ph583.i ], [ %206, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %158 = add nuw nsw i64 %155, %132
  %159 = trunc i64 %158 to i32
  %160 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %159
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %160, align 2, !tbaa.struct !23
  %161 = shl nuw nsw i64 %155, 4
  %162 = or disjoint i64 %161, %129
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %163
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %164, align 2, !tbaa.struct !23
  %165 = zext i16 %.sroa.0204.0.copyload.i to i32
  %166 = lshr i32 %165, 10
  %167 = and i32 %166, 31
  %168 = and i32 %165, 1023
  switch i32 %167, label %174 [
    i32 31, label %169
    i32 0, label %176
  ]

169:                                              ; preds = %154
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %170 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not561.i = icmp eq i32 %168, 0
  %171 = select i1 %.not561.i, i32 2139095040, i32 2143289344
  %172 = or disjoint i32 %171, %170
  %173 = bitcast i32 %172 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

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
  %.not551552.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %183 = select contract i1 %.not551552.i, float %182, float %181
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %176, %169
  %184 = phi float [ %173, %169 ], [ %183, %176 ]
  %185 = zext i16 %.sroa.0195.0.copyload.i to i32
  %186 = lshr i32 %185, 10
  %187 = and i32 %186, 31
  %188 = and i32 %185, 1023
  switch i32 %187, label %194 [
    i32 31, label %189
    i32 0, label %196
  ]

189:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %190 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not560.i = icmp eq i32 %188, 0
  %191 = select i1 %.not560.i, i32 2139095040, i32 2143289344
  %192 = or disjoint i32 %191, %190
  %193 = bitcast i32 %192 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %195 = or disjoint i32 %188, 1024
  br label %196

196:                                              ; preds = %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %197 = phi i32 [ %195, %194 ], [ %188, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %198 = uitofp i32 %197 to float
  %.not553.i = icmp eq i32 %187, 0
  %199 = add nsw i32 %187, -25
  %200 = select i1 %.not553.i, i32 -24, i32 %199
  %201 = call float @__ocml_ldexp_f32(float noundef %198, i32 noundef %200) #5
  %202 = fneg contract float %201
  %.not554555.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %203 = select contract i1 %.not554555.i, float %202, float %201
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %196, %189
  %204 = phi float [ %193, %189 ], [ %203, %196 ]
  %205 = fmul contract float %184, %204
  %206 = fadd contract float %157, %205
  %207 = or disjoint i64 %161, %131
  %208 = trunc i64 %207 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %208
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %209, align 2, !tbaa.struct !23
  %210 = zext i16 %.sroa.0186.0.copyload.i to i32
  %211 = lshr i32 %210, 10
  %212 = and i32 %211, 31
  %213 = and i32 %210, 1023
  switch i32 %212, label %219 [
    i32 31, label %214
    i32 0, label %221
  ]

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %215 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not559.i = icmp eq i32 %213, 0
  %216 = select i1 %.not559.i, i32 2139095040, i32 2143289344
  %217 = or disjoint i32 %216, %215
  %218 = bitcast i32 %217 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %220 = or disjoint i32 %213, 1024
  br label %221

221:                                              ; preds = %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %222 = phi i32 [ %220, %219 ], [ %213, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %223 = uitofp i32 %222 to float
  %.not556.i = icmp eq i32 %212, 0
  %224 = add nsw i32 %212, -25
  %225 = select i1 %.not556.i, i32 -24, i32 %224
  %226 = call float @__ocml_ldexp_f32(float noundef %223, i32 noundef %225) #5
  %227 = fneg contract float %226
  %.not557558.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %228 = select contract i1 %.not557558.i, float %227, float %226
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %221, %214
  %229 = phi float [ %218, %214 ], [ %228, %221 ]
  %230 = fmul contract float %184, %229
  %231 = fadd contract float %156, %230
  %232 = add nuw nsw i64 %155, 1
  %exitcond.not.i = icmp eq i64 %232, 32
  br i1 %exitcond.not.i, label %._crit_edge584.i, label %154, !llvm.loop !37

233:                                              ; preds = %._crit_edge584.i
  %234 = shl nuw i32 %.tr.i, 7
  %235 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %236 = icmp eq i64 %235, 0
  call void @llvm.assume(i1 %236)
  %237 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %238 = icmp eq i64 %237, 0
  call void @llvm.assume(i1 %238)
  %239 = sext i32 %3 to i64
  %240 = call i32 @llvm.amdgcn.groupstaticsize()
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = sext i32 %234 to i64
  %243 = icmp sgt i32 %4, 0
  %244 = icmp ugt i32 %4, 1
  %245 = icmp ugt i32 %4, 2
  %246 = icmp ugt i32 %4, 3
  %247 = icmp ugt i32 %4, 4
  %248 = icmp ugt i32 %4, 5
  %249 = icmp ugt i32 %4, 6
  %250 = icmp ugt i32 %4, 7
  %251 = icmp ugt i32 %4, 8
  %252 = icmp ugt i32 %4, 9
  %253 = icmp ugt i32 %4, 10
  %254 = icmp ugt i32 %4, 11
  %255 = icmp ugt i32 %4, 12
  %256 = icmp ugt i32 %4, 13
  %257 = icmp ugt i32 %4, 14
  %258 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %233
  %259 = phi i64 [ 0, %233 ], [ %265, %.split.us.i ]
  %260 = icmp slt i64 %259, %239
  %261 = shl i64 %259, 4
  %.tr550.i = trunc i64 %259 to i32
  %262 = shl i32 %.tr550.i, 4
  %263 = sext i32 %262 to i64
  %264 = add nsw i64 %263, %242
  %.fr.i = freeze i1 %260
  %brmerge.not.i = select i1 %.fr.i, i1 %243, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %354, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %265 = add nuw nsw i64 %259, 1
  %exitcond588.not.i = icmp eq i64 %265, 8
  br i1 %exitcond588.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %266 = trunc i64 %261 to i32
  %267 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %266
  %268 = load float, ptr addrspace(3) %267, align 4, !tbaa !35
  %269 = getelementptr inbounds float, ptr %9, i64 %264
  store float %268, ptr %269, align 32, !tbaa !35
  br i1 %244, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %270 = trunc i64 %261 to i32
  %271 = or disjoint i32 %270, 1
  %272 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %271
  %273 = load float, ptr addrspace(3) %272, align 4, !tbaa !35
  %274 = or disjoint i64 %264, 1
  %275 = getelementptr inbounds float, ptr %9, i64 %274
  store float %273, ptr %275, align 4, !tbaa !35
  br i1 %245, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %276 = trunc i64 %261 to i32
  %277 = or disjoint i32 %276, 2
  %278 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %277
  %279 = load float, ptr addrspace(3) %278, align 4, !tbaa !35
  %280 = or disjoint i64 %264, 2
  %281 = getelementptr inbounds float, ptr %9, i64 %280
  store float %279, ptr %281, align 8, !tbaa !35
  br i1 %246, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %282 = trunc i64 %261 to i32
  %283 = or disjoint i32 %282, 3
  %284 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %283
  %285 = load float, ptr addrspace(3) %284, align 4, !tbaa !35
  %286 = or disjoint i64 %264, 3
  %287 = getelementptr inbounds float, ptr %9, i64 %286
  store float %285, ptr %287, align 4, !tbaa !35
  br i1 %247, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %288 = trunc i64 %261 to i32
  %289 = or disjoint i32 %288, 4
  %290 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %289
  %291 = load float, ptr addrspace(3) %290, align 4, !tbaa !35
  %292 = or disjoint i64 %264, 4
  %293 = getelementptr inbounds float, ptr %9, i64 %292
  store float %291, ptr %293, align 16, !tbaa !35
  br i1 %248, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %294 = trunc i64 %261 to i32
  %295 = or disjoint i32 %294, 5
  %296 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %295
  %297 = load float, ptr addrspace(3) %296, align 4, !tbaa !35
  %298 = or disjoint i64 %264, 5
  %299 = getelementptr inbounds float, ptr %9, i64 %298
  store float %297, ptr %299, align 4, !tbaa !35
  br i1 %249, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %300 = trunc i64 %261 to i32
  %301 = or disjoint i32 %300, 6
  %302 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %301
  %303 = load float, ptr addrspace(3) %302, align 4, !tbaa !35
  %304 = or disjoint i64 %264, 6
  %305 = getelementptr inbounds float, ptr %9, i64 %304
  store float %303, ptr %305, align 8, !tbaa !35
  br i1 %250, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %306 = trunc i64 %261 to i32
  %307 = or disjoint i32 %306, 7
  %308 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %307
  %309 = load float, ptr addrspace(3) %308, align 4, !tbaa !35
  %310 = or disjoint i64 %264, 7
  %311 = getelementptr inbounds float, ptr %9, i64 %310
  store float %309, ptr %311, align 4, !tbaa !35
  br i1 %251, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %312 = trunc i64 %261 to i32
  %313 = or disjoint i32 %312, 8
  %314 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %313
  %315 = load float, ptr addrspace(3) %314, align 4, !tbaa !35
  %316 = or disjoint i64 %264, 8
  %317 = getelementptr inbounds float, ptr %9, i64 %316
  store float %315, ptr %317, align 32, !tbaa !35
  br i1 %252, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %318 = trunc i64 %261 to i32
  %319 = or disjoint i32 %318, 9
  %320 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %319
  %321 = load float, ptr addrspace(3) %320, align 4, !tbaa !35
  %322 = or disjoint i64 %264, 9
  %323 = getelementptr inbounds float, ptr %9, i64 %322
  store float %321, ptr %323, align 4, !tbaa !35
  br i1 %253, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %324 = trunc i64 %261 to i32
  %325 = or disjoint i32 %324, 10
  %326 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %325
  %327 = load float, ptr addrspace(3) %326, align 4, !tbaa !35
  %328 = or disjoint i64 %264, 10
  %329 = getelementptr inbounds float, ptr %9, i64 %328
  store float %327, ptr %329, align 8, !tbaa !35
  br i1 %254, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %330 = trunc i64 %261 to i32
  %331 = or disjoint i32 %330, 11
  %332 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %331
  %333 = load float, ptr addrspace(3) %332, align 4, !tbaa !35
  %334 = or disjoint i64 %264, 11
  %335 = getelementptr inbounds float, ptr %9, i64 %334
  store float %333, ptr %335, align 4, !tbaa !35
  br i1 %255, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %336 = trunc i64 %261 to i32
  %337 = or disjoint i32 %336, 12
  %338 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %337
  %339 = load float, ptr addrspace(3) %338, align 4, !tbaa !35
  %340 = or disjoint i64 %264, 12
  %341 = getelementptr inbounds float, ptr %9, i64 %340
  store float %339, ptr %341, align 16, !tbaa !35
  br i1 %256, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %342 = trunc i64 %261 to i32
  %343 = or disjoint i32 %342, 13
  %344 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %343
  %345 = load float, ptr addrspace(3) %344, align 4, !tbaa !35
  %346 = or disjoint i64 %264, 13
  %347 = getelementptr inbounds float, ptr %9, i64 %346
  store float %345, ptr %347, align 4, !tbaa !35
  br i1 %257, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %348 = trunc i64 %261 to i32
  %349 = or disjoint i32 %348, 14
  %350 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %349
  %351 = load float, ptr addrspace(3) %350, align 4, !tbaa !35
  %352 = or disjoint i64 %264, 14
  %353 = getelementptr inbounds float, ptr %9, i64 %352
  store float %351, ptr %353, align 8, !tbaa !35
  br i1 %258, label %354, label %.split.us.i

354:                                              ; preds = %.preheader.split.15.i
  %355 = trunc i64 %261 to i32
  %356 = or disjoint i32 %355, 15
  %357 = getelementptr inbounds float, ptr addrspace(3) %241, i32 %356
  %358 = load float, ptr addrspace(3) %357, align 4, !tbaa !35
  %359 = or disjoint i64 %264, 15
  %360 = getelementptr inbounds float, ptr %9, i64 %359
  store float %358, ptr %360, align 4, !tbaa !35
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge584.i, %.split.us.i
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
