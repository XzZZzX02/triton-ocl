;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882026/tmp/triton-sycl-cache/compile-1vs79hwg/kernel.cpp"
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
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) nocapture readonly %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #4 {
  %7 = addrspacecast ptr addrspace(1) %1 to ptr
  %8 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %9 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %10 = icmp ult i64 %9, 8388607
  call void @llvm.assume(i1 %10), !noalias !14
  %11 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %12 = icmp ult i64 %11, 2147483647
  call void @llvm.assume(i1 %12), !noalias !14
  %13 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %14 = icmp ult i64 %13, 2147483647
  call void @llvm.assume(i1 %14), !noalias !14
  %15 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %16 = icmp ult i64 %15, 256
  call void @llvm.assume(i1 %16), !noalias !17
  %17 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %18 = icmp eq i64 %17, 0
  call void @llvm.assume(i1 %18), !noalias !17
  %19 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %20 = icmp eq i64 %19, 0
  call void @llvm.assume(i1 %20), !noalias !17
  %21 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %22 = icmp ult i64 %21, 8388608
  call void @llvm.assume(i1 %22), !noalias !20
  %23 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24), !noalias !20
  %25 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %26 = icmp ult i64 %25, 2147483648
  call void @llvm.assume(i1 %26), !noalias !20
  %27 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %28 = icmp ult i64 %27, 8388607
  call void @llvm.assume(i1 %28)
  %29 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %30 = icmp eq i64 %29, 0
  call void @llvm.assume(i1 %30)
  %31 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %34 = icmp ult i64 %33, 256
  call void @llvm.assume(i1 %34)
  %35 = sext i32 %3 to i64
  %36 = sext i32 %5 to i64
  %37 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %38 = inttoptr i32 %37 to ptr addrspace(3)
  %39 = getelementptr inbounds i8, ptr addrspace(3) %38, i32 512
  %40 = and i64 %33, 31
  %41 = lshr i64 %33, 5
  %42 = icmp slt i64 %41, %35
  %43 = icmp slt i64 %40, %36
  %44 = and i1 %42, %43
  br i1 %44, label %62, label %.lr.ph564.i

.lr.ph564.i:                                      ; preds = %62, %6
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %62 ], [ 0, %6 ]
  %45 = trunc i64 %33 to i32
  %46 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %39, i32 %45
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %46, align 2, !tbaa.struct !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %50 = icmp eq i64 %49, 0
  call void @llvm.assume(i1 %50)
  %51 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %52 = icmp ult i64 %51, 256
  call void @llvm.assume(i1 %52)
  %.tr519.i = trunc i64 %27 to i32
  %53 = shl nuw i32 %.tr519.i, 9
  %54 = sext i32 %5 to i64
  %55 = sext i32 %4 to i64
  %56 = sext i32 %53 to i64
  %57 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %58 = inttoptr i32 %57 to ptr addrspace(3)
  %59 = getelementptr inbounds i8, ptr addrspace(3) %58, i32 1024
  %60 = and i64 %51, 15
  %61 = icmp slt i64 %60, %55
  br label %83

62:                                               ; preds = %6
  %63 = shl nuw nsw i64 %27, 8
  %64 = addrspacecast ptr addrspace(1) %0 to ptr
  %65 = and i64 %33, 224
  %66 = or disjoint i64 %65, %63
  %67 = or disjoint i64 %66, %40
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %64, i64 %67
  %.sroa.0263.0.copyload.i = load i16, ptr %68, align 2, !tbaa.struct !23
  br label %.lr.ph564.i

._crit_edge565.i:                                 ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i
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
  %74 = icmp ult i64 %73, 256
  call void @llvm.assume(i1 %74)
  %75 = icmp ult i64 %73, 128
  br i1 %75, label %.lr.ph567.i, label %._crit_edge568.i

.lr.ph567.i:                                      ; preds = %._crit_edge565.i
  %76 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %77 = inttoptr i32 %76 to ptr addrspace(3)
  %78 = getelementptr inbounds i8, ptr addrspace(3) %77, i32 512
  %79 = getelementptr inbounds i8, ptr addrspace(3) %77, i32 1024
  %80 = and i64 %73, 15
  %81 = shl nuw nsw i64 %73, 1
  %82 = and i64 %81, 224
  br label %104

83:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i, %.lr.ph564.i
  %84 = phi i64 [ %51, %.lr.ph564.i ], [ %95, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i ]
  %85 = lshr i64 %84, 4
  %86 = icmp slt i64 %85, %54
  %87 = and i1 %86, %61
  br i1 %87, label %88, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

88:                                               ; preds = %83
  %89 = and i64 %84, 9223372036854775792
  %90 = or disjoint i64 %89, %56
  %91 = or disjoint i64 %90, %60
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %91
  %.sroa.0248.0.copyload.i = load i16, ptr %92, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i: ; preds = %88, %83
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %88 ], [ 0, %83 ]
  %93 = trunc i64 %84 to i32
  %94 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %93
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %94, align 2, !tbaa.struct !23
  %95 = add nuw nsw i64 %84, 256
  %96 = icmp ult i64 %84, 256
  br i1 %96, label %83, label %._crit_edge565.i, !llvm.loop !28

._crit_edge568.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = shl nuw nsw i64 %27, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %99 = icmp ult i64 %98, 256
  call void @llvm.assume(i1 %99)
  %100 = icmp eq i64 %98, 0
  br i1 %100, label %308, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %101 = trunc i64 %73 to i32
  %102 = and i32 %101, 127
  %103 = getelementptr inbounds float, ptr addrspace(3) %77, i32 %102
  store float %305, ptr addrspace(3) %103, align 4, !tbaa !32
  br label %._crit_edge568.i

104:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph567.i
  %105 = phi i64 [ 0, %.lr.ph567.i ], [ %306, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %106 = phi float [ 0.000000e+00, %.lr.ph567.i ], [ %305, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %107 = add nuw nsw i64 %105, %82
  %108 = trunc i64 %107 to i32
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %78, i32 %108
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %109, align 2, !tbaa.struct !23
  %110 = shl nuw nsw i64 %105, 4
  %111 = or disjoint i64 %110, %80
  %112 = trunc i64 %111 to i32
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %79, i32 %112
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %113, align 2, !tbaa.struct !23
  %114 = zext i16 %.sroa.0233.0.copyload.i to i32
  %115 = lshr i32 %114, 10
  %116 = and i32 %115, 31
  %117 = and i32 %114, 1023
  switch i32 %116, label %123 [
    i32 31, label %118
    i32 0, label %125
  ]

118:                                              ; preds = %104
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %119 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %117, 0
  %120 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %121 = or disjoint i32 %120, %119
  %122 = bitcast i32 %121 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

123:                                              ; preds = %104
  %124 = or disjoint i32 %117, 1024
  br label %125

125:                                              ; preds = %123, %104
  %126 = phi i32 [ %124, %123 ], [ %117, %104 ]
  %127 = uitofp i32 %126 to float
  %.not.i = icmp eq i32 %116, 0
  %128 = add nsw i32 %116, -25
  %129 = select i1 %.not.i, i32 -24, i32 %128
  %130 = call float @__ocml_ldexp_f32(float noundef %127, i32 noundef %129) #5
  %131 = fneg contract float %130
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %132 = select contract i1 %.not522523.i, float %131, float %130
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %125, %118
  %133 = phi float [ %122, %118 ], [ %132, %125 ]
  %134 = zext i16 %.sroa.0224.0.copyload.i to i32
  %135 = lshr i32 %134, 10
  %136 = and i32 %135, 31
  %137 = and i32 %134, 1023
  switch i32 %136, label %143 [
    i32 31, label %138
    i32 0, label %145
  ]

138:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %139 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %137, 0
  %140 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %141 = or disjoint i32 %140, %139
  %142 = bitcast i32 %141 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

143:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %144 = or disjoint i32 %137, 1024
  br label %145

145:                                              ; preds = %143, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %146 = phi i32 [ %144, %143 ], [ %137, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %147 = uitofp i32 %146 to float
  %.not524.i = icmp eq i32 %136, 0
  %148 = add nsw i32 %136, -25
  %149 = select i1 %.not524.i, i32 -24, i32 %148
  %150 = call float @__ocml_ldexp_f32(float noundef %147, i32 noundef %149) #5
  %151 = fneg contract float %150
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %152 = select contract i1 %.not525526.i, float %151, float %150
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i: ; preds = %145, %138
  %153 = phi float [ %142, %138 ], [ %152, %145 ]
  %154 = fmul contract float %133, %153
  %155 = fadd contract float %106, %154
  %156 = or disjoint i64 %105, 1
  %157 = add nuw nsw i64 %156, %82
  %158 = trunc i64 %157 to i32
  %159 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %78, i32 %158
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %159, align 2, !tbaa.struct !23
  %160 = shl nuw nsw i64 %156, 4
  %161 = or disjoint i64 %160, %80
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %79, i32 %162
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %163, align 2, !tbaa.struct !23
  %164 = zext i16 %.sroa.0215.0.copyload.i to i32
  %165 = lshr i32 %164, 10
  %166 = and i32 %165, 31
  %167 = and i32 %164, 1023
  switch i32 %166, label %173 [
    i32 31, label %168
    i32 0, label %175
  ]

168:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %169 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %167, 0
  %170 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %171 = or disjoint i32 %170, %169
  %172 = bitcast i32 %171 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

173:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %174 = or disjoint i32 %167, 1024
  br label %175

175:                                              ; preds = %173, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %176 = phi i32 [ %174, %173 ], [ %167, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i ]
  %177 = uitofp i32 %176 to float
  %.not527.i = icmp eq i32 %166, 0
  %178 = add nsw i32 %166, -25
  %179 = select i1 %.not527.i, i32 -24, i32 %178
  %180 = call float @__ocml_ldexp_f32(float noundef %177, i32 noundef %179) #5
  %181 = fneg contract float %180
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %182 = select contract i1 %.not528529.i, float %181, float %180
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %175, %168
  %183 = phi float [ %172, %168 ], [ %182, %175 ]
  %184 = zext i16 %.sroa.0206.0.copyload.i to i32
  %185 = lshr i32 %184, 10
  %186 = and i32 %185, 31
  %187 = and i32 %184, 1023
  switch i32 %186, label %193 [
    i32 31, label %188
    i32 0, label %195
  ]

188:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %189 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %187, 0
  %190 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %191 = or disjoint i32 %190, %189
  %192 = bitcast i32 %191 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

193:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %194 = or disjoint i32 %187, 1024
  br label %195

195:                                              ; preds = %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %196 = phi i32 [ %194, %193 ], [ %187, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %197 = uitofp i32 %196 to float
  %.not530.i = icmp eq i32 %186, 0
  %198 = add nsw i32 %186, -25
  %199 = select i1 %.not530.i, i32 -24, i32 %198
  %200 = call float @__ocml_ldexp_f32(float noundef %197, i32 noundef %199) #5
  %201 = fneg contract float %200
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %202 = select contract i1 %.not531532.i, float %201, float %200
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %195, %188
  %203 = phi float [ %192, %188 ], [ %202, %195 ]
  %204 = fmul contract float %183, %203
  %205 = fadd contract float %155, %204
  %206 = or disjoint i64 %105, 2
  %207 = add nuw nsw i64 %206, %82
  %208 = trunc i64 %207 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %78, i32 %208
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %209, align 2, !tbaa.struct !23
  %210 = shl nuw nsw i64 %206, 4
  %211 = or disjoint i64 %210, %80
  %212 = trunc i64 %211 to i32
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %79, i32 %212
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %213, align 2, !tbaa.struct !23
  %214 = zext i16 %.sroa.0197.0.copyload.i to i32
  %215 = lshr i32 %214, 10
  %216 = and i32 %215, 31
  %217 = and i32 %214, 1023
  switch i32 %216, label %223 [
    i32 31, label %218
    i32 0, label %225
  ]

218:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %219 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %217, 0
  %220 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %221 = or disjoint i32 %220, %219
  %222 = bitcast i32 %221 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

223:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %224 = or disjoint i32 %217, 1024
  br label %225

225:                                              ; preds = %223, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %226 = phi i32 [ %224, %223 ], [ %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %227 = uitofp i32 %226 to float
  %.not533.i = icmp eq i32 %216, 0
  %228 = add nsw i32 %216, -25
  %229 = select i1 %.not533.i, i32 -24, i32 %228
  %230 = call float @__ocml_ldexp_f32(float noundef %227, i32 noundef %229) #5
  %231 = fneg contract float %230
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %232 = select contract i1 %.not534535.i, float %231, float %230
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %225, %218
  %233 = phi float [ %222, %218 ], [ %232, %225 ]
  %234 = zext i16 %.sroa.0188.0.copyload.i to i32
  %235 = lshr i32 %234, 10
  %236 = and i32 %235, 31
  %237 = and i32 %234, 1023
  switch i32 %236, label %243 [
    i32 31, label %238
    i32 0, label %245
  ]

238:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %239 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %237, 0
  %240 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %241 = or disjoint i32 %240, %239
  %242 = bitcast i32 %241 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

243:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %244 = or disjoint i32 %237, 1024
  br label %245

245:                                              ; preds = %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %246 = phi i32 [ %244, %243 ], [ %237, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %247 = uitofp i32 %246 to float
  %.not536.i = icmp eq i32 %236, 0
  %248 = add nsw i32 %236, -25
  %249 = select i1 %.not536.i, i32 -24, i32 %248
  %250 = call float @__ocml_ldexp_f32(float noundef %247, i32 noundef %249) #5
  %251 = fneg contract float %250
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %252 = select contract i1 %.not537538.i, float %251, float %250
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %245, %238
  %253 = phi float [ %242, %238 ], [ %252, %245 ]
  %254 = fmul contract float %233, %253
  %255 = fadd contract float %205, %254
  %256 = or disjoint i64 %105, 3
  %257 = add nuw nsw i64 %256, %82
  %258 = trunc i64 %257 to i32
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %78, i32 %258
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %259, align 2, !tbaa.struct !23
  %260 = shl nuw nsw i64 %256, 4
  %261 = or disjoint i64 %260, %80
  %262 = trunc i64 %261 to i32
  %263 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %79, i32 %262
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %263, align 2, !tbaa.struct !23
  %264 = zext i16 %.sroa.0179.0.copyload.i to i32
  %265 = lshr i32 %264, 10
  %266 = and i32 %265, 31
  %267 = and i32 %264, 1023
  switch i32 %266, label %273 [
    i32 31, label %268
    i32 0, label %275
  ]

268:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %269 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %267, 0
  %270 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %271 = or disjoint i32 %270, %269
  %272 = bitcast i32 %271 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

273:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %274 = or disjoint i32 %267, 1024
  br label %275

275:                                              ; preds = %273, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %276 = phi i32 [ %274, %273 ], [ %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %277 = uitofp i32 %276 to float
  %.not539.i = icmp eq i32 %266, 0
  %278 = add nsw i32 %266, -25
  %279 = select i1 %.not539.i, i32 -24, i32 %278
  %280 = call float @__ocml_ldexp_f32(float noundef %277, i32 noundef %279) #5
  %281 = fneg contract float %280
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %282 = select contract i1 %.not540541.i, float %281, float %280
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %275, %268
  %283 = phi float [ %272, %268 ], [ %282, %275 ]
  %284 = zext i16 %.sroa.0170.0.copyload.i to i32
  %285 = lshr i32 %284, 10
  %286 = and i32 %285, 31
  %287 = and i32 %284, 1023
  switch i32 %286, label %293 [
    i32 31, label %288
    i32 0, label %295
  ]

288:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %289 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %287, 0
  %290 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %291 = or disjoint i32 %290, %289
  %292 = bitcast i32 %291 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

293:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %294 = or disjoint i32 %287, 1024
  br label %295

295:                                              ; preds = %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %296 = phi i32 [ %294, %293 ], [ %287, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %297 = uitofp i32 %296 to float
  %.not542.i = icmp eq i32 %286, 0
  %298 = add nsw i32 %286, -25
  %299 = select i1 %.not542.i, i32 -24, i32 %298
  %300 = call float @__ocml_ldexp_f32(float noundef %297, i32 noundef %299) #5
  %301 = fneg contract float %300
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %302 = select contract i1 %.not543544.i, float %301, float %300
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %295, %288
  %303 = phi float [ %292, %288 ], [ %302, %295 ]
  %304 = fmul contract float %283, %303
  %305 = fadd contract float %255, %304
  %306 = add nuw nsw i64 %105, 4
  %307 = icmp ult i64 %105, 28
  br i1 %307, label %104, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !34

308:                                              ; preds = %._crit_edge568.i
  %309 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %310 = icmp eq i64 %309, 0
  call void @llvm.assume(i1 %310)
  %311 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %312 = icmp eq i64 %311, 0
  call void @llvm.assume(i1 %312)
  %313 = sext i32 %3 to i64
  %314 = call i32 @llvm.amdgcn.groupstaticsize()
  %315 = inttoptr i32 %314 to ptr addrspace(3)
  %316 = icmp sgt i32 %4, 0
  %317 = icmp ugt i32 %4, 1
  %318 = icmp ugt i32 %4, 2
  %319 = icmp ugt i32 %4, 3
  %320 = icmp ugt i32 %4, 4
  %321 = icmp ugt i32 %4, 5
  %322 = icmp ugt i32 %4, 6
  %323 = icmp ugt i32 %4, 7
  %324 = icmp ugt i32 %4, 8
  %325 = icmp ugt i32 %4, 9
  %326 = icmp ugt i32 %4, 10
  %327 = icmp ugt i32 %4, 11
  %328 = icmp ugt i32 %4, 12
  %329 = icmp ugt i32 %4, 13
  %330 = icmp ugt i32 %4, 14
  %331 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %308
  %332 = phi i64 [ 0, %308 ], [ %338, %.split.us.i ]
  %333 = icmp slt i64 %332, %313
  %334 = shl i64 %332, 4
  %.tr521.i = trunc i64 %332 to i32
  %335 = shl i32 %.tr521.i, 4
  %336 = sext i32 %335 to i64
  %337 = add nsw i64 %97, %336
  %.fr.i = freeze i1 %333
  %brmerge.not.i = select i1 %.fr.i, i1 %316, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %427, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %338 = add nuw nsw i64 %332, 1
  %exitcond.not.i = icmp eq i64 %338, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !35

.preheader.split.1.i:                             ; preds = %.preheader.i
  %339 = trunc i64 %334 to i32
  %340 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %339
  %341 = load float, ptr addrspace(3) %340, align 4, !tbaa !32
  %342 = getelementptr inbounds float, ptr %8, i64 %337
  store float %341, ptr %342, align 32, !tbaa !32
  br i1 %317, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %343 = trunc i64 %334 to i32
  %344 = or disjoint i32 %343, 1
  %345 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %344
  %346 = load float, ptr addrspace(3) %345, align 4, !tbaa !32
  %347 = or disjoint i64 %337, 1
  %348 = getelementptr inbounds float, ptr %8, i64 %347
  store float %346, ptr %348, align 4, !tbaa !32
  br i1 %318, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %349 = trunc i64 %334 to i32
  %350 = or disjoint i32 %349, 2
  %351 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %350
  %352 = load float, ptr addrspace(3) %351, align 4, !tbaa !32
  %353 = or disjoint i64 %337, 2
  %354 = getelementptr inbounds float, ptr %8, i64 %353
  store float %352, ptr %354, align 8, !tbaa !32
  br i1 %319, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %355 = trunc i64 %334 to i32
  %356 = or disjoint i32 %355, 3
  %357 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %356
  %358 = load float, ptr addrspace(3) %357, align 4, !tbaa !32
  %359 = or disjoint i64 %337, 3
  %360 = getelementptr inbounds float, ptr %8, i64 %359
  store float %358, ptr %360, align 4, !tbaa !32
  br i1 %320, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %361 = trunc i64 %334 to i32
  %362 = or disjoint i32 %361, 4
  %363 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %362
  %364 = load float, ptr addrspace(3) %363, align 4, !tbaa !32
  %365 = or disjoint i64 %337, 4
  %366 = getelementptr inbounds float, ptr %8, i64 %365
  store float %364, ptr %366, align 16, !tbaa !32
  br i1 %321, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %367 = trunc i64 %334 to i32
  %368 = or disjoint i32 %367, 5
  %369 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %368
  %370 = load float, ptr addrspace(3) %369, align 4, !tbaa !32
  %371 = or disjoint i64 %337, 5
  %372 = getelementptr inbounds float, ptr %8, i64 %371
  store float %370, ptr %372, align 4, !tbaa !32
  br i1 %322, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %373 = trunc i64 %334 to i32
  %374 = or disjoint i32 %373, 6
  %375 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %374
  %376 = load float, ptr addrspace(3) %375, align 4, !tbaa !32
  %377 = or disjoint i64 %337, 6
  %378 = getelementptr inbounds float, ptr %8, i64 %377
  store float %376, ptr %378, align 8, !tbaa !32
  br i1 %323, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %379 = trunc i64 %334 to i32
  %380 = or disjoint i32 %379, 7
  %381 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %380
  %382 = load float, ptr addrspace(3) %381, align 4, !tbaa !32
  %383 = or disjoint i64 %337, 7
  %384 = getelementptr inbounds float, ptr %8, i64 %383
  store float %382, ptr %384, align 4, !tbaa !32
  br i1 %324, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %385 = trunc i64 %334 to i32
  %386 = or disjoint i32 %385, 8
  %387 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %386
  %388 = load float, ptr addrspace(3) %387, align 4, !tbaa !32
  %389 = or disjoint i64 %337, 8
  %390 = getelementptr inbounds float, ptr %8, i64 %389
  store float %388, ptr %390, align 32, !tbaa !32
  br i1 %325, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %391 = trunc i64 %334 to i32
  %392 = or disjoint i32 %391, 9
  %393 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %392
  %394 = load float, ptr addrspace(3) %393, align 4, !tbaa !32
  %395 = or disjoint i64 %337, 9
  %396 = getelementptr inbounds float, ptr %8, i64 %395
  store float %394, ptr %396, align 4, !tbaa !32
  br i1 %326, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %397 = trunc i64 %334 to i32
  %398 = or disjoint i32 %397, 10
  %399 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %398
  %400 = load float, ptr addrspace(3) %399, align 4, !tbaa !32
  %401 = or disjoint i64 %337, 10
  %402 = getelementptr inbounds float, ptr %8, i64 %401
  store float %400, ptr %402, align 8, !tbaa !32
  br i1 %327, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %403 = trunc i64 %334 to i32
  %404 = or disjoint i32 %403, 11
  %405 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %404
  %406 = load float, ptr addrspace(3) %405, align 4, !tbaa !32
  %407 = or disjoint i64 %337, 11
  %408 = getelementptr inbounds float, ptr %8, i64 %407
  store float %406, ptr %408, align 4, !tbaa !32
  br i1 %328, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %409 = trunc i64 %334 to i32
  %410 = or disjoint i32 %409, 12
  %411 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %410
  %412 = load float, ptr addrspace(3) %411, align 4, !tbaa !32
  %413 = or disjoint i64 %337, 12
  %414 = getelementptr inbounds float, ptr %8, i64 %413
  store float %412, ptr %414, align 16, !tbaa !32
  br i1 %329, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %415 = trunc i64 %334 to i32
  %416 = or disjoint i32 %415, 13
  %417 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %416
  %418 = load float, ptr addrspace(3) %417, align 4, !tbaa !32
  %419 = or disjoint i64 %337, 13
  %420 = getelementptr inbounds float, ptr %8, i64 %419
  store float %418, ptr %420, align 4, !tbaa !32
  br i1 %330, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %421 = trunc i64 %334 to i32
  %422 = or disjoint i32 %421, 14
  %423 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %422
  %424 = load float, ptr addrspace(3) %423, align 4, !tbaa !32
  %425 = or disjoint i64 %337, 14
  %426 = getelementptr inbounds float, ptr %8, i64 %425
  store float %424, ptr %426, align 8, !tbaa !32
  br i1 %331, label %427, label %.split.us.i

427:                                              ; preds = %.preheader.split.15.i
  %428 = trunc i64 %334 to i32
  %429 = or disjoint i32 %428, 15
  %430 = getelementptr inbounds float, ptr addrspace(3) %315, i32 %429
  %431 = load float, ptr addrspace(3) %430, align 4, !tbaa !32
  %432 = or disjoint i64 %337, 15
  %433 = getelementptr inbounds float, ptr %8, i64 %432
  store float %431, ptr %433, align 4, !tbaa !32
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge568.i, %.split.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="256,256" }
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
