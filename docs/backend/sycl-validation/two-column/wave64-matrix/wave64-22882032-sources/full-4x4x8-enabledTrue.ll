;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-nnendea8/kernel.cpp"
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
  %11 = icmp ult i64 %10, 536870911
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 536870911
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 268435455
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 4
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp ult i64 %18, 4
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp ult i64 %20, 8
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 536870912
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 536870912
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 268435456
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 536870911
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp ult i64 %30, 8
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp ult i64 %32, 4
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 4
  call void @llvm.assume(i1 %35)
  %36 = shl nuw nsw i64 %34, 5
  %37 = shl nuw nsw i64 %32, 3
  %38 = or disjoint i64 %36, %37
  %39 = or disjoint i64 %38, %30
  %40 = shl i32 %.tr.i, 8
  %41 = sext i32 %3 to i64
  %42 = sext i32 %5 to i64
  %43 = sext i32 %40 to i64
  %44 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %45 = inttoptr i32 %44 to ptr addrspace(3)
  %46 = getelementptr inbounds i8, ptr addrspace(3) %45, i32 512
  br label %64

.lr.ph571.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %48 = icmp ult i64 %47, 8
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %50 = icmp ult i64 %49, 4
  call void @llvm.assume(i1 %50)
  %51 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %52 = icmp ult i64 %51, 4
  call void @llvm.assume(i1 %52)
  %53 = shl nuw nsw i64 %51, 5
  %54 = shl nuw nsw i64 %49, 3
  %55 = or disjoint i64 %53, %54
  %56 = or disjoint i64 %55, %47
  %57 = shl i32 %.tr.i, 9
  %58 = sext i32 %5 to i64
  %59 = sext i32 %4 to i64
  %60 = sext i32 %57 to i64
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr inbounds i8, ptr addrspace(3) %62, i32 1024
  br label %96

64:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %65 = phi i64 [ %39, %6 ], [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %.frozen.i = freeze i64 %65
  %66 = sdiv i64 %.frozen.i, 32
  %67 = srem i64 %66, 8
  %68 = mul i64 %66, 32
  %.decomposed.i = sub i64 %.frozen.i, %68
  %69 = icmp slt i64 %67, %41
  %70 = icmp slt i64 %.decomposed.i, %42
  %71 = and i1 %70, %69
  br i1 %71, label %72, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

72:                                               ; preds = %64
  %.tr555.i = trunc i64 %67 to i32
  %73 = shl nsw i32 %.tr555.i, 5
  %74 = sext i32 %73 to i64
  %75 = add nsw i64 %.decomposed.i, %43
  %76 = add nsw i64 %75, %74
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0263.0.copyload.i = load i16, ptr %77, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %72, %64
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %72 ], [ 0, %64 ]
  %srem556.i = srem i64 %65, 256
  %78 = trunc i64 %srem556.i to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %46, i32 %78
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %79, align 2, !tbaa.struct !23
  %80 = add i64 %65, 128
  %81 = icmp slt i64 %80, 256
  br i1 %81, label %64, label %.lr.ph571.i, !llvm.loop !28

.lr.ph574.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %83 = icmp ult i64 %82, 8
  call void @llvm.assume(i1 %83)
  %84 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %85 = icmp ult i64 %84, 4
  call void @llvm.assume(i1 %85)
  %86 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %87 = icmp ult i64 %86, 4
  call void @llvm.assume(i1 %87)
  %88 = shl nuw nsw i64 %86, 5
  %89 = shl nuw nsw i64 %84, 3
  %90 = or disjoint i64 %88, %89
  %91 = or disjoint i64 %90, %82
  %92 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %93 = inttoptr i32 %92 to ptr addrspace(3)
  %94 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 512
  %95 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 1024
  br label %118

96:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i, %.lr.ph571.i
  %97 = phi i64 [ %56, %.lr.ph571.i ], [ %112, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i ]
  %.frozen582.i = freeze i64 %97
  %98 = sdiv i64 %.frozen582.i, 16
  %99 = srem i64 %98, 32
  %100 = mul i64 %98, 16
  %.decomposed583.i = sub i64 %.frozen582.i, %100
  %101 = icmp slt i64 %99, %58
  %102 = icmp slt i64 %.decomposed583.i, %59
  %103 = and i1 %102, %101
  br i1 %103, label %104, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

