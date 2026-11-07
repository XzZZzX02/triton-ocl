;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-a0r03my3/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 16777215
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 128
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
  %51 = icmp ult i64 %50, 128
  call void @llvm.assume(i1 %51)
  %52 = sext i32 %5 to i64
  %53 = sext i32 %4 to i64
  %54 = sext i32 %45 to i64
  %55 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %56 = inttoptr i32 %55 to ptr addrspace(3)
  %57 = getelementptr inbounds i8, ptr addrspace(3) %56, i32 16640
  %58 = and i64 %50, 31
  %59 = icmp slt i64 %58, %53
  br label %90

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %74, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit29.i.i.i ]
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
  %70 = mul nuw nsw i64 %62, 66
  %71 = add nuw nsw i64 %70, %43
  %72 = trunc i64 %71 to i32
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %72
  store i16 %.sroa.0395.1.i, ptr addrspace(3) %73, align 2, !tbaa.struct !19
  %74 = add nuw nsw i64 %61, 128
  %75 = icmp ult i64 %61, 3968
  br i1 %75, label %60, label %.lr.ph1040.i, !llvm.loop !24

.lr.ph1043.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %81 = icmp ult i64 %80, 128
  call void @llvm.assume(i1 %81)
  %82 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %83 = inttoptr i32 %82 to ptr addrspace(3)
  %84 = getelementptr inbounds i8, ptr addrspace(3) %83, i32 8192
  %85 = getelementptr inbounds i8, ptr addrspace(3) %83, i32 16640
  %86 = and i64 %80, 7
  %87 = or disjoint i64 %86, 8
  %88 = or disjoint i64 %86, 16
  %89 = or disjoint i64 %86, 24
  br label %117

90:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1040.i
  %91 = phi i64 [ %50, %.lr.ph1040.i ], [ %102, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %92 = lshr i64 %91, 5
  %93 = icmp slt i64 %92, %52
  %94 = and i1 %93, %59
  br i1 %94, label %95, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

95:                                               ; preds = %90
  %96 = and i64 %91, 9223372036854775776
  %97 = or disjoint i64 %96, %54
  %98 = or disjoint i64 %97, %58
  %99 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %98
  %.sroa.0378.0.copyload.i = load i16, ptr %99, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %95, %90
  %.sroa.0380.1.i = phi i16 [ %.sroa.0378.0.copyload.i, %95 ], [ 0, %90 ]
  %100 = trunc i64 %91 to i32
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %100
  store i16 %.sroa.0380.1.i, ptr addrspace(3) %101, align 2, !tbaa.struct !19
  %102 = add nuw nsw i64 %91, 128
  %103 = icmp ult i64 %91, 1920
  br i1 %103, label %90, label %.lr.ph1043.i, !llvm.loop !28

.lr.ph1046.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %105 = icmp eq i64 %104, 0
  call void @llvm.assume(i1 %105)
  %106 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %107 = icmp eq i64 %106, 0
  call void @llvm.assume(i1 %107)
  %108 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %109 = icmp ult i64 %108, 128
  call void @llvm.assume(i1 %109)
  %110 = sext i32 %3 to i64
  %111 = sext i32 %4 to i64
  %112 = call i32 @llvm.amdgcn.groupstaticsize()
  %113 = inttoptr i32 %112 to ptr addrspace(3)
  %114 = sext i32 %45 to i64
  %115 = and i64 %108, 31
  %116 = icmp slt i64 %115, %111
  br label %643

117:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph1043.i
  %118 = phi i64 [ %80, %.lr.ph1043.i ], [ %134, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %119 = lshr i64 %118, 3
  %120 = mul nuw nsw i64 %119, 66
  br label %136

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %121 = shl nuw nsw i64 %119, 5
  %122 = or disjoint i64 %121, %86
  %123 = trunc i64 %122 to i32
  %124 = getelementptr inbounds float, ptr addrspace(3) %83, i32 %123
  store float %565, ptr addrspace(3) %124, align 4, !tbaa !29
  %125 = or disjoint i64 %121, %87
  %126 = trunc i64 %125 to i32
  %127 = getelementptr inbounds float, ptr addrspace(3) %83, i32 %126
  store float %590, ptr addrspace(3) %127, align 4, !tbaa !29
  %128 = or disjoint i64 %121, %88
  %129 = trunc i64 %128 to i32
  %130 = getelementptr inbounds float, ptr addrspace(3) %83, i32 %129
  store float %615, ptr addrspace(3) %130, align 4, !tbaa !29
  %131 = or disjoint i64 %121, %89
  %132 = trunc i64 %131 to i32
  %133 = getelementptr inbounds float, ptr addrspace(3) %83, i32 %132
  store float %640, ptr addrspace(3) %133, align 4, !tbaa !29
  %134 = add nuw nsw i64 %118, 128
  %135 = icmp ult i64 %118, 384
  br i1 %135, label %117, label %.lr.ph1046.i, !llvm.loop !31

136:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %117
  %137 = phi i64 [ 0, %117 ], [ %641, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %138 = phi float [ 0.000000e+00, %117 ], [ %640, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %139 = phi float [ 0.000000e+00, %117 ], [ %615, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %140 = phi float [ 0.000000e+00, %117 ], [ %590, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %141 = phi float [ 0.000000e+00, %117 ], [ %565, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %142 = add nuw i64 %137, %120
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %143
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %144, align 2, !tbaa.struct !19
  %145 = shl nuw nsw i64 %137, 5
  %146 = or disjoint i64 %145, %86
  %147 = trunc i64 %146 to i32
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %147
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %148, align 2, !tbaa.struct !19
  %149 = zext i16 %.sroa.0363.0.copyload.i to i32
  %150 = lshr i32 %149, 10
  %151 = and i32 %150, 31
  %152 = and i32 %149, 1023
  switch i32 %151, label %158 [
    i32 31, label %153
    i32 0, label %160
  ]

153:                                              ; preds = %136
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %154 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1025.i = icmp eq i32 %152, 0
  %155 = select i1 %.not1025.i, i32 2139095040, i32 2143289344
  %156 = or disjoint i32 %155, %154
  %157 = bitcast i32 %156 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

158:                                              ; preds = %136
  %159 = or disjoint i32 %152, 1024
  br label %160

160:                                              ; preds = %158, %136
  %161 = phi i32 [ %159, %158 ], [ %152, %136 ]
  %162 = uitofp i32 %161 to float
  %.not.i = icmp eq i32 %151, 0
  %163 = add nsw i32 %151, -25
  %164 = select i1 %.not.i, i32 -24, i32 %163
  %165 = call float @__ocml_ldexp_f32(float noundef %162, i32 noundef %164) #5
  %166 = fneg contract float %165
  %.not947948.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %167 = select contract i1 %.not947948.i, float %166, float %165
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %160, %153
  %168 = phi float [ %157, %153 ], [ %167, %160 ]
  %169 = zext i16 %.sroa.0354.0.copyload.i to i32
  %170 = lshr i32 %169, 10
  %171 = and i32 %170, 31
  %172 = and i32 %169, 1023
  switch i32 %171, label %178 [
    i32 31, label %173
    i32 0, label %180
  ]

173:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %174 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1024.i = icmp eq i32 %172, 0
  %175 = select i1 %.not1024.i, i32 2139095040, i32 2143289344
  %176 = or disjoint i32 %175, %174
  %177 = bitcast i32 %176 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

178:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %179 = or disjoint i32 %172, 1024
  br label %180

180:                                              ; preds = %178, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %181 = phi i32 [ %179, %178 ], [ %172, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %182 = uitofp i32 %181 to float
  %.not949.i = icmp eq i32 %171, 0
  %183 = add nsw i32 %171, -25
  %184 = select i1 %.not949.i, i32 -24, i32 %183
  %185 = call float @__ocml_ldexp_f32(float noundef %182, i32 noundef %184) #5
  %186 = fneg contract float %185
  %.not950951.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %187 = select contract i1 %.not950951.i, float %186, float %185
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %180, %173
  %188 = phi float [ %177, %173 ], [ %187, %180 ]
  %189 = fmul contract float %168, %188
  %190 = fadd contract float %141, %189
  %191 = or disjoint i64 %145, %87
  %192 = trunc i64 %191 to i32
  %193 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %192
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %193, align 2, !tbaa.struct !19
  %194 = zext i16 %.sroa.0345.0.copyload.i to i32
  %195 = lshr i32 %194, 10
  %196 = and i32 %195, 31
  %197 = and i32 %194, 1023
  switch i32 %196, label %203 [
    i32 31, label %198
    i32 0, label %205
  ]

198:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %199 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1023.i = icmp eq i32 %197, 0
  %200 = select i1 %.not1023.i, i32 2139095040, i32 2143289344
  %201 = or disjoint i32 %200, %199
  %202 = bitcast i32 %201 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

203:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %204 = or disjoint i32 %197, 1024
  br label %205

205:                                              ; preds = %203, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %206 = phi i32 [ %204, %203 ], [ %197, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %207 = uitofp i32 %206 to float
  %.not952.i = icmp eq i32 %196, 0
  %208 = add nsw i32 %196, -25
  %209 = select i1 %.not952.i, i32 -24, i32 %208
  %210 = call float @__ocml_ldexp_f32(float noundef %207, i32 noundef %209) #5
  %211 = fneg contract float %210
  %.not953954.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %212 = select contract i1 %.not953954.i, float %211, float %210
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %205, %198
  %213 = phi float [ %202, %198 ], [ %212, %205 ]
  %214 = fmul contract float %168, %213
  %215 = fadd contract float %140, %214
  %216 = or disjoint i64 %145, %88
  %217 = trunc i64 %216 to i32
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %217
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %218, align 2, !tbaa.struct !19
  %219 = zext i16 %.sroa.0336.0.copyload.i to i32
  %220 = lshr i32 %219, 10
  %221 = and i32 %220, 31
  %222 = and i32 %219, 1023
  switch i32 %221, label %228 [
    i32 31, label %223
    i32 0, label %230
  ]

223:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %224 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1022.i = icmp eq i32 %222, 0
  %225 = select i1 %.not1022.i, i32 2139095040, i32 2143289344
  %226 = or disjoint i32 %225, %224
  %227 = bitcast i32 %226 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

228:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %229 = or disjoint i32 %222, 1024
  br label %230

230:                                              ; preds = %228, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %231 = phi i32 [ %229, %228 ], [ %222, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %232 = uitofp i32 %231 to float
  %.not955.i = icmp eq i32 %221, 0
  %233 = add nsw i32 %221, -25
  %234 = select i1 %.not955.i, i32 -24, i32 %233
  %235 = call float @__ocml_ldexp_f32(float noundef %232, i32 noundef %234) #5
  %236 = fneg contract float %235
  %.not956957.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %237 = select contract i1 %.not956957.i, float %236, float %235
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %230, %223
  %238 = phi float [ %227, %223 ], [ %237, %230 ]
  %239 = fmul contract float %168, %238
  %240 = fadd contract float %139, %239
  %241 = or disjoint i64 %145, %89
  %242 = trunc i64 %241 to i32
  %243 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %242
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %243, align 2, !tbaa.struct !19
  %244 = zext i16 %.sroa.0327.0.copyload.i to i32
  %245 = lshr i32 %244, 10
  %246 = and i32 %245, 31
  %247 = and i32 %244, 1023
  switch i32 %246, label %253 [
    i32 31, label %248
    i32 0, label %255
  ]

248:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %249 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1021.i = icmp eq i32 %247, 0
  %250 = select i1 %.not1021.i, i32 2139095040, i32 2143289344
  %251 = or disjoint i32 %250, %249
  %252 = bitcast i32 %251 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

253:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %254 = or disjoint i32 %247, 1024
  br label %255

255:                                              ; preds = %253, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %256 = phi i32 [ %254, %253 ], [ %247, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %257 = uitofp i32 %256 to float
  %.not958.i = icmp eq i32 %246, 0
  %258 = add nsw i32 %246, -25
  %259 = select i1 %.not958.i, i32 -24, i32 %258
  %260 = call float @__ocml_ldexp_f32(float noundef %257, i32 noundef %259) #5
  %261 = fneg contract float %260
  %.not959960.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %262 = select contract i1 %.not959960.i, float %261, float %260
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %255, %248
  %263 = phi float [ %252, %248 ], [ %262, %255 ]
  %264 = fmul contract float %168, %263
  %265 = fadd contract float %138, %264
  %266 = or disjoint i64 %137, 1
  %267 = add nuw i64 %266, %120
  %268 = trunc i64 %267 to i32
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %268
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %269, align 2, !tbaa.struct !19
  %270 = shl nuw nsw i64 %266, 5
  %271 = or disjoint i64 %270, %86
  %272 = trunc i64 %271 to i32
  %273 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %272
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %273, align 2, !tbaa.struct !19
  %274 = zext i16 %.sroa.0318.0.copyload.i to i32
  %275 = lshr i32 %274, 10
  %276 = and i32 %275, 31
  %277 = and i32 %274, 1023
  switch i32 %276, label %283 [
    i32 31, label %278
    i32 0, label %285
  ]

278:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %279 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1020.i = icmp eq i32 %277, 0
  %280 = select i1 %.not1020.i, i32 2139095040, i32 2143289344
  %281 = or disjoint i32 %280, %279
  %282 = bitcast i32 %281 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

283:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %284 = or disjoint i32 %277, 1024
  br label %285

285:                                              ; preds = %283, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %286 = phi i32 [ %284, %283 ], [ %277, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %287 = uitofp i32 %286 to float
  %.not961.i = icmp eq i32 %276, 0
  %288 = add nsw i32 %276, -25
  %289 = select i1 %.not961.i, i32 -24, i32 %288
  %290 = call float @__ocml_ldexp_f32(float noundef %287, i32 noundef %289) #5
  %291 = fneg contract float %290
  %.not962963.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %292 = select contract i1 %.not962963.i, float %291, float %290
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %285, %278
  %293 = phi float [ %282, %278 ], [ %292, %285 ]
  %294 = zext i16 %.sroa.0309.0.copyload.i to i32
  %295 = lshr i32 %294, 10
  %296 = and i32 %295, 31
  %297 = and i32 %294, 1023
  switch i32 %296, label %303 [
    i32 31, label %298
    i32 0, label %305
  ]

298:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %299 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1019.i = icmp eq i32 %297, 0
  %300 = select i1 %.not1019.i, i32 2139095040, i32 2143289344
  %301 = or disjoint i32 %300, %299
  %302 = bitcast i32 %301 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

303:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %304 = or disjoint i32 %297, 1024
  br label %305

305:                                              ; preds = %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %306 = phi i32 [ %304, %303 ], [ %297, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %307 = uitofp i32 %306 to float
  %.not964.i = icmp eq i32 %296, 0
  %308 = add nsw i32 %296, -25
  %309 = select i1 %.not964.i, i32 -24, i32 %308
  %310 = call float @__ocml_ldexp_f32(float noundef %307, i32 noundef %309) #5
  %311 = fneg contract float %310
  %.not965966.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %312 = select contract i1 %.not965966.i, float %311, float %310
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %305, %298
  %313 = phi float [ %302, %298 ], [ %312, %305 ]
  %314 = fmul contract float %293, %313
  %315 = fadd contract float %190, %314
  %316 = or disjoint i64 %270, %87
  %317 = trunc i64 %316 to i32
  %318 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %317
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %318, align 2, !tbaa.struct !19
  %319 = zext i16 %.sroa.0300.0.copyload.i to i32
  %320 = lshr i32 %319, 10
  %321 = and i32 %320, 31
  %322 = and i32 %319, 1023
  switch i32 %321, label %328 [
    i32 31, label %323
    i32 0, label %330
  ]

323:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %324 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1018.i = icmp eq i32 %322, 0
  %325 = select i1 %.not1018.i, i32 2139095040, i32 2143289344
  %326 = or disjoint i32 %325, %324
  %327 = bitcast i32 %326 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

328:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %329 = or disjoint i32 %322, 1024
  br label %330

330:                                              ; preds = %328, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %331 = phi i32 [ %329, %328 ], [ %322, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %332 = uitofp i32 %331 to float
  %.not967.i = icmp eq i32 %321, 0
  %333 = add nsw i32 %321, -25
  %334 = select i1 %.not967.i, i32 -24, i32 %333
  %335 = call float @__ocml_ldexp_f32(float noundef %332, i32 noundef %334) #5
  %336 = fneg contract float %335
  %.not968969.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %337 = select contract i1 %.not968969.i, float %336, float %335
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %330, %323
  %338 = phi float [ %327, %323 ], [ %337, %330 ]
  %339 = fmul contract float %293, %338
  %340 = fadd contract float %215, %339
  %341 = or disjoint i64 %270, %88
  %342 = trunc i64 %341 to i32
  %343 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %342
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %343, align 2, !tbaa.struct !19
  %344 = zext i16 %.sroa.0291.0.copyload.i to i32
  %345 = lshr i32 %344, 10
  %346 = and i32 %345, 31
  %347 = and i32 %344, 1023
  switch i32 %346, label %353 [
    i32 31, label %348
    i32 0, label %355
  ]

348:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %349 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1017.i = icmp eq i32 %347, 0
  %350 = select i1 %.not1017.i, i32 2139095040, i32 2143289344
  %351 = or disjoint i32 %350, %349
  %352 = bitcast i32 %351 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

353:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %354 = or disjoint i32 %347, 1024
  br label %355

355:                                              ; preds = %353, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %356 = phi i32 [ %354, %353 ], [ %347, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %357 = uitofp i32 %356 to float
  %.not970.i = icmp eq i32 %346, 0
  %358 = add nsw i32 %346, -25
  %359 = select i1 %.not970.i, i32 -24, i32 %358
  %360 = call float @__ocml_ldexp_f32(float noundef %357, i32 noundef %359) #5
  %361 = fneg contract float %360
  %.not971972.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %362 = select contract i1 %.not971972.i, float %361, float %360
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %355, %348
  %363 = phi float [ %352, %348 ], [ %362, %355 ]
  %364 = fmul contract float %293, %363
  %365 = fadd contract float %240, %364
  %366 = or disjoint i64 %270, %89
  %367 = trunc i64 %366 to i32
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %367
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %368, align 2, !tbaa.struct !19
  %369 = zext i16 %.sroa.0282.0.copyload.i to i32
  %370 = lshr i32 %369, 10
  %371 = and i32 %370, 31
  %372 = and i32 %369, 1023
  switch i32 %371, label %378 [
    i32 31, label %373
    i32 0, label %380
  ]

373:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %374 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1016.i = icmp eq i32 %372, 0
  %375 = select i1 %.not1016.i, i32 2139095040, i32 2143289344
  %376 = or disjoint i32 %375, %374
  %377 = bitcast i32 %376 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

378:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %379 = or disjoint i32 %372, 1024
  br label %380

380:                                              ; preds = %378, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %381 = phi i32 [ %379, %378 ], [ %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %382 = uitofp i32 %381 to float
  %.not973.i = icmp eq i32 %371, 0
  %383 = add nsw i32 %371, -25
  %384 = select i1 %.not973.i, i32 -24, i32 %383
  %385 = call float @__ocml_ldexp_f32(float noundef %382, i32 noundef %384) #5
  %386 = fneg contract float %385
  %.not974975.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %387 = select contract i1 %.not974975.i, float %386, float %385
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %380, %373
  %388 = phi float [ %377, %373 ], [ %387, %380 ]
  %389 = fmul contract float %293, %388
  %390 = fadd contract float %265, %389
  %391 = or disjoint i64 %137, 2
  %392 = add nuw i64 %391, %120
  %393 = trunc i64 %392 to i32
  %394 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %393
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %394, align 2, !tbaa.struct !19
  %395 = shl nuw nsw i64 %391, 5
  %396 = or disjoint i64 %395, %86
  %397 = trunc i64 %396 to i32
  %398 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %397
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %398, align 2, !tbaa.struct !19
  %399 = zext i16 %.sroa.0273.0.copyload.i to i32
  %400 = lshr i32 %399, 10
  %401 = and i32 %400, 31
  %402 = and i32 %399, 1023
  switch i32 %401, label %408 [
    i32 31, label %403
    i32 0, label %410
  ]

403:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %404 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1015.i = icmp eq i32 %402, 0
  %405 = select i1 %.not1015.i, i32 2139095040, i32 2143289344
  %406 = or disjoint i32 %405, %404
  %407 = bitcast i32 %406 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

408:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %409 = or disjoint i32 %402, 1024
  br label %410

410:                                              ; preds = %408, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %411 = phi i32 [ %409, %408 ], [ %402, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %412 = uitofp i32 %411 to float
  %.not976.i = icmp eq i32 %401, 0
  %413 = add nsw i32 %401, -25
  %414 = select i1 %.not976.i, i32 -24, i32 %413
  %415 = call float @__ocml_ldexp_f32(float noundef %412, i32 noundef %414) #5
  %416 = fneg contract float %415
  %.not977978.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %417 = select contract i1 %.not977978.i, float %416, float %415
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %410, %403
  %418 = phi float [ %407, %403 ], [ %417, %410 ]
  %419 = zext i16 %.sroa.0264.0.copyload.i to i32
  %420 = lshr i32 %419, 10
  %421 = and i32 %420, 31
  %422 = and i32 %419, 1023
  switch i32 %421, label %428 [
    i32 31, label %423
    i32 0, label %430
  ]

423:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %424 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1014.i = icmp eq i32 %422, 0
  %425 = select i1 %.not1014.i, i32 2139095040, i32 2143289344
  %426 = or disjoint i32 %425, %424
  %427 = bitcast i32 %426 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

428:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %429 = or disjoint i32 %422, 1024
  br label %430

430:                                              ; preds = %428, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %431 = phi i32 [ %429, %428 ], [ %422, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %432 = uitofp i32 %431 to float
  %.not979.i = icmp eq i32 %421, 0
  %433 = add nsw i32 %421, -25
  %434 = select i1 %.not979.i, i32 -24, i32 %433
  %435 = call float @__ocml_ldexp_f32(float noundef %432, i32 noundef %434) #5
  %436 = fneg contract float %435
  %.not980981.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %437 = select contract i1 %.not980981.i, float %436, float %435
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %430, %423
  %438 = phi float [ %427, %423 ], [ %437, %430 ]
  %439 = fmul contract float %418, %438
  %440 = fadd contract float %315, %439
  %441 = or disjoint i64 %395, %87
  %442 = trunc i64 %441 to i32
  %443 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %442
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %443, align 2, !tbaa.struct !19
  %444 = zext i16 %.sroa.0255.0.copyload.i to i32
  %445 = lshr i32 %444, 10
  %446 = and i32 %445, 31
  %447 = and i32 %444, 1023
  switch i32 %446, label %453 [
    i32 31, label %448
    i32 0, label %455
  ]

448:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %449 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1013.i = icmp eq i32 %447, 0
  %450 = select i1 %.not1013.i, i32 2139095040, i32 2143289344
  %451 = or disjoint i32 %450, %449
  %452 = bitcast i32 %451 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

453:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %454 = or disjoint i32 %447, 1024
  br label %455

455:                                              ; preds = %453, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %456 = phi i32 [ %454, %453 ], [ %447, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %457 = uitofp i32 %456 to float
  %.not982.i = icmp eq i32 %446, 0
  %458 = add nsw i32 %446, -25
  %459 = select i1 %.not982.i, i32 -24, i32 %458
  %460 = call float @__ocml_ldexp_f32(float noundef %457, i32 noundef %459) #5
  %461 = fneg contract float %460
  %.not983984.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %462 = select contract i1 %.not983984.i, float %461, float %460
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %455, %448
  %463 = phi float [ %452, %448 ], [ %462, %455 ]
  %464 = fmul contract float %418, %463
  %465 = fadd contract float %340, %464
  %466 = or disjoint i64 %395, %88
  %467 = trunc i64 %466 to i32
  %468 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %467
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %468, align 2, !tbaa.struct !19
  %469 = zext i16 %.sroa.0246.0.copyload.i to i32
  %470 = lshr i32 %469, 10
  %471 = and i32 %470, 31
  %472 = and i32 %469, 1023
  switch i32 %471, label %478 [
    i32 31, label %473
    i32 0, label %480
  ]

473:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %474 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1012.i = icmp eq i32 %472, 0
  %475 = select i1 %.not1012.i, i32 2139095040, i32 2143289344
  %476 = or disjoint i32 %475, %474
  %477 = bitcast i32 %476 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

478:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %479 = or disjoint i32 %472, 1024
  br label %480

480:                                              ; preds = %478, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %481 = phi i32 [ %479, %478 ], [ %472, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %482 = uitofp i32 %481 to float
  %.not985.i = icmp eq i32 %471, 0
  %483 = add nsw i32 %471, -25
  %484 = select i1 %.not985.i, i32 -24, i32 %483
  %485 = call float @__ocml_ldexp_f32(float noundef %482, i32 noundef %484) #5
  %486 = fneg contract float %485
  %.not986987.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %487 = select contract i1 %.not986987.i, float %486, float %485
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %480, %473
  %488 = phi float [ %477, %473 ], [ %487, %480 ]
  %489 = fmul contract float %418, %488
  %490 = fadd contract float %365, %489
  %491 = or disjoint i64 %395, %89
  %492 = trunc i64 %491 to i32
  %493 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %492
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %493, align 2, !tbaa.struct !19
  %494 = zext i16 %.sroa.0237.0.copyload.i to i32
  %495 = lshr i32 %494, 10
  %496 = and i32 %495, 31
  %497 = and i32 %494, 1023
  switch i32 %496, label %503 [
    i32 31, label %498
    i32 0, label %505
  ]

498:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %499 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1011.i = icmp eq i32 %497, 0
  %500 = select i1 %.not1011.i, i32 2139095040, i32 2143289344
  %501 = or disjoint i32 %500, %499
  %502 = bitcast i32 %501 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

503:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %504 = or disjoint i32 %497, 1024
  br label %505

505:                                              ; preds = %503, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %506 = phi i32 [ %504, %503 ], [ %497, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %507 = uitofp i32 %506 to float
  %.not988.i = icmp eq i32 %496, 0
  %508 = add nsw i32 %496, -25
  %509 = select i1 %.not988.i, i32 -24, i32 %508
  %510 = call float @__ocml_ldexp_f32(float noundef %507, i32 noundef %509) #5
  %511 = fneg contract float %510
  %.not989990.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %512 = select contract i1 %.not989990.i, float %511, float %510
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %505, %498
  %513 = phi float [ %502, %498 ], [ %512, %505 ]
  %514 = fmul contract float %418, %513
  %515 = fadd contract float %390, %514
  %516 = or disjoint i64 %137, 3
  %517 = add nuw i64 %516, %120
  %518 = trunc i64 %517 to i32
  %519 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %518
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %519, align 2, !tbaa.struct !19
  %520 = shl nuw nsw i64 %516, 5
  %521 = or disjoint i64 %520, %86
  %522 = trunc i64 %521 to i32
  %523 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %522
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %523, align 2, !tbaa.struct !19
  %524 = zext i16 %.sroa.0228.0.copyload.i to i32
  %525 = lshr i32 %524, 10
  %526 = and i32 %525, 31
  %527 = and i32 %524, 1023
  switch i32 %526, label %533 [
    i32 31, label %528
    i32 0, label %535
  ]

528:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %529 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1010.i = icmp eq i32 %527, 0
  %530 = select i1 %.not1010.i, i32 2139095040, i32 2143289344
  %531 = or disjoint i32 %530, %529
  %532 = bitcast i32 %531 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

533:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %534 = or disjoint i32 %527, 1024
  br label %535

535:                                              ; preds = %533, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %536 = phi i32 [ %534, %533 ], [ %527, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %537 = uitofp i32 %536 to float
  %.not991.i = icmp eq i32 %526, 0
  %538 = add nsw i32 %526, -25
  %539 = select i1 %.not991.i, i32 -24, i32 %538
  %540 = call float @__ocml_ldexp_f32(float noundef %537, i32 noundef %539) #5
  %541 = fneg contract float %540
  %.not992993.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %542 = select contract i1 %.not992993.i, float %541, float %540
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %535, %528
  %543 = phi float [ %532, %528 ], [ %542, %535 ]
  %544 = zext i16 %.sroa.0219.0.copyload.i to i32
  %545 = lshr i32 %544, 10
  %546 = and i32 %545, 31
  %547 = and i32 %544, 1023
  switch i32 %546, label %553 [
    i32 31, label %548
    i32 0, label %555
  ]

548:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %549 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1009.i = icmp eq i32 %547, 0
  %550 = select i1 %.not1009.i, i32 2139095040, i32 2143289344
  %551 = or disjoint i32 %550, %549
  %552 = bitcast i32 %551 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

553:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %554 = or disjoint i32 %547, 1024
  br label %555

555:                                              ; preds = %553, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %556 = phi i32 [ %554, %553 ], [ %547, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %557 = uitofp i32 %556 to float
  %.not994.i = icmp eq i32 %546, 0
  %558 = add nsw i32 %546, -25
  %559 = select i1 %.not994.i, i32 -24, i32 %558
  %560 = call float @__ocml_ldexp_f32(float noundef %557, i32 noundef %559) #5
  %561 = fneg contract float %560
  %.not995996.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %562 = select contract i1 %.not995996.i, float %561, float %560
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %555, %548
  %563 = phi float [ %552, %548 ], [ %562, %555 ]
  %564 = fmul contract float %543, %563
  %565 = fadd contract float %440, %564
  %566 = or disjoint i64 %520, %87
  %567 = trunc i64 %566 to i32
  %568 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %567
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %568, align 2, !tbaa.struct !19
  %569 = zext i16 %.sroa.0210.0.copyload.i to i32
  %570 = lshr i32 %569, 10
  %571 = and i32 %570, 31
  %572 = and i32 %569, 1023
  switch i32 %571, label %578 [
    i32 31, label %573
    i32 0, label %580
  ]

573:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %574 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1008.i = icmp eq i32 %572, 0
  %575 = select i1 %.not1008.i, i32 2139095040, i32 2143289344
  %576 = or disjoint i32 %575, %574
  %577 = bitcast i32 %576 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

578:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %579 = or disjoint i32 %572, 1024
  br label %580

580:                                              ; preds = %578, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %581 = phi i32 [ %579, %578 ], [ %572, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %582 = uitofp i32 %581 to float
  %.not997.i = icmp eq i32 %571, 0
  %583 = add nsw i32 %571, -25
  %584 = select i1 %.not997.i, i32 -24, i32 %583
  %585 = call float @__ocml_ldexp_f32(float noundef %582, i32 noundef %584) #5
  %586 = fneg contract float %585
  %.not998999.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %587 = select contract i1 %.not998999.i, float %586, float %585
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %580, %573
  %588 = phi float [ %577, %573 ], [ %587, %580 ]
  %589 = fmul contract float %543, %588
  %590 = fadd contract float %465, %589
  %591 = or disjoint i64 %520, %88
  %592 = trunc i64 %591 to i32
  %593 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %592
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %593, align 2, !tbaa.struct !19
  %594 = zext i16 %.sroa.0201.0.copyload.i to i32
  %595 = lshr i32 %594, 10
  %596 = and i32 %595, 31
  %597 = and i32 %594, 1023
  switch i32 %596, label %603 [
    i32 31, label %598
    i32 0, label %605
  ]

598:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %599 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1007.i = icmp eq i32 %597, 0
  %600 = select i1 %.not1007.i, i32 2139095040, i32 2143289344
  %601 = or disjoint i32 %600, %599
  %602 = bitcast i32 %601 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

603:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %604 = or disjoint i32 %597, 1024
  br label %605

605:                                              ; preds = %603, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %606 = phi i32 [ %604, %603 ], [ %597, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %607 = uitofp i32 %606 to float
  %.not1000.i = icmp eq i32 %596, 0
  %608 = add nsw i32 %596, -25
  %609 = select i1 %.not1000.i, i32 -24, i32 %608
  %610 = call float @__ocml_ldexp_f32(float noundef %607, i32 noundef %609) #5
  %611 = fneg contract float %610
  %.not10011002.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %612 = select contract i1 %.not10011002.i, float %611, float %610
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %605, %598
  %613 = phi float [ %602, %598 ], [ %612, %605 ]
  %614 = fmul contract float %543, %613
  %615 = fadd contract float %490, %614
  %616 = or disjoint i64 %520, %89
  %617 = trunc i64 %616 to i32
  %618 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %85, i32 %617
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %618, align 2, !tbaa.struct !19
  %619 = zext i16 %.sroa.0192.0.copyload.i to i32
  %620 = lshr i32 %619, 10
  %621 = and i32 %620, 31
  %622 = and i32 %619, 1023
  switch i32 %621, label %628 [
    i32 31, label %623
    i32 0, label %630
  ]

623:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %624 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1006.i = icmp eq i32 %622, 0
  %625 = select i1 %.not1006.i, i32 2139095040, i32 2143289344
  %626 = or disjoint i32 %625, %624
  %627 = bitcast i32 %626 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

628:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %629 = or disjoint i32 %622, 1024
  br label %630

630:                                              ; preds = %628, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %631 = phi i32 [ %629, %628 ], [ %622, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %632 = uitofp i32 %631 to float
  %.not1003.i = icmp eq i32 %621, 0
  %633 = add nsw i32 %621, -25
  %634 = select i1 %.not1003.i, i32 -24, i32 %633
  %635 = call float @__ocml_ldexp_f32(float noundef %632, i32 noundef %634) #5
  %636 = fneg contract float %635
  %.not10041005.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %637 = select contract i1 %.not10041005.i, float %636, float %635
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %630, %623
  %638 = phi float [ %627, %623 ], [ %637, %630 ]
  %639 = fmul contract float %543, %638
  %640 = fadd contract float %515, %639
  %641 = add nuw nsw i64 %137, 4
  %642 = icmp ult i64 %137, 60
  br i1 %642, label %136, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

643:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1046.i
  %644 = phi i64 [ %108, %.lr.ph1046.i ], [ %656, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %645 = lshr i64 %644, 5
  %646 = icmp slt i64 %645, %110
  %647 = and i1 %646, %116
  br i1 %647, label %648, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

648:                                              ; preds = %643
  %649 = trunc i64 %644 to i32
  %650 = getelementptr inbounds float, ptr addrspace(3) %113, i32 %649
  %651 = load float, ptr addrspace(3) %650, align 4, !tbaa !29
  %652 = and i64 %644, 9223372036854775776
  %653 = or disjoint i64 %652, %114
  %654 = or disjoint i64 %653, %115
  %655 = getelementptr inbounds float, ptr %9, i64 %654
  store float %651, ptr %655, align 4, !tbaa !29
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %648, %643
  %656 = add nuw nsw i64 %644, 128
  %657 = icmp ult i64 %644, 1920
  br i1 %657, label %643, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !33

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
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
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
