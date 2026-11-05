;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-k5rc_vbr/kernel.cpp"
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
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) nocapture readonly %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #4 {
  %7 = addrspacecast ptr addrspace(1) %1 to ptr
  %8 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %9 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !10
  %10 = icmp ult i64 %9, 8388607
  call void @llvm.assume(i1 %10), !noalias !10
  %11 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %12 = icmp ult i64 %11, 2147483647
  call void @llvm.assume(i1 %12), !noalias !10
  %13 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %14 = icmp ult i64 %13, 2147483647
  call void @llvm.assume(i1 %14), !noalias !10
  %15 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %16 = icmp ult i64 %15, 256
  call void @llvm.assume(i1 %16), !noalias !13
  %17 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %18 = icmp eq i64 %17, 0
  call void @llvm.assume(i1 %18), !noalias !13
  %19 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %20 = icmp eq i64 %19, 0
  call void @llvm.assume(i1 %20), !noalias !13
  %21 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %22 = icmp ult i64 %21, 8388608
  call void @llvm.assume(i1 %22), !noalias !16
  %23 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24), !noalias !16
  %25 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %26 = icmp ult i64 %25, 2147483648
  call void @llvm.assume(i1 %26), !noalias !16
  %27 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %28 = icmp ult i64 %27, 8388607
  call void @llvm.assume(i1 %28)
  %29 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %30 = icmp eq i64 %29, 0
  call void @llvm.assume(i1 %30)
  %31 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %34 = icmp ult i64 %33, 256
  call void @llvm.assume(i1 %34)
  %35 = sext i32 %5 to i64
  %36 = sext i32 %3 to i64
  %37 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %38 = inttoptr i32 %37 to ptr addrspace(3)
  %39 = getelementptr inbounds i8, ptr addrspace(3) %38, i32 512
  %40 = and i64 %33, 7
  %41 = lshr i64 %33, 3
  %42 = icmp slt i64 %41, %35
  %43 = icmp slt i64 %40, %36
  %44 = and i1 %42, %43
  br i1 %44, label %45, label %.lr.ph521.i

45:                                               ; preds = %6
  %46 = shl nuw nsw i64 %27, 8
  %47 = addrspacecast ptr addrspace(1) %0 to ptr
  %48 = and i64 %33, 248
  %49 = or disjoint i64 %48, %46
  %50 = or disjoint i64 %49, %40
  %51 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %47, i64 %50
  %.sroa.0271.0.copyload.i = load i16, ptr %51, align 2, !tbaa.struct !19
  br label %.lr.ph521.i

.lr.ph521.i:                                      ; preds = %45, %6
  %.sroa.0273.1.i = phi i16 [ %.sroa.0271.0.copyload.i, %45 ], [ 0, %6 ]
  %52 = trunc i64 %33 to i32
  %53 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %39, i32 %52
  store i16 %.sroa.0273.1.i, ptr addrspace(3) %53, align 2, !tbaa.struct !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %55 = icmp eq i64 %54, 0
  call void @llvm.assume(i1 %55)
  %56 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %57 = icmp eq i64 %56, 0
  call void @llvm.assume(i1 %57)
  %58 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %59 = icmp ult i64 %58, 256
  call void @llvm.assume(i1 %59)
  %60 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %61 = inttoptr i32 %60 to ptr addrspace(3)
  %62 = getelementptr inbounds i8, ptr addrspace(3) %61, i32 512
  %63 = getelementptr inbounds i8, ptr addrspace(3) %61, i32 1024
  %64 = lshr i64 %58, 5
  %65 = shl nuw nsw i64 %58, 3
  %66 = and i64 %65, 248
  %67 = or disjoint i64 %66, %64
  %68 = trunc i64 %67 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %62, i32 %68
  %.sroa.0308.0.copyload.i = load i16, ptr addrspace(3) %69, align 2, !tbaa.struct !19
  %70 = trunc i64 %58 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %70
  store i16 %.sroa.0308.0.copyload.i, ptr addrspace(3) %71, align 2, !tbaa.struct !19
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %73 = icmp eq i64 %72, 0
  call void @llvm.assume(i1 %73)
  %74 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %75 = icmp eq i64 %74, 0
  call void @llvm.assume(i1 %75)
  %76 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %77 = icmp ult i64 %76, 256
  call void @llvm.assume(i1 %77)
  %.tr497.i = trunc i64 %27 to i32
  %78 = shl nuw i32 %.tr497.i, 9
  %79 = sext i32 %4 to i64
  %80 = sext i32 %5 to i64
  %81 = sext i32 %78 to i64
  %82 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %83 = inttoptr i32 %82 to ptr addrspace(3)
  %84 = getelementptr inbounds i8, ptr addrspace(3) %83, i32 1536
  %85 = and i64 %76, 31
  %86 = icmp slt i64 %85, %80
  br label %97

