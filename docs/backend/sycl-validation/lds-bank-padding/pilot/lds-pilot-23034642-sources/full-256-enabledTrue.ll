;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034642/tmp/triton-sycl-cache/compile-ugp3ctgb/kernel.cpp"
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
  %57 = getelementptr inbounds i8, ptr addrspace(3) %56, i32 1568
  %58 = and i64 %49, 15
  %59 = icmp slt i64 %58, %53
  br label %90

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %74, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i ]
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
  %70 = mul nuw nsw i64 %62, 66
  %71 = add nuw nsw i64 %70, %43
  %72 = trunc i64 %71 to i32
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !19
  %74 = add nuw nsw i64 %61, 256
  %75 = icmp ult i64 %61, 256
  br i1 %75, label %60, label %.lr.ph564.i, !llvm.loop !24

._crit_edge565.i:                                 ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %77 = icmp eq i64 %76, 0
  call void @llvm.assume(i1 %77)
  %78 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %79 = icmp eq i64 %78, 0
  call void @llvm.assume(i1 %79)
  %80 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %81 = icmp ult i64 %80, 256
  call void @llvm.assume(i1 %81)
  %82 = icmp ult i64 %80, 128
  br i1 %82, label %.lr.ph567.i, label %._crit_edge568.i

.lr.ph567.i:                                      ; preds = %._crit_edge565.i
  %83 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %84 = inttoptr i32 %83 to ptr addrspace(3)
  %85 = getelementptr inbounds i8, ptr addrspace(3) %84, i32 512
  %86 = getelementptr inbounds i8, ptr addrspace(3) %84, i32 1568
  %87 = and i64 %80, 15
  %88 = lshr i64 %80, 4
  %89 = mul nuw nsw i64 %88, 66
  br label %111

90:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph564.i
  %91 = phi i64 [ %49, %.lr.ph564.i ], [ %102, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %92 = lshr i64 %91, 4
  %93 = icmp slt i64 %92, %52
  %94 = and i1 %93, %59
  br i1 %94, label %95, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

95:                                               ; preds = %90
  %96 = and i64 %91, 9223372036854775792
  %97 = or disjoint i64 %96, %54
  %98 = or disjoint i64 %97, %58
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %98
  %.sroa.0248.0.copyload.i = load i16, ptr %99, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %95, %90
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %95 ], [ 0, %90 ]
  %100 = trunc i64 %91 to i32
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %100
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %101, align 2, !tbaa.struct !19
  %102 = add nuw nsw i64 %91, 256
  %103 = icmp ult i64 %91, 768
  br i1 %103, label %90, label %._crit_edge565.i, !llvm.loop !28

._crit_edge568.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %._crit_edge565.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %106 = icmp ult i64 %105, 256
  call void @llvm.assume(i1 %106)
  %107 = icmp eq i64 %105, 0
  br i1 %107, label %315, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %108 = trunc i64 %80 to i32
  %109 = and i32 %108, 127
  %110 = getelementptr inbounds float, ptr addrspace(3) %84, i32 %109
  store float %312, ptr addrspace(3) %110, align 4, !tbaa !29
  br label %._crit_edge568.i

111:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph567.i
  %112 = phi i64 [ 0, %.lr.ph567.i ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %113 = phi float [ 0.000000e+00, %.lr.ph567.i ], [ %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %114 = add nuw nsw i64 %112, %89
  %115 = trunc i64 %114 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %115
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %116, align 2, !tbaa.struct !19
  %117 = shl nuw nsw i64 %112, 4
  %118 = or disjoint i64 %117, %87
  %119 = trunc i64 %118 to i32
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %86, i32 %119
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %120, align 2, !tbaa.struct !19
  %121 = zext i16 %.sroa.0233.0.copyload.i to i32
  %122 = lshr i32 %121, 10
  %123 = and i32 %122, 31
  %124 = and i32 %121, 1023
  switch i32 %123, label %130 [
    i32 31, label %125
    i32 0, label %132
  ]

125:                                              ; preds = %111
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %126 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %124, 0
  %127 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %128 = or disjoint i32 %127, %126
  %129 = bitcast i32 %128 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

130:                                              ; preds = %111
  %131 = or disjoint i32 %124, 1024
  br label %132

132:                                              ; preds = %130, %111
  %133 = phi i32 [ %131, %130 ], [ %124, %111 ]
  %134 = uitofp i32 %133 to float
  %.not.i = icmp eq i32 %123, 0
  %135 = add nsw i32 %123, -25
  %136 = select i1 %.not.i, i32 -24, i32 %135
  %137 = call float @__ocml_ldexp_f32(float noundef %134, i32 noundef %136) #5
  %138 = fneg contract float %137
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %139 = select contract i1 %.not522523.i, float %138, float %137
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %132, %125
  %140 = phi float [ %129, %125 ], [ %139, %132 ]
  %141 = zext i16 %.sroa.0224.0.copyload.i to i32
  %142 = lshr i32 %141, 10
  %143 = and i32 %142, 31
  %144 = and i32 %141, 1023
  switch i32 %143, label %150 [
    i32 31, label %145
    i32 0, label %152
  ]

145:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %146 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %144, 0
  %147 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %148 = or disjoint i32 %147, %146
  %149 = bitcast i32 %148 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

150:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %151 = or disjoint i32 %144, 1024
  br label %152

152:                                              ; preds = %150, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %153 = phi i32 [ %151, %150 ], [ %144, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %154 = uitofp i32 %153 to float
  %.not524.i = icmp eq i32 %143, 0
  %155 = add nsw i32 %143, -25
  %156 = select i1 %.not524.i, i32 -24, i32 %155
  %157 = call float @__ocml_ldexp_f32(float noundef %154, i32 noundef %156) #5
  %158 = fneg contract float %157
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %159 = select contract i1 %.not525526.i, float %158, float %157
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %152, %145
  %160 = phi float [ %149, %145 ], [ %159, %152 ]
  %161 = fmul contract float %140, %160
  %162 = fadd contract float %113, %161
  %163 = or disjoint i64 %112, 1
  %164 = add nuw nsw i64 %163, %89
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %165
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %166, align 2, !tbaa.struct !19
  %167 = shl nuw nsw i64 %163, 4
  %168 = or disjoint i64 %167, %87
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %86, i32 %169
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %170, align 2, !tbaa.struct !19
  %171 = zext i16 %.sroa.0215.0.copyload.i to i32
  %172 = lshr i32 %171, 10
  %173 = and i32 %172, 31
  %174 = and i32 %171, 1023
  switch i32 %173, label %180 [
    i32 31, label %175
    i32 0, label %182
  ]

175:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %176 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %174, 0
  %177 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %178 = or disjoint i32 %177, %176
  %179 = bitcast i32 %178 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

180:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %181 = or disjoint i32 %174, 1024
  br label %182

182:                                              ; preds = %180, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %183 = phi i32 [ %181, %180 ], [ %174, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %184 = uitofp i32 %183 to float
  %.not527.i = icmp eq i32 %173, 0
  %185 = add nsw i32 %173, -25
  %186 = select i1 %.not527.i, i32 -24, i32 %185
  %187 = call float @__ocml_ldexp_f32(float noundef %184, i32 noundef %186) #5
  %188 = fneg contract float %187
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %189 = select contract i1 %.not528529.i, float %188, float %187
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %182, %175
  %190 = phi float [ %179, %175 ], [ %189, %182 ]
  %191 = zext i16 %.sroa.0206.0.copyload.i to i32
  %192 = lshr i32 %191, 10
  %193 = and i32 %192, 31
  %194 = and i32 %191, 1023
  switch i32 %193, label %200 [
    i32 31, label %195
    i32 0, label %202
  ]

195:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %196 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %194, 0
  %197 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %198 = or disjoint i32 %197, %196
  %199 = bitcast i32 %198 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

200:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %201 = or disjoint i32 %194, 1024
  br label %202

202:                                              ; preds = %200, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %203 = phi i32 [ %201, %200 ], [ %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %204 = uitofp i32 %203 to float
  %.not530.i = icmp eq i32 %193, 0
  %205 = add nsw i32 %193, -25
  %206 = select i1 %.not530.i, i32 -24, i32 %205
  %207 = call float @__ocml_ldexp_f32(float noundef %204, i32 noundef %206) #5
  %208 = fneg contract float %207
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %209 = select contract i1 %.not531532.i, float %208, float %207
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %202, %195
  %210 = phi float [ %199, %195 ], [ %209, %202 ]
  %211 = fmul contract float %190, %210
  %212 = fadd contract float %162, %211
  %213 = or disjoint i64 %112, 2
  %214 = add nuw nsw i64 %213, %89
  %215 = trunc i64 %214 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %215
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %216, align 2, !tbaa.struct !19
  %217 = shl nuw nsw i64 %213, 4
  %218 = or disjoint i64 %217, %87
  %219 = trunc i64 %218 to i32
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %86, i32 %219
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %220, align 2, !tbaa.struct !19
  %221 = zext i16 %.sroa.0197.0.copyload.i to i32
  %222 = lshr i32 %221, 10
  %223 = and i32 %222, 31
  %224 = and i32 %221, 1023
  switch i32 %223, label %230 [
    i32 31, label %225
    i32 0, label %232
  ]

225:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %226 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %224, 0
  %227 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %228 = or disjoint i32 %227, %226
  %229 = bitcast i32 %228 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

230:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %231 = or disjoint i32 %224, 1024
  br label %232

232:                                              ; preds = %230, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %233 = phi i32 [ %231, %230 ], [ %224, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %234 = uitofp i32 %233 to float
  %.not533.i = icmp eq i32 %223, 0
  %235 = add nsw i32 %223, -25
  %236 = select i1 %.not533.i, i32 -24, i32 %235
  %237 = call float @__ocml_ldexp_f32(float noundef %234, i32 noundef %236) #5
  %238 = fneg contract float %237
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %239 = select contract i1 %.not534535.i, float %238, float %237
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %232, %225
  %240 = phi float [ %229, %225 ], [ %239, %232 ]
  %241 = zext i16 %.sroa.0188.0.copyload.i to i32
  %242 = lshr i32 %241, 10
  %243 = and i32 %242, 31
  %244 = and i32 %241, 1023
  switch i32 %243, label %250 [
    i32 31, label %245
    i32 0, label %252
  ]

245:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %246 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %244, 0
  %247 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %248 = or disjoint i32 %247, %246
  %249 = bitcast i32 %248 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

250:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %251 = or disjoint i32 %244, 1024
  br label %252

252:                                              ; preds = %250, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %253 = phi i32 [ %251, %250 ], [ %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %254 = uitofp i32 %253 to float
  %.not536.i = icmp eq i32 %243, 0
  %255 = add nsw i32 %243, -25
  %256 = select i1 %.not536.i, i32 -24, i32 %255
  %257 = call float @__ocml_ldexp_f32(float noundef %254, i32 noundef %256) #5
  %258 = fneg contract float %257
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %259 = select contract i1 %.not537538.i, float %258, float %257
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %252, %245
  %260 = phi float [ %249, %245 ], [ %259, %252 ]
  %261 = fmul contract float %240, %260
  %262 = fadd contract float %212, %261
  %263 = or disjoint i64 %112, 3
  %264 = add nuw nsw i64 %263, %89
  %265 = trunc i64 %264 to i32
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %265
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %266, align 2, !tbaa.struct !19
  %267 = shl nuw nsw i64 %263, 4
  %268 = or disjoint i64 %267, %87
  %269 = trunc i64 %268 to i32
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %86, i32 %269
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %270, align 2, !tbaa.struct !19
  %271 = zext i16 %.sroa.0179.0.copyload.i to i32
  %272 = lshr i32 %271, 10
  %273 = and i32 %272, 31
  %274 = and i32 %271, 1023
  switch i32 %273, label %280 [
    i32 31, label %275
    i32 0, label %282
  ]

275:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %276 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %274, 0
  %277 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %278 = or disjoint i32 %277, %276
  %279 = bitcast i32 %278 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

280:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %281 = or disjoint i32 %274, 1024
  br label %282

282:                                              ; preds = %280, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %283 = phi i32 [ %281, %280 ], [ %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %284 = uitofp i32 %283 to float
  %.not539.i = icmp eq i32 %273, 0
  %285 = add nsw i32 %273, -25
  %286 = select i1 %.not539.i, i32 -24, i32 %285
  %287 = call float @__ocml_ldexp_f32(float noundef %284, i32 noundef %286) #5
  %288 = fneg contract float %287
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %289 = select contract i1 %.not540541.i, float %288, float %287
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %282, %275
  %290 = phi float [ %279, %275 ], [ %289, %282 ]
  %291 = zext i16 %.sroa.0170.0.copyload.i to i32
  %292 = lshr i32 %291, 10
  %293 = and i32 %292, 31
  %294 = and i32 %291, 1023
  switch i32 %293, label %300 [
    i32 31, label %295
    i32 0, label %302
  ]

295:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %296 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %294, 0
  %297 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %298 = or disjoint i32 %297, %296
  %299 = bitcast i32 %298 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

300:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %301 = or disjoint i32 %294, 1024
  br label %302

302:                                              ; preds = %300, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %303 = phi i32 [ %301, %300 ], [ %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %304 = uitofp i32 %303 to float
  %.not542.i = icmp eq i32 %293, 0
  %305 = add nsw i32 %293, -25
  %306 = select i1 %.not542.i, i32 -24, i32 %305
  %307 = call float @__ocml_ldexp_f32(float noundef %304, i32 noundef %306) #5
  %308 = fneg contract float %307
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %309 = select contract i1 %.not543544.i, float %308, float %307
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %302, %295
  %310 = phi float [ %299, %295 ], [ %309, %302 ]
  %311 = fmul contract float %290, %310
  %312 = fadd contract float %262, %311
  %313 = add nuw nsw i64 %112, 4
  %314 = icmp ult i64 %112, 60
  br i1 %314, label %111, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !31

315:                                              ; preds = %._crit_edge568.i
  %316 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %317 = icmp eq i64 %316, 0
  call void @llvm.assume(i1 %317)
  %318 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %319 = icmp eq i64 %318, 0
  call void @llvm.assume(i1 %319)
  %320 = sext i32 %3 to i64
  %321 = call i32 @llvm.amdgcn.groupstaticsize()
  %322 = inttoptr i32 %321 to ptr addrspace(3)
  %323 = icmp sgt i32 %4, 0
  %324 = icmp ugt i32 %4, 1
  %325 = icmp ugt i32 %4, 2
  %326 = icmp ugt i32 %4, 3
  %327 = icmp ugt i32 %4, 4
  %328 = icmp ugt i32 %4, 5
  %329 = icmp ugt i32 %4, 6
  %330 = icmp ugt i32 %4, 7
  %331 = icmp ugt i32 %4, 8
  %332 = icmp ugt i32 %4, 9
  %333 = icmp ugt i32 %4, 10
  %334 = icmp ugt i32 %4, 11
  %335 = icmp ugt i32 %4, 12
  %336 = icmp ugt i32 %4, 13
  %337 = icmp ugt i32 %4, 14
  %338 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %315
  %339 = phi i64 [ 0, %315 ], [ %345, %.split.us.i ]
  %340 = icmp slt i64 %339, %320
  %341 = shl i64 %339, 4
  %.tr521.i = trunc i64 %339 to i32
  %342 = shl i32 %.tr521.i, 4
  %343 = sext i32 %342 to i64
  %344 = add nsw i64 %104, %343
  %.fr.i = freeze i1 %340
  %brmerge.not.i = select i1 %.fr.i, i1 %323, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %434, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %345 = add nuw nsw i64 %339, 1
  %exitcond.not.i = icmp eq i64 %345, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %346 = trunc i64 %341 to i32
  %347 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %346
  %348 = load float, ptr addrspace(3) %347, align 4, !tbaa !29
  %349 = getelementptr inbounds float, ptr %9, i64 %344
  store float %348, ptr %349, align 32, !tbaa !29
  br i1 %324, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %350 = trunc i64 %341 to i32
  %351 = or disjoint i32 %350, 1
  %352 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %351
  %353 = load float, ptr addrspace(3) %352, align 4, !tbaa !29
  %354 = or disjoint i64 %344, 1
  %355 = getelementptr inbounds float, ptr %9, i64 %354
  store float %353, ptr %355, align 4, !tbaa !29
  br i1 %325, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %356 = trunc i64 %341 to i32
  %357 = or disjoint i32 %356, 2
  %358 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %357
  %359 = load float, ptr addrspace(3) %358, align 4, !tbaa !29
  %360 = or disjoint i64 %344, 2
  %361 = getelementptr inbounds float, ptr %9, i64 %360
  store float %359, ptr %361, align 8, !tbaa !29
  br i1 %326, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %362 = trunc i64 %341 to i32
  %363 = or disjoint i32 %362, 3
  %364 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %363
  %365 = load float, ptr addrspace(3) %364, align 4, !tbaa !29
  %366 = or disjoint i64 %344, 3
  %367 = getelementptr inbounds float, ptr %9, i64 %366
  store float %365, ptr %367, align 4, !tbaa !29
  br i1 %327, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %368 = trunc i64 %341 to i32
  %369 = or disjoint i32 %368, 4
  %370 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %369
  %371 = load float, ptr addrspace(3) %370, align 4, !tbaa !29
  %372 = or disjoint i64 %344, 4
  %373 = getelementptr inbounds float, ptr %9, i64 %372
  store float %371, ptr %373, align 16, !tbaa !29
  br i1 %328, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %374 = trunc i64 %341 to i32
  %375 = or disjoint i32 %374, 5
  %376 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %375
  %377 = load float, ptr addrspace(3) %376, align 4, !tbaa !29
  %378 = or disjoint i64 %344, 5
  %379 = getelementptr inbounds float, ptr %9, i64 %378
  store float %377, ptr %379, align 4, !tbaa !29
  br i1 %329, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %380 = trunc i64 %341 to i32
  %381 = or disjoint i32 %380, 6
  %382 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %381
  %383 = load float, ptr addrspace(3) %382, align 4, !tbaa !29
  %384 = or disjoint i64 %344, 6
  %385 = getelementptr inbounds float, ptr %9, i64 %384
  store float %383, ptr %385, align 8, !tbaa !29
  br i1 %330, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %386 = trunc i64 %341 to i32
  %387 = or disjoint i32 %386, 7
  %388 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %387
  %389 = load float, ptr addrspace(3) %388, align 4, !tbaa !29
  %390 = or disjoint i64 %344, 7
  %391 = getelementptr inbounds float, ptr %9, i64 %390
  store float %389, ptr %391, align 4, !tbaa !29
  br i1 %331, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %392 = trunc i64 %341 to i32
  %393 = or disjoint i32 %392, 8
  %394 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %393
  %395 = load float, ptr addrspace(3) %394, align 4, !tbaa !29
  %396 = or disjoint i64 %344, 8
  %397 = getelementptr inbounds float, ptr %9, i64 %396
  store float %395, ptr %397, align 32, !tbaa !29
  br i1 %332, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %398 = trunc i64 %341 to i32
  %399 = or disjoint i32 %398, 9
  %400 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %399
  %401 = load float, ptr addrspace(3) %400, align 4, !tbaa !29
  %402 = or disjoint i64 %344, 9
  %403 = getelementptr inbounds float, ptr %9, i64 %402
  store float %401, ptr %403, align 4, !tbaa !29
  br i1 %333, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %404 = trunc i64 %341 to i32
  %405 = or disjoint i32 %404, 10
  %406 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %405
  %407 = load float, ptr addrspace(3) %406, align 4, !tbaa !29
  %408 = or disjoint i64 %344, 10
  %409 = getelementptr inbounds float, ptr %9, i64 %408
  store float %407, ptr %409, align 8, !tbaa !29
  br i1 %334, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %410 = trunc i64 %341 to i32
  %411 = or disjoint i32 %410, 11
  %412 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %411
  %413 = load float, ptr addrspace(3) %412, align 4, !tbaa !29
  %414 = or disjoint i64 %344, 11
  %415 = getelementptr inbounds float, ptr %9, i64 %414
  store float %413, ptr %415, align 4, !tbaa !29
  br i1 %335, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %416 = trunc i64 %341 to i32
  %417 = or disjoint i32 %416, 12
  %418 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %417
  %419 = load float, ptr addrspace(3) %418, align 4, !tbaa !29
  %420 = or disjoint i64 %344, 12
  %421 = getelementptr inbounds float, ptr %9, i64 %420
  store float %419, ptr %421, align 16, !tbaa !29
  br i1 %336, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %422 = trunc i64 %341 to i32
  %423 = or disjoint i32 %422, 13
  %424 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %423
  %425 = load float, ptr addrspace(3) %424, align 4, !tbaa !29
  %426 = or disjoint i64 %344, 13
  %427 = getelementptr inbounds float, ptr %9, i64 %426
  store float %425, ptr %427, align 4, !tbaa !29
  br i1 %337, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %428 = trunc i64 %341 to i32
  %429 = or disjoint i32 %428, 14
  %430 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %429
  %431 = load float, ptr addrspace(3) %430, align 4, !tbaa !29
  %432 = or disjoint i64 %344, 14
  %433 = getelementptr inbounds float, ptr %9, i64 %432
  store float %431, ptr %433, align 8, !tbaa !29
  br i1 %338, label %434, label %.split.us.i

434:                                              ; preds = %.preheader.split.15.i
  %435 = trunc i64 %341 to i32
  %436 = or disjoint i32 %435, 15
  %437 = getelementptr inbounds float, ptr addrspace(3) %322, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !29
  %439 = or disjoint i64 %344, 15
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 4, !tbaa !29
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
