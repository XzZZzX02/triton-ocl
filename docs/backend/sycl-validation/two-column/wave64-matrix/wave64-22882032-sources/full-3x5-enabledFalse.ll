;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882032/tmp/triton-sycl-cache/compile-iyaqg3f4/kernel.cpp"
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
  %11 = icmp ult i64 %10, 715827882
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 429496729
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 3
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp ult i64 %18, 5
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 715827883
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %25 = icmp ult i64 %24, 429496730
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 715827882
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp ult i64 %32, 5
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 3
  call void @llvm.assume(i1 %35)
  %36 = mul nuw nsw i64 %34, 5
  %37 = add nuw nsw i64 %36, %32
  %38 = shl i32 %.tr.i, 8
  %39 = sext i32 %3 to i64
  %40 = sext i32 %5 to i64
  %41 = sext i32 %38 to i64
  %42 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %43 = inttoptr i32 %42 to ptr addrspace(3)
  %44 = getelementptr inbounds i8, ptr addrspace(3) %43, i32 512
  br label %60

.lr.ph570.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %46 = icmp eq i64 %45, 0
  call void @llvm.assume(i1 %46)
  %47 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %48 = icmp ult i64 %47, 5
  call void @llvm.assume(i1 %48)
  %49 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %50 = icmp ult i64 %49, 3
  call void @llvm.assume(i1 %50)
  %51 = mul nuw nsw i64 %49, 5
  %52 = add nuw nsw i64 %51, %47
  %53 = shl i32 %.tr.i, 9
  %54 = sext i32 %5 to i64
  %55 = sext i32 %4 to i64
  %56 = sext i32 %53 to i64
  %57 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %58 = inttoptr i32 %57 to ptr addrspace(3)
  %59 = getelementptr inbounds i8, ptr addrspace(3) %58, i32 1024
  br label %90

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i, %6
  %61 = phi i64 [ %37, %6 ], [ %76, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i ]
  %.frozen.i = freeze i64 %61
  %62 = sdiv i64 %.frozen.i, 32
  %63 = srem i64 %62, 8
  %64 = mul i64 %62, 32
  %.decomposed.i = sub i64 %.frozen.i, %64
  %65 = icmp slt i64 %63, %39
  %66 = icmp slt i64 %.decomposed.i, %40
  %67 = and i1 %66, %65
  br i1 %67, label %68, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i

68:                                               ; preds = %60
  %.tr555.i = trunc i64 %63 to i32
  %69 = shl nsw i32 %.tr555.i, 5
  %70 = sext i32 %69 to i64
  %71 = add nsw i64 %.decomposed.i, %41
  %72 = add nsw i64 %71, %70
  %73 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %72
  %.sroa.0263.0.copyload.i = load i16, ptr %73, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit14.i.i.i: ; preds = %68, %60
  %.sroa.0265.1.i = phi i16 [ %.sroa.0263.0.copyload.i, %68 ], [ 0, %60 ]
  %srem556.i = srem i64 %61, 256
  %74 = trunc i64 %srem556.i to i32
  %75 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %44, i32 %74
  store i16 %.sroa.0265.1.i, ptr addrspace(3) %75, align 2, !tbaa.struct !19
  %76 = add i64 %61, 15
  %77 = icmp slt i64 %76, 256
  br i1 %77, label %60, label %.lr.ph570.i, !llvm.loop !24

.lr.ph573.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %79 = icmp eq i64 %78, 0
  call void @llvm.assume(i1 %79)
  %80 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %81 = icmp ult i64 %80, 5
  call void @llvm.assume(i1 %81)
  %82 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %83 = icmp ult i64 %82, 3
  call void @llvm.assume(i1 %83)
  %84 = mul nuw nsw i64 %82, 5
  %85 = add nuw nsw i64 %84, %80
  %86 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %87 = inttoptr i32 %86 to ptr addrspace(3)
  %88 = getelementptr inbounds i8, ptr addrspace(3) %87, i32 512
  %89 = getelementptr inbounds i8, ptr addrspace(3) %87, i32 1024
  br label %112

90:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph570.i
  %91 = phi i64 [ %52, %.lr.ph570.i ], [ %106, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %.frozen581.i = freeze i64 %91
  %92 = sdiv i64 %.frozen581.i, 16
  %93 = srem i64 %92, 32
  %94 = mul i64 %92, 16
  %.decomposed582.i = sub i64 %.frozen581.i, %94
  %95 = icmp slt i64 %93, %54
  %96 = icmp slt i64 %.decomposed582.i, %55
  %97 = and i1 %96, %95
  br i1 %97, label %98, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

98:                                               ; preds = %90
  %.tr553.i = trunc i64 %93 to i32
  %99 = shl nsw i32 %.tr553.i, 4
  %100 = sext i32 %99 to i64
  %101 = add nsw i64 %.decomposed582.i, %56
  %102 = add nsw i64 %101, %100
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %102
  %.sroa.0248.0.copyload.i = load i16, ptr %103, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %98, %90
  %.sroa.0250.1.i = phi i16 [ %.sroa.0248.0.copyload.i, %98 ], [ 0, %90 ]
  %srem554.i = srem i64 %91, 512
  %104 = trunc i64 %srem554.i to i32
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %59, i32 %104
  store i16 %.sroa.0250.1.i, ptr addrspace(3) %105, align 2, !tbaa.struct !19
  %106 = add i64 %91, 15
  %107 = icmp slt i64 %106, 512
  br i1 %107, label %90, label %.lr.ph573.i, !llvm.loop !28

._crit_edge574.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = shl i32 %.tr.i, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %109 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %110 = icmp ult i64 %109, 3
  call void @llvm.assume(i1 %110)
  %111 = icmp eq i64 %109, 0
  br i1 %111, label %326, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

112:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, %.lr.ph573.i
  %113 = phi i64 [ %85, %.lr.ph573.i ], [ %120, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i ]
  %.frozen583.i = freeze i64 %113
  %114 = sdiv i64 %.frozen583.i, 16
  %115 = srem i64 %114, 8
  %116 = mul i64 %114, 16
  %.decomposed584.i = sub i64 %.frozen583.i, %116
  %117 = shl nsw i64 %115, 5
  br label %122

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %srem.i = srem i64 %113, 128
  %118 = trunc i64 %srem.i to i32
  %119 = getelementptr inbounds float, ptr addrspace(3) %87, i32 %118
  store float %323, ptr addrspace(3) %119, align 4, !tbaa !29
  %120 = add i64 %113, 15
  %121 = icmp slt i64 %120, 128
  br i1 %121, label %112, label %._crit_edge574.i, !llvm.loop !31

122:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %112
  %123 = phi i64 [ 0, %112 ], [ %324, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %124 = phi float [ 0.000000e+00, %112 ], [ %323, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %125 = add nuw nsw i64 %123, %117
  %126 = trunc i64 %125 to i32
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %88, i32 %126
  %.sroa.0233.0.copyload.i = load i16, ptr addrspace(3) %127, align 2, !tbaa.struct !19
  %128 = shl nuw nsw i64 %123, 4
  %129 = add nsw i64 %128, %.decomposed584.i
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %89, i32 %130
  %.sroa.0224.0.copyload.i = load i16, ptr addrspace(3) %131, align 2, !tbaa.struct !19
  %132 = zext i16 %.sroa.0233.0.copyload.i to i32
  %133 = lshr i32 %132, 10
  %134 = and i32 %133, 31
  %135 = and i32 %132, 1023
  switch i32 %134, label %141 [
    i32 31, label %136
    i32 0, label %143
  ]

136:                                              ; preds = %122
  %.sroa.0233.0.copyload.signext.i = sext i16 %.sroa.0233.0.copyload.i to i32
  %137 = and i32 %.sroa.0233.0.copyload.signext.i, -2147483648
  %.not552.i = icmp eq i32 %135, 0
  %138 = select i1 %.not552.i, i32 2139095040, i32 2143289344
  %139 = or disjoint i32 %138, %137
  %140 = bitcast i32 %139 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

141:                                              ; preds = %122
  %142 = or disjoint i32 %135, 1024
  br label %143

143:                                              ; preds = %141, %122
  %144 = phi i32 [ %142, %141 ], [ %135, %122 ]
  %145 = uitofp i32 %144 to float
  %.not.i = icmp eq i32 %134, 0
  %146 = add nsw i32 %134, -25
  %147 = select i1 %.not.i, i32 -24, i32 %146
  %148 = call float @__ocml_ldexp_f32(float noundef %145, i32 noundef %147) #5
  %149 = fneg contract float %148
  %.not522523.i = icmp slt i16 %.sroa.0233.0.copyload.i, 0
  %150 = select contract i1 %.not522523.i, float %149, float %148
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %143, %136
  %151 = phi float [ %140, %136 ], [ %150, %143 ]
  %152 = zext i16 %.sroa.0224.0.copyload.i to i32
  %153 = lshr i32 %152, 10
  %154 = and i32 %153, 31
  %155 = and i32 %152, 1023
  switch i32 %154, label %161 [
    i32 31, label %156
    i32 0, label %163
  ]

156:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0224.0.copyload.signext.i = sext i16 %.sroa.0224.0.copyload.i to i32
  %157 = and i32 %.sroa.0224.0.copyload.signext.i, -2147483648
  %.not551.i = icmp eq i32 %155, 0
  %158 = select i1 %.not551.i, i32 2139095040, i32 2143289344
  %159 = or disjoint i32 %158, %157
  %160 = bitcast i32 %159 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

161:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %162 = or disjoint i32 %155, 1024
  br label %163

163:                                              ; preds = %161, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %164 = phi i32 [ %162, %161 ], [ %155, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %165 = uitofp i32 %164 to float
  %.not524.i = icmp eq i32 %154, 0
  %166 = add nsw i32 %154, -25
  %167 = select i1 %.not524.i, i32 -24, i32 %166
  %168 = call float @__ocml_ldexp_f32(float noundef %165, i32 noundef %167) #5
  %169 = fneg contract float %168
  %.not525526.i = icmp slt i16 %.sroa.0224.0.copyload.i, 0
  %170 = select contract i1 %.not525526.i, float %169, float %168
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i: ; preds = %163, %156
  %171 = phi float [ %160, %156 ], [ %170, %163 ]
  %172 = fmul contract float %151, %171
  %173 = fadd contract float %124, %172
  %174 = or disjoint i64 %123, 1
  %175 = add nuw nsw i64 %174, %117
  %176 = trunc i64 %175 to i32
  %177 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %88, i32 %176
  %.sroa.0215.0.copyload.i = load i16, ptr addrspace(3) %177, align 2, !tbaa.struct !19
  %178 = shl nuw nsw i64 %174, 4
  %179 = add nsw i64 %178, %.decomposed584.i
  %180 = trunc i64 %179 to i32
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %89, i32 %180
  %.sroa.0206.0.copyload.i = load i16, ptr addrspace(3) %181, align 2, !tbaa.struct !19
  %182 = zext i16 %.sroa.0215.0.copyload.i to i32
  %183 = lshr i32 %182, 10
  %184 = and i32 %183, 31
  %185 = and i32 %182, 1023
  switch i32 %184, label %191 [
    i32 31, label %186
    i32 0, label %193
  ]

186:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %.sroa.0215.0.copyload.signext.i = sext i16 %.sroa.0215.0.copyload.i to i32
  %187 = and i32 %.sroa.0215.0.copyload.signext.i, -2147483648
  %.not550.i = icmp eq i32 %185, 0
  %188 = select i1 %.not550.i, i32 2139095040, i32 2143289344
  %189 = or disjoint i32 %188, %187
  %190 = bitcast i32 %189 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

191:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %192 = or disjoint i32 %185, 1024
  br label %193

193:                                              ; preds = %191, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i
  %194 = phi i32 [ %192, %191 ], [ %185, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit10.i.i.i ]
  %195 = uitofp i32 %194 to float
  %.not527.i = icmp eq i32 %184, 0
  %196 = add nsw i32 %184, -25
  %197 = select i1 %.not527.i, i32 -24, i32 %196
  %198 = call float @__ocml_ldexp_f32(float noundef %195, i32 noundef %197) #5
  %199 = fneg contract float %198
  %.not528529.i = icmp slt i16 %.sroa.0215.0.copyload.i, 0
  %200 = select contract i1 %.not528529.i, float %199, float %198
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i: ; preds = %193, %186
  %201 = phi float [ %190, %186 ], [ %200, %193 ]
  %202 = zext i16 %.sroa.0206.0.copyload.i to i32
  %203 = lshr i32 %202, 10
  %204 = and i32 %203, 31
  %205 = and i32 %202, 1023
  switch i32 %204, label %211 [
    i32 31, label %206
    i32 0, label %213
  ]

206:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %.sroa.0206.0.copyload.signext.i = sext i16 %.sroa.0206.0.copyload.i to i32
  %207 = and i32 %.sroa.0206.0.copyload.signext.i, -2147483648
  %.not549.i = icmp eq i32 %205, 0
  %208 = select i1 %.not549.i, i32 2139095040, i32 2143289344
  %209 = or disjoint i32 %208, %207
  %210 = bitcast i32 %209 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

211:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %212 = or disjoint i32 %205, 1024
  br label %213

213:                                              ; preds = %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i
  %214 = phi i32 [ %212, %211 ], [ %205, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit9.i.i.i ]
  %215 = uitofp i32 %214 to float
  %.not530.i = icmp eq i32 %204, 0
  %216 = add nsw i32 %204, -25
  %217 = select i1 %.not530.i, i32 -24, i32 %216
  %218 = call float @__ocml_ldexp_f32(float noundef %215, i32 noundef %217) #5
  %219 = fneg contract float %218
  %.not531532.i = icmp slt i16 %.sroa.0206.0.copyload.i, 0
  %220 = select contract i1 %.not531532.i, float %219, float %218
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i: ; preds = %213, %206
  %221 = phi float [ %210, %206 ], [ %220, %213 ]
  %222 = fmul contract float %201, %221
  %223 = fadd contract float %173, %222
  %224 = or disjoint i64 %123, 2
  %225 = add nuw nsw i64 %224, %117
  %226 = trunc i64 %225 to i32
  %227 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %88, i32 %226
  %.sroa.0197.0.copyload.i = load i16, ptr addrspace(3) %227, align 2, !tbaa.struct !19
  %228 = shl nuw nsw i64 %224, 4
  %229 = add nsw i64 %228, %.decomposed584.i
  %230 = trunc i64 %229 to i32
  %231 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %89, i32 %230
  %.sroa.0188.0.copyload.i = load i16, ptr addrspace(3) %231, align 2, !tbaa.struct !19
  %232 = zext i16 %.sroa.0197.0.copyload.i to i32
  %233 = lshr i32 %232, 10
  %234 = and i32 %233, 31
  %235 = and i32 %232, 1023
  switch i32 %234, label %241 [
    i32 31, label %236
    i32 0, label %243
  ]

236:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %.sroa.0197.0.copyload.signext.i = sext i16 %.sroa.0197.0.copyload.i to i32
  %237 = and i32 %.sroa.0197.0.copyload.signext.i, -2147483648
  %.not548.i = icmp eq i32 %235, 0
  %238 = select i1 %.not548.i, i32 2139095040, i32 2143289344
  %239 = or disjoint i32 %238, %237
  %240 = bitcast i32 %239 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

241:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %242 = or disjoint i32 %235, 1024
  br label %243

243:                                              ; preds = %241, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i
  %244 = phi i32 [ %242, %241 ], [ %235, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit8.i.i.i ]
  %245 = uitofp i32 %244 to float
  %.not533.i = icmp eq i32 %234, 0
  %246 = add nsw i32 %234, -25
  %247 = select i1 %.not533.i, i32 -24, i32 %246
  %248 = call float @__ocml_ldexp_f32(float noundef %245, i32 noundef %247) #5
  %249 = fneg contract float %248
  %.not534535.i = icmp slt i16 %.sroa.0197.0.copyload.i, 0
  %250 = select contract i1 %.not534535.i, float %249, float %248
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i: ; preds = %243, %236
  %251 = phi float [ %240, %236 ], [ %250, %243 ]
  %252 = zext i16 %.sroa.0188.0.copyload.i to i32
  %253 = lshr i32 %252, 10
  %254 = and i32 %253, 31
  %255 = and i32 %252, 1023
  switch i32 %254, label %261 [
    i32 31, label %256
    i32 0, label %263
  ]

256:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %.sroa.0188.0.copyload.signext.i = sext i16 %.sroa.0188.0.copyload.i to i32
  %257 = and i32 %.sroa.0188.0.copyload.signext.i, -2147483648
  %.not547.i = icmp eq i32 %255, 0
  %258 = select i1 %.not547.i, i32 2139095040, i32 2143289344
  %259 = or disjoint i32 %258, %257
  %260 = bitcast i32 %259 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

261:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %262 = or disjoint i32 %255, 1024
  br label %263

263:                                              ; preds = %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i
  %264 = phi i32 [ %262, %261 ], [ %255, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit7.i.i.i ]
  %265 = uitofp i32 %264 to float
  %.not536.i = icmp eq i32 %254, 0
  %266 = add nsw i32 %254, -25
  %267 = select i1 %.not536.i, i32 -24, i32 %266
  %268 = call float @__ocml_ldexp_f32(float noundef %265, i32 noundef %267) #5
  %269 = fneg contract float %268
  %.not537538.i = icmp slt i16 %.sroa.0188.0.copyload.i, 0
  %270 = select contract i1 %.not537538.i, float %269, float %268
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i: ; preds = %263, %256
  %271 = phi float [ %260, %256 ], [ %270, %263 ]
  %272 = fmul contract float %251, %271
  %273 = fadd contract float %223, %272
  %274 = or disjoint i64 %123, 3
  %275 = add nuw nsw i64 %274, %117
  %276 = trunc i64 %275 to i32
  %277 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %88, i32 %276
  %.sroa.0179.0.copyload.i = load i16, ptr addrspace(3) %277, align 2, !tbaa.struct !19
  %278 = shl nuw nsw i64 %274, 4
  %279 = add nsw i64 %278, %.decomposed584.i
  %280 = trunc i64 %279 to i32
  %281 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %89, i32 %280
  %.sroa.0170.0.copyload.i = load i16, ptr addrspace(3) %281, align 2, !tbaa.struct !19
  %282 = zext i16 %.sroa.0179.0.copyload.i to i32
  %283 = lshr i32 %282, 10
  %284 = and i32 %283, 31
  %285 = and i32 %282, 1023
  switch i32 %284, label %291 [
    i32 31, label %286
    i32 0, label %293
  ]

286:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %.sroa.0179.0.copyload.signext.i = sext i16 %.sroa.0179.0.copyload.i to i32
  %287 = and i32 %.sroa.0179.0.copyload.signext.i, -2147483648
  %.not546.i = icmp eq i32 %285, 0
  %288 = select i1 %.not546.i, i32 2139095040, i32 2143289344
  %289 = or disjoint i32 %288, %287
  %290 = bitcast i32 %289 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

291:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %292 = or disjoint i32 %285, 1024
  br label %293

293:                                              ; preds = %291, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i
  %294 = phi i32 [ %292, %291 ], [ %285, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit6.i.i.i ]
  %295 = uitofp i32 %294 to float
  %.not539.i = icmp eq i32 %284, 0
  %296 = add nsw i32 %284, -25
  %297 = select i1 %.not539.i, i32 -24, i32 %296
  %298 = call float @__ocml_ldexp_f32(float noundef %295, i32 noundef %297) #5
  %299 = fneg contract float %298
  %.not540541.i = icmp slt i16 %.sroa.0179.0.copyload.i, 0
  %300 = select contract i1 %.not540541.i, float %299, float %298
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i: ; preds = %293, %286
  %301 = phi float [ %290, %286 ], [ %300, %293 ]
  %302 = zext i16 %.sroa.0170.0.copyload.i to i32
  %303 = lshr i32 %302, 10
  %304 = and i32 %303, 31
  %305 = and i32 %302, 1023
  switch i32 %304, label %311 [
    i32 31, label %306
    i32 0, label %313
  ]

306:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %.sroa.0170.0.copyload.signext.i = sext i16 %.sroa.0170.0.copyload.i to i32
  %307 = and i32 %.sroa.0170.0.copyload.signext.i, -2147483648
  %.not545.i = icmp eq i32 %305, 0
  %308 = select i1 %.not545.i, i32 2139095040, i32 2143289344
  %309 = or disjoint i32 %308, %307
  %310 = bitcast i32 %309 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

311:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %312 = or disjoint i32 %305, 1024
  br label %313

313:                                              ; preds = %311, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i
  %314 = phi i32 [ %312, %311 ], [ %305, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit5.i.i.i ]
  %315 = uitofp i32 %314 to float
  %.not542.i = icmp eq i32 %304, 0
  %316 = add nsw i32 %304, -25
  %317 = select i1 %.not542.i, i32 -24, i32 %316
  %318 = call float @__ocml_ldexp_f32(float noundef %315, i32 noundef %317) #5
  %319 = fneg contract float %318
  %.not543544.i = icmp slt i16 %.sroa.0170.0.copyload.i, 0
  %320 = select contract i1 %.not543544.i, float %319, float %318
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %313, %306
  %321 = phi float [ %310, %306 ], [ %320, %313 ]
  %322 = fmul contract float %301, %321
  %323 = fadd contract float %273, %322
  %324 = add nuw nsw i64 %123, 4
  %325 = icmp ult i64 %123, 28
  br i1 %325, label %122, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit4.i.i.i, !llvm.loop !32

326:                                              ; preds = %._crit_edge574.i
  %327 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %328 = icmp ult i64 %327, 5
  call void @llvm.assume(i1 %328)
  %329 = icmp eq i64 %327, 0
  br i1 %329, label %330, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

330:                                              ; preds = %326
  %331 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %332 = icmp eq i64 %331, 0
  call void @llvm.assume(i1 %332)
  %333 = sext i32 %3 to i64
  %334 = call i32 @llvm.amdgcn.groupstaticsize()
  %335 = inttoptr i32 %334 to ptr addrspace(3)
  %336 = sext i32 %108 to i64
  %337 = icmp sgt i32 %4, 0
  %338 = icmp ugt i32 %4, 1
  %339 = icmp ugt i32 %4, 2
  %340 = icmp ugt i32 %4, 3
  %341 = icmp ugt i32 %4, 4
  %342 = icmp ugt i32 %4, 5
  %343 = icmp ugt i32 %4, 6
  %344 = icmp ugt i32 %4, 7
  %345 = icmp ugt i32 %4, 8
  %346 = icmp ugt i32 %4, 9
  %347 = icmp ugt i32 %4, 10
  %348 = icmp ugt i32 %4, 11
  %349 = icmp ugt i32 %4, 12
  %350 = icmp ugt i32 %4, 13
  %351 = icmp ugt i32 %4, 14
  %352 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %330
  %353 = phi i64 [ 0, %330 ], [ %359, %.split.us.i ]
  %354 = icmp slt i64 %353, %333
  %355 = shl i64 %353, 4
  %.tr521.i = trunc i64 %353 to i32
  %356 = shl i32 %.tr521.i, 4
  %357 = sext i32 %356 to i64
  %358 = add nsw i64 %357, %336
  %.fr.i = freeze i1 %354
  %brmerge.not.i = select i1 %.fr.i, i1 %337, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %448, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %359 = add nuw nsw i64 %353, 1
  %exitcond.not.i = icmp eq i64 %359, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !33

.preheader.split.1.i:                             ; preds = %.preheader.i
  %360 = trunc i64 %355 to i32
  %361 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %360
  %362 = load float, ptr addrspace(3) %361, align 4, !tbaa !29
  %363 = getelementptr inbounds float, ptr %9, i64 %358
  store float %362, ptr %363, align 32, !tbaa !29
  br i1 %338, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %364 = trunc i64 %355 to i32
  %365 = or disjoint i32 %364, 1
  %366 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %365
  %367 = load float, ptr addrspace(3) %366, align 4, !tbaa !29
  %368 = or disjoint i64 %358, 1
  %369 = getelementptr inbounds float, ptr %9, i64 %368
  store float %367, ptr %369, align 4, !tbaa !29
  br i1 %339, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %370 = trunc i64 %355 to i32
  %371 = or disjoint i32 %370, 2
  %372 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %371
  %373 = load float, ptr addrspace(3) %372, align 4, !tbaa !29
  %374 = or disjoint i64 %358, 2
  %375 = getelementptr inbounds float, ptr %9, i64 %374
  store float %373, ptr %375, align 8, !tbaa !29
  br i1 %340, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %376 = trunc i64 %355 to i32
  %377 = or disjoint i32 %376, 3
  %378 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %377
  %379 = load float, ptr addrspace(3) %378, align 4, !tbaa !29
  %380 = or disjoint i64 %358, 3
  %381 = getelementptr inbounds float, ptr %9, i64 %380
  store float %379, ptr %381, align 4, !tbaa !29
  br i1 %341, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %382 = trunc i64 %355 to i32
  %383 = or disjoint i32 %382, 4
  %384 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %383
  %385 = load float, ptr addrspace(3) %384, align 4, !tbaa !29
  %386 = or disjoint i64 %358, 4
  %387 = getelementptr inbounds float, ptr %9, i64 %386
  store float %385, ptr %387, align 16, !tbaa !29
  br i1 %342, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %388 = trunc i64 %355 to i32
  %389 = or disjoint i32 %388, 5
  %390 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !29
  %392 = or disjoint i64 %358, 5
  %393 = getelementptr inbounds float, ptr %9, i64 %392
  store float %391, ptr %393, align 4, !tbaa !29
  br i1 %343, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %394 = trunc i64 %355 to i32
  %395 = or disjoint i32 %394, 6
  %396 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !29
  %398 = or disjoint i64 %358, 6
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 8, !tbaa !29
  br i1 %344, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %400 = trunc i64 %355 to i32
  %401 = or disjoint i32 %400, 7
  %402 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !29
  %404 = or disjoint i64 %358, 7
  %405 = getelementptr inbounds float, ptr %9, i64 %404
  store float %403, ptr %405, align 4, !tbaa !29
  br i1 %345, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %406 = trunc i64 %355 to i32
  %407 = or disjoint i32 %406, 8
  %408 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !29
  %410 = or disjoint i64 %358, 8
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 32, !tbaa !29
  br i1 %346, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %412 = trunc i64 %355 to i32
  %413 = or disjoint i32 %412, 9
  %414 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !29
  %416 = or disjoint i64 %358, 9
  %417 = getelementptr inbounds float, ptr %9, i64 %416
  store float %415, ptr %417, align 4, !tbaa !29
  br i1 %347, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %418 = trunc i64 %355 to i32
  %419 = or disjoint i32 %418, 10
  %420 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !29
  %422 = or disjoint i64 %358, 10
  %423 = getelementptr inbounds float, ptr %9, i64 %422
  store float %421, ptr %423, align 8, !tbaa !29
  br i1 %348, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %424 = trunc i64 %355 to i32
  %425 = or disjoint i32 %424, 11
  %426 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !29
  %428 = or disjoint i64 %358, 11
  %429 = getelementptr inbounds float, ptr %9, i64 %428
  store float %427, ptr %429, align 4, !tbaa !29
  br i1 %349, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %430 = trunc i64 %355 to i32
  %431 = or disjoint i32 %430, 12
  %432 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %431
  %433 = load float, ptr addrspace(3) %432, align 4, !tbaa !29
  %434 = or disjoint i64 %358, 12
  %435 = getelementptr inbounds float, ptr %9, i64 %434
  store float %433, ptr %435, align 16, !tbaa !29
  br i1 %350, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %436 = trunc i64 %355 to i32
  %437 = or disjoint i32 %436, 13
  %438 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %437
  %439 = load float, ptr addrspace(3) %438, align 4, !tbaa !29
  %440 = or disjoint i64 %358, 13
  %441 = getelementptr inbounds float, ptr %9, i64 %440
  store float %439, ptr %441, align 4, !tbaa !29
  br i1 %351, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %442 = trunc i64 %355 to i32
  %443 = or disjoint i32 %442, 14
  %444 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %443
  %445 = load float, ptr addrspace(3) %444, align 4, !tbaa !29
  %446 = or disjoint i64 %358, 14
  %447 = getelementptr inbounds float, ptr %9, i64 %446
  store float %445, ptr %447, align 8, !tbaa !29
  br i1 %352, label %448, label %.split.us.i

448:                                              ; preds = %.preheader.split.15.i
  %449 = trunc i64 %355 to i32
  %450 = or disjoint i32 %449, 15
  %451 = getelementptr inbounds float, ptr addrspace(3) %335, i32 %450
  %452 = load float, ptr addrspace(3) %451, align 4, !tbaa !29
  %453 = or disjoint i64 %358, 15
  %454 = getelementptr inbounds float, ptr %9, i64 %453
  store float %452, ptr %454, align 4, !tbaa !29
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge574.i, %326, %.split.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="15,15" }
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
!33 = distinct !{!33, !25}
;----------------- End AdaptiveCpp IR dump ---------------