104:                                              ; preds = %96
  %.tr553.i = trunc i64 %99 to i32
  %105 = shl nsw i32 %.tr553.i, 4
  %106 = sext i32 %105 to i64
  %107 = add nsw i64 %.decomposed583.i, %60
  %108 = add nsw i64 %107, %106
  %109 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %108
  %.sroa.0248.0.copyload.i = load i16, ptr %109, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i.i: ; preds = %104, %96
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %104 ], [ 0, %96 ]
  %srem554.i = srem i64 %97, 512
  %110 = trunc i64 %srem554.i to i32
  %111 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %110
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %111, align 2, !tbaa.struct !23
  %112 = add i64 %97, 128
  %113 = icmp slt i64 %112, 512
  br i1 %113, label %96, label %.lr.ph574.i, !llvm.loop !32

._crit_edge575.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %116 = icmp ult i64 %115, 4
  call void @llvm.assume(i1 %116)
  %117 = icmp eq i64 %115, 0
  br i1 %117, label %332, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

118:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.lr.ph574.i
  %119 = phi i64 [ %91, %.lr.ph574.i ], [ %126, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %.frozen584.i = freeze i64 %119
  %120 = sdiv i64 %.frozen584.i, 16
  %121 = srem i64 %120, 8
  %122 = mul i64 %120, 16
  %.decomposed585.i = sub i64 %.frozen584.i, %122
  %123 = shl nsw i64 %121, 5
  br label %128

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %srem.i = srem i64 %119, 128
  %124 = trunc i64 %srem.i to i32
  %125 = getelementptr inbounds float, ptr addrspace(3) %93, i32 %124
  store float %329, ptr addrspace(3) %125, align 4, !tbaa !33
  %126 = add i64 %119, 128
  %127 = icmp ugt i64 %119, 9223372036854775679
  br i1 %127, label %118, label %._crit_edge575.i, !llvm.loop !35

128:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %118
  %129 = phi i64 [ 0, %118 ], [ %330, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %130 = phi float [ 0.000000e+00, %118 ], [ %329, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %131 = add nuw nsw i64 %129, %123
  %132 = trunc i64 %131 to i32
  %133 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %132
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %133, align 2, !tbaa.struct !23
  %134 = shl nuw nsw i64 %129, 4
  %135 = add nsw i64 %134, %.decomposed585.i
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %136
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %137, align 2, !tbaa.struct !23
  %138 = zext i16 %.sroa.0233.0.copyload.i to i32
  %139 = lshr i32 %138, 10
  %140 = and i32 %139, 31
  %141 = and i32 %138, 1023
  switch i32 %140, label %147 [
    i32 31, label %142
    i32 0, label %149
  ]

142:                                              ; preds = %128
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %143 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %141, 0
  %144 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %145 = or disjoint i32 %144, %143
  %146 = bitcast i32 %145 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

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
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %156 = select contract i1 %.not522523.i, float %155, float %154
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %149, %142
  %157 = phi float [ %146, %142 ], [ %156, %149 ]
  %158 = zext i16 %.sroa.0224.0.copyload.i to i32
  %159 = lshr i32 %158, 10
  %160 = and i32 %159, 31
  %161 = and i32 %158, 1023
  switch i32 %160, label %167 [
    i32 31, label %162
    i32 0, label %169
  ]

162:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %163 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %161, 0
  %164 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %165 = or disjoint i32 %164, %163
  %166 = bitcast i32 %165 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

167:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %168 = or disjoint i32 %161, 1024
  br label %169

169:                                              ; preds = %167, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %170 = phi i32 [ %168, %167 ], [ %161, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %171 = uitofp i32 %170 to float
  %.not524.i = icmp eq i32 %160, 0
  %172 = add nsw i32 %160, -25
  %173 = select i1 %.not524.i, i32 -24, i32 %172
  %174 = call float @__ocml_ldexp_f32(float noundef %171, i32 noundef %173) #5
  %175 = fneg contract float %174
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %176 = select contract i1 %.not525526.i, float %175, float %174
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i: ; preds = %169, %162
  %177 = phi float [ %166, %162 ], [ %176, %169 ]
  %178 = fmul contract float %157, %177
  %179 = fadd contract float %130, %178
  %180 = or disjoint i64 %129, 1
  %181 = add nuw nsw i64 %180, %123
  %182 = trunc i64 %181 to i32
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %182
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %183, align 2, !tbaa.struct !23
  %184 = shl nuw nsw i64 %180, 4
  %185 = add nsw i64 %184, %.decomposed585.i
  %186 = trunc i64 %185 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %186
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %187, align 2, !tbaa.struct !23
  %188 = zext i16 %.sroa.0215.0.copyload.i to i32
  %189 = lshr i32 %188, 10
  %190 = and i32 %189, 31
  %191 = and i32 %188, 1023
  switch i32 %190, label %197 [
    i32 31, label %192
    i32 0, label %199
  ]

192:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %193 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %191, 0
  %194 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %195 = or disjoint i32 %194, %193
  %196 = bitcast i32 %195 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

197:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %198 = or disjoint i32 %191, 1024
  br label %199

199:                                              ; preds = %197, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i
  %200 = phi i32 [ %198, %197 ], [ %191, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i.i ]
  %201 = uitofp i32 %200 to float
  %.not527.i = icmp eq i32 %190, 0
  %202 = add nsw i32 %190, -25
  %203 = select i1 %.not527.i, i32 -24, i32 %202
  %204 = call float @__ocml_ldexp_f32(float noundef %201, i32 noundef %203) #5
  %205 = fneg contract float %204
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %206 = select contract i1 %.not528529.i, float %205, float %204
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i: ; preds = %199, %192
  %207 = phi float [ %196, %192 ], [ %206, %199 ]
  %208 = zext i16 %.sroa.0206.0.copyload.i to i32
  %209 = lshr i32 %208, 10
  %210 = and i32 %209, 31
  %211 = and i32 %208, 1023
  switch i32 %210, label %217 [
    i32 31, label %212
    i32 0, label %219
  ]

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %213 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %211, 0
  %214 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %215 = or disjoint i32 %214, %213
  %216 = bitcast i32 %215 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %218 = or disjoint i32 %211, 1024
  br label %219

219:                                              ; preds = %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i
  %220 = phi i32 [ %218, %217 ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i.i ]
  %221 = uitofp i32 %220 to float
  %.not530.i = icmp eq i32 %210, 0
  %222 = add nsw i32 %210, -25
  %223 = select i1 %.not530.i, i32 -24, i32 %222
  %224 = call float @__ocml_ldexp_f32(float noundef %221, i32 noundef %223) #5
  %225 = fneg contract float %224
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %226 = select contract i1 %.not531532.i, float %225, float %224
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i: ; preds = %219, %212
  %227 = phi float [ %216, %212 ], [ %226, %219 ]
  %228 = fmul contract float %207, %227
  %229 = fadd contract float %179, %228
  %230 = or disjoint i64 %129, 2
  %231 = add nuw nsw i64 %230, %123
  %232 = trunc i64 %231 to i32
  %233 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %232
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %233, align 2, !tbaa.struct !23
  %234 = shl nuw nsw i64 %230, 4
  %235 = add nsw i64 %234, %.decomposed585.i
  %236 = trunc i64 %235 to i32
  %237 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %236
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %237, align 2, !tbaa.struct !23
  %238 = zext i16 %.sroa.0197.0.copyload.i to i32
  %239 = lshr i32 %238, 10
  %240 = and i32 %239, 31
  %241 = and i32 %238, 1023
  switch i32 %240, label %247 [
    i32 31, label %242
    i32 0, label %249
  ]

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %243 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %241, 0
  %244 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %245 = or disjoint i32 %244, %243
  %246 = bitcast i32 %245 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

247:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %248 = or disjoint i32 %241, 1024
  br label %249

249:                                              ; preds = %247, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i
  %250 = phi i32 [ %248, %247 ], [ %241, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i.i ]
  %251 = uitofp i32 %250 to float
  %.not533.i = icmp eq i32 %240, 0
  %252 = add nsw i32 %240, -25
  %253 = select i1 %.not533.i, i32 -24, i32 %252
  %254 = call float @__ocml_ldexp_f32(float noundef %251, i32 noundef %253) #5
  %255 = fneg contract float %254
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %256 = select contract i1 %.not534535.i, float %255, float %254
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i: ; preds = %249, %242
  %257 = phi float [ %246, %242 ], [ %256, %249 ]
  %258 = zext i16 %.sroa.0188.0.copyload.i to i32
  %259 = lshr i32 %258, 10
  %260 = and i32 %259, 31
  %261 = and i32 %258, 1023
  switch i32 %260, label %267 [
    i32 31, label %262
    i32 0, label %269
  ]

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %263 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %261, 0
  %264 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %265 = or disjoint i32 %264, %263
  %266 = bitcast i32 %265 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %268 = or disjoint i32 %261, 1024
  br label %269

269:                                              ; preds = %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i
  %270 = phi i32 [ %268, %267 ], [ %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i.i ]
  %271 = uitofp i32 %270 to float
  %.not536.i = icmp eq i32 %260, 0
  %272 = add nsw i32 %260, -25
  %273 = select i1 %.not536.i, i32 -24, i32 %272
  %274 = call float @__ocml_ldexp_f32(float noundef %271, i32 noundef %273) #5
  %275 = fneg contract float %274
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %276 = select contract i1 %.not537538.i, float %275, float %274
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i: ; preds = %269, %262
  %277 = phi float [ %266, %262 ], [ %276, %269 ]
  %278 = fmul contract float %257, %277
  %279 = fadd contract float %229, %278
  %280 = or disjoint i64 %129, 3
  %281 = add nuw nsw i64 %280, %123
  %282 = trunc i64 %281 to i32
  %283 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %282
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %283, align 2, !tbaa.struct !23
  %284 = shl nuw nsw i64 %280, 4
  %285 = add nsw i64 %284, %.decomposed585.i
  %286 = trunc i64 %285 to i32
  %287 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %286
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %287, align 2, !tbaa.struct !23
  %288 = zext i16 %.sroa.0179.0.copyload.i to i32
  %289 = lshr i32 %288, 10
  %290 = and i32 %289, 31
  %291 = and i32 %288, 1023
  switch i32 %290, label %297 [
    i32 31, label %292
    i32 0, label %299
  ]

292:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %293 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %291, 0
  %294 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %295 = or disjoint i32 %294, %293
  %296 = bitcast i32 %295 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

297:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %298 = or disjoint i32 %291, 1024
  br label %299

299:                                              ; preds = %297, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i
  %300 = phi i32 [ %298, %297 ], [ %291, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i.i ]
  %301 = uitofp i32 %300 to float
  %.not539.i = icmp eq i32 %290, 0
  %302 = add nsw i32 %290, -25
  %303 = select i1 %.not539.i, i32 -24, i32 %302
  %304 = call float @__ocml_ldexp_f32(float noundef %301, i32 noundef %303) #5
  %305 = fneg contract float %304
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %306 = select contract i1 %.not540541.i, float %305, float %304
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i: ; preds = %299, %292
  %307 = phi float [ %296, %292 ], [ %306, %299 ]
  %308 = zext i16 %.sroa.0170.0.copyload.i to i32
  %309 = lshr i32 %308, 10
  %310 = and i32 %309, 31
  %311 = and i32 %308, 1023
  switch i32 %310, label %317 [
    i32 31, label %312
    i32 0, label %319
  ]

312:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %313 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %311, 0
  %314 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %315 = or disjoint i32 %314, %313
  %316 = bitcast i32 %315 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

317:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %318 = or disjoint i32 %311, 1024
  br label %319

319:                                              ; preds = %317, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i
  %320 = phi i32 [ %318, %317 ], [ %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i.i ]
  %321 = uitofp i32 %320 to float
  %.not542.i = icmp eq i32 %310, 0
  %322 = add nsw i32 %310, -25
  %323 = select i1 %.not542.i, i32 -24, i32 %322
  %324 = call float @__ocml_ldexp_f32(float noundef %321, i32 noundef %323) #5
  %325 = fneg contract float %324
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %326 = select contract i1 %.not543544.i, float %325, float %324
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %319, %312
  %327 = phi float [ %316, %312 ], [ %326, %319 ]
  %328 = fmul contract float %307, %327
  %329 = fadd contract float %279, %328
  %330 = add nuw nsw i64 %129, 4
  %331 = icmp ult i64 %129, 28
  br i1 %331, label %128, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !36

332:                                              ; preds = %._crit_edge575.i
  %333 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %334 = icmp ult i64 %333, 4
  call void @llvm.assume(i1 %334)
  %335 = icmp eq i64 %333, 0
  br i1 %335, label %336, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

336:                                              ; preds = %332
  %337 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %338 = icmp ult i64 %337, 8
  call void @llvm.assume(i1 %338)
  %339 = icmp eq i64 %337, 0
  br i1 %339, label %.preheader562.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

.preheader562.i:                                  ; preds = %336
  %340 = sext i32 %3 to i64
  %341 = call i32 @llvm.amdgcn.groupstaticsize()
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = sext i32 %114 to i64
  %344 = icmp sgt i32 %4, 0
  %345 = icmp ugt i32 %4, 1
  %346 = icmp ugt i32 %4, 2
  %347 = icmp ugt i32 %4, 3
  %348 = icmp ugt i32 %4, 4
  %349 = icmp ugt i32 %4, 5
  %350 = icmp ugt i32 %4, 6
  %351 = icmp ugt i32 %4, 7
  %352 = icmp ugt i32 %4, 8
  %353 = icmp ugt i32 %4, 9
  %354 = icmp ugt i32 %4, 10
  %355 = icmp ugt i32 %4, 11
  %356 = icmp ugt i32 %4, 12
  %357 = icmp ugt i32 %4, 13
  %358 = icmp ugt i32 %4, 14
  %359 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %.preheader562.i
  %360 = phi i64 [ 0, %.preheader562.i ], [ %366, %.split.us.i ]
  %361 = icmp slt i64 %360, %340
  %362 = shl i64 %360, 4
  %.tr521.i = trunc i64 %360 to i32
  %363 = shl i32 %.tr521.i, 4
  %364 = sext i32 %363 to i64
  %365 = add nsw i64 %364, %343
  %.fr.i = freeze i1 %361
  %brmerge.not.i = select i1 %.fr.i, i1 %344, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %455, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %366 = add nuw nsw i64 %360, 1
  %exitcond.not.i = icmp eq i64 %366, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %367 = trunc i64 %362 to i32
  %368 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %367
  %369 = load float, ptr addrspace(3) %368, align 4, !tbaa !33
  %370 = getelementptr inbounds float, ptr %9, i64 %365
  store float %369, ptr %370, align 32, !tbaa !33
  br i1 %345, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %371 = trunc i64 %362 to i32
  %372 = or disjoint i32 %371, 1
  %373 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %372
  %374 = load float, ptr addrspace(3) %373, align 4, !tbaa !33
  %375 = or disjoint i64 %365, 1
  %376 = getelementptr inbounds float, ptr %9, i64 %375
  store float %374, ptr %376, align 4, !tbaa !33
  br i1 %346, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %377 = trunc i64 %362 to i32
  %378 = or disjoint i32 %377, 2
  %379 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !33
  %381 = or disjoint i64 %365, 2
  %382 = getelementptr inbounds float, ptr %9, i64 %381
  store float %380, ptr %382, align 8, !tbaa !33
  br i1 %347, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %383 = trunc i64 %362 to i32
  %384 = or disjoint i32 %383, 3
  %385 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !33
  %387 = or disjoint i64 %365, 3
  %388 = getelementptr inbounds float, ptr %9, i64 %387
  store float %386, ptr %388, align 4, !tbaa !33
  br i1 %348, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %389 = trunc i64 %362 to i32
  %390 = or disjoint i32 %389, 4
  %391 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !33
  %393 = or disjoint i64 %365, 4
  %394 = getelementptr inbounds float, ptr %9, i64 %393
  store float %392, ptr %394, align 16, !tbaa !33
  br i1 %349, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %395 = trunc i64 %362 to i32
  %396 = or disjoint i32 %395, 5
  %397 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %396
  %398 = load float, ptr addrspace(3) %397, align 4, !tbaa !33
  %399 = or disjoint i64 %365, 5
  %400 = getelementptr inbounds float, ptr %9, i64 %399
  store float %398, ptr %400, align 4, !tbaa !33
  br i1 %350, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %401 = trunc i64 %362 to i32
  %402 = or disjoint i32 %401, 6
  %403 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %402
  %404 = load float, ptr addrspace(3) %403, align 4, !tbaa !33
  %405 = or disjoint i64 %365, 6
  %406 = getelementptr inbounds float, ptr %9, i64 %405
  store float %404, ptr %406, align 8, !tbaa !33
  br i1 %351, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %407 = trunc i64 %362 to i32
  %408 = or disjoint i32 %407, 7
  %409 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %408
  %410 = load float, ptr addrspace(3) %409, align 4, !tbaa !33
  %411 = or disjoint i64 %365, 7
  %412 = getelementptr inbounds float, ptr %9, i64 %411
  store float %410, ptr %412, align 4, !tbaa !33
  br i1 %352, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %413 = trunc i64 %362 to i32
  %414 = or disjoint i32 %413, 8
  %415 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %414
  %416 = load float, ptr addrspace(3) %415, align 4, !tbaa !33
  %417 = or disjoint i64 %365, 8
  %418 = getelementptr inbounds float, ptr %9, i64 %417
  store float %416, ptr %418, align 32, !tbaa !33
  br i1 %353, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %419 = trunc i64 %362 to i32
  %420 = or disjoint i32 %419, 9
  %421 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %420
  %422 = load float, ptr addrspace(3) %421, align 4, !tbaa !33
  %423 = or disjoint i64 %365, 9
  %424 = getelementptr inbounds float, ptr %9, i64 %423
  store float %422, ptr %424, align 4, !tbaa !33
  br i1 %354, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %425 = trunc i64 %362 to i32
  %426 = or disjoint i32 %425, 10
  %427 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !33
  %429 = or disjoint i64 %365, 10
  %430 = getelementptr inbounds float, ptr %9, i64 %429
  store float %428, ptr %430, align 8, !tbaa !33
  br i1 %355, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %431 = trunc i64 %362 to i32
  %432 = or disjoint i32 %431, 11
  %433 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %432
  %434 = load float, ptr addrspace(3) %433, align 4, !tbaa !33
  %435 = or disjoint i64 %365, 11
  %436 = getelementptr inbounds float, ptr %9, i64 %435
  store float %434, ptr %436, align 4, !tbaa !33
  br i1 %356, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %437 = trunc i64 %362 to i32
  %438 = or disjoint i32 %437, 12
  %439 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !33
  %441 = or disjoint i64 %365, 12
  %442 = getelementptr inbounds float, ptr %9, i64 %441
  store float %440, ptr %442, align 16, !tbaa !33
  br i1 %357, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %443 = trunc i64 %362 to i32
  %444 = or disjoint i32 %443, 13
  %445 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %444
  %446 = load float, ptr addrspace(3) %445, align 4, !tbaa !33
  %447 = or disjoint i64 %365, 13
  %448 = getelementptr inbounds float, ptr %9, i64 %447
  store float %446, ptr %448, align 4, !tbaa !33
  br i1 %358, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %449 = trunc i64 %362 to i32
  %450 = or disjoint i32 %449, 14
  %451 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %450
  %452 = load float, ptr addrspace(3) %451, align 4, !tbaa !33
  %453 = or disjoint i64 %365, 14
  %454 = getelementptr inbounds float, ptr %9, i64 %453
  store float %452, ptr %454, align 8, !tbaa !33
  br i1 %359, label %455, label %.split.us.i

455:                                              ; preds = %.preheader.split.15.i
  %456 = trunc i64 %362 to i32
  %457 = or disjoint i32 %456, 15
  %458 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %457
  %459 = load float, ptr addrspace(3) %458, align 4, !tbaa !33
  %460 = or disjoint i64 %365, 15
  %461 = getelementptr inbounds float, ptr %9, i64 %460
  store float %459, ptr %461, align 4, !tbaa !33
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge575.i, %332, %336, %.split.us.i
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
!33 = !{!34, !34, i64 0}
!34 = !{!"float", !26, i64 0}
!35 = distinct !{!35, !29}
!36 = distinct !{!36, !29}
!37 = distinct !{!37, !29}
;----------------- End AdaptiveCpp IR dump ---------------
