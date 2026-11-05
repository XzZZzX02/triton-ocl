;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-svp25oji/kernel.cpp"
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
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #4 {
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 8388608
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %33 = icmp ult i64 %32, 256
  call void @llvm.assume(i1 %33)
  %34 = icmp ult i64 %32, 128
  br i1 %34, label %.lr.ph.i, label %.lr.ph768.i

.lr.ph.i:                                         ; preds = %6
  %35 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %36 = inttoptr i32 %35 to ptr addrspace(3)
  %37 = trunc i64 %32 to i32
  %38 = getelementptr inbounds float, ptr addrspace(3) %36, i32 %37
  store float 0.000000e+00, ptr addrspace(3) %38, align 4, !tbaa !23
  br label %.lr.ph768.i

.lr.ph768.i:                                      ; preds = %.lr.ph.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %40 = icmp ult i64 %39, 8388607
  call void @llvm.assume(i1 %40)
  %41 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %42 = icmp eq i64 %41, 0
  call void @llvm.assume(i1 %42)
  %43 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %44 = icmp eq i64 %43, 0
  call void @llvm.assume(i1 %44)
  %45 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %46 = icmp ult i64 %45, 256
  call void @llvm.assume(i1 %46)
  %47 = sext i32 %5 to i64
  %48 = sext i32 %3 to i64
  %49 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %50 = inttoptr i32 %49 to ptr addrspace(3)
  %51 = getelementptr inbounds i8, ptr addrspace(3) %50, i32 512
  %52 = and i64 %45, 7
  %53 = lshr i64 %45, 3
  %54 = icmp slt i64 %53, %47
  %55 = icmp slt i64 %52, %48
  %56 = and i1 %54, %55
  br i1 %56, label %57, label %.lr.ph774.i

57:                                               ; preds = %.lr.ph768.i
  %58 = shl nuw nsw i64 %39, 8
  %59 = and i64 %45, 248
  %60 = or disjoint i64 %59, %58
  %61 = or disjoint i64 %60, %52
  %62 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %61
  %.sroa.0331.0.copyload.i = load i16, ptr %62, align 2, !tbaa.struct !27
  br label %.lr.ph774.i

.lr.ph774.i:                                      ; preds = %57, %.lr.ph768.i
  %.sroa.0333.1.i = phi i16 [ %.sroa.0331.0.copyload.i, %57 ], [ 0, %.lr.ph768.i ]
  %63 = trunc i64 %45 to i32
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %63
  store i16 %.sroa.0333.1.i, ptr addrspace(3) %64, align 2, !tbaa.struct !27
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %66 = icmp eq i64 %65, 0
  call void @llvm.assume(i1 %66)
  %67 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %68 = icmp eq i64 %67, 0
  call void @llvm.assume(i1 %68)
  %69 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %70 = icmp ult i64 %69, 256
  call void @llvm.assume(i1 %70)
  %71 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %72 = inttoptr i32 %71 to ptr addrspace(3)
  %73 = getelementptr inbounds i8, ptr addrspace(3) %72, i32 512
  %74 = getelementptr inbounds i8, ptr addrspace(3) %72, i32 1024
  %75 = lshr i64 %69, 5
  %76 = shl nuw nsw i64 %69, 3
  %77 = and i64 %76, 248
  %78 = or disjoint i64 %77, %75
  %79 = trunc i64 %78 to i32
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %73, i32 %79
  %.sroa.0419.0.copyload.i = load i16, ptr addrspace(3) %80, align 2, !tbaa.struct !27
  %81 = trunc i64 %69 to i32
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %74, i32 %81
  store i16 %.sroa.0419.0.copyload.i, ptr addrspace(3) %82, align 2, !tbaa.struct !27
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %84 = icmp eq i64 %83, 0
  call void @llvm.assume(i1 %84)
  %85 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %86 = icmp eq i64 %85, 0
  call void @llvm.assume(i1 %86)
  %87 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %88 = icmp ult i64 %87, 256
  call void @llvm.assume(i1 %88)
  %.tr723.i = trunc i64 %39 to i32
  %89 = shl nuw i32 %.tr723.i, 9
  %90 = sext i32 %4 to i64
  %91 = sext i32 %5 to i64
  %92 = sext i32 %89 to i64
  %93 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %94 = inttoptr i32 %93 to ptr addrspace(3)
  %95 = getelementptr inbounds i8, ptr addrspace(3) %94, i32 1536
  %96 = and i64 %87, 31
  %97 = icmp slt i64 %96, %91
  br label %108

