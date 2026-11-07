;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-8pvvt0d6/kernel.cpp"
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
  %36 = shl i32 %.tr.i, 12
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 8192
  %43 = icmp slt i64 %34, %38
  br label %59

.lr.ph1040.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = shl i32 %.tr.i, 11
  %45 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %50 = icmp ult i64 %49, 64
  call void @llvm.assume(i1 %50)
  %51 = sext i32 %5 to i64
  %52 = sext i32 %4 to i64
  %53 = sext i32 %44 to i64
  %54 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %55 = inttoptr i32 %54 to ptr addrspace(3)
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 16640
  %57 = and i64 %49, 31
  %58 = icmp slt i64 %57, %52
  br label %89

59:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i, %6
  %60 = phi i64 [ %34, %6 ], [ %73, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i ]
  %61 = lshr i64 %60, 6
  %62 = icmp slt i64 %61, %37
  %63 = and i1 %62, %43
  br i1 %63, label %64, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i

64:                                               ; preds = %59
  %65 = and i64 %60, 9223372036854775744
  %66 = or disjoint i64 %65, %39
  %67 = or disjoint i64 %66, %34
  %68 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %67
  %.sroa.0393.0.copyload.i = load i16, ptr %68, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i: ; preds = %64, %59
  %.sroa.0395.1.i = phi i16 [ %.sroa.0393.0.copyload.i, %64 ], [ 0, %59 ]
  %69 = mul nuw nsw i64 %61, 66
  %70 = add nuw nsw i64 %69, %34
  %71 = trunc i64 %70 to i32
  %72 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %71
  store i16 %.sroa.0395.1.i, ptr addrspace(3) %72, align 2, !tbaa.struct !19
  %73 = add nuw nsw i64 %60, 64
  %74 = icmp ult i64 %60, 4032
  br i1 %74, label %59, label %.lr.ph1040.i, !llvm.loop !24

.lr.ph1043.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %83 = getelementptr inbounds i8, ptr addrspace(3) %82, i32 8192
  %84 = getelementptr inbounds i8, ptr addrspace(3) %82, i32 16640
  %85 = and i64 %79, 7
  %86 = or disjoint i64 %85, 8
  %87 = or disjoint i64 %85, 16
  %88 = or disjoint i64 %85, 24
  br label %116

89:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1040.i
  %90 = phi i64 [ %49, %.lr.ph1040.i ], [ %101, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %91 = lshr i64 %90, 5
  %92 = icmp slt i64 %91, %51
  %93 = and i1 %92, %58
  br i1 %93, label %94, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

94:                                               ; preds = %89
  %95 = and i64 %90, 9223372036854775776
  %96 = or disjoint i64 %95, %53
  %97 = or disjoint i64 %96, %57
  %98 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %97
  %.sroa.0378.0.copyload.i = load i16, ptr %98, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %94, %89
  %.sroa.0380.1.i = phi i16 [ %.sroa.0378.0.copyload.i, %94 ], [ 0, %89 ]
  %99 = trunc i64 %90 to i32
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %99
  store i16 %.sroa.0380.1.i, ptr addrspace(3) %100, align 2, !tbaa.struct !19
  %101 = add nuw nsw i64 %90, 64
  %102 = icmp ult i64 %90, 1984
  br i1 %102, label %89, label %.lr.ph1043.i, !llvm.loop !28

.lr.ph1046.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %104 = icmp eq i64 %103, 0
  call void @llvm.assume(i1 %104)
  %105 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %106 = icmp eq i64 %105, 0
  call void @llvm.assume(i1 %106)
  %107 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %108 = icmp ult i64 %107, 64
  call void @llvm.assume(i1 %108)
  %109 = sext i32 %3 to i64
  %110 = sext i32 %4 to i64
  %111 = call i32 @llvm.amdgcn.groupstaticsize()
  %112 = inttoptr i32 %111 to ptr addrspace(3)
  %113 = sext i32 %44 to i64
  %114 = and i64 %107, 31
  %115 = icmp slt i64 %114, %110
  br label %642

116:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph1043.i
  %117 = phi i64 [ %79, %.lr.ph1043.i ], [ %133, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %118 = lshr i64 %117, 3
  %119 = mul nuw nsw i64 %118, 66
  br label %135

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %120 = shl nuw nsw i64 %118, 5
  %121 = or disjoint i64 %120, %85
  %122 = trunc i64 %121 to i32
  %123 = getelementptr inbounds float, ptr addrspace(3) %82, i32 %122
  store float %564, ptr addrspace(3) %123, align 4, !tbaa !29
  %124 = or disjoint i64 %120, %86
  %125 = trunc i64 %124 to i32
  %126 = getelementptr inbounds float, ptr addrspace(3) %82, i32 %125
  store float %589, ptr addrspace(3) %126, align 4, !tbaa !29
  %127 = or disjoint i64 %120, %87
  %128 = trunc i64 %127 to i32
  %129 = getelementptr inbounds float, ptr addrspace(3) %82, i32 %128
  store float %614, ptr addrspace(3) %129, align 4, !tbaa !29
  %130 = or disjoint i64 %120, %88
  %131 = trunc i64 %130 to i32
  %132 = getelementptr inbounds float, ptr addrspace(3) %82, i32 %131
  store float %639, ptr addrspace(3) %132, align 4, !tbaa !29
  %133 = add nuw nsw i64 %117, 64
  %134 = icmp ult i64 %117, 448
  br i1 %134, label %116, label %.lr.ph1046.i, !llvm.loop !31

135:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %116
  %136 = phi i64 [ 0, %116 ], [ %640, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %137 = phi float [ 0.000000e+00, %116 ], [ %639, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %138 = phi float [ 0.000000e+00, %116 ], [ %614, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %139 = phi float [ 0.000000e+00, %116 ], [ %589, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %140 = phi float [ 0.000000e+00, %116 ], [ %564, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %141 = add nuw i64 %136, %119
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %142
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %143, align 2, !tbaa.struct !19
  %144 = shl nuw nsw i64 %136, 5
  %145 = or disjoint i64 %144, %85
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %146
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %147, align 2, !tbaa.struct !19
  %148 = zext i16 %.sroa.0363.0.copyload.i to i32
  %149 = lshr i32 %148, 10
  %150 = and i32 %149, 31
  %151 = and i32 %148, 1023
  switch i32 %150, label %157 [
    i32 31, label %152
    i32 0, label %159
  ]

152:                                              ; preds = %135
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %153 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1025.i = icmp eq i32 %151, 0
  %154 = select i1 %.not1025.i, i32 2139095040, i32 2143289344
  %155 = or disjoint i32 %154, %153
  %156 = bitcast i32 %155 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

157:                                              ; preds = %135
  %158 = or disjoint i32 %151, 1024
  br label %159

159:                                              ; preds = %157, %135
  %160 = phi i32 [ %158, %157 ], [ %151, %135 ]
  %161 = uitofp i32 %160 to float
  %.not.i = icmp eq i32 %150, 0
  %162 = add nsw i32 %150, -25
  %163 = select i1 %.not.i, i32 -24, i32 %162
  %164 = call float @__ocml_ldexp_f32(float noundef %161, i32 noundef %163) #5
  %165 = fneg contract float %164
  %.not947948.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %166 = select contract i1 %.not947948.i, float %165, float %164
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %159, %152
  %167 = phi float [ %156, %152 ], [ %166, %159 ]
  %168 = zext i16 %.sroa.0354.0.copyload.i to i32
  %169 = lshr i32 %168, 10
  %170 = and i32 %169, 31
  %171 = and i32 %168, 1023
  switch i32 %170, label %177 [
    i32 31, label %172
    i32 0, label %179
  ]

172:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %173 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1024.i = icmp eq i32 %171, 0
  %174 = select i1 %.not1024.i, i32 2139095040, i32 2143289344
  %175 = or disjoint i32 %174, %173
  %176 = bitcast i32 %175 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

177:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %178 = or disjoint i32 %171, 1024
  br label %179

179:                                              ; preds = %177, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %180 = phi i32 [ %178, %177 ], [ %171, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %181 = uitofp i32 %180 to float
  %.not949.i = icmp eq i32 %170, 0
  %182 = add nsw i32 %170, -25
  %183 = select i1 %.not949.i, i32 -24, i32 %182
  %184 = call float @__ocml_ldexp_f32(float noundef %181, i32 noundef %183) #5
  %185 = fneg contract float %184
  %.not950951.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %186 = select contract i1 %.not950951.i, float %185, float %184
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %179, %172
  %187 = phi float [ %176, %172 ], [ %186, %179 ]
  %188 = fmul contract float %167, %187
  %189 = fadd contract float %140, %188
  %190 = or disjoint i64 %144, %86
  %191 = trunc i64 %190 to i32
  %192 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %191
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %192, align 2, !tbaa.struct !19
  %193 = zext i16 %.sroa.0345.0.copyload.i to i32
  %194 = lshr i32 %193, 10
  %195 = and i32 %194, 31
  %196 = and i32 %193, 1023
  switch i32 %195, label %202 [
    i32 31, label %197
    i32 0, label %204
  ]

197:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %198 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1023.i = icmp eq i32 %196, 0
  %199 = select i1 %.not1023.i, i32 2139095040, i32 2143289344
  %200 = or disjoint i32 %199, %198
  %201 = bitcast i32 %200 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

202:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %203 = or disjoint i32 %196, 1024
  br label %204

204:                                              ; preds = %202, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %205 = phi i32 [ %203, %202 ], [ %196, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %206 = uitofp i32 %205 to float
  %.not952.i = icmp eq i32 %195, 0
  %207 = add nsw i32 %195, -25
  %208 = select i1 %.not952.i, i32 -24, i32 %207
  %209 = call float @__ocml_ldexp_f32(float noundef %206, i32 noundef %208) #5
  %210 = fneg contract float %209
  %.not953954.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %211 = select contract i1 %.not953954.i, float %210, float %209
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %204, %197
  %212 = phi float [ %201, %197 ], [ %211, %204 ]
  %213 = fmul contract float %167, %212
  %214 = fadd contract float %139, %213
  %215 = or disjoint i64 %144, %87
  %216 = trunc i64 %215 to i32
  %217 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %216
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %217, align 2, !tbaa.struct !19
  %218 = zext i16 %.sroa.0336.0.copyload.i to i32
  %219 = lshr i32 %218, 10
  %220 = and i32 %219, 31
  %221 = and i32 %218, 1023
  switch i32 %220, label %227 [
    i32 31, label %222
    i32 0, label %229
  ]

222:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %223 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1022.i = icmp eq i32 %221, 0
  %224 = select i1 %.not1022.i, i32 2139095040, i32 2143289344
  %225 = or disjoint i32 %224, %223
  %226 = bitcast i32 %225 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

227:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %228 = or disjoint i32 %221, 1024
  br label %229

229:                                              ; preds = %227, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %230 = phi i32 [ %228, %227 ], [ %221, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %231 = uitofp i32 %230 to float
  %.not955.i = icmp eq i32 %220, 0
  %232 = add nsw i32 %220, -25
  %233 = select i1 %.not955.i, i32 -24, i32 %232
  %234 = call float @__ocml_ldexp_f32(float noundef %231, i32 noundef %233) #5
  %235 = fneg contract float %234
  %.not956957.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %236 = select contract i1 %.not956957.i, float %235, float %234
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %229, %222
  %237 = phi float [ %226, %222 ], [ %236, %229 ]
  %238 = fmul contract float %167, %237
  %239 = fadd contract float %138, %238
  %240 = or disjoint i64 %144, %88
  %241 = trunc i64 %240 to i32
  %242 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %241
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %242, align 2, !tbaa.struct !19
  %243 = zext i16 %.sroa.0327.0.copyload.i to i32
  %244 = lshr i32 %243, 10
  %245 = and i32 %244, 31
  %246 = and i32 %243, 1023
  switch i32 %245, label %252 [
    i32 31, label %247
    i32 0, label %254
  ]

247:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %248 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1021.i = icmp eq i32 %246, 0
  %249 = select i1 %.not1021.i, i32 2139095040, i32 2143289344
  %250 = or disjoint i32 %249, %248
  %251 = bitcast i32 %250 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

252:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %253 = or disjoint i32 %246, 1024
  br label %254

254:                                              ; preds = %252, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %255 = phi i32 [ %253, %252 ], [ %246, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %256 = uitofp i32 %255 to float
  %.not958.i = icmp eq i32 %245, 0
  %257 = add nsw i32 %245, -25
  %258 = select i1 %.not958.i, i32 -24, i32 %257
  %259 = call float @__ocml_ldexp_f32(float noundef %256, i32 noundef %258) #5
  %260 = fneg contract float %259
  %.not959960.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %261 = select contract i1 %.not959960.i, float %260, float %259
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %254, %247
  %262 = phi float [ %251, %247 ], [ %261, %254 ]
  %263 = fmul contract float %167, %262
  %264 = fadd contract float %137, %263
  %265 = or disjoint i64 %136, 1
  %266 = add nuw i64 %265, %119
  %267 = trunc i64 %266 to i32
  %268 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %267
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %268, align 2, !tbaa.struct !19
  %269 = shl nuw nsw i64 %265, 5
  %270 = or disjoint i64 %269, %85
  %271 = trunc i64 %270 to i32
  %272 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %271
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %272, align 2, !tbaa.struct !19
  %273 = zext i16 %.sroa.0318.0.copyload.i to i32
  %274 = lshr i32 %273, 10
  %275 = and i32 %274, 31
  %276 = and i32 %273, 1023
  switch i32 %275, label %282 [
    i32 31, label %277
    i32 0, label %284
  ]

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %278 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1020.i = icmp eq i32 %276, 0
  %279 = select i1 %.not1020.i, i32 2139095040, i32 2143289344
  %280 = or disjoint i32 %279, %278
  %281 = bitcast i32 %280 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %283 = or disjoint i32 %276, 1024
  br label %284

284:                                              ; preds = %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %285 = phi i32 [ %283, %282 ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %286 = uitofp i32 %285 to float
  %.not961.i = icmp eq i32 %275, 0
  %287 = add nsw i32 %275, -25
  %288 = select i1 %.not961.i, i32 -24, i32 %287
  %289 = call float @__ocml_ldexp_f32(float noundef %286, i32 noundef %288) #5
  %290 = fneg contract float %289
  %.not962963.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %291 = select contract i1 %.not962963.i, float %290, float %289
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %284, %277
  %292 = phi float [ %281, %277 ], [ %291, %284 ]
  %293 = zext i16 %.sroa.0309.0.copyload.i to i32
  %294 = lshr i32 %293, 10
  %295 = and i32 %294, 31
  %296 = and i32 %293, 1023
  switch i32 %295, label %302 [
    i32 31, label %297
    i32 0, label %304
  ]

297:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %298 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1019.i = icmp eq i32 %296, 0
  %299 = select i1 %.not1019.i, i32 2139095040, i32 2143289344
  %300 = or disjoint i32 %299, %298
  %301 = bitcast i32 %300 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

302:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %303 = or disjoint i32 %296, 1024
  br label %304

304:                                              ; preds = %302, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %305 = phi i32 [ %303, %302 ], [ %296, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %306 = uitofp i32 %305 to float
  %.not964.i = icmp eq i32 %295, 0
  %307 = add nsw i32 %295, -25
  %308 = select i1 %.not964.i, i32 -24, i32 %307
  %309 = call float @__ocml_ldexp_f32(float noundef %306, i32 noundef %308) #5
  %310 = fneg contract float %309
  %.not965966.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %311 = select contract i1 %.not965966.i, float %310, float %309
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %304, %297
  %312 = phi float [ %301, %297 ], [ %311, %304 ]
  %313 = fmul contract float %292, %312
  %314 = fadd contract float %189, %313
  %315 = or disjoint i64 %269, %86
  %316 = trunc i64 %315 to i32
  %317 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %316
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %317, align 2, !tbaa.struct !19
  %318 = zext i16 %.sroa.0300.0.copyload.i to i32
  %319 = lshr i32 %318, 10
  %320 = and i32 %319, 31
  %321 = and i32 %318, 1023
  switch i32 %320, label %327 [
    i32 31, label %322
    i32 0, label %329
  ]

322:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %323 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1018.i = icmp eq i32 %321, 0
  %324 = select i1 %.not1018.i, i32 2139095040, i32 2143289344
  %325 = or disjoint i32 %324, %323
  %326 = bitcast i32 %325 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %328 = or disjoint i32 %321, 1024
  br label %329

329:                                              ; preds = %327, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %330 = phi i32 [ %328, %327 ], [ %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %331 = uitofp i32 %330 to float
  %.not967.i = icmp eq i32 %320, 0
  %332 = add nsw i32 %320, -25
  %333 = select i1 %.not967.i, i32 -24, i32 %332
  %334 = call float @__ocml_ldexp_f32(float noundef %331, i32 noundef %333) #5
  %335 = fneg contract float %334
  %.not968969.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %336 = select contract i1 %.not968969.i, float %335, float %334
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %329, %322
  %337 = phi float [ %326, %322 ], [ %336, %329 ]
  %338 = fmul contract float %292, %337
  %339 = fadd contract float %214, %338
  %340 = or disjoint i64 %269, %87
  %341 = trunc i64 %340 to i32
  %342 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %341
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %342, align 2, !tbaa.struct !19
  %343 = zext i16 %.sroa.0291.0.copyload.i to i32
  %344 = lshr i32 %343, 10
  %345 = and i32 %344, 31
  %346 = and i32 %343, 1023
  switch i32 %345, label %352 [
    i32 31, label %347
    i32 0, label %354
  ]

347:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %348 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1017.i = icmp eq i32 %346, 0
  %349 = select i1 %.not1017.i, i32 2139095040, i32 2143289344
  %350 = or disjoint i32 %349, %348
  %351 = bitcast i32 %350 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

352:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %353 = or disjoint i32 %346, 1024
  br label %354

354:                                              ; preds = %352, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %355 = phi i32 [ %353, %352 ], [ %346, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %356 = uitofp i32 %355 to float
  %.not970.i = icmp eq i32 %345, 0
  %357 = add nsw i32 %345, -25
  %358 = select i1 %.not970.i, i32 -24, i32 %357
  %359 = call float @__ocml_ldexp_f32(float noundef %356, i32 noundef %358) #5
  %360 = fneg contract float %359
  %.not971972.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %361 = select contract i1 %.not971972.i, float %360, float %359
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %354, %347
  %362 = phi float [ %351, %347 ], [ %361, %354 ]
  %363 = fmul contract float %292, %362
  %364 = fadd contract float %239, %363
  %365 = or disjoint i64 %269, %88
  %366 = trunc i64 %365 to i32
  %367 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %366
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %367, align 2, !tbaa.struct !19
  %368 = zext i16 %.sroa.0282.0.copyload.i to i32
  %369 = lshr i32 %368, 10
  %370 = and i32 %369, 31
  %371 = and i32 %368, 1023
  switch i32 %370, label %377 [
    i32 31, label %372
    i32 0, label %379
  ]

372:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %373 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1016.i = icmp eq i32 %371, 0
  %374 = select i1 %.not1016.i, i32 2139095040, i32 2143289344
  %375 = or disjoint i32 %374, %373
  %376 = bitcast i32 %375 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

377:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %378 = or disjoint i32 %371, 1024
  br label %379

379:                                              ; preds = %377, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %380 = phi i32 [ %378, %377 ], [ %371, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %381 = uitofp i32 %380 to float
  %.not973.i = icmp eq i32 %370, 0
  %382 = add nsw i32 %370, -25
  %383 = select i1 %.not973.i, i32 -24, i32 %382
  %384 = call float @__ocml_ldexp_f32(float noundef %381, i32 noundef %383) #5
  %385 = fneg contract float %384
  %.not974975.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %386 = select contract i1 %.not974975.i, float %385, float %384
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %379, %372
  %387 = phi float [ %376, %372 ], [ %386, %379 ]
  %388 = fmul contract float %292, %387
  %389 = fadd contract float %264, %388
  %390 = or disjoint i64 %136, 2
  %391 = add nuw i64 %390, %119
  %392 = trunc i64 %391 to i32
  %393 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %392
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %393, align 2, !tbaa.struct !19
  %394 = shl nuw nsw i64 %390, 5
  %395 = or disjoint i64 %394, %85
  %396 = trunc i64 %395 to i32
  %397 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %396
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %397, align 2, !tbaa.struct !19
  %398 = zext i16 %.sroa.0273.0.copyload.i to i32
  %399 = lshr i32 %398, 10
  %400 = and i32 %399, 31
  %401 = and i32 %398, 1023
  switch i32 %400, label %407 [
    i32 31, label %402
    i32 0, label %409
  ]

402:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %403 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1015.i = icmp eq i32 %401, 0
  %404 = select i1 %.not1015.i, i32 2139095040, i32 2143289344
  %405 = or disjoint i32 %404, %403
  %406 = bitcast i32 %405 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

407:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %408 = or disjoint i32 %401, 1024
  br label %409

409:                                              ; preds = %407, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %410 = phi i32 [ %408, %407 ], [ %401, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %411 = uitofp i32 %410 to float
  %.not976.i = icmp eq i32 %400, 0
  %412 = add nsw i32 %400, -25
  %413 = select i1 %.not976.i, i32 -24, i32 %412
  %414 = call float @__ocml_ldexp_f32(float noundef %411, i32 noundef %413) #5
  %415 = fneg contract float %414
  %.not977978.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %416 = select contract i1 %.not977978.i, float %415, float %414
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %409, %402
  %417 = phi float [ %406, %402 ], [ %416, %409 ]
  %418 = zext i16 %.sroa.0264.0.copyload.i to i32
  %419 = lshr i32 %418, 10
  %420 = and i32 %419, 31
  %421 = and i32 %418, 1023
  switch i32 %420, label %427 [
    i32 31, label %422
    i32 0, label %429
  ]

422:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %423 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1014.i = icmp eq i32 %421, 0
  %424 = select i1 %.not1014.i, i32 2139095040, i32 2143289344
  %425 = or disjoint i32 %424, %423
  %426 = bitcast i32 %425 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

427:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %428 = or disjoint i32 %421, 1024
  br label %429

429:                                              ; preds = %427, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %430 = phi i32 [ %428, %427 ], [ %421, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %431 = uitofp i32 %430 to float
  %.not979.i = icmp eq i32 %420, 0
  %432 = add nsw i32 %420, -25
  %433 = select i1 %.not979.i, i32 -24, i32 %432
  %434 = call float @__ocml_ldexp_f32(float noundef %431, i32 noundef %433) #5
  %435 = fneg contract float %434
  %.not980981.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %436 = select contract i1 %.not980981.i, float %435, float %434
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %429, %422
  %437 = phi float [ %426, %422 ], [ %436, %429 ]
  %438 = fmul contract float %417, %437
  %439 = fadd contract float %314, %438
  %440 = or disjoint i64 %394, %86
  %441 = trunc i64 %440 to i32
  %442 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %441
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %442, align 2, !tbaa.struct !19
  %443 = zext i16 %.sroa.0255.0.copyload.i to i32
  %444 = lshr i32 %443, 10
  %445 = and i32 %444, 31
  %446 = and i32 %443, 1023
  switch i32 %445, label %452 [
    i32 31, label %447
    i32 0, label %454
  ]

447:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %448 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1013.i = icmp eq i32 %446, 0
  %449 = select i1 %.not1013.i, i32 2139095040, i32 2143289344
  %450 = or disjoint i32 %449, %448
  %451 = bitcast i32 %450 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

452:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %453 = or disjoint i32 %446, 1024
  br label %454

454:                                              ; preds = %452, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %455 = phi i32 [ %453, %452 ], [ %446, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %456 = uitofp i32 %455 to float
  %.not982.i = icmp eq i32 %445, 0
  %457 = add nsw i32 %445, -25
  %458 = select i1 %.not982.i, i32 -24, i32 %457
  %459 = call float @__ocml_ldexp_f32(float noundef %456, i32 noundef %458) #5
  %460 = fneg contract float %459
  %.not983984.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %461 = select contract i1 %.not983984.i, float %460, float %459
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %454, %447
  %462 = phi float [ %451, %447 ], [ %461, %454 ]
  %463 = fmul contract float %417, %462
  %464 = fadd contract float %339, %463
  %465 = or disjoint i64 %394, %87
  %466 = trunc i64 %465 to i32
  %467 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %466
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %467, align 2, !tbaa.struct !19
  %468 = zext i16 %.sroa.0246.0.copyload.i to i32
  %469 = lshr i32 %468, 10
  %470 = and i32 %469, 31
  %471 = and i32 %468, 1023
  switch i32 %470, label %477 [
    i32 31, label %472
    i32 0, label %479
  ]

472:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %473 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1012.i = icmp eq i32 %471, 0
  %474 = select i1 %.not1012.i, i32 2139095040, i32 2143289344
  %475 = or disjoint i32 %474, %473
  %476 = bitcast i32 %475 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

477:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %478 = or disjoint i32 %471, 1024
  br label %479

479:                                              ; preds = %477, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %480 = phi i32 [ %478, %477 ], [ %471, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %481 = uitofp i32 %480 to float
  %.not985.i = icmp eq i32 %470, 0
  %482 = add nsw i32 %470, -25
  %483 = select i1 %.not985.i, i32 -24, i32 %482
  %484 = call float @__ocml_ldexp_f32(float noundef %481, i32 noundef %483) #5
  %485 = fneg contract float %484
  %.not986987.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %486 = select contract i1 %.not986987.i, float %485, float %484
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %479, %472
  %487 = phi float [ %476, %472 ], [ %486, %479 ]
  %488 = fmul contract float %417, %487
  %489 = fadd contract float %364, %488
  %490 = or disjoint i64 %394, %88
  %491 = trunc i64 %490 to i32
  %492 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %491
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %492, align 2, !tbaa.struct !19
  %493 = zext i16 %.sroa.0237.0.copyload.i to i32
  %494 = lshr i32 %493, 10
  %495 = and i32 %494, 31
  %496 = and i32 %493, 1023
  switch i32 %495, label %502 [
    i32 31, label %497
    i32 0, label %504
  ]

497:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %498 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1011.i = icmp eq i32 %496, 0
  %499 = select i1 %.not1011.i, i32 2139095040, i32 2143289344
  %500 = or disjoint i32 %499, %498
  %501 = bitcast i32 %500 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

502:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %503 = or disjoint i32 %496, 1024
  br label %504

504:                                              ; preds = %502, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %505 = phi i32 [ %503, %502 ], [ %496, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %506 = uitofp i32 %505 to float
  %.not988.i = icmp eq i32 %495, 0
  %507 = add nsw i32 %495, -25
  %508 = select i1 %.not988.i, i32 -24, i32 %507
  %509 = call float @__ocml_ldexp_f32(float noundef %506, i32 noundef %508) #5
  %510 = fneg contract float %509
  %.not989990.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %511 = select contract i1 %.not989990.i, float %510, float %509
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %504, %497
  %512 = phi float [ %501, %497 ], [ %511, %504 ]
  %513 = fmul contract float %417, %512
  %514 = fadd contract float %389, %513
  %515 = or disjoint i64 %136, 3
  %516 = add nuw i64 %515, %119
  %517 = trunc i64 %516 to i32
  %518 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %517
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %518, align 2, !tbaa.struct !19
  %519 = shl nuw nsw i64 %515, 5
  %520 = or disjoint i64 %519, %85
  %521 = trunc i64 %520 to i32
  %522 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %521
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %522, align 2, !tbaa.struct !19
  %523 = zext i16 %.sroa.0228.0.copyload.i to i32
  %524 = lshr i32 %523, 10
  %525 = and i32 %524, 31
  %526 = and i32 %523, 1023
  switch i32 %525, label %532 [
    i32 31, label %527
    i32 0, label %534
  ]

527:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %528 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1010.i = icmp eq i32 %526, 0
  %529 = select i1 %.not1010.i, i32 2139095040, i32 2143289344
  %530 = or disjoint i32 %529, %528
  %531 = bitcast i32 %530 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

532:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %533 = or disjoint i32 %526, 1024
  br label %534

534:                                              ; preds = %532, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %535 = phi i32 [ %533, %532 ], [ %526, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %536 = uitofp i32 %535 to float
  %.not991.i = icmp eq i32 %525, 0
  %537 = add nsw i32 %525, -25
  %538 = select i1 %.not991.i, i32 -24, i32 %537
  %539 = call float @__ocml_ldexp_f32(float noundef %536, i32 noundef %538) #5
  %540 = fneg contract float %539
  %.not992993.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %541 = select contract i1 %.not992993.i, float %540, float %539
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %534, %527
  %542 = phi float [ %531, %527 ], [ %541, %534 ]
  %543 = zext i16 %.sroa.0219.0.copyload.i to i32
  %544 = lshr i32 %543, 10
  %545 = and i32 %544, 31
  %546 = and i32 %543, 1023
  switch i32 %545, label %552 [
    i32 31, label %547
    i32 0, label %554
  ]

547:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %548 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1009.i = icmp eq i32 %546, 0
  %549 = select i1 %.not1009.i, i32 2139095040, i32 2143289344
  %550 = or disjoint i32 %549, %548
  %551 = bitcast i32 %550 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

552:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %553 = or disjoint i32 %546, 1024
  br label %554

554:                                              ; preds = %552, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %555 = phi i32 [ %553, %552 ], [ %546, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %556 = uitofp i32 %555 to float
  %.not994.i = icmp eq i32 %545, 0
  %557 = add nsw i32 %545, -25
  %558 = select i1 %.not994.i, i32 -24, i32 %557
  %559 = call float @__ocml_ldexp_f32(float noundef %556, i32 noundef %558) #5
  %560 = fneg contract float %559
  %.not995996.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %561 = select contract i1 %.not995996.i, float %560, float %559
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %554, %547
  %562 = phi float [ %551, %547 ], [ %561, %554 ]
  %563 = fmul contract float %542, %562
  %564 = fadd contract float %439, %563
  %565 = or disjoint i64 %519, %86
  %566 = trunc i64 %565 to i32
  %567 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %566
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %567, align 2, !tbaa.struct !19
  %568 = zext i16 %.sroa.0210.0.copyload.i to i32
  %569 = lshr i32 %568, 10
  %570 = and i32 %569, 31
  %571 = and i32 %568, 1023
  switch i32 %570, label %577 [
    i32 31, label %572
    i32 0, label %579
  ]

572:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %573 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1008.i = icmp eq i32 %571, 0
  %574 = select i1 %.not1008.i, i32 2139095040, i32 2143289344
  %575 = or disjoint i32 %574, %573
  %576 = bitcast i32 %575 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

577:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %578 = or disjoint i32 %571, 1024
  br label %579

579:                                              ; preds = %577, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %580 = phi i32 [ %578, %577 ], [ %571, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %581 = uitofp i32 %580 to float
  %.not997.i = icmp eq i32 %570, 0
  %582 = add nsw i32 %570, -25
  %583 = select i1 %.not997.i, i32 -24, i32 %582
  %584 = call float @__ocml_ldexp_f32(float noundef %581, i32 noundef %583) #5
  %585 = fneg contract float %584
  %.not998999.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %586 = select contract i1 %.not998999.i, float %585, float %584
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %579, %572
  %587 = phi float [ %576, %572 ], [ %586, %579 ]
  %588 = fmul contract float %542, %587
  %589 = fadd contract float %464, %588
  %590 = or disjoint i64 %519, %87
  %591 = trunc i64 %590 to i32
  %592 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %591
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %592, align 2, !tbaa.struct !19
  %593 = zext i16 %.sroa.0201.0.copyload.i to i32
  %594 = lshr i32 %593, 10
  %595 = and i32 %594, 31
  %596 = and i32 %593, 1023
  switch i32 %595, label %602 [
    i32 31, label %597
    i32 0, label %604
  ]

597:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %598 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1007.i = icmp eq i32 %596, 0
  %599 = select i1 %.not1007.i, i32 2139095040, i32 2143289344
  %600 = or disjoint i32 %599, %598
  %601 = bitcast i32 %600 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

602:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %603 = or disjoint i32 %596, 1024
  br label %604

604:                                              ; preds = %602, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %605 = phi i32 [ %603, %602 ], [ %596, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %606 = uitofp i32 %605 to float
  %.not1000.i = icmp eq i32 %595, 0
  %607 = add nsw i32 %595, -25
  %608 = select i1 %.not1000.i, i32 -24, i32 %607
  %609 = call float @__ocml_ldexp_f32(float noundef %606, i32 noundef %608) #5
  %610 = fneg contract float %609
  %.not10011002.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %611 = select contract i1 %.not10011002.i, float %610, float %609
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %604, %597
  %612 = phi float [ %601, %597 ], [ %611, %604 ]
  %613 = fmul contract float %542, %612
  %614 = fadd contract float %489, %613
  %615 = or disjoint i64 %519, %88
  %616 = trunc i64 %615 to i32
  %617 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %616
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %617, align 2, !tbaa.struct !19
  %618 = zext i16 %.sroa.0192.0.copyload.i to i32
  %619 = lshr i32 %618, 10
  %620 = and i32 %619, 31
  %621 = and i32 %618, 1023
  switch i32 %620, label %627 [
    i32 31, label %622
    i32 0, label %629
  ]

622:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %623 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1006.i = icmp eq i32 %621, 0
  %624 = select i1 %.not1006.i, i32 2139095040, i32 2143289344
  %625 = or disjoint i32 %624, %623
  %626 = bitcast i32 %625 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

627:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %628 = or disjoint i32 %621, 1024
  br label %629

629:                                              ; preds = %627, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %630 = phi i32 [ %628, %627 ], [ %621, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %631 = uitofp i32 %630 to float
  %.not1003.i = icmp eq i32 %620, 0
  %632 = add nsw i32 %620, -25
  %633 = select i1 %.not1003.i, i32 -24, i32 %632
  %634 = call float @__ocml_ldexp_f32(float noundef %631, i32 noundef %633) #5
  %635 = fneg contract float %634
  %.not10041005.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %636 = select contract i1 %.not10041005.i, float %635, float %634
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %629, %622
  %637 = phi float [ %626, %622 ], [ %636, %629 ]
  %638 = fmul contract float %542, %637
  %639 = fadd contract float %514, %638
  %640 = add nuw nsw i64 %136, 4
  %641 = icmp ult i64 %136, 60
  br i1 %641, label %135, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

642:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1046.i
  %643 = phi i64 [ %107, %.lr.ph1046.i ], [ %655, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %644 = lshr i64 %643, 5
  %645 = icmp slt i64 %644, %109
  %646 = and i1 %645, %115
  br i1 %646, label %647, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

647:                                              ; preds = %642
  %648 = trunc i64 %643 to i32
  %649 = getelementptr inbounds float, ptr addrspace(3) %112, i32 %648
  %650 = load float, ptr addrspace(3) %649, align 4, !tbaa !29
  %651 = and i64 %643, 9223372036854775776
  %652 = or disjoint i64 %651, %113
  %653 = or disjoint i64 %652, %114
  %654 = getelementptr inbounds float, ptr %9, i64 %653
  store float %650, ptr %654, align 4, !tbaa !29
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %647, %642
  %655 = add nuw nsw i64 %643, 64
  %656 = icmp ult i64 %643, 1984
  br i1 %656, label %642, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !33

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
