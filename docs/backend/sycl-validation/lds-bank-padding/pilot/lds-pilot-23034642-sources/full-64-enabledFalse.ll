;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-d2k5_vwd/kernel.cpp"
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
  %36 = shl i32 %.tr.i, 9
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = icmp slt i64 %34, %38
  br label %59

.lr.ph564.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %45 = icmp eq i64 %44, 0
  call void @llvm.assume(i1 %45)
  %46 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %49 = icmp ult i64 %48, 64
  call void @llvm.assume(i1 %49)
  %50 = shl i32 %.tr.i, 10
  %51 = sext i32 %5 to i64
  %52 = sext i32 %4 to i64
  %53 = sext i32 %50 to i64
  %54 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %55 = inttoptr i32 %54 to ptr addrspace(3)
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 1536
  %57 = and i64 %48, 15
  %58 = icmp slt i64 %57, %52
  br label %84

59:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i, %6
  %60 = phi i64 [ %34, %6 ], [ %71, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i ]
  %61 = lshr i64 %60, 6
  %62 = icmp slt i64 %61, %37
  %63 = and i1 %62, %43
  br i1 %63, label %64, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i

64:                                               ; preds = %59
  %65 = and i64 %60, 9223372036854775744
  %66 = or disjoint i64 %65, %39
  %67 = or disjoint i64 %66, %34
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %67
  %.sroa.0263.0.copyload.i = load i16, ptr %68, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i: ; preds = %64, %59
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %64 ], [ 0, %59 ]
  %69 = trunc i64 %60 to i32
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %69
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %70, align 2, !tbaa.struct !19
  %71 = add nuw nsw i64 %60, 64
  %72 = icmp ult i64 %60, 448
  br i1 %72, label %59, label %.lr.ph564.i, !llvm.loop !24

.lr.ph567.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %74 = icmp eq i64 %73, 0
  call void @llvm.assume(i1 %74)
  %75 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %76 = icmp eq i64 %75, 0
  call void @llvm.assume(i1 %76)
  %77 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %78 = icmp ult i64 %77, 64
  call void @llvm.assume(i1 %78)
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 512
  %82 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 1536
  %83 = and i64 %77, 15
  br label %101

84:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph564.i
  %85 = phi i64 [ %48, %.lr.ph564.i ], [ %96, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %86 = lshr i64 %85, 4
  %87 = icmp slt i64 %86, %51
  %88 = and i1 %87, %58
  br i1 %88, label %89, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

89:                                               ; preds = %84
  %90 = and i64 %85, 9223372036854775792
  %91 = or disjoint i64 %90, %53
  %92 = or disjoint i64 %91, %57
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %92
  %.sroa.0248.0.copyload.i = load i16, ptr %93, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %89, %84
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %89 ], [ 0, %84 ]
  %94 = trunc i64 %85 to i32
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %94
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %95, align 2, !tbaa.struct !19
  %96 = add nuw nsw i64 %85, 64
  %97 = icmp ult i64 %85, 960
  br i1 %97, label %84, label %.lr.ph567.i, !llvm.loop !28

._crit_edge568.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %99 = icmp ult i64 %98, 64
  call void @llvm.assume(i1 %99)
  %100 = icmp eq i64 %98, 0
  br i1 %100, label %314, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

101:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph567.i
  %102 = phi i64 [ %77, %.lr.ph567.i ], [ %108, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %103 = shl nuw nsw i64 %102, 2
  %104 = and i64 %103, 448
  br label %110

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %105 = trunc i64 %102 to i32
  %106 = and i32 %105, 127
  %107 = getelementptr inbounds float, ptr addrspace(3) %80, i32 %106
  store float %311, ptr addrspace(3) %107, align 4, !tbaa !29
  %108 = add nuw nsw i64 %102, 64
  %109 = icmp ult i64 %102, 64
  br i1 %109, label %101, label %._crit_edge568.i, !llvm.loop !31

110:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %101
  %111 = phi i64 [ 0, %101 ], [ %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %112 = phi float [ 0.000000e+00, %101 ], [ %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %113 = add nuw nsw i64 %111, %104
  %114 = trunc i64 %113 to i32
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %114
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %115, align 2, !tbaa.struct !19
  %116 = shl nuw nsw i64 %111, 4
  %117 = or disjoint i64 %116, %83
  %118 = trunc i64 %117 to i32
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %118
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %119, align 2, !tbaa.struct !19
  %120 = zext i16 %.sroa.0233.0.copyload.i to i32
  %121 = lshr i32 %120, 10
  %122 = and i32 %121, 31
  %123 = and i32 %120, 1023
  switch i32 %122, label %129 [
    i32 31, label %124
    i32 0, label %131
  ]

124:                                              ; preds = %110
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %125 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %123, 0
  %126 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %127 = or disjoint i32 %126, %125
  %128 = bitcast i32 %127 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

129:                                              ; preds = %110
  %130 = or disjoint i32 %123, 1024
  br label %131

131:                                              ; preds = %129, %110
  %132 = phi i32 [ %130, %129 ], [ %123, %110 ]
  %133 = uitofp i32 %132 to float
  %.not.i = icmp eq i32 %122, 0
  %134 = add nsw i32 %122, -25
  %135 = select i1 %.not.i, i32 -24, i32 %134
  %136 = call float @__ocml_ldexp_f32(float noundef %133, i32 noundef %135) #5
  %137 = fneg contract float %136
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %138 = select contract i1 %.not522523.i, float %137, float %136
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %131, %124
  %139 = phi float [ %128, %124 ], [ %138, %131 ]
  %140 = zext i16 %.sroa.0224.0.copyload.i to i32
  %141 = lshr i32 %140, 10
  %142 = and i32 %141, 31
  %143 = and i32 %140, 1023
  switch i32 %142, label %149 [
    i32 31, label %144
    i32 0, label %151
  ]

144:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %145 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %143, 0
  %146 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %147 = or disjoint i32 %146, %145
  %148 = bitcast i32 %147 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

149:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %150 = or disjoint i32 %143, 1024
  br label %151

151:                                              ; preds = %149, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %152 = phi i32 [ %150, %149 ], [ %143, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %153 = uitofp i32 %152 to float
  %.not524.i = icmp eq i32 %142, 0
  %154 = add nsw i32 %142, -25
  %155 = select i1 %.not524.i, i32 -24, i32 %154
  %156 = call float @__ocml_ldexp_f32(float noundef %153, i32 noundef %155) #5
  %157 = fneg contract float %156
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %158 = select contract i1 %.not525526.i, float %157, float %156
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %151, %144
  %159 = phi float [ %148, %144 ], [ %158, %151 ]
  %160 = fmul contract float %139, %159
  %161 = fadd contract float %112, %160
  %162 = or disjoint i64 %111, 1
  %163 = add nuw nsw i64 %162, %104
  %164 = trunc i64 %163 to i32
  %165 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %164
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %165, align 2, !tbaa.struct !19
  %166 = shl nuw nsw i64 %162, 4
  %167 = or disjoint i64 %166, %83
  %168 = trunc i64 %167 to i32
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %168
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %169, align 2, !tbaa.struct !19
  %170 = zext i16 %.sroa.0215.0.copyload.i to i32
  %171 = lshr i32 %170, 10
  %172 = and i32 %171, 31
  %173 = and i32 %170, 1023
  switch i32 %172, label %179 [
    i32 31, label %174
    i32 0, label %181
  ]

174:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %175 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %173, 0
  %176 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %177 = or disjoint i32 %176, %175
  %178 = bitcast i32 %177 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

179:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %180 = or disjoint i32 %173, 1024
  br label %181

181:                                              ; preds = %179, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %182 = phi i32 [ %180, %179 ], [ %173, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %183 = uitofp i32 %182 to float
  %.not527.i = icmp eq i32 %172, 0
  %184 = add nsw i32 %172, -25
  %185 = select i1 %.not527.i, i32 -24, i32 %184
  %186 = call float @__ocml_ldexp_f32(float noundef %183, i32 noundef %185) #5
  %187 = fneg contract float %186
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %188 = select contract i1 %.not528529.i, float %187, float %186
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %181, %174
  %189 = phi float [ %178, %174 ], [ %188, %181 ]
  %190 = zext i16 %.sroa.0206.0.copyload.i to i32
  %191 = lshr i32 %190, 10
  %192 = and i32 %191, 31
  %193 = and i32 %190, 1023
  switch i32 %192, label %199 [
    i32 31, label %194
    i32 0, label %201
  ]

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %195 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %193, 0
  %196 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %197 = or disjoint i32 %196, %195
  %198 = bitcast i32 %197 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

199:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %200 = or disjoint i32 %193, 1024
  br label %201

201:                                              ; preds = %199, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %202 = phi i32 [ %200, %199 ], [ %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %203 = uitofp i32 %202 to float
  %.not530.i = icmp eq i32 %192, 0
  %204 = add nsw i32 %192, -25
  %205 = select i1 %.not530.i, i32 -24, i32 %204
  %206 = call float @__ocml_ldexp_f32(float noundef %203, i32 noundef %205) #5
  %207 = fneg contract float %206
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %208 = select contract i1 %.not531532.i, float %207, float %206
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %201, %194
  %209 = phi float [ %198, %194 ], [ %208, %201 ]
  %210 = fmul contract float %189, %209
  %211 = fadd contract float %161, %210
  %212 = or disjoint i64 %111, 2
  %213 = add nuw nsw i64 %212, %104
  %214 = trunc i64 %213 to i32
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %214
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %215, align 2, !tbaa.struct !19
  %216 = shl nuw nsw i64 %212, 4
  %217 = or disjoint i64 %216, %83
  %218 = trunc i64 %217 to i32
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %218
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %219, align 2, !tbaa.struct !19
  %220 = zext i16 %.sroa.0197.0.copyload.i to i32
  %221 = lshr i32 %220, 10
  %222 = and i32 %221, 31
  %223 = and i32 %220, 1023
  switch i32 %222, label %229 [
    i32 31, label %224
    i32 0, label %231
  ]

224:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %225 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %223, 0
  %226 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %227 = or disjoint i32 %226, %225
  %228 = bitcast i32 %227 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

229:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %230 = or disjoint i32 %223, 1024
  br label %231

231:                                              ; preds = %229, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %232 = phi i32 [ %230, %229 ], [ %223, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %233 = uitofp i32 %232 to float
  %.not533.i = icmp eq i32 %222, 0
  %234 = add nsw i32 %222, -25
  %235 = select i1 %.not533.i, i32 -24, i32 %234
  %236 = call float @__ocml_ldexp_f32(float noundef %233, i32 noundef %235) #5
  %237 = fneg contract float %236
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %238 = select contract i1 %.not534535.i, float %237, float %236
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %231, %224
  %239 = phi float [ %228, %224 ], [ %238, %231 ]
  %240 = zext i16 %.sroa.0188.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %245 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %243, 0
  %246 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not536.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not536.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #5
  %257 = fneg contract float %256
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %258 = select contract i1 %.not537538.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = fmul contract float %239, %259
  %261 = fadd contract float %211, %260
  %262 = or disjoint i64 %111, 3
  %263 = add nuw nsw i64 %262, %104
  %264 = trunc i64 %263 to i32
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %264
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %265, align 2, !tbaa.struct !19
  %266 = shl nuw nsw i64 %262, 4
  %267 = or disjoint i64 %266, %83
  %268 = trunc i64 %267 to i32
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %268
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %269, align 2, !tbaa.struct !19
  %270 = zext i16 %.sroa.0179.0.copyload.i to i32
  %271 = lshr i32 %270, 10
  %272 = and i32 %271, 31
  %273 = and i32 %270, 1023
  switch i32 %272, label %279 [
    i32 31, label %274
    i32 0, label %281
  ]

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %275 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %273, 0
  %276 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %277 = or disjoint i32 %276, %275
  %278 = bitcast i32 %277 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %280 = or disjoint i32 %273, 1024
  br label %281

281:                                              ; preds = %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %282 = phi i32 [ %280, %279 ], [ %273, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %283 = uitofp i32 %282 to float
  %.not539.i = icmp eq i32 %272, 0
  %284 = add nsw i32 %272, -25
  %285 = select i1 %.not539.i, i32 -24, i32 %284
  %286 = call float @__ocml_ldexp_f32(float noundef %283, i32 noundef %285) #5
  %287 = fneg contract float %286
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %288 = select contract i1 %.not540541.i, float %287, float %286
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %281, %274
  %289 = phi float [ %278, %274 ], [ %288, %281 ]
  %290 = zext i16 %.sroa.0170.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %295 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %293, 0
  %296 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not542.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not542.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #5
  %307 = fneg contract float %306
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %308 = select contract i1 %.not543544.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = fmul contract float %289, %309
  %311 = fadd contract float %261, %310
  %312 = add nuw nsw i64 %111, 4
  %313 = icmp ult i64 %111, 60
  br i1 %313, label %110, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

314:                                              ; preds = %._crit_edge568.i
  %315 = shl nuw i32 %.tr.i, 7
  %316 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %317 = icmp eq i64 %316, 0
  call void @llvm.assume(i1 %317)
  %318 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %319 = icmp eq i64 %318, 0
  call void @llvm.assume(i1 %319)
  %320 = sext i32 %3 to i64
  %321 = call i32 @llvm.amdgcn.groupstaticsize()
  %322 = inttoptr i32 %321 to ptr addrspace(3)
  %323 = sext i32 %315 to i64
  %324 = icmp sgt i32 %4, 0
  %325 = icmp ugt i32 %4, 1
  %326 = icmp ugt i32 %4, 2
  %327 = icmp ugt i32 %4, 3
  %328 = icmp ugt i32 %4, 4
  %329 = icmp ugt i32 %4, 5
  %330 = icmp ugt i32 %4, 6
  %331 = icmp ugt i32 %4, 7
  %332 = icmp ugt i32 %4, 8
  %333 = icmp ugt i32 %4, 9
  %334 = icmp ugt i32 %4, 10
  %335 = icmp ugt i32 %4, 11
  %336 = icmp ugt i32 %4, 12
  %337 = icmp ugt i32 %4, 13
  %338 = icmp ugt i32 %4, 14
  %339 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %314
  %340 = phi i64 [ 0, %314 ], [ %346, %.split.us.i ]
  %341 = icmp slt i64 %340, %320
  %342 = shl i64 %340, 4
  %.tr521.i = trunc i64 %340 to i32
  %343 = shl i32 %.tr521.i, 4
  %344 = sext i32 %343 to i64
  %345 = add nsw i64 %344, %323
  %.fr.i = freeze i1 %341
  %brmerge.not.i = select i1 %.fr.i, i1 %324, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %435, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %346 = add nuw nsw i64 %340, 1
  %exitcond.not.i = icmp eq i64 %346, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %347 = trunc i64 %342 to i32
  %348 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %347
  %349 = load float, ptr addrspace(3) %348, align 4, !tbaa !29
  %350 = getelementptr inbounds float, ptr %9, i64 %345
  store float %349, ptr %350, align 32, !tbaa !29
  br i1 %325, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %351 = trunc i64 %342 to i32
  %352 = or disjoint i32 %351, 1
  %353 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %352
  %354 = load float, ptr addrspace(3) %353, align 4, !tbaa !29
  %355 = or disjoint i64 %345, 1
  %356 = getelementptr inbounds float, ptr %9, i64 %355
  store float %354, ptr %356, align 4, !tbaa !29
  br i1 %326, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %357 = trunc i64 %342 to i32
  %358 = or disjoint i32 %357, 2
  %359 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %358
  %360 = load float, ptr addrspace(3) %359, align 4, !tbaa !29
  %361 = or disjoint i64 %345, 2
  %362 = getelementptr inbounds float, ptr %9, i64 %361
  store float %360, ptr %362, align 8, !tbaa !29
  br i1 %327, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %363 = trunc i64 %342 to i32
  %364 = or disjoint i32 %363, 3
  %365 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %364
  %366 = load float, ptr addrspace(3) %365, align 4, !tbaa !29
  %367 = or disjoint i64 %345, 3
  %368 = getelementptr inbounds float, ptr %9, i64 %367
  store float %366, ptr %368, align 4, !tbaa !29
  br i1 %328, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %369 = trunc i64 %342 to i32
  %370 = or disjoint i32 %369, 4
  %371 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %370
  %372 = load float, ptr addrspace(3) %371, align 4, !tbaa !29
  %373 = or disjoint i64 %345, 4
  %374 = getelementptr inbounds float, ptr %9, i64 %373
  store float %372, ptr %374, align 16, !tbaa !29
  br i1 %329, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %375 = trunc i64 %342 to i32
  %376 = or disjoint i32 %375, 5
  %377 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %376
  %378 = load float, ptr addrspace(3) %377, align 4, !tbaa !29
  %379 = or disjoint i64 %345, 5
  %380 = getelementptr inbounds float, ptr %9, i64 %379
  store float %378, ptr %380, align 4, !tbaa !29
  br i1 %330, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %381 = trunc i64 %342 to i32
  %382 = or disjoint i32 %381, 6
  %383 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %382
  %384 = load float, ptr addrspace(3) %383, align 4, !tbaa !29
  %385 = or disjoint i64 %345, 6
  %386 = getelementptr inbounds float, ptr %9, i64 %385
  store float %384, ptr %386, align 8, !tbaa !29
  br i1 %331, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %387 = trunc i64 %342 to i32
  %388 = or disjoint i32 %387, 7
  %389 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %388
  %390 = load float, ptr addrspace(3) %389, align 4, !tbaa !29
  %391 = or disjoint i64 %345, 7
  %392 = getelementptr inbounds float, ptr %9, i64 %391
  store float %390, ptr %392, align 4, !tbaa !29
  br i1 %332, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %393 = trunc i64 %342 to i32
  %394 = or disjoint i32 %393, 8
  %395 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %394
  %396 = load float, ptr addrspace(3) %395, align 4, !tbaa !29
  %397 = or disjoint i64 %345, 8
  %398 = getelementptr inbounds float, ptr %9, i64 %397
  store float %396, ptr %398, align 32, !tbaa !29
  br i1 %333, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %399 = trunc i64 %342 to i32
  %400 = or disjoint i32 %399, 9
  %401 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %400
  %402 = load float, ptr addrspace(3) %401, align 4, !tbaa !29
  %403 = or disjoint i64 %345, 9
  %404 = getelementptr inbounds float, ptr %9, i64 %403
  store float %402, ptr %404, align 4, !tbaa !29
  br i1 %334, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %405 = trunc i64 %342 to i32
  %406 = or disjoint i32 %405, 10
  %407 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %406
  %408 = load float, ptr addrspace(3) %407, align 4, !tbaa !29
  %409 = or disjoint i64 %345, 10
  %410 = getelementptr inbounds float, ptr %9, i64 %409
  store float %408, ptr %410, align 8, !tbaa !29
  br i1 %335, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %411 = trunc i64 %342 to i32
  %412 = or disjoint i32 %411, 11
  %413 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %412
  %414 = load float, ptr addrspace(3) %413, align 4, !tbaa !29
  %415 = or disjoint i64 %345, 11
  %416 = getelementptr inbounds float, ptr %9, i64 %415
  store float %414, ptr %416, align 4, !tbaa !29
  br i1 %336, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %417 = trunc i64 %342 to i32
  %418 = or disjoint i32 %417, 12
  %419 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %418
  %420 = load float, ptr addrspace(3) %419, align 4, !tbaa !29
  %421 = or disjoint i64 %345, 12
  %422 = getelementptr inbounds float, ptr %9, i64 %421
  store float %420, ptr %422, align 16, !tbaa !29
  br i1 %337, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %423 = trunc i64 %342 to i32
  %424 = or disjoint i32 %423, 13
  %425 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !29
  %427 = or disjoint i64 %345, 13
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 4, !tbaa !29
  br i1 %338, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %429 = trunc i64 %342 to i32
  %430 = or disjoint i32 %429, 14
  %431 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !29
  %433 = or disjoint i64 %345, 14
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 8, !tbaa !29
  br i1 %339, label %435, label %.split.us.i

435:                                              ; preds = %.preheader.split.15.i
  %436 = trunc i64 %342 to i32
  %437 = or disjoint i32 %436, 15
  %438 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %437
  %439 = load float, ptr addrspace(3) %438, align 4, !tbaa !29
  %440 = or disjoint i64 %345, 15
  %441 = getelementptr inbounds float, ptr %9, i64 %440
  store float %439, ptr %441, align 4, !tbaa !29
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge568.i, %.split.us.i
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
!29 = !{!30, !30, i64 0}
!30 = !{!"float", !22, i64 0}
!31 = distinct !{!31, !25}
!32 = distinct !{!32, !25}
!33 = distinct !{!33, !25}
;----------------- End AdaptiveCpp IR dump ---------------
