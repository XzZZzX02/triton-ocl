;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-ce_ndq_1/kernel.cpp"
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
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %33 = icmp ult i64 %32, 128
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

.lr.ph1169.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %37 = icmp ult i64 %36, 16777215
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %39 = icmp eq i64 %38, 0
  call void @llvm.assume(i1 %39)
  %40 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %41 = icmp eq i64 %40, 0
  call void @llvm.assume(i1 %41)
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %43 = icmp ult i64 %42, 128
  call void @llvm.assume(i1 %43)
  %44 = shl i32 %.tr.i, 12
  %45 = sext i32 %3 to i64
  %46 = sext i32 %5 to i64
  %47 = sext i32 %44 to i64
  %48 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %49 = inttoptr i32 %48 to ptr addrspace(3)
  %50 = getelementptr inbounds i8, ptr addrspace(3) %49, i32 8192
  %51 = and i64 %42, 63
  %52 = icmp slt i64 %51, %46
  br label %73

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %53 = phi i64 [ %32, %6 ], [ %56, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %54 = trunc i64 %53 to i32
  %55 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %54
  store float 0.000000e+00, ptr addrspace(3) %55, align 4, !tbaa !19
  %56 = add nuw nsw i64 %53, 128
  %57 = icmp ult i64 %53, 1920
  br i1 %57, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %.lr.ph1169.i, !llvm.loop !23

.lr.ph1172.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = shl i32 %.tr.i, 11
  %59 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %60 = icmp eq i64 %59, 0
  call void @llvm.assume(i1 %60)
  %61 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %62 = icmp eq i64 %61, 0
  call void @llvm.assume(i1 %62)
  %63 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %64 = icmp ult i64 %63, 128
  call void @llvm.assume(i1 %64)
  %65 = sext i32 %5 to i64
  %66 = sext i32 %4 to i64
  %67 = sext i32 %58 to i64
  %68 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %69 = inttoptr i32 %68 to ptr addrspace(3)
  %70 = getelementptr inbounds i8, ptr addrspace(3) %69, i32 16640
  %71 = and i64 %63, 31
  %72 = icmp slt i64 %71, %66
  br label %103

73:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i, %.lr.ph1169.i
  %74 = phi i64 [ %42, %.lr.ph1169.i ], [ %87, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i ]
  %75 = lshr i64 %74, 6
  %76 = icmp slt i64 %75, %45
  %77 = and i1 %76, %52
  br i1 %77, label %78, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i

78:                                               ; preds = %73
  %79 = and i64 %74, 9223372036854775744
  %80 = or disjoint i64 %79, %47
  %81 = or disjoint i64 %80, %51
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %81
  %.sroa.0417.0.copyload.i = load i16, ptr %82, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i: ; preds = %78, %73
  %.sroa.0419.1.i = phi i16 [ %.sroa.0417.0.copyload.i, %78 ], [ 0, %73 ]
  %83 = mul nuw nsw i64 %75, 66
  %84 = add nuw nsw i64 %83, %51
  %85 = trunc i64 %84 to i32
  %86 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %85
  store i16 %.sroa.0419.1.i, ptr addrspace(3) %86, align 2, !tbaa.struct !25
  %87 = add nuw nsw i64 %74, 128
  %88 = icmp ult i64 %74, 3968
  br i1 %88, label %73, label %.lr.ph1172.i, !llvm.loop !28

.lr.ph1175.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %90 = icmp eq i64 %89, 0
  call void @llvm.assume(i1 %90)
  %91 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %92 = icmp eq i64 %91, 0
  call void @llvm.assume(i1 %92)
  %93 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %94 = icmp ult i64 %93, 128
  call void @llvm.assume(i1 %94)
  %95 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %96 = inttoptr i32 %95 to ptr addrspace(3)
  %97 = getelementptr inbounds i8, ptr addrspace(3) %96, i32 8192
  %98 = getelementptr inbounds i8, ptr addrspace(3) %96, i32 16640
  %99 = and i64 %93, 7
  %100 = or disjoint i64 %99, 8
  %101 = or disjoint i64 %99, 16
  %102 = or disjoint i64 %99, 24
  br label %130

103:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1172.i
  %104 = phi i64 [ %63, %.lr.ph1172.i ], [ %115, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %105 = lshr i64 %104, 5
  %106 = icmp slt i64 %105, %65
  %107 = and i1 %106, %72
  br i1 %107, label %108, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

108:                                              ; preds = %103
  %109 = and i64 %104, 9223372036854775776
  %110 = or disjoint i64 %109, %67
  %111 = or disjoint i64 %110, %71
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %111
  %.sroa.0402.0.copyload.i = load i16, ptr %112, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %108, %103
  %.sroa.0404.1.i = phi i16 [ %.sroa.0402.0.copyload.i, %108 ], [ 0, %103 ]
  %113 = trunc i64 %104 to i32
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %70, i32 %113
  store i16 %.sroa.0404.1.i, ptr addrspace(3) %114, align 2, !tbaa.struct !25
  %115 = add nuw nsw i64 %104, 128
  %116 = icmp ult i64 %104, 1920
  br i1 %116, label %103, label %.lr.ph1175.i, !llvm.loop !31

.lr.ph1178.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %118 = icmp eq i64 %117, 0
  call void @llvm.assume(i1 %118)
  %119 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %120 = icmp eq i64 %119, 0
  call void @llvm.assume(i1 %120)
  %121 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %122 = icmp ult i64 %121, 128
  call void @llvm.assume(i1 %122)
  %123 = sext i32 %3 to i64
  %124 = sext i32 %4 to i64
  %125 = call i32 @llvm.amdgcn.groupstaticsize()
  %126 = inttoptr i32 %125 to ptr addrspace(3)
  %127 = sext i32 %58 to i64
  %128 = and i64 %121, 31
  %129 = icmp slt i64 %128, %124
  br label %660

130:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1175.i
  %131 = phi i64 [ %93, %.lr.ph1175.i ], [ %151, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %132 = lshr i64 %131, 3
  %133 = shl nuw nsw i64 %132, 5
  %134 = or disjoint i64 %133, %99
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds float, ptr addrspace(3) %96, i32 %135
  %137 = load float, ptr addrspace(3) %136, align 4, !tbaa !19
  %138 = or disjoint i64 %133, %100
  %139 = trunc i64 %138 to i32
  %140 = getelementptr inbounds float, ptr addrspace(3) %96, i32 %139
  %141 = load float, ptr addrspace(3) %140, align 4, !tbaa !19
  %142 = or disjoint i64 %133, %101
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds float, ptr addrspace(3) %96, i32 %143
  %145 = load float, ptr addrspace(3) %144, align 4, !tbaa !19
  %146 = or disjoint i64 %133, %102
  %147 = trunc i64 %146 to i32
  %148 = getelementptr inbounds float, ptr addrspace(3) %96, i32 %147
  %149 = load float, ptr addrspace(3) %148, align 4, !tbaa !19
  %150 = mul nuw nsw i64 %132, 66
  br label %153

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %582, ptr addrspace(3) %136, align 4, !tbaa !19
  store float %607, ptr addrspace(3) %140, align 4, !tbaa !19
  store float %632, ptr addrspace(3) %144, align 4, !tbaa !19
  store float %657, ptr addrspace(3) %148, align 4, !tbaa !19
  %151 = add nuw nsw i64 %131, 128
  %152 = icmp ult i64 %131, 384
  br i1 %152, label %130, label %.lr.ph1178.i, !llvm.loop !32

153:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %130
  %154 = phi i64 [ 0, %130 ], [ %658, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = phi float [ %149, %130 ], [ %657, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = phi float [ %145, %130 ], [ %632, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %157 = phi float [ %141, %130 ], [ %607, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %158 = phi float [ %137, %130 ], [ %582, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %159 = add nuw i64 %154, %150
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %160
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %161, align 2, !tbaa.struct !25
  %162 = shl nuw nsw i64 %154, 5
  %163 = or disjoint i64 %162, %99
  %164 = trunc i64 %163 to i32
  %165 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %164
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %165, align 2, !tbaa.struct !25
  %166 = zext i16 %.sroa.0363.0.copyload.i to i32
  %167 = lshr i32 %166, 10
  %168 = and i32 %167, 31
  %169 = and i32 %166, 1023
  switch i32 %168, label %175 [
    i32 31, label %170
    i32 0, label %177
  ]

170:                                              ; preds = %153
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %171 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1154.i = icmp eq i32 %169, 0
  %172 = select i1 %.not1154.i, i32 2139095040, i32 2143289344
  %173 = or disjoint i32 %172, %171
  %174 = bitcast i32 %173 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

175:                                              ; preds = %153
  %176 = or disjoint i32 %169, 1024
  br label %177

177:                                              ; preds = %175, %153
  %178 = phi i32 [ %176, %175 ], [ %169, %153 ]
  %179 = uitofp i32 %178 to float
  %.not.i = icmp eq i32 %168, 0
  %180 = add nsw i32 %168, -25
  %181 = select i1 %.not.i, i32 -24, i32 %180
  %182 = call float @__ocml_ldexp_f32(float noundef %179, i32 noundef %181) #5
  %183 = fneg contract float %182
  %.not10761077.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %184 = select contract i1 %.not10761077.i, float %183, float %182
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %177, %170
  %185 = phi float [ %174, %170 ], [ %184, %177 ]
  %186 = zext i16 %.sroa.0354.0.copyload.i to i32
  %187 = lshr i32 %186, 10
  %188 = and i32 %187, 31
  %189 = and i32 %186, 1023
  switch i32 %188, label %195 [
    i32 31, label %190
    i32 0, label %197
  ]

190:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %191 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1153.i = icmp eq i32 %189, 0
  %192 = select i1 %.not1153.i, i32 2139095040, i32 2143289344
  %193 = or disjoint i32 %192, %191
  %194 = bitcast i32 %193 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

195:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %196 = or disjoint i32 %189, 1024
  br label %197

197:                                              ; preds = %195, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %198 = phi i32 [ %196, %195 ], [ %189, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %199 = uitofp i32 %198 to float
  %.not1078.i = icmp eq i32 %188, 0
  %200 = add nsw i32 %188, -25
  %201 = select i1 %.not1078.i, i32 -24, i32 %200
  %202 = call float @__ocml_ldexp_f32(float noundef %199, i32 noundef %201) #5
  %203 = fneg contract float %202
  %.not10791080.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %204 = select contract i1 %.not10791080.i, float %203, float %202
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %197, %190
  %205 = phi float [ %194, %190 ], [ %204, %197 ]
  %206 = fmul contract float %185, %205
  %207 = fadd contract float %158, %206
  %208 = or disjoint i64 %162, %100
  %209 = trunc i64 %208 to i32
  %210 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %209
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %210, align 2, !tbaa.struct !25
  %211 = zext i16 %.sroa.0345.0.copyload.i to i32
  %212 = lshr i32 %211, 10
  %213 = and i32 %212, 31
  %214 = and i32 %211, 1023
  switch i32 %213, label %220 [
    i32 31, label %215
    i32 0, label %222
  ]

215:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %216 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1152.i = icmp eq i32 %214, 0
  %217 = select i1 %.not1152.i, i32 2139095040, i32 2143289344
  %218 = or disjoint i32 %217, %216
  %219 = bitcast i32 %218 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

220:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %221 = or disjoint i32 %214, 1024
  br label %222

222:                                              ; preds = %220, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %223 = phi i32 [ %221, %220 ], [ %214, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %224 = uitofp i32 %223 to float
  %.not1081.i = icmp eq i32 %213, 0
  %225 = add nsw i32 %213, -25
  %226 = select i1 %.not1081.i, i32 -24, i32 %225
  %227 = call float @__ocml_ldexp_f32(float noundef %224, i32 noundef %226) #5
  %228 = fneg contract float %227
  %.not10821083.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %229 = select contract i1 %.not10821083.i, float %228, float %227
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %222, %215
  %230 = phi float [ %219, %215 ], [ %229, %222 ]
  %231 = fmul contract float %185, %230
  %232 = fadd contract float %157, %231
  %233 = or disjoint i64 %162, %101
  %234 = trunc i64 %233 to i32
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %234
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %235, align 2, !tbaa.struct !25
  %236 = zext i16 %.sroa.0336.0.copyload.i to i32
  %237 = lshr i32 %236, 10
  %238 = and i32 %237, 31
  %239 = and i32 %236, 1023
  switch i32 %238, label %245 [
    i32 31, label %240
    i32 0, label %247
  ]

240:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %241 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1151.i = icmp eq i32 %239, 0
  %242 = select i1 %.not1151.i, i32 2139095040, i32 2143289344
  %243 = or disjoint i32 %242, %241
  %244 = bitcast i32 %243 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

245:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %246 = or disjoint i32 %239, 1024
  br label %247

247:                                              ; preds = %245, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %248 = phi i32 [ %246, %245 ], [ %239, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %249 = uitofp i32 %248 to float
  %.not1084.i = icmp eq i32 %238, 0
  %250 = add nsw i32 %238, -25
  %251 = select i1 %.not1084.i, i32 -24, i32 %250
  %252 = call float @__ocml_ldexp_f32(float noundef %249, i32 noundef %251) #5
  %253 = fneg contract float %252
  %.not10851086.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %254 = select contract i1 %.not10851086.i, float %253, float %252
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %247, %240
  %255 = phi float [ %244, %240 ], [ %254, %247 ]
  %256 = fmul contract float %185, %255
  %257 = fadd contract float %156, %256
  %258 = or disjoint i64 %162, %102
  %259 = trunc i64 %258 to i32
  %260 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %259
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %260, align 2, !tbaa.struct !25
  %261 = zext i16 %.sroa.0327.0.copyload.i to i32
  %262 = lshr i32 %261, 10
  %263 = and i32 %262, 31
  %264 = and i32 %261, 1023
  switch i32 %263, label %270 [
    i32 31, label %265
    i32 0, label %272
  ]

265:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %266 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1150.i = icmp eq i32 %264, 0
  %267 = select i1 %.not1150.i, i32 2139095040, i32 2143289344
  %268 = or disjoint i32 %267, %266
  %269 = bitcast i32 %268 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

270:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %271 = or disjoint i32 %264, 1024
  br label %272

272:                                              ; preds = %270, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %273 = phi i32 [ %271, %270 ], [ %264, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %274 = uitofp i32 %273 to float
  %.not1087.i = icmp eq i32 %263, 0
  %275 = add nsw i32 %263, -25
  %276 = select i1 %.not1087.i, i32 -24, i32 %275
  %277 = call float @__ocml_ldexp_f32(float noundef %274, i32 noundef %276) #5
  %278 = fneg contract float %277
  %.not10881089.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %279 = select contract i1 %.not10881089.i, float %278, float %277
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %272, %265
  %280 = phi float [ %269, %265 ], [ %279, %272 ]
  %281 = fmul contract float %185, %280
  %282 = fadd contract float %155, %281
  %283 = or disjoint i64 %154, 1
  %284 = add nuw i64 %283, %150
  %285 = trunc i64 %284 to i32
  %286 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %285
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %286, align 2, !tbaa.struct !25
  %287 = shl nuw nsw i64 %283, 5
  %288 = or disjoint i64 %287, %99
  %289 = trunc i64 %288 to i32
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %289
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %290, align 2, !tbaa.struct !25
  %291 = zext i16 %.sroa.0318.0.copyload.i to i32
  %292 = lshr i32 %291, 10
  %293 = and i32 %292, 31
  %294 = and i32 %291, 1023
  switch i32 %293, label %300 [
    i32 31, label %295
    i32 0, label %302
  ]

295:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %296 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1149.i = icmp eq i32 %294, 0
  %297 = select i1 %.not1149.i, i32 2139095040, i32 2143289344
  %298 = or disjoint i32 %297, %296
  %299 = bitcast i32 %298 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

300:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %301 = or disjoint i32 %294, 1024
  br label %302

302:                                              ; preds = %300, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %303 = phi i32 [ %301, %300 ], [ %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %304 = uitofp i32 %303 to float
  %.not1090.i = icmp eq i32 %293, 0
  %305 = add nsw i32 %293, -25
  %306 = select i1 %.not1090.i, i32 -24, i32 %305
  %307 = call float @__ocml_ldexp_f32(float noundef %304, i32 noundef %306) #5
  %308 = fneg contract float %307
  %.not10911092.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %309 = select contract i1 %.not10911092.i, float %308, float %307
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %302, %295
  %310 = phi float [ %299, %295 ], [ %309, %302 ]
  %311 = zext i16 %.sroa.0309.0.copyload.i to i32
  %312 = lshr i32 %311, 10
  %313 = and i32 %312, 31
  %314 = and i32 %311, 1023
  switch i32 %313, label %320 [
    i32 31, label %315
    i32 0, label %322
  ]

315:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %316 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1148.i = icmp eq i32 %314, 0
  %317 = select i1 %.not1148.i, i32 2139095040, i32 2143289344
  %318 = or disjoint i32 %317, %316
  %319 = bitcast i32 %318 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

320:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %321 = or disjoint i32 %314, 1024
  br label %322

322:                                              ; preds = %320, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %323 = phi i32 [ %321, %320 ], [ %314, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %324 = uitofp i32 %323 to float
  %.not1093.i = icmp eq i32 %313, 0
  %325 = add nsw i32 %313, -25
  %326 = select i1 %.not1093.i, i32 -24, i32 %325
  %327 = call float @__ocml_ldexp_f32(float noundef %324, i32 noundef %326) #5
  %328 = fneg contract float %327
  %.not10941095.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %329 = select contract i1 %.not10941095.i, float %328, float %327
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %322, %315
  %330 = phi float [ %319, %315 ], [ %329, %322 ]
  %331 = fmul contract float %310, %330
  %332 = fadd contract float %207, %331
  %333 = or disjoint i64 %287, %100
  %334 = trunc i64 %333 to i32
  %335 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %334
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %335, align 2, !tbaa.struct !25
  %336 = zext i16 %.sroa.0300.0.copyload.i to i32
  %337 = lshr i32 %336, 10
  %338 = and i32 %337, 31
  %339 = and i32 %336, 1023
  switch i32 %338, label %345 [
    i32 31, label %340
    i32 0, label %347
  ]

340:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %341 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1147.i = icmp eq i32 %339, 0
  %342 = select i1 %.not1147.i, i32 2139095040, i32 2143289344
  %343 = or disjoint i32 %342, %341
  %344 = bitcast i32 %343 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

345:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %346 = or disjoint i32 %339, 1024
  br label %347

347:                                              ; preds = %345, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %348 = phi i32 [ %346, %345 ], [ %339, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %349 = uitofp i32 %348 to float
  %.not1096.i = icmp eq i32 %338, 0
  %350 = add nsw i32 %338, -25
  %351 = select i1 %.not1096.i, i32 -24, i32 %350
  %352 = call float @__ocml_ldexp_f32(float noundef %349, i32 noundef %351) #5
  %353 = fneg contract float %352
  %.not10971098.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %354 = select contract i1 %.not10971098.i, float %353, float %352
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %347, %340
  %355 = phi float [ %344, %340 ], [ %354, %347 ]
  %356 = fmul contract float %310, %355
  %357 = fadd contract float %232, %356
  %358 = or disjoint i64 %287, %101
  %359 = trunc i64 %358 to i32
  %360 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %359
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %360, align 2, !tbaa.struct !25
  %361 = zext i16 %.sroa.0291.0.copyload.i to i32
  %362 = lshr i32 %361, 10
  %363 = and i32 %362, 31
  %364 = and i32 %361, 1023
  switch i32 %363, label %370 [
    i32 31, label %365
    i32 0, label %372
  ]

365:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %366 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1146.i = icmp eq i32 %364, 0
  %367 = select i1 %.not1146.i, i32 2139095040, i32 2143289344
  %368 = or disjoint i32 %367, %366
  %369 = bitcast i32 %368 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

370:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %371 = or disjoint i32 %364, 1024
  br label %372

372:                                              ; preds = %370, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %373 = phi i32 [ %371, %370 ], [ %364, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %374 = uitofp i32 %373 to float
  %.not1099.i = icmp eq i32 %363, 0
  %375 = add nsw i32 %363, -25
  %376 = select i1 %.not1099.i, i32 -24, i32 %375
  %377 = call float @__ocml_ldexp_f32(float noundef %374, i32 noundef %376) #5
  %378 = fneg contract float %377
  %.not11001101.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %379 = select contract i1 %.not11001101.i, float %378, float %377
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %372, %365
  %380 = phi float [ %369, %365 ], [ %379, %372 ]
  %381 = fmul contract float %310, %380
  %382 = fadd contract float %257, %381
  %383 = or disjoint i64 %287, %102
  %384 = trunc i64 %383 to i32
  %385 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %384
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %385, align 2, !tbaa.struct !25
  %386 = zext i16 %.sroa.0282.0.copyload.i to i32
  %387 = lshr i32 %386, 10
  %388 = and i32 %387, 31
  %389 = and i32 %386, 1023
  switch i32 %388, label %395 [
    i32 31, label %390
    i32 0, label %397
  ]

390:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %391 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1145.i = icmp eq i32 %389, 0
  %392 = select i1 %.not1145.i, i32 2139095040, i32 2143289344
  %393 = or disjoint i32 %392, %391
  %394 = bitcast i32 %393 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

395:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %396 = or disjoint i32 %389, 1024
  br label %397

397:                                              ; preds = %395, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %398 = phi i32 [ %396, %395 ], [ %389, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %399 = uitofp i32 %398 to float
  %.not1102.i = icmp eq i32 %388, 0
  %400 = add nsw i32 %388, -25
  %401 = select i1 %.not1102.i, i32 -24, i32 %400
  %402 = call float @__ocml_ldexp_f32(float noundef %399, i32 noundef %401) #5
  %403 = fneg contract float %402
  %.not11031104.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %404 = select contract i1 %.not11031104.i, float %403, float %402
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %397, %390
  %405 = phi float [ %394, %390 ], [ %404, %397 ]
  %406 = fmul contract float %310, %405
  %407 = fadd contract float %282, %406
  %408 = or disjoint i64 %154, 2
  %409 = add nuw i64 %408, %150
  %410 = trunc i64 %409 to i32
  %411 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %410
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %411, align 2, !tbaa.struct !25
  %412 = shl nuw nsw i64 %408, 5
  %413 = or disjoint i64 %412, %99
  %414 = trunc i64 %413 to i32
  %415 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %414
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %415, align 2, !tbaa.struct !25
  %416 = zext i16 %.sroa.0273.0.copyload.i to i32
  %417 = lshr i32 %416, 10
  %418 = and i32 %417, 31
  %419 = and i32 %416, 1023
  switch i32 %418, label %425 [
    i32 31, label %420
    i32 0, label %427
  ]

420:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %421 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1144.i = icmp eq i32 %419, 0
  %422 = select i1 %.not1144.i, i32 2139095040, i32 2143289344
  %423 = or disjoint i32 %422, %421
  %424 = bitcast i32 %423 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

425:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %426 = or disjoint i32 %419, 1024
  br label %427

427:                                              ; preds = %425, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %428 = phi i32 [ %426, %425 ], [ %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %429 = uitofp i32 %428 to float
  %.not1105.i = icmp eq i32 %418, 0
  %430 = add nsw i32 %418, -25
  %431 = select i1 %.not1105.i, i32 -24, i32 %430
  %432 = call float @__ocml_ldexp_f32(float noundef %429, i32 noundef %431) #5
  %433 = fneg contract float %432
  %.not11061107.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %434 = select contract i1 %.not11061107.i, float %433, float %432
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %427, %420
  %435 = phi float [ %424, %420 ], [ %434, %427 ]
  %436 = zext i16 %.sroa.0264.0.copyload.i to i32
  %437 = lshr i32 %436, 10
  %438 = and i32 %437, 31
  %439 = and i32 %436, 1023
  switch i32 %438, label %445 [
    i32 31, label %440
    i32 0, label %447
  ]

440:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %441 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1143.i = icmp eq i32 %439, 0
  %442 = select i1 %.not1143.i, i32 2139095040, i32 2143289344
  %443 = or disjoint i32 %442, %441
  %444 = bitcast i32 %443 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

445:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %446 = or disjoint i32 %439, 1024
  br label %447

447:                                              ; preds = %445, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %448 = phi i32 [ %446, %445 ], [ %439, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %449 = uitofp i32 %448 to float
  %.not1108.i = icmp eq i32 %438, 0
  %450 = add nsw i32 %438, -25
  %451 = select i1 %.not1108.i, i32 -24, i32 %450
  %452 = call float @__ocml_ldexp_f32(float noundef %449, i32 noundef %451) #5
  %453 = fneg contract float %452
  %.not11091110.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %454 = select contract i1 %.not11091110.i, float %453, float %452
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %447, %440
  %455 = phi float [ %444, %440 ], [ %454, %447 ]
  %456 = fmul contract float %435, %455
  %457 = fadd contract float %332, %456
  %458 = or disjoint i64 %412, %100
  %459 = trunc i64 %458 to i32
  %460 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %459
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %460, align 2, !tbaa.struct !25
  %461 = zext i16 %.sroa.0255.0.copyload.i to i32
  %462 = lshr i32 %461, 10
  %463 = and i32 %462, 31
  %464 = and i32 %461, 1023
  switch i32 %463, label %470 [
    i32 31, label %465
    i32 0, label %472
  ]

465:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %466 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1142.i = icmp eq i32 %464, 0
  %467 = select i1 %.not1142.i, i32 2139095040, i32 2143289344
  %468 = or disjoint i32 %467, %466
  %469 = bitcast i32 %468 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

470:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %471 = or disjoint i32 %464, 1024
  br label %472

472:                                              ; preds = %470, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %473 = phi i32 [ %471, %470 ], [ %464, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %474 = uitofp i32 %473 to float
  %.not1111.i = icmp eq i32 %463, 0
  %475 = add nsw i32 %463, -25
  %476 = select i1 %.not1111.i, i32 -24, i32 %475
  %477 = call float @__ocml_ldexp_f32(float noundef %474, i32 noundef %476) #5
  %478 = fneg contract float %477
  %.not11121113.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %479 = select contract i1 %.not11121113.i, float %478, float %477
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %472, %465
  %480 = phi float [ %469, %465 ], [ %479, %472 ]
  %481 = fmul contract float %435, %480
  %482 = fadd contract float %357, %481
  %483 = or disjoint i64 %412, %101
  %484 = trunc i64 %483 to i32
  %485 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %484
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %485, align 2, !tbaa.struct !25
  %486 = zext i16 %.sroa.0246.0.copyload.i to i32
  %487 = lshr i32 %486, 10
  %488 = and i32 %487, 31
  %489 = and i32 %486, 1023
  switch i32 %488, label %495 [
    i32 31, label %490
    i32 0, label %497
  ]

490:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %491 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1141.i = icmp eq i32 %489, 0
  %492 = select i1 %.not1141.i, i32 2139095040, i32 2143289344
  %493 = or disjoint i32 %492, %491
  %494 = bitcast i32 %493 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

495:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %496 = or disjoint i32 %489, 1024
  br label %497

497:                                              ; preds = %495, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %498 = phi i32 [ %496, %495 ], [ %489, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %499 = uitofp i32 %498 to float
  %.not1114.i = icmp eq i32 %488, 0
  %500 = add nsw i32 %488, -25
  %501 = select i1 %.not1114.i, i32 -24, i32 %500
  %502 = call float @__ocml_ldexp_f32(float noundef %499, i32 noundef %501) #5
  %503 = fneg contract float %502
  %.not11151116.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %504 = select contract i1 %.not11151116.i, float %503, float %502
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %497, %490
  %505 = phi float [ %494, %490 ], [ %504, %497 ]
  %506 = fmul contract float %435, %505
  %507 = fadd contract float %382, %506
  %508 = or disjoint i64 %412, %102
  %509 = trunc i64 %508 to i32
  %510 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %509
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %510, align 2, !tbaa.struct !25
  %511 = zext i16 %.sroa.0237.0.copyload.i to i32
  %512 = lshr i32 %511, 10
  %513 = and i32 %512, 31
  %514 = and i32 %511, 1023
  switch i32 %513, label %520 [
    i32 31, label %515
    i32 0, label %522
  ]

515:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %516 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1140.i = icmp eq i32 %514, 0
  %517 = select i1 %.not1140.i, i32 2139095040, i32 2143289344
  %518 = or disjoint i32 %517, %516
  %519 = bitcast i32 %518 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

520:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %521 = or disjoint i32 %514, 1024
  br label %522

522:                                              ; preds = %520, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %523 = phi i32 [ %521, %520 ], [ %514, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %524 = uitofp i32 %523 to float
  %.not1117.i = icmp eq i32 %513, 0
  %525 = add nsw i32 %513, -25
  %526 = select i1 %.not1117.i, i32 -24, i32 %525
  %527 = call float @__ocml_ldexp_f32(float noundef %524, i32 noundef %526) #5
  %528 = fneg contract float %527
  %.not11181119.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %529 = select contract i1 %.not11181119.i, float %528, float %527
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %522, %515
  %530 = phi float [ %519, %515 ], [ %529, %522 ]
  %531 = fmul contract float %435, %530
  %532 = fadd contract float %407, %531
  %533 = or disjoint i64 %154, 3
  %534 = add nuw i64 %533, %150
  %535 = trunc i64 %534 to i32
  %536 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %535
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %536, align 2, !tbaa.struct !25
  %537 = shl nuw nsw i64 %533, 5
  %538 = or disjoint i64 %537, %99
  %539 = trunc i64 %538 to i32
  %540 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %539
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %540, align 2, !tbaa.struct !25
  %541 = zext i16 %.sroa.0228.0.copyload.i to i32
  %542 = lshr i32 %541, 10
  %543 = and i32 %542, 31
  %544 = and i32 %541, 1023
  switch i32 %543, label %550 [
    i32 31, label %545
    i32 0, label %552
  ]

545:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %546 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1139.i = icmp eq i32 %544, 0
  %547 = select i1 %.not1139.i, i32 2139095040, i32 2143289344
  %548 = or disjoint i32 %547, %546
  %549 = bitcast i32 %548 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

550:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %551 = or disjoint i32 %544, 1024
  br label %552

552:                                              ; preds = %550, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %553 = phi i32 [ %551, %550 ], [ %544, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %554 = uitofp i32 %553 to float
  %.not1120.i = icmp eq i32 %543, 0
  %555 = add nsw i32 %543, -25
  %556 = select i1 %.not1120.i, i32 -24, i32 %555
  %557 = call float @__ocml_ldexp_f32(float noundef %554, i32 noundef %556) #5
  %558 = fneg contract float %557
  %.not11211122.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %559 = select contract i1 %.not11211122.i, float %558, float %557
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %552, %545
  %560 = phi float [ %549, %545 ], [ %559, %552 ]
  %561 = zext i16 %.sroa.0219.0.copyload.i to i32
  %562 = lshr i32 %561, 10
  %563 = and i32 %562, 31
  %564 = and i32 %561, 1023
  switch i32 %563, label %570 [
    i32 31, label %565
    i32 0, label %572
  ]

565:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %566 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1138.i = icmp eq i32 %564, 0
  %567 = select i1 %.not1138.i, i32 2139095040, i32 2143289344
  %568 = or disjoint i32 %567, %566
  %569 = bitcast i32 %568 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

570:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %571 = or disjoint i32 %564, 1024
  br label %572

572:                                              ; preds = %570, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %573 = phi i32 [ %571, %570 ], [ %564, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %574 = uitofp i32 %573 to float
  %.not1123.i = icmp eq i32 %563, 0
  %575 = add nsw i32 %563, -25
  %576 = select i1 %.not1123.i, i32 -24, i32 %575
  %577 = call float @__ocml_ldexp_f32(float noundef %574, i32 noundef %576) #5
  %578 = fneg contract float %577
  %.not11241125.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %579 = select contract i1 %.not11241125.i, float %578, float %577
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %572, %565
  %580 = phi float [ %569, %565 ], [ %579, %572 ]
  %581 = fmul contract float %560, %580
  %582 = fadd contract float %457, %581
  %583 = or disjoint i64 %537, %100
  %584 = trunc i64 %583 to i32
  %585 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %584
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %585, align 2, !tbaa.struct !25
  %586 = zext i16 %.sroa.0210.0.copyload.i to i32
  %587 = lshr i32 %586, 10
  %588 = and i32 %587, 31
  %589 = and i32 %586, 1023
  switch i32 %588, label %595 [
    i32 31, label %590
    i32 0, label %597
  ]

590:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %591 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1137.i = icmp eq i32 %589, 0
  %592 = select i1 %.not1137.i, i32 2139095040, i32 2143289344
  %593 = or disjoint i32 %592, %591
  %594 = bitcast i32 %593 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

595:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %596 = or disjoint i32 %589, 1024
  br label %597

597:                                              ; preds = %595, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %598 = phi i32 [ %596, %595 ], [ %589, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %599 = uitofp i32 %598 to float
  %.not1126.i = icmp eq i32 %588, 0
  %600 = add nsw i32 %588, -25
  %601 = select i1 %.not1126.i, i32 -24, i32 %600
  %602 = call float @__ocml_ldexp_f32(float noundef %599, i32 noundef %601) #5
  %603 = fneg contract float %602
  %.not11271128.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %604 = select contract i1 %.not11271128.i, float %603, float %602
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %597, %590
  %605 = phi float [ %594, %590 ], [ %604, %597 ]
  %606 = fmul contract float %560, %605
  %607 = fadd contract float %482, %606
  %608 = or disjoint i64 %537, %101
  %609 = trunc i64 %608 to i32
  %610 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %609
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %610, align 2, !tbaa.struct !25
  %611 = zext i16 %.sroa.0201.0.copyload.i to i32
  %612 = lshr i32 %611, 10
  %613 = and i32 %612, 31
  %614 = and i32 %611, 1023
  switch i32 %613, label %620 [
    i32 31, label %615
    i32 0, label %622
  ]

615:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %616 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1136.i = icmp eq i32 %614, 0
  %617 = select i1 %.not1136.i, i32 2139095040, i32 2143289344
  %618 = or disjoint i32 %617, %616
  %619 = bitcast i32 %618 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

620:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %621 = or disjoint i32 %614, 1024
  br label %622

622:                                              ; preds = %620, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %623 = phi i32 [ %621, %620 ], [ %614, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %624 = uitofp i32 %623 to float
  %.not1129.i = icmp eq i32 %613, 0
  %625 = add nsw i32 %613, -25
  %626 = select i1 %.not1129.i, i32 -24, i32 %625
  %627 = call float @__ocml_ldexp_f32(float noundef %624, i32 noundef %626) #5
  %628 = fneg contract float %627
  %.not11301131.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %629 = select contract i1 %.not11301131.i, float %628, float %627
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %622, %615
  %630 = phi float [ %619, %615 ], [ %629, %622 ]
  %631 = fmul contract float %560, %630
  %632 = fadd contract float %507, %631
  %633 = or disjoint i64 %537, %102
  %634 = trunc i64 %633 to i32
  %635 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %98, i32 %634
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %635, align 2, !tbaa.struct !25
  %636 = zext i16 %.sroa.0192.0.copyload.i to i32
  %637 = lshr i32 %636, 10
  %638 = and i32 %637, 31
  %639 = and i32 %636, 1023
  switch i32 %638, label %645 [
    i32 31, label %640
    i32 0, label %647
  ]

640:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %641 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1135.i = icmp eq i32 %639, 0
  %642 = select i1 %.not1135.i, i32 2139095040, i32 2143289344
  %643 = or disjoint i32 %642, %641
  %644 = bitcast i32 %643 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

645:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %646 = or disjoint i32 %639, 1024
  br label %647

647:                                              ; preds = %645, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %648 = phi i32 [ %646, %645 ], [ %639, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %649 = uitofp i32 %648 to float
  %.not1132.i = icmp eq i32 %638, 0
  %650 = add nsw i32 %638, -25
  %651 = select i1 %.not1132.i, i32 -24, i32 %650
  %652 = call float @__ocml_ldexp_f32(float noundef %649, i32 noundef %651) #5
  %653 = fneg contract float %652
  %.not11331134.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %654 = select contract i1 %.not11331134.i, float %653, float %652
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %647, %640
  %655 = phi float [ %644, %640 ], [ %654, %647 ]
  %656 = fmul contract float %560, %655
  %657 = fadd contract float %532, %656
  %658 = add nuw nsw i64 %154, 4
  %659 = icmp ult i64 %154, 60
  br i1 %659, label %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, !llvm.loop !33

660:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph1178.i
  %661 = phi i64 [ %121, %.lr.ph1178.i ], [ %673, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %662 = lshr i64 %661, 5
  %663 = icmp slt i64 %662, %123
  %664 = and i1 %663, %129
  br i1 %664, label %665, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

665:                                              ; preds = %660
  %666 = trunc i64 %661 to i32
  %667 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %666
  %668 = load float, ptr addrspace(3) %667, align 4, !tbaa !19
  %669 = and i64 %661, 9223372036854775776
  %670 = or disjoint i64 %669, %127
  %671 = or disjoint i64 %670, %128
  %672 = getelementptr inbounds float, ptr %9, i64 %671
  store float %668, ptr %672, align 4, !tbaa !19
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %665, %660
  %673 = add nuw nsw i64 %661, 128
  %674 = icmp ult i64 %661, 1920
  br i1 %674, label %660, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !34

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
