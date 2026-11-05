;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882026/tmp/triton-sycl-cache/compile-9g2f0iqg/kernel.cpp"
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
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 31
  %44 = icmp slt i64 %43, %38
  br label %60

.lr.ph718.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i
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
  %51 = shl i32 %.tr.i, 9
  %52 = sext i32 %5 to i64
  %53 = sext i32 %4 to i64
  %54 = sext i32 %51 to i64
  %55 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %56 = inttoptr i32 %55 to ptr addrspace(3)
  %57 = getelementptr inbounds i8, ptr addrspace(3) %56, i32 1024
  %58 = and i64 %49, 15
  %59 = icmp slt i64 %58, %53
  br label %88

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %72, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i ]
  %62 = lshr i64 %61, 5
  %63 = icmp slt i64 %62, %37
  %64 = and i1 %63, %44
  br i1 %64, label %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i

65:                                               ; preds = %60
  %66 = and i64 %61, 9223372036854775776
  %67 = or disjoint i64 %66, %39
  %68 = or disjoint i64 %67, %43
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0305.0.copyload.i = load i16, ptr %69, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i: ; preds = %65, %60
  %.sroa.0307.1.i = phi i16 [ %.sroa.0305.0.copyload.i, %65 ], [ 0, %60 ]
  %70 = trunc i64 %61 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %70
  store i16 %.sroa.0307.1.i, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  %72 = add nuw nsw i64 %61, 64
  %73 = icmp ult i64 %61, 192
  br i1 %73, label %60, label %.lr.ph718.i, !llvm.loop !28

.lr.ph721.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %75 = icmp eq i64 %74, 0
  call void @llvm.assume(i1 %75)
  %76 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %77 = icmp eq i64 %76, 0
  call void @llvm.assume(i1 %77)
  %78 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %79 = icmp ult i64 %78, 64
  call void @llvm.assume(i1 %79)
  %80 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %81 = inttoptr i32 %80 to ptr addrspace(3)
  %82 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 512
  %83 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 1024
  %84 = and i64 %78, 7
  %85 = lshr i64 %78, 3
  %86 = or disjoint i64 %84, 8
  %87 = shl nuw nsw i64 %85, 5
  br label %112

88:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph718.i
  %89 = phi i64 [ %49, %.lr.ph718.i ], [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %90 = lshr i64 %89, 4
  %91 = icmp slt i64 %90, %52
  %92 = and i1 %91, %59
  br i1 %92, label %93, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

93:                                               ; preds = %88
  %94 = and i64 %89, 9223372036854775792
  %95 = or disjoint i64 %94, %54
  %96 = or disjoint i64 %95, %58
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %96
  %.sroa.0290.0.copyload.i = load i16, ptr %97, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %93, %88
  %.sroa.0292.1.i = phi i16 [ %.sroa.0290.0.copyload.i, %93 ], [ 0, %88 ]
  %98 = trunc i64 %89 to i32
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %98
  store i16 %.sroa.0292.1.i, ptr addrspace(3) %99, align 2, !tbaa.struct !23
  %100 = add nuw nsw i64 %89, 64
  %101 = icmp ult i64 %89, 448
  br i1 %101, label %88, label %.lr.ph721.i, !llvm.loop !32

._crit_edge722.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %102 = shl nuw nsw i64 %85, 4
  %103 = or disjoint i64 %102, %84
  %104 = trunc i64 %103 to i32
  %105 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %104
  store float %389, ptr addrspace(3) %105, align 4, !tbaa !33
  %106 = or disjoint i64 %102, %86
  %107 = trunc i64 %106 to i32
  %108 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %107
  store float %414, ptr addrspace(3) %108, align 4, !tbaa !33
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %109 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %110 = icmp ult i64 %109, 64
  call void @llvm.assume(i1 %110)
  %111 = icmp eq i64 %109, 0
  br i1 %111, label %417, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

112:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph721.i
  %113 = phi i64 [ 0, %.lr.ph721.i ], [ %415, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %114 = phi float [ 0.000000e+00, %.lr.ph721.i ], [ %414, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %115 = phi float [ 0.000000e+00, %.lr.ph721.i ], [ %389, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %116 = add nuw nsw i64 %113, %87
  %117 = trunc i64 %116 to i32
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %117
  %.sroa.0275.0.copyload.i = load i16, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  %119 = shl nuw nsw i64 %113, 4
  %120 = or disjoint i64 %119, %84
  %121 = trunc i64 %120 to i32
  %122 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %121
  %.sroa.0266.0.copyload.i = load i16, ptr addrspace(3) %122, align 2, !tbaa.struct !23
  %123 = zext i16 %.sroa.0275.0.copyload.i to i32
  %124 = lshr i32 %123, 10
  %125 = and i32 %124, 31
  %126 = and i32 %123, 1023
  switch i32 %125, label %132 [
    i32 31, label %127
    i32 0, label %134
  ]

127:                                              ; preds = %112
  %.sroa.0275.0.copyload.signext.i = sext i16 %.sroa.0275.0.copyload.i to i32
  %128 = and i32 %.sroa.0275.0.copyload.signext.i, -2147483648
  %.not705.i = icmp eq i32 %126, 0
  %129 = select i1 %.not705.i, i32 2139095040, i32 2143289344
  %130 = or disjoint i32 %129, %128
  %131 = bitcast i32 %130 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

132:                                              ; preds = %112
  %133 = or disjoint i32 %126, 1024
  br label %134

134:                                              ; preds = %132, %112
  %135 = phi i32 [ %133, %132 ], [ %126, %112 ]
  %136 = uitofp i32 %135 to float
  %.not.i = icmp eq i32 %125, 0
  %137 = add nsw i32 %125, -25
  %138 = select i1 %.not.i, i32 -24, i32 %137
  %139 = call float @__ocml_ldexp_f32(float noundef %136, i32 noundef %138) #5
  %140 = fneg contract float %139
  %.not659660.i = icmp slt i16 %.sroa.0275.0.copyload.i, 0
  %141 = select contract i1 %.not659660.i, float %140, float %139
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %134, %127
  %142 = phi float [ %131, %127 ], [ %141, %134 ]
  %143 = zext i16 %.sroa.0266.0.copyload.i to i32
  %144 = lshr i32 %143, 10
  %145 = and i32 %144, 31
  %146 = and i32 %143, 1023
  switch i32 %145, label %152 [
    i32 31, label %147
    i32 0, label %154
  ]

147:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0266.0.copyload.signext.i = sext i16 %.sroa.0266.0.copyload.i to i32
  %148 = and i32 %.sroa.0266.0.copyload.signext.i, -2147483648
  %.not704.i = icmp eq i32 %146, 0
  %149 = select i1 %.not704.i, i32 2139095040, i32 2143289344
  %150 = or disjoint i32 %149, %148
  %151 = bitcast i32 %150 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

152:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %153 = or disjoint i32 %146, 1024
  br label %154

154:                                              ; preds = %152, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %155 = phi i32 [ %153, %152 ], [ %146, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %156 = uitofp i32 %155 to float
  %.not661.i = icmp eq i32 %145, 0
  %157 = add nsw i32 %145, -25
  %158 = select i1 %.not661.i, i32 -24, i32 %157
  %159 = call float @__ocml_ldexp_f32(float noundef %156, i32 noundef %158) #5
  %160 = fneg contract float %159
  %.not662663.i = icmp slt i16 %.sroa.0266.0.copyload.i, 0
  %161 = select contract i1 %.not662663.i, float %160, float %159
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %154, %147
  %162 = phi float [ %151, %147 ], [ %161, %154 ]
  %163 = fmul contract float %142, %162
  %164 = fadd contract float %115, %163
  %165 = or disjoint i64 %119, %86
  %166 = trunc i64 %165 to i32
  %167 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %166
  %.sroa.0257.0.copyload.i = load i16, ptr addrspace(3) %167, align 2, !tbaa.struct !23
  %168 = zext i16 %.sroa.0257.0.copyload.i to i32
  %169 = lshr i32 %168, 10
  %170 = and i32 %169, 31
  %171 = and i32 %168, 1023
  switch i32 %170, label %177 [
    i32 31, label %172
    i32 0, label %179
  ]

172:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0257.0.copyload.signext.i = sext i16 %.sroa.0257.0.copyload.i to i32
  %173 = and i32 %.sroa.0257.0.copyload.signext.i, -2147483648
  %.not703.i = icmp eq i32 %171, 0
  %174 = select i1 %.not703.i, i32 2139095040, i32 2143289344
  %175 = or disjoint i32 %174, %173
  %176 = bitcast i32 %175 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

177:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %178 = or disjoint i32 %171, 1024
  br label %179

179:                                              ; preds = %177, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %180 = phi i32 [ %178, %177 ], [ %171, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %181 = uitofp i32 %180 to float
  %.not664.i = icmp eq i32 %170, 0
  %182 = add nsw i32 %170, -25
  %183 = select i1 %.not664.i, i32 -24, i32 %182
  %184 = call float @__ocml_ldexp_f32(float noundef %181, i32 noundef %183) #5
  %185 = fneg contract float %184
  %.not665666.i = icmp slt i16 %.sroa.0257.0.copyload.i, 0
  %186 = select contract i1 %.not665666.i, float %185, float %184
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %179, %172
  %187 = phi float [ %176, %172 ], [ %186, %179 ]
  %188 = fmul contract float %142, %187
  %189 = fadd contract float %114, %188
  %190 = or disjoint i64 %113, 1
  %191 = add nuw nsw i64 %190, %87
  %192 = trunc i64 %191 to i32
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %192
  %.sroa.0248.0.copyload.i = load i16, ptr addrspace(3) %193, align 2, !tbaa.struct !23
  %194 = shl nuw nsw i64 %190, 4
  %195 = or disjoint i64 %194, %84
  %196 = trunc i64 %195 to i32
  %197 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %196
  %.sroa.0239.0.copyload.i = load i16, ptr addrspace(3) %197, align 2, !tbaa.struct !23
  %198 = zext i16 %.sroa.0248.0.copyload.i to i32
  %199 = lshr i32 %198, 10
  %200 = and i32 %199, 31
  %201 = and i32 %198, 1023
  switch i32 %200, label %207 [
    i32 31, label %202
    i32 0, label %209
  ]

202:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0248.0.copyload.signext.i = sext i16 %.sroa.0248.0.copyload.i to i32
  %203 = and i32 %.sroa.0248.0.copyload.signext.i, -2147483648
  %.not702.i = icmp eq i32 %201, 0
  %204 = select i1 %.not702.i, i32 2139095040, i32 2143289344
  %205 = or disjoint i32 %204, %203
  %206 = bitcast i32 %205 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

207:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %208 = or disjoint i32 %201, 1024
  br label %209

209:                                              ; preds = %207, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %210 = phi i32 [ %208, %207 ], [ %201, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %211 = uitofp i32 %210 to float
  %.not667.i = icmp eq i32 %200, 0
  %212 = add nsw i32 %200, -25
  %213 = select i1 %.not667.i, i32 -24, i32 %212
  %214 = call float @__ocml_ldexp_f32(float noundef %211, i32 noundef %213) #5
  %215 = fneg contract float %214
  %.not668669.i = icmp slt i16 %.sroa.0248.0.copyload.i, 0
  %216 = select contract i1 %.not668669.i, float %215, float %214
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %209, %202
  %217 = phi float [ %206, %202 ], [ %216, %209 ]
  %218 = zext i16 %.sroa.0239.0.copyload.i to i32
  %219 = lshr i32 %218, 10
  %220 = and i32 %219, 31
  %221 = and i32 %218, 1023
  switch i32 %220, label %227 [
    i32 31, label %222
    i32 0, label %229
  ]

222:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0239.0.copyload.signext.i = sext i16 %.sroa.0239.0.copyload.i to i32
  %223 = and i32 %.sroa.0239.0.copyload.signext.i, -2147483648
  %.not701.i = icmp eq i32 %221, 0
  %224 = select i1 %.not701.i, i32 2139095040, i32 2143289344
  %225 = or disjoint i32 %224, %223
  %226 = bitcast i32 %225 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

227:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %228 = or disjoint i32 %221, 1024
  br label %229

229:                                              ; preds = %227, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %230 = phi i32 [ %228, %227 ], [ %221, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %231 = uitofp i32 %230 to float
  %.not670.i = icmp eq i32 %220, 0
  %232 = add nsw i32 %220, -25
  %233 = select i1 %.not670.i, i32 -24, i32 %232
  %234 = call float @__ocml_ldexp_f32(float noundef %231, i32 noundef %233) #5
  %235 = fneg contract float %234
  %.not671672.i = icmp slt i16 %.sroa.0239.0.copyload.i, 0
  %236 = select contract i1 %.not671672.i, float %235, float %234
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %229, %222
  %237 = phi float [ %226, %222 ], [ %236, %229 ]
  %238 = fmul contract float %217, %237
  %239 = fadd contract float %164, %238
  %240 = or disjoint i64 %194, %86
  %241 = trunc i64 %240 to i32
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %241
  %.sroa.0230.0.copyload.i = load i16, ptr addrspace(3) %242, align 2, !tbaa.struct !23
  %243 = zext i16 %.sroa.0230.0.copyload.i to i32
  %244 = lshr i32 %243, 10
  %245 = and i32 %244, 31
  %246 = and i32 %243, 1023
  switch i32 %245, label %252 [
    i32 31, label %247
    i32 0, label %254
  ]

247:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0230.0.copyload.signext.i = sext i16 %.sroa.0230.0.copyload.i to i32
  %248 = and i32 %.sroa.0230.0.copyload.signext.i, -2147483648
  %.not700.i = icmp eq i32 %246, 0
  %249 = select i1 %.not700.i, i32 2139095040, i32 2143289344
  %250 = or disjoint i32 %249, %248
  %251 = bitcast i32 %250 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

252:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %253 = or disjoint i32 %246, 1024
  br label %254

254:                                              ; preds = %252, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %255 = phi i32 [ %253, %252 ], [ %246, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %256 = uitofp i32 %255 to float
  %.not673.i = icmp eq i32 %245, 0
  %257 = add nsw i32 %245, -25
  %258 = select i1 %.not673.i, i32 -24, i32 %257
  %259 = call float @__ocml_ldexp_f32(float noundef %256, i32 noundef %258) #5
  %260 = fneg contract float %259
  %.not674675.i = icmp slt i16 %.sroa.0230.0.copyload.i, 0
  %261 = select contract i1 %.not674675.i, float %260, float %259
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %254, %247
  %262 = phi float [ %251, %247 ], [ %261, %254 ]
  %263 = fmul contract float %217, %262
  %264 = fadd contract float %189, %263
  %265 = or disjoint i64 %113, 2
  %266 = add nuw nsw i64 %265, %87
  %267 = trunc i64 %266 to i32
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %267
  %.sroa.0221.0.copyload.i = load i16, ptr addrspace(3) %268, align 2, !tbaa.struct !23
  %269 = shl nuw nsw i64 %265, 4
  %270 = or disjoint i64 %269, %84
  %271 = trunc i64 %270 to i32
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %271
  %.sroa.0212.0.copyload.i = load i16, ptr addrspace(3) %272, align 2, !tbaa.struct !23
  %273 = zext i16 %.sroa.0221.0.copyload.i to i32
  %274 = lshr i32 %273, 10
  %275 = and i32 %274, 31
  %276 = and i32 %273, 1023
  switch i32 %275, label %282 [
    i32 31, label %277
    i32 0, label %284
  ]

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0221.0.copyload.signext.i = sext i16 %.sroa.0221.0.copyload.i to i32
  %278 = and i32 %.sroa.0221.0.copyload.signext.i, -2147483648
  %.not699.i = icmp eq i32 %276, 0
  %279 = select i1 %.not699.i, i32 2139095040, i32 2143289344
  %280 = or disjoint i32 %279, %278
  %281 = bitcast i32 %280 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %283 = or disjoint i32 %276, 1024
  br label %284

284:                                              ; preds = %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %285 = phi i32 [ %283, %282 ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %286 = uitofp i32 %285 to float
  %.not676.i = icmp eq i32 %275, 0
  %287 = add nsw i32 %275, -25
  %288 = select i1 %.not676.i, i32 -24, i32 %287
  %289 = call float @__ocml_ldexp_f32(float noundef %286, i32 noundef %288) #5
  %290 = fneg contract float %289
  %.not677678.i = icmp slt i16 %.sroa.0221.0.copyload.i, 0
  %291 = select contract i1 %.not677678.i, float %290, float %289
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %284, %277
  %292 = phi float [ %281, %277 ], [ %291, %284 ]
  %293 = zext i16 %.sroa.0212.0.copyload.i to i32
  %294 = lshr i32 %293, 10
  %295 = and i32 %294, 31
  %296 = and i32 %293, 1023
  switch i32 %295, label %302 [
    i32 31, label %297
    i32 0, label %304
  ]

297:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0212.0.copyload.signext.i = sext i16 %.sroa.0212.0.copyload.i to i32
  %298 = and i32 %.sroa.0212.0.copyload.signext.i, -2147483648
  %.not698.i = icmp eq i32 %296, 0
  %299 = select i1 %.not698.i, i32 2139095040, i32 2143289344
  %300 = or disjoint i32 %299, %298
  %301 = bitcast i32 %300 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

302:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %303 = or disjoint i32 %296, 1024
  br label %304

304:                                              ; preds = %302, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %305 = phi i32 [ %303, %302 ], [ %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %306 = uitofp i32 %305 to float
  %.not679.i = icmp eq i32 %295, 0
  %307 = add nsw i32 %295, -25
  %308 = select i1 %.not679.i, i32 -24, i32 %307
  %309 = call float @__ocml_ldexp_f32(float noundef %306, i32 noundef %308) #5
  %310 = fneg contract float %309
  %.not680681.i = icmp slt i16 %.sroa.0212.0.copyload.i, 0
  %311 = select contract i1 %.not680681.i, float %310, float %309
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %304, %297
  %312 = phi float [ %301, %297 ], [ %311, %304 ]
  %313 = fmul contract float %292, %312
  %314 = fadd contract float %239, %313
  %315 = or disjoint i64 %269, %86
  %316 = trunc i64 %315 to i32
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %316
  %.sroa.0203.0.copyload.i = load i16, ptr addrspace(3) %317, align 2, !tbaa.struct !23
  %318 = zext i16 %.sroa.0203.0.copyload.i to i32
  %319 = lshr i32 %318, 10
  %320 = and i32 %319, 31
  %321 = and i32 %318, 1023
  switch i32 %320, label %327 [
    i32 31, label %322
    i32 0, label %329
  ]

322:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0203.0.copyload.signext.i = sext i16 %.sroa.0203.0.copyload.i to i32
  %323 = and i32 %.sroa.0203.0.copyload.signext.i, -2147483648
  %.not697.i = icmp eq i32 %321, 0
  %324 = select i1 %.not697.i, i32 2139095040, i32 2143289344
  %325 = or disjoint i32 %324, %323
  %326 = bitcast i32 %325 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %328 = or disjoint i32 %321, 1024
  br label %329

329:                                              ; preds = %327, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %330 = phi i32 [ %328, %327 ], [ %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %331 = uitofp i32 %330 to float
  %.not682.i = icmp eq i32 %320, 0
  %332 = add nsw i32 %320, -25
  %333 = select i1 %.not682.i, i32 -24, i32 %332
  %334 = call float @__ocml_ldexp_f32(float noundef %331, i32 noundef %333) #5
  %335 = fneg contract float %334
  %.not683684.i = icmp slt i16 %.sroa.0203.0.copyload.i, 0
  %336 = select contract i1 %.not683684.i, float %335, float %334
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %329, %322
  %337 = phi float [ %326, %322 ], [ %336, %329 ]
  %338 = fmul contract float %292, %337
  %339 = fadd contract float %264, %338
  %340 = or disjoint i64 %113, 3
  %341 = add nuw nsw i64 %340, %87
  %342 = trunc i64 %341 to i32
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %342
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %343, align 2, !tbaa.struct !23
  %344 = shl nuw nsw i64 %340, 4
  %345 = or disjoint i64 %344, %84
  %346 = trunc i64 %345 to i32
  %347 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %346
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %347, align 2, !tbaa.struct !23
  %348 = zext i16 %.sroa.0194.0.copyload.i to i32
  %349 = lshr i32 %348, 10
  %350 = and i32 %349, 31
  %351 = and i32 %348, 1023
  switch i32 %350, label %357 [
    i32 31, label %352
    i32 0, label %359
  ]

352:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %353 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %351, 0
  %354 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %355 = or disjoint i32 %354, %353
  %356 = bitcast i32 %355 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

357:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %358 = or disjoint i32 %351, 1024
  br label %359

359:                                              ; preds = %357, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %360 = phi i32 [ %358, %357 ], [ %351, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %361 = uitofp i32 %360 to float
  %.not685.i = icmp eq i32 %350, 0
  %362 = add nsw i32 %350, -25
  %363 = select i1 %.not685.i, i32 -24, i32 %362
  %364 = call float @__ocml_ldexp_f32(float noundef %361, i32 noundef %363) #5
  %365 = fneg contract float %364
  %.not686687.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %366 = select contract i1 %.not686687.i, float %365, float %364
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %359, %352
  %367 = phi float [ %356, %352 ], [ %366, %359 ]
  %368 = zext i16 %.sroa.0185.0.copyload.i to i32
  %369 = lshr i32 %368, 10
  %370 = and i32 %369, 31
  %371 = and i32 %368, 1023
  switch i32 %370, label %377 [
    i32 31, label %372
    i32 0, label %379
  ]

372:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %373 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %371, 0
  %374 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %375 = or disjoint i32 %374, %373
  %376 = bitcast i32 %375 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

377:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %378 = or disjoint i32 %371, 1024
  br label %379

379:                                              ; preds = %377, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %380 = phi i32 [ %378, %377 ], [ %371, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %381 = uitofp i32 %380 to float
  %.not688.i = icmp eq i32 %370, 0
  %382 = add nsw i32 %370, -25
  %383 = select i1 %.not688.i, i32 -24, i32 %382
  %384 = call float @__ocml_ldexp_f32(float noundef %381, i32 noundef %383) #5
  %385 = fneg contract float %384
  %.not689690.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %386 = select contract i1 %.not689690.i, float %385, float %384
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %379, %372
  %387 = phi float [ %376, %372 ], [ %386, %379 ]
  %388 = fmul contract float %367, %387
  %389 = fadd contract float %314, %388
  %390 = or disjoint i64 %344, %86
  %391 = trunc i64 %390 to i32
  %392 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %391
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %392, align 2, !tbaa.struct !23
  %393 = zext i16 %.sroa.0176.0.copyload.i to i32
  %394 = lshr i32 %393, 10
  %395 = and i32 %394, 31
  %396 = and i32 %393, 1023
  switch i32 %395, label %402 [
    i32 31, label %397
    i32 0, label %404
  ]

397:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %398 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %396, 0
  %399 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %400 = or disjoint i32 %399, %398
  %401 = bitcast i32 %400 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

402:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %403 = or disjoint i32 %396, 1024
  br label %404

404:                                              ; preds = %402, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %405 = phi i32 [ %403, %402 ], [ %396, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %406 = uitofp i32 %405 to float
  %.not691.i = icmp eq i32 %395, 0
  %407 = add nsw i32 %395, -25
  %408 = select i1 %.not691.i, i32 -24, i32 %407
  %409 = call float @__ocml_ldexp_f32(float noundef %406, i32 noundef %408) #5
  %410 = fneg contract float %409
  %.not692693.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %411 = select contract i1 %.not692693.i, float %410, float %409
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %404, %397
  %412 = phi float [ %401, %397 ], [ %411, %404 ]
  %413 = fmul contract float %367, %412
  %414 = fadd contract float %339, %413
  %415 = add nuw nsw i64 %113, 4
  %416 = icmp ult i64 %113, 28
  br i1 %416, label %112, label %._crit_edge722.i, !llvm.loop !35

417:                                              ; preds = %._crit_edge722.i
  %418 = shl nuw i32 %.tr.i, 7
  %419 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %420 = icmp eq i64 %419, 0
  call void @llvm.assume(i1 %420)
  %421 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %422 = icmp eq i64 %421, 0
  call void @llvm.assume(i1 %422)
  %423 = sext i32 %3 to i64
  %424 = call i32 @llvm.amdgcn.groupstaticsize()
  %425 = inttoptr i32 %424 to ptr addrspace(3)
  %426 = sext i32 %418 to i64
  %427 = icmp sgt i32 %4, 0
  %428 = icmp ugt i32 %4, 1
  %429 = icmp ugt i32 %4, 2
  %430 = icmp ugt i32 %4, 3
  %431 = icmp ugt i32 %4, 4
  %432 = icmp ugt i32 %4, 5
  %433 = icmp ugt i32 %4, 6
  %434 = icmp ugt i32 %4, 7
  %435 = icmp ugt i32 %4, 8
  %436 = icmp ugt i32 %4, 9
  %437 = icmp ugt i32 %4, 10
  %438 = icmp ugt i32 %4, 11
  %439 = icmp ugt i32 %4, 12
  %440 = icmp ugt i32 %4, 13
  %441 = icmp ugt i32 %4, 14
  %442 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %417
  %443 = phi i64 [ 0, %417 ], [ %449, %.split.us.i ]
  %444 = icmp slt i64 %443, %423
  %445 = shl i64 %443, 4
  %.tr658.i = trunc i64 %443 to i32
  %446 = shl i32 %.tr658.i, 4
  %447 = sext i32 %446 to i64
  %448 = add nsw i64 %447, %426
  %.fr.i = freeze i1 %444
  %brmerge.not.i = select i1 %.fr.i, i1 %427, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %538, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %449 = add nuw nsw i64 %443, 1
  %exitcond.not.i = icmp eq i64 %449, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %450 = trunc i64 %445 to i32
  %451 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %450
  %452 = load float, ptr addrspace(3) %451, align 4, !tbaa !33
  %453 = getelementptr inbounds float, ptr %9, i64 %448
  store float %452, ptr %453, align 32, !tbaa !33
  br i1 %428, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %454 = trunc i64 %445 to i32
  %455 = or disjoint i32 %454, 1
  %456 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !33
  %458 = or disjoint i64 %448, 1
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 4, !tbaa !33
  br i1 %429, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %460 = trunc i64 %445 to i32
  %461 = or disjoint i32 %460, 2
  %462 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !33
  %464 = or disjoint i64 %448, 2
  %465 = getelementptr inbounds float, ptr %9, i64 %464
  store float %463, ptr %465, align 8, !tbaa !33
  br i1 %430, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %466 = trunc i64 %445 to i32
  %467 = or disjoint i32 %466, 3
  %468 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !33
  %470 = or disjoint i64 %448, 3
  %471 = getelementptr inbounds float, ptr %9, i64 %470
  store float %469, ptr %471, align 4, !tbaa !33
  br i1 %431, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %472 = trunc i64 %445 to i32
  %473 = or disjoint i32 %472, 4
  %474 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !33
  %476 = or disjoint i64 %448, 4
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 16, !tbaa !33
  br i1 %432, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %478 = trunc i64 %445 to i32
  %479 = or disjoint i32 %478, 5
  %480 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !33
  %482 = or disjoint i64 %448, 5
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 4, !tbaa !33
  br i1 %433, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %484 = trunc i64 %445 to i32
  %485 = or disjoint i32 %484, 6
  %486 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !33
  %488 = or disjoint i64 %448, 6
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 8, !tbaa !33
  br i1 %434, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %490 = trunc i64 %445 to i32
  %491 = or disjoint i32 %490, 7
  %492 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !33
  %494 = or disjoint i64 %448, 7
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 4, !tbaa !33
  br i1 %435, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %496 = trunc i64 %445 to i32
  %497 = or disjoint i32 %496, 8
  %498 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !33
  %500 = or disjoint i64 %448, 8
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 32, !tbaa !33
  br i1 %436, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %502 = trunc i64 %445 to i32
  %503 = or disjoint i32 %502, 9
  %504 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !33
  %506 = or disjoint i64 %448, 9
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 4, !tbaa !33
  br i1 %437, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %508 = trunc i64 %445 to i32
  %509 = or disjoint i32 %508, 10
  %510 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !33
  %512 = or disjoint i64 %448, 10
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 8, !tbaa !33
  br i1 %438, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %514 = trunc i64 %445 to i32
  %515 = or disjoint i32 %514, 11
  %516 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !33
  %518 = or disjoint i64 %448, 11
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 4, !tbaa !33
  br i1 %439, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %520 = trunc i64 %445 to i32
  %521 = or disjoint i32 %520, 12
  %522 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !33
  %524 = or disjoint i64 %448, 12
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 16, !tbaa !33
  br i1 %440, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %526 = trunc i64 %445 to i32
  %527 = or disjoint i32 %526, 13
  %528 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !33
  %530 = or disjoint i64 %448, 13
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 4, !tbaa !33
  br i1 %441, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %532 = trunc i64 %445 to i32
  %533 = or disjoint i32 %532, 14
  %534 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %533
  %535 = load float, ptr addrspace(3) %534, align 4, !tbaa !33
  %536 = or disjoint i64 %448, 14
  %537 = getelementptr inbounds float, ptr %9, i64 %536
  store float %535, ptr %537, align 8, !tbaa !33
  br i1 %442, label %538, label %.split.us.i

538:                                              ; preds = %.preheader.split.15.i
  %539 = trunc i64 %445 to i32
  %540 = or disjoint i32 %539, 15
  %541 = getelementptr inbounds float, ptr addrspace(3) %425, i32 %540
  %542 = load float, ptr addrspace(3) %541, align 4, !tbaa !33
  %543 = or disjoint i64 %448, 15
  %544 = getelementptr inbounds float, ptr %9, i64 %543
  store float %542, ptr %544, align 4, !tbaa !33
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge722.i, %.split.us.i
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
!33 = !{!34, !34, i64 0}
!34 = !{!"float", !26, i64 0}
!35 = distinct !{!35, !29}
!36 = distinct !{!36, !29}
;----------------- End AdaptiveCpp IR dump ---------------