.lr.ph777.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %99 = icmp eq i64 %98, 0
  call void @llvm.assume(i1 %99)
  %100 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %101 = icmp eq i64 %100, 0
  call void @llvm.assume(i1 %101)
  %102 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %103 = icmp ult i64 %102, 256
  call void @llvm.assume(i1 %103)
  %104 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %105 = inttoptr i32 %104 to ptr addrspace(3)
  %106 = getelementptr inbounds i8, ptr addrspace(3) %105, i32 1536
  %107 = getelementptr inbounds i8, ptr addrspace(3) %105, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

108:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i, %.lr.ph774.i
  %109 = phi i64 [ %87, %.lr.ph774.i ], [ %120, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i ]
  %110 = lshr i64 %109, 5
  %111 = icmp slt i64 %110, %90
  %112 = and i1 %111, %97
  br i1 %112, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i

113:                                              ; preds = %108
  %114 = and i64 %109, 9223372036854775776
  %115 = or disjoint i64 %114, %92
  %116 = or disjoint i64 %115, %96
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %116
  %.sroa.0290.0.copyload.i = load i16, ptr %117, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i: ; preds = %113, %108
  %.sroa.0292.1.i = phi i16 [ %.sroa.0290.0.copyload.i, %113 ], [ 0, %108 ]
  %118 = trunc i64 %109 to i32
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %118
  store i16 %.sroa.0292.1.i, ptr addrspace(3) %119, align 2, !tbaa.struct !27
  %120 = add nuw nsw i64 %109, 256
  %121 = icmp ult i64 %109, 256
  br i1 %121, label %108, label %.lr.ph777.i, !llvm.loop !30

._crit_edge778.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %123 = icmp eq i64 %122, 0
  call void @llvm.assume(i1 %123)
  %124 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %125 = icmp eq i64 %124, 0
  call void @llvm.assume(i1 %125)
  %126 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %127 = icmp ult i64 %126, 256
  call void @llvm.assume(i1 %127)
  %128 = icmp ult i64 %126, 128
  br i1 %128, label %.lr.ph780.i, label %._crit_edge781.i

