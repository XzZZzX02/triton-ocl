;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882027/tmp/triton-sycl-cache/compile-rgvmodvz/kernel.cpp"
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
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) nocapture readonly %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #4 {
  %7 = addrspacecast ptr addrspace(1) %1 to ptr
  %8 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %9 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %10 = icmp ult i64 %9, 8388607
  call void @llvm.assume(i1 %10), !noalias !14
  %11 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %12 = icmp ult i64 %11, 2147483647
  call void @llvm.assume(i1 %12), !noalias !14
  %13 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %14 = icmp ult i64 %13, 2147483647
  call void @llvm.assume(i1 %14), !noalias !14
  %15 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %16 = icmp ult i64 %15, 256
  call void @llvm.assume(i1 %16), !noalias !17
  %17 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %18 = icmp eq i64 %17, 0
  call void @llvm.assume(i1 %18), !noalias !17
  %19 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %20 = icmp eq i64 %19, 0
  call void @llvm.assume(i1 %20), !noalias !17
  %21 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %22 = icmp ult i64 %21, 8388608
  call void @llvm.assume(i1 %22), !noalias !20
  %23 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24), !noalias !20
  %25 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %26 = icmp ult i64 %25, 2147483648
  call void @llvm.assume(i1 %26), !noalias !20
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
  br i1 %44, label %45, label %.lr.ph717.i

45:                                               ; preds = %6
  %46 = shl nuw nsw i64 %27, 8
  %47 = addrspacecast ptr addrspace(1) %0 to ptr
  %48 = and i64 %33, 248
  %49 = or disjoint i64 %48, %46
  %50 = or disjoint i64 %49, %40
  %51 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %47, i64 %50
  %.sroa.0325.0.copyload.i = load i16, ptr %51, align 2, !tbaa.struct !23
  br label %.lr.ph717.i

.lr.ph717.i:                                      ; preds = %45, %6
  %.sroa.0327.1.i = phi i16 [ %.sroa.0325.0.copyload.i, %45 ], [ 0, %6 ]
  %52 = trunc i64 %33 to i32
  %53 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %39, i32 %52
  store i16 %.sroa.0327.1.i, ptr addrspace(3) %53, align 2, !tbaa.struct !23
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
  %.sroa.0387.0.copyload.i = load i16, ptr addrspace(3) %69, align 2, !tbaa.struct !23
  %70 = trunc i64 %58 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %70
  store i16 %.sroa.0387.0.copyload.i, ptr addrspace(3) %71, align 2, !tbaa.struct !23
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
  %.tr669.i = trunc i64 %27 to i32
  %78 = shl nuw i32 %.tr669.i, 9
  %79 = sext i32 %4 to i64
  %80 = sext i32 %5 to i64
  %81 = sext i32 %78 to i64
  %82 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %83 = inttoptr i32 %82 to ptr addrspace(3)
  %84 = getelementptr inbounds i8, ptr addrspace(3) %83, i32 1536
  %85 = and i64 %76, 31
  %86 = icmp slt i64 %85, %80
  br label %97

.lr.ph720.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i
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
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

97:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i, %.lr.ph717.i
  %98 = phi i64 [ %76, %.lr.ph717.i ], [ %109, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i ]
  %99 = lshr i64 %98, 5
  %100 = icmp slt i64 %99, %79
  %101 = and i1 %100, %86
  br i1 %101, label %102, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i

102:                                              ; preds = %97
  %103 = and i64 %98, 9223372036854775776
  %104 = or disjoint i64 %103, %81
  %105 = or disjoint i64 %104, %85
  %106 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %105
  %.sroa.0284.0.copyload.i = load i16, ptr %106, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i: ; preds = %102, %97
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %102 ], [ 0, %97 ]
  %107 = trunc i64 %98 to i32
  %108 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %84, i32 %107
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %108, align 2, !tbaa.struct !23
  %109 = add nuw nsw i64 %98, 256
  %110 = icmp ult i64 %98, 256
  br i1 %110, label %97, label %.lr.ph720.i, !llvm.loop !28

._crit_edge721.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
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
  br i1 %117, label %.lr.ph723.i, label %._crit_edge724.i