.lr.ph524.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %92 = icmp ult i64 %91, 256
  call void @llvm.assume(i1 %92)
  %93 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %94 = inttoptr i32 %93 to ptr addrspace(3)
  %95 = getelementptr inbounds i8, ptr addrspace(3) %94, i32 1536
  %96 = getelementptr inbounds i8, ptr addrspace(3) %94, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i

97:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph521.i
  %98 = phi i64 [ %76, %.lr.ph521.i ], [ %109, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %99 = lshr i64 %98, 5
  %100 = icmp slt i64 %99, %79
  %101 = and i1 %100, %86
  br i1 %101, label %102, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

102:                                              ; preds = %97
  %103 = and i64 %98, 9223372036854775776
  %104 = or disjoint i64 %103, %81
  %105 = or disjoint i64 %104, %85
  %106 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %105
  %.sroa.0230.0.copyload.i = load i16, ptr %106, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %102, %97
  %.sroa.0232.1.i = phi i16 [ %.sroa.0230.0.copyload.i, %102 ], [ 0, %97 ]
  %107 = trunc i64 %98 to i32
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %107
  store i16 %.sroa.0232.1.i, ptr addrspace(3) %108, align 2, !tbaa.struct !19
  %109 = add nuw nsw i64 %98, 256
  %110 = icmp ult i64 %98, 256
  br i1 %110, label %97, label %.lr.ph524.i, !llvm.loop !24

._crit_edge525.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %111 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %112 = icmp eq i64 %111, 0
  call void @llvm.assume(i1 %112)
  %113 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %114 = icmp eq i64 %113, 0
  call void @llvm.assume(i1 %114)
  %115 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %116 = icmp ult i64 %115, 256
  call void @llvm.assume(i1 %116)
  %117 = icmp ult i64 %115, 128
  br i1 %117, label %.lr.ph527.i, label %._crit_edge528.i

.lr.ph527.i:                                      ; preds = %._crit_edge525.i
  %118 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %119 = inttoptr i32 %118 to ptr addrspace(3)
  %120 = getelementptr inbounds i8, ptr addrspace(3) %119, i32 1024
  %121 = getelementptr inbounds i8, ptr addrspace(3) %119, i32 2560
  %122 = and i64 %115, 15
  %123 = shl nuw nsw i64 %115, 1
  %124 = and i64 %123, 224
  br label %143

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph524.i
  %125 = phi i64 [ %91, %.lr.ph524.i ], [ %134, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %126 = lshr i64 %125, 4
  %127 = shl nuw nsw i64 %125, 5
  %128 = and i64 %127, 480
  %129 = or disjoint i64 %128, %126
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %130
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %131, align 2, !tbaa.struct !19
  %132 = trunc i64 %125 to i32
  %133 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %132
  store i16 %.sroa.0309.0.copyload.i, ptr addrspace(3) %133, align 2, !tbaa.struct !19
  %134 = add nuw nsw i64 %125, 256
  %135 = icmp ult i64 %125, 256
  br i1 %135, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %._crit_edge525.i, !llvm.loop !28

._crit_edge528.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %._crit_edge525.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %136 = shl nuw nsw i64 %27, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %138 = icmp ult i64 %137, 256
  call void @llvm.assume(i1 %138)
  %139 = icmp eq i64 %137, 0
  br i1 %139, label %196, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %140 = trunc i64 %115 to i32
  %141 = and i32 %140, 127
  %142 = getelementptr inbounds float, ptr addrspace(3) %119, i32 %141
  store float %194, ptr addrspace(3) %142, align 4, !tbaa !29
  br label %._crit_edge528.i

143:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph527.i
  %144 = phi i64 [ 0, %.lr.ph527.i ], [ %195, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %145 = phi float [ 0.000000e+00, %.lr.ph527.i ], [ %194, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %146 = add nuw nsw i64 %144, %124
  %147 = trunc i64 %146 to i32
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %120, i32 %147
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %148, align 2, !tbaa.struct !19
  %149 = shl nuw nsw i64 %144, 4
  %150 = or disjoint i64 %149, %122
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %121, i32 %151
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !19
  %153 = zext i16 %.sroa.0189.0.copyload.i to i32
  %154 = lshr i32 %153, 10
  %155 = and i32 %154, 31
  %156 = and i32 %153, 1023
  switch i32 %155, label %162 [
    i32 31, label %157
    i32 0, label %164
  ]

157:                                              ; preds = %143
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %158 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not506.i = icmp eq i32 %156, 0
  %159 = select i1 %.not506.i, i32 2139095040, i32 2143289344
  %160 = or disjoint i32 %159, %158
  %161 = bitcast i32 %160 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

162:                                              ; preds = %143
  %163 = or disjoint i32 %156, 1024
  br label %164

164:                                              ; preds = %162, %143
  %165 = phi i32 [ %163, %162 ], [ %156, %143 ]
  %166 = uitofp i32 %165 to float
  %.not.i = icmp eq i32 %155, 0
  %167 = add nsw i32 %155, -25
  %168 = select i1 %.not.i, i32 -24, i32 %167
  %169 = call float @__ocml_ldexp_f32(float noundef %166, i32 noundef %168) #5
  %170 = fneg contract float %169
  %.not500501.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %171 = select contract i1 %.not500501.i, float %170, float %169
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %164, %157
  %172 = phi float [ %161, %157 ], [ %171, %164 ]
  %173 = zext i16 %.sroa.0180.0.copyload.i to i32
  %174 = lshr i32 %173, 10
  %175 = and i32 %174, 31
  %176 = and i32 %173, 1023
  switch i32 %175, label %182 [
    i32 31, label %177
    i32 0, label %184
  ]

177:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %178 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not505.i = icmp eq i32 %176, 0
  %179 = select i1 %.not505.i, i32 2139095040, i32 2143289344
  %180 = or disjoint i32 %179, %178
  %181 = bitcast i32 %180 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

182:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %183 = or disjoint i32 %176, 1024
  br label %184

184:                                              ; preds = %182, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %185 = phi i32 [ %183, %182 ], [ %176, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %186 = uitofp i32 %185 to float
  %.not502.i = icmp eq i32 %175, 0
  %187 = add nsw i32 %175, -25
  %188 = select i1 %.not502.i, i32 -24, i32 %187
  %189 = call float @__ocml_ldexp_f32(float noundef %186, i32 noundef %188) #5
  %190 = fneg contract float %189
  %.not503504.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %191 = select contract i1 %.not503504.i, float %190, float %189
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %184, %177
  %192 = phi float [ %181, %177 ], [ %191, %184 ]
  %193 = fmul contract float %172, %192
  %194 = fadd contract float %145, %193
  %195 = add nuw nsw i64 %144, 1
  %exitcond.not.i = icmp eq i64 %195, 32
  br i1 %exitcond.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %143, !llvm.loop !31

196:                                              ; preds = %._crit_edge528.i
  %197 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %198 = icmp eq i64 %197, 0
  call void @llvm.assume(i1 %198)
  %199 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %200 = icmp eq i64 %199, 0
  call void @llvm.assume(i1 %200)
  %201 = sext i32 %3 to i64
  %202 = call i32 @llvm.amdgcn.groupstaticsize()
  %203 = inttoptr i32 %202 to ptr addrspace(3)
  %204 = icmp sgt i32 %4, 0
  %205 = icmp ugt i32 %4, 1
  %206 = icmp ugt i32 %4, 2
  %207 = icmp ugt i32 %4, 3
  %208 = icmp ugt i32 %4, 4
  %209 = icmp ugt i32 %4, 5
  %210 = icmp ugt i32 %4, 6
  %211 = icmp ugt i32 %4, 7
  %212 = icmp ugt i32 %4, 8
  %213 = icmp ugt i32 %4, 9
  %214 = icmp ugt i32 %4, 10
  %215 = icmp ugt i32 %4, 11
  %216 = icmp ugt i32 %4, 12
  %217 = icmp ugt i32 %4, 13
  %218 = icmp ugt i32 %4, 14
  %219 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %196
  %220 = phi i64 [ 0, %196 ], [ %226, %.split.us.i ]
  %221 = icmp slt i64 %220, %201
  %222 = shl i64 %220, 4
  %.tr499.i = trunc i64 %220 to i32
  %223 = shl i32 %.tr499.i, 4
  %224 = sext i32 %223 to i64
  %225 = add nsw i64 %136, %224
  %.fr.i = freeze i1 %221
  %brmerge.not.i = select i1 %.fr.i, i1 %204, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %315, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %226 = add nuw nsw i64 %220, 1
  %exitcond531.not.i = icmp eq i64 %226, 8
  br i1 %exitcond531.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %227 = trunc i64 %222 to i32
  %228 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %227
  %229 = load float, ptr addrspace(3) %228, align 4, !tbaa !29
  %230 = getelementptr inbounds float, ptr %8, i64 %225
  store float %229, ptr %230, align 32, !tbaa !29
  br i1 %205, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %231 = trunc i64 %222 to i32
  %232 = or disjoint i32 %231, 1
  %233 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %232
  %234 = load float, ptr addrspace(3) %233, align 4, !tbaa !29
  %235 = or disjoint i64 %225, 1
  %236 = getelementptr inbounds float, ptr %8, i64 %235
  store float %234, ptr %236, align 4, !tbaa !29
  br i1 %206, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %237 = trunc i64 %222 to i32
  %238 = or disjoint i32 %237, 2
  %239 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %238
  %240 = load float, ptr addrspace(3) %239, align 4, !tbaa !29
  %241 = or disjoint i64 %225, 2
  %242 = getelementptr inbounds float, ptr %8, i64 %241
  store float %240, ptr %242, align 8, !tbaa !29
  br i1 %207, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %243 = trunc i64 %222 to i32
  %244 = or disjoint i32 %243, 3
  %245 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %244
  %246 = load float, ptr addrspace(3) %245, align 4, !tbaa !29
  %247 = or disjoint i64 %225, 3
  %248 = getelementptr inbounds float, ptr %8, i64 %247
  store float %246, ptr %248, align 4, !tbaa !29
  br i1 %208, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %249 = trunc i64 %222 to i32
  %250 = or disjoint i32 %249, 4
  %251 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %250
  %252 = load float, ptr addrspace(3) %251, align 4, !tbaa !29
  %253 = or disjoint i64 %225, 4
  %254 = getelementptr inbounds float, ptr %8, i64 %253
  store float %252, ptr %254, align 16, !tbaa !29
  br i1 %209, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %255 = trunc i64 %222 to i32
  %256 = or disjoint i32 %255, 5
  %257 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %256
  %258 = load float, ptr addrspace(3) %257, align 4, !tbaa !29
  %259 = or disjoint i64 %225, 5
  %260 = getelementptr inbounds float, ptr %8, i64 %259
  store float %258, ptr %260, align 4, !tbaa !29
  br i1 %210, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %261 = trunc i64 %222 to i32
  %262 = or disjoint i32 %261, 6
  %263 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %262
  %264 = load float, ptr addrspace(3) %263, align 4, !tbaa !29
  %265 = or disjoint i64 %225, 6
  %266 = getelementptr inbounds float, ptr %8, i64 %265
  store float %264, ptr %266, align 8, !tbaa !29
  br i1 %211, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %267 = trunc i64 %222 to i32
  %268 = or disjoint i32 %267, 7
  %269 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %268
  %270 = load float, ptr addrspace(3) %269, align 4, !tbaa !29
  %271 = or disjoint i64 %225, 7
  %272 = getelementptr inbounds float, ptr %8, i64 %271
  store float %270, ptr %272, align 4, !tbaa !29
  br i1 %212, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %273 = trunc i64 %222 to i32
  %274 = or disjoint i32 %273, 8
  %275 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %274
  %276 = load float, ptr addrspace(3) %275, align 4, !tbaa !29
  %277 = or disjoint i64 %225, 8
  %278 = getelementptr inbounds float, ptr %8, i64 %277
  store float %276, ptr %278, align 32, !tbaa !29
  br i1 %213, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %279 = trunc i64 %222 to i32
  %280 = or disjoint i32 %279, 9
  %281 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %280
  %282 = load float, ptr addrspace(3) %281, align 4, !tbaa !29
  %283 = or disjoint i64 %225, 9
  %284 = getelementptr inbounds float, ptr %8, i64 %283
  store float %282, ptr %284, align 4, !tbaa !29
  br i1 %214, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %285 = trunc i64 %222 to i32
  %286 = or disjoint i32 %285, 10
  %287 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %286
  %288 = load float, ptr addrspace(3) %287, align 4, !tbaa !29
  %289 = or disjoint i64 %225, 10
  %290 = getelementptr inbounds float, ptr %8, i64 %289
  store float %288, ptr %290, align 8, !tbaa !29
  br i1 %215, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %291 = trunc i64 %222 to i32
  %292 = or disjoint i32 %291, 11
  %293 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %292
  %294 = load float, ptr addrspace(3) %293, align 4, !tbaa !29
  %295 = or disjoint i64 %225, 11
  %296 = getelementptr inbounds float, ptr %8, i64 %295
  store float %294, ptr %296, align 4, !tbaa !29
  br i1 %216, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %297 = trunc i64 %222 to i32
  %298 = or disjoint i32 %297, 12
  %299 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %298
  %300 = load float, ptr addrspace(3) %299, align 4, !tbaa !29
  %301 = or disjoint i64 %225, 12
  %302 = getelementptr inbounds float, ptr %8, i64 %301
  store float %300, ptr %302, align 16, !tbaa !29
  br i1 %217, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %303 = trunc i64 %222 to i32
  %304 = or disjoint i32 %303, 13
  %305 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %304
  %306 = load float, ptr addrspace(3) %305, align 4, !tbaa !29
  %307 = or disjoint i64 %225, 13
  %308 = getelementptr inbounds float, ptr %8, i64 %307
  store float %306, ptr %308, align 4, !tbaa !29
  br i1 %218, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %309 = trunc i64 %222 to i32
  %310 = or disjoint i32 %309, 14
  %311 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !29
  %313 = or disjoint i64 %225, 14
  %314 = getelementptr inbounds float, ptr %8, i64 %313
  store float %312, ptr %314, align 8, !tbaa !29
  br i1 %219, label %315, label %.split.us.i

315:                                              ; preds = %.preheader.split.15.i
  %316 = trunc i64 %222 to i32
  %317 = or disjoint i32 %316, 15
  %318 = getelementptr inbounds float, ptr addrspace(3) %203, i32 %317
  %319 = load float, ptr addrspace(3) %318, align 4, !tbaa !29
  %320 = or disjoint i64 %225, 15
  %321 = getelementptr inbounds float, ptr %8, i64 %320
  store float %319, ptr %321, align 4, !tbaa !29
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge528.i, %.split.us.i
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
;----------------- End AdaptiveCpp IR dump ---------------
