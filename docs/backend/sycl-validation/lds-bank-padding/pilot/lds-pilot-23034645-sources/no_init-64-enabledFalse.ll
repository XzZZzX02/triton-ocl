;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-0vwg7rev/kernel.cpp"
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
  %69 = getelementptr inbounds i8, ptr addrspace(3) %68, i32 16384
  %70 = and i64 %62, 31
  %71 = icmp slt i64 %70, %65
  br label %100

72:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i, %.lr.ph1169.i
  %73 = phi i64 [ %42, %.lr.ph1169.i ], [ %84, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i ]
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
  %82 = trunc i64 %73 to i32
  %83 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %82
  store i16 %.sroa.0419.1.i, ptr addrspace(3) %83, align 2, !tbaa.struct !25
  %84 = add nuw nsw i64 %73, 64
  %85 = icmp ult i64 %73, 4032
  br i1 %85, label %72, label %.lr.ph1172.i, !llvm.loop !28

.lr.ph1175.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %86 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %87 = icmp eq i64 %86, 0
  call void @llvm.assume(i1 %87)
  %88 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %89 = icmp eq i64 %88, 0
  call void @llvm.assume(i1 %89)
  %90 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %91 = icmp ult i64 %90, 64
  call void @llvm.assume(i1 %91)
  %92 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %93 = inttoptr i32 %92 to ptr addrspace(3)
  %94 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 8192
  %95 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 16384
  %96 = and i64 %90, 7
  %97 = or disjoint i64 %96, 8
  %98 = or disjoint i64 %96, 16
  %99 = or disjoint i64 %96, 24
  br label %127

100:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1172.i
  %101 = phi i64 [ %62, %.lr.ph1172.i ], [ %112, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %102 = lshr i64 %101, 5
  %103 = icmp slt i64 %102, %64
  %104 = and i1 %103, %71
  br i1 %104, label %105, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

105:                                              ; preds = %100
  %106 = and i64 %101, 9223372036854775776
  %107 = or disjoint i64 %106, %66
  %108 = or disjoint i64 %107, %70
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %108
  %.sroa.0402.0.copyload.i = load i16, ptr %109, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %105, %100
  %.sroa.0404.1.i = phi i16 [ %.sroa.0402.0.copyload.i, %105 ], [ 0, %100 ]
  %110 = trunc i64 %101 to i32
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %69, i32 %110
  store i16 %.sroa.0404.1.i, ptr addrspace(3) %111, align 2, !tbaa.struct !25
  %112 = add nuw nsw i64 %101, 64
  %113 = icmp ult i64 %101, 1984
  br i1 %113, label %100, label %.lr.ph1175.i, !llvm.loop !31

.lr.ph1178.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %115 = icmp eq i64 %114, 0
  call void @llvm.assume(i1 %115)
  %116 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %117 = icmp eq i64 %116, 0
  call void @llvm.assume(i1 %117)
  %118 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %119 = icmp ult i64 %118, 64
  call void @llvm.assume(i1 %119)
  %120 = sext i32 %3 to i64
  %121 = sext i32 %4 to i64
  %122 = call i32 @llvm.amdgcn.groupstaticsize()
  %123 = inttoptr i32 %122 to ptr addrspace(3)
  %124 = sext i32 %57 to i64
  %125 = and i64 %118, 31
  %126 = icmp slt i64 %125, %121
  br label %657

127:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1175.i
  %128 = phi i64 [ %90, %.lr.ph1175.i ], [ %148, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %129 = lshr i64 %128, 3
  %130 = shl nuw nsw i64 %129, 5
  %131 = or disjoint i64 %130, %96
  %132 = trunc i64 %131 to i32
  %133 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %132
  %134 = load float, ptr addrspace(3) %133, align 4, !tbaa !19
  %135 = or disjoint i64 %130, %97
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %136
  %138 = load float, ptr addrspace(3) %137, align 4, !tbaa !19
  %139 = or disjoint i64 %130, %98
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %140
  %142 = load float, ptr addrspace(3) %141, align 4, !tbaa !19
  %143 = or disjoint i64 %130, %99
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %144
  %146 = load float, ptr addrspace(3) %145, align 4, !tbaa !19
  %147 = shl nuw nsw i64 %129, 6
  br label %150

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %579, ptr addrspace(3) %133, align 4, !tbaa !19
  store float %604, ptr addrspace(3) %137, align 4, !tbaa !19
  store float %629, ptr addrspace(3) %141, align 4, !tbaa !19
  store float %654, ptr addrspace(3) %145, align 4, !tbaa !19
  %148 = add nuw nsw i64 %128, 64
  %149 = icmp ult i64 %128, 448
  br i1 %149, label %127, label %.lr.ph1178.i, !llvm.loop !32

150:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %127
  %151 = phi i64 [ 0, %127 ], [ %655, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %152 = phi float [ %146, %127 ], [ %654, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %153 = phi float [ %142, %127 ], [ %629, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %154 = phi float [ %138, %127 ], [ %604, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = phi float [ %134, %127 ], [ %579, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = add nuw i64 %151, %147
  %157 = trunc i64 %156 to i32
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %157
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %158, align 2, !tbaa.struct !25
  %159 = shl nuw nsw i64 %151, 5
  %160 = or disjoint i64 %159, %96
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %161
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %162, align 2, !tbaa.struct !25
  %163 = zext i16 %.sroa.0363.0.copyload.i to i32
  %164 = lshr i32 %163, 10
  %165 = and i32 %164, 31
  %166 = and i32 %163, 1023
  switch i32 %165, label %172 [
    i32 31, label %167
    i32 0, label %174
  ]

167:                                              ; preds = %150
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %168 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1154.i = icmp eq i32 %166, 0
  %169 = select i1 %.not1154.i, i32 2139095040, i32 2143289344
  %170 = or disjoint i32 %169, %168
  %171 = bitcast i32 %170 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

172:                                              ; preds = %150
  %173 = or disjoint i32 %166, 1024
  br label %174

174:                                              ; preds = %172, %150
  %175 = phi i32 [ %173, %172 ], [ %166, %150 ]
  %176 = uitofp i32 %175 to float
  %.not.i = icmp eq i32 %165, 0
  %177 = add nsw i32 %165, -25
  %178 = select i1 %.not.i, i32 -24, i32 %177
  %179 = call float @__ocml_ldexp_f32(float noundef %176, i32 noundef %178) #5
  %180 = fneg contract float %179
  %.not10761077.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %181 = select contract i1 %.not10761077.i, float %180, float %179
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %174, %167
  %182 = phi float [ %171, %167 ], [ %181, %174 ]
  %183 = zext i16 %.sroa.0354.0.copyload.i to i32
  %184 = lshr i32 %183, 10
  %185 = and i32 %184, 31
  %186 = and i32 %183, 1023
  switch i32 %185, label %192 [
    i32 31, label %187
    i32 0, label %194
  ]

187:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %188 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1153.i = icmp eq i32 %186, 0
  %189 = select i1 %.not1153.i, i32 2139095040, i32 2143289344
  %190 = or disjoint i32 %189, %188
  %191 = bitcast i32 %190 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

192:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %193 = or disjoint i32 %186, 1024
  br label %194

194:                                              ; preds = %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %195 = phi i32 [ %193, %192 ], [ %186, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %196 = uitofp i32 %195 to float
  %.not1078.i = icmp eq i32 %185, 0
  %197 = add nsw i32 %185, -25
  %198 = select i1 %.not1078.i, i32 -24, i32 %197
  %199 = call float @__ocml_ldexp_f32(float noundef %196, i32 noundef %198) #5
  %200 = fneg contract float %199
  %.not10791080.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %201 = select contract i1 %.not10791080.i, float %200, float %199
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %194, %187
  %202 = phi float [ %191, %187 ], [ %201, %194 ]
  %203 = fmul contract float %182, %202
  %204 = fadd contract float %155, %203
  %205 = or disjoint i64 %159, %97
  %206 = trunc i64 %205 to i32
  %207 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %206
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %207, align 2, !tbaa.struct !25
  %208 = zext i16 %.sroa.0345.0.copyload.i to i32
  %209 = lshr i32 %208, 10
  %210 = and i32 %209, 31
  %211 = and i32 %208, 1023
  switch i32 %210, label %217 [
    i32 31, label %212
    i32 0, label %219
  ]

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %213 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1152.i = icmp eq i32 %211, 0
  %214 = select i1 %.not1152.i, i32 2139095040, i32 2143289344
  %215 = or disjoint i32 %214, %213
  %216 = bitcast i32 %215 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %218 = or disjoint i32 %211, 1024
  br label %219

219:                                              ; preds = %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %220 = phi i32 [ %218, %217 ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %221 = uitofp i32 %220 to float
  %.not1081.i = icmp eq i32 %210, 0
  %222 = add nsw i32 %210, -25
  %223 = select i1 %.not1081.i, i32 -24, i32 %222
  %224 = call float @__ocml_ldexp_f32(float noundef %221, i32 noundef %223) #5
  %225 = fneg contract float %224
  %.not10821083.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %226 = select contract i1 %.not10821083.i, float %225, float %224
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %219, %212
  %227 = phi float [ %216, %212 ], [ %226, %219 ]
  %228 = fmul contract float %182, %227
  %229 = fadd contract float %154, %228
  %230 = or disjoint i64 %159, %98
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %231
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !25
  %233 = zext i16 %.sroa.0336.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %238 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1151.i = icmp eq i32 %236, 0
  %239 = select i1 %.not1151.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %245 = phi i32 [ %243, %242 ], [ %236, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %246 = uitofp i32 %245 to float
  %.not1084.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not1084.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #5
  %250 = fneg contract float %249
  %.not10851086.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %251 = select contract i1 %.not10851086.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = fmul contract float %182, %252
  %254 = fadd contract float %153, %253
  %255 = or disjoint i64 %159, %99
  %256 = trunc i64 %255 to i32
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %256
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %257, align 2, !tbaa.struct !25
  %258 = zext i16 %.sroa.0327.0.copyload.i to i32
  %259 = lshr i32 %258, 10
  %260 = and i32 %259, 31
  %261 = and i32 %258, 1023
  switch i32 %260, label %267 [
    i32 31, label %262
    i32 0, label %269
  ]

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %263 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1150.i = icmp eq i32 %261, 0
  %264 = select i1 %.not1150.i, i32 2139095040, i32 2143289344
  %265 = or disjoint i32 %264, %263
  %266 = bitcast i32 %265 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %268 = or disjoint i32 %261, 1024
  br label %269

269:                                              ; preds = %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %270 = phi i32 [ %268, %267 ], [ %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %271 = uitofp i32 %270 to float
  %.not1087.i = icmp eq i32 %260, 0
  %272 = add nsw i32 %260, -25
  %273 = select i1 %.not1087.i, i32 -24, i32 %272
  %274 = call float @__ocml_ldexp_f32(float noundef %271, i32 noundef %273) #5
  %275 = fneg contract float %274
  %.not10881089.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %276 = select contract i1 %.not10881089.i, float %275, float %274
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %269, %262
  %277 = phi float [ %266, %262 ], [ %276, %269 ]
  %278 = fmul contract float %182, %277
  %279 = fadd contract float %152, %278
  %280 = or disjoint i64 %151, 1
  %281 = add nuw i64 %280, %147
  %282 = trunc i64 %281 to i32
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %282
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %283, align 2, !tbaa.struct !25
  %284 = shl nuw nsw i64 %280, 5
  %285 = or disjoint i64 %284, %96
  %286 = trunc i64 %285 to i32
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %286
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %287, align 2, !tbaa.struct !25
  %288 = zext i16 %.sroa.0318.0.copyload.i to i32
  %289 = lshr i32 %288, 10
  %290 = and i32 %289, 31
  %291 = and i32 %288, 1023
  switch i32 %290, label %297 [
    i32 31, label %292
    i32 0, label %299
  ]

292:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %293 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1149.i = icmp eq i32 %291, 0
  %294 = select i1 %.not1149.i, i32 2139095040, i32 2143289344
  %295 = or disjoint i32 %294, %293
  %296 = bitcast i32 %295 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

297:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %298 = or disjoint i32 %291, 1024
  br label %299

299:                                              ; preds = %297, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %300 = phi i32 [ %298, %297 ], [ %291, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %301 = uitofp i32 %300 to float
  %.not1090.i = icmp eq i32 %290, 0
  %302 = add nsw i32 %290, -25
  %303 = select i1 %.not1090.i, i32 -24, i32 %302
  %304 = call float @__ocml_ldexp_f32(float noundef %301, i32 noundef %303) #5
  %305 = fneg contract float %304
  %.not10911092.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %306 = select contract i1 %.not10911092.i, float %305, float %304
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %299, %292
  %307 = phi float [ %296, %292 ], [ %306, %299 ]
  %308 = zext i16 %.sroa.0309.0.copyload.i to i32
  %309 = lshr i32 %308, 10
  %310 = and i32 %309, 31
  %311 = and i32 %308, 1023
  switch i32 %310, label %317 [
    i32 31, label %312
    i32 0, label %319
  ]

312:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %313 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1148.i = icmp eq i32 %311, 0
  %314 = select i1 %.not1148.i, i32 2139095040, i32 2143289344
  %315 = or disjoint i32 %314, %313
  %316 = bitcast i32 %315 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

317:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %318 = or disjoint i32 %311, 1024
  br label %319

319:                                              ; preds = %317, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %320 = phi i32 [ %318, %317 ], [ %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %321 = uitofp i32 %320 to float
  %.not1093.i = icmp eq i32 %310, 0
  %322 = add nsw i32 %310, -25
  %323 = select i1 %.not1093.i, i32 -24, i32 %322
  %324 = call float @__ocml_ldexp_f32(float noundef %321, i32 noundef %323) #5
  %325 = fneg contract float %324
  %.not10941095.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %326 = select contract i1 %.not10941095.i, float %325, float %324
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %319, %312
  %327 = phi float [ %316, %312 ], [ %326, %319 ]
  %328 = fmul contract float %307, %327
  %329 = fadd contract float %204, %328
  %330 = or disjoint i64 %284, %97
  %331 = trunc i64 %330 to i32
  %332 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %331
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %332, align 2, !tbaa.struct !25
  %333 = zext i16 %.sroa.0300.0.copyload.i to i32
  %334 = lshr i32 %333, 10
  %335 = and i32 %334, 31
  %336 = and i32 %333, 1023
  switch i32 %335, label %342 [
    i32 31, label %337
    i32 0, label %344
  ]

337:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %338 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1147.i = icmp eq i32 %336, 0
  %339 = select i1 %.not1147.i, i32 2139095040, i32 2143289344
  %340 = or disjoint i32 %339, %338
  %341 = bitcast i32 %340 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

342:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %343 = or disjoint i32 %336, 1024
  br label %344

344:                                              ; preds = %342, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %345 = phi i32 [ %343, %342 ], [ %336, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %346 = uitofp i32 %345 to float
  %.not1096.i = icmp eq i32 %335, 0
  %347 = add nsw i32 %335, -25
  %348 = select i1 %.not1096.i, i32 -24, i32 %347
  %349 = call float @__ocml_ldexp_f32(float noundef %346, i32 noundef %348) #5
  %350 = fneg contract float %349
  %.not10971098.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %351 = select contract i1 %.not10971098.i, float %350, float %349
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %344, %337
  %352 = phi float [ %341, %337 ], [ %351, %344 ]
  %353 = fmul contract float %307, %352
  %354 = fadd contract float %229, %353
  %355 = or disjoint i64 %284, %98
  %356 = trunc i64 %355 to i32
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %356
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %357, align 2, !tbaa.struct !25
  %358 = zext i16 %.sroa.0291.0.copyload.i to i32
  %359 = lshr i32 %358, 10
  %360 = and i32 %359, 31
  %361 = and i32 %358, 1023
  switch i32 %360, label %367 [
    i32 31, label %362
    i32 0, label %369
  ]

362:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %363 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1146.i = icmp eq i32 %361, 0
  %364 = select i1 %.not1146.i, i32 2139095040, i32 2143289344
  %365 = or disjoint i32 %364, %363
  %366 = bitcast i32 %365 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

367:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %368 = or disjoint i32 %361, 1024
  br label %369

369:                                              ; preds = %367, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %370 = phi i32 [ %368, %367 ], [ %361, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %371 = uitofp i32 %370 to float
  %.not1099.i = icmp eq i32 %360, 0
  %372 = add nsw i32 %360, -25
  %373 = select i1 %.not1099.i, i32 -24, i32 %372
  %374 = call float @__ocml_ldexp_f32(float noundef %371, i32 noundef %373) #5
  %375 = fneg contract float %374
  %.not11001101.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %376 = select contract i1 %.not11001101.i, float %375, float %374
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %369, %362
  %377 = phi float [ %366, %362 ], [ %376, %369 ]
  %378 = fmul contract float %307, %377
  %379 = fadd contract float %254, %378
  %380 = or disjoint i64 %284, %99
  %381 = trunc i64 %380 to i32
  %382 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %381
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %382, align 2, !tbaa.struct !25
  %383 = zext i16 %.sroa.0282.0.copyload.i to i32
  %384 = lshr i32 %383, 10
  %385 = and i32 %384, 31
  %386 = and i32 %383, 1023
  switch i32 %385, label %392 [
    i32 31, label %387
    i32 0, label %394
  ]

387:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %388 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1145.i = icmp eq i32 %386, 0
  %389 = select i1 %.not1145.i, i32 2139095040, i32 2143289344
  %390 = or disjoint i32 %389, %388
  %391 = bitcast i32 %390 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

392:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %393 = or disjoint i32 %386, 1024
  br label %394

394:                                              ; preds = %392, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %395 = phi i32 [ %393, %392 ], [ %386, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %396 = uitofp i32 %395 to float
  %.not1102.i = icmp eq i32 %385, 0
  %397 = add nsw i32 %385, -25
  %398 = select i1 %.not1102.i, i32 -24, i32 %397
  %399 = call float @__ocml_ldexp_f32(float noundef %396, i32 noundef %398) #5
  %400 = fneg contract float %399
  %.not11031104.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %401 = select contract i1 %.not11031104.i, float %400, float %399
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %394, %387
  %402 = phi float [ %391, %387 ], [ %401, %394 ]
  %403 = fmul contract float %307, %402
  %404 = fadd contract float %279, %403
  %405 = or disjoint i64 %151, 2
  %406 = add nuw i64 %405, %147
  %407 = trunc i64 %406 to i32
  %408 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %407
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %408, align 2, !tbaa.struct !25
  %409 = shl nuw nsw i64 %405, 5
  %410 = or disjoint i64 %409, %96
  %411 = trunc i64 %410 to i32
  %412 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %411
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %412, align 2, !tbaa.struct !25
  %413 = zext i16 %.sroa.0273.0.copyload.i to i32
  %414 = lshr i32 %413, 10
  %415 = and i32 %414, 31
  %416 = and i32 %413, 1023
  switch i32 %415, label %422 [
    i32 31, label %417
    i32 0, label %424
  ]

417:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %418 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1144.i = icmp eq i32 %416, 0
  %419 = select i1 %.not1144.i, i32 2139095040, i32 2143289344
  %420 = or disjoint i32 %419, %418
  %421 = bitcast i32 %420 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

422:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %423 = or disjoint i32 %416, 1024
  br label %424

424:                                              ; preds = %422, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %425 = phi i32 [ %423, %422 ], [ %416, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %426 = uitofp i32 %425 to float
  %.not1105.i = icmp eq i32 %415, 0
  %427 = add nsw i32 %415, -25
  %428 = select i1 %.not1105.i, i32 -24, i32 %427
  %429 = call float @__ocml_ldexp_f32(float noundef %426, i32 noundef %428) #5
  %430 = fneg contract float %429
  %.not11061107.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %431 = select contract i1 %.not11061107.i, float %430, float %429
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %424, %417
  %432 = phi float [ %421, %417 ], [ %431, %424 ]
  %433 = zext i16 %.sroa.0264.0.copyload.i to i32
  %434 = lshr i32 %433, 10
  %435 = and i32 %434, 31
  %436 = and i32 %433, 1023
  switch i32 %435, label %442 [
    i32 31, label %437
    i32 0, label %444
  ]

437:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %438 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1143.i = icmp eq i32 %436, 0
  %439 = select i1 %.not1143.i, i32 2139095040, i32 2143289344
  %440 = or disjoint i32 %439, %438
  %441 = bitcast i32 %440 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

442:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %443 = or disjoint i32 %436, 1024
  br label %444

444:                                              ; preds = %442, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %445 = phi i32 [ %443, %442 ], [ %436, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %446 = uitofp i32 %445 to float
  %.not1108.i = icmp eq i32 %435, 0
  %447 = add nsw i32 %435, -25
  %448 = select i1 %.not1108.i, i32 -24, i32 %447
  %449 = call float @__ocml_ldexp_f32(float noundef %446, i32 noundef %448) #5
  %450 = fneg contract float %449
  %.not11091110.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %451 = select contract i1 %.not11091110.i, float %450, float %449
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %444, %437
  %452 = phi float [ %441, %437 ], [ %451, %444 ]
  %453 = fmul contract float %432, %452
  %454 = fadd contract float %329, %453
  %455 = or disjoint i64 %409, %97
  %456 = trunc i64 %455 to i32
  %457 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %456
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %457, align 2, !tbaa.struct !25
  %458 = zext i16 %.sroa.0255.0.copyload.i to i32
  %459 = lshr i32 %458, 10
  %460 = and i32 %459, 31
  %461 = and i32 %458, 1023
  switch i32 %460, label %467 [
    i32 31, label %462
    i32 0, label %469
  ]

462:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %463 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1142.i = icmp eq i32 %461, 0
  %464 = select i1 %.not1142.i, i32 2139095040, i32 2143289344
  %465 = or disjoint i32 %464, %463
  %466 = bitcast i32 %465 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

467:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %468 = or disjoint i32 %461, 1024
  br label %469

469:                                              ; preds = %467, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %470 = phi i32 [ %468, %467 ], [ %461, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %471 = uitofp i32 %470 to float
  %.not1111.i = icmp eq i32 %460, 0
  %472 = add nsw i32 %460, -25
  %473 = select i1 %.not1111.i, i32 -24, i32 %472
  %474 = call float @__ocml_ldexp_f32(float noundef %471, i32 noundef %473) #5
  %475 = fneg contract float %474
  %.not11121113.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %476 = select contract i1 %.not11121113.i, float %475, float %474
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %469, %462
  %477 = phi float [ %466, %462 ], [ %476, %469 ]
  %478 = fmul contract float %432, %477
  %479 = fadd contract float %354, %478
  %480 = or disjoint i64 %409, %98
  %481 = trunc i64 %480 to i32
  %482 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %481
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %482, align 2, !tbaa.struct !25
  %483 = zext i16 %.sroa.0246.0.copyload.i to i32
  %484 = lshr i32 %483, 10
  %485 = and i32 %484, 31
  %486 = and i32 %483, 1023
  switch i32 %485, label %492 [
    i32 31, label %487
    i32 0, label %494
  ]

487:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %488 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1141.i = icmp eq i32 %486, 0
  %489 = select i1 %.not1141.i, i32 2139095040, i32 2143289344
  %490 = or disjoint i32 %489, %488
  %491 = bitcast i32 %490 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

492:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %493 = or disjoint i32 %486, 1024
  br label %494

494:                                              ; preds = %492, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %495 = phi i32 [ %493, %492 ], [ %486, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %496 = uitofp i32 %495 to float
  %.not1114.i = icmp eq i32 %485, 0
  %497 = add nsw i32 %485, -25
  %498 = select i1 %.not1114.i, i32 -24, i32 %497
  %499 = call float @__ocml_ldexp_f32(float noundef %496, i32 noundef %498) #5
  %500 = fneg contract float %499
  %.not11151116.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %501 = select contract i1 %.not11151116.i, float %500, float %499
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %494, %487
  %502 = phi float [ %491, %487 ], [ %501, %494 ]
  %503 = fmul contract float %432, %502
  %504 = fadd contract float %379, %503
  %505 = or disjoint i64 %409, %99
  %506 = trunc i64 %505 to i32
  %507 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %506
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %507, align 2, !tbaa.struct !25
  %508 = zext i16 %.sroa.0237.0.copyload.i to i32
  %509 = lshr i32 %508, 10
  %510 = and i32 %509, 31
  %511 = and i32 %508, 1023
  switch i32 %510, label %517 [
    i32 31, label %512
    i32 0, label %519
  ]

512:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %513 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1140.i = icmp eq i32 %511, 0
  %514 = select i1 %.not1140.i, i32 2139095040, i32 2143289344
  %515 = or disjoint i32 %514, %513
  %516 = bitcast i32 %515 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

517:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %518 = or disjoint i32 %511, 1024
  br label %519

519:                                              ; preds = %517, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %520 = phi i32 [ %518, %517 ], [ %511, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %521 = uitofp i32 %520 to float
  %.not1117.i = icmp eq i32 %510, 0
  %522 = add nsw i32 %510, -25
  %523 = select i1 %.not1117.i, i32 -24, i32 %522
  %524 = call float @__ocml_ldexp_f32(float noundef %521, i32 noundef %523) #5
  %525 = fneg contract float %524
  %.not11181119.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %526 = select contract i1 %.not11181119.i, float %525, float %524
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %519, %512
  %527 = phi float [ %516, %512 ], [ %526, %519 ]
  %528 = fmul contract float %432, %527
  %529 = fadd contract float %404, %528
  %530 = or disjoint i64 %151, 3
  %531 = add nuw i64 %530, %147
  %532 = trunc i64 %531 to i32
  %533 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %532
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %533, align 2, !tbaa.struct !25
  %534 = shl nuw nsw i64 %530, 5
  %535 = or disjoint i64 %534, %96
  %536 = trunc i64 %535 to i32
  %537 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %536
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %537, align 2, !tbaa.struct !25
  %538 = zext i16 %.sroa.0228.0.copyload.i to i32
  %539 = lshr i32 %538, 10
  %540 = and i32 %539, 31
  %541 = and i32 %538, 1023
  switch i32 %540, label %547 [
    i32 31, label %542
    i32 0, label %549
  ]

542:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %543 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1139.i = icmp eq i32 %541, 0
  %544 = select i1 %.not1139.i, i32 2139095040, i32 2143289344
  %545 = or disjoint i32 %544, %543
  %546 = bitcast i32 %545 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

547:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %548 = or disjoint i32 %541, 1024
  br label %549

549:                                              ; preds = %547, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %550 = phi i32 [ %548, %547 ], [ %541, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %551 = uitofp i32 %550 to float
  %.not1120.i = icmp eq i32 %540, 0
  %552 = add nsw i32 %540, -25
  %553 = select i1 %.not1120.i, i32 -24, i32 %552
  %554 = call float @__ocml_ldexp_f32(float noundef %551, i32 noundef %553) #5
  %555 = fneg contract float %554
  %.not11211122.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %556 = select contract i1 %.not11211122.i, float %555, float %554
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %549, %542
  %557 = phi float [ %546, %542 ], [ %556, %549 ]
  %558 = zext i16 %.sroa.0219.0.copyload.i to i32
  %559 = lshr i32 %558, 10
  %560 = and i32 %559, 31
  %561 = and i32 %558, 1023
  switch i32 %560, label %567 [
    i32 31, label %562
    i32 0, label %569
  ]

562:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %563 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1138.i = icmp eq i32 %561, 0
  %564 = select i1 %.not1138.i, i32 2139095040, i32 2143289344
  %565 = or disjoint i32 %564, %563
  %566 = bitcast i32 %565 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

567:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %568 = or disjoint i32 %561, 1024
  br label %569

569:                                              ; preds = %567, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %570 = phi i32 [ %568, %567 ], [ %561, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %571 = uitofp i32 %570 to float
  %.not1123.i = icmp eq i32 %560, 0
  %572 = add nsw i32 %560, -25
  %573 = select i1 %.not1123.i, i32 -24, i32 %572
  %574 = call float @__ocml_ldexp_f32(float noundef %571, i32 noundef %573) #5
  %575 = fneg contract float %574
  %.not11241125.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %576 = select contract i1 %.not11241125.i, float %575, float %574
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %569, %562
  %577 = phi float [ %566, %562 ], [ %576, %569 ]
  %578 = fmul contract float %557, %577
  %579 = fadd contract float %454, %578
  %580 = or disjoint i64 %534, %97
  %581 = trunc i64 %580 to i32
  %582 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %581
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %582, align 2, !tbaa.struct !25
  %583 = zext i16 %.sroa.0210.0.copyload.i to i32
  %584 = lshr i32 %583, 10
  %585 = and i32 %584, 31
  %586 = and i32 %583, 1023
  switch i32 %585, label %592 [
    i32 31, label %587
    i32 0, label %594
  ]

587:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %588 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1137.i = icmp eq i32 %586, 0
  %589 = select i1 %.not1137.i, i32 2139095040, i32 2143289344
  %590 = or disjoint i32 %589, %588
  %591 = bitcast i32 %590 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

592:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %593 = or disjoint i32 %586, 1024
  br label %594

594:                                              ; preds = %592, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %595 = phi i32 [ %593, %592 ], [ %586, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %596 = uitofp i32 %595 to float
  %.not1126.i = icmp eq i32 %585, 0
  %597 = add nsw i32 %585, -25
  %598 = select i1 %.not1126.i, i32 -24, i32 %597
  %599 = call float @__ocml_ldexp_f32(float noundef %596, i32 noundef %598) #5
  %600 = fneg contract float %599
  %.not11271128.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %601 = select contract i1 %.not11271128.i, float %600, float %599
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %594, %587
  %602 = phi float [ %591, %587 ], [ %601, %594 ]
  %603 = fmul contract float %557, %602
  %604 = fadd contract float %479, %603
  %605 = or disjoint i64 %534, %98
  %606 = trunc i64 %605 to i32
  %607 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %606
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %607, align 2, !tbaa.struct !25
  %608 = zext i16 %.sroa.0201.0.copyload.i to i32
  %609 = lshr i32 %608, 10
  %610 = and i32 %609, 31
  %611 = and i32 %608, 1023
  switch i32 %610, label %617 [
    i32 31, label %612
    i32 0, label %619
  ]

612:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %613 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1136.i = icmp eq i32 %611, 0
  %614 = select i1 %.not1136.i, i32 2139095040, i32 2143289344
  %615 = or disjoint i32 %614, %613
  %616 = bitcast i32 %615 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

617:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %618 = or disjoint i32 %611, 1024
  br label %619

619:                                              ; preds = %617, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %620 = phi i32 [ %618, %617 ], [ %611, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %621 = uitofp i32 %620 to float
  %.not1129.i = icmp eq i32 %610, 0
  %622 = add nsw i32 %610, -25
  %623 = select i1 %.not1129.i, i32 -24, i32 %622
  %624 = call float @__ocml_ldexp_f32(float noundef %621, i32 noundef %623) #5
  %625 = fneg contract float %624
  %.not11301131.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %626 = select contract i1 %.not11301131.i, float %625, float %624
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %619, %612
  %627 = phi float [ %616, %612 ], [ %626, %619 ]
  %628 = fmul contract float %557, %627
  %629 = fadd contract float %504, %628
  %630 = or disjoint i64 %534, %99
  %631 = trunc i64 %630 to i32
  %632 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %631
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %632, align 2, !tbaa.struct !25
  %633 = zext i16 %.sroa.0192.0.copyload.i to i32
  %634 = lshr i32 %633, 10
  %635 = and i32 %634, 31
  %636 = and i32 %633, 1023
  switch i32 %635, label %642 [
    i32 31, label %637
    i32 0, label %644
  ]

637:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %638 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1135.i = icmp eq i32 %636, 0
  %639 = select i1 %.not1135.i, i32 2139095040, i32 2143289344
  %640 = or disjoint i32 %639, %638
  %641 = bitcast i32 %640 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

642:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %643 = or disjoint i32 %636, 1024
  br label %644

644:                                              ; preds = %642, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %645 = phi i32 [ %643, %642 ], [ %636, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %646 = uitofp i32 %645 to float
  %.not1132.i = icmp eq i32 %635, 0
  %647 = add nsw i32 %635, -25
  %648 = select i1 %.not1132.i, i32 -24, i32 %647
  %649 = call float @__ocml_ldexp_f32(float noundef %646, i32 noundef %648) #5
  %650 = fneg contract float %649
  %.not11331134.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %651 = select contract i1 %.not11331134.i, float %650, float %649
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %644, %637
  %652 = phi float [ %641, %637 ], [ %651, %644 ]
  %653 = fmul contract float %557, %652
  %654 = fadd contract float %529, %653
  %655 = add nuw nsw i64 %151, 4
  %656 = icmp ult i64 %151, 60
  br i1 %656, label %150, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, !llvm.loop !33

657:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph1178.i
  %658 = phi i64 [ %118, %.lr.ph1178.i ], [ %670, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %659 = lshr i64 %658, 5
  %660 = icmp slt i64 %659, %120
  %661 = and i1 %660, %126
  br i1 %661, label %662, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

662:                                              ; preds = %657
  %663 = trunc i64 %658 to i32
  %664 = getelementptr inbounds float, ptr addrspace(3) %123, i32 %663
  %665 = load float, ptr addrspace(3) %664, align 4, !tbaa !19
  %666 = and i64 %658, 9223372036854775776
  %667 = or disjoint i64 %666, %124
  %668 = or disjoint i64 %667, %125
  %669 = getelementptr inbounds float, ptr %9, i64 %668
  store float %665, ptr %669, align 4, !tbaa !19
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %662, %657
  %670 = add nuw nsw i64 %658, 64
  %671 = icmp ult i64 %658, 1984
  br i1 %671, label %657, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !34

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