.lr.ph780.i:                                      ; preds = %._crit_edge778.i
  %129 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %130 = inttoptr i32 %129 to ptr addrspace(3)
  %131 = getelementptr inbounds i8, ptr addrspace(3) %130, i32 1024
  %132 = getelementptr inbounds i8, ptr addrspace(3) %130, i32 2560
  %133 = and i64 %126, 15
  %134 = trunc i64 %126 to i32
  %135 = getelementptr inbounds float, ptr addrspace(3) %130, i32 %134
  %136 = load float, ptr addrspace(3) %135, align 4, !tbaa !23
  %137 = shl nuw nsw i64 %126, 1
  %138 = and i64 %137, 224
  br label %154

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph777.i
  %139 = phi i64 [ %102, %.lr.ph777.i ], [ %148, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %140 = lshr i64 %139, 4
  %141 = shl nuw nsw i64 %139, 5
  %142 = and i64 %141, 480
  %143 = or disjoint i64 %142, %140
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %106, i32 %144
  %.sroa.0418.0.copyload.i = load i16, ptr addrspace(3) %145, align 2, !tbaa.struct !27
  %146 = trunc i64 %139 to i32
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %107, i32 %146
  store i16 %.sroa.0418.0.copyload.i, ptr addrspace(3) %147, align 2, !tbaa.struct !27
  %148 = add nuw nsw i64 %139, 256
  %149 = icmp ult i64 %139, 256
  br i1 %149, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %._crit_edge778.i, !llvm.loop !34

._crit_edge781.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge778.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %152 = icmp ult i64 %151, 256
  call void @llvm.assume(i1 %152)
  %153 = icmp eq i64 %151, 0
  br i1 %153, label %358, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %355, ptr addrspace(3) %135, align 4, !tbaa !23
  br label %._crit_edge781.i

154:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph780.i
  %155 = phi i64 [ 0, %.lr.ph780.i ], [ %356, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %156 = phi float [ %136, %.lr.ph780.i ], [ %355, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %157 = add nuw nsw i64 %155, %138
  %158 = trunc i64 %157 to i32
  %159 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %131, i32 %158
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %159, align 2, !tbaa.struct !27
  %160 = shl nuw nsw i64 %155, 4
  %161 = or disjoint i64 %160, %133
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %162
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %163, align 2, !tbaa.struct !27
  %164 = zext i16 %.sroa.0243.0.copyload.i to i32
  %165 = lshr i32 %164, 10
  %166 = and i32 %165, 31
  %167 = and i32 %164, 1023
  switch i32 %166, label %173 [
    i32 31, label %168
    i32 0, label %175
  ]

168:                                              ; preds = %154
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %169 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not756.i = icmp eq i32 %167, 0
  %170 = select i1 %.not756.i, i32 2139095040, i32 2143289344
  %171 = or disjoint i32 %170, %169
  %172 = bitcast i32 %171 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i

173:                                              ; preds = %154
  %174 = or disjoint i32 %167, 1024
  br label %175

175:                                              ; preds = %173, %154
  %176 = phi i32 [ %174, %173 ], [ %167, %154 ]
  %177 = uitofp i32 %176 to float
  %.not.i = icmp eq i32 %166, 0
  %178 = add nsw i32 %166, -25
  %179 = select i1 %.not.i, i32 -24, i32 %178
  %180 = call float @__ocml_ldexp_f32(float noundef %177, i32 noundef %179) #5
  %181 = fneg contract float %180
  %.not726727.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %182 = select contract i1 %.not726727.i, float %181, float %180
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i: ; preds = %175, %168
  %183 = phi float [ %172, %168 ], [ %182, %175 ]
  %184 = zext i16 %.sroa.0234.0.copyload.i to i32
  %185 = lshr i32 %184, 10
  %186 = and i32 %185, 31
  %187 = and i32 %184, 1023
  switch i32 %186, label %193 [
    i32 31, label %188
    i32 0, label %195
  ]

188:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %189 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not755.i = icmp eq i32 %187, 0
  %190 = select i1 %.not755.i, i32 2139095040, i32 2143289344
  %191 = or disjoint i32 %190, %189
  %192 = bitcast i32 %191 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i

193:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i
  %194 = or disjoint i32 %187, 1024
  br label %195

195:                                              ; preds = %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i
  %196 = phi i32 [ %194, %193 ], [ %187, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i ]
  %197 = uitofp i32 %196 to float
  %.not728.i = icmp eq i32 %186, 0
  %198 = add nsw i32 %186, -25
  %199 = select i1 %.not728.i, i32 -24, i32 %198
  %200 = call float @__ocml_ldexp_f32(float noundef %197, i32 noundef %199) #5
  %201 = fneg contract float %200
  %.not729730.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %202 = select contract i1 %.not729730.i, float %201, float %200
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i: ; preds = %195, %188
  %203 = phi float [ %192, %188 ], [ %202, %195 ]
  %204 = fmul contract float %183, %203
  %205 = fadd contract float %156, %204
  %206 = or disjoint i64 %155, 1
  %207 = add nuw nsw i64 %206, %138
  %208 = trunc i64 %207 to i32
  %209 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %131, i32 %208
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %209, align 2, !tbaa.struct !27
  %210 = shl nuw nsw i64 %206, 4
  %211 = or disjoint i64 %210, %133
  %212 = trunc i64 %211 to i32
  %213 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %212
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %213, align 2, !tbaa.struct !27
  %214 = zext i16 %.sroa.0225.0.copyload.i to i32
  %215 = lshr i32 %214, 10
  %216 = and i32 %215, 31
  %217 = and i32 %214, 1023
  switch i32 %216, label %223 [
    i32 31, label %218
    i32 0, label %225
  ]

218:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %219 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not754.i = icmp eq i32 %217, 0
  %220 = select i1 %.not754.i, i32 2139095040, i32 2143289344
  %221 = or disjoint i32 %220, %219
  %222 = bitcast i32 %221 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

223:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i
  %224 = or disjoint i32 %217, 1024
  br label %225

225:                                              ; preds = %223, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i
  %226 = phi i32 [ %224, %223 ], [ %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i ]
  %227 = uitofp i32 %226 to float
  %.not731.i = icmp eq i32 %216, 0
  %228 = add nsw i32 %216, -25
  %229 = select i1 %.not731.i, i32 -24, i32 %228
  %230 = call float @__ocml_ldexp_f32(float noundef %227, i32 noundef %229) #5
  %231 = fneg contract float %230
  %.not732733.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %232 = select contract i1 %.not732733.i, float %231, float %230
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i: ; preds = %225, %218
  %233 = phi float [ %222, %218 ], [ %232, %225 ]
  %234 = zext i16 %.sroa.0216.0.copyload.i to i32
  %235 = lshr i32 %234, 10
  %236 = and i32 %235, 31
  %237 = and i32 %234, 1023
  switch i32 %236, label %243 [
    i32 31, label %238
    i32 0, label %245
  ]

238:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %239 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not753.i = icmp eq i32 %237, 0
  %240 = select i1 %.not753.i, i32 2139095040, i32 2143289344
  %241 = or disjoint i32 %240, %239
  %242 = bitcast i32 %241 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

243:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %244 = or disjoint i32 %237, 1024
  br label %245

245:                                              ; preds = %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %246 = phi i32 [ %244, %243 ], [ %237, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i ]
  %247 = uitofp i32 %246 to float
  %.not734.i = icmp eq i32 %236, 0
  %248 = add nsw i32 %236, -25
  %249 = select i1 %.not734.i, i32 -24, i32 %248
  %250 = call float @__ocml_ldexp_f32(float noundef %247, i32 noundef %249) #5
  %251 = fneg contract float %250
  %.not735736.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %252 = select contract i1 %.not735736.i, float %251, float %250
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i: ; preds = %245, %238
  %253 = phi float [ %242, %238 ], [ %252, %245 ]
  %254 = fmul contract float %233, %253
  %255 = fadd contract float %205, %254
  %256 = or disjoint i64 %155, 2
  %257 = add nuw nsw i64 %256, %138
  %258 = trunc i64 %257 to i32
  %259 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %131, i32 %258
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %259, align 2, !tbaa.struct !27
  %260 = shl nuw nsw i64 %256, 4
  %261 = or disjoint i64 %260, %133
  %262 = trunc i64 %261 to i32
  %263 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %262
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %263, align 2, !tbaa.struct !27
  %264 = zext i16 %.sroa.0207.0.copyload.i to i32
  %265 = lshr i32 %264, 10
  %266 = and i32 %265, 31
  %267 = and i32 %264, 1023
  switch i32 %266, label %273 [
    i32 31, label %268
    i32 0, label %275
  ]

268:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %269 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not752.i = icmp eq i32 %267, 0
  %270 = select i1 %.not752.i, i32 2139095040, i32 2143289344
  %271 = or disjoint i32 %270, %269
  %272 = bitcast i32 %271 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

273:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %274 = or disjoint i32 %267, 1024
  br label %275

275:                                              ; preds = %273, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %276 = phi i32 [ %274, %273 ], [ %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i ]
  %277 = uitofp i32 %276 to float
  %.not737.i = icmp eq i32 %266, 0
  %278 = add nsw i32 %266, -25
  %279 = select i1 %.not737.i, i32 -24, i32 %278
  %280 = call float @__ocml_ldexp_f32(float noundef %277, i32 noundef %279) #5
  %281 = fneg contract float %280
  %.not738739.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %282 = select contract i1 %.not738739.i, float %281, float %280
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i: ; preds = %275, %268
  %283 = phi float [ %272, %268 ], [ %282, %275 ]
  %284 = zext i16 %.sroa.0198.0.copyload.i to i32
  %285 = lshr i32 %284, 10
  %286 = and i32 %285, 31
  %287 = and i32 %284, 1023
  switch i32 %286, label %293 [
    i32 31, label %288
    i32 0, label %295
  ]

288:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %289 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not751.i = icmp eq i32 %287, 0
  %290 = select i1 %.not751.i, i32 2139095040, i32 2143289344
  %291 = or disjoint i32 %290, %289
  %292 = bitcast i32 %291 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

293:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %294 = or disjoint i32 %287, 1024
  br label %295

295:                                              ; preds = %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %296 = phi i32 [ %294, %293 ], [ %287, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i ]
  %297 = uitofp i32 %296 to float
  %.not740.i = icmp eq i32 %286, 0
  %298 = add nsw i32 %286, -25
  %299 = select i1 %.not740.i, i32 -24, i32 %298
  %300 = call float @__ocml_ldexp_f32(float noundef %297, i32 noundef %299) #5
  %301 = fneg contract float %300
  %.not741742.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %302 = select contract i1 %.not741742.i, float %301, float %300
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i: ; preds = %295, %288
  %303 = phi float [ %292, %288 ], [ %302, %295 ]
  %304 = fmul contract float %283, %303
  %305 = fadd contract float %255, %304
  %306 = or disjoint i64 %155, 3
  %307 = add nuw nsw i64 %306, %138
  %308 = trunc i64 %307 to i32
  %309 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %131, i32 %308
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %309, align 2, !tbaa.struct !27
  %310 = shl nuw nsw i64 %306, 4
  %311 = or disjoint i64 %310, %133
  %312 = trunc i64 %311 to i32
  %313 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %312
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %313, align 2, !tbaa.struct !27
  %314 = zext i16 %.sroa.0189.0.copyload.i to i32
  %315 = lshr i32 %314, 10
  %316 = and i32 %315, 31
  %317 = and i32 %314, 1023
  switch i32 %316, label %323 [
    i32 31, label %318
    i32 0, label %325
  ]

318:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %319 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not750.i = icmp eq i32 %317, 0
  %320 = select i1 %.not750.i, i32 2139095040, i32 2143289344
  %321 = or disjoint i32 %320, %319
  %322 = bitcast i32 %321 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

323:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %324 = or disjoint i32 %317, 1024
  br label %325

325:                                              ; preds = %323, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %326 = phi i32 [ %324, %323 ], [ %317, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i ]
  %327 = uitofp i32 %326 to float
  %.not743.i = icmp eq i32 %316, 0
  %328 = add nsw i32 %316, -25
  %329 = select i1 %.not743.i, i32 -24, i32 %328
  %330 = call float @__ocml_ldexp_f32(float noundef %327, i32 noundef %329) #5
  %331 = fneg contract float %330
  %.not744745.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %332 = select contract i1 %.not744745.i, float %331, float %330
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %325, %318
  %333 = phi float [ %322, %318 ], [ %332, %325 ]
  %334 = zext i16 %.sroa.0180.0.copyload.i to i32
  %335 = lshr i32 %334, 10
  %336 = and i32 %335, 31
  %337 = and i32 %334, 1023
  switch i32 %336, label %343 [
    i32 31, label %338
    i32 0, label %345
  ]

338:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %339 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not749.i = icmp eq i32 %337, 0
  %340 = select i1 %.not749.i, i32 2139095040, i32 2143289344
  %341 = or disjoint i32 %340, %339
  %342 = bitcast i32 %341 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

343:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %344 = or disjoint i32 %337, 1024
  br label %345

345:                                              ; preds = %343, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %346 = phi i32 [ %344, %343 ], [ %337, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %347 = uitofp i32 %346 to float
  %.not746.i = icmp eq i32 %336, 0
  %348 = add nsw i32 %336, -25
  %349 = select i1 %.not746.i, i32 -24, i32 %348
  %350 = call float @__ocml_ldexp_f32(float noundef %347, i32 noundef %349) #5
  %351 = fneg contract float %350
  %.not747748.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %352 = select contract i1 %.not747748.i, float %351, float %350
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %345, %338
  %353 = phi float [ %342, %338 ], [ %352, %345 ]
  %354 = fmul contract float %333, %353
  %355 = fadd contract float %305, %354
  %356 = add nuw nsw i64 %155, 4
  %357 = icmp ult i64 %155, 28
  br i1 %357, label %154, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !35

358:                                              ; preds = %._crit_edge781.i
  %359 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %360 = icmp eq i64 %359, 0
  call void @llvm.assume(i1 %360)
  %361 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %362 = icmp eq i64 %361, 0
  call void @llvm.assume(i1 %362)
  %363 = sext i32 %3 to i64
  %364 = call i32 @llvm.amdgcn.groupstaticsize()
  %365 = inttoptr i32 %364 to ptr addrspace(3)
  %366 = icmp sgt i32 %4, 0
  %367 = icmp ugt i32 %4, 1
  %368 = icmp ugt i32 %4, 2
  %369 = icmp ugt i32 %4, 3
  %370 = icmp ugt i32 %4, 4
  %371 = icmp ugt i32 %4, 5
  %372 = icmp ugt i32 %4, 6
  %373 = icmp ugt i32 %4, 7
  %374 = icmp ugt i32 %4, 8
  %375 = icmp ugt i32 %4, 9
  %376 = icmp ugt i32 %4, 10
  %377 = icmp ugt i32 %4, 11
  %378 = icmp ugt i32 %4, 12
  %379 = icmp ugt i32 %4, 13
  %380 = icmp ugt i32 %4, 14
  %381 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %358
  %382 = phi i64 [ 0, %358 ], [ %388, %.split.us.i ]
  %383 = icmp slt i64 %382, %363
  %384 = shl i64 %382, 4
  %.tr725.i = trunc i64 %382 to i32
  %385 = shl i32 %.tr725.i, 4
  %386 = sext i32 %385 to i64
  %387 = add nsw i64 %150, %386
  %.fr.i = freeze i1 %383
  %brmerge.not.i = select i1 %.fr.i, i1 %366, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %477, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %388 = add nuw nsw i64 %382, 1
  %exitcond.not.i = icmp eq i64 %388, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %389 = trunc i64 %384 to i32
  %390 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !23
  %392 = getelementptr inbounds float, ptr %9, i64 %387
  store float %391, ptr %392, align 32, !tbaa !23
  br i1 %367, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %393 = trunc i64 %384 to i32
  %394 = or disjoint i32 %393, 1
  %395 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %394
  %396 = load float, ptr addrspace(3) %395, align 4, !tbaa !23
  %397 = or disjoint i64 %387, 1
  %398 = getelementptr inbounds float, ptr %9, i64 %397
  store float %396, ptr %398, align 4, !tbaa !23
  br i1 %368, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %399 = trunc i64 %384 to i32
  %400 = or disjoint i32 %399, 2
  %401 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %400
  %402 = load float, ptr addrspace(3) %401, align 4, !tbaa !23
  %403 = or disjoint i64 %387, 2
  %404 = getelementptr inbounds float, ptr %9, i64 %403
  store float %402, ptr %404, align 8, !tbaa !23
  br i1 %369, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %405 = trunc i64 %384 to i32
  %406 = or disjoint i32 %405, 3
  %407 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %406
  %408 = load float, ptr addrspace(3) %407, align 4, !tbaa !23
  %409 = or disjoint i64 %387, 3
  %410 = getelementptr inbounds float, ptr %9, i64 %409
  store float %408, ptr %410, align 4, !tbaa !23
  br i1 %370, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %411 = trunc i64 %384 to i32
  %412 = or disjoint i32 %411, 4
  %413 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %412
  %414 = load float, ptr addrspace(3) %413, align 4, !tbaa !23
  %415 = or disjoint i64 %387, 4
  %416 = getelementptr inbounds float, ptr %9, i64 %415
  store float %414, ptr %416, align 16, !tbaa !23
  br i1 %371, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %417 = trunc i64 %384 to i32
  %418 = or disjoint i32 %417, 5
  %419 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %418
  %420 = load float, ptr addrspace(3) %419, align 4, !tbaa !23
  %421 = or disjoint i64 %387, 5
  %422 = getelementptr inbounds float, ptr %9, i64 %421
  store float %420, ptr %422, align 4, !tbaa !23
  br i1 %372, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %423 = trunc i64 %384 to i32
  %424 = or disjoint i32 %423, 6
  %425 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !23
  %427 = or disjoint i64 %387, 6
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 8, !tbaa !23
  br i1 %373, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %429 = trunc i64 %384 to i32
  %430 = or disjoint i32 %429, 7
  %431 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !23
  %433 = or disjoint i64 %387, 7
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 4, !tbaa !23
  br i1 %374, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %435 = trunc i64 %384 to i32
  %436 = or disjoint i32 %435, 8
  %437 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !23
  %439 = or disjoint i64 %387, 8
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 32, !tbaa !23
  br i1 %375, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %441 = trunc i64 %384 to i32
  %442 = or disjoint i32 %441, 9
  %443 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !23
  %445 = or disjoint i64 %387, 9
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 4, !tbaa !23
  br i1 %376, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %447 = trunc i64 %384 to i32
  %448 = or disjoint i32 %447, 10
  %449 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !23
  %451 = or disjoint i64 %387, 10
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 8, !tbaa !23
  br i1 %377, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %453 = trunc i64 %384 to i32
  %454 = or disjoint i32 %453, 11
  %455 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !23
  %457 = or disjoint i64 %387, 11
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 4, !tbaa !23
  br i1 %378, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %459 = trunc i64 %384 to i32
  %460 = or disjoint i32 %459, 12
  %461 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !23
  %463 = or disjoint i64 %387, 12
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 16, !tbaa !23
  br i1 %379, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %465 = trunc i64 %384 to i32
  %466 = or disjoint i32 %465, 13
  %467 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !23
  %469 = or disjoint i64 %387, 13
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 4, !tbaa !23
  br i1 %380, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %471 = trunc i64 %384 to i32
  %472 = or disjoint i32 %471, 14
  %473 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !23
  %475 = or disjoint i64 %387, 14
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 8, !tbaa !23
  br i1 %381, label %477, label %.split.us.i

477:                                              ; preds = %.preheader.split.15.i
  %478 = trunc i64 %384 to i32
  %479 = or disjoint i32 %478, 15
  %480 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %479
  %481 = load float, ptr addrspace(3) %480, align 4, !tbaa !23
  %482 = or disjoint i64 %387, 15
  %483 = getelementptr inbounds float, ptr %9, i64 %482
  store float %481, ptr %483, align 4, !tbaa !23
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge781.i, %.split.us.i
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
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !{i64 0, i64 2, !28}
!28 = !{!29, !29, i64 0}
!29 = !{!"short", !25, i64 0}
!30 = distinct !{!30, !31, !32, !33}
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!"llvm.loop.vectorize.width", i32 1}
!33 = !{!"llvm.loop.interleave.count", i32 1}
!34 = distinct !{!34, !31, !32, !33}
!35 = distinct !{!35, !31}
!36 = distinct !{!36, !31}
;----------------- End AdaptiveCpp IR dump ---------------
