;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-3bax7erd/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
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
  %36 = shl i32 %.tr.i, 10
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 7
  %44 = icmp slt i64 %43, %38
  br label %55

.lr.ph640.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %48 = icmp eq i64 %47, 0
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %50 = icmp ult i64 %49, 128
  call void @llvm.assume(i1 %50)
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 512
  %54 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0295.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %60, %55
  %.sroa.0297.1.i = phi i16 [ %.sroa.0295.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0297.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  %67 = add nuw nsw i64 %56, 128
  %68 = icmp ult i64 %56, 896
  br i1 %68, label %55, label %.lr.ph640.i, !llvm.loop !28

.lr.ph643.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %70 = icmp eq i64 %69, 0
  call void @llvm.assume(i1 %70)
  %71 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %72 = icmp eq i64 %71, 0
  call void @llvm.assume(i1 %72)
  %73 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %74 = icmp ult i64 %73, 128
  call void @llvm.assume(i1 %74)
  %75 = shl i32 %.tr.i, 11
  %76 = sext i32 %5 to i64
  %77 = sext i32 %4 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 4608
  %82 = and i64 %73, 15
  %83 = icmp slt i64 %82, %77
  br label %108

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i.i, %.lr.ph640.i
  %84 = phi i64 [ %49, %.lr.ph640.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i.i ]
  %85 = lshr i64 %84, 7
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 1016
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0348.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !23
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0348.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  %93 = add nuw nsw i64 %84, 128
  %94 = icmp ult i64 %84, 896
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i.i, label %.lr.ph643.i, !llvm.loop !32

.lr.ph646.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %96 = icmp eq i64 %95, 0
  call void @llvm.assume(i1 %96)
  %97 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %98 = icmp eq i64 %97, 0
  call void @llvm.assume(i1 %98)
  %99 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %100 = icmp ult i64 %99, 128
  call void @llvm.assume(i1 %100)
  %101 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %102 = inttoptr i32 %101 to ptr addrspace(3)
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 2560
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 4608
  %105 = and i64 %99, 15
  %106 = shl nuw nsw i64 %99, 3
  %107 = and i64 %106, 896
  br label %128

108:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i, %.lr.ph643.i
  %109 = phi i64 [ %73, %.lr.ph643.i ], [ %120, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i ]
  %110 = lshr i64 %109, 4
  %111 = icmp slt i64 %110, %76
  %112 = and i1 %111, %83
  br i1 %112, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i

113:                                              ; preds = %108
  %114 = and i64 %109, 9223372036854775792
  %115 = or disjoint i64 %114, %78
  %116 = or disjoint i64 %115, %82
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %116
  %.sroa.0254.0.copyload.i = load i16, ptr %117, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i: ; preds = %113, %108
  %.sroa.0256.1.i = phi i16 [ %.sroa.0254.0.copyload.i, %113 ], [ 0, %108 ]
  %118 = trunc i64 %109 to i32
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %118
  store i16 %.sroa.0256.1.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
  %120 = add nuw nsw i64 %109, 128
  %121 = icmp ult i64 %109, 1920
  br i1 %121, label %108, label %.lr.ph646.i, !llvm.loop !33

._crit_edge647.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %122 = trunc i64 %99 to i32
  %123 = getelementptr inbounds float, ptr addrspace(3) %102, i32 %122
  store float %329, ptr addrspace(3) %123, align 4, !tbaa !34
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %125 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %126 = icmp ult i64 %125, 128
  call void @llvm.assume(i1 %126)
  %127 = icmp eq i64 %125, 0
  br i1 %127, label %332, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

128:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph646.i
  %129 = phi i64 [ 0, %.lr.ph646.i ], [ %330, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %130 = phi float [ 0.000000e+00, %.lr.ph646.i ], [ %329, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %131 = add nuw nsw i64 %129, %107
  %132 = trunc i64 %131 to i32
  %133 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %132
  %.sroa.0239.0.copyload.i = load i16, ptr addrspace(3) %133, align 2, !tbaa.struct !23
  %134 = shl nuw nsw i64 %129, 4
  %135 = or disjoint i64 %134, %105
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %136
  %.sroa.0230.0.copyload.i = load i16, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  %138 = zext i16 %.sroa.0239.0.copyload.i to i32
  %139 = lshr i32 %138, 10
  %140 = and i32 %139, 31
  %141 = and i32 %138, 1023
  switch i32 %140, label %147 [
    i32 31, label %142
    i32 0, label %149
  ]

142:                                              ; preds = %128
  %.sroa.0239.0.copyload.signext.i = sext i16 %.sroa.0239.0.copyload.i to i32
  %143 = and i32 %.sroa.0239.0.copyload.signext.i, -2147483648
  %.not628.i = icmp eq i32 %141, 0
  %144 = select i1 %.not628.i, i32 2139095040, i32 2143289344
  %145 = or disjoint i32 %144, %143
  %146 = bitcast i32 %145 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

147:                                              ; preds = %128
  %148 = or disjoint i32 %141, 1024
  br label %149

149:                                              ; preds = %147, %128
  %150 = phi i32 [ %148, %147 ], [ %141, %128 ]
  %151 = uitofp i32 %150 to float
  %.not.i = icmp eq i32 %140, 0
  %152 = add nsw i32 %140, -25
  %153 = select i1 %.not.i, i32 -24, i32 %152
  %154 = call float @__ocml_ldexp_f32(float noundef %151, i32 noundef %153) #5
  %155 = fneg contract float %154
  %.not598599.i = icmp slt i16 %.sroa.0239.0.copyload.i, 0
  %156 = select contract i1 %.not598599.i, float %155, float %154
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %149, %142
  %157 = phi float [ %146, %142 ], [ %156, %149 ]
  %158 = zext i16 %.sroa.0230.0.copyload.i to i32
  %159 = lshr i32 %158, 10
  %160 = and i32 %159, 31
  %161 = and i32 %158, 1023
  switch i32 %160, label %167 [
    i32 31, label %162
    i32 0, label %169
  ]

162:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0230.0.copyload.signext.i = sext i16 %.sroa.0230.0.copyload.i to i32
  %163 = and i32 %.sroa.0230.0.copyload.signext.i, -2147483648
  %.not627.i = icmp eq i32 %161, 0
  %164 = select i1 %.not627.i, i32 2139095040, i32 2143289344
  %165 = or disjoint i32 %164, %163
  %166 = bitcast i32 %165 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

167:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %168 = or disjoint i32 %161, 1024
  br label %169

169:                                              ; preds = %167, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %170 = phi i32 [ %168, %167 ], [ %161, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %171 = uitofp i32 %170 to float
  %.not600.i = icmp eq i32 %160, 0
  %172 = add nsw i32 %160, -25
  %173 = select i1 %.not600.i, i32 -24, i32 %172
  %174 = call float @__ocml_ldexp_f32(float noundef %171, i32 noundef %173) #5
  %175 = fneg contract float %174
  %.not601602.i = icmp slt i16 %.sroa.0230.0.copyload.i, 0
  %176 = select contract i1 %.not601602.i, float %175, float %174
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i: ; preds = %169, %162
  %177 = phi float [ %166, %162 ], [ %176, %169 ]
  %178 = fmul contract float %157, %177
  %179 = fadd contract float %130, %178
  %180 = or disjoint i64 %129, 1
  %181 = add nuw nsw i64 %180, %107
  %182 = trunc i64 %181 to i32
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %182
  %.sroa.0221.0.copyload.i = load i16, ptr addrspace(3) %183, align 2, !tbaa.struct !23
  %184 = shl nuw nsw i64 %180, 4
  %185 = or disjoint i64 %184, %105
  %186 = trunc i64 %185 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %186
  %.sroa.0212.0.copyload.i = load i16, ptr addrspace(3) %187, align 2, !tbaa.struct !23
  %188 = zext i16 %.sroa.0221.0.copyload.i to i32
  %189 = lshr i32 %188, 10
  %190 = and i32 %189, 31
  %191 = and i32 %188, 1023
  switch i32 %190, label %197 [
    i32 31, label %192
    i32 0, label %199
  ]

192:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %.sroa.0221.0.copyload.signext.i = sext i16 %.sroa.0221.0.copyload.i to i32
  %193 = and i32 %.sroa.0221.0.copyload.signext.i, -2147483648
  %.not626.i = icmp eq i32 %191, 0
  %194 = select i1 %.not626.i, i32 2139095040, i32 2143289344
  %195 = or disjoint i32 %194, %193
  %196 = bitcast i32 %195 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

197:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %198 = or disjoint i32 %191, 1024
  br label %199

199:                                              ; preds = %197, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %200 = phi i32 [ %198, %197 ], [ %191, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i ]
  %201 = uitofp i32 %200 to float
  %.not603.i = icmp eq i32 %190, 0
  %202 = add nsw i32 %190, -25
  %203 = select i1 %.not603.i, i32 -24, i32 %202
  %204 = call float @__ocml_ldexp_f32(float noundef %201, i32 noundef %203) #5
  %205 = fneg contract float %204
  %.not604605.i = icmp slt i16 %.sroa.0221.0.copyload.i, 0
  %206 = select contract i1 %.not604605.i, float %205, float %204
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i: ; preds = %199, %192
  %207 = phi float [ %196, %192 ], [ %206, %199 ]
  %208 = zext i16 %.sroa.0212.0.copyload.i to i32
  %209 = lshr i32 %208, 10
  %210 = and i32 %209, 31
  %211 = and i32 %208, 1023
  switch i32 %210, label %217 [
    i32 31, label %212
    i32 0, label %219
  ]

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %.sroa.0212.0.copyload.signext.i = sext i16 %.sroa.0212.0.copyload.i to i32
  %213 = and i32 %.sroa.0212.0.copyload.signext.i, -2147483648
  %.not625.i = icmp eq i32 %211, 0
  %214 = select i1 %.not625.i, i32 2139095040, i32 2143289344
  %215 = or disjoint i32 %214, %213
  %216 = bitcast i32 %215 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %218 = or disjoint i32 %211, 1024
  br label %219

219:                                              ; preds = %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %220 = phi i32 [ %218, %217 ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i ]
  %221 = uitofp i32 %220 to float
  %.not606.i = icmp eq i32 %210, 0
  %222 = add nsw i32 %210, -25
  %223 = select i1 %.not606.i, i32 -24, i32 %222
  %224 = call float @__ocml_ldexp_f32(float noundef %221, i32 noundef %223) #5
  %225 = fneg contract float %224
  %.not607608.i = icmp slt i16 %.sroa.0212.0.copyload.i, 0
  %226 = select contract i1 %.not607608.i, float %225, float %224
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i: ; preds = %219, %212
  %227 = phi float [ %216, %212 ], [ %226, %219 ]
  %228 = fmul contract float %207, %227
  %229 = fadd contract float %179, %228
  %230 = or disjoint i64 %129, 2
  %231 = add nuw nsw i64 %230, %107
  %232 = trunc i64 %231 to i32
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %232
  %.sroa.0203.0.copyload.i = load i16, ptr addrspace(3) %233, align 2, !tbaa.struct !23
  %234 = shl nuw nsw i64 %230, 4
  %235 = or disjoint i64 %234, %105
  %236 = trunc i64 %235 to i32
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %236
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %237, align 2, !tbaa.struct !23
  %238 = zext i16 %.sroa.0203.0.copyload.i to i32
  %239 = lshr i32 %238, 10
  %240 = and i32 %239, 31
  %241 = and i32 %238, 1023
  switch i32 %240, label %247 [
    i32 31, label %242
    i32 0, label %249
  ]

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i
  %.sroa.0203.0.copyload.signext.i = sext i16 %.sroa.0203.0.copyload.i to i32
  %243 = and i32 %.sroa.0203.0.copyload.signext.i, -2147483648
  %.not624.i = icmp eq i32 %241, 0
  %244 = select i1 %.not624.i, i32 2139095040, i32 2143289344
  %245 = or disjoint i32 %244, %243
  %246 = bitcast i32 %245 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i

247:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i
  %248 = or disjoint i32 %241, 1024
  br label %249

249:                                              ; preds = %247, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i
  %250 = phi i32 [ %248, %247 ], [ %241, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i ]
  %251 = uitofp i32 %250 to float
  %.not609.i = icmp eq i32 %240, 0
  %252 = add nsw i32 %240, -25
  %253 = select i1 %.not609.i, i32 -24, i32 %252
  %254 = call float @__ocml_ldexp_f32(float noundef %251, i32 noundef %253) #5
  %255 = fneg contract float %254
  %.not610611.i = icmp slt i16 %.sroa.0203.0.copyload.i, 0
  %256 = select contract i1 %.not610611.i, float %255, float %254
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i: ; preds = %249, %242
  %257 = phi float [ %246, %242 ], [ %256, %249 ]
  %258 = zext i16 %.sroa.0194.0.copyload.i to i32
  %259 = lshr i32 %258, 10
  %260 = and i32 %259, 31
  %261 = and i32 %258, 1023
  switch i32 %260, label %267 [
    i32 31, label %262
    i32 0, label %269
  ]

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %263 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not623.i = icmp eq i32 %261, 0
  %264 = select i1 %.not623.i, i32 2139095040, i32 2143289344
  %265 = or disjoint i32 %264, %263
  %266 = bitcast i32 %265 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i
  %268 = or disjoint i32 %261, 1024
  br label %269

269:                                              ; preds = %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i
  %270 = phi i32 [ %268, %267 ], [ %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i ]
  %271 = uitofp i32 %270 to float
  %.not612.i = icmp eq i32 %260, 0
  %272 = add nsw i32 %260, -25
  %273 = select i1 %.not612.i, i32 -24, i32 %272
  %274 = call float @__ocml_ldexp_f32(float noundef %271, i32 noundef %273) #5
  %275 = fneg contract float %274
  %.not613614.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %276 = select contract i1 %.not613614.i, float %275, float %274
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i: ; preds = %269, %262
  %277 = phi float [ %266, %262 ], [ %276, %269 ]
  %278 = fmul contract float %257, %277
  %279 = fadd contract float %229, %278
  %280 = or disjoint i64 %129, 3
  %281 = add nuw nsw i64 %280, %107
  %282 = trunc i64 %281 to i32
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %282
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %283, align 2, !tbaa.struct !23
  %284 = shl nuw nsw i64 %280, 4
  %285 = or disjoint i64 %284, %105
  %286 = trunc i64 %285 to i32
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %286
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %287, align 2, !tbaa.struct !23
  %288 = zext i16 %.sroa.0185.0.copyload.i to i32
  %289 = lshr i32 %288, 10
  %290 = and i32 %289, 31
  %291 = and i32 %288, 1023
  switch i32 %290, label %297 [
    i32 31, label %292
    i32 0, label %299
  ]

292:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %293 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not622.i = icmp eq i32 %291, 0
  %294 = select i1 %.not622.i, i32 2139095040, i32 2143289344
  %295 = or disjoint i32 %294, %293
  %296 = bitcast i32 %295 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

297:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i
  %298 = or disjoint i32 %291, 1024
  br label %299

299:                                              ; preds = %297, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i
  %300 = phi i32 [ %298, %297 ], [ %291, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i ]
  %301 = uitofp i32 %300 to float
  %.not615.i = icmp eq i32 %290, 0
  %302 = add nsw i32 %290, -25
  %303 = select i1 %.not615.i, i32 -24, i32 %302
  %304 = call float @__ocml_ldexp_f32(float noundef %301, i32 noundef %303) #5
  %305 = fneg contract float %304
  %.not616617.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %306 = select contract i1 %.not616617.i, float %305, float %304
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %299, %292
  %307 = phi float [ %296, %292 ], [ %306, %299 ]
  %308 = zext i16 %.sroa.0176.0.copyload.i to i32
  %309 = lshr i32 %308, 10
  %310 = and i32 %309, 31
  %311 = and i32 %308, 1023
  switch i32 %310, label %317 [
    i32 31, label %312
    i32 0, label %319
  ]

312:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %313 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not621.i = icmp eq i32 %311, 0
  %314 = select i1 %.not621.i, i32 2139095040, i32 2143289344
  %315 = or disjoint i32 %314, %313
  %316 = bitcast i32 %315 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

317:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %318 = or disjoint i32 %311, 1024
  br label %319

319:                                              ; preds = %317, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %320 = phi i32 [ %318, %317 ], [ %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %321 = uitofp i32 %320 to float
  %.not618.i = icmp eq i32 %310, 0
  %322 = add nsw i32 %310, -25
  %323 = select i1 %.not618.i, i32 -24, i32 %322
  %324 = call float @__ocml_ldexp_f32(float noundef %321, i32 noundef %323) #5
  %325 = fneg contract float %324
  %.not619620.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %326 = select contract i1 %.not619620.i, float %325, float %324
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %319, %312
  %327 = phi float [ %316, %312 ], [ %326, %319 ]
  %328 = fmul contract float %307, %327
  %329 = fadd contract float %279, %328
  %330 = add nuw nsw i64 %129, 4
  %331 = icmp ult i64 %129, 124
  br i1 %331, label %128, label %._crit_edge647.i, !llvm.loop !36

332:                                              ; preds = %._crit_edge647.i
  %333 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %334 = icmp eq i64 %333, 0
  call void @llvm.assume(i1 %334)
  %335 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %336 = icmp eq i64 %335, 0
  call void @llvm.assume(i1 %336)
  %337 = sext i32 %3 to i64
  %338 = call i32 @llvm.amdgcn.groupstaticsize()
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = icmp sgt i32 %4, 0
  %341 = icmp ugt i32 %4, 1
  %342 = icmp ugt i32 %4, 2
  %343 = icmp ugt i32 %4, 3
  %344 = icmp ugt i32 %4, 4
  %345 = icmp ugt i32 %4, 5
  %346 = icmp ugt i32 %4, 6
  %347 = icmp ugt i32 %4, 7
  %348 = icmp ugt i32 %4, 8
  %349 = icmp ugt i32 %4, 9
  %350 = icmp ugt i32 %4, 10
  %351 = icmp ugt i32 %4, 11
  %352 = icmp ugt i32 %4, 12
  %353 = icmp ugt i32 %4, 13
  %354 = icmp ugt i32 %4, 14
  %355 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %332
  %356 = phi i64 [ 0, %332 ], [ %362, %.split.us.i ]
  %357 = icmp slt i64 %356, %337
  %358 = shl i64 %356, 4
  %.tr597.i = trunc i64 %356 to i32
  %359 = shl i32 %.tr597.i, 4
  %360 = sext i32 %359 to i64
  %361 = add nsw i64 %124, %360
  %.fr.i = freeze i1 %357
  %brmerge.not.i = select i1 %.fr.i, i1 %340, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %451, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %362 = add nuw nsw i64 %356, 1
  %exitcond.not.i = icmp eq i64 %362, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %363 = trunc i64 %358 to i32
  %364 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %363
  %365 = load float, ptr addrspace(3) %364, align 4, !tbaa !34
  %366 = getelementptr inbounds float, ptr %9, i64 %361
  store float %365, ptr %366, align 32, !tbaa !34
  br i1 %341, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %367 = trunc i64 %358 to i32
  %368 = or disjoint i32 %367, 1
  %369 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %368
  %370 = load float, ptr addrspace(3) %369, align 4, !tbaa !34
  %371 = or disjoint i64 %361, 1
  %372 = getelementptr inbounds float, ptr %9, i64 %371
  store float %370, ptr %372, align 4, !tbaa !34
  br i1 %342, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %373 = trunc i64 %358 to i32
  %374 = or disjoint i32 %373, 2
  %375 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %374
  %376 = load float, ptr addrspace(3) %375, align 4, !tbaa !34
  %377 = or disjoint i64 %361, 2
  %378 = getelementptr inbounds float, ptr %9, i64 %377
  store float %376, ptr %378, align 8, !tbaa !34
  br i1 %343, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %379 = trunc i64 %358 to i32
  %380 = or disjoint i32 %379, 3
  %381 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %380
  %382 = load float, ptr addrspace(3) %381, align 4, !tbaa !34
  %383 = or disjoint i64 %361, 3
  %384 = getelementptr inbounds float, ptr %9, i64 %383
  store float %382, ptr %384, align 4, !tbaa !34
  br i1 %344, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %385 = trunc i64 %358 to i32
  %386 = or disjoint i32 %385, 4
  %387 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %386
  %388 = load float, ptr addrspace(3) %387, align 4, !tbaa !34
  %389 = or disjoint i64 %361, 4
  %390 = getelementptr inbounds float, ptr %9, i64 %389
  store float %388, ptr %390, align 16, !tbaa !34
  br i1 %345, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %391 = trunc i64 %358 to i32
  %392 = or disjoint i32 %391, 5
  %393 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %392
  %394 = load float, ptr addrspace(3) %393, align 4, !tbaa !34
  %395 = or disjoint i64 %361, 5
  %396 = getelementptr inbounds float, ptr %9, i64 %395
  store float %394, ptr %396, align 4, !tbaa !34
  br i1 %346, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %397 = trunc i64 %358 to i32
  %398 = or disjoint i32 %397, 6
  %399 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %398
  %400 = load float, ptr addrspace(3) %399, align 4, !tbaa !34
  %401 = or disjoint i64 %361, 6
  %402 = getelementptr inbounds float, ptr %9, i64 %401
  store float %400, ptr %402, align 8, !tbaa !34
  br i1 %347, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %403 = trunc i64 %358 to i32
  %404 = or disjoint i32 %403, 7
  %405 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %404
  %406 = load float, ptr addrspace(3) %405, align 4, !tbaa !34
  %407 = or disjoint i64 %361, 7
  %408 = getelementptr inbounds float, ptr %9, i64 %407
  store float %406, ptr %408, align 4, !tbaa !34
  br i1 %348, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %409 = trunc i64 %358 to i32
  %410 = or disjoint i32 %409, 8
  %411 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %410
  %412 = load float, ptr addrspace(3) %411, align 4, !tbaa !34
  %413 = or disjoint i64 %361, 8
  %414 = getelementptr inbounds float, ptr %9, i64 %413
  store float %412, ptr %414, align 32, !tbaa !34
  br i1 %349, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %415 = trunc i64 %358 to i32
  %416 = or disjoint i32 %415, 9
  %417 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %416
  %418 = load float, ptr addrspace(3) %417, align 4, !tbaa !34
  %419 = or disjoint i64 %361, 9
  %420 = getelementptr inbounds float, ptr %9, i64 %419
  store float %418, ptr %420, align 4, !tbaa !34
  br i1 %350, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %421 = trunc i64 %358 to i32
  %422 = or disjoint i32 %421, 10
  %423 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %422
  %424 = load float, ptr addrspace(3) %423, align 4, !tbaa !34
  %425 = or disjoint i64 %361, 10
  %426 = getelementptr inbounds float, ptr %9, i64 %425
  store float %424, ptr %426, align 8, !tbaa !34
  br i1 %351, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %427 = trunc i64 %358 to i32
  %428 = or disjoint i32 %427, 11
  %429 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %428
  %430 = load float, ptr addrspace(3) %429, align 4, !tbaa !34
  %431 = or disjoint i64 %361, 11
  %432 = getelementptr inbounds float, ptr %9, i64 %431
  store float %430, ptr %432, align 4, !tbaa !34
  br i1 %352, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %433 = trunc i64 %358 to i32
  %434 = or disjoint i32 %433, 12
  %435 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %434
  %436 = load float, ptr addrspace(3) %435, align 4, !tbaa !34
  %437 = or disjoint i64 %361, 12
  %438 = getelementptr inbounds float, ptr %9, i64 %437
  store float %436, ptr %438, align 16, !tbaa !34
  br i1 %353, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %439 = trunc i64 %358 to i32
  %440 = or disjoint i32 %439, 13
  %441 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %440
  %442 = load float, ptr addrspace(3) %441, align 4, !tbaa !34
  %443 = or disjoint i64 %361, 13
  %444 = getelementptr inbounds float, ptr %9, i64 %443
  store float %442, ptr %444, align 4, !tbaa !34
  br i1 %354, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %445 = trunc i64 %358 to i32
  %446 = or disjoint i32 %445, 14
  %447 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %446
  %448 = load float, ptr addrspace(3) %447, align 4, !tbaa !34
  %449 = or disjoint i64 %361, 14
  %450 = getelementptr inbounds float, ptr %9, i64 %449
  store float %448, ptr %450, align 8, !tbaa !34
  br i1 %355, label %451, label %.split.us.i

451:                                              ; preds = %.preheader.split.15.i
  %452 = trunc i64 %358 to i32
  %453 = or disjoint i32 %452, 15
  %454 = getelementptr inbounds float, ptr addrspace(3) %339, i32 %453
  %455 = load float, ptr addrspace(3) %454, align 4, !tbaa !34
  %456 = or disjoint i64 %361, 15
  %457 = getelementptr inbounds float, ptr %9, i64 %456
  store float %455, ptr %457, align 4, !tbaa !34
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge647.i, %.split.us.i
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
!33 = distinct !{!33, !29, !30, !31}
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !26, i64 0}
!36 = distinct !{!36, !29}
!37 = distinct !{!37, !29}
;----------------- End AdaptiveCpp IR dump ---------------
