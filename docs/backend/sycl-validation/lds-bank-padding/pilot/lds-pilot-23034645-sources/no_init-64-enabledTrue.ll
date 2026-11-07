;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-rbicsdru/kernel.cpp"
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
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %33 = icmp ult i64 %32, 64
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

.lr.ph1169.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %37 = icmp ult i64 %36, 33554431
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %39 = icmp eq i64 %38, 0
  call void @llvm.assume(i1 %39)
  %40 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %41 = icmp eq i64 %40, 0
  call void @llvm.assume(i1 %41)
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %43 = icmp ult i64 %42, 64
  call void @llvm.assume(i1 %43)
  %44 = shl i32 %.tr.i, 12
  %45 = sext i32 %3 to i64
  %46 = sext i32 %5 to i64
  %47 = sext i32 %44 to i64
  %48 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %49 = inttoptr i32 %48 to ptr addrspace(3)
  %50 = getelementptr inbounds i8, ptr addrspace(3) %49, i32 8192
  %51 = icmp slt i64 %42, %46
  br label %72

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %52 = phi i64 [ %32, %6 ], [ %55, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %53 = trunc i64 %52 to i32
  %54 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %53
  store float 0.000000e+00, ptr addrspace(3) %54, align 4, !tbaa !19
  %55 = add nuw nsw i64 %52, 64
  %56 = icmp ult i64 %52, 1984
  br i1 %56, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %.lr.ph1169.i, !llvm.loop !23

.lr.ph1172.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = shl i32 %.tr.i, 11
  %58 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %59 = icmp eq i64 %58, 0
  call void @llvm.assume(i1 %59)
  %60 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %61 = icmp eq i64 %60, 0
  call void @llvm.assume(i1 %61)
  %62 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %63 = icmp ult i64 %62, 64
  call void @llvm.assume(i1 %63)
  %64 = sext i32 %5 to i64
  %65 = sext i32 %4 to i64
  %66 = sext i32 %57 to i64
  %67 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %68 = inttoptr i32 %67 to ptr addrspace(3)
  %69 = getelementptr inbounds i8, ptr addrspace(3) %68, i32 16640
  %70 = and i64 %62, 31
  %71 = icmp slt i64 %70, %65
  br label %102

72:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i, %.lr.ph1169.i
  %73 = phi i64 [ %42, %.lr.ph1169.i ], [ %86, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i ]
  %74 = lshr i64 %73, 6
  %75 = icmp slt i64 %74, %45
  %76 = and i1 %75, %51
  br i1 %76, label %77, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i

77:                                               ; preds = %72
  %78 = and i64 %73, 9223372036854775744
  %79 = or disjoint i64 %78, %47
  %80 = or disjoint i64 %79, %42
  %81 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %80
  %.sroa.0417.0.copyload.i = load i16, ptr %81, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i: ; preds = %77, %72
  %.sroa.0419.1.i = phi i16 [ %.sroa.0417.0.copyload.i, %77 ], [ 0, %72 ]
  %82 = mul nuw nsw i64 %74, 66
  %83 = add nuw nsw i64 %82, %42
  %84 = trunc i64 %83 to i32
  %85 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %84
  store i16 %.sroa.0419.1.i, ptr addrspace(3) %85, align 2, !tbaa.struct !25
  %86 = add nuw nsw i64 %73, 64
  %87 = icmp ult i64 %73, 4032
  br i1 %87, label %72, label %.lr.ph1172.i, !llvm.loop !28

.lr.ph1175.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %89 = icmp eq i64 %88, 0
  call void @llvm.assume(i1 %89)
  %90 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %91 = icmp eq i64 %90, 0
  call void @llvm.assume(i1 %91)
  %92 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %93 = icmp ult i64 %92, 64
  call void @llvm.assume(i1 %93)
  %94 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %95 = inttoptr i32 %94 to ptr addrspace(3)
  %96 = getelementptr inbounds i8, ptr addrspace(3) %95, i32 8192
  %97 = getelementptr inbounds i8, ptr addrspace(3) %95, i32 16640
  %98 = and i64 %92, 7
  %99 = or disjoint i64 %98, 8
  %100 = or disjoint i64 %98, 16
  %101 = or disjoint i64 %98, 24
  br label %129

102:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1172.i
  %103 = phi i64 [ %62, %.lr.ph1172.i ], [ %114, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %104 = lshr i64 %103, 5
  %105 = icmp slt i64 %104, %64
  %106 = and i1 %105, %71
  br i1 %106, label %107, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

107:                                              ; preds = %102
  %108 = and i64 %103, 9223372036854775776
  %109 = or disjoint i64 %108, %66
  %110 = or disjoint i64 %109, %70
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %110
  %.sroa.0402.0.copyload.i = load i16, ptr %111, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %107, %102
  %.sroa.0404.1.i = phi i16 [ %.sroa.0402.0.copyload.i, %107 ], [ 0, %102 ]
  %112 = trunc i64 %103 to i32
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %69, i32 %112
  store i16 %.sroa.0404.1.i, ptr addrspace(3) %113, align 2, !tbaa.struct !25
  %114 = add nuw nsw i64 %103, 64
  %115 = icmp ult i64 %103, 1984
  br i1 %115, label %102, label %.lr.ph1175.i, !llvm.loop !31

.lr.ph1178.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %117 = icmp eq i64 %116, 0
  call void @llvm.assume(i1 %117)
  %118 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %119 = icmp eq i64 %118, 0
  call void @llvm.assume(i1 %119)
  %120 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %121 = icmp ult i64 %120, 64
  call void @llvm.assume(i1 %121)
  %122 = sext i32 %3 to i64
  %123 = sext i32 %4 to i64
  %124 = call i32 @llvm.amdgcn.groupstaticsize()
  %125 = inttoptr i32 %124 to ptr addrspace(3)
  %126 = sext i32 %57 to i64
  %127 = and i64 %120, 31
  %128 = icmp slt i64 %127, %123
  br label %659

129:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1175.i
  %130 = phi i64 [ %92, %.lr.ph1175.i ], [ %150, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %131 = lshr i64 %130, 3
  %132 = shl nuw nsw i64 %131, 5
  %133 = or disjoint i64 %132, %98
  %134 = trunc i64 %133 to i32
  %135 = getelementptr inbounds float, ptr addrspace(3) %95, i32 %134
  %136 = load float, ptr addrspace(3) %135, align 4, !tbaa !19
  %137 = or disjoint i64 %132, %99
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds float, ptr addrspace(3) %95, i32 %138
  %140 = load float, ptr addrspace(3) %139, align 4, !tbaa !19
  %141 = or disjoint i64 %132, %100
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds float, ptr addrspace(3) %95, i32 %142
  %144 = load float, ptr addrspace(3) %143, align 4, !tbaa !19
  %145 = or disjoint i64 %132, %101
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds float, ptr addrspace(3) %95, i32 %146
  %148 = load float, ptr addrspace(3) %147, align 4, !tbaa !19
  %149 = mul nuw nsw i64 %131, 66
  br label %152

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %581, ptr addrspace(3) %135, align 4, !tbaa !19
  store float %606, ptr addrspace(3) %139, align 4, !tbaa !19
  store float %631, ptr addrspace(3) %143, align 4, !tbaa !19
  store float %656, ptr addrspace(3) %147, align 4, !tbaa !19
  %150 = add nuw nsw i64 %130, 64
  %151 = icmp ult i64 %130, 448
  br i1 %151, label %129, label %.lr.ph1178.i, !llvm.loop !32

152:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %129
  %153 = phi i64 [ 0, %129 ], [ %657, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %154 = phi float [ %148, %129 ], [ %656, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = phi float [ %144, %129 ], [ %631, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = phi float [ %140, %129 ], [ %606, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %157 = phi float [ %136, %129 ], [ %581, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %158 = add nuw i64 %153, %149
  %159 = trunc i64 %158 to i32
  %160 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %159
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %160, align 2, !tbaa.struct !25
  %161 = shl nuw nsw i64 %153, 5
  %162 = or disjoint i64 %161, %98
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %163
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %164, align 2, !tbaa.struct !25
  %165 = zext i16 %.sroa.0363.0.copyload.i to i32
  %166 = lshr i32 %165, 10
  %167 = and i32 %166, 31
  %168 = and i32 %165, 1023
  switch i32 %167, label %174 [
    i32 31, label %169
    i32 0, label %176
  ]

169:                                              ; preds = %152
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %170 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1154.i = icmp eq i32 %168, 0
  %171 = select i1 %.not1154.i, i32 2139095040, i32 2143289344
  %172 = or disjoint i32 %171, %170
  %173 = bitcast i32 %172 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

174:                                              ; preds = %152
  %175 = or disjoint i32 %168, 1024
  br label %176

176:                                              ; preds = %174, %152
  %177 = phi i32 [ %175, %174 ], [ %168, %152 ]
  %178 = uitofp i32 %177 to float
  %.not.i = icmp eq i32 %167, 0
  %179 = add nsw i32 %167, -25
  %180 = select i1 %.not.i, i32 -24, i32 %179
  %181 = call float @__ocml_ldexp_f32(float noundef %178, i32 noundef %180) #5
  %182 = fneg contract float %181
  %.not10761077.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %183 = select contract i1 %.not10761077.i, float %182, float %181
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %176, %169
  %184 = phi float [ %173, %169 ], [ %183, %176 ]
  %185 = zext i16 %.sroa.0354.0.copyload.i to i32
  %186 = lshr i32 %185, 10
  %187 = and i32 %186, 31
  %188 = and i32 %185, 1023
  switch i32 %187, label %194 [
    i32 31, label %189
    i32 0, label %196
  ]

189:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %190 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1153.i = icmp eq i32 %188, 0
  %191 = select i1 %.not1153.i, i32 2139095040, i32 2143289344
  %192 = or disjoint i32 %191, %190
  %193 = bitcast i32 %192 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %195 = or disjoint i32 %188, 1024
  br label %196

196:                                              ; preds = %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %197 = phi i32 [ %195, %194 ], [ %188, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %198 = uitofp i32 %197 to float
  %.not1078.i = icmp eq i32 %187, 0
  %199 = add nsw i32 %187, -25
  %200 = select i1 %.not1078.i, i32 -24, i32 %199
  %201 = call float @__ocml_ldexp_f32(float noundef %198, i32 noundef %200) #5
  %202 = fneg contract float %201
  %.not10791080.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %203 = select contract i1 %.not10791080.i, float %202, float %201
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %196, %189
  %204 = phi float [ %193, %189 ], [ %203, %196 ]
  %205 = fmul contract float %184, %204
  %206 = fadd contract float %157, %205
  %207 = or disjoint i64 %161, %99
  %208 = trunc i64 %207 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %208
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %209, align 2, !tbaa.struct !25
  %210 = zext i16 %.sroa.0345.0.copyload.i to i32
  %211 = lshr i32 %210, 10
  %212 = and i32 %211, 31
  %213 = and i32 %210, 1023
  switch i32 %212, label %219 [
    i32 31, label %214
    i32 0, label %221
  ]

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %215 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1152.i = icmp eq i32 %213, 0
  %216 = select i1 %.not1152.i, i32 2139095040, i32 2143289344
  %217 = or disjoint i32 %216, %215
  %218 = bitcast i32 %217 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %220 = or disjoint i32 %213, 1024
  br label %221

221:                                              ; preds = %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %222 = phi i32 [ %220, %219 ], [ %213, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %223 = uitofp i32 %222 to float
  %.not1081.i = icmp eq i32 %212, 0
  %224 = add nsw i32 %212, -25
  %225 = select i1 %.not1081.i, i32 -24, i32 %224
  %226 = call float @__ocml_ldexp_f32(float noundef %223, i32 noundef %225) #5
  %227 = fneg contract float %226
  %.not10821083.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %228 = select contract i1 %.not10821083.i, float %227, float %226
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %221, %214
  %229 = phi float [ %218, %214 ], [ %228, %221 ]
  %230 = fmul contract float %184, %229
  %231 = fadd contract float %156, %230
  %232 = or disjoint i64 %161, %100
  %233 = trunc i64 %232 to i32
  %234 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %233
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %234, align 2, !tbaa.struct !25
  %235 = zext i16 %.sroa.0336.0.copyload.i to i32
  %236 = lshr i32 %235, 10
  %237 = and i32 %236, 31
  %238 = and i32 %235, 1023
  switch i32 %237, label %244 [
    i32 31, label %239
    i32 0, label %246
  ]

239:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %240 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1151.i = icmp eq i32 %238, 0
  %241 = select i1 %.not1151.i, i32 2139095040, i32 2143289344
  %242 = or disjoint i32 %241, %240
  %243 = bitcast i32 %242 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %245 = or disjoint i32 %238, 1024
  br label %246

246:                                              ; preds = %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %247 = phi i32 [ %245, %244 ], [ %238, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %248 = uitofp i32 %247 to float
  %.not1084.i = icmp eq i32 %237, 0
  %249 = add nsw i32 %237, -25
  %250 = select i1 %.not1084.i, i32 -24, i32 %249
  %251 = call float @__ocml_ldexp_f32(float noundef %248, i32 noundef %250) #5
  %252 = fneg contract float %251
  %.not10851086.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %253 = select contract i1 %.not10851086.i, float %252, float %251
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %246, %239
  %254 = phi float [ %243, %239 ], [ %253, %246 ]
  %255 = fmul contract float %184, %254
  %256 = fadd contract float %155, %255
  %257 = or disjoint i64 %161, %101
  %258 = trunc i64 %257 to i32
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %258
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %259, align 2, !tbaa.struct !25
  %260 = zext i16 %.sroa.0327.0.copyload.i to i32
  %261 = lshr i32 %260, 10
  %262 = and i32 %261, 31
  %263 = and i32 %260, 1023
  switch i32 %262, label %269 [
    i32 31, label %264
    i32 0, label %271
  ]

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %265 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1150.i = icmp eq i32 %263, 0
  %266 = select i1 %.not1150.i, i32 2139095040, i32 2143289344
  %267 = or disjoint i32 %266, %265
  %268 = bitcast i32 %267 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %270 = or disjoint i32 %263, 1024
  br label %271

271:                                              ; preds = %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %272 = phi i32 [ %270, %269 ], [ %263, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %273 = uitofp i32 %272 to float
  %.not1087.i = icmp eq i32 %262, 0
  %274 = add nsw i32 %262, -25
  %275 = select i1 %.not1087.i, i32 -24, i32 %274
  %276 = call float @__ocml_ldexp_f32(float noundef %273, i32 noundef %275) #5
  %277 = fneg contract float %276
  %.not10881089.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %278 = select contract i1 %.not10881089.i, float %277, float %276
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %271, %264
  %279 = phi float [ %268, %264 ], [ %278, %271 ]
  %280 = fmul contract float %184, %279
  %281 = fadd contract float %154, %280
  %282 = or disjoint i64 %153, 1
  %283 = add nuw i64 %282, %149
  %284 = trunc i64 %283 to i32
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %284
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %285, align 2, !tbaa.struct !25
  %286 = shl nuw nsw i64 %282, 5
  %287 = or disjoint i64 %286, %98
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %288
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !25
  %290 = zext i16 %.sroa.0318.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %295 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1149.i = icmp eq i32 %293, 0
  %296 = select i1 %.not1149.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not1090.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not1090.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #5
  %307 = fneg contract float %306
  %.not10911092.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %308 = select contract i1 %.not10911092.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = zext i16 %.sroa.0309.0.copyload.i to i32
  %311 = lshr i32 %310, 10
  %312 = and i32 %311, 31
  %313 = and i32 %310, 1023
  switch i32 %312, label %319 [
    i32 31, label %314
    i32 0, label %321
  ]

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %315 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1148.i = icmp eq i32 %313, 0
  %316 = select i1 %.not1148.i, i32 2139095040, i32 2143289344
  %317 = or disjoint i32 %316, %315
  %318 = bitcast i32 %317 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %320 = or disjoint i32 %313, 1024
  br label %321

321:                                              ; preds = %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %322 = phi i32 [ %320, %319 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %323 = uitofp i32 %322 to float
  %.not1093.i = icmp eq i32 %312, 0
  %324 = add nsw i32 %312, -25
  %325 = select i1 %.not1093.i, i32 -24, i32 %324
  %326 = call float @__ocml_ldexp_f32(float noundef %323, i32 noundef %325) #5
  %327 = fneg contract float %326
  %.not10941095.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %328 = select contract i1 %.not10941095.i, float %327, float %326
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %321, %314
  %329 = phi float [ %318, %314 ], [ %328, %321 ]
  %330 = fmul contract float %309, %329
  %331 = fadd contract float %206, %330
  %332 = or disjoint i64 %286, %99
  %333 = trunc i64 %332 to i32
  %334 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %333
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %334, align 2, !tbaa.struct !25
  %335 = zext i16 %.sroa.0300.0.copyload.i to i32
  %336 = lshr i32 %335, 10
  %337 = and i32 %336, 31
  %338 = and i32 %335, 1023
  switch i32 %337, label %344 [
    i32 31, label %339
    i32 0, label %346
  ]

339:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %340 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1147.i = icmp eq i32 %338, 0
  %341 = select i1 %.not1147.i, i32 2139095040, i32 2143289344
  %342 = or disjoint i32 %341, %340
  %343 = bitcast i32 %342 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %345 = or disjoint i32 %338, 1024
  br label %346

346:                                              ; preds = %344, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %347 = phi i32 [ %345, %344 ], [ %338, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %348 = uitofp i32 %347 to float
  %.not1096.i = icmp eq i32 %337, 0
  %349 = add nsw i32 %337, -25
  %350 = select i1 %.not1096.i, i32 -24, i32 %349
  %351 = call float @__ocml_ldexp_f32(float noundef %348, i32 noundef %350) #5
  %352 = fneg contract float %351
  %.not10971098.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %353 = select contract i1 %.not10971098.i, float %352, float %351
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %346, %339
  %354 = phi float [ %343, %339 ], [ %353, %346 ]
  %355 = fmul contract float %309, %354
  %356 = fadd contract float %231, %355
  %357 = or disjoint i64 %286, %100
  %358 = trunc i64 %357 to i32
  %359 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %358
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %359, align 2, !tbaa.struct !25
  %360 = zext i16 %.sroa.0291.0.copyload.i to i32
  %361 = lshr i32 %360, 10
  %362 = and i32 %361, 31
  %363 = and i32 %360, 1023
  switch i32 %362, label %369 [
    i32 31, label %364
    i32 0, label %371
  ]

364:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %365 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1146.i = icmp eq i32 %363, 0
  %366 = select i1 %.not1146.i, i32 2139095040, i32 2143289344
  %367 = or disjoint i32 %366, %365
  %368 = bitcast i32 %367 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %370 = or disjoint i32 %363, 1024
  br label %371

371:                                              ; preds = %369, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %372 = phi i32 [ %370, %369 ], [ %363, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %373 = uitofp i32 %372 to float
  %.not1099.i = icmp eq i32 %362, 0
  %374 = add nsw i32 %362, -25
  %375 = select i1 %.not1099.i, i32 -24, i32 %374
  %376 = call float @__ocml_ldexp_f32(float noundef %373, i32 noundef %375) #5
  %377 = fneg contract float %376
  %.not11001101.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %378 = select contract i1 %.not11001101.i, float %377, float %376
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %371, %364
  %379 = phi float [ %368, %364 ], [ %378, %371 ]
  %380 = fmul contract float %309, %379
  %381 = fadd contract float %256, %380
  %382 = or disjoint i64 %286, %101
  %383 = trunc i64 %382 to i32
  %384 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %383
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %384, align 2, !tbaa.struct !25
  %385 = zext i16 %.sroa.0282.0.copyload.i to i32
  %386 = lshr i32 %385, 10
  %387 = and i32 %386, 31
  %388 = and i32 %385, 1023
  switch i32 %387, label %394 [
    i32 31, label %389
    i32 0, label %396
  ]

389:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %390 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1145.i = icmp eq i32 %388, 0
  %391 = select i1 %.not1145.i, i32 2139095040, i32 2143289344
  %392 = or disjoint i32 %391, %390
  %393 = bitcast i32 %392 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %395 = or disjoint i32 %388, 1024
  br label %396

396:                                              ; preds = %394, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %397 = phi i32 [ %395, %394 ], [ %388, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %398 = uitofp i32 %397 to float
  %.not1102.i = icmp eq i32 %387, 0
  %399 = add nsw i32 %387, -25
  %400 = select i1 %.not1102.i, i32 -24, i32 %399
  %401 = call float @__ocml_ldexp_f32(float noundef %398, i32 noundef %400) #5
  %402 = fneg contract float %401
  %.not11031104.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %403 = select contract i1 %.not11031104.i, float %402, float %401
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %396, %389
  %404 = phi float [ %393, %389 ], [ %403, %396 ]
  %405 = fmul contract float %309, %404
  %406 = fadd contract float %281, %405
  %407 = or disjoint i64 %153, 2
  %408 = add nuw i64 %407, %149
  %409 = trunc i64 %408 to i32
  %410 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %409
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %410, align 2, !tbaa.struct !25
  %411 = shl nuw nsw i64 %407, 5
  %412 = or disjoint i64 %411, %98
  %413 = trunc i64 %412 to i32
  %414 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %413
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %414, align 2, !tbaa.struct !25
  %415 = zext i16 %.sroa.0273.0.copyload.i to i32
  %416 = lshr i32 %415, 10
  %417 = and i32 %416, 31
  %418 = and i32 %415, 1023
  switch i32 %417, label %424 [
    i32 31, label %419
    i32 0, label %426
  ]

419:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %420 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1144.i = icmp eq i32 %418, 0
  %421 = select i1 %.not1144.i, i32 2139095040, i32 2143289344
  %422 = or disjoint i32 %421, %420
  %423 = bitcast i32 %422 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

424:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %425 = or disjoint i32 %418, 1024
  br label %426

426:                                              ; preds = %424, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %427 = phi i32 [ %425, %424 ], [ %418, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %428 = uitofp i32 %427 to float
  %.not1105.i = icmp eq i32 %417, 0
  %429 = add nsw i32 %417, -25
  %430 = select i1 %.not1105.i, i32 -24, i32 %429
  %431 = call float @__ocml_ldexp_f32(float noundef %428, i32 noundef %430) #5
  %432 = fneg contract float %431
  %.not11061107.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %433 = select contract i1 %.not11061107.i, float %432, float %431
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %426, %419
  %434 = phi float [ %423, %419 ], [ %433, %426 ]
  %435 = zext i16 %.sroa.0264.0.copyload.i to i32
  %436 = lshr i32 %435, 10
  %437 = and i32 %436, 31
  %438 = and i32 %435, 1023
  switch i32 %437, label %444 [
    i32 31, label %439
    i32 0, label %446
  ]

439:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %440 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1143.i = icmp eq i32 %438, 0
  %441 = select i1 %.not1143.i, i32 2139095040, i32 2143289344
  %442 = or disjoint i32 %441, %440
  %443 = bitcast i32 %442 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

444:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %445 = or disjoint i32 %438, 1024
  br label %446

446:                                              ; preds = %444, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %447 = phi i32 [ %445, %444 ], [ %438, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %448 = uitofp i32 %447 to float
  %.not1108.i = icmp eq i32 %437, 0
  %449 = add nsw i32 %437, -25
  %450 = select i1 %.not1108.i, i32 -24, i32 %449
  %451 = call float @__ocml_ldexp_f32(float noundef %448, i32 noundef %450) #5
  %452 = fneg contract float %451
  %.not11091110.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %453 = select contract i1 %.not11091110.i, float %452, float %451
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %446, %439
  %454 = phi float [ %443, %439 ], [ %453, %446 ]
  %455 = fmul contract float %434, %454
  %456 = fadd contract float %331, %455
  %457 = or disjoint i64 %411, %99
  %458 = trunc i64 %457 to i32
  %459 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %458
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %459, align 2, !tbaa.struct !25
  %460 = zext i16 %.sroa.0255.0.copyload.i to i32
  %461 = lshr i32 %460, 10
  %462 = and i32 %461, 31
  %463 = and i32 %460, 1023
  switch i32 %462, label %469 [
    i32 31, label %464
    i32 0, label %471
  ]

464:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %465 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1142.i = icmp eq i32 %463, 0
  %466 = select i1 %.not1142.i, i32 2139095040, i32 2143289344
  %467 = or disjoint i32 %466, %465
  %468 = bitcast i32 %467 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

469:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %470 = or disjoint i32 %463, 1024
  br label %471

471:                                              ; preds = %469, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %472 = phi i32 [ %470, %469 ], [ %463, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %473 = uitofp i32 %472 to float
  %.not1111.i = icmp eq i32 %462, 0
  %474 = add nsw i32 %462, -25
  %475 = select i1 %.not1111.i, i32 -24, i32 %474
  %476 = call float @__ocml_ldexp_f32(float noundef %473, i32 noundef %475) #5
  %477 = fneg contract float %476
  %.not11121113.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %478 = select contract i1 %.not11121113.i, float %477, float %476
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %471, %464
  %479 = phi float [ %468, %464 ], [ %478, %471 ]
  %480 = fmul contract float %434, %479
  %481 = fadd contract float %356, %480
  %482 = or disjoint i64 %411, %100
  %483 = trunc i64 %482 to i32
  %484 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %483
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %484, align 2, !tbaa.struct !25
  %485 = zext i16 %.sroa.0246.0.copyload.i to i32
  %486 = lshr i32 %485, 10
  %487 = and i32 %486, 31
  %488 = and i32 %485, 1023
  switch i32 %487, label %494 [
    i32 31, label %489
    i32 0, label %496
  ]

489:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %490 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1141.i = icmp eq i32 %488, 0
  %491 = select i1 %.not1141.i, i32 2139095040, i32 2143289344
  %492 = or disjoint i32 %491, %490
  %493 = bitcast i32 %492 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

494:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %495 = or disjoint i32 %488, 1024
  br label %496

496:                                              ; preds = %494, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %497 = phi i32 [ %495, %494 ], [ %488, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %498 = uitofp i32 %497 to float
  %.not1114.i = icmp eq i32 %487, 0
  %499 = add nsw i32 %487, -25
  %500 = select i1 %.not1114.i, i32 -24, i32 %499
  %501 = call float @__ocml_ldexp_f32(float noundef %498, i32 noundef %500) #5
  %502 = fneg contract float %501
  %.not11151116.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %503 = select contract i1 %.not11151116.i, float %502, float %501
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %496, %489
  %504 = phi float [ %493, %489 ], [ %503, %496 ]
  %505 = fmul contract float %434, %504
  %506 = fadd contract float %381, %505
  %507 = or disjoint i64 %411, %101
  %508 = trunc i64 %507 to i32
  %509 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %508
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %509, align 2, !tbaa.struct !25
  %510 = zext i16 %.sroa.0237.0.copyload.i to i32
  %511 = lshr i32 %510, 10
  %512 = and i32 %511, 31
  %513 = and i32 %510, 1023
  switch i32 %512, label %519 [
    i32 31, label %514
    i32 0, label %521
  ]

514:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %515 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1140.i = icmp eq i32 %513, 0
  %516 = select i1 %.not1140.i, i32 2139095040, i32 2143289344
  %517 = or disjoint i32 %516, %515
  %518 = bitcast i32 %517 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

519:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %520 = or disjoint i32 %513, 1024
  br label %521

521:                                              ; preds = %519, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %522 = phi i32 [ %520, %519 ], [ %513, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %523 = uitofp i32 %522 to float
  %.not1117.i = icmp eq i32 %512, 0
  %524 = add nsw i32 %512, -25
  %525 = select i1 %.not1117.i, i32 -24, i32 %524
  %526 = call float @__ocml_ldexp_f32(float noundef %523, i32 noundef %525) #5
  %527 = fneg contract float %526
  %.not11181119.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %528 = select contract i1 %.not11181119.i, float %527, float %526
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %521, %514
  %529 = phi float [ %518, %514 ], [ %528, %521 ]
  %530 = fmul contract float %434, %529
  %531 = fadd contract float %406, %530
  %532 = or disjoint i64 %153, 3
  %533 = add nuw i64 %532, %149
  %534 = trunc i64 %533 to i32
  %535 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %534
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %535, align 2, !tbaa.struct !25
  %536 = shl nuw nsw i64 %532, 5
  %537 = or disjoint i64 %536, %98
  %538 = trunc i64 %537 to i32
  %539 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %538
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %539, align 2, !tbaa.struct !25
  %540 = zext i16 %.sroa.0228.0.copyload.i to i32
  %541 = lshr i32 %540, 10
  %542 = and i32 %541, 31
  %543 = and i32 %540, 1023
  switch i32 %542, label %549 [
    i32 31, label %544
    i32 0, label %551
  ]

544:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %545 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1139.i = icmp eq i32 %543, 0
  %546 = select i1 %.not1139.i, i32 2139095040, i32 2143289344
  %547 = or disjoint i32 %546, %545
  %548 = bitcast i32 %547 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

549:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %550 = or disjoint i32 %543, 1024
  br label %551

551:                                              ; preds = %549, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %552 = phi i32 [ %550, %549 ], [ %543, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %553 = uitofp i32 %552 to float
  %.not1120.i = icmp eq i32 %542, 0
  %554 = add nsw i32 %542, -25
  %555 = select i1 %.not1120.i, i32 -24, i32 %554
  %556 = call float @__ocml_ldexp_f32(float noundef %553, i32 noundef %555) #5
  %557 = fneg contract float %556
  %.not11211122.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %558 = select contract i1 %.not11211122.i, float %557, float %556
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %551, %544
  %559 = phi float [ %548, %544 ], [ %558, %551 ]
  %560 = zext i16 %.sroa.0219.0.copyload.i to i32
  %561 = lshr i32 %560, 10
  %562 = and i32 %561, 31
  %563 = and i32 %560, 1023
  switch i32 %562, label %569 [
    i32 31, label %564
    i32 0, label %571
  ]

564:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %565 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1138.i = icmp eq i32 %563, 0
  %566 = select i1 %.not1138.i, i32 2139095040, i32 2143289344
  %567 = or disjoint i32 %566, %565
  %568 = bitcast i32 %567 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

569:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %570 = or disjoint i32 %563, 1024
  br label %571

571:                                              ; preds = %569, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %572 = phi i32 [ %570, %569 ], [ %563, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %573 = uitofp i32 %572 to float
  %.not1123.i = icmp eq i32 %562, 0
  %574 = add nsw i32 %562, -25
  %575 = select i1 %.not1123.i, i32 -24, i32 %574
  %576 = call float @__ocml_ldexp_f32(float noundef %573, i32 noundef %575) #5
  %577 = fneg contract float %576
  %.not11241125.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %578 = select contract i1 %.not11241125.i, float %577, float %576
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %571, %564
  %579 = phi float [ %568, %564 ], [ %578, %571 ]
  %580 = fmul contract float %559, %579
  %581 = fadd contract float %456, %580
  %582 = or disjoint i64 %536, %99
  %583 = trunc i64 %582 to i32
  %584 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %583
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %584, align 2, !tbaa.struct !25
  %585 = zext i16 %.sroa.0210.0.copyload.i to i32
  %586 = lshr i32 %585, 10
  %587 = and i32 %586, 31
  %588 = and i32 %585, 1023
  switch i32 %587, label %594 [
    i32 31, label %589
    i32 0, label %596
  ]

589:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %590 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1137.i = icmp eq i32 %588, 0
  %591 = select i1 %.not1137.i, i32 2139095040, i32 2143289344
  %592 = or disjoint i32 %591, %590
  %593 = bitcast i32 %592 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

594:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %595 = or disjoint i32 %588, 1024
  br label %596

596:                                              ; preds = %594, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %597 = phi i32 [ %595, %594 ], [ %588, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %598 = uitofp i32 %597 to float
  %.not1126.i = icmp eq i32 %587, 0
  %599 = add nsw i32 %587, -25
  %600 = select i1 %.not1126.i, i32 -24, i32 %599
  %601 = call float @__ocml_ldexp_f32(float noundef %598, i32 noundef %600) #5
  %602 = fneg contract float %601
  %.not11271128.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %603 = select contract i1 %.not11271128.i, float %602, float %601
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %596, %589
  %604 = phi float [ %593, %589 ], [ %603, %596 ]
  %605 = fmul contract float %559, %604
  %606 = fadd contract float %481, %605
  %607 = or disjoint i64 %536, %100
  %608 = trunc i64 %607 to i32
  %609 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %608
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %609, align 2, !tbaa.struct !25
  %610 = zext i16 %.sroa.0201.0.copyload.i to i32
  %611 = lshr i32 %610, 10
  %612 = and i32 %611, 31
  %613 = and i32 %610, 1023
  switch i32 %612, label %619 [
    i32 31, label %614
    i32 0, label %621
  ]

614:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %615 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1136.i = icmp eq i32 %613, 0
  %616 = select i1 %.not1136.i, i32 2139095040, i32 2143289344
  %617 = or disjoint i32 %616, %615
  %618 = bitcast i32 %617 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

619:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %620 = or disjoint i32 %613, 1024
  br label %621

621:                                              ; preds = %619, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %622 = phi i32 [ %620, %619 ], [ %613, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %623 = uitofp i32 %622 to float
  %.not1129.i = icmp eq i32 %612, 0
  %624 = add nsw i32 %612, -25
  %625 = select i1 %.not1129.i, i32 -24, i32 %624
  %626 = call float @__ocml_ldexp_f32(float noundef %623, i32 noundef %625) #5
  %627 = fneg contract float %626
  %.not11301131.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %628 = select contract i1 %.not11301131.i, float %627, float %626
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %621, %614
  %629 = phi float [ %618, %614 ], [ %628, %621 ]
  %630 = fmul contract float %559, %629
  %631 = fadd contract float %506, %630
  %632 = or disjoint i64 %536, %101
  %633 = trunc i64 %632 to i32
  %634 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %633
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %634, align 2, !tbaa.struct !25
  %635 = zext i16 %.sroa.0192.0.copyload.i to i32
  %636 = lshr i32 %635, 10
  %637 = and i32 %636, 31
  %638 = and i32 %635, 1023
  switch i32 %637, label %644 [
    i32 31, label %639
    i32 0, label %646
  ]

639:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %640 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1135.i = icmp eq i32 %638, 0
  %641 = select i1 %.not1135.i, i32 2139095040, i32 2143289344
  %642 = or disjoint i32 %641, %640
  %643 = bitcast i32 %642 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

644:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %645 = or disjoint i32 %638, 1024
  br label %646

646:                                              ; preds = %644, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %647 = phi i32 [ %645, %644 ], [ %638, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %648 = uitofp i32 %647 to float
  %.not1132.i = icmp eq i32 %637, 0
  %649 = add nsw i32 %637, -25
  %650 = select i1 %.not1132.i, i32 -24, i32 %649
  %651 = call float @__ocml_ldexp_f32(float noundef %648, i32 noundef %650) #5
  %652 = fneg contract float %651
  %.not11331134.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %653 = select contract i1 %.not11331134.i, float %652, float %651
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %646, %639
  %654 = phi float [ %643, %639 ], [ %653, %646 ]
  %655 = fmul contract float %559, %654
  %656 = fadd contract float %531, %655
  %657 = add nuw nsw i64 %153, 4
  %658 = icmp ult i64 %153, 60
  br i1 %658, label %152, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, !llvm.loop !33

659:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph1178.i
  %660 = phi i64 [ %120, %.lr.ph1178.i ], [ %672, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %661 = lshr i64 %660, 5
  %662 = icmp slt i64 %661, %122
  %663 = and i1 %662, %128
  br i1 %663, label %664, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

664:                                              ; preds = %659
  %665 = trunc i64 %660 to i32
  %666 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %665
  %667 = load float, ptr addrspace(3) %666, align 4, !tbaa !19
  %668 = and i64 %660, 9223372036854775776
  %669 = or disjoint i64 %668, %126
  %670 = or disjoint i64 %669, %127
  %671 = getelementptr inbounds float, ptr %9, i64 %670
  store float %667, ptr %671, align 4, !tbaa !19
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %664, %659
  %672 = add nuw nsw i64 %660, 64
  %673 = icmp ult i64 %660, 1984
  br i1 %673, label %659, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !34

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
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
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{i64 0, i64 2, !26}
!26 = !{!27, !27, i64 0}
!27 = !{!"short", !21, i64 0}
!28 = distinct !{!28, !24, !29, !30}
!29 = !{!"llvm.loop.vectorize.width", i32 1}
!30 = !{!"llvm.loop.interleave.count", i32 1}
!31 = distinct !{!31, !24, !29, !30}
!32 = distinct !{!32, !24}
!33 = distinct !{!33, !24}
!34 = distinct !{!34, !24}
;----------------- End AdaptiveCpp IR dump ---------------
