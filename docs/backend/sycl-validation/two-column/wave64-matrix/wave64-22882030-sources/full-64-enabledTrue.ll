;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882030/tmp/triton-sycl-cache/compile-ffebcq0f/kernel.cpp"
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
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
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

.lr.ph794.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i
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
  %50 = icmp ult i64 %49, 64
  call void @llvm.assume(i1 %50)
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 512
  %54 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0337.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i: ; preds = %60, %55
  %.sroa.0339.1.i = phi i16 [ %.sroa.0337.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0339.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  %67 = add nuw nsw i64 %56, 64
  %68 = icmp ult i64 %56, 960
  br i1 %68, label %55, label %.lr.ph794.i, !llvm.loop !28

.lr.ph797.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  %74 = icmp ult i64 %73, 64
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
  br label %109

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph794.i
  %84 = phi i64 [ %49, %.lr.ph794.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 7
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 1016
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0406.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !23
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0406.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  %93 = add nuw nsw i64 %84, 64
  %94 = icmp ult i64 %84, 960
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph797.i, !llvm.loop !32

.lr.ph800.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %100 = icmp ult i64 %99, 64
  call void @llvm.assume(i1 %100)
  %101 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %102 = inttoptr i32 %101 to ptr addrspace(3)
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 2560
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 4608
  %105 = and i64 %99, 7
  %106 = lshr i64 %99, 3
  %107 = or disjoint i64 %105, 8
  %108 = shl nuw nsw i64 %106, 7
  br label %133

109:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph797.i
  %110 = phi i64 [ %73, %.lr.ph797.i ], [ %121, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %111 = lshr i64 %110, 4
  %112 = icmp slt i64 %111, %76
  %113 = and i1 %112, %83
  br i1 %113, label %114, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

114:                                              ; preds = %109
  %115 = and i64 %110, 9223372036854775792
  %116 = or disjoint i64 %115, %78
  %117 = or disjoint i64 %116, %82
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %117
  %.sroa.0296.0.copyload.i = load i16, ptr %118, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %114, %109
  %.sroa.0298.1.i = phi i16 [ %.sroa.0296.0.copyload.i, %114 ], [ 0, %109 ]
  %119 = trunc i64 %110 to i32
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %119
  store i16 %.sroa.0298.1.i, ptr addrspace(3) %120, align 2, !tbaa.struct !23
  %121 = add nuw nsw i64 %110, 64
  %122 = icmp ult i64 %110, 1984
  br i1 %122, label %109, label %.lr.ph800.i, !llvm.loop !33

._crit_edge801.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %123 = shl nuw nsw i64 %106, 4
  %124 = or disjoint i64 %123, %105
  %125 = trunc i64 %124 to i32
  %126 = getelementptr inbounds float, ptr addrspace(3) %102, i32 %125
  store float %410, ptr addrspace(3) %126, align 4, !tbaa !34
  %127 = or disjoint i64 %123, %107
  %128 = trunc i64 %127 to i32
  %129 = getelementptr inbounds float, ptr addrspace(3) %102, i32 %128
  store float %435, ptr addrspace(3) %129, align 4, !tbaa !34
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %131 = icmp ult i64 %130, 64
  call void @llvm.assume(i1 %131)
  %132 = icmp eq i64 %130, 0
  br i1 %132, label %438, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

133:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph800.i
  %134 = phi i64 [ 0, %.lr.ph800.i ], [ %436, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %135 = phi float [ 0.000000e+00, %.lr.ph800.i ], [ %435, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %136 = phi float [ 0.000000e+00, %.lr.ph800.i ], [ %410, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %137 = add nuw nsw i64 %134, %108
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %138
  %.sroa.0281.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !23
  %140 = shl nuw nsw i64 %134, 4
  %141 = or disjoint i64 %140, %105
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %142
  %.sroa.0272.0.copyload.i = load i16, ptr addrspace(3) %143, align 2, !tbaa.struct !23
  %144 = zext i16 %.sroa.0281.0.copyload.i to i32
  %145 = lshr i32 %144, 10
  %146 = and i32 %145, 31
  %147 = and i32 %144, 1023
  switch i32 %146, label %153 [
    i32 31, label %148
    i32 0, label %155
  ]

148:                                              ; preds = %133
  %.sroa.0281.0.copyload.signext.i = sext i16 %.sroa.0281.0.copyload.i to i32
  %149 = and i32 %.sroa.0281.0.copyload.signext.i, -2147483648
  %.not781.i = icmp eq i32 %147, 0
  %150 = select i1 %.not781.i, i32 2139095040, i32 2143289344
  %151 = or disjoint i32 %150, %149
  %152 = bitcast i32 %151 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

153:                                              ; preds = %133
  %154 = or disjoint i32 %147, 1024
  br label %155

155:                                              ; preds = %153, %133
  %156 = phi i32 [ %154, %153 ], [ %147, %133 ]
  %157 = uitofp i32 %156 to float
  %.not.i = icmp eq i32 %146, 0
  %158 = add nsw i32 %146, -25
  %159 = select i1 %.not.i, i32 -24, i32 %158
  %160 = call float @__ocml_ldexp_f32(float noundef %157, i32 noundef %159) #5
  %161 = fneg contract float %160
  %.not735736.i = icmp slt i16 %.sroa.0281.0.copyload.i, 0
  %162 = select contract i1 %.not735736.i, float %161, float %160
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %155, %148
  %163 = phi float [ %152, %148 ], [ %162, %155 ]
  %164 = zext i16 %.sroa.0272.0.copyload.i to i32
  %165 = lshr i32 %164, 10
  %166 = and i32 %165, 31
  %167 = and i32 %164, 1023
  switch i32 %166, label %173 [
    i32 31, label %168
    i32 0, label %175
  ]

168:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0272.0.copyload.signext.i = sext i16 %.sroa.0272.0.copyload.i to i32
  %169 = and i32 %.sroa.0272.0.copyload.signext.i, -2147483648
  %.not780.i = icmp eq i32 %167, 0
  %170 = select i1 %.not780.i, i32 2139095040, i32 2143289344
  %171 = or disjoint i32 %170, %169
  %172 = bitcast i32 %171 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

173:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %174 = or disjoint i32 %167, 1024
  br label %175

175:                                              ; preds = %173, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %176 = phi i32 [ %174, %173 ], [ %167, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %177 = uitofp i32 %176 to float
  %.not737.i = icmp eq i32 %166, 0
  %178 = add nsw i32 %166, -25
  %179 = select i1 %.not737.i, i32 -24, i32 %178
  %180 = call float @__ocml_ldexp_f32(float noundef %177, i32 noundef %179) #5
  %181 = fneg contract float %180
  %.not738739.i = icmp slt i16 %.sroa.0272.0.copyload.i, 0
  %182 = select contract i1 %.not738739.i, float %181, float %180
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %175, %168
  %183 = phi float [ %172, %168 ], [ %182, %175 ]
  %184 = fmul contract float %163, %183
  %185 = fadd contract float %136, %184
  %186 = or disjoint i64 %140, %107
  %187 = trunc i64 %186 to i32
  %188 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %187
  %.sroa.0263.0.copyload.i = load i16, ptr addrspace(3) %188, align 2, !tbaa.struct !23
  %189 = zext i16 %.sroa.0263.0.copyload.i to i32
  %190 = lshr i32 %189, 10
  %191 = and i32 %190, 31
  %192 = and i32 %189, 1023
  switch i32 %191, label %198 [
    i32 31, label %193
    i32 0, label %200
  ]

193:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0263.0.copyload.signext.i = sext i16 %.sroa.0263.0.copyload.i to i32
  %194 = and i32 %.sroa.0263.0.copyload.signext.i, -2147483648
  %.not779.i = icmp eq i32 %192, 0
  %195 = select i1 %.not779.i, i32 2139095040, i32 2143289344
  %196 = or disjoint i32 %195, %194
  %197 = bitcast i32 %196 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

198:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %199 = or disjoint i32 %192, 1024
  br label %200

200:                                              ; preds = %198, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %201 = phi i32 [ %199, %198 ], [ %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %202 = uitofp i32 %201 to float
  %.not740.i = icmp eq i32 %191, 0
  %203 = add nsw i32 %191, -25
  %204 = select i1 %.not740.i, i32 -24, i32 %203
  %205 = call float @__ocml_ldexp_f32(float noundef %202, i32 noundef %204) #5
  %206 = fneg contract float %205
  %.not741742.i = icmp slt i16 %.sroa.0263.0.copyload.i, 0
  %207 = select contract i1 %.not741742.i, float %206, float %205
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %200, %193
  %208 = phi float [ %197, %193 ], [ %207, %200 ]
  %209 = fmul contract float %163, %208
  %210 = fadd contract float %135, %209
  %211 = or disjoint i64 %134, 1
  %212 = add nuw nsw i64 %211, %108
  %213 = trunc i64 %212 to i32
  %214 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %213
  %.sroa.0254.0.copyload.i = load i16, ptr addrspace(3) %214, align 2, !tbaa.struct !23
  %215 = shl nuw nsw i64 %211, 4
  %216 = or disjoint i64 %215, %105
  %217 = trunc i64 %216 to i32
  %218 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %217
  %.sroa.0245.0.copyload.i = load i16, ptr addrspace(3) %218, align 2, !tbaa.struct !23
  %219 = zext i16 %.sroa.0254.0.copyload.i to i32
  %220 = lshr i32 %219, 10
  %221 = and i32 %220, 31
  %222 = and i32 %219, 1023
  switch i32 %221, label %228 [
    i32 31, label %223
    i32 0, label %230
  ]

223:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0254.0.copyload.signext.i = sext i16 %.sroa.0254.0.copyload.i to i32
  %224 = and i32 %.sroa.0254.0.copyload.signext.i, -2147483648
  %.not778.i = icmp eq i32 %222, 0
  %225 = select i1 %.not778.i, i32 2139095040, i32 2143289344
  %226 = or disjoint i32 %225, %224
  %227 = bitcast i32 %226 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

228:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %229 = or disjoint i32 %222, 1024
  br label %230

230:                                              ; preds = %228, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %231 = phi i32 [ %229, %228 ], [ %222, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %232 = uitofp i32 %231 to float
  %.not743.i = icmp eq i32 %221, 0
  %233 = add nsw i32 %221, -25
  %234 = select i1 %.not743.i, i32 -24, i32 %233
  %235 = call float @__ocml_ldexp_f32(float noundef %232, i32 noundef %234) #5
  %236 = fneg contract float %235
  %.not744745.i = icmp slt i16 %.sroa.0254.0.copyload.i, 0
  %237 = select contract i1 %.not744745.i, float %236, float %235
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %230, %223
  %238 = phi float [ %227, %223 ], [ %237, %230 ]
  %239 = zext i16 %.sroa.0245.0.copyload.i to i32
  %240 = lshr i32 %239, 10
  %241 = and i32 %240, 31
  %242 = and i32 %239, 1023
  switch i32 %241, label %248 [
    i32 31, label %243
    i32 0, label %250
  ]

243:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0245.0.copyload.signext.i = sext i16 %.sroa.0245.0.copyload.i to i32
  %244 = and i32 %.sroa.0245.0.copyload.signext.i, -2147483648
  %.not777.i = icmp eq i32 %242, 0
  %245 = select i1 %.not777.i, i32 2139095040, i32 2143289344
  %246 = or disjoint i32 %245, %244
  %247 = bitcast i32 %246 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

248:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %249 = or disjoint i32 %242, 1024
  br label %250

250:                                              ; preds = %248, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %251 = phi i32 [ %249, %248 ], [ %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %252 = uitofp i32 %251 to float
  %.not746.i = icmp eq i32 %241, 0
  %253 = add nsw i32 %241, -25
  %254 = select i1 %.not746.i, i32 -24, i32 %253
  %255 = call float @__ocml_ldexp_f32(float noundef %252, i32 noundef %254) #5
  %256 = fneg contract float %255
  %.not747748.i = icmp slt i16 %.sroa.0245.0.copyload.i, 0
  %257 = select contract i1 %.not747748.i, float %256, float %255
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %250, %243
  %258 = phi float [ %247, %243 ], [ %257, %250 ]
  %259 = fmul contract float %238, %258
  %260 = fadd contract float %185, %259
  %261 = or disjoint i64 %215, %107
  %262 = trunc i64 %261 to i32
  %263 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %262
  %.sroa.0236.0.copyload.i = load i16, ptr addrspace(3) %263, align 2, !tbaa.struct !23
  %264 = zext i16 %.sroa.0236.0.copyload.i to i32
  %265 = lshr i32 %264, 10
  %266 = and i32 %265, 31
  %267 = and i32 %264, 1023
  switch i32 %266, label %273 [
    i32 31, label %268
    i32 0, label %275
  ]

268:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0236.0.copyload.signext.i = sext i16 %.sroa.0236.0.copyload.i to i32
  %269 = and i32 %.sroa.0236.0.copyload.signext.i, -2147483648
  %.not776.i = icmp eq i32 %267, 0
  %270 = select i1 %.not776.i, i32 2139095040, i32 2143289344
  %271 = or disjoint i32 %270, %269
  %272 = bitcast i32 %271 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

273:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %274 = or disjoint i32 %267, 1024
  br label %275

275:                                              ; preds = %273, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %276 = phi i32 [ %274, %273 ], [ %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %277 = uitofp i32 %276 to float
  %.not749.i = icmp eq i32 %266, 0
  %278 = add nsw i32 %266, -25
  %279 = select i1 %.not749.i, i32 -24, i32 %278
  %280 = call float @__ocml_ldexp_f32(float noundef %277, i32 noundef %279) #5
  %281 = fneg contract float %280
  %.not750751.i = icmp slt i16 %.sroa.0236.0.copyload.i, 0
  %282 = select contract i1 %.not750751.i, float %281, float %280
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %275, %268
  %283 = phi float [ %272, %268 ], [ %282, %275 ]
  %284 = fmul contract float %238, %283
  %285 = fadd contract float %210, %284
  %286 = or disjoint i64 %134, 2
  %287 = add nuw nsw i64 %286, %108
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %288
  %.sroa.0227.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !23
  %290 = shl nuw nsw i64 %286, 4
  %291 = or disjoint i64 %290, %105
  %292 = trunc i64 %291 to i32
  %293 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %292
  %.sroa.0218.0.copyload.i = load i16, ptr addrspace(3) %293, align 2, !tbaa.struct !23
  %294 = zext i16 %.sroa.0227.0.copyload.i to i32
  %295 = lshr i32 %294, 10
  %296 = and i32 %295, 31
  %297 = and i32 %294, 1023
  switch i32 %296, label %303 [
    i32 31, label %298
    i32 0, label %305
  ]

298:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0227.0.copyload.signext.i = sext i16 %.sroa.0227.0.copyload.i to i32
  %299 = and i32 %.sroa.0227.0.copyload.signext.i, -2147483648
  %.not775.i = icmp eq i32 %297, 0
  %300 = select i1 %.not775.i, i32 2139095040, i32 2143289344
  %301 = or disjoint i32 %300, %299
  %302 = bitcast i32 %301 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

303:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %304 = or disjoint i32 %297, 1024
  br label %305

305:                                              ; preds = %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %306 = phi i32 [ %304, %303 ], [ %297, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %307 = uitofp i32 %306 to float
  %.not752.i = icmp eq i32 %296, 0
  %308 = add nsw i32 %296, -25
  %309 = select i1 %.not752.i, i32 -24, i32 %308
  %310 = call float @__ocml_ldexp_f32(float noundef %307, i32 noundef %309) #5
  %311 = fneg contract float %310
  %.not753754.i = icmp slt i16 %.sroa.0227.0.copyload.i, 0
  %312 = select contract i1 %.not753754.i, float %311, float %310
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %305, %298
  %313 = phi float [ %302, %298 ], [ %312, %305 ]
  %314 = zext i16 %.sroa.0218.0.copyload.i to i32
  %315 = lshr i32 %314, 10
  %316 = and i32 %315, 31
  %317 = and i32 %314, 1023
  switch i32 %316, label %323 [
    i32 31, label %318
    i32 0, label %325
  ]

318:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0218.0.copyload.signext.i = sext i16 %.sroa.0218.0.copyload.i to i32
  %319 = and i32 %.sroa.0218.0.copyload.signext.i, -2147483648
  %.not774.i = icmp eq i32 %317, 0
  %320 = select i1 %.not774.i, i32 2139095040, i32 2143289344
  %321 = or disjoint i32 %320, %319
  %322 = bitcast i32 %321 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

323:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %324 = or disjoint i32 %317, 1024
  br label %325

325:                                              ; preds = %323, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %326 = phi i32 [ %324, %323 ], [ %317, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %327 = uitofp i32 %326 to float
  %.not755.i = icmp eq i32 %316, 0
  %328 = add nsw i32 %316, -25
  %329 = select i1 %.not755.i, i32 -24, i32 %328
  %330 = call float @__ocml_ldexp_f32(float noundef %327, i32 noundef %329) #5
  %331 = fneg contract float %330
  %.not756757.i = icmp slt i16 %.sroa.0218.0.copyload.i, 0
  %332 = select contract i1 %.not756757.i, float %331, float %330
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %325, %318
  %333 = phi float [ %322, %318 ], [ %332, %325 ]
  %334 = fmul contract float %313, %333
  %335 = fadd contract float %260, %334
  %336 = or disjoint i64 %290, %107
  %337 = trunc i64 %336 to i32
  %338 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %337
  %.sroa.0209.0.copyload.i = load i16, ptr addrspace(3) %338, align 2, !tbaa.struct !23
  %339 = zext i16 %.sroa.0209.0.copyload.i to i32
  %340 = lshr i32 %339, 10
  %341 = and i32 %340, 31
  %342 = and i32 %339, 1023
  switch i32 %341, label %348 [
    i32 31, label %343
    i32 0, label %350
  ]

343:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0209.0.copyload.signext.i = sext i16 %.sroa.0209.0.copyload.i to i32
  %344 = and i32 %.sroa.0209.0.copyload.signext.i, -2147483648
  %.not773.i = icmp eq i32 %342, 0
  %345 = select i1 %.not773.i, i32 2139095040, i32 2143289344
  %346 = or disjoint i32 %345, %344
  %347 = bitcast i32 %346 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

348:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %349 = or disjoint i32 %342, 1024
  br label %350

350:                                              ; preds = %348, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %351 = phi i32 [ %349, %348 ], [ %342, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %352 = uitofp i32 %351 to float
  %.not758.i = icmp eq i32 %341, 0
  %353 = add nsw i32 %341, -25
  %354 = select i1 %.not758.i, i32 -24, i32 %353
  %355 = call float @__ocml_ldexp_f32(float noundef %352, i32 noundef %354) #5
  %356 = fneg contract float %355
  %.not759760.i = icmp slt i16 %.sroa.0209.0.copyload.i, 0
  %357 = select contract i1 %.not759760.i, float %356, float %355
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %350, %343
  %358 = phi float [ %347, %343 ], [ %357, %350 ]
  %359 = fmul contract float %313, %358
  %360 = fadd contract float %285, %359
  %361 = or disjoint i64 %134, 3
  %362 = add nuw nsw i64 %361, %108
  %363 = trunc i64 %362 to i32
  %364 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %363
  %.sroa.0200.0.copyload.i = load i16, ptr addrspace(3) %364, align 2, !tbaa.struct !23
  %365 = shl nuw nsw i64 %361, 4
  %366 = or disjoint i64 %365, %105
  %367 = trunc i64 %366 to i32
  %368 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %367
  %.sroa.0191.0.copyload.i = load i16, ptr addrspace(3) %368, align 2, !tbaa.struct !23
  %369 = zext i16 %.sroa.0200.0.copyload.i to i32
  %370 = lshr i32 %369, 10
  %371 = and i32 %370, 31
  %372 = and i32 %369, 1023
  switch i32 %371, label %378 [
    i32 31, label %373
    i32 0, label %380
  ]

373:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0200.0.copyload.signext.i = sext i16 %.sroa.0200.0.copyload.i to i32
  %374 = and i32 %.sroa.0200.0.copyload.signext.i, -2147483648
  %.not772.i = icmp eq i32 %372, 0
  %375 = select i1 %.not772.i, i32 2139095040, i32 2143289344
  %376 = or disjoint i32 %375, %374
  %377 = bitcast i32 %376 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

378:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %379 = or disjoint i32 %372, 1024
  br label %380

380:                                              ; preds = %378, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %381 = phi i32 [ %379, %378 ], [ %372, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %382 = uitofp i32 %381 to float
  %.not761.i = icmp eq i32 %371, 0
  %383 = add nsw i32 %371, -25
  %384 = select i1 %.not761.i, i32 -24, i32 %383
  %385 = call float @__ocml_ldexp_f32(float noundef %382, i32 noundef %384) #5
  %386 = fneg contract float %385
  %.not762763.i = icmp slt i16 %.sroa.0200.0.copyload.i, 0
  %387 = select contract i1 %.not762763.i, float %386, float %385
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %380, %373
  %388 = phi float [ %377, %373 ], [ %387, %380 ]
  %389 = zext i16 %.sroa.0191.0.copyload.i to i32
  %390 = lshr i32 %389, 10
  %391 = and i32 %390, 31
  %392 = and i32 %389, 1023
  switch i32 %391, label %398 [
    i32 31, label %393
    i32 0, label %400
  ]

393:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0191.0.copyload.signext.i = sext i16 %.sroa.0191.0.copyload.i to i32
  %394 = and i32 %.sroa.0191.0.copyload.signext.i, -2147483648
  %.not771.i = icmp eq i32 %392, 0
  %395 = select i1 %.not771.i, i32 2139095040, i32 2143289344
  %396 = or disjoint i32 %395, %394
  %397 = bitcast i32 %396 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

398:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %399 = or disjoint i32 %392, 1024
  br label %400

400:                                              ; preds = %398, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %401 = phi i32 [ %399, %398 ], [ %392, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %402 = uitofp i32 %401 to float
  %.not764.i = icmp eq i32 %391, 0
  %403 = add nsw i32 %391, -25
  %404 = select i1 %.not764.i, i32 -24, i32 %403
  %405 = call float @__ocml_ldexp_f32(float noundef %402, i32 noundef %404) #5
  %406 = fneg contract float %405
  %.not765766.i = icmp slt i16 %.sroa.0191.0.copyload.i, 0
  %407 = select contract i1 %.not765766.i, float %406, float %405
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %400, %393
  %408 = phi float [ %397, %393 ], [ %407, %400 ]
  %409 = fmul contract float %388, %408
  %410 = fadd contract float %335, %409
  %411 = or disjoint i64 %365, %107
  %412 = trunc i64 %411 to i32
  %413 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %412
  %.sroa.0182.0.copyload.i = load i16, ptr addrspace(3) %413, align 2, !tbaa.struct !23
  %414 = zext i16 %.sroa.0182.0.copyload.i to i32
  %415 = lshr i32 %414, 10
  %416 = and i32 %415, 31
  %417 = and i32 %414, 1023
  switch i32 %416, label %423 [
    i32 31, label %418
    i32 0, label %425
  ]

418:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0182.0.copyload.signext.i = sext i16 %.sroa.0182.0.copyload.i to i32
  %419 = and i32 %.sroa.0182.0.copyload.signext.i, -2147483648
  %.not770.i = icmp eq i32 %417, 0
  %420 = select i1 %.not770.i, i32 2139095040, i32 2143289344
  %421 = or disjoint i32 %420, %419
  %422 = bitcast i32 %421 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

423:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %424 = or disjoint i32 %417, 1024
  br label %425

425:                                              ; preds = %423, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %426 = phi i32 [ %424, %423 ], [ %417, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %427 = uitofp i32 %426 to float
  %.not767.i = icmp eq i32 %416, 0
  %428 = add nsw i32 %416, -25
  %429 = select i1 %.not767.i, i32 -24, i32 %428
  %430 = call float @__ocml_ldexp_f32(float noundef %427, i32 noundef %429) #5
  %431 = fneg contract float %430
  %.not768769.i = icmp slt i16 %.sroa.0182.0.copyload.i, 0
  %432 = select contract i1 %.not768769.i, float %431, float %430
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %425, %418
  %433 = phi float [ %422, %418 ], [ %432, %425 ]
  %434 = fmul contract float %388, %433
  %435 = fadd contract float %360, %434
  %436 = add nuw nsw i64 %134, 4
  %437 = icmp ult i64 %134, 124
  br i1 %437, label %133, label %._crit_edge801.i, !llvm.loop !36

438:                                              ; preds = %._crit_edge801.i
  %439 = shl nuw i32 %.tr.i, 7
  %440 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %441 = icmp eq i64 %440, 0
  call void @llvm.assume(i1 %441)
  %442 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %443 = icmp eq i64 %442, 0
  call void @llvm.assume(i1 %443)
  %444 = sext i32 %3 to i64
  %445 = call i32 @llvm.amdgcn.groupstaticsize()
  %446 = inttoptr i32 %445 to ptr addrspace(3)
  %447 = sext i32 %439 to i64
  %448 = icmp sgt i32 %4, 0
  %449 = icmp ugt i32 %4, 1
  %450 = icmp ugt i32 %4, 2
  %451 = icmp ugt i32 %4, 3
  %452 = icmp ugt i32 %4, 4
  %453 = icmp ugt i32 %4, 5
  %454 = icmp ugt i32 %4, 6
  %455 = icmp ugt i32 %4, 7
  %456 = icmp ugt i32 %4, 8
  %457 = icmp ugt i32 %4, 9
  %458 = icmp ugt i32 %4, 10
  %459 = icmp ugt i32 %4, 11
  %460 = icmp ugt i32 %4, 12
  %461 = icmp ugt i32 %4, 13
  %462 = icmp ugt i32 %4, 14
  %463 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %438
  %464 = phi i64 [ 0, %438 ], [ %470, %.split.us.i ]
  %465 = icmp slt i64 %464, %444
  %466 = shl i64 %464, 4
  %.tr734.i = trunc i64 %464 to i32
  %467 = shl i32 %.tr734.i, 4
  %468 = sext i32 %467 to i64
  %469 = add nsw i64 %468, %447
  %.fr.i = freeze i1 %465
  %brmerge.not.i = select i1 %.fr.i, i1 %448, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %559, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %470 = add nuw nsw i64 %464, 1
  %exitcond.not.i = icmp eq i64 %470, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %471 = trunc i64 %466 to i32
  %472 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %471
  %473 = load float, ptr addrspace(3) %472, align 4, !tbaa !34
  %474 = getelementptr inbounds float, ptr %9, i64 %469
  store float %473, ptr %474, align 32, !tbaa !34
  br i1 %449, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %475 = trunc i64 %466 to i32
  %476 = or disjoint i32 %475, 1
  %477 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %476
  %478 = load float, ptr addrspace(3) %477, align 4, !tbaa !34
  %479 = or disjoint i64 %469, 1
  %480 = getelementptr inbounds float, ptr %9, i64 %479
  store float %478, ptr %480, align 4, !tbaa !34
  br i1 %450, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %481 = trunc i64 %466 to i32
  %482 = or disjoint i32 %481, 2
  %483 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %482
  %484 = load float, ptr addrspace(3) %483, align 4, !tbaa !34
  %485 = or disjoint i64 %469, 2
  %486 = getelementptr inbounds float, ptr %9, i64 %485
  store float %484, ptr %486, align 8, !tbaa !34
  br i1 %451, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %487 = trunc i64 %466 to i32
  %488 = or disjoint i32 %487, 3
  %489 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %488
  %490 = load float, ptr addrspace(3) %489, align 4, !tbaa !34
  %491 = or disjoint i64 %469, 3
  %492 = getelementptr inbounds float, ptr %9, i64 %491
  store float %490, ptr %492, align 4, !tbaa !34
  br i1 %452, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %493 = trunc i64 %466 to i32
  %494 = or disjoint i32 %493, 4
  %495 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %494
  %496 = load float, ptr addrspace(3) %495, align 4, !tbaa !34
  %497 = or disjoint i64 %469, 4
  %498 = getelementptr inbounds float, ptr %9, i64 %497
  store float %496, ptr %498, align 16, !tbaa !34
  br i1 %453, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %499 = trunc i64 %466 to i32
  %500 = or disjoint i32 %499, 5
  %501 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %500
  %502 = load float, ptr addrspace(3) %501, align 4, !tbaa !34
  %503 = or disjoint i64 %469, 5
  %504 = getelementptr inbounds float, ptr %9, i64 %503
  store float %502, ptr %504, align 4, !tbaa !34
  br i1 %454, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %505 = trunc i64 %466 to i32
  %506 = or disjoint i32 %505, 6
  %507 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %506
  %508 = load float, ptr addrspace(3) %507, align 4, !tbaa !34
  %509 = or disjoint i64 %469, 6
  %510 = getelementptr inbounds float, ptr %9, i64 %509
  store float %508, ptr %510, align 8, !tbaa !34
  br i1 %455, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %511 = trunc i64 %466 to i32
  %512 = or disjoint i32 %511, 7
  %513 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %512
  %514 = load float, ptr addrspace(3) %513, align 4, !tbaa !34
  %515 = or disjoint i64 %469, 7
  %516 = getelementptr inbounds float, ptr %9, i64 %515
  store float %514, ptr %516, align 4, !tbaa !34
  br i1 %456, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %517 = trunc i64 %466 to i32
  %518 = or disjoint i32 %517, 8
  %519 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %518
  %520 = load float, ptr addrspace(3) %519, align 4, !tbaa !34
  %521 = or disjoint i64 %469, 8
  %522 = getelementptr inbounds float, ptr %9, i64 %521
  store float %520, ptr %522, align 32, !tbaa !34
  br i1 %457, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %523 = trunc i64 %466 to i32
  %524 = or disjoint i32 %523, 9
  %525 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !34
  %527 = or disjoint i64 %469, 9
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 4, !tbaa !34
  br i1 %458, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %529 = trunc i64 %466 to i32
  %530 = or disjoint i32 %529, 10
  %531 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %530
  %532 = load float, ptr addrspace(3) %531, align 4, !tbaa !34
  %533 = or disjoint i64 %469, 10
  %534 = getelementptr inbounds float, ptr %9, i64 %533
  store float %532, ptr %534, align 8, !tbaa !34
  br i1 %459, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %535 = trunc i64 %466 to i32
  %536 = or disjoint i32 %535, 11
  %537 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %536
  %538 = load float, ptr addrspace(3) %537, align 4, !tbaa !34
  %539 = or disjoint i64 %469, 11
  %540 = getelementptr inbounds float, ptr %9, i64 %539
  store float %538, ptr %540, align 4, !tbaa !34
  br i1 %460, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %541 = trunc i64 %466 to i32
  %542 = or disjoint i32 %541, 12
  %543 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %542
  %544 = load float, ptr addrspace(3) %543, align 4, !tbaa !34
  %545 = or disjoint i64 %469, 12
  %546 = getelementptr inbounds float, ptr %9, i64 %545
  store float %544, ptr %546, align 16, !tbaa !34
  br i1 %461, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %547 = trunc i64 %466 to i32
  %548 = or disjoint i32 %547, 13
  %549 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %548
  %550 = load float, ptr addrspace(3) %549, align 4, !tbaa !34
  %551 = or disjoint i64 %469, 13
  %552 = getelementptr inbounds float, ptr %9, i64 %551
  store float %550, ptr %552, align 4, !tbaa !34
  br i1 %462, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %553 = trunc i64 %466 to i32
  %554 = or disjoint i32 %553, 14
  %555 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %554
  %556 = load float, ptr addrspace(3) %555, align 4, !tbaa !34
  %557 = or disjoint i64 %469, 14
  %558 = getelementptr inbounds float, ptr %9, i64 %557
  store float %556, ptr %558, align 8, !tbaa !34
  br i1 %463, label %559, label %.split.us.i

559:                                              ; preds = %.preheader.split.15.i
  %560 = trunc i64 %466 to i32
  %561 = or disjoint i32 %560, 15
  %562 = getelementptr inbounds float, ptr addrspace(3) %446, i32 %561
  %563 = load float, ptr addrspace(3) %562, align 4, !tbaa !34
  %564 = or disjoint i64 %469, 15
  %565 = getelementptr inbounds float, ptr %9, i64 %564
  store float %563, ptr %565, align 4, !tbaa !34
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge801.i, %.split.us.i
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
!10 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
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
