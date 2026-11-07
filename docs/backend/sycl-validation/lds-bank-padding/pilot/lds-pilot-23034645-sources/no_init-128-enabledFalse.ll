;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034645/tmp/triton-sycl-cache/compile-vle64syk/kernel.cpp"
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
  %70 = getelementptr inbounds i8, ptr addrspace(3) %69, i32 16384
  %71 = and i64 %63, 31
  %72 = icmp slt i64 %71, %66
  br label %101

73:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i, %.lr.ph1169.i
  %74 = phi i64 [ %42, %.lr.ph1169.i ], [ %85, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit32.i.i.i ]
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
  %83 = trunc i64 %74 to i32
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %83
  store i16 %.sroa.0419.1.i, ptr addrspace(3) %84, align 2, !tbaa.struct !25
  %85 = add nuw nsw i64 %74, 128
  %86 = icmp ult i64 %74, 3968
  br i1 %86, label %73, label %.lr.ph1172.i, !llvm.loop !28

.lr.ph1175.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %88 = icmp eq i64 %87, 0
  call void @llvm.assume(i1 %88)
  %89 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %90 = icmp eq i64 %89, 0
  call void @llvm.assume(i1 %90)
  %91 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %92 = icmp ult i64 %91, 128
  call void @llvm.assume(i1 %92)
  %93 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %94 = inttoptr i32 %93 to ptr addrspace(3)
  %95 = getelementptr inbounds i8, ptr addrspace(3) %94, i32 8192
  %96 = getelementptr inbounds i8, ptr addrspace(3) %94, i32 16384
  %97 = and i64 %91, 7
  %98 = or disjoint i64 %97, 8
  %99 = or disjoint i64 %97, 16
  %100 = or disjoint i64 %97, 24
  br label %128

101:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1172.i
  %102 = phi i64 [ %63, %.lr.ph1172.i ], [ %113, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %103 = lshr i64 %102, 5
  %104 = icmp slt i64 %103, %65
  %105 = and i1 %104, %72
  br i1 %105, label %106, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

106:                                              ; preds = %101
  %107 = and i64 %102, 9223372036854775776
  %108 = or disjoint i64 %107, %67
  %109 = or disjoint i64 %108, %71
  %110 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %109
  %.sroa.0402.0.copyload.i = load i16, ptr %110, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %106, %101
  %.sroa.0404.1.i = phi i16 [ %.sroa.0402.0.copyload.i, %106 ], [ 0, %101 ]
  %111 = trunc i64 %102 to i32
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %70, i32 %111
  store i16 %.sroa.0404.1.i, ptr addrspace(3) %112, align 2, !tbaa.struct !25
  %113 = add nuw nsw i64 %102, 128
  %114 = icmp ult i64 %102, 1920
  br i1 %114, label %101, label %.lr.ph1175.i, !llvm.loop !31

.lr.ph1178.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %116 = icmp eq i64 %115, 0
  call void @llvm.assume(i1 %116)
  %117 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %118 = icmp eq i64 %117, 0
  call void @llvm.assume(i1 %118)
  %119 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %120 = icmp ult i64 %119, 128
  call void @llvm.assume(i1 %120)
  %121 = sext i32 %3 to i64
  %122 = sext i32 %4 to i64
  %123 = call i32 @llvm.amdgcn.groupstaticsize()
  %124 = inttoptr i32 %123 to ptr addrspace(3)
  %125 = sext i32 %58 to i64
  %126 = and i64 %119, 31
  %127 = icmp slt i64 %126, %122
  br label %658

128:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1175.i
  %129 = phi i64 [ %91, %.lr.ph1175.i ], [ %149, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %130 = lshr i64 %129, 3
  %131 = shl nuw nsw i64 %130, 5
  %132 = or disjoint i64 %131, %97
  %133 = trunc i64 %132 to i32
  %134 = getelementptr inbounds float, ptr addrspace(3) %94, i32 %133
  %135 = load float, ptr addrspace(3) %134, align 4, !tbaa !19
  %136 = or disjoint i64 %131, %98
  %137 = trunc i64 %136 to i32
  %138 = getelementptr inbounds float, ptr addrspace(3) %94, i32 %137
  %139 = load float, ptr addrspace(3) %138, align 4, !tbaa !19
  %140 = or disjoint i64 %131, %99
  %141 = trunc i64 %140 to i32
  %142 = getelementptr inbounds float, ptr addrspace(3) %94, i32 %141
  %143 = load float, ptr addrspace(3) %142, align 4, !tbaa !19
  %144 = or disjoint i64 %131, %100
  %145 = trunc i64 %144 to i32
  %146 = getelementptr inbounds float, ptr addrspace(3) %94, i32 %145
  %147 = load float, ptr addrspace(3) %146, align 4, !tbaa !19
  %148 = shl nuw nsw i64 %130, 6
  br label %151

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %580, ptr addrspace(3) %134, align 4, !tbaa !19
  store float %605, ptr addrspace(3) %138, align 4, !tbaa !19
  store float %630, ptr addrspace(3) %142, align 4, !tbaa !19
  store float %655, ptr addrspace(3) %146, align 4, !tbaa !19
  %149 = add nuw nsw i64 %129, 128
  %150 = icmp ult i64 %129, 384
  br i1 %150, label %128, label %.lr.ph1178.i, !llvm.loop !32

151:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %128
  %152 = phi i64 [ 0, %128 ], [ %656, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %153 = phi float [ %147, %128 ], [ %655, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %154 = phi float [ %143, %128 ], [ %630, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = phi float [ %139, %128 ], [ %605, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = phi float [ %135, %128 ], [ %580, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %157 = add nuw i64 %152, %148
  %158 = trunc i64 %157 to i32
  %159 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %158
  %.sroa.0363.0.copyload.i = load i16, ptr addrspace(3) %159, align 2, !tbaa.struct !25
  %160 = shl nuw nsw i64 %152, 5
  %161 = or disjoint i64 %160, %97
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %162
  %.sroa.0354.0.copyload.i = load i16, ptr addrspace(3) %163, align 2, !tbaa.struct !25
  %164 = zext i16 %.sroa.0363.0.copyload.i to i32
  %165 = lshr i32 %164, 10
  %166 = and i32 %165, 31
  %167 = and i32 %164, 1023
  switch i32 %166, label %173 [
    i32 31, label %168
    i32 0, label %175
  ]

168:                                              ; preds = %151
  %.sroa.0363.0.copyload.signext.i = sext i16 %.sroa.0363.0.copyload.i to i32
  %169 = and i32 %.sroa.0363.0.copyload.signext.i, -2147483648
  %.not1154.i = icmp eq i32 %167, 0
  %170 = select i1 %.not1154.i, i32 2139095040, i32 2143289344
  %171 = or disjoint i32 %170, %169
  %172 = bitcast i32 %171 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

173:                                              ; preds = %151
  %174 = or disjoint i32 %167, 1024
  br label %175

175:                                              ; preds = %173, %151
  %176 = phi i32 [ %174, %173 ], [ %167, %151 ]
  %177 = uitofp i32 %176 to float
  %.not.i = icmp eq i32 %166, 0
  %178 = add nsw i32 %166, -25
  %179 = select i1 %.not.i, i32 -24, i32 %178
  %180 = call float @__ocml_ldexp_f32(float noundef %177, i32 noundef %179) #5
  %181 = fneg contract float %180
  %.not10761077.i = icmp slt i16 %.sroa.0363.0.copyload.i, 0
  %182 = select contract i1 %.not10761077.i, float %181, float %180
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %175, %168
  %183 = phi float [ %172, %168 ], [ %182, %175 ]
  %184 = zext i16 %.sroa.0354.0.copyload.i to i32
  %185 = lshr i32 %184, 10
  %186 = and i32 %185, 31
  %187 = and i32 %184, 1023
  switch i32 %186, label %193 [
    i32 31, label %188
    i32 0, label %195
  ]

188:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0354.0.copyload.signext.i = sext i16 %.sroa.0354.0.copyload.i to i32
  %189 = and i32 %.sroa.0354.0.copyload.signext.i, -2147483648
  %.not1153.i = icmp eq i32 %187, 0
  %190 = select i1 %.not1153.i, i32 2139095040, i32 2143289344
  %191 = or disjoint i32 %190, %189
  %192 = bitcast i32 %191 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

193:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %194 = or disjoint i32 %187, 1024
  br label %195

195:                                              ; preds = %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %196 = phi i32 [ %194, %193 ], [ %187, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %197 = uitofp i32 %196 to float
  %.not1078.i = icmp eq i32 %186, 0
  %198 = add nsw i32 %186, -25
  %199 = select i1 %.not1078.i, i32 -24, i32 %198
  %200 = call float @__ocml_ldexp_f32(float noundef %197, i32 noundef %199) #5
  %201 = fneg contract float %200
  %.not10791080.i = icmp slt i16 %.sroa.0354.0.copyload.i, 0
  %202 = select contract i1 %.not10791080.i, float %201, float %200
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %195, %188
  %203 = phi float [ %192, %188 ], [ %202, %195 ]
  %204 = fmul contract float %183, %203
  %205 = fadd contract float %156, %204
  %206 = or disjoint i64 %160, %98
  %207 = trunc i64 %206 to i32
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %207
  %.sroa.0345.0.copyload.i = load i16, ptr addrspace(3) %208, align 2, !tbaa.struct !25
  %209 = zext i16 %.sroa.0345.0.copyload.i to i32
  %210 = lshr i32 %209, 10
  %211 = and i32 %210, 31
  %212 = and i32 %209, 1023
  switch i32 %211, label %218 [
    i32 31, label %213
    i32 0, label %220
  ]

213:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0345.0.copyload.signext.i = sext i16 %.sroa.0345.0.copyload.i to i32
  %214 = and i32 %.sroa.0345.0.copyload.signext.i, -2147483648
  %.not1152.i = icmp eq i32 %212, 0
  %215 = select i1 %.not1152.i, i32 2139095040, i32 2143289344
  %216 = or disjoint i32 %215, %214
  %217 = bitcast i32 %216 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

218:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %219 = or disjoint i32 %212, 1024
  br label %220

220:                                              ; preds = %218, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %221 = phi i32 [ %219, %218 ], [ %212, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %222 = uitofp i32 %221 to float
  %.not1081.i = icmp eq i32 %211, 0
  %223 = add nsw i32 %211, -25
  %224 = select i1 %.not1081.i, i32 -24, i32 %223
  %225 = call float @__ocml_ldexp_f32(float noundef %222, i32 noundef %224) #5
  %226 = fneg contract float %225
  %.not10821083.i = icmp slt i16 %.sroa.0345.0.copyload.i, 0
  %227 = select contract i1 %.not10821083.i, float %226, float %225
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %220, %213
  %228 = phi float [ %217, %213 ], [ %227, %220 ]
  %229 = fmul contract float %183, %228
  %230 = fadd contract float %155, %229
  %231 = or disjoint i64 %160, %99
  %232 = trunc i64 %231 to i32
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %232
  %.sroa.0336.0.copyload.i = load i16, ptr addrspace(3) %233, align 2, !tbaa.struct !25
  %234 = zext i16 %.sroa.0336.0.copyload.i to i32
  %235 = lshr i32 %234, 10
  %236 = and i32 %235, 31
  %237 = and i32 %234, 1023
  switch i32 %236, label %243 [
    i32 31, label %238
    i32 0, label %245
  ]

238:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0336.0.copyload.signext.i = sext i16 %.sroa.0336.0.copyload.i to i32
  %239 = and i32 %.sroa.0336.0.copyload.signext.i, -2147483648
  %.not1151.i = icmp eq i32 %237, 0
  %240 = select i1 %.not1151.i, i32 2139095040, i32 2143289344
  %241 = or disjoint i32 %240, %239
  %242 = bitcast i32 %241 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

243:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %244 = or disjoint i32 %237, 1024
  br label %245

245:                                              ; preds = %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %246 = phi i32 [ %244, %243 ], [ %237, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %247 = uitofp i32 %246 to float
  %.not1084.i = icmp eq i32 %236, 0
  %248 = add nsw i32 %236, -25
  %249 = select i1 %.not1084.i, i32 -24, i32 %248
  %250 = call float @__ocml_ldexp_f32(float noundef %247, i32 noundef %249) #5
  %251 = fneg contract float %250
  %.not10851086.i = icmp slt i16 %.sroa.0336.0.copyload.i, 0
  %252 = select contract i1 %.not10851086.i, float %251, float %250
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %245, %238
  %253 = phi float [ %242, %238 ], [ %252, %245 ]
  %254 = fmul contract float %183, %253
  %255 = fadd contract float %154, %254
  %256 = or disjoint i64 %160, %100
  %257 = trunc i64 %256 to i32
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %257
  %.sroa.0327.0.copyload.i = load i16, ptr addrspace(3) %258, align 2, !tbaa.struct !25
  %259 = zext i16 %.sroa.0327.0.copyload.i to i32
  %260 = lshr i32 %259, 10
  %261 = and i32 %260, 31
  %262 = and i32 %259, 1023
  switch i32 %261, label %268 [
    i32 31, label %263
    i32 0, label %270
  ]

263:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0327.0.copyload.signext.i = sext i16 %.sroa.0327.0.copyload.i to i32
  %264 = and i32 %.sroa.0327.0.copyload.signext.i, -2147483648
  %.not1150.i = icmp eq i32 %262, 0
  %265 = select i1 %.not1150.i, i32 2139095040, i32 2143289344
  %266 = or disjoint i32 %265, %264
  %267 = bitcast i32 %266 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

268:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %269 = or disjoint i32 %262, 1024
  br label %270

270:                                              ; preds = %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %271 = phi i32 [ %269, %268 ], [ %262, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %272 = uitofp i32 %271 to float
  %.not1087.i = icmp eq i32 %261, 0
  %273 = add nsw i32 %261, -25
  %274 = select i1 %.not1087.i, i32 -24, i32 %273
  %275 = call float @__ocml_ldexp_f32(float noundef %272, i32 noundef %274) #5
  %276 = fneg contract float %275
  %.not10881089.i = icmp slt i16 %.sroa.0327.0.copyload.i, 0
  %277 = select contract i1 %.not10881089.i, float %276, float %275
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %270, %263
  %278 = phi float [ %267, %263 ], [ %277, %270 ]
  %279 = fmul contract float %183, %278
  %280 = fadd contract float %153, %279
  %281 = or disjoint i64 %152, 1
  %282 = add nuw i64 %281, %148
  %283 = trunc i64 %282 to i32
  %284 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %283
  %.sroa.0318.0.copyload.i = load i16, ptr addrspace(3) %284, align 2, !tbaa.struct !25
  %285 = shl nuw nsw i64 %281, 5
  %286 = or disjoint i64 %285, %97
  %287 = trunc i64 %286 to i32
  %288 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %287
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %288, align 2, !tbaa.struct !25
  %289 = zext i16 %.sroa.0318.0.copyload.i to i32
  %290 = lshr i32 %289, 10
  %291 = and i32 %290, 31
  %292 = and i32 %289, 1023
  switch i32 %291, label %298 [
    i32 31, label %293
    i32 0, label %300
  ]

293:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0318.0.copyload.signext.i = sext i16 %.sroa.0318.0.copyload.i to i32
  %294 = and i32 %.sroa.0318.0.copyload.signext.i, -2147483648
  %.not1149.i = icmp eq i32 %292, 0
  %295 = select i1 %.not1149.i, i32 2139095040, i32 2143289344
  %296 = or disjoint i32 %295, %294
  %297 = bitcast i32 %296 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

298:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %299 = or disjoint i32 %292, 1024
  br label %300

300:                                              ; preds = %298, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %301 = phi i32 [ %299, %298 ], [ %292, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %302 = uitofp i32 %301 to float
  %.not1090.i = icmp eq i32 %291, 0
  %303 = add nsw i32 %291, -25
  %304 = select i1 %.not1090.i, i32 -24, i32 %303
  %305 = call float @__ocml_ldexp_f32(float noundef %302, i32 noundef %304) #5
  %306 = fneg contract float %305
  %.not10911092.i = icmp slt i16 %.sroa.0318.0.copyload.i, 0
  %307 = select contract i1 %.not10911092.i, float %306, float %305
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %300, %293
  %308 = phi float [ %297, %293 ], [ %307, %300 ]
  %309 = zext i16 %.sroa.0309.0.copyload.i to i32
  %310 = lshr i32 %309, 10
  %311 = and i32 %310, 31
  %312 = and i32 %309, 1023
  switch i32 %311, label %318 [
    i32 31, label %313
    i32 0, label %320
  ]

313:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0309.0.copyload.signext.i = sext i16 %.sroa.0309.0.copyload.i to i32
  %314 = and i32 %.sroa.0309.0.copyload.signext.i, -2147483648
  %.not1148.i = icmp eq i32 %312, 0
  %315 = select i1 %.not1148.i, i32 2139095040, i32 2143289344
  %316 = or disjoint i32 %315, %314
  %317 = bitcast i32 %316 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

318:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %319 = or disjoint i32 %312, 1024
  br label %320

320:                                              ; preds = %318, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %321 = phi i32 [ %319, %318 ], [ %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %322 = uitofp i32 %321 to float
  %.not1093.i = icmp eq i32 %311, 0
  %323 = add nsw i32 %311, -25
  %324 = select i1 %.not1093.i, i32 -24, i32 %323
  %325 = call float @__ocml_ldexp_f32(float noundef %322, i32 noundef %324) #5
  %326 = fneg contract float %325
  %.not10941095.i = icmp slt i16 %.sroa.0309.0.copyload.i, 0
  %327 = select contract i1 %.not10941095.i, float %326, float %325
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %320, %313
  %328 = phi float [ %317, %313 ], [ %327, %320 ]
  %329 = fmul contract float %308, %328
  %330 = fadd contract float %205, %329
  %331 = or disjoint i64 %285, %98
  %332 = trunc i64 %331 to i32
  %333 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %332
  %.sroa.0300.0.copyload.i = load i16, ptr addrspace(3) %333, align 2, !tbaa.struct !25
  %334 = zext i16 %.sroa.0300.0.copyload.i to i32
  %335 = lshr i32 %334, 10
  %336 = and i32 %335, 31
  %337 = and i32 %334, 1023
  switch i32 %336, label %343 [
    i32 31, label %338
    i32 0, label %345
  ]

338:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0300.0.copyload.signext.i = sext i16 %.sroa.0300.0.copyload.i to i32
  %339 = and i32 %.sroa.0300.0.copyload.signext.i, -2147483648
  %.not1147.i = icmp eq i32 %337, 0
  %340 = select i1 %.not1147.i, i32 2139095040, i32 2143289344
  %341 = or disjoint i32 %340, %339
  %342 = bitcast i32 %341 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

343:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %344 = or disjoint i32 %337, 1024
  br label %345

345:                                              ; preds = %343, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %346 = phi i32 [ %344, %343 ], [ %337, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %347 = uitofp i32 %346 to float
  %.not1096.i = icmp eq i32 %336, 0
  %348 = add nsw i32 %336, -25
  %349 = select i1 %.not1096.i, i32 -24, i32 %348
  %350 = call float @__ocml_ldexp_f32(float noundef %347, i32 noundef %349) #5
  %351 = fneg contract float %350
  %.not10971098.i = icmp slt i16 %.sroa.0300.0.copyload.i, 0
  %352 = select contract i1 %.not10971098.i, float %351, float %350
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %345, %338
  %353 = phi float [ %342, %338 ], [ %352, %345 ]
  %354 = fmul contract float %308, %353
  %355 = fadd contract float %230, %354
  %356 = or disjoint i64 %285, %99
  %357 = trunc i64 %356 to i32
  %358 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %357
  %.sroa.0291.0.copyload.i = load i16, ptr addrspace(3) %358, align 2, !tbaa.struct !25
  %359 = zext i16 %.sroa.0291.0.copyload.i to i32
  %360 = lshr i32 %359, 10
  %361 = and i32 %360, 31
  %362 = and i32 %359, 1023
  switch i32 %361, label %368 [
    i32 31, label %363
    i32 0, label %370
  ]

363:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0291.0.copyload.signext.i = sext i16 %.sroa.0291.0.copyload.i to i32
  %364 = and i32 %.sroa.0291.0.copyload.signext.i, -2147483648
  %.not1146.i = icmp eq i32 %362, 0
  %365 = select i1 %.not1146.i, i32 2139095040, i32 2143289344
  %366 = or disjoint i32 %365, %364
  %367 = bitcast i32 %366 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

368:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %369 = or disjoint i32 %362, 1024
  br label %370

370:                                              ; preds = %368, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %371 = phi i32 [ %369, %368 ], [ %362, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %372 = uitofp i32 %371 to float
  %.not1099.i = icmp eq i32 %361, 0
  %373 = add nsw i32 %361, -25
  %374 = select i1 %.not1099.i, i32 -24, i32 %373
  %375 = call float @__ocml_ldexp_f32(float noundef %372, i32 noundef %374) #5
  %376 = fneg contract float %375
  %.not11001101.i = icmp slt i16 %.sroa.0291.0.copyload.i, 0
  %377 = select contract i1 %.not11001101.i, float %376, float %375
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %370, %363
  %378 = phi float [ %367, %363 ], [ %377, %370 ]
  %379 = fmul contract float %308, %378
  %380 = fadd contract float %255, %379
  %381 = or disjoint i64 %285, %100
  %382 = trunc i64 %381 to i32
  %383 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %382
  %.sroa.0282.0.copyload.i = load i16, ptr addrspace(3) %383, align 2, !tbaa.struct !25
  %384 = zext i16 %.sroa.0282.0.copyload.i to i32
  %385 = lshr i32 %384, 10
  %386 = and i32 %385, 31
  %387 = and i32 %384, 1023
  switch i32 %386, label %393 [
    i32 31, label %388
    i32 0, label %395
  ]

388:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0282.0.copyload.signext.i = sext i16 %.sroa.0282.0.copyload.i to i32
  %389 = and i32 %.sroa.0282.0.copyload.signext.i, -2147483648
  %.not1145.i = icmp eq i32 %387, 0
  %390 = select i1 %.not1145.i, i32 2139095040, i32 2143289344
  %391 = or disjoint i32 %390, %389
  %392 = bitcast i32 %391 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

393:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %394 = or disjoint i32 %387, 1024
  br label %395

395:                                              ; preds = %393, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %396 = phi i32 [ %394, %393 ], [ %387, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %397 = uitofp i32 %396 to float
  %.not1102.i = icmp eq i32 %386, 0
  %398 = add nsw i32 %386, -25
  %399 = select i1 %.not1102.i, i32 -24, i32 %398
  %400 = call float @__ocml_ldexp_f32(float noundef %397, i32 noundef %399) #5
  %401 = fneg contract float %400
  %.not11031104.i = icmp slt i16 %.sroa.0282.0.copyload.i, 0
  %402 = select contract i1 %.not11031104.i, float %401, float %400
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %395, %388
  %403 = phi float [ %392, %388 ], [ %402, %395 ]
  %404 = fmul contract float %308, %403
  %405 = fadd contract float %280, %404
  %406 = or disjoint i64 %152, 2
  %407 = add nuw i64 %406, %148
  %408 = trunc i64 %407 to i32
  %409 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %408
  %.sroa.0273.0.copyload.i = load i16, ptr addrspace(3) %409, align 2, !tbaa.struct !25
  %410 = shl nuw nsw i64 %406, 5
  %411 = or disjoint i64 %410, %97
  %412 = trunc i64 %411 to i32
  %413 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %412
  %.sroa.0264.0.copyload.i = load i16, ptr addrspace(3) %413, align 2, !tbaa.struct !25
  %414 = zext i16 %.sroa.0273.0.copyload.i to i32
  %415 = lshr i32 %414, 10
  %416 = and i32 %415, 31
  %417 = and i32 %414, 1023
  switch i32 %416, label %423 [
    i32 31, label %418
    i32 0, label %425
  ]

418:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0273.0.copyload.signext.i = sext i16 %.sroa.0273.0.copyload.i to i32
  %419 = and i32 %.sroa.0273.0.copyload.signext.i, -2147483648
  %.not1144.i = icmp eq i32 %417, 0
  %420 = select i1 %.not1144.i, i32 2139095040, i32 2143289344
  %421 = or disjoint i32 %420, %419
  %422 = bitcast i32 %421 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

423:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %424 = or disjoint i32 %417, 1024
  br label %425

425:                                              ; preds = %423, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %426 = phi i32 [ %424, %423 ], [ %417, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %427 = uitofp i32 %426 to float
  %.not1105.i = icmp eq i32 %416, 0
  %428 = add nsw i32 %416, -25
  %429 = select i1 %.not1105.i, i32 -24, i32 %428
  %430 = call float @__ocml_ldexp_f32(float noundef %427, i32 noundef %429) #5
  %431 = fneg contract float %430
  %.not11061107.i = icmp slt i16 %.sroa.0273.0.copyload.i, 0
  %432 = select contract i1 %.not11061107.i, float %431, float %430
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %425, %418
  %433 = phi float [ %422, %418 ], [ %432, %425 ]
  %434 = zext i16 %.sroa.0264.0.copyload.i to i32
  %435 = lshr i32 %434, 10
  %436 = and i32 %435, 31
  %437 = and i32 %434, 1023
  switch i32 %436, label %443 [
    i32 31, label %438
    i32 0, label %445
  ]

438:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0264.0.copyload.signext.i = sext i16 %.sroa.0264.0.copyload.i to i32
  %439 = and i32 %.sroa.0264.0.copyload.signext.i, -2147483648
  %.not1143.i = icmp eq i32 %437, 0
  %440 = select i1 %.not1143.i, i32 2139095040, i32 2143289344
  %441 = or disjoint i32 %440, %439
  %442 = bitcast i32 %441 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

443:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %444 = or disjoint i32 %437, 1024
  br label %445

445:                                              ; preds = %443, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %446 = phi i32 [ %444, %443 ], [ %437, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %447 = uitofp i32 %446 to float
  %.not1108.i = icmp eq i32 %436, 0
  %448 = add nsw i32 %436, -25
  %449 = select i1 %.not1108.i, i32 -24, i32 %448
  %450 = call float @__ocml_ldexp_f32(float noundef %447, i32 noundef %449) #5
  %451 = fneg contract float %450
  %.not11091110.i = icmp slt i16 %.sroa.0264.0.copyload.i, 0
  %452 = select contract i1 %.not11091110.i, float %451, float %450
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %445, %438
  %453 = phi float [ %442, %438 ], [ %452, %445 ]
  %454 = fmul contract float %433, %453
  %455 = fadd contract float %330, %454
  %456 = or disjoint i64 %410, %98
  %457 = trunc i64 %456 to i32
  %458 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %457
  %.sroa.0255.0.copyload.i = load i16, ptr addrspace(3) %458, align 2, !tbaa.struct !25
  %459 = zext i16 %.sroa.0255.0.copyload.i to i32
  %460 = lshr i32 %459, 10
  %461 = and i32 %460, 31
  %462 = and i32 %459, 1023
  switch i32 %461, label %468 [
    i32 31, label %463
    i32 0, label %470
  ]

463:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0255.0.copyload.signext.i = sext i16 %.sroa.0255.0.copyload.i to i32
  %464 = and i32 %.sroa.0255.0.copyload.signext.i, -2147483648
  %.not1142.i = icmp eq i32 %462, 0
  %465 = select i1 %.not1142.i, i32 2139095040, i32 2143289344
  %466 = or disjoint i32 %465, %464
  %467 = bitcast i32 %466 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

468:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %469 = or disjoint i32 %462, 1024
  br label %470

470:                                              ; preds = %468, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %471 = phi i32 [ %469, %468 ], [ %462, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %472 = uitofp i32 %471 to float
  %.not1111.i = icmp eq i32 %461, 0
  %473 = add nsw i32 %461, -25
  %474 = select i1 %.not1111.i, i32 -24, i32 %473
  %475 = call float @__ocml_ldexp_f32(float noundef %472, i32 noundef %474) #5
  %476 = fneg contract float %475
  %.not11121113.i = icmp slt i16 %.sroa.0255.0.copyload.i, 0
  %477 = select contract i1 %.not11121113.i, float %476, float %475
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %470, %463
  %478 = phi float [ %467, %463 ], [ %477, %470 ]
  %479 = fmul contract float %433, %478
  %480 = fadd contract float %355, %479
  %481 = or disjoint i64 %410, %99
  %482 = trunc i64 %481 to i32
  %483 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %482
  %.sroa.0246.0.copyload.i = load i16, ptr addrspace(3) %483, align 2, !tbaa.struct !25
  %484 = zext i16 %.sroa.0246.0.copyload.i to i32
  %485 = lshr i32 %484, 10
  %486 = and i32 %485, 31
  %487 = and i32 %484, 1023
  switch i32 %486, label %493 [
    i32 31, label %488
    i32 0, label %495
  ]

488:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0246.0.copyload.signext.i = sext i16 %.sroa.0246.0.copyload.i to i32
  %489 = and i32 %.sroa.0246.0.copyload.signext.i, -2147483648
  %.not1141.i = icmp eq i32 %487, 0
  %490 = select i1 %.not1141.i, i32 2139095040, i32 2143289344
  %491 = or disjoint i32 %490, %489
  %492 = bitcast i32 %491 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

493:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %494 = or disjoint i32 %487, 1024
  br label %495

495:                                              ; preds = %493, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %496 = phi i32 [ %494, %493 ], [ %487, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %497 = uitofp i32 %496 to float
  %.not1114.i = icmp eq i32 %486, 0
  %498 = add nsw i32 %486, -25
  %499 = select i1 %.not1114.i, i32 -24, i32 %498
  %500 = call float @__ocml_ldexp_f32(float noundef %497, i32 noundef %499) #5
  %501 = fneg contract float %500
  %.not11151116.i = icmp slt i16 %.sroa.0246.0.copyload.i, 0
  %502 = select contract i1 %.not11151116.i, float %501, float %500
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %495, %488
  %503 = phi float [ %492, %488 ], [ %502, %495 ]
  %504 = fmul contract float %433, %503
  %505 = fadd contract float %380, %504
  %506 = or disjoint i64 %410, %100
  %507 = trunc i64 %506 to i32
  %508 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %507
  %.sroa.0237.0.copyload.i = load i16, ptr addrspace(3) %508, align 2, !tbaa.struct !25
  %509 = zext i16 %.sroa.0237.0.copyload.i to i32
  %510 = lshr i32 %509, 10
  %511 = and i32 %510, 31
  %512 = and i32 %509, 1023
  switch i32 %511, label %518 [
    i32 31, label %513
    i32 0, label %520
  ]

513:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0237.0.copyload.signext.i = sext i16 %.sroa.0237.0.copyload.i to i32
  %514 = and i32 %.sroa.0237.0.copyload.signext.i, -2147483648
  %.not1140.i = icmp eq i32 %512, 0
  %515 = select i1 %.not1140.i, i32 2139095040, i32 2143289344
  %516 = or disjoint i32 %515, %514
  %517 = bitcast i32 %516 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

518:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %519 = or disjoint i32 %512, 1024
  br label %520

520:                                              ; preds = %518, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %521 = phi i32 [ %519, %518 ], [ %512, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %522 = uitofp i32 %521 to float
  %.not1117.i = icmp eq i32 %511, 0
  %523 = add nsw i32 %511, -25
  %524 = select i1 %.not1117.i, i32 -24, i32 %523
  %525 = call float @__ocml_ldexp_f32(float noundef %522, i32 noundef %524) #5
  %526 = fneg contract float %525
  %.not11181119.i = icmp slt i16 %.sroa.0237.0.copyload.i, 0
  %527 = select contract i1 %.not11181119.i, float %526, float %525
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %520, %513
  %528 = phi float [ %517, %513 ], [ %527, %520 ]
  %529 = fmul contract float %433, %528
  %530 = fadd contract float %405, %529
  %531 = or disjoint i64 %152, 3
  %532 = add nuw i64 %531, %148
  %533 = trunc i64 %532 to i32
  %534 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %533
  %.sroa.0228.0.copyload.i = load i16, ptr addrspace(3) %534, align 2, !tbaa.struct !25
  %535 = shl nuw nsw i64 %531, 5
  %536 = or disjoint i64 %535, %97
  %537 = trunc i64 %536 to i32
  %538 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %537
  %.sroa.0219.0.copyload.i = load i16, ptr addrspace(3) %538, align 2, !tbaa.struct !25
  %539 = zext i16 %.sroa.0228.0.copyload.i to i32
  %540 = lshr i32 %539, 10
  %541 = and i32 %540, 31
  %542 = and i32 %539, 1023
  switch i32 %541, label %548 [
    i32 31, label %543
    i32 0, label %550
  ]

543:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0228.0.copyload.signext.i = sext i16 %.sroa.0228.0.copyload.i to i32
  %544 = and i32 %.sroa.0228.0.copyload.signext.i, -2147483648
  %.not1139.i = icmp eq i32 %542, 0
  %545 = select i1 %.not1139.i, i32 2139095040, i32 2143289344
  %546 = or disjoint i32 %545, %544
  %547 = bitcast i32 %546 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

548:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %549 = or disjoint i32 %542, 1024
  br label %550

550:                                              ; preds = %548, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %551 = phi i32 [ %549, %548 ], [ %542, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %552 = uitofp i32 %551 to float
  %.not1120.i = icmp eq i32 %541, 0
  %553 = add nsw i32 %541, -25
  %554 = select i1 %.not1120.i, i32 -24, i32 %553
  %555 = call float @__ocml_ldexp_f32(float noundef %552, i32 noundef %554) #5
  %556 = fneg contract float %555
  %.not11211122.i = icmp slt i16 %.sroa.0228.0.copyload.i, 0
  %557 = select contract i1 %.not11211122.i, float %556, float %555
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %550, %543
  %558 = phi float [ %547, %543 ], [ %557, %550 ]
  %559 = zext i16 %.sroa.0219.0.copyload.i to i32
  %560 = lshr i32 %559, 10
  %561 = and i32 %560, 31
  %562 = and i32 %559, 1023
  switch i32 %561, label %568 [
    i32 31, label %563
    i32 0, label %570
  ]

563:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0219.0.copyload.signext.i = sext i16 %.sroa.0219.0.copyload.i to i32
  %564 = and i32 %.sroa.0219.0.copyload.signext.i, -2147483648
  %.not1138.i = icmp eq i32 %562, 0
  %565 = select i1 %.not1138.i, i32 2139095040, i32 2143289344
  %566 = or disjoint i32 %565, %564
  %567 = bitcast i32 %566 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

568:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %569 = or disjoint i32 %562, 1024
  br label %570

570:                                              ; preds = %568, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %571 = phi i32 [ %569, %568 ], [ %562, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %572 = uitofp i32 %571 to float
  %.not1123.i = icmp eq i32 %561, 0
  %573 = add nsw i32 %561, -25
  %574 = select i1 %.not1123.i, i32 -24, i32 %573
  %575 = call float @__ocml_ldexp_f32(float noundef %572, i32 noundef %574) #5
  %576 = fneg contract float %575
  %.not11241125.i = icmp slt i16 %.sroa.0219.0.copyload.i, 0
  %577 = select contract i1 %.not11241125.i, float %576, float %575
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %570, %563
  %578 = phi float [ %567, %563 ], [ %577, %570 ]
  %579 = fmul contract float %558, %578
  %580 = fadd contract float %455, %579
  %581 = or disjoint i64 %535, %98
  %582 = trunc i64 %581 to i32
  %583 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %582
  %.sroa.0210.0.copyload.i = load i16, ptr addrspace(3) %583, align 2, !tbaa.struct !25
  %584 = zext i16 %.sroa.0210.0.copyload.i to i32
  %585 = lshr i32 %584, 10
  %586 = and i32 %585, 31
  %587 = and i32 %584, 1023
  switch i32 %586, label %593 [
    i32 31, label %588
    i32 0, label %595
  ]

588:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0210.0.copyload.signext.i = sext i16 %.sroa.0210.0.copyload.i to i32
  %589 = and i32 %.sroa.0210.0.copyload.signext.i, -2147483648
  %.not1137.i = icmp eq i32 %587, 0
  %590 = select i1 %.not1137.i, i32 2139095040, i32 2143289344
  %591 = or disjoint i32 %590, %589
  %592 = bitcast i32 %591 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

593:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %594 = or disjoint i32 %587, 1024
  br label %595

595:                                              ; preds = %593, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %596 = phi i32 [ %594, %593 ], [ %587, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %597 = uitofp i32 %596 to float
  %.not1126.i = icmp eq i32 %586, 0
  %598 = add nsw i32 %586, -25
  %599 = select i1 %.not1126.i, i32 -24, i32 %598
  %600 = call float @__ocml_ldexp_f32(float noundef %597, i32 noundef %599) #5
  %601 = fneg contract float %600
  %.not11271128.i = icmp slt i16 %.sroa.0210.0.copyload.i, 0
  %602 = select contract i1 %.not11271128.i, float %601, float %600
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %595, %588
  %603 = phi float [ %592, %588 ], [ %602, %595 ]
  %604 = fmul contract float %558, %603
  %605 = fadd contract float %480, %604
  %606 = or disjoint i64 %535, %99
  %607 = trunc i64 %606 to i32
  %608 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %607
  %.sroa.0201.0.copyload.i = load i16, ptr addrspace(3) %608, align 2, !tbaa.struct !25
  %609 = zext i16 %.sroa.0201.0.copyload.i to i32
  %610 = lshr i32 %609, 10
  %611 = and i32 %610, 31
  %612 = and i32 %609, 1023
  switch i32 %611, label %618 [
    i32 31, label %613
    i32 0, label %620
  ]

613:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0201.0.copyload.signext.i = sext i16 %.sroa.0201.0.copyload.i to i32
  %614 = and i32 %.sroa.0201.0.copyload.signext.i, -2147483648
  %.not1136.i = icmp eq i32 %612, 0
  %615 = select i1 %.not1136.i, i32 2139095040, i32 2143289344
  %616 = or disjoint i32 %615, %614
  %617 = bitcast i32 %616 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

618:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %619 = or disjoint i32 %612, 1024
  br label %620

620:                                              ; preds = %618, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %621 = phi i32 [ %619, %618 ], [ %612, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %622 = uitofp i32 %621 to float
  %.not1129.i = icmp eq i32 %611, 0
  %623 = add nsw i32 %611, -25
  %624 = select i1 %.not1129.i, i32 -24, i32 %623
  %625 = call float @__ocml_ldexp_f32(float noundef %622, i32 noundef %624) #5
  %626 = fneg contract float %625
  %.not11301131.i = icmp slt i16 %.sroa.0201.0.copyload.i, 0
  %627 = select contract i1 %.not11301131.i, float %626, float %625
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %620, %613
  %628 = phi float [ %617, %613 ], [ %627, %620 ]
  %629 = fmul contract float %558, %628
  %630 = fadd contract float %505, %629
  %631 = or disjoint i64 %535, %100
  %632 = trunc i64 %631 to i32
  %633 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %632
  %.sroa.0192.0.copyload.i = load i16, ptr addrspace(3) %633, align 2, !tbaa.struct !25
  %634 = zext i16 %.sroa.0192.0.copyload.i to i32
  %635 = lshr i32 %634, 10
  %636 = and i32 %635, 31
  %637 = and i32 %634, 1023
  switch i32 %636, label %643 [
    i32 31, label %638
    i32 0, label %645
  ]

638:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0192.0.copyload.signext.i = sext i16 %.sroa.0192.0.copyload.i to i32
  %639 = and i32 %.sroa.0192.0.copyload.signext.i, -2147483648
  %.not1135.i = icmp eq i32 %637, 0
  %640 = select i1 %.not1135.i, i32 2139095040, i32 2143289344
  %641 = or disjoint i32 %640, %639
  %642 = bitcast i32 %641 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

643:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %644 = or disjoint i32 %637, 1024
  br label %645

645:                                              ; preds = %643, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %646 = phi i32 [ %644, %643 ], [ %637, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %647 = uitofp i32 %646 to float
  %.not1132.i = icmp eq i32 %636, 0
  %648 = add nsw i32 %636, -25
  %649 = select i1 %.not1132.i, i32 -24, i32 %648
  %650 = call float @__ocml_ldexp_f32(float noundef %647, i32 noundef %649) #5
  %651 = fneg contract float %650
  %.not11331134.i = icmp slt i16 %.sroa.0192.0.copyload.i, 0
  %652 = select contract i1 %.not11331134.i, float %651, float %650
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %645, %638
  %653 = phi float [ %642, %638 ], [ %652, %645 ]
  %654 = fmul contract float %558, %653
  %655 = fadd contract float %530, %654
  %656 = add nuw nsw i64 %152, 4
  %657 = icmp ult i64 %152, 60
  br i1 %657, label %151, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, !llvm.loop !33

658:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph1178.i
  %659 = phi i64 [ %119, %.lr.ph1178.i ], [ %671, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %660 = lshr i64 %659, 5
  %661 = icmp slt i64 %660, %121
  %662 = and i1 %661, %127
  br i1 %662, label %663, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

663:                                              ; preds = %658
  %664 = trunc i64 %659 to i32
  %665 = getelementptr inbounds float, ptr addrspace(3) %124, i32 %664
  %666 = load float, ptr addrspace(3) %665, align 4, !tbaa !19
  %667 = and i64 %659, 9223372036854775776
  %668 = or disjoint i64 %667, %125
  %669 = or disjoint i64 %668, %126
  %670 = getelementptr inbounds float, ptr %9, i64 %669
  store float %666, ptr %670, align 4, !tbaa !19
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %663, %658
  %671 = add nuw nsw i64 %659, 128
  %672 = icmp ult i64 %659, 1920
  br i1 %672, label %658, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !34

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
