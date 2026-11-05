;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882026/tmp/triton-sycl-cache/compile-v15m475q/kernel.cpp"
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
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #4 {
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 16777215
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 128
  call void @llvm.assume(i1 %35)
  %36 = shl nuw i32 %.tr.i, 8
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 31
  %44 = icmp slt i64 %43, %38
  br label %60

.lr.ph564.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
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
  %50 = icmp ult i64 %49, 128
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
  br label %87

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %72, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %62 = lshr i64 %61, 5
  %63 = icmp slt i64 %62, %37
  %64 = and i1 %63, %44
  br i1 %64, label %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

65:                                               ; preds = %60
  %66 = and i64 %61, 9223372036854775776
  %67 = or disjoint i64 %66, %39
  %68 = or disjoint i64 %67, %43
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0263.0.copyload.i = load i16, ptr %69, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %65, %60
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %65 ], [ 0, %60 ]
  %70 = trunc i64 %61 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %70
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  %72 = add nuw nsw i64 %61, 128
  %73 = icmp ult i64 %61, 128
  br i1 %73, label %60, label %.lr.ph564.i, !llvm.loop !28

.lr.ph567.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i
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
  %79 = icmp ult i64 %78, 128
  call void @llvm.assume(i1 %79)
  %80 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %81 = inttoptr i32 %80 to ptr addrspace(3)
  %82 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 512
  %83 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 1024
  %84 = and i64 %78, 15
  %85 = shl nuw nsw i64 %78, 1
  %86 = and i64 %85, 224
  br label %107

87:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i, %.lr.ph564.i
  %88 = phi i64 [ %49, %.lr.ph564.i ], [ %99, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i ]
  %89 = lshr i64 %88, 4
  %90 = icmp slt i64 %89, %52
  %91 = and i1 %90, %59
  br i1 %91, label %92, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

92:                                               ; preds = %87
  %93 = and i64 %88, 9223372036854775792
  %94 = or disjoint i64 %93, %54
  %95 = or disjoint i64 %94, %58
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %95
  %.sroa.0248.0.copyload.i = load i16, ptr %96, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i: ; preds = %92, %87
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %92 ], [ 0, %87 ]
  %97 = trunc i64 %88 to i32
  %98 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %97
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %98, align 2, !tbaa.struct !23
  %99 = add nuw nsw i64 %88, 128
  %100 = icmp ult i64 %88, 384
  br i1 %100, label %87, label %.lr.ph567.i, !llvm.loop !32

._crit_edge568.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %101 = trunc i64 %78 to i32
  %102 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %101
  store float %308, ptr addrspace(3) %102, align 4, !tbaa !33
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %105 = icmp ult i64 %104, 128
  call void @llvm.assume(i1 %105)
  %106 = icmp eq i64 %104, 0
  br i1 %106, label %311, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

107:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph567.i
  %108 = phi i64 [ 0, %.lr.ph567.i ], [ %309, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %109 = phi float [ 0.000000e+00, %.lr.ph567.i ], [ %308, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %110 = add nuw nsw i64 %108, %86
  %111 = trunc i64 %110 to i32
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %111
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %112, align 2, !tbaa.struct !23
  %113 = shl nuw nsw i64 %108, 4
  %114 = or disjoint i64 %113, %84
  %115 = trunc i64 %114 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %115
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = zext i16 %.sroa.0233.0.copyload.i to i32
  %118 = lshr i32 %117, 10
  %119 = and i32 %118, 31
  %120 = and i32 %117, 1023
  switch i32 %119, label %126 [
    i32 31, label %121
    i32 0, label %128
  ]

121:                                              ; preds = %107
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %122 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %120, 0
  %123 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %124 = or disjoint i32 %123, %122
  %125 = bitcast i32 %124 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

126:                                              ; preds = %107
  %127 = or disjoint i32 %120, 1024
  br label %128

128:                                              ; preds = %126, %107
  %129 = phi i32 [ %127, %126 ], [ %120, %107 ]
  %130 = uitofp i32 %129 to float
  %.not.i = icmp eq i32 %119, 0
  %131 = add nsw i32 %119, -25
  %132 = select i1 %.not.i, i32 -24, i32 %131
  %133 = call float @__ocml_ldexp_f32(float noundef %130, i32 noundef %132) #5
  %134 = fneg contract float %133
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %135 = select contract i1 %.not522523.i, float %134, float %133
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %128, %121
  %136 = phi float [ %125, %121 ], [ %135, %128 ]
  %137 = zext i16 %.sroa.0224.0.copyload.i to i32
  %138 = lshr i32 %137, 10
  %139 = and i32 %138, 31
  %140 = and i32 %137, 1023
  switch i32 %139, label %146 [
    i32 31, label %141
    i32 0, label %148
  ]

141:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %142 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %140, 0
  %143 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %144 = or disjoint i32 %143, %142
  %145 = bitcast i32 %144 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

146:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %147 = or disjoint i32 %140, 1024
  br label %148

148:                                              ; preds = %146, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %149 = phi i32 [ %147, %146 ], [ %140, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %150 = uitofp i32 %149 to float
  %.not524.i = icmp eq i32 %139, 0
  %151 = add nsw i32 %139, -25
  %152 = select i1 %.not524.i, i32 -24, i32 %151
  %153 = call float @__ocml_ldexp_f32(float noundef %150, i32 noundef %152) #5
  %154 = fneg contract float %153
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %155 = select contract i1 %.not525526.i, float %154, float %153
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i: ; preds = %148, %141
  %156 = phi float [ %145, %141 ], [ %155, %148 ]
  %157 = fmul contract float %136, %156
  %158 = fadd contract float %109, %157
  %159 = or disjoint i64 %108, 1
  %160 = add nuw nsw i64 %159, %86
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %161
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %162, align 2, !tbaa.struct !23
  %163 = shl nuw nsw i64 %159, 4
  %164 = or disjoint i64 %163, %84
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %165
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %166, align 2, !tbaa.struct !23
  %167 = zext i16 %.sroa.0215.0.copyload.i to i32
  %168 = lshr i32 %167, 10
  %169 = and i32 %168, 31
  %170 = and i32 %167, 1023
  switch i32 %169, label %176 [
    i32 31, label %171
    i32 0, label %178
  ]

171:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %172 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %170, 0
  %173 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %174 = or disjoint i32 %173, %172
  %175 = bitcast i32 %174 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

176:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %177 = or disjoint i32 %170, 1024
  br label %178

178:                                              ; preds = %176, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %179 = phi i32 [ %177, %176 ], [ %170, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i ]
  %180 = uitofp i32 %179 to float
  %.not527.i = icmp eq i32 %169, 0
  %181 = add nsw i32 %169, -25
  %182 = select i1 %.not527.i, i32 -24, i32 %181
  %183 = call float @__ocml_ldexp_f32(float noundef %180, i32 noundef %182) #5
  %184 = fneg contract float %183
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %185 = select contract i1 %.not528529.i, float %184, float %183
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %178, %171
  %186 = phi float [ %175, %171 ], [ %185, %178 ]
  %187 = zext i16 %.sroa.0206.0.copyload.i to i32
  %188 = lshr i32 %187, 10
  %189 = and i32 %188, 31
  %190 = and i32 %187, 1023
  switch i32 %189, label %196 [
    i32 31, label %191
    i32 0, label %198
  ]

191:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %192 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %190, 0
  %193 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %194 = or disjoint i32 %193, %192
  %195 = bitcast i32 %194 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

196:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %197 = or disjoint i32 %190, 1024
  br label %198

198:                                              ; preds = %196, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %199 = phi i32 [ %197, %196 ], [ %190, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %200 = uitofp i32 %199 to float
  %.not530.i = icmp eq i32 %189, 0
  %201 = add nsw i32 %189, -25
  %202 = select i1 %.not530.i, i32 -24, i32 %201
  %203 = call float @__ocml_ldexp_f32(float noundef %200, i32 noundef %202) #5
  %204 = fneg contract float %203
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %205 = select contract i1 %.not531532.i, float %204, float %203
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %198, %191
  %206 = phi float [ %195, %191 ], [ %205, %198 ]
  %207 = fmul contract float %186, %206
  %208 = fadd contract float %158, %207
  %209 = or disjoint i64 %108, 2
  %210 = add nuw nsw i64 %209, %86
  %211 = trunc i64 %210 to i32
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %211
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %212, align 2, !tbaa.struct !23
  %213 = shl nuw nsw i64 %209, 4
  %214 = or disjoint i64 %213, %84
  %215 = trunc i64 %214 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %215
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %216, align 2, !tbaa.struct !23
  %217 = zext i16 %.sroa.0197.0.copyload.i to i32
  %218 = lshr i32 %217, 10
  %219 = and i32 %218, 31
  %220 = and i32 %217, 1023
  switch i32 %219, label %226 [
    i32 31, label %221
    i32 0, label %228
  ]

221:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %222 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %220, 0
  %223 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %224 = or disjoint i32 %223, %222
  %225 = bitcast i32 %224 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

226:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %227 = or disjoint i32 %220, 1024
  br label %228

228:                                              ; preds = %226, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %229 = phi i32 [ %227, %226 ], [ %220, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %230 = uitofp i32 %229 to float
  %.not533.i = icmp eq i32 %219, 0
  %231 = add nsw i32 %219, -25
  %232 = select i1 %.not533.i, i32 -24, i32 %231
  %233 = call float @__ocml_ldexp_f32(float noundef %230, i32 noundef %232) #5
  %234 = fneg contract float %233
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %235 = select contract i1 %.not534535.i, float %234, float %233
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %228, %221
  %236 = phi float [ %225, %221 ], [ %235, %228 ]
  %237 = zext i16 %.sroa.0188.0.copyload.i to i32
  %238 = lshr i32 %237, 10
  %239 = and i32 %238, 31
  %240 = and i32 %237, 1023
  switch i32 %239, label %246 [
    i32 31, label %241
    i32 0, label %248
  ]

241:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %242 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %240, 0
  %243 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %244 = or disjoint i32 %243, %242
  %245 = bitcast i32 %244 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

246:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %247 = or disjoint i32 %240, 1024
  br label %248

248:                                              ; preds = %246, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %249 = phi i32 [ %247, %246 ], [ %240, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %250 = uitofp i32 %249 to float
  %.not536.i = icmp eq i32 %239, 0
  %251 = add nsw i32 %239, -25
  %252 = select i1 %.not536.i, i32 -24, i32 %251
  %253 = call float @__ocml_ldexp_f32(float noundef %250, i32 noundef %252) #5
  %254 = fneg contract float %253
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %255 = select contract i1 %.not537538.i, float %254, float %253
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %248, %241
  %256 = phi float [ %245, %241 ], [ %255, %248 ]
  %257 = fmul contract float %236, %256
  %258 = fadd contract float %208, %257
  %259 = or disjoint i64 %108, 3
  %260 = add nuw nsw i64 %259, %86
  %261 = trunc i64 %260 to i32
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %261
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %262, align 2, !tbaa.struct !23
  %263 = shl nuw nsw i64 %259, 4
  %264 = or disjoint i64 %263, %84
  %265 = trunc i64 %264 to i32
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %265
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %266, align 2, !tbaa.struct !23
  %267 = zext i16 %.sroa.0179.0.copyload.i to i32
  %268 = lshr i32 %267, 10
  %269 = and i32 %268, 31
  %270 = and i32 %267, 1023
  switch i32 %269, label %276 [
    i32 31, label %271
    i32 0, label %278
  ]

271:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %272 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %270, 0
  %273 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %274 = or disjoint i32 %273, %272
  %275 = bitcast i32 %274 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

276:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %277 = or disjoint i32 %270, 1024
  br label %278

278:                                              ; preds = %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %279 = phi i32 [ %277, %276 ], [ %270, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %280 = uitofp i32 %279 to float
  %.not539.i = icmp eq i32 %269, 0
  %281 = add nsw i32 %269, -25
  %282 = select i1 %.not539.i, i32 -24, i32 %281
  %283 = call float @__ocml_ldexp_f32(float noundef %280, i32 noundef %282) #5
  %284 = fneg contract float %283
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %285 = select contract i1 %.not540541.i, float %284, float %283
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %278, %271
  %286 = phi float [ %275, %271 ], [ %285, %278 ]
  %287 = zext i16 %.sroa.0170.0.copyload.i to i32
  %288 = lshr i32 %287, 10
  %289 = and i32 %288, 31
  %290 = and i32 %287, 1023
  switch i32 %289, label %296 [
    i32 31, label %291
    i32 0, label %298
  ]

291:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %292 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %290, 0
  %293 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %294 = or disjoint i32 %293, %292
  %295 = bitcast i32 %294 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %297 = or disjoint i32 %290, 1024
  br label %298

298:                                              ; preds = %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %299 = phi i32 [ %297, %296 ], [ %290, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %300 = uitofp i32 %299 to float
  %.not542.i = icmp eq i32 %289, 0
  %301 = add nsw i32 %289, -25
  %302 = select i1 %.not542.i, i32 -24, i32 %301
  %303 = call float @__ocml_ldexp_f32(float noundef %300, i32 noundef %302) #5
  %304 = fneg contract float %303
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %305 = select contract i1 %.not543544.i, float %304, float %303
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %298, %291
  %306 = phi float [ %295, %291 ], [ %305, %298 ]
  %307 = fmul contract float %286, %306
  %308 = fadd contract float %258, %307
  %309 = add nuw nsw i64 %108, 4
  %310 = icmp ult i64 %108, 28
  br i1 %310, label %107, label %._crit_edge568.i, !llvm.loop !35

311:                                              ; preds = %._crit_edge568.i
  %312 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %313 = icmp eq i64 %312, 0
  call void @llvm.assume(i1 %313)
  %314 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %315 = icmp eq i64 %314, 0
  call void @llvm.assume(i1 %315)
  %316 = sext i32 %3 to i64
  %317 = call i32 @llvm.amdgcn.groupstaticsize()
  %318 = inttoptr i32 %317 to ptr addrspace(3)
  %319 = icmp sgt i32 %4, 0
  %320 = icmp ugt i32 %4, 1
  %321 = icmp ugt i32 %4, 2
  %322 = icmp ugt i32 %4, 3
  %323 = icmp ugt i32 %4, 4
  %324 = icmp ugt i32 %4, 5
  %325 = icmp ugt i32 %4, 6
  %326 = icmp ugt i32 %4, 7
  %327 = icmp ugt i32 %4, 8
  %328 = icmp ugt i32 %4, 9
  %329 = icmp ugt i32 %4, 10
  %330 = icmp ugt i32 %4, 11
  %331 = icmp ugt i32 %4, 12
  %332 = icmp ugt i32 %4, 13
  %333 = icmp ugt i32 %4, 14
  %334 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %311
  %335 = phi i64 [ 0, %311 ], [ %341, %.split.us.i ]
  %336 = icmp slt i64 %335, %316
  %337 = shl i64 %335, 4
  %.tr521.i = trunc i64 %335 to i32
  %338 = shl i32 %.tr521.i, 4
  %339 = sext i32 %338 to i64
  %340 = add nsw i64 %103, %339
  %.fr.i = freeze i1 %336
  %brmerge.not.i = select i1 %.fr.i, i1 %319, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %430, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %341 = add nuw nsw i64 %335, 1
  %exitcond.not.i = icmp eq i64 %341, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %342 = trunc i64 %337 to i32
  %343 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %342
  %344 = load float, ptr addrspace(3) %343, align 4, !tbaa !33
  %345 = getelementptr inbounds float, ptr %9, i64 %340
  store float %344, ptr %345, align 32, !tbaa !33
  br i1 %320, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %346 = trunc i64 %337 to i32
  %347 = or disjoint i32 %346, 1
  %348 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %347
  %349 = load float, ptr addrspace(3) %348, align 4, !tbaa !33
  %350 = or disjoint i64 %340, 1
  %351 = getelementptr inbounds float, ptr %9, i64 %350
  store float %349, ptr %351, align 4, !tbaa !33
  br i1 %321, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %352 = trunc i64 %337 to i32
  %353 = or disjoint i32 %352, 2
  %354 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %353
  %355 = load float, ptr addrspace(3) %354, align 4, !tbaa !33
  %356 = or disjoint i64 %340, 2
  %357 = getelementptr inbounds float, ptr %9, i64 %356
  store float %355, ptr %357, align 8, !tbaa !33
  br i1 %322, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %358 = trunc i64 %337 to i32
  %359 = or disjoint i32 %358, 3
  %360 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %359
  %361 = load float, ptr addrspace(3) %360, align 4, !tbaa !33
  %362 = or disjoint i64 %340, 3
  %363 = getelementptr inbounds float, ptr %9, i64 %362
  store float %361, ptr %363, align 4, !tbaa !33
  br i1 %323, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %364 = trunc i64 %337 to i32
  %365 = or disjoint i32 %364, 4
  %366 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %365
  %367 = load float, ptr addrspace(3) %366, align 4, !tbaa !33
  %368 = or disjoint i64 %340, 4
  %369 = getelementptr inbounds float, ptr %9, i64 %368
  store float %367, ptr %369, align 16, !tbaa !33
  br i1 %324, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %370 = trunc i64 %337 to i32
  %371 = or disjoint i32 %370, 5
  %372 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %371
  %373 = load float, ptr addrspace(3) %372, align 4, !tbaa !33
  %374 = or disjoint i64 %340, 5
  %375 = getelementptr inbounds float, ptr %9, i64 %374
  store float %373, ptr %375, align 4, !tbaa !33
  br i1 %325, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %376 = trunc i64 %337 to i32
  %377 = or disjoint i32 %376, 6
  %378 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %377
  %379 = load float, ptr addrspace(3) %378, align 4, !tbaa !33
  %380 = or disjoint i64 %340, 6
  %381 = getelementptr inbounds float, ptr %9, i64 %380
  store float %379, ptr %381, align 8, !tbaa !33
  br i1 %326, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %382 = trunc i64 %337 to i32
  %383 = or disjoint i32 %382, 7
  %384 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %383
  %385 = load float, ptr addrspace(3) %384, align 4, !tbaa !33
  %386 = or disjoint i64 %340, 7
  %387 = getelementptr inbounds float, ptr %9, i64 %386
  store float %385, ptr %387, align 4, !tbaa !33
  br i1 %327, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %388 = trunc i64 %337 to i32
  %389 = or disjoint i32 %388, 8
  %390 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !33
  %392 = or disjoint i64 %340, 8
  %393 = getelementptr inbounds float, ptr %9, i64 %392
  store float %391, ptr %393, align 32, !tbaa !33
  br i1 %328, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %394 = trunc i64 %337 to i32
  %395 = or disjoint i32 %394, 9
  %396 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !33
  %398 = or disjoint i64 %340, 9
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 4, !tbaa !33
  br i1 %329, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %400 = trunc i64 %337 to i32
  %401 = or disjoint i32 %400, 10
  %402 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !33
  %404 = or disjoint i64 %340, 10
  %405 = getelementptr inbounds float, ptr %9, i64 %404
  store float %403, ptr %405, align 8, !tbaa !33
  br i1 %330, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %406 = trunc i64 %337 to i32
  %407 = or disjoint i32 %406, 11
  %408 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !33
  %410 = or disjoint i64 %340, 11
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 4, !tbaa !33
  br i1 %331, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %412 = trunc i64 %337 to i32
  %413 = or disjoint i32 %412, 12
  %414 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !33
  %416 = or disjoint i64 %340, 12
  %417 = getelementptr inbounds float, ptr %9, i64 %416
  store float %415, ptr %417, align 16, !tbaa !33
  br i1 %332, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %418 = trunc i64 %337 to i32
  %419 = or disjoint i32 %418, 13
  %420 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !33
  %422 = or disjoint i64 %340, 13
  %423 = getelementptr inbounds float, ptr %9, i64 %422
  store float %421, ptr %423, align 4, !tbaa !33
  br i1 %333, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %424 = trunc i64 %337 to i32
  %425 = or disjoint i32 %424, 14
  %426 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !33
  %428 = or disjoint i64 %340, 14
  %429 = getelementptr inbounds float, ptr %9, i64 %428
  store float %427, ptr %429, align 8, !tbaa !33
  br i1 %334, label %430, label %.split.us.i

430:                                              ; preds = %.preheader.split.15.i
  %431 = trunc i64 %337 to i32
  %432 = or disjoint i32 %431, 15
  %433 = getelementptr inbounds float, ptr addrspace(3) %318, i32 %432
  %434 = load float, ptr addrspace(3) %433, align 4, !tbaa !33
  %435 = or disjoint i64 %340, 15
  %436 = getelementptr inbounds float, ptr %9, i64 %435
  store float %434, ptr %436, align 4, !tbaa !33
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
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
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
!32 = distinct !{!32, !29, !30, !31}
!33 = !{!34, !34, i64 0}
!34 = !{!"float", !26, i64 0}
!35 = distinct !{!35, !29}
!36 = distinct !{!36, !29}
;----------------- End AdaptiveCpp IR dump ---------------
