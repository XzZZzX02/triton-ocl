;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-iom2w3fe/kernel.cpp"
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
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 1568
  %57 = and i64 %48, 15
  %58 = icmp slt i64 %57, %52
  br label %86

59:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i, %6
  %60 = phi i64 [ %34, %6 ], [ %73, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i ]
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
  %69 = mul nuw nsw i64 %61, 66
  %70 = add nuw nsw i64 %69, %34
  %71 = trunc i64 %70 to i32
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %71
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %72, align 2, !tbaa.struct !19
  %73 = add nuw nsw i64 %60, 64
  %74 = icmp ult i64 %60, 448
  br i1 %74, label %59, label %.lr.ph564.i, !llvm.loop !24

.lr.ph567.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %76 = icmp eq i64 %75, 0
  call void @llvm.assume(i1 %76)
  %77 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %78 = icmp eq i64 %77, 0
  call void @llvm.assume(i1 %78)
  %79 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %80 = icmp ult i64 %79, 64
  call void @llvm.assume(i1 %80)
  %81 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %82 = inttoptr i32 %81 to ptr addrspace(3)
  %83 = getelementptr inbounds i8, ptr addrspace(3) %82, i32 512
  %84 = getelementptr inbounds i8, ptr addrspace(3) %82, i32 1568
  %85 = and i64 %79, 15
  br label %103

86:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph564.i
  %87 = phi i64 [ %48, %.lr.ph564.i ], [ %98, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %88 = lshr i64 %87, 4
  %89 = icmp slt i64 %88, %51
  %90 = and i1 %89, %58
  br i1 %90, label %91, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

91:                                               ; preds = %86
  %92 = and i64 %87, 9223372036854775792
  %93 = or disjoint i64 %92, %53
  %94 = or disjoint i64 %93, %57
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %94
  %.sroa.0248.0.copyload.i = load i16, ptr %95, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %91, %86
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %91 ], [ 0, %86 ]
  %96 = trunc i64 %87 to i32
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %96
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %97, align 2, !tbaa.struct !19
  %98 = add nuw nsw i64 %87, 64
  %99 = icmp ult i64 %87, 960
  br i1 %99, label %86, label %.lr.ph567.i, !llvm.loop !28

._crit_edge568.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %100 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %101 = icmp ult i64 %100, 64
  call void @llvm.assume(i1 %101)
  %102 = icmp eq i64 %100, 0
  br i1 %102, label %316, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

103:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph567.i
  %104 = phi i64 [ %79, %.lr.ph567.i ], [ %110, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %105 = lshr i64 %104, 4
  %106 = mul nuw nsw i64 %105, 66
  br label %112

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %107 = trunc i64 %104 to i32
  %108 = and i32 %107, 127
  %109 = getelementptr inbounds float, ptr addrspace(3) %82, i32 %108
  store float %313, ptr addrspace(3) %109, align 4, !tbaa !29
  %110 = add nuw nsw i64 %104, 64
  %111 = icmp ult i64 %104, 64
  br i1 %111, label %103, label %._crit_edge568.i, !llvm.loop !31

112:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %103
  %113 = phi i64 [ 0, %103 ], [ %314, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %114 = phi float [ 0.000000e+00, %103 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %115 = add nuw nsw i64 %113, %106
  %116 = trunc i64 %115 to i32
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %116
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %117, align 2, !tbaa.struct !19
  %118 = shl nuw nsw i64 %113, 4
  %119 = or disjoint i64 %118, %85
  %120 = trunc i64 %119 to i32
  %121 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %120
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %121, align 2, !tbaa.struct !19
  %122 = zext i16 %.sroa.0233.0.copyload.i to i32
  %123 = lshr i32 %122, 10
  %124 = and i32 %123, 31
  %125 = and i32 %122, 1023
  switch i32 %124, label %131 [
    i32 31, label %126
    i32 0, label %133
  ]

126:                                              ; preds = %112
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %127 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %125, 0
  %128 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %129 = or disjoint i32 %128, %127
  %130 = bitcast i32 %129 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

131:                                              ; preds = %112
  %132 = or disjoint i32 %125, 1024
  br label %133

133:                                              ; preds = %131, %112
  %134 = phi i32 [ %132, %131 ], [ %125, %112 ]
  %135 = uitofp i32 %134 to float
  %.not.i = icmp eq i32 %124, 0
  %136 = add nsw i32 %124, -25
  %137 = select i1 %.not.i, i32 -24, i32 %136
  %138 = call float @__ocml_ldexp_f32(float noundef %135, i32 noundef %137) #5
  %139 = fneg contract float %138
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %140 = select contract i1 %.not522523.i, float %139, float %138
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %133, %126
  %141 = phi float [ %130, %126 ], [ %140, %133 ]
  %142 = zext i16 %.sroa.0224.0.copyload.i to i32
  %143 = lshr i32 %142, 10
  %144 = and i32 %143, 31
  %145 = and i32 %142, 1023
  switch i32 %144, label %151 [
    i32 31, label %146
    i32 0, label %153
  ]

146:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %147 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %145, 0
  %148 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %149 = or disjoint i32 %148, %147
  %150 = bitcast i32 %149 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

151:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %152 = or disjoint i32 %145, 1024
  br label %153

153:                                              ; preds = %151, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %154 = phi i32 [ %152, %151 ], [ %145, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %155 = uitofp i32 %154 to float
  %.not524.i = icmp eq i32 %144, 0
  %156 = add nsw i32 %144, -25
  %157 = select i1 %.not524.i, i32 -24, i32 %156
  %158 = call float @__ocml_ldexp_f32(float noundef %155, i32 noundef %157) #5
  %159 = fneg contract float %158
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %160 = select contract i1 %.not525526.i, float %159, float %158
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %153, %146
  %161 = phi float [ %150, %146 ], [ %160, %153 ]
  %162 = fmul contract float %141, %161
  %163 = fadd contract float %114, %162
  %164 = or disjoint i64 %113, 1
  %165 = add nuw nsw i64 %164, %106
  %166 = trunc i64 %165 to i32
  %167 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %166
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %167, align 2, !tbaa.struct !19
  %168 = shl nuw nsw i64 %164, 4
  %169 = or disjoint i64 %168, %85
  %170 = trunc i64 %169 to i32
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %170
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %171, align 2, !tbaa.struct !19
  %172 = zext i16 %.sroa.0215.0.copyload.i to i32
  %173 = lshr i32 %172, 10
  %174 = and i32 %173, 31
  %175 = and i32 %172, 1023
  switch i32 %174, label %181 [
    i32 31, label %176
    i32 0, label %183
  ]

176:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %177 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %175, 0
  %178 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %179 = or disjoint i32 %178, %177
  %180 = bitcast i32 %179 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

181:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %182 = or disjoint i32 %175, 1024
  br label %183

183:                                              ; preds = %181, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %184 = phi i32 [ %182, %181 ], [ %175, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %185 = uitofp i32 %184 to float
  %.not527.i = icmp eq i32 %174, 0
  %186 = add nsw i32 %174, -25
  %187 = select i1 %.not527.i, i32 -24, i32 %186
  %188 = call float @__ocml_ldexp_f32(float noundef %185, i32 noundef %187) #5
  %189 = fneg contract float %188
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %190 = select contract i1 %.not528529.i, float %189, float %188
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %183, %176
  %191 = phi float [ %180, %176 ], [ %190, %183 ]
  %192 = zext i16 %.sroa.0206.0.copyload.i to i32
  %193 = lshr i32 %192, 10
  %194 = and i32 %193, 31
  %195 = and i32 %192, 1023
  switch i32 %194, label %201 [
    i32 31, label %196
    i32 0, label %203
  ]

196:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %197 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %195, 0
  %198 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %199 = or disjoint i32 %198, %197
  %200 = bitcast i32 %199 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

201:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %202 = or disjoint i32 %195, 1024
  br label %203

203:                                              ; preds = %201, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %204 = phi i32 [ %202, %201 ], [ %195, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %205 = uitofp i32 %204 to float
  %.not530.i = icmp eq i32 %194, 0
  %206 = add nsw i32 %194, -25
  %207 = select i1 %.not530.i, i32 -24, i32 %206
  %208 = call float @__ocml_ldexp_f32(float noundef %205, i32 noundef %207) #5
  %209 = fneg contract float %208
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %210 = select contract i1 %.not531532.i, float %209, float %208
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %203, %196
  %211 = phi float [ %200, %196 ], [ %210, %203 ]
  %212 = fmul contract float %191, %211
  %213 = fadd contract float %163, %212
  %214 = or disjoint i64 %113, 2
  %215 = add nuw nsw i64 %214, %106
  %216 = trunc i64 %215 to i32
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %216
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %217, align 2, !tbaa.struct !19
  %218 = shl nuw nsw i64 %214, 4
  %219 = or disjoint i64 %218, %85
  %220 = trunc i64 %219 to i32
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %220
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %221, align 2, !tbaa.struct !19
  %222 = zext i16 %.sroa.0197.0.copyload.i to i32
  %223 = lshr i32 %222, 10
  %224 = and i32 %223, 31
  %225 = and i32 %222, 1023
  switch i32 %224, label %231 [
    i32 31, label %226
    i32 0, label %233
  ]

226:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %227 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %225, 0
  %228 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %229 = or disjoint i32 %228, %227
  %230 = bitcast i32 %229 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

231:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %232 = or disjoint i32 %225, 1024
  br label %233

233:                                              ; preds = %231, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %234 = phi i32 [ %232, %231 ], [ %225, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %235 = uitofp i32 %234 to float
  %.not533.i = icmp eq i32 %224, 0
  %236 = add nsw i32 %224, -25
  %237 = select i1 %.not533.i, i32 -24, i32 %236
  %238 = call float @__ocml_ldexp_f32(float noundef %235, i32 noundef %237) #5
  %239 = fneg contract float %238
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %240 = select contract i1 %.not534535.i, float %239, float %238
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %233, %226
  %241 = phi float [ %230, %226 ], [ %240, %233 ]
  %242 = zext i16 %.sroa.0188.0.copyload.i to i32
  %243 = lshr i32 %242, 10
  %244 = and i32 %243, 31
  %245 = and i32 %242, 1023
  switch i32 %244, label %251 [
    i32 31, label %246
    i32 0, label %253
  ]

246:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %247 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %245, 0
  %248 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %249 = or disjoint i32 %248, %247
  %250 = bitcast i32 %249 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

251:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %252 = or disjoint i32 %245, 1024
  br label %253

253:                                              ; preds = %251, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %254 = phi i32 [ %252, %251 ], [ %245, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %255 = uitofp i32 %254 to float
  %.not536.i = icmp eq i32 %244, 0
  %256 = add nsw i32 %244, -25
  %257 = select i1 %.not536.i, i32 -24, i32 %256
  %258 = call float @__ocml_ldexp_f32(float noundef %255, i32 noundef %257) #5
  %259 = fneg contract float %258
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %260 = select contract i1 %.not537538.i, float %259, float %258
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %253, %246
  %261 = phi float [ %250, %246 ], [ %260, %253 ]
  %262 = fmul contract float %241, %261
  %263 = fadd contract float %213, %262
  %264 = or disjoint i64 %113, 3
  %265 = add nuw nsw i64 %264, %106
  %266 = trunc i64 %265 to i32
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %266
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %267, align 2, !tbaa.struct !19
  %268 = shl nuw nsw i64 %264, 4
  %269 = or disjoint i64 %268, %85
  %270 = trunc i64 %269 to i32
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %270
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %271, align 2, !tbaa.struct !19
  %272 = zext i16 %.sroa.0179.0.copyload.i to i32
  %273 = lshr i32 %272, 10
  %274 = and i32 %273, 31
  %275 = and i32 %272, 1023
  switch i32 %274, label %281 [
    i32 31, label %276
    i32 0, label %283
  ]

276:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %277 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %275, 0
  %278 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %279 = or disjoint i32 %278, %277
  %280 = bitcast i32 %279 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

281:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %282 = or disjoint i32 %275, 1024
  br label %283

283:                                              ; preds = %281, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %284 = phi i32 [ %282, %281 ], [ %275, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %285 = uitofp i32 %284 to float
  %.not539.i = icmp eq i32 %274, 0
  %286 = add nsw i32 %274, -25
  %287 = select i1 %.not539.i, i32 -24, i32 %286
  %288 = call float @__ocml_ldexp_f32(float noundef %285, i32 noundef %287) #5
  %289 = fneg contract float %288
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %290 = select contract i1 %.not540541.i, float %289, float %288
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %283, %276
  %291 = phi float [ %280, %276 ], [ %290, %283 ]
  %292 = zext i16 %.sroa.0170.0.copyload.i to i32
  %293 = lshr i32 %292, 10
  %294 = and i32 %293, 31
  %295 = and i32 %292, 1023
  switch i32 %294, label %301 [
    i32 31, label %296
    i32 0, label %303
  ]

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %297 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %295, 0
  %298 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %299 = or disjoint i32 %298, %297
  %300 = bitcast i32 %299 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

301:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %302 = or disjoint i32 %295, 1024
  br label %303

303:                                              ; preds = %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %304 = phi i32 [ %302, %301 ], [ %295, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %305 = uitofp i32 %304 to float
  %.not542.i = icmp eq i32 %294, 0
  %306 = add nsw i32 %294, -25
  %307 = select i1 %.not542.i, i32 -24, i32 %306
  %308 = call float @__ocml_ldexp_f32(float noundef %305, i32 noundef %307) #5
  %309 = fneg contract float %308
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %310 = select contract i1 %.not543544.i, float %309, float %308
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %303, %296
  %311 = phi float [ %300, %296 ], [ %310, %303 ]
  %312 = fmul contract float %291, %311
  %313 = fadd contract float %263, %312
  %314 = add nuw nsw i64 %113, 4
  %315 = icmp ult i64 %113, 60
  br i1 %315, label %112, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

316:                                              ; preds = %._crit_edge568.i
  %317 = shl nuw i32 %.tr.i, 7
  %318 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %319 = icmp eq i64 %318, 0
  call void @llvm.assume(i1 %319)
  %320 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %321 = icmp eq i64 %320, 0
  call void @llvm.assume(i1 %321)
  %322 = sext i32 %3 to i64
  %323 = call i32 @llvm.amdgcn.groupstaticsize()
  %324 = inttoptr i32 %323 to ptr addrspace(3)
  %325 = sext i32 %317 to i64
  %326 = icmp sgt i32 %4, 0
  %327 = icmp ugt i32 %4, 1
  %328 = icmp ugt i32 %4, 2
  %329 = icmp ugt i32 %4, 3
  %330 = icmp ugt i32 %4, 4
  %331 = icmp ugt i32 %4, 5
  %332 = icmp ugt i32 %4, 6
  %333 = icmp ugt i32 %4, 7
  %334 = icmp ugt i32 %4, 8
  %335 = icmp ugt i32 %4, 9
  %336 = icmp ugt i32 %4, 10
  %337 = icmp ugt i32 %4, 11
  %338 = icmp ugt i32 %4, 12
  %339 = icmp ugt i32 %4, 13
  %340 = icmp ugt i32 %4, 14
  %341 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %316
  %342 = phi i64 [ 0, %316 ], [ %348, %.split.us.i ]
  %343 = icmp slt i64 %342, %322
  %344 = shl i64 %342, 4
  %.tr521.i = trunc i64 %342 to i32
  %345 = shl i32 %.tr521.i, 4
  %346 = sext i32 %345 to i64
  %347 = add nsw i64 %346, %325
  %.fr.i = freeze i1 %343
  %brmerge.not.i = select i1 %.fr.i, i1 %326, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %437, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %348 = add nuw nsw i64 %342, 1
  %exitcond.not.i = icmp eq i64 %348, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %349 = trunc i64 %344 to i32
  %350 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %349
  %351 = load float, ptr addrspace(3) %350, align 4, !tbaa !29
  %352 = getelementptr inbounds float, ptr %9, i64 %347
  store float %351, ptr %352, align 32, !tbaa !29
  br i1 %327, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %353 = trunc i64 %344 to i32
  %354 = or disjoint i32 %353, 1
  %355 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %354
  %356 = load float, ptr addrspace(3) %355, align 4, !tbaa !29
  %357 = or disjoint i64 %347, 1
  %358 = getelementptr inbounds float, ptr %9, i64 %357
  store float %356, ptr %358, align 4, !tbaa !29
  br i1 %328, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %359 = trunc i64 %344 to i32
  %360 = or disjoint i32 %359, 2
  %361 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %360
  %362 = load float, ptr addrspace(3) %361, align 4, !tbaa !29
  %363 = or disjoint i64 %347, 2
  %364 = getelementptr inbounds float, ptr %9, i64 %363
  store float %362, ptr %364, align 8, !tbaa !29
  br i1 %329, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %365 = trunc i64 %344 to i32
  %366 = or disjoint i32 %365, 3
  %367 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %366
  %368 = load float, ptr addrspace(3) %367, align 4, !tbaa !29
  %369 = or disjoint i64 %347, 3
  %370 = getelementptr inbounds float, ptr %9, i64 %369
  store float %368, ptr %370, align 4, !tbaa !29
  br i1 %330, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %371 = trunc i64 %344 to i32
  %372 = or disjoint i32 %371, 4
  %373 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %372
  %374 = load float, ptr addrspace(3) %373, align 4, !tbaa !29
  %375 = or disjoint i64 %347, 4
  %376 = getelementptr inbounds float, ptr %9, i64 %375
  store float %374, ptr %376, align 16, !tbaa !29
  br i1 %331, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %377 = trunc i64 %344 to i32
  %378 = or disjoint i32 %377, 5
  %379 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !29
  %381 = or disjoint i64 %347, 5
  %382 = getelementptr inbounds float, ptr %9, i64 %381
  store float %380, ptr %382, align 4, !tbaa !29
  br i1 %332, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %383 = trunc i64 %344 to i32
  %384 = or disjoint i32 %383, 6
  %385 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !29
  %387 = or disjoint i64 %347, 6
  %388 = getelementptr inbounds float, ptr %9, i64 %387
  store float %386, ptr %388, align 8, !tbaa !29
  br i1 %333, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %389 = trunc i64 %344 to i32
  %390 = or disjoint i32 %389, 7
  %391 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !29
  %393 = or disjoint i64 %347, 7
  %394 = getelementptr inbounds float, ptr %9, i64 %393
  store float %392, ptr %394, align 4, !tbaa !29
  br i1 %334, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %395 = trunc i64 %344 to i32
  %396 = or disjoint i32 %395, 8
  %397 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %396
  %398 = load float, ptr addrspace(3) %397, align 4, !tbaa !29
  %399 = or disjoint i64 %347, 8
  %400 = getelementptr inbounds float, ptr %9, i64 %399
  store float %398, ptr %400, align 32, !tbaa !29
  br i1 %335, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %401 = trunc i64 %344 to i32
  %402 = or disjoint i32 %401, 9
  %403 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %402
  %404 = load float, ptr addrspace(3) %403, align 4, !tbaa !29
  %405 = or disjoint i64 %347, 9
  %406 = getelementptr inbounds float, ptr %9, i64 %405
  store float %404, ptr %406, align 4, !tbaa !29
  br i1 %336, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %407 = trunc i64 %344 to i32
  %408 = or disjoint i32 %407, 10
  %409 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %408
  %410 = load float, ptr addrspace(3) %409, align 4, !tbaa !29
  %411 = or disjoint i64 %347, 10
  %412 = getelementptr inbounds float, ptr %9, i64 %411
  store float %410, ptr %412, align 8, !tbaa !29
  br i1 %337, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %413 = trunc i64 %344 to i32
  %414 = or disjoint i32 %413, 11
  %415 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %414
  %416 = load float, ptr addrspace(3) %415, align 4, !tbaa !29
  %417 = or disjoint i64 %347, 11
  %418 = getelementptr inbounds float, ptr %9, i64 %417
  store float %416, ptr %418, align 4, !tbaa !29
  br i1 %338, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %419 = trunc i64 %344 to i32
  %420 = or disjoint i32 %419, 12
  %421 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %420
  %422 = load float, ptr addrspace(3) %421, align 4, !tbaa !29
  %423 = or disjoint i64 %347, 12
  %424 = getelementptr inbounds float, ptr %9, i64 %423
  store float %422, ptr %424, align 16, !tbaa !29
  br i1 %339, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %425 = trunc i64 %344 to i32
  %426 = or disjoint i32 %425, 13
  %427 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !29
  %429 = or disjoint i64 %347, 13
  %430 = getelementptr inbounds float, ptr %9, i64 %429
  store float %428, ptr %430, align 4, !tbaa !29
  br i1 %340, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %431 = trunc i64 %344 to i32
  %432 = or disjoint i32 %431, 14
  %433 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %432
  %434 = load float, ptr addrspace(3) %433, align 4, !tbaa !29
  %435 = or disjoint i64 %347, 14
  %436 = getelementptr inbounds float, ptr %9, i64 %435
  store float %434, ptr %436, align 8, !tbaa !29
  br i1 %341, label %437, label %.split.us.i

437:                                              ; preds = %.preheader.split.15.i
  %438 = trunc i64 %344 to i32
  %439 = or disjoint i32 %438, 15
  %440 = getelementptr inbounds float, ptr addrspace(3) %324, i32 %439
  %441 = load float, ptr addrspace(3) %440, align 4, !tbaa !29
  %442 = or disjoint i64 %347, 15
  %443 = getelementptr inbounds float, ptr %9, i64 %442
  store float %441, ptr %443, align 4, !tbaa !29
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
