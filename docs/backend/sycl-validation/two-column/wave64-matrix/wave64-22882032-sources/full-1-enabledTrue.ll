;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-ei6b8q4s/kernel.cpp"
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
  %11 = icmp ult i64 %10, 2147483647
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp eq i64 %16, 0
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 2147483648
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 2147483647
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 8
  %31 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %34 = icmp eq i64 %33, 0
  call void @llvm.assume(i1 %34)
  %35 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %36 = icmp eq i64 %35, 0
  call void @llvm.assume(i1 %36)
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %40 = inttoptr i32 %39 to ptr addrspace(3)
  %41 = getelementptr inbounds i8, ptr addrspace(3) %40, i32 512
  %42 = sext i32 %30 to i64
  br label %54

43:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = shl i32 %.tr.i, 9
  %45 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %50 = icmp eq i64 %49, 0
  call void @llvm.assume(i1 %50)
  %51 = sext i32 %4 to i64
  %52 = getelementptr inbounds i8, ptr addrspace(3) %40, i32 1024
  %53 = sext i32 %44 to i64
  br label %76

54:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %55 = phi i64 [ 0, %6 ], [ %68, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %56 = lshr i64 %55, 5
  %57 = and i64 %55, 31
  %58 = icmp slt i64 %56, %37
  %59 = icmp slt i64 %57, %38
  %60 = and i1 %58, %59
  br i1 %60, label %61, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

61:                                               ; preds = %54
  %62 = and i64 %55, 9223372036854775776
  %63 = or disjoint i64 %62, %42
  %64 = or disjoint i64 %63, %57
  %65 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %64
  %.sroa.0263.0.copyload.i = load i16, ptr %65, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %61, %54
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %61 ], [ 0, %54 ]
  %66 = trunc i64 %55 to i32
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %66
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %67, align 2, !tbaa.struct !23
  %68 = add nuw nsw i64 %55, 1
  %exitcond.not.i = icmp eq i64 %68, 256
  br i1 %exitcond.not.i, label %43, label %54, !llvm.loop !28

69:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %71 = icmp eq i64 %70, 0
  call void @llvm.assume(i1 %71)
  %72 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %73 = icmp eq i64 %72, 0
  call void @llvm.assume(i1 %73)
  %74 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %75 = icmp eq i64 %74, 0
  call void @llvm.assume(i1 %75)
  br label %116

76:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i, %43
  %77 = phi i64 [ 0, %43 ], [ %90, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i ]
  %78 = lshr i64 %77, 4
  %79 = and i64 %77, 15
  %80 = icmp slt i64 %78, %38
  %81 = icmp slt i64 %79, %51
  %82 = and i1 %80, %81
  br i1 %82, label %83, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

83:                                               ; preds = %76
  %84 = and i64 %77, 9223372036854775792
  %85 = or disjoint i64 %84, %53
  %86 = or disjoint i64 %85, %79
  %87 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %86
  %.sroa.0248.0.copyload.i = load i16, ptr %87, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i: ; preds = %83, %76
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %83 ], [ 0, %76 ]
  %88 = trunc i64 %77 to i32
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %88
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %89, align 2, !tbaa.struct !23
  %90 = add nuw nsw i64 %77, 1
  %exitcond564.not.i = icmp eq i64 %90, 512
  br i1 %exitcond564.not.i, label %69, label %76, !llvm.loop !32

91:                                               ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %94 = icmp eq i64 %93, 0
  call void @llvm.assume(i1 %94)
  %95 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %96 = icmp eq i64 %95, 0
  call void @llvm.assume(i1 %96)
  %97 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %98 = icmp eq i64 %97, 0
  call void @llvm.assume(i1 %98)
  %99 = sext i32 %92 to i64
  %100 = icmp sgt i32 %4, 0
  %101 = icmp ugt i32 %4, 1
  %102 = icmp ugt i32 %4, 2
  %103 = icmp ugt i32 %4, 3
  %104 = icmp ugt i32 %4, 4
  %105 = icmp ugt i32 %4, 5
  %106 = icmp ugt i32 %4, 6
  %107 = icmp ugt i32 %4, 7
  %108 = icmp ugt i32 %4, 8
  %109 = icmp ugt i32 %4, 9
  %110 = icmp ugt i32 %4, 10
  %111 = icmp ugt i32 %4, 11
  %112 = icmp ugt i32 %4, 12
  %113 = icmp ugt i32 %4, 13
  %114 = icmp ugt i32 %4, 14
  %115 = icmp ugt i32 %4, 15
  br label %.preheader.i

116:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %69
  %117 = phi i64 [ 0, %69 ], [ %124, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %118 = and i64 %117, 15
  %119 = shl nuw i64 %117, 1
  %120 = and i64 %119, 224
  br label %125

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %121 = trunc i64 %117 to i32
  %122 = and i32 %121, 127
  %123 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %122
  store float %326, ptr addrspace(3) %123, align 4, !tbaa !33
  %124 = add nuw nsw i64 %117, 1
  %exitcond565.not.i = icmp eq i64 %124, 128
  br i1 %exitcond565.not.i, label %91, label %116, !llvm.loop !35

125:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %116
  %126 = phi i64 [ 0, %116 ], [ %327, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %127 = phi float [ 0.000000e+00, %116 ], [ %326, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %128 = add nuw nsw i64 %126, %120
  %129 = trunc i64 %128 to i32
  %130 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %129
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %130, align 2, !tbaa.struct !23
  %131 = shl nuw nsw i64 %126, 4
  %132 = or disjoint i64 %131, %118
  %133 = trunc i64 %132 to i32
  %134 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %133
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %134, align 2, !tbaa.struct !23
  %135 = zext i16 %.sroa.0233.0.copyload.i to i32
  %136 = lshr i32 %135, 10
  %137 = and i32 %136, 31
  %138 = and i32 %135, 1023
  switch i32 %137, label %144 [
    i32 31, label %139
    i32 0, label %146
  ]

139:                                              ; preds = %125
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %140 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %138, 0
  %141 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %142 = or disjoint i32 %141, %140
  %143 = bitcast i32 %142 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

144:                                              ; preds = %125
  %145 = or disjoint i32 %138, 1024
  br label %146

146:                                              ; preds = %144, %125
  %147 = phi i32 [ %145, %144 ], [ %138, %125 ]
  %148 = uitofp i32 %147 to float
  %.not.i = icmp eq i32 %137, 0
  %149 = add nsw i32 %137, -25
  %150 = select i1 %.not.i, i32 -24, i32 %149
  %151 = call float @__ocml_ldexp_f32(float noundef %148, i32 noundef %150) #5
  %152 = fneg contract float %151
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %153 = select contract i1 %.not522523.i, float %152, float %151
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %146, %139
  %154 = phi float [ %143, %139 ], [ %153, %146 ]
  %155 = zext i16 %.sroa.0224.0.copyload.i to i32
  %156 = lshr i32 %155, 10
  %157 = and i32 %156, 31
  %158 = and i32 %155, 1023
  switch i32 %157, label %164 [
    i32 31, label %159
    i32 0, label %166
  ]

159:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %160 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %158, 0
  %161 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %162 = or disjoint i32 %161, %160
  %163 = bitcast i32 %162 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

164:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %165 = or disjoint i32 %158, 1024
  br label %166

166:                                              ; preds = %164, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %167 = phi i32 [ %165, %164 ], [ %158, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %168 = uitofp i32 %167 to float
  %.not524.i = icmp eq i32 %157, 0
  %169 = add nsw i32 %157, -25
  %170 = select i1 %.not524.i, i32 -24, i32 %169
  %171 = call float @__ocml_ldexp_f32(float noundef %168, i32 noundef %170) #5
  %172 = fneg contract float %171
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %173 = select contract i1 %.not525526.i, float %172, float %171
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i: ; preds = %166, %159
  %174 = phi float [ %163, %159 ], [ %173, %166 ]
  %175 = fmul contract float %154, %174
  %176 = fadd contract float %127, %175
  %177 = or disjoint i64 %126, 1
  %178 = add nuw nsw i64 %177, %120
  %179 = trunc i64 %178 to i32
  %180 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %179
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %180, align 2, !tbaa.struct !23
  %181 = shl nuw nsw i64 %177, 4
  %182 = or disjoint i64 %181, %118
  %183 = trunc i64 %182 to i32
  %184 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %183
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %184, align 2, !tbaa.struct !23
  %185 = zext i16 %.sroa.0215.0.copyload.i to i32
  %186 = lshr i32 %185, 10
  %187 = and i32 %186, 31
  %188 = and i32 %185, 1023
  switch i32 %187, label %194 [
    i32 31, label %189
    i32 0, label %196
  ]

189:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %190 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %188, 0
  %191 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %192 = or disjoint i32 %191, %190
  %193 = bitcast i32 %192 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %195 = or disjoint i32 %188, 1024
  br label %196

196:                                              ; preds = %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %197 = phi i32 [ %195, %194 ], [ %188, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i ]
  %198 = uitofp i32 %197 to float
  %.not527.i = icmp eq i32 %187, 0
  %199 = add nsw i32 %187, -25
  %200 = select i1 %.not527.i, i32 -24, i32 %199
  %201 = call float @__ocml_ldexp_f32(float noundef %198, i32 noundef %200) #5
  %202 = fneg contract float %201
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %203 = select contract i1 %.not528529.i, float %202, float %201
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %196, %189
  %204 = phi float [ %193, %189 ], [ %203, %196 ]
  %205 = zext i16 %.sroa.0206.0.copyload.i to i32
  %206 = lshr i32 %205, 10
  %207 = and i32 %206, 31
  %208 = and i32 %205, 1023
  switch i32 %207, label %214 [
    i32 31, label %209
    i32 0, label %216
  ]

209:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %210 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %208, 0
  %211 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %212 = or disjoint i32 %211, %210
  %213 = bitcast i32 %212 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %215 = or disjoint i32 %208, 1024
  br label %216

216:                                              ; preds = %214, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %217 = phi i32 [ %215, %214 ], [ %208, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %218 = uitofp i32 %217 to float
  %.not530.i = icmp eq i32 %207, 0
  %219 = add nsw i32 %207, -25
  %220 = select i1 %.not530.i, i32 -24, i32 %219
  %221 = call float @__ocml_ldexp_f32(float noundef %218, i32 noundef %220) #5
  %222 = fneg contract float %221
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %223 = select contract i1 %.not531532.i, float %222, float %221
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %216, %209
  %224 = phi float [ %213, %209 ], [ %223, %216 ]
  %225 = fmul contract float %204, %224
  %226 = fadd contract float %176, %225
  %227 = or disjoint i64 %126, 2
  %228 = add nuw nsw i64 %227, %120
  %229 = trunc i64 %228 to i32
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %229
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %230, align 2, !tbaa.struct !23
  %231 = shl nuw nsw i64 %227, 4
  %232 = or disjoint i64 %231, %118
  %233 = trunc i64 %232 to i32
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %233
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %234, align 2, !tbaa.struct !23
  %235 = zext i16 %.sroa.0197.0.copyload.i to i32
  %236 = lshr i32 %235, 10
  %237 = and i32 %236, 31
  %238 = and i32 %235, 1023
  switch i32 %237, label %244 [
    i32 31, label %239
    i32 0, label %246
  ]

239:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %240 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %238, 0
  %241 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %242 = or disjoint i32 %241, %240
  %243 = bitcast i32 %242 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %245 = or disjoint i32 %238, 1024
  br label %246

246:                                              ; preds = %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %247 = phi i32 [ %245, %244 ], [ %238, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %248 = uitofp i32 %247 to float
  %.not533.i = icmp eq i32 %237, 0
  %249 = add nsw i32 %237, -25
  %250 = select i1 %.not533.i, i32 -24, i32 %249
  %251 = call float @__ocml_ldexp_f32(float noundef %248, i32 noundef %250) #5
  %252 = fneg contract float %251
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %253 = select contract i1 %.not534535.i, float %252, float %251
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %246, %239
  %254 = phi float [ %243, %239 ], [ %253, %246 ]
  %255 = zext i16 %.sroa.0188.0.copyload.i to i32
  %256 = lshr i32 %255, 10
  %257 = and i32 %256, 31
  %258 = and i32 %255, 1023
  switch i32 %257, label %264 [
    i32 31, label %259
    i32 0, label %266
  ]

259:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %260 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %258, 0
  %261 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %262 = or disjoint i32 %261, %260
  %263 = bitcast i32 %262 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %265 = or disjoint i32 %258, 1024
  br label %266

266:                                              ; preds = %264, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %267 = phi i32 [ %265, %264 ], [ %258, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %268 = uitofp i32 %267 to float
  %.not536.i = icmp eq i32 %257, 0
  %269 = add nsw i32 %257, -25
  %270 = select i1 %.not536.i, i32 -24, i32 %269
  %271 = call float @__ocml_ldexp_f32(float noundef %268, i32 noundef %270) #5
  %272 = fneg contract float %271
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %273 = select contract i1 %.not537538.i, float %272, float %271
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %266, %259
  %274 = phi float [ %263, %259 ], [ %273, %266 ]
  %275 = fmul contract float %254, %274
  %276 = fadd contract float %226, %275
  %277 = or disjoint i64 %126, 3
  %278 = add nuw nsw i64 %277, %120
  %279 = trunc i64 %278 to i32
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %41, i32 %279
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %280, align 2, !tbaa.struct !23
  %281 = shl nuw nsw i64 %277, 4
  %282 = or disjoint i64 %281, %118
  %283 = trunc i64 %282 to i32
  %284 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %283
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %284, align 2, !tbaa.struct !23
  %285 = zext i16 %.sroa.0179.0.copyload.i to i32
  %286 = lshr i32 %285, 10
  %287 = and i32 %286, 31
  %288 = and i32 %285, 1023
  switch i32 %287, label %294 [
    i32 31, label %289
    i32 0, label %296
  ]

289:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %290 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %288, 0
  %291 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %292 = or disjoint i32 %291, %290
  %293 = bitcast i32 %292 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %295 = or disjoint i32 %288, 1024
  br label %296

296:                                              ; preds = %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %297 = phi i32 [ %295, %294 ], [ %288, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %298 = uitofp i32 %297 to float
  %.not539.i = icmp eq i32 %287, 0
  %299 = add nsw i32 %287, -25
  %300 = select i1 %.not539.i, i32 -24, i32 %299
  %301 = call float @__ocml_ldexp_f32(float noundef %298, i32 noundef %300) #5
  %302 = fneg contract float %301
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %303 = select contract i1 %.not540541.i, float %302, float %301
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %296, %289
  %304 = phi float [ %293, %289 ], [ %303, %296 ]
  %305 = zext i16 %.sroa.0170.0.copyload.i to i32
  %306 = lshr i32 %305, 10
  %307 = and i32 %306, 31
  %308 = and i32 %305, 1023
  switch i32 %307, label %314 [
    i32 31, label %309
    i32 0, label %316
  ]

309:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %310 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %308, 0
  %311 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %312 = or disjoint i32 %311, %310
  %313 = bitcast i32 %312 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %315 = or disjoint i32 %308, 1024
  br label %316

316:                                              ; preds = %314, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %317 = phi i32 [ %315, %314 ], [ %308, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %318 = uitofp i32 %317 to float
  %.not542.i = icmp eq i32 %307, 0
  %319 = add nsw i32 %307, -25
  %320 = select i1 %.not542.i, i32 -24, i32 %319
  %321 = call float @__ocml_ldexp_f32(float noundef %318, i32 noundef %320) #5
  %322 = fneg contract float %321
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %323 = select contract i1 %.not543544.i, float %322, float %321
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %316, %309
  %324 = phi float [ %313, %309 ], [ %323, %316 ]
  %325 = fmul contract float %304, %324
  %326 = fadd contract float %276, %325
  %327 = add nuw nsw i64 %126, 4
  %328 = icmp ult i64 %126, 28
  br i1 %328, label %125, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !36

.preheader.i:                                     ; preds = %.split.us.i, %91
  %329 = phi i64 [ 0, %91 ], [ %335, %.split.us.i ]
  %330 = icmp slt i64 %329, %37
  %331 = shl i64 %329, 4
  %.tr521.i = trunc i64 %329 to i32
  %332 = shl i32 %.tr521.i, 4
  %333 = sext i32 %332 to i64
  %334 = add nsw i64 %333, %99
  %.fr.i = freeze i1 %330
  %brmerge.not.i = select i1 %.fr.i, i1 %100, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %424, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %335 = add nuw nsw i64 %329, 1
  %exitcond567.not.i = icmp eq i64 %335, 8
  br i1 %exitcond567.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %336 = trunc i64 %331 to i32
  %337 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %336
  %338 = load float, ptr addrspace(3) %337, align 4, !tbaa !33
  %339 = getelementptr inbounds float, ptr %9, i64 %334
  store float %338, ptr %339, align 32, !tbaa !33
  br i1 %101, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %340 = trunc i64 %331 to i32
  %341 = or disjoint i32 %340, 1
  %342 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %341
  %343 = load float, ptr addrspace(3) %342, align 4, !tbaa !33
  %344 = or disjoint i64 %334, 1
  %345 = getelementptr inbounds float, ptr %9, i64 %344
  store float %343, ptr %345, align 4, !tbaa !33
  br i1 %102, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %346 = trunc i64 %331 to i32
  %347 = or disjoint i32 %346, 2
  %348 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %347
  %349 = load float, ptr addrspace(3) %348, align 4, !tbaa !33
  %350 = or disjoint i64 %334, 2
  %351 = getelementptr inbounds float, ptr %9, i64 %350
  store float %349, ptr %351, align 8, !tbaa !33
  br i1 %103, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %352 = trunc i64 %331 to i32
  %353 = or disjoint i32 %352, 3
  %354 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %353
  %355 = load float, ptr addrspace(3) %354, align 4, !tbaa !33
  %356 = or disjoint i64 %334, 3
  %357 = getelementptr inbounds float, ptr %9, i64 %356
  store float %355, ptr %357, align 4, !tbaa !33
  br i1 %104, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %358 = trunc i64 %331 to i32
  %359 = or disjoint i32 %358, 4
  %360 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %359
  %361 = load float, ptr addrspace(3) %360, align 4, !tbaa !33
  %362 = or disjoint i64 %334, 4
  %363 = getelementptr inbounds float, ptr %9, i64 %362
  store float %361, ptr %363, align 16, !tbaa !33
  br i1 %105, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %364 = trunc i64 %331 to i32
  %365 = or disjoint i32 %364, 5
  %366 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %365
  %367 = load float, ptr addrspace(3) %366, align 4, !tbaa !33
  %368 = or disjoint i64 %334, 5
  %369 = getelementptr inbounds float, ptr %9, i64 %368
  store float %367, ptr %369, align 4, !tbaa !33
  br i1 %106, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %370 = trunc i64 %331 to i32
  %371 = or disjoint i32 %370, 6
  %372 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %371
  %373 = load float, ptr addrspace(3) %372, align 4, !tbaa !33
  %374 = or disjoint i64 %334, 6
  %375 = getelementptr inbounds float, ptr %9, i64 %374
  store float %373, ptr %375, align 8, !tbaa !33
  br i1 %107, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %376 = trunc i64 %331 to i32
  %377 = or disjoint i32 %376, 7
  %378 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %377
  %379 = load float, ptr addrspace(3) %378, align 4, !tbaa !33
  %380 = or disjoint i64 %334, 7
  %381 = getelementptr inbounds float, ptr %9, i64 %380
  store float %379, ptr %381, align 4, !tbaa !33
  br i1 %108, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %382 = trunc i64 %331 to i32
  %383 = or disjoint i32 %382, 8
  %384 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %383
  %385 = load float, ptr addrspace(3) %384, align 4, !tbaa !33
  %386 = or disjoint i64 %334, 8
  %387 = getelementptr inbounds float, ptr %9, i64 %386
  store float %385, ptr %387, align 32, !tbaa !33
  br i1 %109, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %388 = trunc i64 %331 to i32
  %389 = or disjoint i32 %388, 9
  %390 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !33
  %392 = or disjoint i64 %334, 9
  %393 = getelementptr inbounds float, ptr %9, i64 %392
  store float %391, ptr %393, align 4, !tbaa !33
  br i1 %110, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %394 = trunc i64 %331 to i32
  %395 = or disjoint i32 %394, 10
  %396 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !33
  %398 = or disjoint i64 %334, 10
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 8, !tbaa !33
  br i1 %111, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %400 = trunc i64 %331 to i32
  %401 = or disjoint i32 %400, 11
  %402 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !33
  %404 = or disjoint i64 %334, 11
  %405 = getelementptr inbounds float, ptr %9, i64 %404
  store float %403, ptr %405, align 4, !tbaa !33
  br i1 %112, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %406 = trunc i64 %331 to i32
  %407 = or disjoint i32 %406, 12
  %408 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !33
  %410 = or disjoint i64 %334, 12
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 16, !tbaa !33
  br i1 %113, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %412 = trunc i64 %331 to i32
  %413 = or disjoint i32 %412, 13
  %414 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !33
  %416 = or disjoint i64 %334, 13
  %417 = getelementptr inbounds float, ptr %9, i64 %416
  store float %415, ptr %417, align 4, !tbaa !33
  br i1 %114, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %418 = trunc i64 %331 to i32
  %419 = or disjoint i32 %418, 14
  %420 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !33
  %422 = or disjoint i64 %334, 14
  %423 = getelementptr inbounds float, ptr %9, i64 %422
  store float %421, ptr %423, align 8, !tbaa !33
  br i1 %115, label %424, label %.split.us.i

424:                                              ; preds = %.preheader.split.15.i
  %425 = trunc i64 %331 to i32
  %426 = or disjoint i32 %425, 15
  %427 = getelementptr inbounds float, ptr addrspace(3) %40, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !33
  %429 = or disjoint i64 %334, 15
  %430 = getelementptr inbounds float, ptr %9, i64 %429
  store float %428, ptr %430, align 4, !tbaa !33
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %.split.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="1,1" }
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
