;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-3356uov2/kernel.cpp"
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
  %11 = icmp ult i64 %10, 715827882
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 3
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 715827883
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 715827882
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 3
  call void @llvm.assume(i1 %35)
  %36 = shl i32 %.tr.i, 8
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  br label %56

.lr.ph564.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %44 = icmp eq i64 %43, 0
  call void @llvm.assume(i1 %44)
  %45 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %48 = icmp ult i64 %47, 3
  call void @llvm.assume(i1 %48)
  %49 = shl i32 %.tr.i, 9
  %50 = sext i32 %5 to i64
  %51 = sext i32 %4 to i64
  %52 = sext i32 %49 to i64
  %53 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %54 = inttoptr i32 %53 to ptr addrspace(3)
  %55 = getelementptr inbounds i8, ptr addrspace(3) %54, i32 1024
  br label %82

56:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %57 = phi i64 [ %34, %6 ], [ %70, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %58 = lshr i64 %57, 5
  %59 = and i64 %57, 31
  %60 = icmp slt i64 %58, %37
  %61 = icmp slt i64 %59, %38
  %62 = and i1 %60, %61
  br i1 %62, label %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

63:                                               ; preds = %56
  %64 = and i64 %57, 9223372036854775776
  %65 = or disjoint i64 %64, %39
  %66 = or disjoint i64 %65, %59
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %66
  %.sroa.0263.0.copyload.i = load i16, ptr %67, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %63, %56
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %63 ], [ 0, %56 ]
  %68 = trunc i64 %57 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %68
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %69, align 2, !tbaa.struct !23
  %70 = add nuw nsw i64 %57, 3
  %71 = icmp ult i64 %57, 253
  br i1 %71, label %56, label %.lr.ph564.i, !llvm.loop !28

.lr.ph567.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %73 = icmp eq i64 %72, 0
  call void @llvm.assume(i1 %73)
  %74 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %75 = icmp eq i64 %74, 0
  call void @llvm.assume(i1 %75)
  %76 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %77 = icmp ult i64 %76, 3
  call void @llvm.assume(i1 %77)
  %78 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %79 = inttoptr i32 %78 to ptr addrspace(3)
  %80 = getelementptr inbounds i8, ptr addrspace(3) %79, i32 512
  %81 = getelementptr inbounds i8, ptr addrspace(3) %79, i32 1024
  br label %101

82:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i, %.lr.ph564.i
  %83 = phi i64 [ %47, %.lr.ph564.i ], [ %96, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i ]
  %84 = lshr i64 %83, 4
  %85 = and i64 %83, 15
  %86 = icmp slt i64 %84, %50
  %87 = icmp slt i64 %85, %51
  %88 = and i1 %86, %87
  br i1 %88, label %89, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

89:                                               ; preds = %82
  %90 = and i64 %83, 9223372036854775792
  %91 = or disjoint i64 %90, %52
  %92 = or disjoint i64 %91, %85
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %92
  %.sroa.0248.0.copyload.i = load i16, ptr %93, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i: ; preds = %89, %82
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %89 ], [ 0, %82 ]
  %94 = trunc i64 %83 to i32
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %55, i32 %94
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %95, align 2, !tbaa.struct !23
  %96 = add nuw nsw i64 %83, 3
  %97 = icmp ult i64 %83, 509
  br i1 %97, label %82, label %.lr.ph567.i, !llvm.loop !32

._crit_edge568.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %99 = icmp ult i64 %98, 3
  call void @llvm.assume(i1 %99)
  %100 = icmp eq i64 %98, 0
  br i1 %100, label %315, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

101:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.lr.ph567.i
  %102 = phi i64 [ %76, %.lr.ph567.i ], [ %109, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %103 = and i64 %102, 15
  %104 = shl nuw nsw i64 %102, 1
  %105 = and i64 %104, 224
  br label %111

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %106 = trunc i64 %102 to i32
  %107 = and i32 %106, 127
  %108 = getelementptr inbounds float, ptr addrspace(3) %79, i32 %107
  store float %312, ptr addrspace(3) %108, align 4, !tbaa !33
  %109 = add nuw nsw i64 %102, 3
  %110 = icmp ult i64 %102, 125
  br i1 %110, label %101, label %._crit_edge568.i, !llvm.loop !35

111:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %101
  %112 = phi i64 [ 0, %101 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %113 = phi float [ 0.000000e+00, %101 ], [ %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %114 = add nuw nsw i64 %112, %105
  %115 = trunc i64 %114 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %80, i32 %115
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = shl nuw nsw i64 %112, 4
  %118 = or disjoint i64 %117, %103
  %119 = trunc i64 %118 to i32
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %119
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %120, align 2, !tbaa.struct !23
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
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

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
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %132, %125
  %140 = phi float [ %129, %125 ], [ %139, %132 ]
  %141 = zext i16 %.sroa.0224.0.copyload.i to i32
  %142 = lshr i32 %141, 10
  %143 = and i32 %142, 31
  %144 = and i32 %141, 1023
  switch i32 %143, label %150 [
    i32 31, label %145
    i32 0, label %152
  ]

145:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %146 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %144, 0
  %147 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %148 = or disjoint i32 %147, %146
  %149 = bitcast i32 %148 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

150:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %151 = or disjoint i32 %144, 1024
  br label %152

152:                                              ; preds = %150, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %153 = phi i32 [ %151, %150 ], [ %144, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %154 = uitofp i32 %153 to float
  %.not524.i = icmp eq i32 %143, 0
  %155 = add nsw i32 %143, -25
  %156 = select i1 %.not524.i, i32 -24, i32 %155
  %157 = call float @__ocml_ldexp_f32(float noundef %154, i32 noundef %156) #5
  %158 = fneg contract float %157
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %159 = select contract i1 %.not525526.i, float %158, float %157
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i: ; preds = %152, %145
  %160 = phi float [ %149, %145 ], [ %159, %152 ]
  %161 = fmul contract float %140, %160
  %162 = fadd contract float %113, %161
  %163 = or disjoint i64 %112, 1
  %164 = add nuw nsw i64 %163, %105
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %80, i32 %165
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %166, align 2, !tbaa.struct !23
  %167 = shl nuw nsw i64 %163, 4
  %168 = or disjoint i64 %167, %103
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %169
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %170, align 2, !tbaa.struct !23
  %171 = zext i16 %.sroa.0215.0.copyload.i to i32
  %172 = lshr i32 %171, 10
  %173 = and i32 %172, 31
  %174 = and i32 %171, 1023
  switch i32 %173, label %180 [
    i32 31, label %175
    i32 0, label %182
  ]

175:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %176 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %174, 0
  %177 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %178 = or disjoint i32 %177, %176
  %179 = bitcast i32 %178 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

180:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %181 = or disjoint i32 %174, 1024
  br label %182

182:                                              ; preds = %180, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %183 = phi i32 [ %181, %180 ], [ %174, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i ]
  %184 = uitofp i32 %183 to float
  %.not527.i = icmp eq i32 %173, 0
  %185 = add nsw i32 %173, -25
  %186 = select i1 %.not527.i, i32 -24, i32 %185
  %187 = call float @__ocml_ldexp_f32(float noundef %184, i32 noundef %186) #5
  %188 = fneg contract float %187
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %189 = select contract i1 %.not528529.i, float %188, float %187
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %182, %175
  %190 = phi float [ %179, %175 ], [ %189, %182 ]
  %191 = zext i16 %.sroa.0206.0.copyload.i to i32
  %192 = lshr i32 %191, 10
  %193 = and i32 %192, 31
  %194 = and i32 %191, 1023
  switch i32 %193, label %200 [
    i32 31, label %195
    i32 0, label %202
  ]

195:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %196 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %194, 0
  %197 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %198 = or disjoint i32 %197, %196
  %199 = bitcast i32 %198 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

200:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %201 = or disjoint i32 %194, 1024
  br label %202

202:                                              ; preds = %200, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %203 = phi i32 [ %201, %200 ], [ %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %204 = uitofp i32 %203 to float
  %.not530.i = icmp eq i32 %193, 0
  %205 = add nsw i32 %193, -25
  %206 = select i1 %.not530.i, i32 -24, i32 %205
  %207 = call float @__ocml_ldexp_f32(float noundef %204, i32 noundef %206) #5
  %208 = fneg contract float %207
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %209 = select contract i1 %.not531532.i, float %208, float %207
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %202, %195
  %210 = phi float [ %199, %195 ], [ %209, %202 ]
  %211 = fmul contract float %190, %210
  %212 = fadd contract float %162, %211
  %213 = or disjoint i64 %112, 2
  %214 = add nuw nsw i64 %213, %105
  %215 = trunc i64 %214 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %80, i32 %215
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %216, align 2, !tbaa.struct !23
  %217 = shl nuw nsw i64 %213, 4
  %218 = or disjoint i64 %217, %103
  %219 = trunc i64 %218 to i32
  %220 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %219
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %220, align 2, !tbaa.struct !23
  %221 = zext i16 %.sroa.0197.0.copyload.i to i32
  %222 = lshr i32 %221, 10
  %223 = and i32 %222, 31
  %224 = and i32 %221, 1023
  switch i32 %223, label %230 [
    i32 31, label %225
    i32 0, label %232
  ]

225:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %226 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %224, 0
  %227 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %228 = or disjoint i32 %227, %226
  %229 = bitcast i32 %228 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

230:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %231 = or disjoint i32 %224, 1024
  br label %232

232:                                              ; preds = %230, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %233 = phi i32 [ %231, %230 ], [ %224, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %234 = uitofp i32 %233 to float
  %.not533.i = icmp eq i32 %223, 0
  %235 = add nsw i32 %223, -25
  %236 = select i1 %.not533.i, i32 -24, i32 %235
  %237 = call float @__ocml_ldexp_f32(float noundef %234, i32 noundef %236) #5
  %238 = fneg contract float %237
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %239 = select contract i1 %.not534535.i, float %238, float %237
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %232, %225
  %240 = phi float [ %229, %225 ], [ %239, %232 ]
  %241 = zext i16 %.sroa.0188.0.copyload.i to i32
  %242 = lshr i32 %241, 10
  %243 = and i32 %242, 31
  %244 = and i32 %241, 1023
  switch i32 %243, label %250 [
    i32 31, label %245
    i32 0, label %252
  ]

245:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %246 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %244, 0
  %247 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %248 = or disjoint i32 %247, %246
  %249 = bitcast i32 %248 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

250:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %251 = or disjoint i32 %244, 1024
  br label %252

252:                                              ; preds = %250, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %253 = phi i32 [ %251, %250 ], [ %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %254 = uitofp i32 %253 to float
  %.not536.i = icmp eq i32 %243, 0
  %255 = add nsw i32 %243, -25
  %256 = select i1 %.not536.i, i32 -24, i32 %255
  %257 = call float @__ocml_ldexp_f32(float noundef %254, i32 noundef %256) #5
  %258 = fneg contract float %257
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %259 = select contract i1 %.not537538.i, float %258, float %257
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %252, %245
  %260 = phi float [ %249, %245 ], [ %259, %252 ]
  %261 = fmul contract float %240, %260
  %262 = fadd contract float %212, %261
  %263 = or disjoint i64 %112, 3
  %264 = add nuw nsw i64 %263, %105
  %265 = trunc i64 %264 to i32
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %80, i32 %265
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %266, align 2, !tbaa.struct !23
  %267 = shl nuw nsw i64 %263, 4
  %268 = or disjoint i64 %267, %103
  %269 = trunc i64 %268 to i32
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %269
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %270, align 2, !tbaa.struct !23
  %271 = zext i16 %.sroa.0179.0.copyload.i to i32
  %272 = lshr i32 %271, 10
  %273 = and i32 %272, 31
  %274 = and i32 %271, 1023
  switch i32 %273, label %280 [
    i32 31, label %275
    i32 0, label %282
  ]

275:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %276 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %274, 0
  %277 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %278 = or disjoint i32 %277, %276
  %279 = bitcast i32 %278 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

280:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %281 = or disjoint i32 %274, 1024
  br label %282

282:                                              ; preds = %280, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %283 = phi i32 [ %281, %280 ], [ %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %284 = uitofp i32 %283 to float
  %.not539.i = icmp eq i32 %273, 0
  %285 = add nsw i32 %273, -25
  %286 = select i1 %.not539.i, i32 -24, i32 %285
  %287 = call float @__ocml_ldexp_f32(float noundef %284, i32 noundef %286) #5
  %288 = fneg contract float %287
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %289 = select contract i1 %.not540541.i, float %288, float %287
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %282, %275
  %290 = phi float [ %279, %275 ], [ %289, %282 ]
  %291 = zext i16 %.sroa.0170.0.copyload.i to i32
  %292 = lshr i32 %291, 10
  %293 = and i32 %292, 31
  %294 = and i32 %291, 1023
  switch i32 %293, label %300 [
    i32 31, label %295
    i32 0, label %302
  ]

295:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %296 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %294, 0
  %297 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %298 = or disjoint i32 %297, %296
  %299 = bitcast i32 %298 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

300:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %301 = or disjoint i32 %294, 1024
  br label %302

302:                                              ; preds = %300, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %303 = phi i32 [ %301, %300 ], [ %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %304 = uitofp i32 %303 to float
  %.not542.i = icmp eq i32 %293, 0
  %305 = add nsw i32 %293, -25
  %306 = select i1 %.not542.i, i32 -24, i32 %305
  %307 = call float @__ocml_ldexp_f32(float noundef %304, i32 noundef %306) #5
  %308 = fneg contract float %307
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %309 = select contract i1 %.not543544.i, float %308, float %307
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %302, %295
  %310 = phi float [ %299, %295 ], [ %309, %302 ]
  %311 = fmul contract float %290, %310
  %312 = fadd contract float %262, %311
  %313 = add nuw nsw i64 %112, 4
  %314 = icmp ult i64 %112, 28
  br i1 %314, label %111, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !36

315:                                              ; preds = %._crit_edge568.i
  %316 = shl i32 %.tr.i, 7
  %317 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %318 = icmp eq i64 %317, 0
  call void @llvm.assume(i1 %318)
  %319 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %320 = icmp eq i64 %319, 0
  call void @llvm.assume(i1 %320)
  %321 = sext i32 %3 to i64
  %322 = call i32 @llvm.amdgcn.groupstaticsize()
  %323 = inttoptr i32 %322 to ptr addrspace(3)
  %324 = sext i32 %316 to i64
  %325 = icmp sgt i32 %4, 0
  %326 = icmp ugt i32 %4, 1
  %327 = icmp ugt i32 %4, 2
  %328 = icmp ugt i32 %4, 3
  %329 = icmp ugt i32 %4, 4
  %330 = icmp ugt i32 %4, 5
  %331 = icmp ugt i32 %4, 6
  %332 = icmp ugt i32 %4, 7
  %333 = icmp ugt i32 %4, 8
  %334 = icmp ugt i32 %4, 9
  %335 = icmp ugt i32 %4, 10
  %336 = icmp ugt i32 %4, 11
  %337 = icmp ugt i32 %4, 12
  %338 = icmp ugt i32 %4, 13
  %339 = icmp ugt i32 %4, 14
  %340 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %315
  %341 = phi i64 [ 0, %315 ], [ %347, %.split.us.i ]
  %342 = icmp slt i64 %341, %321
  %343 = shl i64 %341, 4
  %.tr521.i = trunc i64 %341 to i32
  %344 = shl i32 %.tr521.i, 4
  %345 = sext i32 %344 to i64
  %346 = add nsw i64 %345, %324
  %.fr.i = freeze i1 %342
  %brmerge.not.i = select i1 %.fr.i, i1 %325, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %436, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %347 = add nuw nsw i64 %341, 1
  %exitcond.not.i = icmp eq i64 %347, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %348 = trunc i64 %343 to i32
  %349 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %348
  %350 = load float, ptr addrspace(3) %349, align 4, !tbaa !33
  %351 = getelementptr inbounds float, ptr %9, i64 %346
  store float %350, ptr %351, align 32, !tbaa !33
  br i1 %326, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %352 = trunc i64 %343 to i32
  %353 = or disjoint i32 %352, 1
  %354 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %353
  %355 = load float, ptr addrspace(3) %354, align 4, !tbaa !33
  %356 = or disjoint i64 %346, 1
  %357 = getelementptr inbounds float, ptr %9, i64 %356
  store float %355, ptr %357, align 4, !tbaa !33
  br i1 %327, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %358 = trunc i64 %343 to i32
  %359 = or disjoint i32 %358, 2
  %360 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %359
  %361 = load float, ptr addrspace(3) %360, align 4, !tbaa !33
  %362 = or disjoint i64 %346, 2
  %363 = getelementptr inbounds float, ptr %9, i64 %362
  store float %361, ptr %363, align 8, !tbaa !33
  br i1 %328, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %364 = trunc i64 %343 to i32
  %365 = or disjoint i32 %364, 3
  %366 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %365
  %367 = load float, ptr addrspace(3) %366, align 4, !tbaa !33
  %368 = or disjoint i64 %346, 3
  %369 = getelementptr inbounds float, ptr %9, i64 %368
  store float %367, ptr %369, align 4, !tbaa !33
  br i1 %329, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %370 = trunc i64 %343 to i32
  %371 = or disjoint i32 %370, 4
  %372 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %371
  %373 = load float, ptr addrspace(3) %372, align 4, !tbaa !33
  %374 = or disjoint i64 %346, 4
  %375 = getelementptr inbounds float, ptr %9, i64 %374
  store float %373, ptr %375, align 16, !tbaa !33
  br i1 %330, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %376 = trunc i64 %343 to i32
  %377 = or disjoint i32 %376, 5
  %378 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %377
  %379 = load float, ptr addrspace(3) %378, align 4, !tbaa !33
  %380 = or disjoint i64 %346, 5
  %381 = getelementptr inbounds float, ptr %9, i64 %380
  store float %379, ptr %381, align 4, !tbaa !33
  br i1 %331, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %382 = trunc i64 %343 to i32
  %383 = or disjoint i32 %382, 6
  %384 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %383
  %385 = load float, ptr addrspace(3) %384, align 4, !tbaa !33
  %386 = or disjoint i64 %346, 6
  %387 = getelementptr inbounds float, ptr %9, i64 %386
  store float %385, ptr %387, align 8, !tbaa !33
  br i1 %332, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %388 = trunc i64 %343 to i32
  %389 = or disjoint i32 %388, 7
  %390 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !33
  %392 = or disjoint i64 %346, 7
  %393 = getelementptr inbounds float, ptr %9, i64 %392
  store float %391, ptr %393, align 4, !tbaa !33
  br i1 %333, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %394 = trunc i64 %343 to i32
  %395 = or disjoint i32 %394, 8
  %396 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !33
  %398 = or disjoint i64 %346, 8
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 32, !tbaa !33
  br i1 %334, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %400 = trunc i64 %343 to i32
  %401 = or disjoint i32 %400, 9
  %402 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !33
  %404 = or disjoint i64 %346, 9
  %405 = getelementptr inbounds float, ptr %9, i64 %404
  store float %403, ptr %405, align 4, !tbaa !33
  br i1 %335, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %406 = trunc i64 %343 to i32
  %407 = or disjoint i32 %406, 10
  %408 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !33
  %410 = or disjoint i64 %346, 10
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 8, !tbaa !33
  br i1 %336, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %412 = trunc i64 %343 to i32
  %413 = or disjoint i32 %412, 11
  %414 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !33
  %416 = or disjoint i64 %346, 11
  %417 = getelementptr inbounds float, ptr %9, i64 %416
  store float %415, ptr %417, align 4, !tbaa !33
  br i1 %337, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %418 = trunc i64 %343 to i32
  %419 = or disjoint i32 %418, 12
  %420 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !33
  %422 = or disjoint i64 %346, 12
  %423 = getelementptr inbounds float, ptr %9, i64 %422
  store float %421, ptr %423, align 16, !tbaa !33
  br i1 %338, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %424 = trunc i64 %343 to i32
  %425 = or disjoint i32 %424, 13
  %426 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !33
  %428 = or disjoint i64 %346, 13
  %429 = getelementptr inbounds float, ptr %9, i64 %428
  store float %427, ptr %429, align 4, !tbaa !33
  br i1 %339, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %430 = trunc i64 %343 to i32
  %431 = or disjoint i32 %430, 14
  %432 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %431
  %433 = load float, ptr addrspace(3) %432, align 4, !tbaa !33
  %434 = or disjoint i64 %346, 14
  %435 = getelementptr inbounds float, ptr %9, i64 %434
  store float %433, ptr %435, align 8, !tbaa !33
  br i1 %340, label %436, label %.split.us.i

436:                                              ; preds = %.preheader.split.15.i
  %437 = trunc i64 %343 to i32
  %438 = or disjoint i32 %437, 15
  %439 = getelementptr inbounds float, ptr addrspace(3) %323, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !33
  %441 = or disjoint i64 %346, 15
  %442 = getelementptr inbounds float, ptr %9, i64 %441
  store float %440, ptr %442, align 4, !tbaa !33
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
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="3,3" }
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
!37 = distinct !{!37, !29}
;----------------- End AdaptiveCpp IR dump ---------------
