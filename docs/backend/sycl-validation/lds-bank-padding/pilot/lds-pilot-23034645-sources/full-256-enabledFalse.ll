;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-2mt9381v/kernel.cpp"
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
  %36 = shl i32 %.tr.i, 12
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 8192
  %43 = and i64 %34, 63
  %44 = icmp slt i64 %43, %38
  br label %60

.lr.ph1040.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = shl i32 %.tr.i, 11
  %46 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %49 = icmp eq i64 %48, 0
  call void @llvm.assume(i1 %49)
  %50 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %51 = icmp ult i64 %50, 256
  call void @llvm.assume(i1 %51)
  %52 = sext i32 %5 to i64
  %53 = sext i32 %4 to i64
  %54 = sext i32 %45 to i64
  %55 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %56 = inttoptr i32 %55 to ptr addrspace(3)
  %57 = getelementptr inbounds i8, ptr addrspace(3) %56, i32 16384
  %58 = and i64 %50, 31
  %59 = icmp slt i64 %58, %53
  br label %88

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %72, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i ]
  %62 = lshr i64 %61, 6
  %63 = icmp slt i64 %62, %37
  %64 = and i1 %63, %44
  br i1 %64, label %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i

65:                                               ; preds = %60
  %66 = and i64 %61, 9223372036854775744
  %67 = or disjoint i64 %66, %39
  %68 = or disjoint i64 %67, %43
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0393.0.copyload.i = load i16, ptr %69, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i: ; preds = %65, %60
  %.sroa.0395.1.i = phi i16 [ %.sroa.0393.0.copyload.i, %65 ], [ 0, %60 ]
  %70 = trunc i64 %61 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %70
  store i16 %.sroa.0395.1.i, ptr addrspace(3) %71, align 2, !tbaa.struct !19
  %72 = add nuw nsw i64 %61, 256
  %73 = icmp ult i64 %61, 3840
  br i1 %73, label %60, label %.lr.ph1040.i, !llvm.loop !24

.lr.ph1043.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %80 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %81 = inttoptr i32 %80 to ptr addrspace(3)
  %82 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 8192
  %83 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 16384
  %84 = and i64 %78, 7
  %85 = or disjoint i64 %84, 8
  %86 = or disjoint i64 %84, 16
  %87 = or disjoint i64 %84, 24
  br label %115

88:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1040.i
  %89 = phi i64 [ %50, %.lr.ph1040.i ], [ %100, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %90 = lshr i64 %89, 5
  %91 = icmp slt i64 %90, %52
  %92 = and i1 %91, %59
  br i1 %92, label %93, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

93:                                               ; preds = %88
  %94 = and i64 %89, 9223372036854775776
  %95 = or disjoint i64 %94, %54
  %96 = or disjoint i64 %95, %58
  %97 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %96
  %.sroa.0378.0.copyload.i = load i16, ptr %97, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %93, %88
  %.sroa.0380.1.i = phi i16 [ %.sroa.0378.0.copyload.i, %93 ], [ 0, %88 ]
  %98 = trunc i64 %89 to i32
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %98
  store i16 %.sroa.0380.1.i, ptr addrspace(3) %99, align 2, !tbaa.struct !19
  %100 = add nuw nsw i64 %89, 256
  %101 = icmp ult i64 %89, 1792
  br i1 %101, label %88, label %.lr.ph1043.i, !llvm.loop !28

.lr.ph1046.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %103 = icmp eq i64 %102, 0
  call void @llvm.assume(i1 %103)
  %104 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %105 = icmp eq i64 %104, 0
  call void @llvm.assume(i1 %105)
  %106 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %107 = icmp ult i64 %106, 256
  call void @llvm.assume(i1 %107)
  %108 = sext i32 %3 to i64
  %109 = sext i32 %4 to i64
  %110 = call i32 @llvm.amdgcn.groupstaticsize()
  %111 = inttoptr i32 %110 to ptr addrspace(3)
  %112 = sext i32 %45 to i64
  %113 = and i64 %106, 31
  %114 = icmp slt i64 %113, %109
  br label %641

115:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph1043.i
  %116 = phi i64 [ %78, %.lr.ph1043.i ], [ %132, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %117 = lshr i64 %116, 3
  %118 = shl nuw nsw i64 %117, 6
  br label %134

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %119 = shl nuw nsw i64 %117, 5
  %120 = or disjoint i64 %119, %84
  %121 = trunc i64 %120 to i32
  %122 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %121
  store float %563, ptr addrspace(3) %122, align 4, !tbaa !29
  %123 = or disjoint i64 %119, %85
  %124 = trunc i64 %123 to i32
  %125 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %124
  store float %588, ptr addrspace(3) %125, align 4, !tbaa !29
  %126 = or disjoint i64 %119, %86
  %127 = trunc i64 %126 to i32
  %128 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %127
  store float %613, ptr addrspace(3) %128, align 4, !tbaa !29
  %129 = or disjoint i64 %119, %87
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds float, ptr addrspace(3) %81, i32 %130
  store float %638, ptr addrspace(3) %131, align 4, !tbaa !29
  %132 = add nuw nsw i64 %116, 256
  %133 = icmp ult i64 %116, 256
  br i1 %133, label %115, label %.lr.ph1046.i, !llvm.loop !31

134:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %115
  %135 = phi i64 [ 0, %115 ], [ %639, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %136 = phi float [ 0.000000e+00, %115 ], [ %638, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %137 = phi float [ 0.000000e+00, %115 ], [ %613, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %138 = phi float [ 0.000000e+00, %115 ], [ %588, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %139 = phi float [ 0.000000e+00, %115 ], [ %563, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %140 = add nuw nsw i64 %135, %118
  %141 = trunc i64 %140 to i32
  %142 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %141
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %142, align 2, !tbaa.struct !19
  %143 = shl nuw nsw i64 %135, 5
  %144 = or disjoint i64 %143, %84
  %145 = trunc i64 %144 to i32
  %146 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %145
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %146, align 2, !tbaa.struct !19
  %147 = zext i16 %.sroa.0363.0.copyload.i to i32
  %148 = lshr i32 %147, 10
  %149 = and i32 %148, 31
  %150 = and i32 %147, 1023
  switch i32 %149, label %156 [
    i32 31, label %151
    i32 0, label %158
  ]

151:                                              ; preds = %134
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %152 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1025.i = icmp eq i32 %150, 0
  %153 = select i1 %.not1025.i, i32 2139095040, i32 2143289344
  %154 = or disjoint i32 %153, %152
  %155 = bitcast i32 %154 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

156:                                              ; preds = %134
  %157 = or disjoint i32 %150, 1024
  br label %158

158:                                              ; preds = %156, %134
  %159 = phi i32 [ %157, %156 ], [ %150, %134 ]
  %160 = uitofp i32 %159 to float
  %.not.i = icmp eq i32 %149, 0
  %161 = add nsw i32 %149, -25
  %162 = select i1 %.not.i, i32 -24, i32 %161
  %163 = call float @__ocml_ldexp_f32(float noundef %160, i32 noundef %162) #5
  %164 = fneg contract float %163
  %.not947948.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %165 = select contract i1 %.not947948.i, float %164, float %163
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %158, %151
  %166 = phi float [ %155, %151 ], [ %165, %158 ]
  %167 = zext i16 %.sroa.0354.0.copyload.i to i32
  %168 = lshr i32 %167, 10
  %169 = and i32 %168, 31
  %170 = and i32 %167, 1023
  switch i32 %169, label %176 [
    i32 31, label %171
    i32 0, label %178
  ]

171:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %172 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1024.i = icmp eq i32 %170, 0
  %173 = select i1 %.not1024.i, i32 2139095040, i32 2143289344
  %174 = or disjoint i32 %173, %172
  %175 = bitcast i32 %174 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

176:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %177 = or disjoint i32 %170, 1024
  br label %178

178:                                              ; preds = %176, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %179 = phi i32 [ %177, %176 ], [ %170, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %180 = uitofp i32 %179 to float
  %.not949.i = icmp eq i32 %169, 0
  %181 = add nsw i32 %169, -25
  %182 = select i1 %.not949.i, i32 -24, i32 %181
  %183 = call float @__ocml_ldexp_f32(float noundef %180, i32 noundef %182) #5
  %184 = fneg contract float %183
  %.not950951.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %185 = select contract i1 %.not950951.i, float %184, float %183
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %178, %171
  %186 = phi float [ %175, %171 ], [ %185, %178 ]
  %187 = fmul contract float %166, %186
  %188 = fadd contract float %139, %187
  %189 = or disjoint i64 %143, %85
  %190 = trunc i64 %189 to i32
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %190
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %191, align 2, !tbaa.struct !19
  %192 = zext i16 %.sroa.0345.0.copyload.i to i32
  %193 = lshr i32 %192, 10
  %194 = and i32 %193, 31
  %195 = and i32 %192, 1023
  switch i32 %194, label %201 [
    i32 31, label %196
    i32 0, label %203
  ]

196:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %197 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1023.i = icmp eq i32 %195, 0
  %198 = select i1 %.not1023.i, i32 2139095040, i32 2143289344
  %199 = or disjoint i32 %198, %197
  %200 = bitcast i32 %199 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

201:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %202 = or disjoint i32 %195, 1024
  br label %203

203:                                              ; preds = %201, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %204 = phi i32 [ %202, %201 ], [ %195, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %205 = uitofp i32 %204 to float
  %.not952.i = icmp eq i32 %194, 0
  %206 = add nsw i32 %194, -25
  %207 = select i1 %.not952.i, i32 -24, i32 %206
  %208 = call float @__ocml_ldexp_f32(float noundef %205, i32 noundef %207) #5
  %209 = fneg contract float %208
  %.not953954.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %210 = select contract i1 %.not953954.i, float %209, float %208
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %203, %196
  %211 = phi float [ %200, %196 ], [ %210, %203 ]
  %212 = fmul contract float %166, %211
  %213 = fadd contract float %138, %212
  %214 = or disjoint i64 %143, %86
  %215 = trunc i64 %214 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %215
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %216, align 2, !tbaa.struct !19
  %217 = zext i16 %.sroa.0336.0.copyload.i to i32
  %218 = lshr i32 %217, 10
  %219 = and i32 %218, 31
  %220 = and i32 %217, 1023
  switch i32 %219, label %226 [
    i32 31, label %221
    i32 0, label %228
  ]

221:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %222 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1022.i = icmp eq i32 %220, 0
  %223 = select i1 %.not1022.i, i32 2139095040, i32 2143289344
  %224 = or disjoint i32 %223, %222
  %225 = bitcast i32 %224 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

226:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %227 = or disjoint i32 %220, 1024
  br label %228

228:                                              ; preds = %226, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %229 = phi i32 [ %227, %226 ], [ %220, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %230 = uitofp i32 %229 to float
  %.not955.i = icmp eq i32 %219, 0
  %231 = add nsw i32 %219, -25
  %232 = select i1 %.not955.i, i32 -24, i32 %231
  %233 = call float @__ocml_ldexp_f32(float noundef %230, i32 noundef %232) #5
  %234 = fneg contract float %233
  %.not956957.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %235 = select contract i1 %.not956957.i, float %234, float %233
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %228, %221
  %236 = phi float [ %225, %221 ], [ %235, %228 ]
  %237 = fmul contract float %166, %236
  %238 = fadd contract float %137, %237
  %239 = or disjoint i64 %143, %87
  %240 = trunc i64 %239 to i32
  %241 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %240
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %241, align 2, !tbaa.struct !19
  %242 = zext i16 %.sroa.0327.0.copyload.i to i32
  %243 = lshr i32 %242, 10
  %244 = and i32 %243, 31
  %245 = and i32 %242, 1023
  switch i32 %244, label %251 [
    i32 31, label %246
    i32 0, label %253
  ]

246:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %247 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1021.i = icmp eq i32 %245, 0
  %248 = select i1 %.not1021.i, i32 2139095040, i32 2143289344
  %249 = or disjoint i32 %248, %247
  %250 = bitcast i32 %249 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

251:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %252 = or disjoint i32 %245, 1024
  br label %253

253:                                              ; preds = %251, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %254 = phi i32 [ %252, %251 ], [ %245, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %255 = uitofp i32 %254 to float
  %.not958.i = icmp eq i32 %244, 0
  %256 = add nsw i32 %244, -25
  %257 = select i1 %.not958.i, i32 -24, i32 %256
  %258 = call float @__ocml_ldexp_f32(float noundef %255, i32 noundef %257) #5
  %259 = fneg contract float %258
  %.not959960.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %260 = select contract i1 %.not959960.i, float %259, float %258
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %253, %246
  %261 = phi float [ %250, %246 ], [ %260, %253 ]
  %262 = fmul contract float %166, %261
  %263 = fadd contract float %136, %262
  %264 = or disjoint i64 %135, 1
  %265 = add nuw nsw i64 %264, %118
  %266 = trunc i64 %265 to i32
  %267 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %266
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %267, align 2, !tbaa.struct !19
  %268 = shl nuw nsw i64 %264, 5
  %269 = or disjoint i64 %268, %84
  %270 = trunc i64 %269 to i32
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %270
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %271, align 2, !tbaa.struct !19
  %272 = zext i16 %.sroa.0318.0.copyload.i to i32
  %273 = lshr i32 %272, 10
  %274 = and i32 %273, 31
  %275 = and i32 %272, 1023
  switch i32 %274, label %281 [
    i32 31, label %276
    i32 0, label %283
  ]

276:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %277 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1020.i = icmp eq i32 %275, 0
  %278 = select i1 %.not1020.i, i32 2139095040, i32 2143289344
  %279 = or disjoint i32 %278, %277
  %280 = bitcast i32 %279 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

281:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %282 = or disjoint i32 %275, 1024
  br label %283

283:                                              ; preds = %281, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %284 = phi i32 [ %282, %281 ], [ %275, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %285 = uitofp i32 %284 to float
  %.not961.i = icmp eq i32 %274, 0
  %286 = add nsw i32 %274, -25
  %287 = select i1 %.not961.i, i32 -24, i32 %286
  %288 = call float @__ocml_ldexp_f32(float noundef %285, i32 noundef %287) #5
  %289 = fneg contract float %288
  %.not962963.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %290 = select contract i1 %.not962963.i, float %289, float %288
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %283, %276
  %291 = phi float [ %280, %276 ], [ %290, %283 ]
  %292 = zext i16 %.sroa.0309.0.copyload.i to i32
  %293 = lshr i32 %292, 10
  %294 = and i32 %293, 31
  %295 = and i32 %292, 1023
  switch i32 %294, label %301 [
    i32 31, label %296
    i32 0, label %303
  ]

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %297 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1019.i = icmp eq i32 %295, 0
  %298 = select i1 %.not1019.i, i32 2139095040, i32 2143289344
  %299 = or disjoint i32 %298, %297
  %300 = bitcast i32 %299 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

301:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %302 = or disjoint i32 %295, 1024
  br label %303

303:                                              ; preds = %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %304 = phi i32 [ %302, %301 ], [ %295, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %305 = uitofp i32 %304 to float
  %.not964.i = icmp eq i32 %294, 0
  %306 = add nsw i32 %294, -25
  %307 = select i1 %.not964.i, i32 -24, i32 %306
  %308 = call float @__ocml_ldexp_f32(float noundef %305, i32 noundef %307) #5
  %309 = fneg contract float %308
  %.not965966.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %310 = select contract i1 %.not965966.i, float %309, float %308
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %303, %296
  %311 = phi float [ %300, %296 ], [ %310, %303 ]
  %312 = fmul contract float %291, %311
  %313 = fadd contract float %188, %312
  %314 = or disjoint i64 %268, %85
  %315 = trunc i64 %314 to i32
  %316 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %315
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %316, align 2, !tbaa.struct !19
  %317 = zext i16 %.sroa.0300.0.copyload.i to i32
  %318 = lshr i32 %317, 10
  %319 = and i32 %318, 31
  %320 = and i32 %317, 1023
  switch i32 %319, label %326 [
    i32 31, label %321
    i32 0, label %328
  ]

321:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %322 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1018.i = icmp eq i32 %320, 0
  %323 = select i1 %.not1018.i, i32 2139095040, i32 2143289344
  %324 = or disjoint i32 %323, %322
  %325 = bitcast i32 %324 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

326:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %327 = or disjoint i32 %320, 1024
  br label %328

328:                                              ; preds = %326, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %329 = phi i32 [ %327, %326 ], [ %320, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %330 = uitofp i32 %329 to float
  %.not967.i = icmp eq i32 %319, 0
  %331 = add nsw i32 %319, -25
  %332 = select i1 %.not967.i, i32 -24, i32 %331
  %333 = call float @__ocml_ldexp_f32(float noundef %330, i32 noundef %332) #5
  %334 = fneg contract float %333
  %.not968969.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %335 = select contract i1 %.not968969.i, float %334, float %333
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %328, %321
  %336 = phi float [ %325, %321 ], [ %335, %328 ]
  %337 = fmul contract float %291, %336
  %338 = fadd contract float %213, %337
  %339 = or disjoint i64 %268, %86
  %340 = trunc i64 %339 to i32
  %341 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %340
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %341, align 2, !tbaa.struct !19
  %342 = zext i16 %.sroa.0291.0.copyload.i to i32
  %343 = lshr i32 %342, 10
  %344 = and i32 %343, 31
  %345 = and i32 %342, 1023
  switch i32 %344, label %351 [
    i32 31, label %346
    i32 0, label %353
  ]

346:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %347 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1017.i = icmp eq i32 %345, 0
  %348 = select i1 %.not1017.i, i32 2139095040, i32 2143289344
  %349 = or disjoint i32 %348, %347
  %350 = bitcast i32 %349 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

351:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %352 = or disjoint i32 %345, 1024
  br label %353

353:                                              ; preds = %351, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %354 = phi i32 [ %352, %351 ], [ %345, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %355 = uitofp i32 %354 to float
  %.not970.i = icmp eq i32 %344, 0
  %356 = add nsw i32 %344, -25
  %357 = select i1 %.not970.i, i32 -24, i32 %356
  %358 = call float @__ocml_ldexp_f32(float noundef %355, i32 noundef %357) #5
  %359 = fneg contract float %358
  %.not971972.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %360 = select contract i1 %.not971972.i, float %359, float %358
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %353, %346
  %361 = phi float [ %350, %346 ], [ %360, %353 ]
  %362 = fmul contract float %291, %361
  %363 = fadd contract float %238, %362
  %364 = or disjoint i64 %268, %87
  %365 = trunc i64 %364 to i32
  %366 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %365
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %366, align 2, !tbaa.struct !19
  %367 = zext i16 %.sroa.0282.0.copyload.i to i32
  %368 = lshr i32 %367, 10
  %369 = and i32 %368, 31
  %370 = and i32 %367, 1023
  switch i32 %369, label %376 [
    i32 31, label %371
    i32 0, label %378
  ]

371:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %372 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1016.i = icmp eq i32 %370, 0
  %373 = select i1 %.not1016.i, i32 2139095040, i32 2143289344
  %374 = or disjoint i32 %373, %372
  %375 = bitcast i32 %374 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

376:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %377 = or disjoint i32 %370, 1024
  br label %378

378:                                              ; preds = %376, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %379 = phi i32 [ %377, %376 ], [ %370, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %380 = uitofp i32 %379 to float
  %.not973.i = icmp eq i32 %369, 0
  %381 = add nsw i32 %369, -25
  %382 = select i1 %.not973.i, i32 -24, i32 %381
  %383 = call float @__ocml_ldexp_f32(float noundef %380, i32 noundef %382) #5
  %384 = fneg contract float %383
  %.not974975.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %385 = select contract i1 %.not974975.i, float %384, float %383
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %378, %371
  %386 = phi float [ %375, %371 ], [ %385, %378 ]
  %387 = fmul contract float %291, %386
  %388 = fadd contract float %263, %387
  %389 = or disjoint i64 %135, 2
  %390 = add nuw nsw i64 %389, %118
  %391 = trunc i64 %390 to i32
  %392 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %391
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %392, align 2, !tbaa.struct !19
  %393 = shl nuw nsw i64 %389, 5
  %394 = or disjoint i64 %393, %84
  %395 = trunc i64 %394 to i32
  %396 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %395
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %396, align 2, !tbaa.struct !19
  %397 = zext i16 %.sroa.0273.0.copyload.i to i32
  %398 = lshr i32 %397, 10
  %399 = and i32 %398, 31
  %400 = and i32 %397, 1023
  switch i32 %399, label %406 [
    i32 31, label %401
    i32 0, label %408
  ]

401:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %402 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1015.i = icmp eq i32 %400, 0
  %403 = select i1 %.not1015.i, i32 2139095040, i32 2143289344
  %404 = or disjoint i32 %403, %402
  %405 = bitcast i32 %404 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

406:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %407 = or disjoint i32 %400, 1024
  br label %408

408:                                              ; preds = %406, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %409 = phi i32 [ %407, %406 ], [ %400, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %410 = uitofp i32 %409 to float
  %.not976.i = icmp eq i32 %399, 0
  %411 = add nsw i32 %399, -25
  %412 = select i1 %.not976.i, i32 -24, i32 %411
  %413 = call float @__ocml_ldexp_f32(float noundef %410, i32 noundef %412) #5
  %414 = fneg contract float %413
  %.not977978.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %415 = select contract i1 %.not977978.i, float %414, float %413
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %408, %401
  %416 = phi float [ %405, %401 ], [ %415, %408 ]
  %417 = zext i16 %.sroa.0264.0.copyload.i to i32
  %418 = lshr i32 %417, 10
  %419 = and i32 %418, 31
  %420 = and i32 %417, 1023
  switch i32 %419, label %426 [
    i32 31, label %421
    i32 0, label %428
  ]

421:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %422 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1014.i = icmp eq i32 %420, 0
  %423 = select i1 %.not1014.i, i32 2139095040, i32 2143289344
  %424 = or disjoint i32 %423, %422
  %425 = bitcast i32 %424 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

426:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %427 = or disjoint i32 %420, 1024
  br label %428

428:                                              ; preds = %426, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %429 = phi i32 [ %427, %426 ], [ %420, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %430 = uitofp i32 %429 to float
  %.not979.i = icmp eq i32 %419, 0
  %431 = add nsw i32 %419, -25
  %432 = select i1 %.not979.i, i32 -24, i32 %431
  %433 = call float @__ocml_ldexp_f32(float noundef %430, i32 noundef %432) #5
  %434 = fneg contract float %433
  %.not980981.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %435 = select contract i1 %.not980981.i, float %434, float %433
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %428, %421
  %436 = phi float [ %425, %421 ], [ %435, %428 ]
  %437 = fmul contract float %416, %436
  %438 = fadd contract float %313, %437
  %439 = or disjoint i64 %393, %85
  %440 = trunc i64 %439 to i32
  %441 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %440
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %441, align 2, !tbaa.struct !19
  %442 = zext i16 %.sroa.0255.0.copyload.i to i32
  %443 = lshr i32 %442, 10
  %444 = and i32 %443, 31
  %445 = and i32 %442, 1023
  switch i32 %444, label %451 [
    i32 31, label %446
    i32 0, label %453
  ]

446:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %447 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1013.i = icmp eq i32 %445, 0
  %448 = select i1 %.not1013.i, i32 2139095040, i32 2143289344
  %449 = or disjoint i32 %448, %447
  %450 = bitcast i32 %449 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

451:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %452 = or disjoint i32 %445, 1024
  br label %453

453:                                              ; preds = %451, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %454 = phi i32 [ %452, %451 ], [ %445, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %455 = uitofp i32 %454 to float
  %.not982.i = icmp eq i32 %444, 0
  %456 = add nsw i32 %444, -25
  %457 = select i1 %.not982.i, i32 -24, i32 %456
  %458 = call float @__ocml_ldexp_f32(float noundef %455, i32 noundef %457) #5
  %459 = fneg contract float %458
  %.not983984.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %460 = select contract i1 %.not983984.i, float %459, float %458
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %453, %446
  %461 = phi float [ %450, %446 ], [ %460, %453 ]
  %462 = fmul contract float %416, %461
  %463 = fadd contract float %338, %462
  %464 = or disjoint i64 %393, %86
  %465 = trunc i64 %464 to i32
  %466 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %465
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %466, align 2, !tbaa.struct !19
  %467 = zext i16 %.sroa.0246.0.copyload.i to i32
  %468 = lshr i32 %467, 10
  %469 = and i32 %468, 31
  %470 = and i32 %467, 1023
  switch i32 %469, label %476 [
    i32 31, label %471
    i32 0, label %478
  ]

471:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %472 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1012.i = icmp eq i32 %470, 0
  %473 = select i1 %.not1012.i, i32 2139095040, i32 2143289344
  %474 = or disjoint i32 %473, %472
  %475 = bitcast i32 %474 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

476:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %477 = or disjoint i32 %470, 1024
  br label %478

478:                                              ; preds = %476, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %479 = phi i32 [ %477, %476 ], [ %470, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %480 = uitofp i32 %479 to float
  %.not985.i = icmp eq i32 %469, 0
  %481 = add nsw i32 %469, -25
  %482 = select i1 %.not985.i, i32 -24, i32 %481
  %483 = call float @__ocml_ldexp_f32(float noundef %480, i32 noundef %482) #5
  %484 = fneg contract float %483
  %.not986987.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %485 = select contract i1 %.not986987.i, float %484, float %483
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %478, %471
  %486 = phi float [ %475, %471 ], [ %485, %478 ]
  %487 = fmul contract float %416, %486
  %488 = fadd contract float %363, %487
  %489 = or disjoint i64 %393, %87
  %490 = trunc i64 %489 to i32
  %491 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %490
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %491, align 2, !tbaa.struct !19
  %492 = zext i16 %.sroa.0237.0.copyload.i to i32
  %493 = lshr i32 %492, 10
  %494 = and i32 %493, 31
  %495 = and i32 %492, 1023
  switch i32 %494, label %501 [
    i32 31, label %496
    i32 0, label %503
  ]

496:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %497 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1011.i = icmp eq i32 %495, 0
  %498 = select i1 %.not1011.i, i32 2139095040, i32 2143289344
  %499 = or disjoint i32 %498, %497
  %500 = bitcast i32 %499 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

501:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %502 = or disjoint i32 %495, 1024
  br label %503

503:                                              ; preds = %501, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %504 = phi i32 [ %502, %501 ], [ %495, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %505 = uitofp i32 %504 to float
  %.not988.i = icmp eq i32 %494, 0
  %506 = add nsw i32 %494, -25
  %507 = select i1 %.not988.i, i32 -24, i32 %506
  %508 = call float @__ocml_ldexp_f32(float noundef %505, i32 noundef %507) #5
  %509 = fneg contract float %508
  %.not989990.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %510 = select contract i1 %.not989990.i, float %509, float %508
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %503, %496
  %511 = phi float [ %500, %496 ], [ %510, %503 ]
  %512 = fmul contract float %416, %511
  %513 = fadd contract float %388, %512
  %514 = or disjoint i64 %135, 3
  %515 = add nuw nsw i64 %514, %118
  %516 = trunc i64 %515 to i32
  %517 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %516
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %517, align 2, !tbaa.struct !19
  %518 = shl nuw nsw i64 %514, 5
  %519 = or disjoint i64 %518, %84
  %520 = trunc i64 %519 to i32
  %521 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %520
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %521, align 2, !tbaa.struct !19
  %522 = zext i16 %.sroa.0228.0.copyload.i to i32
  %523 = lshr i32 %522, 10
  %524 = and i32 %523, 31
  %525 = and i32 %522, 1023
  switch i32 %524, label %531 [
    i32 31, label %526
    i32 0, label %533
  ]

526:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %527 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1010.i = icmp eq i32 %525, 0
  %528 = select i1 %.not1010.i, i32 2139095040, i32 2143289344
  %529 = or disjoint i32 %528, %527
  %530 = bitcast i32 %529 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

531:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %532 = or disjoint i32 %525, 1024
  br label %533

533:                                              ; preds = %531, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %534 = phi i32 [ %532, %531 ], [ %525, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %535 = uitofp i32 %534 to float
  %.not991.i = icmp eq i32 %524, 0
  %536 = add nsw i32 %524, -25
  %537 = select i1 %.not991.i, i32 -24, i32 %536
  %538 = call float @__ocml_ldexp_f32(float noundef %535, i32 noundef %537) #5
  %539 = fneg contract float %538
  %.not992993.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %540 = select contract i1 %.not992993.i, float %539, float %538
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %533, %526
  %541 = phi float [ %530, %526 ], [ %540, %533 ]
  %542 = zext i16 %.sroa.0219.0.copyload.i to i32
  %543 = lshr i32 %542, 10
  %544 = and i32 %543, 31
  %545 = and i32 %542, 1023
  switch i32 %544, label %551 [
    i32 31, label %546
    i32 0, label %553
  ]

546:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %547 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1009.i = icmp eq i32 %545, 0
  %548 = select i1 %.not1009.i, i32 2139095040, i32 2143289344
  %549 = or disjoint i32 %548, %547
  %550 = bitcast i32 %549 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

551:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %552 = or disjoint i32 %545, 1024
  br label %553

553:                                              ; preds = %551, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %554 = phi i32 [ %552, %551 ], [ %545, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %555 = uitofp i32 %554 to float
  %.not994.i = icmp eq i32 %544, 0
  %556 = add nsw i32 %544, -25
  %557 = select i1 %.not994.i, i32 -24, i32 %556
  %558 = call float @__ocml_ldexp_f32(float noundef %555, i32 noundef %557) #5
  %559 = fneg contract float %558
  %.not995996.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %560 = select contract i1 %.not995996.i, float %559, float %558
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %553, %546
  %561 = phi float [ %550, %546 ], [ %560, %553 ]
  %562 = fmul contract float %541, %561
  %563 = fadd contract float %438, %562
  %564 = or disjoint i64 %518, %85
  %565 = trunc i64 %564 to i32
  %566 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %565
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %566, align 2, !tbaa.struct !19
  %567 = zext i16 %.sroa.0210.0.copyload.i to i32
  %568 = lshr i32 %567, 10
  %569 = and i32 %568, 31
  %570 = and i32 %567, 1023
  switch i32 %569, label %576 [
    i32 31, label %571
    i32 0, label %578
  ]

571:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %572 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1008.i = icmp eq i32 %570, 0
  %573 = select i1 %.not1008.i, i32 2139095040, i32 2143289344
  %574 = or disjoint i32 %573, %572
  %575 = bitcast i32 %574 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

576:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %577 = or disjoint i32 %570, 1024
  br label %578

578:                                              ; preds = %576, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %579 = phi i32 [ %577, %576 ], [ %570, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %580 = uitofp i32 %579 to float
  %.not997.i = icmp eq i32 %569, 0
  %581 = add nsw i32 %569, -25
  %582 = select i1 %.not997.i, i32 -24, i32 %581
  %583 = call float @__ocml_ldexp_f32(float noundef %580, i32 noundef %582) #5
  %584 = fneg contract float %583
  %.not998999.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %585 = select contract i1 %.not998999.i, float %584, float %583
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %578, %571
  %586 = phi float [ %575, %571 ], [ %585, %578 ]
  %587 = fmul contract float %541, %586
  %588 = fadd contract float %463, %587
  %589 = or disjoint i64 %518, %86
  %590 = trunc i64 %589 to i32
  %591 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %590
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %591, align 2, !tbaa.struct !19
  %592 = zext i16 %.sroa.0201.0.copyload.i to i32
  %593 = lshr i32 %592, 10
  %594 = and i32 %593, 31
  %595 = and i32 %592, 1023
  switch i32 %594, label %601 [
    i32 31, label %596
    i32 0, label %603
  ]

596:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %597 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1007.i = icmp eq i32 %595, 0
  %598 = select i1 %.not1007.i, i32 2139095040, i32 2143289344
  %599 = or disjoint i32 %598, %597
  %600 = bitcast i32 %599 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

601:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %602 = or disjoint i32 %595, 1024
  br label %603

603:                                              ; preds = %601, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %604 = phi i32 [ %602, %601 ], [ %595, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %605 = uitofp i32 %604 to float
  %.not1000.i = icmp eq i32 %594, 0
  %606 = add nsw i32 %594, -25
  %607 = select i1 %.not1000.i, i32 -24, i32 %606
  %608 = call float @__ocml_ldexp_f32(float noundef %605, i32 noundef %607) #5
  %609 = fneg contract float %608
  %.not10011002.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %610 = select contract i1 %.not10011002.i, float %609, float %608
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %603, %596
  %611 = phi float [ %600, %596 ], [ %610, %603 ]
  %612 = fmul contract float %541, %611
  %613 = fadd contract float %488, %612
  %614 = or disjoint i64 %518, %87
  %615 = trunc i64 %614 to i32
  %616 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %615
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %616, align 2, !tbaa.struct !19
  %617 = zext i16 %.sroa.0192.0.copyload.i to i32
  %618 = lshr i32 %617, 10
  %619 = and i32 %618, 31
  %620 = and i32 %617, 1023
  switch i32 %619, label %626 [
    i32 31, label %621
    i32 0, label %628
  ]

621:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %622 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1006.i = icmp eq i32 %620, 0
  %623 = select i1 %.not1006.i, i32 2139095040, i32 2143289344
  %624 = or disjoint i32 %623, %622
  %625 = bitcast i32 %624 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

626:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %627 = or disjoint i32 %620, 1024
  br label %628

628:                                              ; preds = %626, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %629 = phi i32 [ %627, %626 ], [ %620, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %630 = uitofp i32 %629 to float
  %.not1003.i = icmp eq i32 %619, 0
  %631 = add nsw i32 %619, -25
  %632 = select i1 %.not1003.i, i32 -24, i32 %631
  %633 = call float @__ocml_ldexp_f32(float noundef %630, i32 noundef %632) #5
  %634 = fneg contract float %633
  %.not10041005.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %635 = select contract i1 %.not10041005.i, float %634, float %633
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %628, %621
  %636 = phi float [ %625, %621 ], [ %635, %628 ]
  %637 = fmul contract float %541, %636
  %638 = fadd contract float %513, %637
  %639 = add nuw nsw i64 %135, 4
  %640 = icmp ult i64 %135, 60
  br i1 %640, label %134, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

641:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1046.i
  %642 = phi i64 [ %106, %.lr.ph1046.i ], [ %654, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %643 = lshr i64 %642, 5
  %644 = icmp slt i64 %643, %108
  %645 = and i1 %644, %114
  br i1 %645, label %646, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

646:                                              ; preds = %641
  %647 = trunc i64 %642 to i32
  %648 = getelementptr inbounds float, ptr addrspace(3) %111, i32 %647
  %649 = load float, ptr addrspace(3) %648, align 4, !tbaa !29
  %650 = and i64 %642, 9223372036854775776
  %651 = or disjoint i64 %650, %112
  %652 = or disjoint i64 %651, %113
  %653 = getelementptr inbounds float, ptr %9, i64 %652
  store float %649, ptr %653, align 4, !tbaa !29
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %646, %641
  %654 = add nuw nsw i64 %642, 256
  %655 = icmp ult i64 %642, 1792
  br i1 %655, label %641, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !33

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
!33 = distinct !{!33, !25}
;----------------- End AdaptiveCpp IR dump ---------------
