;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-jy023by_/kernel.cpp"
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
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 536870911
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp ult i64 %20, 4
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 536870912
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 536870911
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp ult i64 %30, 4
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp ult i64 %32, 4
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 4
  call void @llvm.assume(i1 %35)
  %36 = shl nuw nsw i64 %34, 4
  %37 = shl nuw nsw i64 %32, 2
  %38 = or disjoint i64 %36, %37
  %39 = or disjoint i64 %38, %30
  %40 = shl i32 %.tr.i, 8
  %41 = sext i32 %3 to i64
  %42 = sext i32 %5 to i64
  %43 = sext i32 %40 to i64
  %44 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %45 = inttoptr i32 %44 to ptr addrspace(3)
  %46 = getelementptr inbounds i8, ptr addrspace(3) %45, i32 512
  br label %64

.lr.ph723.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %48 = icmp ult i64 %47, 4
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %50 = icmp ult i64 %49, 4
  call void @llvm.assume(i1 %50)
  %51 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %52 = icmp ult i64 %51, 4
  call void @llvm.assume(i1 %52)
  %53 = shl nuw nsw i64 %51, 4
  %54 = shl nuw nsw i64 %49, 2
  %55 = or disjoint i64 %53, %54
  %56 = or disjoint i64 %55, %47
  %57 = shl i32 %.tr.i, 9
  %58 = sext i32 %5 to i64
  %59 = sext i32 %4 to i64
  %60 = sext i32 %57 to i64
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr inbounds i8, ptr addrspace(3) %62, i32 1024
  br label %96

64:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i, %6
  %65 = phi i64 [ %39, %6 ], [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i ]
  %.frozen.i = freeze i64 %65
  %66 = sdiv i64 %.frozen.i, 32
  %67 = srem i64 %66, 8
  %68 = mul i64 %66, 32
  %.decomposed.i = sub i64 %.frozen.i, %68
  %69 = icmp slt i64 %67, %41
  %70 = icmp slt i64 %.decomposed.i, %42
  %71 = and i1 %70, %69
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i

72:                                               ; preds = %64
  %.tr707.i = trunc i64 %67 to i32
  %73 = shl nsw i32 %.tr707.i, 5
  %74 = sext i32 %73 to i64
  %75 = add nsw i64 %.decomposed.i, %43
  %76 = add nsw i64 %75, %74
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0305.0.copyload.i = load i16, ptr %77, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit18.i.i.i: ; preds = %72, %64
  %.sroa.0307.1.i = phi i16 [ %.sroa.0305.0.copyload.i, %72 ], [ 0, %64 ]
  %srem708.i = srem i64 %65, 256
  %78 = trunc i64 %srem708.i to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %46, i32 %78
  store i16 %.sroa.0307.1.i, ptr addrspace(3) %79, align 2, !tbaa.struct !23
  %80 = add i64 %65, 64
  %81 = icmp slt i64 %80, 256
  br i1 %81, label %64, label %.lr.ph723.i, !llvm.loop !28

.lr.ph726.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %83 = icmp ult i64 %82, 4
  call void @llvm.assume(i1 %83)
  %84 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %85 = icmp ult i64 %84, 4
  call void @llvm.assume(i1 %85)
  %86 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %87 = icmp ult i64 %86, 4
  call void @llvm.assume(i1 %87)
  %88 = shl nuw nsw i64 %86, 4
  %89 = shl nuw nsw i64 %84, 2
  %90 = or disjoint i64 %88, %89
  %91 = or disjoint i64 %90, %82
  %92 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %93 = inttoptr i32 %92 to ptr addrspace(3)
  %94 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 512
  %95 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 1024
  br label %118

96:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph723.i
  %97 = phi i64 [ %56, %.lr.ph723.i ], [ %112, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %.frozen739.i = freeze i64 %97
  %98 = sdiv i64 %.frozen739.i, 16
  %99 = srem i64 %98, 32
  %100 = mul i64 %98, 16
  %.decomposed740.i = sub i64 %.frozen739.i, %100
  %101 = icmp slt i64 %99, %58
  %102 = icmp slt i64 %.decomposed740.i, %59
  %103 = and i1 %102, %101
  br i1 %103, label %104, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

104:                                              ; preds = %96
  %.tr706.i = trunc i64 %99 to i32
  %105 = shl nsw i32 %.tr706.i, 4
  %106 = sext i32 %105 to i64
  %107 = add nsw i64 %.decomposed740.i, %60
  %108 = add nsw i64 %107, %106
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %108
  %.sroa.0290.0.copyload.i = load i16, ptr %109, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %104, %96
  %.sroa.0292.1.i = phi i16 [ %.sroa.0290.0.copyload.i, %104 ], [ 0, %96 ]
  %srem.i = srem i64 %97, 512
  %110 = trunc i64 %srem.i to i32
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %110
  store i16 %.sroa.0292.1.i, ptr addrspace(3) %111, align 2, !tbaa.struct !23
  %112 = add i64 %97, 64
  %113 = icmp slt i64 %112, 512
  br i1 %113, label %96, label %.lr.ph726.i, !llvm.loop !32

._crit_edge727.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %116 = icmp ult i64 %115, 4
  call void @llvm.assume(i1 %116)
  %117 = icmp eq i64 %115, 0
  br i1 %117, label %439, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

118:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph726.i
  %119 = phi i64 [ %91, %.lr.ph726.i ], [ %132, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %.frozen741.i = freeze i64 %119
  %120 = sdiv i64 %.frozen741.i, 8
  %121 = srem i64 %120, 8
  %122 = mul i64 %120, 8
  %.decomposed742.i = sub i64 %.frozen741.i, %122
  %123 = add nsw i64 %.decomposed742.i, 8
  %124 = shl nsw i64 %121, 5
  br label %134

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %125 = shl nsw i64 %121, 4
  %126 = add nsw i64 %125, %.decomposed742.i
  %127 = trunc i64 %126 to i32
  %128 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %127
  store float %411, ptr addrspace(3) %128, align 4, !tbaa !33
  %129 = add nuw nsw i64 %125, %123
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %130
  store float %436, ptr addrspace(3) %131, align 4, !tbaa !33
  %132 = add i64 %119, 64
  %133 = icmp ugt i64 %119, 9223372036854775743
  br i1 %133, label %118, label %._crit_edge727.i, !llvm.loop !35

134:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %118
  %135 = phi i64 [ 0, %118 ], [ %437, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %136 = phi float [ 0.000000e+00, %118 ], [ %436, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %137 = phi float [ 0.000000e+00, %118 ], [ %411, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %138 = add nuw nsw i64 %135, %124
  %139 = trunc i64 %138 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %139
  %.sroa.0275.0.copyload.i = load i16, ptr addrspace(3) %140, align 2, !tbaa.struct !23
  %141 = shl nuw nsw i64 %135, 4
  %142 = add nsw i64 %141, %.decomposed742.i
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %143
  %.sroa.0266.0.copyload.i = load i16, ptr addrspace(3) %144, align 2, !tbaa.struct !23
  %145 = zext i16 %.sroa.0275.0.copyload.i to i32
  %146 = lshr i32 %145, 10
  %147 = and i32 %146, 31
  %148 = and i32 %145, 1023
  switch i32 %147, label %154 [
    i32 31, label %149
    i32 0, label %156
  ]

149:                                              ; preds = %134
  %.sroa.0275.0.copyload.signext.i = sext i16 %.sroa.0275.0.copyload.i to i32
  %150 = and i32 %.sroa.0275.0.copyload.signext.i, -2147483648
  %.not705.i = icmp eq i32 %148, 0
  %151 = select i1 %.not705.i, i32 2139095040, i32 2143289344
  %152 = or disjoint i32 %151, %150
  %153 = bitcast i32 %152 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

154:                                              ; preds = %134
  %155 = or disjoint i32 %148, 1024
  br label %156

156:                                              ; preds = %154, %134
  %157 = phi i32 [ %155, %154 ], [ %148, %134 ]
  %158 = uitofp i32 %157 to float
  %.not.i = icmp eq i32 %147, 0
  %159 = add nsw i32 %147, -25
  %160 = select i1 %.not.i, i32 -24, i32 %159
  %161 = call float @__ocml_ldexp_f32(float noundef %158, i32 noundef %160) #5
  %162 = fneg contract float %161
  %.not659660.i = icmp slt i16 %.sroa.0275.0.copyload.i, 0
  %163 = select contract i1 %.not659660.i, float %162, float %161
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %156, %149
  %164 = phi float [ %153, %149 ], [ %163, %156 ]
  %165 = zext i16 %.sroa.0266.0.copyload.i to i32
  %166 = lshr i32 %165, 10
  %167 = and i32 %166, 31
  %168 = and i32 %165, 1023
  switch i32 %167, label %174 [
    i32 31, label %169
    i32 0, label %176
  ]

169:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0266.0.copyload.signext.i = sext i16 %.sroa.0266.0.copyload.i to i32
  %170 = and i32 %.sroa.0266.0.copyload.signext.i, -2147483648
  %.not704.i = icmp eq i32 %168, 0
  %171 = select i1 %.not704.i, i32 2139095040, i32 2143289344
  %172 = or disjoint i32 %171, %170
  %173 = bitcast i32 %172 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

174:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %175 = or disjoint i32 %168, 1024
  br label %176

176:                                              ; preds = %174, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %177 = phi i32 [ %175, %174 ], [ %168, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %178 = uitofp i32 %177 to float
  %.not661.i = icmp eq i32 %167, 0
  %179 = add nsw i32 %167, -25
  %180 = select i1 %.not661.i, i32 -24, i32 %179
  %181 = call float @__ocml_ldexp_f32(float noundef %178, i32 noundef %180) #5
  %182 = fneg contract float %181
  %.not662663.i = icmp slt i16 %.sroa.0266.0.copyload.i, 0
  %183 = select contract i1 %.not662663.i, float %182, float %181
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %176, %169
  %184 = phi float [ %173, %169 ], [ %183, %176 ]
  %185 = fmul contract float %164, %184
  %186 = fadd contract float %137, %185
  %187 = add nuw nsw i64 %141, %123
  %188 = trunc i64 %187 to i32
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %188
  %.sroa.0257.0.copyload.i = load i16, ptr addrspace(3) %189, align 2, !tbaa.struct !23
  %190 = zext i16 %.sroa.0257.0.copyload.i to i32
  %191 = lshr i32 %190, 10
  %192 = and i32 %191, 31
  %193 = and i32 %190, 1023
  switch i32 %192, label %199 [
    i32 31, label %194
    i32 0, label %201
  ]

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0257.0.copyload.signext.i = sext i16 %.sroa.0257.0.copyload.i to i32
  %195 = and i32 %.sroa.0257.0.copyload.signext.i, -2147483648
  %.not703.i = icmp eq i32 %193, 0
  %196 = select i1 %.not703.i, i32 2139095040, i32 2143289344
  %197 = or disjoint i32 %196, %195
  %198 = bitcast i32 %197 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

199:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %200 = or disjoint i32 %193, 1024
  br label %201

201:                                              ; preds = %199, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %202 = phi i32 [ %200, %199 ], [ %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %203 = uitofp i32 %202 to float
  %.not664.i = icmp eq i32 %192, 0
  %204 = add nsw i32 %192, -25
  %205 = select i1 %.not664.i, i32 -24, i32 %204
  %206 = call float @__ocml_ldexp_f32(float noundef %203, i32 noundef %205) #5
  %207 = fneg contract float %206
  %.not665666.i = icmp slt i16 %.sroa.0257.0.copyload.i, 0
  %208 = select contract i1 %.not665666.i, float %207, float %206
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %201, %194
  %209 = phi float [ %198, %194 ], [ %208, %201 ]
  %210 = fmul contract float %164, %209
  %211 = fadd contract float %136, %210
  %212 = or disjoint i64 %135, 1
  %213 = add nuw nsw i64 %212, %124
  %214 = trunc i64 %213 to i32
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %214
  %.sroa.0248.0.copyload.i = load i16, ptr addrspace(3) %215, align 2, !tbaa.struct !23
  %216 = shl nuw nsw i64 %212, 4
  %217 = add nsw i64 %216, %.decomposed742.i
  %218 = trunc i64 %217 to i32
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %218
  %.sroa.0239.0.copyload.i = load i16, ptr addrspace(3) %219, align 2, !tbaa.struct !23
  %220 = zext i16 %.sroa.0248.0.copyload.i to i32
  %221 = lshr i32 %220, 10
  %222 = and i32 %221, 31
  %223 = and i32 %220, 1023
  switch i32 %222, label %229 [
    i32 31, label %224
    i32 0, label %231
  ]

224:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0248.0.copyload.signext.i = sext i16 %.sroa.0248.0.copyload.i to i32
  %225 = and i32 %.sroa.0248.0.copyload.signext.i, -2147483648
  %.not702.i = icmp eq i32 %223, 0
  %226 = select i1 %.not702.i, i32 2139095040, i32 2143289344
  %227 = or disjoint i32 %226, %225
  %228 = bitcast i32 %227 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

229:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %230 = or disjoint i32 %223, 1024
  br label %231

231:                                              ; preds = %229, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %232 = phi i32 [ %230, %229 ], [ %223, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %233 = uitofp i32 %232 to float
  %.not667.i = icmp eq i32 %222, 0
  %234 = add nsw i32 %222, -25
  %235 = select i1 %.not667.i, i32 -24, i32 %234
  %236 = call float @__ocml_ldexp_f32(float noundef %233, i32 noundef %235) #5
  %237 = fneg contract float %236
  %.not668669.i = icmp slt i16 %.sroa.0248.0.copyload.i, 0
  %238 = select contract i1 %.not668669.i, float %237, float %236
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %231, %224
  %239 = phi float [ %228, %224 ], [ %238, %231 ]
  %240 = zext i16 %.sroa.0239.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0239.0.copyload.signext.i = sext i16 %.sroa.0239.0.copyload.i to i32
  %245 = and i32 %.sroa.0239.0.copyload.signext.i, -2147483648
  %.not701.i = icmp eq i32 %243, 0
  %246 = select i1 %.not701.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not670.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not670.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #5
  %257 = fneg contract float %256
  %.not671672.i = icmp slt i16 %.sroa.0239.0.copyload.i, 0
  %258 = select contract i1 %.not671672.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = fmul contract float %239, %259
  %261 = fadd contract float %186, %260
  %262 = add nuw nsw i64 %216, %123
  %263 = trunc i64 %262 to i32
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %263
  %.sroa.0230.0.copyload.i = load i16, ptr addrspace(3) %264, align 2, !tbaa.struct !23
  %265 = zext i16 %.sroa.0230.0.copyload.i to i32
  %266 = lshr i32 %265, 10
  %267 = and i32 %266, 31
  %268 = and i32 %265, 1023
  switch i32 %267, label %274 [
    i32 31, label %269
    i32 0, label %276
  ]

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0230.0.copyload.signext.i = sext i16 %.sroa.0230.0.copyload.i to i32
  %270 = and i32 %.sroa.0230.0.copyload.signext.i, -2147483648
  %.not700.i = icmp eq i32 %268, 0
  %271 = select i1 %.not700.i, i32 2139095040, i32 2143289344
  %272 = or disjoint i32 %271, %270
  %273 = bitcast i32 %272 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %275 = or disjoint i32 %268, 1024
  br label %276

276:                                              ; preds = %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %277 = phi i32 [ %275, %274 ], [ %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %278 = uitofp i32 %277 to float
  %.not673.i = icmp eq i32 %267, 0
  %279 = add nsw i32 %267, -25
  %280 = select i1 %.not673.i, i32 -24, i32 %279
  %281 = call float @__ocml_ldexp_f32(float noundef %278, i32 noundef %280) #5
  %282 = fneg contract float %281
  %.not674675.i = icmp slt i16 %.sroa.0230.0.copyload.i, 0
  %283 = select contract i1 %.not674675.i, float %282, float %281
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %276, %269
  %284 = phi float [ %273, %269 ], [ %283, %276 ]
  %285 = fmul contract float %239, %284
  %286 = fadd contract float %211, %285
  %287 = or disjoint i64 %135, 2
  %288 = add nuw nsw i64 %287, %124
  %289 = trunc i64 %288 to i32
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %289
  %.sroa.0221.0.copyload.i = load i16, ptr addrspace(3) %290, align 2, !tbaa.struct !23
  %291 = shl nuw nsw i64 %287, 4
  %292 = add nsw i64 %291, %.decomposed742.i
  %293 = trunc i64 %292 to i32
  %294 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %293
  %.sroa.0212.0.copyload.i = load i16, ptr addrspace(3) %294, align 2, !tbaa.struct !23
  %295 = zext i16 %.sroa.0221.0.copyload.i to i32
  %296 = lshr i32 %295, 10
  %297 = and i32 %296, 31
  %298 = and i32 %295, 1023
  switch i32 %297, label %304 [
    i32 31, label %299
    i32 0, label %306
  ]

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0221.0.copyload.signext.i = sext i16 %.sroa.0221.0.copyload.i to i32
  %300 = and i32 %.sroa.0221.0.copyload.signext.i, -2147483648
  %.not699.i = icmp eq i32 %298, 0
  %301 = select i1 %.not699.i, i32 2139095040, i32 2143289344
  %302 = or disjoint i32 %301, %300
  %303 = bitcast i32 %302 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

304:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %305 = or disjoint i32 %298, 1024
  br label %306

306:                                              ; preds = %304, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %307 = phi i32 [ %305, %304 ], [ %298, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %308 = uitofp i32 %307 to float
  %.not676.i = icmp eq i32 %297, 0
  %309 = add nsw i32 %297, -25
  %310 = select i1 %.not676.i, i32 -24, i32 %309
  %311 = call float @__ocml_ldexp_f32(float noundef %308, i32 noundef %310) #5
  %312 = fneg contract float %311
  %.not677678.i = icmp slt i16 %.sroa.0221.0.copyload.i, 0
  %313 = select contract i1 %.not677678.i, float %312, float %311
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %306, %299
  %314 = phi float [ %303, %299 ], [ %313, %306 ]
  %315 = zext i16 %.sroa.0212.0.copyload.i to i32
  %316 = lshr i32 %315, 10
  %317 = and i32 %316, 31
  %318 = and i32 %315, 1023
  switch i32 %317, label %324 [
    i32 31, label %319
    i32 0, label %326
  ]

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0212.0.copyload.signext.i = sext i16 %.sroa.0212.0.copyload.i to i32
  %320 = and i32 %.sroa.0212.0.copyload.signext.i, -2147483648
  %.not698.i = icmp eq i32 %318, 0
  %321 = select i1 %.not698.i, i32 2139095040, i32 2143289344
  %322 = or disjoint i32 %321, %320
  %323 = bitcast i32 %322 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %325 = or disjoint i32 %318, 1024
  br label %326

326:                                              ; preds = %324, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %327 = phi i32 [ %325, %324 ], [ %318, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %328 = uitofp i32 %327 to float
  %.not679.i = icmp eq i32 %317, 0
  %329 = add nsw i32 %317, -25
  %330 = select i1 %.not679.i, i32 -24, i32 %329
  %331 = call float @__ocml_ldexp_f32(float noundef %328, i32 noundef %330) #5
  %332 = fneg contract float %331
  %.not680681.i = icmp slt i16 %.sroa.0212.0.copyload.i, 0
  %333 = select contract i1 %.not680681.i, float %332, float %331
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %326, %319
  %334 = phi float [ %323, %319 ], [ %333, %326 ]
  %335 = fmul contract float %314, %334
  %336 = fadd contract float %261, %335
  %337 = add nuw nsw i64 %291, %123
  %338 = trunc i64 %337 to i32
  %339 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %338
  %.sroa.0203.0.copyload.i = load i16, ptr addrspace(3) %339, align 2, !tbaa.struct !23
  %340 = zext i16 %.sroa.0203.0.copyload.i to i32
  %341 = lshr i32 %340, 10
  %342 = and i32 %341, 31
  %343 = and i32 %340, 1023
  switch i32 %342, label %349 [
    i32 31, label %344
    i32 0, label %351
  ]

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0203.0.copyload.signext.i = sext i16 %.sroa.0203.0.copyload.i to i32
  %345 = and i32 %.sroa.0203.0.copyload.signext.i, -2147483648
  %.not697.i = icmp eq i32 %343, 0
  %346 = select i1 %.not697.i, i32 2139095040, i32 2143289344
  %347 = or disjoint i32 %346, %345
  %348 = bitcast i32 %347 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

349:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %350 = or disjoint i32 %343, 1024
  br label %351

351:                                              ; preds = %349, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %352 = phi i32 [ %350, %349 ], [ %343, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %353 = uitofp i32 %352 to float
  %.not682.i = icmp eq i32 %342, 0
  %354 = add nsw i32 %342, -25
  %355 = select i1 %.not682.i, i32 -24, i32 %354
  %356 = call float @__ocml_ldexp_f32(float noundef %353, i32 noundef %355) #5
  %357 = fneg contract float %356
  %.not683684.i = icmp slt i16 %.sroa.0203.0.copyload.i, 0
  %358 = select contract i1 %.not683684.i, float %357, float %356
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %351, %344
  %359 = phi float [ %348, %344 ], [ %358, %351 ]
  %360 = fmul contract float %314, %359
  %361 = fadd contract float %286, %360
  %362 = or disjoint i64 %135, 3
  %363 = add nuw nsw i64 %362, %124
  %364 = trunc i64 %363 to i32
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %364
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %365, align 2, !tbaa.struct !23
  %366 = shl nuw nsw i64 %362, 4
  %367 = add nsw i64 %366, %.decomposed742.i
  %368 = trunc i64 %367 to i32
  %369 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %368
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %369, align 2, !tbaa.struct !23
  %370 = zext i16 %.sroa.0194.0.copyload.i to i32
  %371 = lshr i32 %370, 10
  %372 = and i32 %371, 31
  %373 = and i32 %370, 1023
  switch i32 %372, label %379 [
    i32 31, label %374
    i32 0, label %381
  ]

374:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %375 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %373, 0
  %376 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %377 = or disjoint i32 %376, %375
  %378 = bitcast i32 %377 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

379:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %380 = or disjoint i32 %373, 1024
  br label %381

381:                                              ; preds = %379, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %382 = phi i32 [ %380, %379 ], [ %373, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %383 = uitofp i32 %382 to float
  %.not685.i = icmp eq i32 %372, 0
  %384 = add nsw i32 %372, -25
  %385 = select i1 %.not685.i, i32 -24, i32 %384
  %386 = call float @__ocml_ldexp_f32(float noundef %383, i32 noundef %385) #5
  %387 = fneg contract float %386
  %.not686687.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %388 = select contract i1 %.not686687.i, float %387, float %386
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %381, %374
  %389 = phi float [ %378, %374 ], [ %388, %381 ]
  %390 = zext i16 %.sroa.0185.0.copyload.i to i32
  %391 = lshr i32 %390, 10
  %392 = and i32 %391, 31
  %393 = and i32 %390, 1023
  switch i32 %392, label %399 [
    i32 31, label %394
    i32 0, label %401
  ]

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %395 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %393, 0
  %396 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %397 = or disjoint i32 %396, %395
  %398 = bitcast i32 %397 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

399:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %400 = or disjoint i32 %393, 1024
  br label %401

401:                                              ; preds = %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %402 = phi i32 [ %400, %399 ], [ %393, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %403 = uitofp i32 %402 to float
  %.not688.i = icmp eq i32 %392, 0
  %404 = add nsw i32 %392, -25
  %405 = select i1 %.not688.i, i32 -24, i32 %404
  %406 = call float @__ocml_ldexp_f32(float noundef %403, i32 noundef %405) #5
  %407 = fneg contract float %406
  %.not689690.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %408 = select contract i1 %.not689690.i, float %407, float %406
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %401, %394
  %409 = phi float [ %398, %394 ], [ %408, %401 ]
  %410 = fmul contract float %389, %409
  %411 = fadd contract float %336, %410
  %412 = add nuw nsw i64 %366, %123
  %413 = trunc i64 %412 to i32
  %414 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %413
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %414, align 2, !tbaa.struct !23
  %415 = zext i16 %.sroa.0176.0.copyload.i to i32
  %416 = lshr i32 %415, 10
  %417 = and i32 %416, 31
  %418 = and i32 %415, 1023
  switch i32 %417, label %424 [
    i32 31, label %419
    i32 0, label %426
  ]

419:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %420 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not694.i = icmp eq i32 %418, 0
  %421 = select i1 %.not694.i, i32 2139095040, i32 2143289344
  %422 = or disjoint i32 %421, %420
  %423 = bitcast i32 %422 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

424:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %425 = or disjoint i32 %418, 1024
  br label %426

426:                                              ; preds = %424, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %427 = phi i32 [ %425, %424 ], [ %418, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %428 = uitofp i32 %427 to float
  %.not691.i = icmp eq i32 %417, 0
  %429 = add nsw i32 %417, -25
  %430 = select i1 %.not691.i, i32 -24, i32 %429
  %431 = call float @__ocml_ldexp_f32(float noundef %428, i32 noundef %430) #5
  %432 = fneg contract float %431
  %.not692693.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %433 = select contract i1 %.not692693.i, float %432, float %431
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %426, %419
  %434 = phi float [ %423, %419 ], [ %433, %426 ]
  %435 = fmul contract float %389, %434
  %436 = fadd contract float %361, %435
  %437 = add nuw nsw i64 %135, 4
  %438 = icmp ult i64 %135, 28
  br i1 %438, label %134, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !36

439:                                              ; preds = %._crit_edge727.i
  %440 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %441 = icmp ult i64 %440, 4
  call void @llvm.assume(i1 %441)
  %442 = icmp eq i64 %440, 0
  br i1 %442, label %443, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

443:                                              ; preds = %439
  %444 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %445 = icmp ult i64 %444, 4
  call void @llvm.assume(i1 %445)
  %446 = icmp eq i64 %444, 0
  br i1 %446, label %.preheader713.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader713.i:                                  ; preds = %443
  %447 = sext i32 %3 to i64
  %448 = call i32 @llvm.amdgcn.groupstaticsize()
  %449 = inttoptr i32 %448 to ptr addrspace(3)
  %450 = sext i32 %114 to i64
  %451 = icmp sgt i32 %4, 0
  %452 = icmp ugt i32 %4, 1
  %453 = icmp ugt i32 %4, 2
  %454 = icmp ugt i32 %4, 3
  %455 = icmp ugt i32 %4, 4
  %456 = icmp ugt i32 %4, 5
  %457 = icmp ugt i32 %4, 6
  %458 = icmp ugt i32 %4, 7
  %459 = icmp ugt i32 %4, 8
  %460 = icmp ugt i32 %4, 9
  %461 = icmp ugt i32 %4, 10
  %462 = icmp ugt i32 %4, 11
  %463 = icmp ugt i32 %4, 12
  %464 = icmp ugt i32 %4, 13
  %465 = icmp ugt i32 %4, 14
  %466 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %.preheader713.i
  %467 = phi i64 [ 0, %.preheader713.i ], [ %473, %.split.us.i ]
  %468 = icmp slt i64 %467, %447
  %469 = shl i64 %467, 4
  %.tr658.i = trunc i64 %467 to i32
  %470 = shl i32 %.tr658.i, 4
  %471 = sext i32 %470 to i64
  %472 = add nsw i64 %471, %450
  %.fr.i = freeze i1 %468
  %brmerge.not.i = select i1 %.fr.i, i1 %451, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %562, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %473 = add nuw nsw i64 %467, 1
  %exitcond.not.i = icmp eq i64 %473, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %474 = trunc i64 %469 to i32
  %475 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !33
  %477 = getelementptr inbounds float, ptr %9, i64 %472
  store float %476, ptr %477, align 32, !tbaa !33
  br i1 %452, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %478 = trunc i64 %469 to i32
  %479 = or disjoint i32 %478, 1
  %480 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !33
  %482 = or disjoint i64 %472, 1
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 4, !tbaa !33
  br i1 %453, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %484 = trunc i64 %469 to i32
  %485 = or disjoint i32 %484, 2
  %486 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !33
  %488 = or disjoint i64 %472, 2
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 8, !tbaa !33
  br i1 %454, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %490 = trunc i64 %469 to i32
  %491 = or disjoint i32 %490, 3
  %492 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %491
  %493 = load float, ptr addrspace(3) %492, align 4, !tbaa !33
  %494 = or disjoint i64 %472, 3
  %495 = getelementptr inbounds float, ptr %9, i64 %494
  store float %493, ptr %495, align 4, !tbaa !33
  br i1 %455, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %496 = trunc i64 %469 to i32
  %497 = or disjoint i32 %496, 4
  %498 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %497
  %499 = load float, ptr addrspace(3) %498, align 4, !tbaa !33
  %500 = or disjoint i64 %472, 4
  %501 = getelementptr inbounds float, ptr %9, i64 %500
  store float %499, ptr %501, align 16, !tbaa !33
  br i1 %456, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %502 = trunc i64 %469 to i32
  %503 = or disjoint i32 %502, 5
  %504 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %503
  %505 = load float, ptr addrspace(3) %504, align 4, !tbaa !33
  %506 = or disjoint i64 %472, 5
  %507 = getelementptr inbounds float, ptr %9, i64 %506
  store float %505, ptr %507, align 4, !tbaa !33
  br i1 %457, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %508 = trunc i64 %469 to i32
  %509 = or disjoint i32 %508, 6
  %510 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %509
  %511 = load float, ptr addrspace(3) %510, align 4, !tbaa !33
  %512 = or disjoint i64 %472, 6
  %513 = getelementptr inbounds float, ptr %9, i64 %512
  store float %511, ptr %513, align 8, !tbaa !33
  br i1 %458, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %514 = trunc i64 %469 to i32
  %515 = or disjoint i32 %514, 7
  %516 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %515
  %517 = load float, ptr addrspace(3) %516, align 4, !tbaa !33
  %518 = or disjoint i64 %472, 7
  %519 = getelementptr inbounds float, ptr %9, i64 %518
  store float %517, ptr %519, align 4, !tbaa !33
  br i1 %459, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %520 = trunc i64 %469 to i32
  %521 = or disjoint i32 %520, 8
  %522 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %521
  %523 = load float, ptr addrspace(3) %522, align 4, !tbaa !33
  %524 = or disjoint i64 %472, 8
  %525 = getelementptr inbounds float, ptr %9, i64 %524
  store float %523, ptr %525, align 32, !tbaa !33
  br i1 %460, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %526 = trunc i64 %469 to i32
  %527 = or disjoint i32 %526, 9
  %528 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %527
  %529 = load float, ptr addrspace(3) %528, align 4, !tbaa !33
  %530 = or disjoint i64 %472, 9
  %531 = getelementptr inbounds float, ptr %9, i64 %530
  store float %529, ptr %531, align 4, !tbaa !33
  br i1 %461, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %532 = trunc i64 %469 to i32
  %533 = or disjoint i32 %532, 10
  %534 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %533
  %535 = load float, ptr addrspace(3) %534, align 4, !tbaa !33
  %536 = or disjoint i64 %472, 10
  %537 = getelementptr inbounds float, ptr %9, i64 %536
  store float %535, ptr %537, align 8, !tbaa !33
  br i1 %462, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %538 = trunc i64 %469 to i32
  %539 = or disjoint i32 %538, 11
  %540 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %539
  %541 = load float, ptr addrspace(3) %540, align 4, !tbaa !33
  %542 = or disjoint i64 %472, 11
  %543 = getelementptr inbounds float, ptr %9, i64 %542
  store float %541, ptr %543, align 4, !tbaa !33
  br i1 %463, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %544 = trunc i64 %469 to i32
  %545 = or disjoint i32 %544, 12
  %546 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %545
  %547 = load float, ptr addrspace(3) %546, align 4, !tbaa !33
  %548 = or disjoint i64 %472, 12
  %549 = getelementptr inbounds float, ptr %9, i64 %548
  store float %547, ptr %549, align 16, !tbaa !33
  br i1 %464, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %550 = trunc i64 %469 to i32
  %551 = or disjoint i32 %550, 13
  %552 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %551
  %553 = load float, ptr addrspace(3) %552, align 4, !tbaa !33
  %554 = or disjoint i64 %472, 13
  %555 = getelementptr inbounds float, ptr %9, i64 %554
  store float %553, ptr %555, align 4, !tbaa !33
  br i1 %465, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %556 = trunc i64 %469 to i32
  %557 = or disjoint i32 %556, 14
  %558 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %557
  %559 = load float, ptr addrspace(3) %558, align 4, !tbaa !33
  %560 = or disjoint i64 %472, 14
  %561 = getelementptr inbounds float, ptr %9, i64 %560
  store float %559, ptr %561, align 8, !tbaa !33
  br i1 %466, label %562, label %.split.us.i

562:                                              ; preds = %.preheader.split.15.i
  %563 = trunc i64 %469 to i32
  %564 = or disjoint i32 %563, 15
  %565 = getelementptr inbounds float, ptr addrspace(3) %449, i32 %564
  %566 = load float, ptr addrspace(3) %565, align 4, !tbaa !33
  %567 = or disjoint i64 %472, 15
  %568 = getelementptr inbounds float, ptr %9, i64 %567
  store float %566, ptr %568, align 4, !tbaa !33
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge727.i, %439, %443, %.split.us.i
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
!37 = distinct !{!37, !29}
;----------------- End AdaptiveCpp IR dump ---------------
