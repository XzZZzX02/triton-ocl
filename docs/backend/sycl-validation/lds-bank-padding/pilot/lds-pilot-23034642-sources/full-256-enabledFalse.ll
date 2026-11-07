;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-itvyu1yg/kernel.cpp"
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
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 8388608
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 8388607
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 256
  call void @llvm.assume(i1 %35)
  %36 = shl nuw i32 %.tr.i, 9
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 63
  %44 = icmp slt i64 %43, %38
  br label %60

.lr.ph564.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i
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
  %50 = icmp ult i64 %49, 256
  call void @llvm.assume(i1 %50)
  %51 = shl i32 %.tr.i, 10
  %52 = sext i32 %5 to i64
  %53 = sext i32 %4 to i64
  %54 = sext i32 %51 to i64
  %55 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %56 = inttoptr i32 %55 to ptr addrspace(3)
  %57 = getelementptr inbounds i8, ptr addrspace(3) %56, i32 1536
  %58 = and i64 %49, 15
  %59 = icmp slt i64 %58, %53
  br label %88

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %72, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i ]
  %62 = lshr i64 %61, 6
  %63 = icmp slt i64 %62, %37
  %64 = and i1 %63, %44
  br i1 %64, label %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i

65:                                               ; preds = %60
  %66 = and i64 %61, 9223372036854775744
  %67 = or disjoint i64 %66, %39
  %68 = or disjoint i64 %67, %43
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0263.0.copyload.i = load i16, ptr %69, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i: ; preds = %65, %60
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %65 ], [ 0, %60 ]
  %70 = trunc i64 %61 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %70
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %71, align 2, !tbaa.struct !19
  %72 = add nuw nsw i64 %61, 256
  %73 = icmp ult i64 %61, 256
  br i1 %73, label %60, label %.lr.ph564.i, !llvm.loop !24

._crit_edge565.i:                                 ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %79 = icmp ult i64 %78, 256
  call void @llvm.assume(i1 %79)
  %80 = icmp ult i64 %78, 128
  br i1 %80, label %.lr.ph567.i, label %._crit_edge568.i

.lr.ph567.i:                                      ; preds = %._crit_edge565.i
  %81 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %82 = inttoptr i32 %81 to ptr addrspace(3)
  %83 = getelementptr inbounds i8, ptr addrspace(3) %82, i32 512
  %84 = getelementptr inbounds i8, ptr addrspace(3) %82, i32 1536
  %85 = and i64 %78, 15
  %86 = shl nuw nsw i64 %78, 2
  %87 = and i64 %86, 448
  br label %109

88:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph564.i
  %89 = phi i64 [ %49, %.lr.ph564.i ], [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %90 = lshr i64 %89, 4
  %91 = icmp slt i64 %90, %52
  %92 = and i1 %91, %59
  br i1 %92, label %93, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

93:                                               ; preds = %88
  %94 = and i64 %89, 9223372036854775792
  %95 = or disjoint i64 %94, %54
  %96 = or disjoint i64 %95, %58
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %96
  %.sroa.0248.0.copyload.i = load i16, ptr %97, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %93, %88
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %93 ], [ 0, %88 ]
  %98 = trunc i64 %89 to i32
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %98
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %99, align 2, !tbaa.struct !19
  %100 = add nuw nsw i64 %89, 256
  %101 = icmp ult i64 %89, 768
  br i1 %101, label %88, label %._crit_edge565.i, !llvm.loop !28

._crit_edge568.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %._crit_edge565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %104 = icmp ult i64 %103, 256
  call void @llvm.assume(i1 %104)
  %105 = icmp eq i64 %103, 0
  br i1 %105, label %313, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %106 = trunc i64 %78 to i32
  %107 = and i32 %106, 127
  %108 = getelementptr inbounds float, ptr addrspace(3) %82, i32 %107
  store float %310, ptr addrspace(3) %108, align 4, !tbaa !29
  br label %._crit_edge568.i

109:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph567.i
  %110 = phi i64 [ 0, %.lr.ph567.i ], [ %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %111 = phi float [ 0.000000e+00, %.lr.ph567.i ], [ %310, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %112 = add nuw nsw i64 %110, %87
  %113 = trunc i64 %112 to i32
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %113
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %114, align 2, !tbaa.struct !19
  %115 = shl nuw nsw i64 %110, 4
  %116 = or disjoint i64 %115, %85
  %117 = trunc i64 %116 to i32
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %117
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %118, align 2, !tbaa.struct !19
  %119 = zext i16 %.sroa.0233.0.copyload.i to i32
  %120 = lshr i32 %119, 10
  %121 = and i32 %120, 31
  %122 = and i32 %119, 1023
  switch i32 %121, label %128 [
    i32 31, label %123
    i32 0, label %130
  ]

123:                                              ; preds = %109
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %124 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %122, 0
  %125 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %126 = or disjoint i32 %125, %124
  %127 = bitcast i32 %126 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

128:                                              ; preds = %109
  %129 = or disjoint i32 %122, 1024
  br label %130

130:                                              ; preds = %128, %109
  %131 = phi i32 [ %129, %128 ], [ %122, %109 ]
  %132 = uitofp i32 %131 to float
  %.not.i = icmp eq i32 %121, 0
  %133 = add nsw i32 %121, -25
  %134 = select i1 %.not.i, i32 -24, i32 %133
  %135 = call float @__ocml_ldexp_f32(float noundef %132, i32 noundef %134) #5
  %136 = fneg contract float %135
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %137 = select contract i1 %.not522523.i, float %136, float %135
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %130, %123
  %138 = phi float [ %127, %123 ], [ %137, %130 ]
  %139 = zext i16 %.sroa.0224.0.copyload.i to i32
  %140 = lshr i32 %139, 10
  %141 = and i32 %140, 31
  %142 = and i32 %139, 1023
  switch i32 %141, label %148 [
    i32 31, label %143
    i32 0, label %150
  ]

143:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %144 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %142, 0
  %145 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %146 = or disjoint i32 %145, %144
  %147 = bitcast i32 %146 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

148:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %149 = or disjoint i32 %142, 1024
  br label %150

150:                                              ; preds = %148, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %151 = phi i32 [ %149, %148 ], [ %142, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %152 = uitofp i32 %151 to float
  %.not524.i = icmp eq i32 %141, 0
  %153 = add nsw i32 %141, -25
  %154 = select i1 %.not524.i, i32 -24, i32 %153
  %155 = call float @__ocml_ldexp_f32(float noundef %152, i32 noundef %154) #5
  %156 = fneg contract float %155
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %157 = select contract i1 %.not525526.i, float %156, float %155
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %150, %143
  %158 = phi float [ %147, %143 ], [ %157, %150 ]
  %159 = fmul contract float %138, %158
  %160 = fadd contract float %111, %159
  %161 = or disjoint i64 %110, 1
  %162 = add nuw nsw i64 %161, %87
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %163
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %164, align 2, !tbaa.struct !19
  %165 = shl nuw nsw i64 %161, 4
  %166 = or disjoint i64 %165, %85
  %167 = trunc i64 %166 to i32
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %167
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %168, align 2, !tbaa.struct !19
  %169 = zext i16 %.sroa.0215.0.copyload.i to i32
  %170 = lshr i32 %169, 10
  %171 = and i32 %170, 31
  %172 = and i32 %169, 1023
  switch i32 %171, label %178 [
    i32 31, label %173
    i32 0, label %180
  ]

173:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %174 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %172, 0
  %175 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %176 = or disjoint i32 %175, %174
  %177 = bitcast i32 %176 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

178:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %179 = or disjoint i32 %172, 1024
  br label %180

180:                                              ; preds = %178, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %181 = phi i32 [ %179, %178 ], [ %172, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %182 = uitofp i32 %181 to float
  %.not527.i = icmp eq i32 %171, 0
  %183 = add nsw i32 %171, -25
  %184 = select i1 %.not527.i, i32 -24, i32 %183
  %185 = call float @__ocml_ldexp_f32(float noundef %182, i32 noundef %184) #5
  %186 = fneg contract float %185
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %187 = select contract i1 %.not528529.i, float %186, float %185
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %180, %173
  %188 = phi float [ %177, %173 ], [ %187, %180 ]
  %189 = zext i16 %.sroa.0206.0.copyload.i to i32
  %190 = lshr i32 %189, 10
  %191 = and i32 %190, 31
  %192 = and i32 %189, 1023
  switch i32 %191, label %198 [
    i32 31, label %193
    i32 0, label %200
  ]

193:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %194 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %192, 0
  %195 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %196 = or disjoint i32 %195, %194
  %197 = bitcast i32 %196 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

198:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %199 = or disjoint i32 %192, 1024
  br label %200

200:                                              ; preds = %198, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %201 = phi i32 [ %199, %198 ], [ %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %202 = uitofp i32 %201 to float
  %.not530.i = icmp eq i32 %191, 0
  %203 = add nsw i32 %191, -25
  %204 = select i1 %.not530.i, i32 -24, i32 %203
  %205 = call float @__ocml_ldexp_f32(float noundef %202, i32 noundef %204) #5
  %206 = fneg contract float %205
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %207 = select contract i1 %.not531532.i, float %206, float %205
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %200, %193
  %208 = phi float [ %197, %193 ], [ %207, %200 ]
  %209 = fmul contract float %188, %208
  %210 = fadd contract float %160, %209
  %211 = or disjoint i64 %110, 2
  %212 = add nuw nsw i64 %211, %87
  %213 = trunc i64 %212 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %213
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %214, align 2, !tbaa.struct !19
  %215 = shl nuw nsw i64 %211, 4
  %216 = or disjoint i64 %215, %85
  %217 = trunc i64 %216 to i32
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %217
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %218, align 2, !tbaa.struct !19
  %219 = zext i16 %.sroa.0197.0.copyload.i to i32
  %220 = lshr i32 %219, 10
  %221 = and i32 %220, 31
  %222 = and i32 %219, 1023
  switch i32 %221, label %228 [
    i32 31, label %223
    i32 0, label %230
  ]

223:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %224 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %222, 0
  %225 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %226 = or disjoint i32 %225, %224
  %227 = bitcast i32 %226 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

228:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %229 = or disjoint i32 %222, 1024
  br label %230

230:                                              ; preds = %228, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %231 = phi i32 [ %229, %228 ], [ %222, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %232 = uitofp i32 %231 to float
  %.not533.i = icmp eq i32 %221, 0
  %233 = add nsw i32 %221, -25
  %234 = select i1 %.not533.i, i32 -24, i32 %233
  %235 = call float @__ocml_ldexp_f32(float noundef %232, i32 noundef %234) #5
  %236 = fneg contract float %235
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %237 = select contract i1 %.not534535.i, float %236, float %235
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %230, %223
  %238 = phi float [ %227, %223 ], [ %237, %230 ]
  %239 = zext i16 %.sroa.0188.0.copyload.i to i32
  %240 = lshr i32 %239, 10
  %241 = and i32 %240, 31
  %242 = and i32 %239, 1023
  switch i32 %241, label %248 [
    i32 31, label %243
    i32 0, label %250
  ]

243:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %244 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %242, 0
  %245 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %246 = or disjoint i32 %245, %244
  %247 = bitcast i32 %246 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

248:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %249 = or disjoint i32 %242, 1024
  br label %250

250:                                              ; preds = %248, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %251 = phi i32 [ %249, %248 ], [ %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %252 = uitofp i32 %251 to float
  %.not536.i = icmp eq i32 %241, 0
  %253 = add nsw i32 %241, -25
  %254 = select i1 %.not536.i, i32 -24, i32 %253
  %255 = call float @__ocml_ldexp_f32(float noundef %252, i32 noundef %254) #5
  %256 = fneg contract float %255
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %257 = select contract i1 %.not537538.i, float %256, float %255
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %250, %243
  %258 = phi float [ %247, %243 ], [ %257, %250 ]
  %259 = fmul contract float %238, %258
  %260 = fadd contract float %210, %259
  %261 = or disjoint i64 %110, 3
  %262 = add nuw nsw i64 %261, %87
  %263 = trunc i64 %262 to i32
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %263
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %264, align 2, !tbaa.struct !19
  %265 = shl nuw nsw i64 %261, 4
  %266 = or disjoint i64 %265, %85
  %267 = trunc i64 %266 to i32
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %267
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %268, align 2, !tbaa.struct !19
  %269 = zext i16 %.sroa.0179.0.copyload.i to i32
  %270 = lshr i32 %269, 10
  %271 = and i32 %270, 31
  %272 = and i32 %269, 1023
  switch i32 %271, label %278 [
    i32 31, label %273
    i32 0, label %280
  ]

273:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %274 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %272, 0
  %275 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %276 = or disjoint i32 %275, %274
  %277 = bitcast i32 %276 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

278:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %279 = or disjoint i32 %272, 1024
  br label %280

280:                                              ; preds = %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %281 = phi i32 [ %279, %278 ], [ %272, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %282 = uitofp i32 %281 to float
  %.not539.i = icmp eq i32 %271, 0
  %283 = add nsw i32 %271, -25
  %284 = select i1 %.not539.i, i32 -24, i32 %283
  %285 = call float @__ocml_ldexp_f32(float noundef %282, i32 noundef %284) #5
  %286 = fneg contract float %285
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %287 = select contract i1 %.not540541.i, float %286, float %285
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %280, %273
  %288 = phi float [ %277, %273 ], [ %287, %280 ]
  %289 = zext i16 %.sroa.0170.0.copyload.i to i32
  %290 = lshr i32 %289, 10
  %291 = and i32 %290, 31
  %292 = and i32 %289, 1023
  switch i32 %291, label %298 [
    i32 31, label %293
    i32 0, label %300
  ]

293:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %294 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %292, 0
  %295 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %296 = or disjoint i32 %295, %294
  %297 = bitcast i32 %296 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

298:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %299 = or disjoint i32 %292, 1024
  br label %300

300:                                              ; preds = %298, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %301 = phi i32 [ %299, %298 ], [ %292, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %302 = uitofp i32 %301 to float
  %.not542.i = icmp eq i32 %291, 0
  %303 = add nsw i32 %291, -25
  %304 = select i1 %.not542.i, i32 -24, i32 %303
  %305 = call float @__ocml_ldexp_f32(float noundef %302, i32 noundef %304) #5
  %306 = fneg contract float %305
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %307 = select contract i1 %.not543544.i, float %306, float %305
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %300, %293
  %308 = phi float [ %297, %293 ], [ %307, %300 ]
  %309 = fmul contract float %288, %308
  %310 = fadd contract float %260, %309
  %311 = add nuw nsw i64 %110, 4
  %312 = icmp ult i64 %110, 60
  br i1 %312, label %109, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !31

313:                                              ; preds = %._crit_edge568.i
  %314 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %315 = icmp eq i64 %314, 0
  call void @llvm.assume(i1 %315)
  %316 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %317 = icmp eq i64 %316, 0
  call void @llvm.assume(i1 %317)
  %318 = sext i32 %3 to i64
  %319 = call i32 @llvm.amdgcn.groupstaticsize()
  %320 = inttoptr i32 %319 to ptr addrspace(3)
  %321 = icmp sgt i32 %4, 0
  %322 = icmp ugt i32 %4, 1
  %323 = icmp ugt i32 %4, 2
  %324 = icmp ugt i32 %4, 3
  %325 = icmp ugt i32 %4, 4
  %326 = icmp ugt i32 %4, 5
  %327 = icmp ugt i32 %4, 6
  %328 = icmp ugt i32 %4, 7
  %329 = icmp ugt i32 %4, 8
  %330 = icmp ugt i32 %4, 9
  %331 = icmp ugt i32 %4, 10
  %332 = icmp ugt i32 %4, 11
  %333 = icmp ugt i32 %4, 12
  %334 = icmp ugt i32 %4, 13
  %335 = icmp ugt i32 %4, 14
  %336 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %313
  %337 = phi i64 [ 0, %313 ], [ %343, %.split.us.i ]
  %338 = icmp slt i64 %337, %318
  %339 = shl i64 %337, 4
  %.tr521.i = trunc i64 %337 to i32
  %340 = shl i32 %.tr521.i, 4
  %341 = sext i32 %340 to i64
  %342 = add nsw i64 %102, %341
  %.fr.i = freeze i1 %338
  %brmerge.not.i = select i1 %.fr.i, i1 %321, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %432, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %343 = add nuw nsw i64 %337, 1
  %exitcond.not.i = icmp eq i64 %343, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %344 = trunc i64 %339 to i32
  %345 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %344
  %346 = load float, ptr addrspace(3) %345, align 4, !tbaa !29
  %347 = getelementptr inbounds float, ptr %9, i64 %342
  store float %346, ptr %347, align 32, !tbaa !29
  br i1 %322, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %348 = trunc i64 %339 to i32
  %349 = or disjoint i32 %348, 1
  %350 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %349
  %351 = load float, ptr addrspace(3) %350, align 4, !tbaa !29
  %352 = or disjoint i64 %342, 1
  %353 = getelementptr inbounds float, ptr %9, i64 %352
  store float %351, ptr %353, align 4, !tbaa !29
  br i1 %323, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %354 = trunc i64 %339 to i32
  %355 = or disjoint i32 %354, 2
  %356 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %355
  %357 = load float, ptr addrspace(3) %356, align 4, !tbaa !29
  %358 = or disjoint i64 %342, 2
  %359 = getelementptr inbounds float, ptr %9, i64 %358
  store float %357, ptr %359, align 8, !tbaa !29
  br i1 %324, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %360 = trunc i64 %339 to i32
  %361 = or disjoint i32 %360, 3
  %362 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %361
  %363 = load float, ptr addrspace(3) %362, align 4, !tbaa !29
  %364 = or disjoint i64 %342, 3
  %365 = getelementptr inbounds float, ptr %9, i64 %364
  store float %363, ptr %365, align 4, !tbaa !29
  br i1 %325, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %366 = trunc i64 %339 to i32
  %367 = or disjoint i32 %366, 4
  %368 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %367
  %369 = load float, ptr addrspace(3) %368, align 4, !tbaa !29
  %370 = or disjoint i64 %342, 4
  %371 = getelementptr inbounds float, ptr %9, i64 %370
  store float %369, ptr %371, align 16, !tbaa !29
  br i1 %326, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %372 = trunc i64 %339 to i32
  %373 = or disjoint i32 %372, 5
  %374 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %373
  %375 = load float, ptr addrspace(3) %374, align 4, !tbaa !29
  %376 = or disjoint i64 %342, 5
  %377 = getelementptr inbounds float, ptr %9, i64 %376
  store float %375, ptr %377, align 4, !tbaa !29
  br i1 %327, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %378 = trunc i64 %339 to i32
  %379 = or disjoint i32 %378, 6
  %380 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %379
  %381 = load float, ptr addrspace(3) %380, align 4, !tbaa !29
  %382 = or disjoint i64 %342, 6
  %383 = getelementptr inbounds float, ptr %9, i64 %382
  store float %381, ptr %383, align 8, !tbaa !29
  br i1 %328, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %384 = trunc i64 %339 to i32
  %385 = or disjoint i32 %384, 7
  %386 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %385
  %387 = load float, ptr addrspace(3) %386, align 4, !tbaa !29
  %388 = or disjoint i64 %342, 7
  %389 = getelementptr inbounds float, ptr %9, i64 %388
  store float %387, ptr %389, align 4, !tbaa !29
  br i1 %329, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %390 = trunc i64 %339 to i32
  %391 = or disjoint i32 %390, 8
  %392 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %391
  %393 = load float, ptr addrspace(3) %392, align 4, !tbaa !29
  %394 = or disjoint i64 %342, 8
  %395 = getelementptr inbounds float, ptr %9, i64 %394
  store float %393, ptr %395, align 32, !tbaa !29
  br i1 %330, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %396 = trunc i64 %339 to i32
  %397 = or disjoint i32 %396, 9
  %398 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %397
  %399 = load float, ptr addrspace(3) %398, align 4, !tbaa !29
  %400 = or disjoint i64 %342, 9
  %401 = getelementptr inbounds float, ptr %9, i64 %400
  store float %399, ptr %401, align 4, !tbaa !29
  br i1 %331, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %402 = trunc i64 %339 to i32
  %403 = or disjoint i32 %402, 10
  %404 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %403
  %405 = load float, ptr addrspace(3) %404, align 4, !tbaa !29
  %406 = or disjoint i64 %342, 10
  %407 = getelementptr inbounds float, ptr %9, i64 %406
  store float %405, ptr %407, align 8, !tbaa !29
  br i1 %332, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %408 = trunc i64 %339 to i32
  %409 = or disjoint i32 %408, 11
  %410 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %409
  %411 = load float, ptr addrspace(3) %410, align 4, !tbaa !29
  %412 = or disjoint i64 %342, 11
  %413 = getelementptr inbounds float, ptr %9, i64 %412
  store float %411, ptr %413, align 4, !tbaa !29
  br i1 %333, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %414 = trunc i64 %339 to i32
  %415 = or disjoint i32 %414, 12
  %416 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %415
  %417 = load float, ptr addrspace(3) %416, align 4, !tbaa !29
  %418 = or disjoint i64 %342, 12
  %419 = getelementptr inbounds float, ptr %9, i64 %418
  store float %417, ptr %419, align 16, !tbaa !29
  br i1 %334, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %420 = trunc i64 %339 to i32
  %421 = or disjoint i32 %420, 13
  %422 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %421
  %423 = load float, ptr addrspace(3) %422, align 4, !tbaa !29
  %424 = or disjoint i64 %342, 13
  %425 = getelementptr inbounds float, ptr %9, i64 %424
  store float %423, ptr %425, align 4, !tbaa !29
  br i1 %335, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %426 = trunc i64 %339 to i32
  %427 = or disjoint i32 %426, 14
  %428 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %427
  %429 = load float, ptr addrspace(3) %428, align 4, !tbaa !29
  %430 = or disjoint i64 %342, 14
  %431 = getelementptr inbounds float, ptr %9, i64 %430
  store float %429, ptr %431, align 8, !tbaa !29
  br i1 %336, label %432, label %.split.us.i

432:                                              ; preds = %.preheader.split.15.i
  %433 = trunc i64 %339 to i32
  %434 = or disjoint i32 %433, 15
  %435 = getelementptr inbounds float, ptr addrspace(3) %320, i32 %434
  %436 = load float, ptr addrspace(3) %435, align 4, !tbaa !29
  %437 = or disjoint i64 %342, 15
  %438 = getelementptr inbounds float, ptr %9, i64 %437
  store float %436, ptr %438, align 4, !tbaa !29
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
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="256,256" }
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
;----------------- End AdaptiveCpp IR dump ---------------
