;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-7xnqsxva/kernel.cpp"
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
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 16384
  %57 = and i64 %49, 31
  %58 = icmp slt i64 %57, %52
  br label %87

59:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i, %6
  %60 = phi i64 [ %34, %6 ], [ %71, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i ]
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
  %69 = trunc i64 %60 to i32
  %70 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %69
  store i16 %.sroa.0395.1.i, ptr addrspace(3) %70, align 2, !tbaa.struct !19
  %71 = add nuw nsw i64 %60, 64
  %72 = icmp ult i64 %60, 4032
  br i1 %72, label %59, label %.lr.ph1040.i, !llvm.loop !24

.lr.ph1043.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 8192
  %82 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 16384
  %83 = and i64 %77, 7
  %84 = or disjoint i64 %83, 8
  %85 = or disjoint i64 %83, 16
  %86 = or disjoint i64 %83, 24
  br label %114

87:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1040.i
  %88 = phi i64 [ %49, %.lr.ph1040.i ], [ %99, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %89 = lshr i64 %88, 5
  %90 = icmp slt i64 %89, %51
  %91 = and i1 %90, %58
  br i1 %91, label %92, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

92:                                               ; preds = %87
  %93 = and i64 %88, 9223372036854775776
  %94 = or disjoint i64 %93, %53
  %95 = or disjoint i64 %94, %57
  %96 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %95
  %.sroa.0378.0.copyload.i = load i16, ptr %96, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %92, %87
  %.sroa.0380.1.i = phi i16 [ %.sroa.0378.0.copyload.i, %92 ], [ 0, %87 ]
  %97 = trunc i64 %88 to i32
  %98 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %97
  store i16 %.sroa.0380.1.i, ptr addrspace(3) %98, align 2, !tbaa.struct !19
  %99 = add nuw nsw i64 %88, 64
  %100 = icmp ult i64 %88, 1984
  br i1 %100, label %87, label %.lr.ph1043.i, !llvm.loop !28

.lr.ph1046.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %102 = icmp eq i64 %101, 0
  call void @llvm.assume(i1 %102)
  %103 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %104 = icmp eq i64 %103, 0
  call void @llvm.assume(i1 %104)
  %105 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %106 = icmp ult i64 %105, 64
  call void @llvm.assume(i1 %106)
  %107 = sext i32 %3 to i64
  %108 = sext i32 %4 to i64
  %109 = call i32 @llvm.amdgcn.groupstaticsize()
  %110 = inttoptr i32 %109 to ptr addrspace(3)
  %111 = sext i32 %44 to i64
  %112 = and i64 %105, 31
  %113 = icmp slt i64 %112, %108
  br label %640

114:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph1043.i
  %115 = phi i64 [ %77, %.lr.ph1043.i ], [ %131, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %116 = lshr i64 %115, 3
  %117 = shl nuw nsw i64 %116, 6
  br label %133

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %118 = shl nuw nsw i64 %116, 5
  %119 = or disjoint i64 %118, %83
  %120 = trunc i64 %119 to i32
  %121 = getelementptr inbounds float, ptr addrspace(3) %80, i32 %120
  store float %562, ptr addrspace(3) %121, align 4, !tbaa !29
  %122 = or disjoint i64 %118, %84
  %123 = trunc i64 %122 to i32
  %124 = getelementptr inbounds float, ptr addrspace(3) %80, i32 %123
  store float %587, ptr addrspace(3) %124, align 4, !tbaa !29
  %125 = or disjoint i64 %118, %85
  %126 = trunc i64 %125 to i32
  %127 = getelementptr inbounds float, ptr addrspace(3) %80, i32 %126
  store float %612, ptr addrspace(3) %127, align 4, !tbaa !29
  %128 = or disjoint i64 %118, %86
  %129 = trunc i64 %128 to i32
  %130 = getelementptr inbounds float, ptr addrspace(3) %80, i32 %129
  store float %637, ptr addrspace(3) %130, align 4, !tbaa !29
  %131 = add nuw nsw i64 %115, 64
  %132 = icmp ult i64 %115, 448
  br i1 %132, label %114, label %.lr.ph1046.i, !llvm.loop !31

133:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %114
  %134 = phi i64 [ 0, %114 ], [ %638, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %135 = phi float [ 0.000000e+00, %114 ], [ %637, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %136 = phi float [ 0.000000e+00, %114 ], [ %612, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %137 = phi float [ 0.000000e+00, %114 ], [ %587, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %138 = phi float [ 0.000000e+00, %114 ], [ %562, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %139 = add nuw i64 %134, %117
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %140
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %141, align 2, !tbaa.struct !19
  %142 = shl nuw nsw i64 %134, 5
  %143 = or disjoint i64 %142, %83
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %144
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %145, align 2, !tbaa.struct !19
  %146 = zext i16 %.sroa.0363.0.copyload.i to i32
  %147 = lshr i32 %146, 10
  %148 = and i32 %147, 31
  %149 = and i32 %146, 1023
  switch i32 %148, label %155 [
    i32 31, label %150
    i32 0, label %157
  ]

150:                                              ; preds = %133
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %151 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1025.i = icmp eq i32 %149, 0
  %152 = select i1 %.not1025.i, i32 2139095040, i32 2143289344
  %153 = or disjoint i32 %152, %151
  %154 = bitcast i32 %153 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

155:                                              ; preds = %133
  %156 = or disjoint i32 %149, 1024
  br label %157

157:                                              ; preds = %155, %133
  %158 = phi i32 [ %156, %155 ], [ %149, %133 ]
  %159 = uitofp i32 %158 to float
  %.not.i = icmp eq i32 %148, 0
  %160 = add nsw i32 %148, -25
  %161 = select i1 %.not.i, i32 -24, i32 %160
  %162 = call float @__ocml_ldexp_f32(float noundef %159, i32 noundef %161) #5
  %163 = fneg contract float %162
  %.not947948.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %164 = select contract i1 %.not947948.i, float %163, float %162
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %157, %150
  %165 = phi float [ %154, %150 ], [ %164, %157 ]
  %166 = zext i16 %.sroa.0354.0.copyload.i to i32
  %167 = lshr i32 %166, 10
  %168 = and i32 %167, 31
  %169 = and i32 %166, 1023
  switch i32 %168, label %175 [
    i32 31, label %170
    i32 0, label %177
  ]

170:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %171 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1024.i = icmp eq i32 %169, 0
  %172 = select i1 %.not1024.i, i32 2139095040, i32 2143289344
  %173 = or disjoint i32 %172, %171
  %174 = bitcast i32 %173 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

175:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %176 = or disjoint i32 %169, 1024
  br label %177

177:                                              ; preds = %175, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %178 = phi i32 [ %176, %175 ], [ %169, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %179 = uitofp i32 %178 to float
  %.not949.i = icmp eq i32 %168, 0
  %180 = add nsw i32 %168, -25
  %181 = select i1 %.not949.i, i32 -24, i32 %180
  %182 = call float @__ocml_ldexp_f32(float noundef %179, i32 noundef %181) #5
  %183 = fneg contract float %182
  %.not950951.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %184 = select contract i1 %.not950951.i, float %183, float %182
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %177, %170
  %185 = phi float [ %174, %170 ], [ %184, %177 ]
  %186 = fmul contract float %165, %185
  %187 = fadd contract float %138, %186
  %188 = or disjoint i64 %142, %84
  %189 = trunc i64 %188 to i32
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %189
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %190, align 2, !tbaa.struct !19
  %191 = zext i16 %.sroa.0345.0.copyload.i to i32
  %192 = lshr i32 %191, 10
  %193 = and i32 %192, 31
  %194 = and i32 %191, 1023
  switch i32 %193, label %200 [
    i32 31, label %195
    i32 0, label %202
  ]

195:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %196 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1023.i = icmp eq i32 %194, 0
  %197 = select i1 %.not1023.i, i32 2139095040, i32 2143289344
  %198 = or disjoint i32 %197, %196
  %199 = bitcast i32 %198 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

200:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %201 = or disjoint i32 %194, 1024
  br label %202

202:                                              ; preds = %200, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %203 = phi i32 [ %201, %200 ], [ %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %204 = uitofp i32 %203 to float
  %.not952.i = icmp eq i32 %193, 0
  %205 = add nsw i32 %193, -25
  %206 = select i1 %.not952.i, i32 -24, i32 %205
  %207 = call float @__ocml_ldexp_f32(float noundef %204, i32 noundef %206) #5
  %208 = fneg contract float %207
  %.not953954.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %209 = select contract i1 %.not953954.i, float %208, float %207
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %202, %195
  %210 = phi float [ %199, %195 ], [ %209, %202 ]
  %211 = fmul contract float %165, %210
  %212 = fadd contract float %137, %211
  %213 = or disjoint i64 %142, %85
  %214 = trunc i64 %213 to i32
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %214
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %215, align 2, !tbaa.struct !19
  %216 = zext i16 %.sroa.0336.0.copyload.i to i32
  %217 = lshr i32 %216, 10
  %218 = and i32 %217, 31
  %219 = and i32 %216, 1023
  switch i32 %218, label %225 [
    i32 31, label %220
    i32 0, label %227
  ]

220:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %221 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1022.i = icmp eq i32 %219, 0
  %222 = select i1 %.not1022.i, i32 2139095040, i32 2143289344
  %223 = or disjoint i32 %222, %221
  %224 = bitcast i32 %223 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

225:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %226 = or disjoint i32 %219, 1024
  br label %227

227:                                              ; preds = %225, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %228 = phi i32 [ %226, %225 ], [ %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %229 = uitofp i32 %228 to float
  %.not955.i = icmp eq i32 %218, 0
  %230 = add nsw i32 %218, -25
  %231 = select i1 %.not955.i, i32 -24, i32 %230
  %232 = call float @__ocml_ldexp_f32(float noundef %229, i32 noundef %231) #5
  %233 = fneg contract float %232
  %.not956957.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %234 = select contract i1 %.not956957.i, float %233, float %232
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %227, %220
  %235 = phi float [ %224, %220 ], [ %234, %227 ]
  %236 = fmul contract float %165, %235
  %237 = fadd contract float %136, %236
  %238 = or disjoint i64 %142, %86
  %239 = trunc i64 %238 to i32
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %239
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %240, align 2, !tbaa.struct !19
  %241 = zext i16 %.sroa.0327.0.copyload.i to i32
  %242 = lshr i32 %241, 10
  %243 = and i32 %242, 31
  %244 = and i32 %241, 1023
  switch i32 %243, label %250 [
    i32 31, label %245
    i32 0, label %252
  ]

245:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %246 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1021.i = icmp eq i32 %244, 0
  %247 = select i1 %.not1021.i, i32 2139095040, i32 2143289344
  %248 = or disjoint i32 %247, %246
  %249 = bitcast i32 %248 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

250:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %251 = or disjoint i32 %244, 1024
  br label %252

252:                                              ; preds = %250, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %253 = phi i32 [ %251, %250 ], [ %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %254 = uitofp i32 %253 to float
  %.not958.i = icmp eq i32 %243, 0
  %255 = add nsw i32 %243, -25
  %256 = select i1 %.not958.i, i32 -24, i32 %255
  %257 = call float @__ocml_ldexp_f32(float noundef %254, i32 noundef %256) #5
  %258 = fneg contract float %257
  %.not959960.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %259 = select contract i1 %.not959960.i, float %258, float %257
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %252, %245
  %260 = phi float [ %249, %245 ], [ %259, %252 ]
  %261 = fmul contract float %165, %260
  %262 = fadd contract float %135, %261
  %263 = or disjoint i64 %134, 1
  %264 = add nuw i64 %263, %117
  %265 = trunc i64 %264 to i32
  %266 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %265
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %266, align 2, !tbaa.struct !19
  %267 = shl nuw nsw i64 %263, 5
  %268 = or disjoint i64 %267, %83
  %269 = trunc i64 %268 to i32
  %270 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %269
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %270, align 2, !tbaa.struct !19
  %271 = zext i16 %.sroa.0318.0.copyload.i to i32
  %272 = lshr i32 %271, 10
  %273 = and i32 %272, 31
  %274 = and i32 %271, 1023
  switch i32 %273, label %280 [
    i32 31, label %275
    i32 0, label %282
  ]

275:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %276 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1020.i = icmp eq i32 %274, 0
  %277 = select i1 %.not1020.i, i32 2139095040, i32 2143289344
  %278 = or disjoint i32 %277, %276
  %279 = bitcast i32 %278 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

280:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %281 = or disjoint i32 %274, 1024
  br label %282

282:                                              ; preds = %280, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %283 = phi i32 [ %281, %280 ], [ %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %284 = uitofp i32 %283 to float
  %.not961.i = icmp eq i32 %273, 0
  %285 = add nsw i32 %273, -25
  %286 = select i1 %.not961.i, i32 -24, i32 %285
  %287 = call float @__ocml_ldexp_f32(float noundef %284, i32 noundef %286) #5
  %288 = fneg contract float %287
  %.not962963.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %289 = select contract i1 %.not962963.i, float %288, float %287
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %282, %275
  %290 = phi float [ %279, %275 ], [ %289, %282 ]
  %291 = zext i16 %.sroa.0309.0.copyload.i to i32
  %292 = lshr i32 %291, 10
  %293 = and i32 %292, 31
  %294 = and i32 %291, 1023
  switch i32 %293, label %300 [
    i32 31, label %295
    i32 0, label %302
  ]

295:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %296 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1019.i = icmp eq i32 %294, 0
  %297 = select i1 %.not1019.i, i32 2139095040, i32 2143289344
  %298 = or disjoint i32 %297, %296
  %299 = bitcast i32 %298 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

300:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %301 = or disjoint i32 %294, 1024
  br label %302

302:                                              ; preds = %300, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %303 = phi i32 [ %301, %300 ], [ %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %304 = uitofp i32 %303 to float
  %.not964.i = icmp eq i32 %293, 0
  %305 = add nsw i32 %293, -25
  %306 = select i1 %.not964.i, i32 -24, i32 %305
  %307 = call float @__ocml_ldexp_f32(float noundef %304, i32 noundef %306) #5
  %308 = fneg contract float %307
  %.not965966.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %309 = select contract i1 %.not965966.i, float %308, float %307
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %302, %295
  %310 = phi float [ %299, %295 ], [ %309, %302 ]
  %311 = fmul contract float %290, %310
  %312 = fadd contract float %187, %311
  %313 = or disjoint i64 %267, %84
  %314 = trunc i64 %313 to i32
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %314
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %315, align 2, !tbaa.struct !19
  %316 = zext i16 %.sroa.0300.0.copyload.i to i32
  %317 = lshr i32 %316, 10
  %318 = and i32 %317, 31
  %319 = and i32 %316, 1023
  switch i32 %318, label %325 [
    i32 31, label %320
    i32 0, label %327
  ]

320:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %321 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1018.i = icmp eq i32 %319, 0
  %322 = select i1 %.not1018.i, i32 2139095040, i32 2143289344
  %323 = or disjoint i32 %322, %321
  %324 = bitcast i32 %323 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

325:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %326 = or disjoint i32 %319, 1024
  br label %327

327:                                              ; preds = %325, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %328 = phi i32 [ %326, %325 ], [ %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %329 = uitofp i32 %328 to float
  %.not967.i = icmp eq i32 %318, 0
  %330 = add nsw i32 %318, -25
  %331 = select i1 %.not967.i, i32 -24, i32 %330
  %332 = call float @__ocml_ldexp_f32(float noundef %329, i32 noundef %331) #5
  %333 = fneg contract float %332
  %.not968969.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %334 = select contract i1 %.not968969.i, float %333, float %332
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %327, %320
  %335 = phi float [ %324, %320 ], [ %334, %327 ]
  %336 = fmul contract float %290, %335
  %337 = fadd contract float %212, %336
  %338 = or disjoint i64 %267, %85
  %339 = trunc i64 %338 to i32
  %340 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %339
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %340, align 2, !tbaa.struct !19
  %341 = zext i16 %.sroa.0291.0.copyload.i to i32
  %342 = lshr i32 %341, 10
  %343 = and i32 %342, 31
  %344 = and i32 %341, 1023
  switch i32 %343, label %350 [
    i32 31, label %345
    i32 0, label %352
  ]

345:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %346 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1017.i = icmp eq i32 %344, 0
  %347 = select i1 %.not1017.i, i32 2139095040, i32 2143289344
  %348 = or disjoint i32 %347, %346
  %349 = bitcast i32 %348 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

350:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %351 = or disjoint i32 %344, 1024
  br label %352

352:                                              ; preds = %350, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %353 = phi i32 [ %351, %350 ], [ %344, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %354 = uitofp i32 %353 to float
  %.not970.i = icmp eq i32 %343, 0
  %355 = add nsw i32 %343, -25
  %356 = select i1 %.not970.i, i32 -24, i32 %355
  %357 = call float @__ocml_ldexp_f32(float noundef %354, i32 noundef %356) #5
  %358 = fneg contract float %357
  %.not971972.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %359 = select contract i1 %.not971972.i, float %358, float %357
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %352, %345
  %360 = phi float [ %349, %345 ], [ %359, %352 ]
  %361 = fmul contract float %290, %360
  %362 = fadd contract float %237, %361
  %363 = or disjoint i64 %267, %86
  %364 = trunc i64 %363 to i32
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %364
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %365, align 2, !tbaa.struct !19
  %366 = zext i16 %.sroa.0282.0.copyload.i to i32
  %367 = lshr i32 %366, 10
  %368 = and i32 %367, 31
  %369 = and i32 %366, 1023
  switch i32 %368, label %375 [
    i32 31, label %370
    i32 0, label %377
  ]

370:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %371 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1016.i = icmp eq i32 %369, 0
  %372 = select i1 %.not1016.i, i32 2139095040, i32 2143289344
  %373 = or disjoint i32 %372, %371
  %374 = bitcast i32 %373 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

375:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %376 = or disjoint i32 %369, 1024
  br label %377

377:                                              ; preds = %375, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %378 = phi i32 [ %376, %375 ], [ %369, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %379 = uitofp i32 %378 to float
  %.not973.i = icmp eq i32 %368, 0
  %380 = add nsw i32 %368, -25
  %381 = select i1 %.not973.i, i32 -24, i32 %380
  %382 = call float @__ocml_ldexp_f32(float noundef %379, i32 noundef %381) #5
  %383 = fneg contract float %382
  %.not974975.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %384 = select contract i1 %.not974975.i, float %383, float %382
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %377, %370
  %385 = phi float [ %374, %370 ], [ %384, %377 ]
  %386 = fmul contract float %290, %385
  %387 = fadd contract float %262, %386
  %388 = or disjoint i64 %134, 2
  %389 = add nuw i64 %388, %117
  %390 = trunc i64 %389 to i32
  %391 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %390
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %391, align 2, !tbaa.struct !19
  %392 = shl nuw nsw i64 %388, 5
  %393 = or disjoint i64 %392, %83
  %394 = trunc i64 %393 to i32
  %395 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %394
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %395, align 2, !tbaa.struct !19
  %396 = zext i16 %.sroa.0273.0.copyload.i to i32
  %397 = lshr i32 %396, 10
  %398 = and i32 %397, 31
  %399 = and i32 %396, 1023
  switch i32 %398, label %405 [
    i32 31, label %400
    i32 0, label %407
  ]

400:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %401 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1015.i = icmp eq i32 %399, 0
  %402 = select i1 %.not1015.i, i32 2139095040, i32 2143289344
  %403 = or disjoint i32 %402, %401
  %404 = bitcast i32 %403 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

405:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %406 = or disjoint i32 %399, 1024
  br label %407

407:                                              ; preds = %405, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %408 = phi i32 [ %406, %405 ], [ %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %409 = uitofp i32 %408 to float
  %.not976.i = icmp eq i32 %398, 0
  %410 = add nsw i32 %398, -25
  %411 = select i1 %.not976.i, i32 -24, i32 %410
  %412 = call float @__ocml_ldexp_f32(float noundef %409, i32 noundef %411) #5
  %413 = fneg contract float %412
  %.not977978.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %414 = select contract i1 %.not977978.i, float %413, float %412
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %407, %400
  %415 = phi float [ %404, %400 ], [ %414, %407 ]
  %416 = zext i16 %.sroa.0264.0.copyload.i to i32
  %417 = lshr i32 %416, 10
  %418 = and i32 %417, 31
  %419 = and i32 %416, 1023
  switch i32 %418, label %425 [
    i32 31, label %420
    i32 0, label %427
  ]

420:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %421 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1014.i = icmp eq i32 %419, 0
  %422 = select i1 %.not1014.i, i32 2139095040, i32 2143289344
  %423 = or disjoint i32 %422, %421
  %424 = bitcast i32 %423 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

425:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %426 = or disjoint i32 %419, 1024
  br label %427

427:                                              ; preds = %425, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %428 = phi i32 [ %426, %425 ], [ %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %429 = uitofp i32 %428 to float
  %.not979.i = icmp eq i32 %418, 0
  %430 = add nsw i32 %418, -25
  %431 = select i1 %.not979.i, i32 -24, i32 %430
  %432 = call float @__ocml_ldexp_f32(float noundef %429, i32 noundef %431) #5
  %433 = fneg contract float %432
  %.not980981.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %434 = select contract i1 %.not980981.i, float %433, float %432
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %427, %420
  %435 = phi float [ %424, %420 ], [ %434, %427 ]
  %436 = fmul contract float %415, %435
  %437 = fadd contract float %312, %436
  %438 = or disjoint i64 %392, %84
  %439 = trunc i64 %438 to i32
  %440 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %439
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %440, align 2, !tbaa.struct !19
  %441 = zext i16 %.sroa.0255.0.copyload.i to i32
  %442 = lshr i32 %441, 10
  %443 = and i32 %442, 31
  %444 = and i32 %441, 1023
  switch i32 %443, label %450 [
    i32 31, label %445
    i32 0, label %452
  ]

445:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %446 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1013.i = icmp eq i32 %444, 0
  %447 = select i1 %.not1013.i, i32 2139095040, i32 2143289344
  %448 = or disjoint i32 %447, %446
  %449 = bitcast i32 %448 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

450:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %451 = or disjoint i32 %444, 1024
  br label %452

452:                                              ; preds = %450, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %453 = phi i32 [ %451, %450 ], [ %444, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %454 = uitofp i32 %453 to float
  %.not982.i = icmp eq i32 %443, 0
  %455 = add nsw i32 %443, -25
  %456 = select i1 %.not982.i, i32 -24, i32 %455
  %457 = call float @__ocml_ldexp_f32(float noundef %454, i32 noundef %456) #5
  %458 = fneg contract float %457
  %.not983984.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %459 = select contract i1 %.not983984.i, float %458, float %457
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %452, %445
  %460 = phi float [ %449, %445 ], [ %459, %452 ]
  %461 = fmul contract float %415, %460
  %462 = fadd contract float %337, %461
  %463 = or disjoint i64 %392, %85
  %464 = trunc i64 %463 to i32
  %465 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %464
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %465, align 2, !tbaa.struct !19
  %466 = zext i16 %.sroa.0246.0.copyload.i to i32
  %467 = lshr i32 %466, 10
  %468 = and i32 %467, 31
  %469 = and i32 %466, 1023
  switch i32 %468, label %475 [
    i32 31, label %470
    i32 0, label %477
  ]

470:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %471 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1012.i = icmp eq i32 %469, 0
  %472 = select i1 %.not1012.i, i32 2139095040, i32 2143289344
  %473 = or disjoint i32 %472, %471
  %474 = bitcast i32 %473 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

475:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %476 = or disjoint i32 %469, 1024
  br label %477

477:                                              ; preds = %475, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %478 = phi i32 [ %476, %475 ], [ %469, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %479 = uitofp i32 %478 to float
  %.not985.i = icmp eq i32 %468, 0
  %480 = add nsw i32 %468, -25
  %481 = select i1 %.not985.i, i32 -24, i32 %480
  %482 = call float @__ocml_ldexp_f32(float noundef %479, i32 noundef %481) #5
  %483 = fneg contract float %482
  %.not986987.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %484 = select contract i1 %.not986987.i, float %483, float %482
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %477, %470
  %485 = phi float [ %474, %470 ], [ %484, %477 ]
  %486 = fmul contract float %415, %485
  %487 = fadd contract float %362, %486
  %488 = or disjoint i64 %392, %86
  %489 = trunc i64 %488 to i32
  %490 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %489
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %490, align 2, !tbaa.struct !19
  %491 = zext i16 %.sroa.0237.0.copyload.i to i32
  %492 = lshr i32 %491, 10
  %493 = and i32 %492, 31
  %494 = and i32 %491, 1023
  switch i32 %493, label %500 [
    i32 31, label %495
    i32 0, label %502
  ]

495:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %496 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1011.i = icmp eq i32 %494, 0
  %497 = select i1 %.not1011.i, i32 2139095040, i32 2143289344
  %498 = or disjoint i32 %497, %496
  %499 = bitcast i32 %498 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

500:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %501 = or disjoint i32 %494, 1024
  br label %502

502:                                              ; preds = %500, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %503 = phi i32 [ %501, %500 ], [ %494, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %504 = uitofp i32 %503 to float
  %.not988.i = icmp eq i32 %493, 0
  %505 = add nsw i32 %493, -25
  %506 = select i1 %.not988.i, i32 -24, i32 %505
  %507 = call float @__ocml_ldexp_f32(float noundef %504, i32 noundef %506) #5
  %508 = fneg contract float %507
  %.not989990.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %509 = select contract i1 %.not989990.i, float %508, float %507
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %502, %495
  %510 = phi float [ %499, %495 ], [ %509, %502 ]
  %511 = fmul contract float %415, %510
  %512 = fadd contract float %387, %511
  %513 = or disjoint i64 %134, 3
  %514 = add nuw i64 %513, %117
  %515 = trunc i64 %514 to i32
  %516 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %515
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %516, align 2, !tbaa.struct !19
  %517 = shl nuw nsw i64 %513, 5
  %518 = or disjoint i64 %517, %83
  %519 = trunc i64 %518 to i32
  %520 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %519
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %520, align 2, !tbaa.struct !19
  %521 = zext i16 %.sroa.0228.0.copyload.i to i32
  %522 = lshr i32 %521, 10
  %523 = and i32 %522, 31
  %524 = and i32 %521, 1023
  switch i32 %523, label %530 [
    i32 31, label %525
    i32 0, label %532
  ]

525:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %526 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1010.i = icmp eq i32 %524, 0
  %527 = select i1 %.not1010.i, i32 2139095040, i32 2143289344
  %528 = or disjoint i32 %527, %526
  %529 = bitcast i32 %528 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

530:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %531 = or disjoint i32 %524, 1024
  br label %532

532:                                              ; preds = %530, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %533 = phi i32 [ %531, %530 ], [ %524, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %534 = uitofp i32 %533 to float
  %.not991.i = icmp eq i32 %523, 0
  %535 = add nsw i32 %523, -25
  %536 = select i1 %.not991.i, i32 -24, i32 %535
  %537 = call float @__ocml_ldexp_f32(float noundef %534, i32 noundef %536) #5
  %538 = fneg contract float %537
  %.not992993.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %539 = select contract i1 %.not992993.i, float %538, float %537
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %532, %525
  %540 = phi float [ %529, %525 ], [ %539, %532 ]
  %541 = zext i16 %.sroa.0219.0.copyload.i to i32
  %542 = lshr i32 %541, 10
  %543 = and i32 %542, 31
  %544 = and i32 %541, 1023
  switch i32 %543, label %550 [
    i32 31, label %545
    i32 0, label %552
  ]

545:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %546 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1009.i = icmp eq i32 %544, 0
  %547 = select i1 %.not1009.i, i32 2139095040, i32 2143289344
  %548 = or disjoint i32 %547, %546
  %549 = bitcast i32 %548 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

550:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %551 = or disjoint i32 %544, 1024
  br label %552

552:                                              ; preds = %550, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %553 = phi i32 [ %551, %550 ], [ %544, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %554 = uitofp i32 %553 to float
  %.not994.i = icmp eq i32 %543, 0
  %555 = add nsw i32 %543, -25
  %556 = select i1 %.not994.i, i32 -24, i32 %555
  %557 = call float @__ocml_ldexp_f32(float noundef %554, i32 noundef %556) #5
  %558 = fneg contract float %557
  %.not995996.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %559 = select contract i1 %.not995996.i, float %558, float %557
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %552, %545
  %560 = phi float [ %549, %545 ], [ %559, %552 ]
  %561 = fmul contract float %540, %560
  %562 = fadd contract float %437, %561
  %563 = or disjoint i64 %517, %84
  %564 = trunc i64 %563 to i32
  %565 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %564
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %565, align 2, !tbaa.struct !19
  %566 = zext i16 %.sroa.0210.0.copyload.i to i32
  %567 = lshr i32 %566, 10
  %568 = and i32 %567, 31
  %569 = and i32 %566, 1023
  switch i32 %568, label %575 [
    i32 31, label %570
    i32 0, label %577
  ]

570:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %571 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1008.i = icmp eq i32 %569, 0
  %572 = select i1 %.not1008.i, i32 2139095040, i32 2143289344
  %573 = or disjoint i32 %572, %571
  %574 = bitcast i32 %573 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

575:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %576 = or disjoint i32 %569, 1024
  br label %577

577:                                              ; preds = %575, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %578 = phi i32 [ %576, %575 ], [ %569, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %579 = uitofp i32 %578 to float
  %.not997.i = icmp eq i32 %568, 0
  %580 = add nsw i32 %568, -25
  %581 = select i1 %.not997.i, i32 -24, i32 %580
  %582 = call float @__ocml_ldexp_f32(float noundef %579, i32 noundef %581) #5
  %583 = fneg contract float %582
  %.not998999.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %584 = select contract i1 %.not998999.i, float %583, float %582
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %577, %570
  %585 = phi float [ %574, %570 ], [ %584, %577 ]
  %586 = fmul contract float %540, %585
  %587 = fadd contract float %462, %586
  %588 = or disjoint i64 %517, %85
  %589 = trunc i64 %588 to i32
  %590 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %589
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %590, align 2, !tbaa.struct !19
  %591 = zext i16 %.sroa.0201.0.copyload.i to i32
  %592 = lshr i32 %591, 10
  %593 = and i32 %592, 31
  %594 = and i32 %591, 1023
  switch i32 %593, label %600 [
    i32 31, label %595
    i32 0, label %602
  ]

595:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %596 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1007.i = icmp eq i32 %594, 0
  %597 = select i1 %.not1007.i, i32 2139095040, i32 2143289344
  %598 = or disjoint i32 %597, %596
  %599 = bitcast i32 %598 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

600:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %601 = or disjoint i32 %594, 1024
  br label %602

602:                                              ; preds = %600, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %603 = phi i32 [ %601, %600 ], [ %594, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %604 = uitofp i32 %603 to float
  %.not1000.i = icmp eq i32 %593, 0
  %605 = add nsw i32 %593, -25
  %606 = select i1 %.not1000.i, i32 -24, i32 %605
  %607 = call float @__ocml_ldexp_f32(float noundef %604, i32 noundef %606) #5
  %608 = fneg contract float %607
  %.not10011002.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %609 = select contract i1 %.not10011002.i, float %608, float %607
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %602, %595
  %610 = phi float [ %599, %595 ], [ %609, %602 ]
  %611 = fmul contract float %540, %610
  %612 = fadd contract float %487, %611
  %613 = or disjoint i64 %517, %86
  %614 = trunc i64 %613 to i32
  %615 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %614
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %615, align 2, !tbaa.struct !19
  %616 = zext i16 %.sroa.0192.0.copyload.i to i32
  %617 = lshr i32 %616, 10
  %618 = and i32 %617, 31
  %619 = and i32 %616, 1023
  switch i32 %618, label %625 [
    i32 31, label %620
    i32 0, label %627
  ]

620:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %621 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1006.i = icmp eq i32 %619, 0
  %622 = select i1 %.not1006.i, i32 2139095040, i32 2143289344
  %623 = or disjoint i32 %622, %621
  %624 = bitcast i32 %623 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

625:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %626 = or disjoint i32 %619, 1024
  br label %627

627:                                              ; preds = %625, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %628 = phi i32 [ %626, %625 ], [ %619, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %629 = uitofp i32 %628 to float
  %.not1003.i = icmp eq i32 %618, 0
  %630 = add nsw i32 %618, -25
  %631 = select i1 %.not1003.i, i32 -24, i32 %630
  %632 = call float @__ocml_ldexp_f32(float noundef %629, i32 noundef %631) #5
  %633 = fneg contract float %632
  %.not10041005.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %634 = select contract i1 %.not10041005.i, float %633, float %632
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %627, %620
  %635 = phi float [ %624, %620 ], [ %634, %627 ]
  %636 = fmul contract float %540, %635
  %637 = fadd contract float %512, %636
  %638 = add nuw nsw i64 %134, 4
  %639 = icmp ult i64 %134, 60
  br i1 %639, label %133, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

640:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1046.i
  %641 = phi i64 [ %105, %.lr.ph1046.i ], [ %653, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %642 = lshr i64 %641, 5
  %643 = icmp slt i64 %642, %107
  %644 = and i1 %643, %113
  br i1 %644, label %645, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

645:                                              ; preds = %640
  %646 = trunc i64 %641 to i32
  %647 = getelementptr inbounds float, ptr addrspace(3) %110, i32 %646
  %648 = load float, ptr addrspace(3) %647, align 4, !tbaa !29
  %649 = and i64 %641, 9223372036854775776
  %650 = or disjoint i64 %649, %111
  %651 = or disjoint i64 %650, %112
  %652 = getelementptr inbounds float, ptr %9, i64 %651
  store float %648, ptr %652, align 4, !tbaa !29
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %645, %640
  %653 = add nuw nsw i64 %641, 64
  %654 = icmp ult i64 %641, 1984
  br i1 %654, label %640, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !33

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