.lr.ph723.i:                                      ; preds = %._crit_edge721.i
  %118 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %119 = inttoptr i32 %118 to ptr addrspace(3)
  %120 = getelementptr inbounds i8, ptr addrspace(3) %119, i32 1024
  %121 = getelementptr inbounds i8, ptr addrspace(3) %119, i32 2560
  %122 = and i64 %115, 15
  %123 = shl nuw nsw i64 %115, 1
  %124 = and i64 %123, 224
  br label %143

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph720.i
  %125 = phi i64 [ %91, %.lr.ph720.i ], [ %134, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %126 = lshr i64 %125, 4
  %127 = shl nuw nsw i64 %125, 5
  %128 = and i64 %127, 480
  %129 = or disjoint i64 %128, %126
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %130
  %.sroa.0386.0.copyload.i = load i16, ptr addrspace(3) %131, align 2, !tbaa.struct !23
  %132 = trunc i64 %125 to i32
  %133 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %96, i32 %132
  store i16 %.sroa.0386.0.copyload.i, ptr addrspace(3) %133, align 2, !tbaa.struct !23
  %134 = add nuw nsw i64 %125, 256
  %135 = icmp ult i64 %125, 256
  br i1 %135, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %._crit_edge721.i, !llvm.loop !32

._crit_edge724.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge721.i
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
  br i1 %139, label %347, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %140 = trunc i64 %115 to i32
  %141 = and i32 %140, 127
  %142 = getelementptr inbounds float, ptr addrspace(3) %119, i32 %141
  store float %344, ptr addrspace(3) %142, align 4, !tbaa !33
  br label %._crit_edge724.i

143:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph723.i
  %144 = phi i64 [ 0, %.lr.ph723.i ], [ %345, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %145 = phi float [ 0.000000e+00, %.lr.ph723.i ], [ %344, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %146 = add nuw nsw i64 %144, %124
  %147 = trunc i64 %146 to i32
  %148 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %120, i32 %147
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %148, align 2, !tbaa.struct !23
  %149 = shl nuw nsw i64 %144, 4
  %150 = or disjoint i64 %149, %122
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %121, i32 %151
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %152, align 2, !tbaa.struct !23
  %153 = zext i16 %.sroa.0243.0.copyload.i to i32
  %154 = lshr i32 %153, 10
  %155 = and i32 %154, 31
  %156 = and i32 %153, 1023
  switch i32 %155, label %162 [
    i32 31, label %157
    i32 0, label %164
  ]

157:                                              ; preds = %143
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %158 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not702.i = icmp eq i32 %156, 0
  %159 = select i1 %.not702.i, i32 2139095040, i32 2143289344
  %160 = or disjoint i32 %159, %158
  %161 = bitcast i32 %160 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

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
  %.not672673.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %171 = select contract i1 %.not672673.i, float %170, float %169
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i: ; preds = %164, %157
  %172 = phi float [ %161, %157 ], [ %171, %164 ]
  %173 = zext i16 %.sroa.0234.0.copyload.i to i32
  %174 = lshr i32 %173, 10
  %175 = and i32 %174, 31
  %176 = and i32 %173, 1023
  switch i32 %175, label %182 [
    i32 31, label %177
    i32 0, label %184
  ]

177:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %178 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not701.i = icmp eq i32 %176, 0
  %179 = select i1 %.not701.i, i32 2139095040, i32 2143289344
  %180 = or disjoint i32 %179, %178
  %181 = bitcast i32 %180 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

182:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %183 = or disjoint i32 %176, 1024
  br label %184

184:                                              ; preds = %182, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %185 = phi i32 [ %183, %182 ], [ %176, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i ]
  %186 = uitofp i32 %185 to float
  %.not674.i = icmp eq i32 %175, 0
  %187 = add nsw i32 %175, -25
  %188 = select i1 %.not674.i, i32 -24, i32 %187
  %189 = call float @__ocml_ldexp_f32(float noundef %186, i32 noundef %188) #5
  %190 = fneg contract float %189
  %.not675676.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %191 = select contract i1 %.not675676.i, float %190, float %189
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i: ; preds = %184, %177
  %192 = phi float [ %181, %177 ], [ %191, %184 ]
  %193 = fmul contract float %172, %192
  %194 = fadd contract float %145, %193
  %195 = or disjoint i64 %144, 1
  %196 = add nuw nsw i64 %195, %124
  %197 = trunc i64 %196 to i32
  %198 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %120, i32 %197
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %198, align 2, !tbaa.struct !23
  %199 = shl nuw nsw i64 %195, 4
  %200 = or disjoint i64 %199, %122
  %201 = trunc i64 %200 to i32
  %202 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %121, i32 %201
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %202, align 2, !tbaa.struct !23
  %203 = zext i16 %.sroa.0225.0.copyload.i to i32
  %204 = lshr i32 %203, 10
  %205 = and i32 %204, 31
  %206 = and i32 %203, 1023
  switch i32 %205, label %212 [
    i32 31, label %207
    i32 0, label %214
  ]

207:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %208 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not700.i = icmp eq i32 %206, 0
  %209 = select i1 %.not700.i, i32 2139095040, i32 2143289344
  %210 = or disjoint i32 %209, %208
  %211 = bitcast i32 %210 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %213 = or disjoint i32 %206, 1024
  br label %214

214:                                              ; preds = %212, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %215 = phi i32 [ %213, %212 ], [ %206, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i ]
  %216 = uitofp i32 %215 to float
  %.not677.i = icmp eq i32 %205, 0
  %217 = add nsw i32 %205, -25
  %218 = select i1 %.not677.i, i32 -24, i32 %217
  %219 = call float @__ocml_ldexp_f32(float noundef %216, i32 noundef %218) #5
  %220 = fneg contract float %219
  %.not678679.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %221 = select contract i1 %.not678679.i, float %220, float %219
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i: ; preds = %214, %207
  %222 = phi float [ %211, %207 ], [ %221, %214 ]
  %223 = zext i16 %.sroa.0216.0.copyload.i to i32
  %224 = lshr i32 %223, 10
  %225 = and i32 %224, 31
  %226 = and i32 %223, 1023
  switch i32 %225, label %232 [
    i32 31, label %227
    i32 0, label %234
  ]

227:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %228 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not699.i = icmp eq i32 %226, 0
  %229 = select i1 %.not699.i, i32 2139095040, i32 2143289344
  %230 = or disjoint i32 %229, %228
  %231 = bitcast i32 %230 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

232:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %233 = or disjoint i32 %226, 1024
  br label %234

234:                                              ; preds = %232, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %235 = phi i32 [ %233, %232 ], [ %226, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i ]
  %236 = uitofp i32 %235 to float
  %.not680.i = icmp eq i32 %225, 0
  %237 = add nsw i32 %225, -25
  %238 = select i1 %.not680.i, i32 -24, i32 %237
  %239 = call float @__ocml_ldexp_f32(float noundef %236, i32 noundef %238) #5
  %240 = fneg contract float %239
  %.not681682.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %241 = select contract i1 %.not681682.i, float %240, float %239
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i: ; preds = %234, %227
  %242 = phi float [ %231, %227 ], [ %241, %234 ]
  %243 = fmul contract float %222, %242
  %244 = fadd contract float %194, %243
  %245 = or disjoint i64 %144, 2
  %246 = add nuw nsw i64 %245, %124
  %247 = trunc i64 %246 to i32
  %248 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %120, i32 %247
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %248, align 2, !tbaa.struct !23
  %249 = shl nuw nsw i64 %245, 4
  %250 = or disjoint i64 %249, %122
  %251 = trunc i64 %250 to i32
  %252 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %121, i32 %251
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %252, align 2, !tbaa.struct !23
  %253 = zext i16 %.sroa.0207.0.copyload.i to i32
  %254 = lshr i32 %253, 10
  %255 = and i32 %254, 31
  %256 = and i32 %253, 1023
  switch i32 %255, label %262 [
    i32 31, label %257
    i32 0, label %264
  ]

257:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %258 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not698.i = icmp eq i32 %256, 0
  %259 = select i1 %.not698.i, i32 2139095040, i32 2143289344
  %260 = or disjoint i32 %259, %258
  %261 = bitcast i32 %260 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %263 = or disjoint i32 %256, 1024
  br label %264

264:                                              ; preds = %262, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %265 = phi i32 [ %263, %262 ], [ %256, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i ]
  %266 = uitofp i32 %265 to float
  %.not683.i = icmp eq i32 %255, 0
  %267 = add nsw i32 %255, -25
  %268 = select i1 %.not683.i, i32 -24, i32 %267
  %269 = call float @__ocml_ldexp_f32(float noundef %266, i32 noundef %268) #5
  %270 = fneg contract float %269
  %.not684685.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %271 = select contract i1 %.not684685.i, float %270, float %269
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %264, %257
  %272 = phi float [ %261, %257 ], [ %271, %264 ]
  %273 = zext i16 %.sroa.0198.0.copyload.i to i32
  %274 = lshr i32 %273, 10
  %275 = and i32 %274, 31
  %276 = and i32 %273, 1023
  switch i32 %275, label %282 [
    i32 31, label %277
    i32 0, label %284
  ]

277:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %278 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not697.i = icmp eq i32 %276, 0
  %279 = select i1 %.not697.i, i32 2139095040, i32 2143289344
  %280 = or disjoint i32 %279, %278
  %281 = bitcast i32 %280 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

282:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %283 = or disjoint i32 %276, 1024
  br label %284

284:                                              ; preds = %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %285 = phi i32 [ %283, %282 ], [ %276, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %286 = uitofp i32 %285 to float
  %.not686.i = icmp eq i32 %275, 0
  %287 = add nsw i32 %275, -25
  %288 = select i1 %.not686.i, i32 -24, i32 %287
  %289 = call float @__ocml_ldexp_f32(float noundef %286, i32 noundef %288) #5
  %290 = fneg contract float %289
  %.not687688.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %291 = select contract i1 %.not687688.i, float %290, float %289
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i: ; preds = %284, %277
  %292 = phi float [ %281, %277 ], [ %291, %284 ]
  %293 = fmul contract float %272, %292
  %294 = fadd contract float %244, %293
  %295 = or disjoint i64 %144, 3
  %296 = add nuw nsw i64 %295, %124
  %297 = trunc i64 %296 to i32
  %298 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %120, i32 %297
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %298, align 2, !tbaa.struct !23
  %299 = shl nuw nsw i64 %295, 4
  %300 = or disjoint i64 %299, %122
  %301 = trunc i64 %300 to i32
  %302 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %121, i32 %301
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %302, align 2, !tbaa.struct !23
  %303 = zext i16 %.sroa.0189.0.copyload.i to i32
  %304 = lshr i32 %303, 10
  %305 = and i32 %304, 31
  %306 = and i32 %303, 1023
  switch i32 %305, label %312 [
    i32 31, label %307
    i32 0, label %314
  ]

307:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %308 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %306, 0
  %309 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %310 = or disjoint i32 %309, %308
  %311 = bitcast i32 %310 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

312:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %313 = or disjoint i32 %306, 1024
  br label %314

314:                                              ; preds = %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %315 = phi i32 [ %313, %312 ], [ %306, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i ]
  %316 = uitofp i32 %315 to float
  %.not689.i = icmp eq i32 %305, 0
  %317 = add nsw i32 %305, -25
  %318 = select i1 %.not689.i, i32 -24, i32 %317
  %319 = call float @__ocml_ldexp_f32(float noundef %316, i32 noundef %318) #5
  %320 = fneg contract float %319
  %.not690691.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %321 = select contract i1 %.not690691.i, float %320, float %319
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %314, %307
  %322 = phi float [ %311, %307 ], [ %321, %314 ]
  %323 = zext i16 %.sroa.0180.0.copyload.i to i32
  %324 = lshr i32 %323, 10
  %325 = and i32 %324, 31
  %326 = and i32 %323, 1023
  switch i32 %325, label %332 [
    i32 31, label %327
    i32 0, label %334
  ]

327:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %328 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %326, 0
  %329 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %330 = or disjoint i32 %329, %328
  %331 = bitcast i32 %330 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

332:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %333 = or disjoint i32 %326, 1024
  br label %334

334:                                              ; preds = %332, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %335 = phi i32 [ %333, %332 ], [ %326, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %336 = uitofp i32 %335 to float
  %.not692.i = icmp eq i32 %325, 0
  %337 = add nsw i32 %325, -25
  %338 = select i1 %.not692.i, i32 -24, i32 %337
  %339 = call float @__ocml_ldexp_f32(float noundef %336, i32 noundef %338) #5
  %340 = fneg contract float %339
  %.not693694.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %341 = select contract i1 %.not693694.i, float %340, float %339
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %334, %327
  %342 = phi float [ %331, %327 ], [ %341, %334 ]
  %343 = fmul contract float %322, %342
  %344 = fadd contract float %294, %343
  %345 = add nuw nsw i64 %144, 4
  %346 = icmp ult i64 %144, 28
  br i1 %346, label %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !35

347:                                              ; preds = %._crit_edge724.i
  %348 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %349 = icmp eq i64 %348, 0
  call void @llvm.assume(i1 %349)
  %350 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %351 = icmp eq i64 %350, 0
  call void @llvm.assume(i1 %351)
  %352 = sext i32 %3 to i64
  %353 = call i32 @llvm.amdgcn.groupstaticsize()
  %354 = inttoptr i32 %353 to ptr addrspace(3)
  %355 = icmp sgt i32 %4, 0
  %356 = icmp ugt i32 %4, 1
  %357 = icmp ugt i32 %4, 2
  %358 = icmp ugt i32 %4, 3
  %359 = icmp ugt i32 %4, 4
  %360 = icmp ugt i32 %4, 5
  %361 = icmp ugt i32 %4, 6
  %362 = icmp ugt i32 %4, 7
  %363 = icmp ugt i32 %4, 8
  %364 = icmp ugt i32 %4, 9
  %365 = icmp ugt i32 %4, 10
  %366 = icmp ugt i32 %4, 11
  %367 = icmp ugt i32 %4, 12
  %368 = icmp ugt i32 %4, 13
  %369 = icmp ugt i32 %4, 14
  %370 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %347
  %371 = phi i64 [ 0, %347 ], [ %377, %.split.us.i ]
  %372 = icmp slt i64 %371, %352
  %373 = shl i64 %371, 4
  %.tr671.i = trunc i64 %371 to i32
  %374 = shl i32 %.tr671.i, 4
  %375 = sext i32 %374 to i64
  %376 = add nsw i64 %136, %375
  %.fr.i = freeze i1 %372
  %brmerge.not.i = select i1 %.fr.i, i1 %355, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %466, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %377 = add nuw nsw i64 %371, 1
  %exitcond.not.i = icmp eq i64 %377, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %378 = trunc i64 %373 to i32
  %379 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !33
  %381 = getelementptr inbounds float, ptr %8, i64 %376
  store float %380, ptr %381, align 32, !tbaa !33
  br i1 %356, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %382 = trunc i64 %373 to i32
  %383 = or disjoint i32 %382, 1
  %384 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %383
  %385 = load float, ptr addrspace(3) %384, align 4, !tbaa !33
  %386 = or disjoint i64 %376, 1
  %387 = getelementptr inbounds float, ptr %8, i64 %386
  store float %385, ptr %387, align 4, !tbaa !33
  br i1 %357, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %388 = trunc i64 %373 to i32
  %389 = or disjoint i32 %388, 2
  %390 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !33
  %392 = or disjoint i64 %376, 2
  %393 = getelementptr inbounds float, ptr %8, i64 %392
  store float %391, ptr %393, align 8, !tbaa !33
  br i1 %358, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %394 = trunc i64 %373 to i32
  %395 = or disjoint i32 %394, 3
  %396 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !33
  %398 = or disjoint i64 %376, 3
  %399 = getelementptr inbounds float, ptr %8, i64 %398
  store float %397, ptr %399, align 4, !tbaa !33
  br i1 %359, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %400 = trunc i64 %373 to i32
  %401 = or disjoint i32 %400, 4
  %402 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !33
  %404 = or disjoint i64 %376, 4
  %405 = getelementptr inbounds float, ptr %8, i64 %404
  store float %403, ptr %405, align 16, !tbaa !33
  br i1 %360, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %406 = trunc i64 %373 to i32
  %407 = or disjoint i32 %406, 5
  %408 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !33
  %410 = or disjoint i64 %376, 5
  %411 = getelementptr inbounds float, ptr %8, i64 %410
  store float %409, ptr %411, align 4, !tbaa !33
  br i1 %361, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %412 = trunc i64 %373 to i32
  %413 = or disjoint i32 %412, 6
  %414 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !33
  %416 = or disjoint i64 %376, 6
  %417 = getelementptr inbounds float, ptr %8, i64 %416
  store float %415, ptr %417, align 8, !tbaa !33
  br i1 %362, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %418 = trunc i64 %373 to i32
  %419 = or disjoint i32 %418, 7
  %420 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !33
  %422 = or disjoint i64 %376, 7
  %423 = getelementptr inbounds float, ptr %8, i64 %422
  store float %421, ptr %423, align 4, !tbaa !33
  br i1 %363, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %424 = trunc i64 %373 to i32
  %425 = or disjoint i32 %424, 8
  %426 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !33
  %428 = or disjoint i64 %376, 8
  %429 = getelementptr inbounds float, ptr %8, i64 %428
  store float %427, ptr %429, align 32, !tbaa !33
  br i1 %364, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %430 = trunc i64 %373 to i32
  %431 = or disjoint i32 %430, 9
  %432 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %431
  %433 = load float, ptr addrspace(3) %432, align 4, !tbaa !33
  %434 = or disjoint i64 %376, 9
  %435 = getelementptr inbounds float, ptr %8, i64 %434
  store float %433, ptr %435, align 4, !tbaa !33
  br i1 %365, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %436 = trunc i64 %373 to i32
  %437 = or disjoint i32 %436, 10
  %438 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %437
  %439 = load float, ptr addrspace(3) %438, align 4, !tbaa !33
  %440 = or disjoint i64 %376, 10
  %441 = getelementptr inbounds float, ptr %8, i64 %440
  store float %439, ptr %441, align 8, !tbaa !33
  br i1 %366, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %442 = trunc i64 %373 to i32
  %443 = or disjoint i32 %442, 11
  %444 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %443
  %445 = load float, ptr addrspace(3) %444, align 4, !tbaa !33
  %446 = or disjoint i64 %376, 11
  %447 = getelementptr inbounds float, ptr %8, i64 %446
  store float %445, ptr %447, align 4, !tbaa !33
  br i1 %367, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %448 = trunc i64 %373 to i32
  %449 = or disjoint i32 %448, 12
  %450 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !33
  %452 = or disjoint i64 %376, 12
  %453 = getelementptr inbounds float, ptr %8, i64 %452
  store float %451, ptr %453, align 16, !tbaa !33
  br i1 %368, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %454 = trunc i64 %373 to i32
  %455 = or disjoint i32 %454, 13
  %456 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !33
  %458 = or disjoint i64 %376, 13
  %459 = getelementptr inbounds float, ptr %8, i64 %458
  store float %457, ptr %459, align 4, !tbaa !33
  br i1 %369, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %460 = trunc i64 %373 to i32
  %461 = or disjoint i32 %460, 14
  %462 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !33
  %464 = or disjoint i64 %376, 14
  %465 = getelementptr inbounds float, ptr %8, i64 %464
  store float %463, ptr %465, align 8, !tbaa !33
  br i1 %370, label %466, label %.split.us.i

466:                                              ; preds = %.preheader.split.15.i
  %467 = trunc i64 %373 to i32
  %468 = or disjoint i32 %467, 15
  %469 = getelementptr inbounds float, ptr addrspace(3) %354, i32 %468
  %470 = load float, ptr addrspace(3) %469, align 4, !tbaa !33
  %471 = or disjoint i64 %376, 15
  %472 = getelementptr inbounds float, ptr %8, i64 %471
  store float %470, ptr %472, align 4, !tbaa !33
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge724.i, %.split.us.i
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
!10 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
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
;----------------- End AdaptiveCpp IR dump ---------------
