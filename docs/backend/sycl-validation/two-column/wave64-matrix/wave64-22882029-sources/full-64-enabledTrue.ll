;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-065h_rpm/kernel.cpp"
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
  %36 = shl i32 %.tr.i, 9
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = icmp slt i64 %34, %38
  br label %58

.lr.ph794.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %45 = icmp eq i64 %44, 0
  call void @llvm.assume(i1 %45)
  %46 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %47 = icmp eq i64 %46, 0
  call void @llvm.assume(i1 %47)
  %48 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %49 = icmp ult i64 %48, 64
  call void @llvm.assume(i1 %49)
  %50 = shl i32 %.tr.i, 10
  %51 = sext i32 %4 to i64
  %52 = sext i32 %5 to i64
  %53 = sext i32 %50 to i64
  %54 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %55 = inttoptr i32 %54 to ptr addrspace(3)
  %56 = getelementptr inbounds i8, ptr addrspace(3) %55, i32 1536
  %57 = icmp slt i64 %48, %52
  br label %82

58:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i, %6
  %59 = phi i64 [ %34, %6 ], [ %70, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i ]
  %60 = lshr i64 %59, 6
  %61 = icmp slt i64 %60, %37
  %62 = and i1 %61, %43
  br i1 %62, label %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i

63:                                               ; preds = %58
  %64 = and i64 %59, 9223372036854775744
  %65 = or disjoint i64 %64, %39
  %66 = or disjoint i64 %65, %34
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %66
  %.sroa.0337.0.copyload.i = load i16, ptr %67, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit25.i.i.i: ; preds = %63, %58
  %.sroa.0339.1.i = phi i16 [ %.sroa.0337.0.copyload.i, %63 ], [ 0, %58 ]
  %68 = trunc i64 %59 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %68
  store i16 %.sroa.0339.1.i, ptr addrspace(3) %69, align 2, !tbaa.struct !23
  %70 = add nuw nsw i64 %59, 64
  %71 = icmp ult i64 %59, 448
  br i1 %71, label %58, label %.lr.ph794.i, !llvm.loop !28

.lr.ph797.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %77 = icmp ult i64 %76, 64
  call void @llvm.assume(i1 %77)
  %78 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %79 = inttoptr i32 %78 to ptr addrspace(3)
  %80 = getelementptr inbounds i8, ptr addrspace(3) %79, i32 1536
  %81 = getelementptr inbounds i8, ptr addrspace(3) %79, i32 3584
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

82:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph794.i
  %83 = phi i64 [ %48, %.lr.ph794.i ], [ %94, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %84 = lshr i64 %83, 6
  %85 = icmp slt i64 %84, %51
  %86 = and i1 %85, %57
  br i1 %86, label %87, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

87:                                               ; preds = %82
  %88 = and i64 %83, 9223372036854775744
  %89 = or disjoint i64 %88, %53
  %90 = or disjoint i64 %89, %48
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %90
  %.sroa.0322.0.copyload.i = load i16, ptr %91, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %87, %82
  %.sroa.0324.1.i = phi i16 [ %.sroa.0322.0.copyload.i, %87 ], [ 0, %82 ]
  %92 = trunc i64 %83 to i32
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %92
  store i16 %.sroa.0324.1.i, ptr addrspace(3) %93, align 2, !tbaa.struct !23
  %94 = add nuw nsw i64 %83, 64
  %95 = icmp ult i64 %83, 960
  br i1 %95, label %82, label %.lr.ph797.i, !llvm.loop !32

.lr.ph800.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %97 = icmp eq i64 %96, 0
  call void @llvm.assume(i1 %97)
  %98 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %99 = icmp eq i64 %98, 0
  call void @llvm.assume(i1 %99)
  %100 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %101 = icmp ult i64 %100, 64
  call void @llvm.assume(i1 %101)
  %102 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %103 = inttoptr i32 %102 to ptr addrspace(3)
  %104 = getelementptr inbounds i8, ptr addrspace(3) %103, i32 512
  %105 = getelementptr inbounds i8, ptr addrspace(3) %103, i32 3584
  %106 = and i64 %100, 7
  %107 = lshr i64 %100, 3
  %108 = or disjoint i64 %106, 8
  %109 = shl nuw nsw i64 %107, 6
  br label %131

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph797.i
  %110 = phi i64 [ %76, %.lr.ph797.i ], [ %119, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %111 = lshr i64 %110, 4
  %112 = shl nuw nsw i64 %110, 6
  %113 = and i64 %112, 960
  %114 = or disjoint i64 %113, %111
  %115 = trunc i64 %114 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %80, i32 %115
  %.sroa.0406.0.copyload.i = load i16, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = trunc i64 %110 to i32
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %117
  store i16 %.sroa.0406.0.copyload.i, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  %119 = add nuw nsw i64 %110, 64
  %120 = icmp ult i64 %110, 960
  br i1 %120, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %.lr.ph800.i, !llvm.loop !33

._crit_edge801.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %121 = shl nuw nsw i64 %107, 4
  %122 = or disjoint i64 %121, %106
  %123 = trunc i64 %122 to i32
  %124 = getelementptr inbounds float, ptr addrspace(3) %103, i32 %123
  store float %408, ptr addrspace(3) %124, align 4, !tbaa !34
  %125 = or disjoint i64 %121, %108
  %126 = trunc i64 %125 to i32
  %127 = getelementptr inbounds float, ptr addrspace(3) %103, i32 %126
  store float %433, ptr addrspace(3) %127, align 4, !tbaa !34
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %129 = icmp ult i64 %128, 64
  call void @llvm.assume(i1 %129)
  %130 = icmp eq i64 %128, 0
  br i1 %130, label %436, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

131:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph800.i
  %132 = phi i64 [ 0, %.lr.ph800.i ], [ %434, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %133 = phi float [ 0.000000e+00, %.lr.ph800.i ], [ %433, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %134 = phi float [ 0.000000e+00, %.lr.ph800.i ], [ %408, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %135 = add nuw nsw i64 %132, %109
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %136
  %.sroa.0281.0.copyload.i = load i16, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  %138 = shl nuw nsw i64 %132, 4
  %139 = or disjoint i64 %138, %106
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %140
  %.sroa.0272.0.copyload.i = load i16, ptr addrspace(3) %141, align 2, !tbaa.struct !23
  %142 = zext i16 %.sroa.0281.0.copyload.i to i32
  %143 = lshr i32 %142, 10
  %144 = and i32 %143, 31
  %145 = and i32 %142, 1023
  switch i32 %144, label %151 [
    i32 31, label %146
    i32 0, label %153
  ]

146:                                              ; preds = %131
  %.sroa.0281.0.copyload.signext.i = sext i16 %.sroa.0281.0.copyload.i to i32
  %147 = and i32 %.sroa.0281.0.copyload.signext.i, -2147483648
  %.not781.i = icmp eq i32 %145, 0
  %148 = select i1 %.not781.i, i32 2139095040, i32 2143289344
  %149 = or disjoint i32 %148, %147
  %150 = bitcast i32 %149 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

151:                                              ; preds = %131
  %152 = or disjoint i32 %145, 1024
  br label %153

153:                                              ; preds = %151, %131
  %154 = phi i32 [ %152, %151 ], [ %145, %131 ]
  %155 = uitofp i32 %154 to float
  %.not.i = icmp eq i32 %144, 0
  %156 = add nsw i32 %144, -25
  %157 = select i1 %.not.i, i32 -24, i32 %156
  %158 = call float @__ocml_ldexp_f32(float noundef %155, i32 noundef %157) #5
  %159 = fneg contract float %158
  %.not735736.i = icmp slt i16 %.sroa.0281.0.copyload.i, 0
  %160 = select contract i1 %.not735736.i, float %159, float %158
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %153, %146
  %161 = phi float [ %150, %146 ], [ %160, %153 ]
  %162 = zext i16 %.sroa.0272.0.copyload.i to i32
  %163 = lshr i32 %162, 10
  %164 = and i32 %163, 31
  %165 = and i32 %162, 1023
  switch i32 %164, label %171 [
    i32 31, label %166
    i32 0, label %173
  ]

166:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0272.0.copyload.signext.i = sext i16 %.sroa.0272.0.copyload.i to i32
  %167 = and i32 %.sroa.0272.0.copyload.signext.i, -2147483648
  %.not780.i = icmp eq i32 %165, 0
  %168 = select i1 %.not780.i, i32 2139095040, i32 2143289344
  %169 = or disjoint i32 %168, %167
  %170 = bitcast i32 %169 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

171:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %172 = or disjoint i32 %165, 1024
  br label %173

173:                                              ; preds = %171, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %174 = phi i32 [ %172, %171 ], [ %165, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %175 = uitofp i32 %174 to float
  %.not737.i = icmp eq i32 %164, 0
  %176 = add nsw i32 %164, -25
  %177 = select i1 %.not737.i, i32 -24, i32 %176
  %178 = call float @__ocml_ldexp_f32(float noundef %175, i32 noundef %177) #5
  %179 = fneg contract float %178
  %.not738739.i = icmp slt i16 %.sroa.0272.0.copyload.i, 0
  %180 = select contract i1 %.not738739.i, float %179, float %178
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %173, %166
  %181 = phi float [ %170, %166 ], [ %180, %173 ]
  %182 = fmul contract float %161, %181
  %183 = fadd contract float %134, %182
  %184 = or disjoint i64 %138, %108
  %185 = trunc i64 %184 to i32
  %186 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %185
  %.sroa.0263.0.copyload.i = load i16, ptr addrspace(3) %186, align 2, !tbaa.struct !23
  %187 = zext i16 %.sroa.0263.0.copyload.i to i32
  %188 = lshr i32 %187, 10
  %189 = and i32 %188, 31
  %190 = and i32 %187, 1023
  switch i32 %189, label %196 [
    i32 31, label %191
    i32 0, label %198
  ]

191:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0263.0.copyload.signext.i = sext i16 %.sroa.0263.0.copyload.i to i32
  %192 = and i32 %.sroa.0263.0.copyload.signext.i, -2147483648
  %.not779.i = icmp eq i32 %190, 0
  %193 = select i1 %.not779.i, i32 2139095040, i32 2143289344
  %194 = or disjoint i32 %193, %192
  %195 = bitcast i32 %194 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

196:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %197 = or disjoint i32 %190, 1024
  br label %198

198:                                              ; preds = %196, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %199 = phi i32 [ %197, %196 ], [ %190, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %200 = uitofp i32 %199 to float
  %.not740.i = icmp eq i32 %189, 0
  %201 = add nsw i32 %189, -25
  %202 = select i1 %.not740.i, i32 -24, i32 %201
  %203 = call float @__ocml_ldexp_f32(float noundef %200, i32 noundef %202) #5
  %204 = fneg contract float %203
  %.not741742.i = icmp slt i16 %.sroa.0263.0.copyload.i, 0
  %205 = select contract i1 %.not741742.i, float %204, float %203
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %198, %191
  %206 = phi float [ %195, %191 ], [ %205, %198 ]
  %207 = fmul contract float %161, %206
  %208 = fadd contract float %133, %207
  %209 = or disjoint i64 %132, 1
  %210 = add nuw nsw i64 %209, %109
  %211 = trunc i64 %210 to i32
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %211
  %.sroa.0254.0.copyload.i = load i16, ptr addrspace(3) %212, align 2, !tbaa.struct !23
  %213 = shl nuw nsw i64 %209, 4
  %214 = or disjoint i64 %213, %106
  %215 = trunc i64 %214 to i32
  %216 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %215
  %.sroa.0245.0.copyload.i = load i16, ptr addrspace(3) %216, align 2, !tbaa.struct !23
  %217 = zext i16 %.sroa.0254.0.copyload.i to i32
  %218 = lshr i32 %217, 10
  %219 = and i32 %218, 31
  %220 = and i32 %217, 1023
  switch i32 %219, label %226 [
    i32 31, label %221
    i32 0, label %228
  ]

221:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0254.0.copyload.signext.i = sext i16 %.sroa.0254.0.copyload.i to i32
  %222 = and i32 %.sroa.0254.0.copyload.signext.i, -2147483648
  %.not778.i = icmp eq i32 %220, 0
  %223 = select i1 %.not778.i, i32 2139095040, i32 2143289344
  %224 = or disjoint i32 %223, %222
  %225 = bitcast i32 %224 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

226:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %227 = or disjoint i32 %220, 1024
  br label %228

228:                                              ; preds = %226, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %229 = phi i32 [ %227, %226 ], [ %220, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %230 = uitofp i32 %229 to float
  %.not743.i = icmp eq i32 %219, 0
  %231 = add nsw i32 %219, -25
  %232 = select i1 %.not743.i, i32 -24, i32 %231
  %233 = call float @__ocml_ldexp_f32(float noundef %230, i32 noundef %232) #5
  %234 = fneg contract float %233
  %.not744745.i = icmp slt i16 %.sroa.0254.0.copyload.i, 0
  %235 = select contract i1 %.not744745.i, float %234, float %233
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %228, %221
  %236 = phi float [ %225, %221 ], [ %235, %228 ]
  %237 = zext i16 %.sroa.0245.0.copyload.i to i32
  %238 = lshr i32 %237, 10
  %239 = and i32 %238, 31
  %240 = and i32 %237, 1023
  switch i32 %239, label %246 [
    i32 31, label %241
    i32 0, label %248
  ]

241:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0245.0.copyload.signext.i = sext i16 %.sroa.0245.0.copyload.i to i32
  %242 = and i32 %.sroa.0245.0.copyload.signext.i, -2147483648
  %.not777.i = icmp eq i32 %240, 0
  %243 = select i1 %.not777.i, i32 2139095040, i32 2143289344
  %244 = or disjoint i32 %243, %242
  %245 = bitcast i32 %244 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

246:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %247 = or disjoint i32 %240, 1024
  br label %248

248:                                              ; preds = %246, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %249 = phi i32 [ %247, %246 ], [ %240, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %250 = uitofp i32 %249 to float
  %.not746.i = icmp eq i32 %239, 0
  %251 = add nsw i32 %239, -25
  %252 = select i1 %.not746.i, i32 -24, i32 %251
  %253 = call float @__ocml_ldexp_f32(float noundef %250, i32 noundef %252) #5
  %254 = fneg contract float %253
  %.not747748.i = icmp slt i16 %.sroa.0245.0.copyload.i, 0
  %255 = select contract i1 %.not747748.i, float %254, float %253
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %248, %241
  %256 = phi float [ %245, %241 ], [ %255, %248 ]
  %257 = fmul contract float %236, %256
  %258 = fadd contract float %183, %257
  %259 = or disjoint i64 %213, %108
  %260 = trunc i64 %259 to i32
  %261 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %260
  %.sroa.0236.0.copyload.i = load i16, ptr addrspace(3) %261, align 2, !tbaa.struct !23
  %262 = zext i16 %.sroa.0236.0.copyload.i to i32
  %263 = lshr i32 %262, 10
  %264 = and i32 %263, 31
  %265 = and i32 %262, 1023
  switch i32 %264, label %271 [
    i32 31, label %266
    i32 0, label %273
  ]

266:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0236.0.copyload.signext.i = sext i16 %.sroa.0236.0.copyload.i to i32
  %267 = and i32 %.sroa.0236.0.copyload.signext.i, -2147483648
  %.not776.i = icmp eq i32 %265, 0
  %268 = select i1 %.not776.i, i32 2139095040, i32 2143289344
  %269 = or disjoint i32 %268, %267
  %270 = bitcast i32 %269 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

271:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %272 = or disjoint i32 %265, 1024
  br label %273

273:                                              ; preds = %271, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %274 = phi i32 [ %272, %271 ], [ %265, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %275 = uitofp i32 %274 to float
  %.not749.i = icmp eq i32 %264, 0
  %276 = add nsw i32 %264, -25
  %277 = select i1 %.not749.i, i32 -24, i32 %276
  %278 = call float @__ocml_ldexp_f32(float noundef %275, i32 noundef %277) #5
  %279 = fneg contract float %278
  %.not750751.i = icmp slt i16 %.sroa.0236.0.copyload.i, 0
  %280 = select contract i1 %.not750751.i, float %279, float %278
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %273, %266
  %281 = phi float [ %270, %266 ], [ %280, %273 ]
  %282 = fmul contract float %236, %281
  %283 = fadd contract float %208, %282
  %284 = or disjoint i64 %132, 2
  %285 = add nuw nsw i64 %284, %109
  %286 = trunc i64 %285 to i32
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %286
  %.sroa.0227.0.copyload.i = load i16, ptr addrspace(3) %287, align 2, !tbaa.struct !23
  %288 = shl nuw nsw i64 %284, 4
  %289 = or disjoint i64 %288, %106
  %290 = trunc i64 %289 to i32
  %291 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %290
  %.sroa.0218.0.copyload.i = load i16, ptr addrspace(3) %291, align 2, !tbaa.struct !23
  %292 = zext i16 %.sroa.0227.0.copyload.i to i32
  %293 = lshr i32 %292, 10
  %294 = and i32 %293, 31
  %295 = and i32 %292, 1023
  switch i32 %294, label %301 [
    i32 31, label %296
    i32 0, label %303
  ]

296:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0227.0.copyload.signext.i = sext i16 %.sroa.0227.0.copyload.i to i32
  %297 = and i32 %.sroa.0227.0.copyload.signext.i, -2147483648
  %.not775.i = icmp eq i32 %295, 0
  %298 = select i1 %.not775.i, i32 2139095040, i32 2143289344
  %299 = or disjoint i32 %298, %297
  %300 = bitcast i32 %299 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

301:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %302 = or disjoint i32 %295, 1024
  br label %303

303:                                              ; preds = %301, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %304 = phi i32 [ %302, %301 ], [ %295, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %305 = uitofp i32 %304 to float
  %.not752.i = icmp eq i32 %294, 0
  %306 = add nsw i32 %294, -25
  %307 = select i1 %.not752.i, i32 -24, i32 %306
  %308 = call float @__ocml_ldexp_f32(float noundef %305, i32 noundef %307) #5
  %309 = fneg contract float %308
  %.not753754.i = icmp slt i16 %.sroa.0227.0.copyload.i, 0
  %310 = select contract i1 %.not753754.i, float %309, float %308
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %303, %296
  %311 = phi float [ %300, %296 ], [ %310, %303 ]
  %312 = zext i16 %.sroa.0218.0.copyload.i to i32
  %313 = lshr i32 %312, 10
  %314 = and i32 %313, 31
  %315 = and i32 %312, 1023
  switch i32 %314, label %321 [
    i32 31, label %316
    i32 0, label %323
  ]

316:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0218.0.copyload.signext.i = sext i16 %.sroa.0218.0.copyload.i to i32
  %317 = and i32 %.sroa.0218.0.copyload.signext.i, -2147483648
  %.not774.i = icmp eq i32 %315, 0
  %318 = select i1 %.not774.i, i32 2139095040, i32 2143289344
  %319 = or disjoint i32 %318, %317
  %320 = bitcast i32 %319 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

321:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %322 = or disjoint i32 %315, 1024
  br label %323

323:                                              ; preds = %321, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %324 = phi i32 [ %322, %321 ], [ %315, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %325 = uitofp i32 %324 to float
  %.not755.i = icmp eq i32 %314, 0
  %326 = add nsw i32 %314, -25
  %327 = select i1 %.not755.i, i32 -24, i32 %326
  %328 = call float @__ocml_ldexp_f32(float noundef %325, i32 noundef %327) #5
  %329 = fneg contract float %328
  %.not756757.i = icmp slt i16 %.sroa.0218.0.copyload.i, 0
  %330 = select contract i1 %.not756757.i, float %329, float %328
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %323, %316
  %331 = phi float [ %320, %316 ], [ %330, %323 ]
  %332 = fmul contract float %311, %331
  %333 = fadd contract float %258, %332
  %334 = or disjoint i64 %288, %108
  %335 = trunc i64 %334 to i32
  %336 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %335
  %.sroa.0209.0.copyload.i = load i16, ptr addrspace(3) %336, align 2, !tbaa.struct !23
  %337 = zext i16 %.sroa.0209.0.copyload.i to i32
  %338 = lshr i32 %337, 10
  %339 = and i32 %338, 31
  %340 = and i32 %337, 1023
  switch i32 %339, label %346 [
    i32 31, label %341
    i32 0, label %348
  ]

341:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0209.0.copyload.signext.i = sext i16 %.sroa.0209.0.copyload.i to i32
  %342 = and i32 %.sroa.0209.0.copyload.signext.i, -2147483648
  %.not773.i = icmp eq i32 %340, 0
  %343 = select i1 %.not773.i, i32 2139095040, i32 2143289344
  %344 = or disjoint i32 %343, %342
  %345 = bitcast i32 %344 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

346:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %347 = or disjoint i32 %340, 1024
  br label %348

348:                                              ; preds = %346, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %349 = phi i32 [ %347, %346 ], [ %340, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %350 = uitofp i32 %349 to float
  %.not758.i = icmp eq i32 %339, 0
  %351 = add nsw i32 %339, -25
  %352 = select i1 %.not758.i, i32 -24, i32 %351
  %353 = call float @__ocml_ldexp_f32(float noundef %350, i32 noundef %352) #5
  %354 = fneg contract float %353
  %.not759760.i = icmp slt i16 %.sroa.0209.0.copyload.i, 0
  %355 = select contract i1 %.not759760.i, float %354, float %353
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %348, %341
  %356 = phi float [ %345, %341 ], [ %355, %348 ]
  %357 = fmul contract float %311, %356
  %358 = fadd contract float %283, %357
  %359 = or disjoint i64 %132, 3
  %360 = add nuw nsw i64 %359, %109
  %361 = trunc i64 %360 to i32
  %362 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %361
  %.sroa.0200.0.copyload.i = load i16, ptr addrspace(3) %362, align 2, !tbaa.struct !23
  %363 = shl nuw nsw i64 %359, 4
  %364 = or disjoint i64 %363, %106
  %365 = trunc i64 %364 to i32
  %366 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %365
  %.sroa.0191.0.copyload.i = load i16, ptr addrspace(3) %366, align 2, !tbaa.struct !23
  %367 = zext i16 %.sroa.0200.0.copyload.i to i32
  %368 = lshr i32 %367, 10
  %369 = and i32 %368, 31
  %370 = and i32 %367, 1023
  switch i32 %369, label %376 [
    i32 31, label %371
    i32 0, label %378
  ]

371:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0200.0.copyload.signext.i = sext i16 %.sroa.0200.0.copyload.i to i32
  %372 = and i32 %.sroa.0200.0.copyload.signext.i, -2147483648
  %.not772.i = icmp eq i32 %370, 0
  %373 = select i1 %.not772.i, i32 2139095040, i32 2143289344
  %374 = or disjoint i32 %373, %372
  %375 = bitcast i32 %374 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

376:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %377 = or disjoint i32 %370, 1024
  br label %378

378:                                              ; preds = %376, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %379 = phi i32 [ %377, %376 ], [ %370, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %380 = uitofp i32 %379 to float
  %.not761.i = icmp eq i32 %369, 0
  %381 = add nsw i32 %369, -25
  %382 = select i1 %.not761.i, i32 -24, i32 %381
  %383 = call float @__ocml_ldexp_f32(float noundef %380, i32 noundef %382) #5
  %384 = fneg contract float %383
  %.not762763.i = icmp slt i16 %.sroa.0200.0.copyload.i, 0
  %385 = select contract i1 %.not762763.i, float %384, float %383
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %378, %371
  %386 = phi float [ %375, %371 ], [ %385, %378 ]
  %387 = zext i16 %.sroa.0191.0.copyload.i to i32
  %388 = lshr i32 %387, 10
  %389 = and i32 %388, 31
  %390 = and i32 %387, 1023
  switch i32 %389, label %396 [
    i32 31, label %391
    i32 0, label %398
  ]

391:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0191.0.copyload.signext.i = sext i16 %.sroa.0191.0.copyload.i to i32
  %392 = and i32 %.sroa.0191.0.copyload.signext.i, -2147483648
  %.not771.i = icmp eq i32 %390, 0
  %393 = select i1 %.not771.i, i32 2139095040, i32 2143289344
  %394 = or disjoint i32 %393, %392
  %395 = bitcast i32 %394 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

396:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %397 = or disjoint i32 %390, 1024
  br label %398

398:                                              ; preds = %396, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %399 = phi i32 [ %397, %396 ], [ %390, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %400 = uitofp i32 %399 to float
  %.not764.i = icmp eq i32 %389, 0
  %401 = add nsw i32 %389, -25
  %402 = select i1 %.not764.i, i32 -24, i32 %401
  %403 = call float @__ocml_ldexp_f32(float noundef %400, i32 noundef %402) #5
  %404 = fneg contract float %403
  %.not765766.i = icmp slt i16 %.sroa.0191.0.copyload.i, 0
  %405 = select contract i1 %.not765766.i, float %404, float %403
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %398, %391
  %406 = phi float [ %395, %391 ], [ %405, %398 ]
  %407 = fmul contract float %386, %406
  %408 = fadd contract float %333, %407
  %409 = or disjoint i64 %363, %108
  %410 = trunc i64 %409 to i32
  %411 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %410
  %.sroa.0182.0.copyload.i = load i16, ptr addrspace(3) %411, align 2, !tbaa.struct !23
  %412 = zext i16 %.sroa.0182.0.copyload.i to i32
  %413 = lshr i32 %412, 10
  %414 = and i32 %413, 31
  %415 = and i32 %412, 1023
  switch i32 %414, label %421 [
    i32 31, label %416
    i32 0, label %423
  ]

416:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0182.0.copyload.signext.i = sext i16 %.sroa.0182.0.copyload.i to i32
  %417 = and i32 %.sroa.0182.0.copyload.signext.i, -2147483648
  %.not770.i = icmp eq i32 %415, 0
  %418 = select i1 %.not770.i, i32 2139095040, i32 2143289344
  %419 = or disjoint i32 %418, %417
  %420 = bitcast i32 %419 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

421:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %422 = or disjoint i32 %415, 1024
  br label %423

423:                                              ; preds = %421, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %424 = phi i32 [ %422, %421 ], [ %415, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %425 = uitofp i32 %424 to float
  %.not767.i = icmp eq i32 %414, 0
  %426 = add nsw i32 %414, -25
  %427 = select i1 %.not767.i, i32 -24, i32 %426
  %428 = call float @__ocml_ldexp_f32(float noundef %425, i32 noundef %427) #5
  %429 = fneg contract float %428
  %.not768769.i = icmp slt i16 %.sroa.0182.0.copyload.i, 0
  %430 = select contract i1 %.not768769.i, float %429, float %428
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %423, %416
  %431 = phi float [ %420, %416 ], [ %430, %423 ]
  %432 = fmul contract float %386, %431
  %433 = fadd contract float %358, %432
  %434 = add nuw nsw i64 %132, 4
  %435 = icmp ult i64 %132, 60
  br i1 %435, label %131, label %._crit_edge801.i, !llvm.loop !36

436:                                              ; preds = %._crit_edge801.i
  %437 = shl nuw i32 %.tr.i, 7
  %438 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %439 = icmp eq i64 %438, 0
  call void @llvm.assume(i1 %439)
  %440 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %441 = icmp eq i64 %440, 0
  call void @llvm.assume(i1 %441)
  %442 = sext i32 %3 to i64
  %443 = call i32 @llvm.amdgcn.groupstaticsize()
  %444 = inttoptr i32 %443 to ptr addrspace(3)
  %445 = sext i32 %437 to i64
  %446 = icmp sgt i32 %4, 0
  %447 = icmp ugt i32 %4, 1
  %448 = icmp ugt i32 %4, 2
  %449 = icmp ugt i32 %4, 3
  %450 = icmp ugt i32 %4, 4
  %451 = icmp ugt i32 %4, 5
  %452 = icmp ugt i32 %4, 6
  %453 = icmp ugt i32 %4, 7
  %454 = icmp ugt i32 %4, 8
  %455 = icmp ugt i32 %4, 9
  %456 = icmp ugt i32 %4, 10
  %457 = icmp ugt i32 %4, 11
  %458 = icmp ugt i32 %4, 12
  %459 = icmp ugt i32 %4, 13
  %460 = icmp ugt i32 %4, 14
  %461 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %436
  %462 = phi i64 [ 0, %436 ], [ %468, %.split.us.i ]
  %463 = icmp slt i64 %462, %442
  %464 = shl i64 %462, 4
  %.tr734.i = trunc i64 %462 to i32
  %465 = shl i32 %.tr734.i, 4
  %466 = sext i32 %465 to i64
  %467 = add nsw i64 %466, %445
  %.fr.i = freeze i1 %463
  %brmerge.not.i = select i1 %.fr.i, i1 %446, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %557, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %468 = add nuw nsw i64 %462, 1
  %exitcond.not.i = icmp eq i64 %468, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %469 = trunc i64 %464 to i32
  %470 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %469
  %471 = load float, ptr addrspace(3) %470, align 4, !tbaa !34
  %472 = getelementptr inbounds float, ptr %9, i64 %467
  store float %471, ptr %472, align 32, !tbaa !34
  br i1 %447, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %473 = trunc i64 %464 to i32
  %474 = or disjoint i32 %473, 1
  %475 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !34
  %477 = or disjoint i64 %467, 1
  %478 = getelementptr inbounds float, ptr %9, i64 %477
  store float %476, ptr %478, align 4, !tbaa !34
  br i1 %448, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %479 = trunc i64 %464 to i32
  %480 = or disjoint i32 %479, 2
  %481 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %480
  %482 = load float, ptr addrspace(3) %481, align 4, !tbaa !34
  %483 = or disjoint i64 %467, 2
  %484 = getelementptr inbounds float, ptr %9, i64 %483
  store float %482, ptr %484, align 8, !tbaa !34
  br i1 %449, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %485 = trunc i64 %464 to i32
  %486 = or disjoint i32 %485, 3
  %487 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %486
  %488 = load float, ptr addrspace(3) %487, align 4, !tbaa !34
  %489 = or disjoint i64 %467, 3
  %490 = getelementptr inbounds float, ptr %9, i64 %489
  store float %488, ptr %490, align 4, !tbaa !34
  br i1 %450, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %491 = trunc i64 %464 to i32
  %492 = or disjoint i32 %491, 4
  %493 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %492
  %494 = load float, ptr addrspace(3) %493, align 4, !tbaa !34
  %495 = or disjoint i64 %467, 4
  %496 = getelementptr inbounds float, ptr %9, i64 %495
  store float %494, ptr %496, align 16, !tbaa !34
  br i1 %451, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %497 = trunc i64 %464 to i32
  %498 = or disjoint i32 %497, 5
  %499 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %498
  %500 = load float, ptr addrspace(3) %499, align 4, !tbaa !34
  %501 = or disjoint i64 %467, 5
  %502 = getelementptr inbounds float, ptr %9, i64 %501
  store float %500, ptr %502, align 4, !tbaa !34
  br i1 %452, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %503 = trunc i64 %464 to i32
  %504 = or disjoint i32 %503, 6
  %505 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %504
  %506 = load float, ptr addrspace(3) %505, align 4, !tbaa !34
  %507 = or disjoint i64 %467, 6
  %508 = getelementptr inbounds float, ptr %9, i64 %507
  store float %506, ptr %508, align 8, !tbaa !34
  br i1 %453, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %509 = trunc i64 %464 to i32
  %510 = or disjoint i32 %509, 7
  %511 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %510
  %512 = load float, ptr addrspace(3) %511, align 4, !tbaa !34
  %513 = or disjoint i64 %467, 7
  %514 = getelementptr inbounds float, ptr %9, i64 %513
  store float %512, ptr %514, align 4, !tbaa !34
  br i1 %454, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %515 = trunc i64 %464 to i32
  %516 = or disjoint i32 %515, 8
  %517 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %516
  %518 = load float, ptr addrspace(3) %517, align 4, !tbaa !34
  %519 = or disjoint i64 %467, 8
  %520 = getelementptr inbounds float, ptr %9, i64 %519
  store float %518, ptr %520, align 32, !tbaa !34
  br i1 %455, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %521 = trunc i64 %464 to i32
  %522 = or disjoint i32 %521, 9
  %523 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %522
  %524 = load float, ptr addrspace(3) %523, align 4, !tbaa !34
  %525 = or disjoint i64 %467, 9
  %526 = getelementptr inbounds float, ptr %9, i64 %525
  store float %524, ptr %526, align 4, !tbaa !34
  br i1 %456, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %527 = trunc i64 %464 to i32
  %528 = or disjoint i32 %527, 10
  %529 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %528
  %530 = load float, ptr addrspace(3) %529, align 4, !tbaa !34
  %531 = or disjoint i64 %467, 10
  %532 = getelementptr inbounds float, ptr %9, i64 %531
  store float %530, ptr %532, align 8, !tbaa !34
  br i1 %457, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %533 = trunc i64 %464 to i32
  %534 = or disjoint i32 %533, 11
  %535 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %534
  %536 = load float, ptr addrspace(3) %535, align 4, !tbaa !34
  %537 = or disjoint i64 %467, 11
  %538 = getelementptr inbounds float, ptr %9, i64 %537
  store float %536, ptr %538, align 4, !tbaa !34
  br i1 %458, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %539 = trunc i64 %464 to i32
  %540 = or disjoint i32 %539, 12
  %541 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %540
  %542 = load float, ptr addrspace(3) %541, align 4, !tbaa !34
  %543 = or disjoint i64 %467, 12
  %544 = getelementptr inbounds float, ptr %9, i64 %543
  store float %542, ptr %544, align 16, !tbaa !34
  br i1 %459, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %545 = trunc i64 %464 to i32
  %546 = or disjoint i32 %545, 13
  %547 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %546
  %548 = load float, ptr addrspace(3) %547, align 4, !tbaa !34
  %549 = or disjoint i64 %467, 13
  %550 = getelementptr inbounds float, ptr %9, i64 %549
  store float %548, ptr %550, align 4, !tbaa !34
  br i1 %460, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %551 = trunc i64 %464 to i32
  %552 = or disjoint i32 %551, 14
  %553 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %552
  %554 = load float, ptr addrspace(3) %553, align 4, !tbaa !34
  %555 = or disjoint i64 %467, 14
  %556 = getelementptr inbounds float, ptr %9, i64 %555
  store float %554, ptr %556, align 8, !tbaa !34
  br i1 %461, label %557, label %.split.us.i

557:                                              ; preds = %.preheader.split.15.i
  %558 = trunc i64 %464 to i32
  %559 = or disjoint i32 %558, 15
  %560 = getelementptr inbounds float, ptr addrspace(3) %444, i32 %559
  %561 = load float, ptr addrspace(3) %560, align 4, !tbaa !34
  %562 = or disjoint i64 %467, 15
  %563 = getelementptr inbounds float, ptr %9, i64 %562
  store float %561, ptr %563, align 4, !tbaa !34
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
