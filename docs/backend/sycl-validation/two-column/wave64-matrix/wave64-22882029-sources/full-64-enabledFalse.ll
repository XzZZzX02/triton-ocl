;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-hc82y28l/kernel.cpp"
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
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
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

.lr.ph640.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i
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

58:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i, %6
  %59 = phi i64 [ %34, %6 ], [ %70, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i ]
  %60 = lshr i64 %59, 6
  %61 = icmp slt i64 %60, %37
  %62 = and i1 %61, %43
  br i1 %62, label %63, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i

63:                                               ; preds = %58
  %64 = and i64 %59, 9223372036854775744
  %65 = or disjoint i64 %64, %39
  %66 = or disjoint i64 %65, %34
  %67 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %66
  %.sroa.0295.0.copyload.i = load i16, ptr %67, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i: ; preds = %63, %58
  %.sroa.0297.1.i = phi i16 [ %.sroa.0295.0.copyload.i, %63 ], [ 0, %58 ]
  %68 = trunc i64 %59 to i32
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %68
  store i16 %.sroa.0297.1.i, ptr addrspace(3) %69, align 2, !tbaa.struct !19
  %70 = add nuw nsw i64 %59, 64
  %71 = icmp ult i64 %59, 448
  br i1 %71, label %58, label %.lr.ph640.i, !llvm.loop !24

.lr.ph643.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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

82:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph640.i
  %83 = phi i64 [ %48, %.lr.ph640.i ], [ %94, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %84 = lshr i64 %83, 6
  %85 = icmp slt i64 %84, %51
  %86 = and i1 %85, %57
  br i1 %86, label %87, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

87:                                               ; preds = %82
  %88 = and i64 %83, 9223372036854775744
  %89 = or disjoint i64 %88, %53
  %90 = or disjoint i64 %89, %48
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %90
  %.sroa.0280.0.copyload.i = load i16, ptr %91, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %87, %82
  %.sroa.0282.1.i = phi i16 [ %.sroa.0280.0.copyload.i, %87 ], [ 0, %82 ]
  %92 = trunc i64 %83 to i32
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %56, i32 %92
  store i16 %.sroa.0282.1.i, ptr addrspace(3) %93, align 2, !tbaa.struct !19
  %94 = add nuw nsw i64 %83, 64
  %95 = icmp ult i64 %83, 960
  br i1 %95, label %82, label %.lr.ph643.i, !llvm.loop !28

.lr.ph646.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
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
  %106 = and i64 %100, 15
  br label %121

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph643.i
  %107 = phi i64 [ %76, %.lr.ph643.i ], [ %116, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %108 = lshr i64 %107, 4
  %109 = shl nuw nsw i64 %107, 6
  %110 = and i64 %109, 960
  %111 = or disjoint i64 %110, %108
  %112 = trunc i64 %111 to i32
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %80, i32 %112
  %.sroa.0348.0.copyload.i = load i16, ptr addrspace(3) %113, align 2, !tbaa.struct !19
  %114 = trunc i64 %107 to i32
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %114
  store i16 %.sroa.0348.0.copyload.i, ptr addrspace(3) %115, align 2, !tbaa.struct !19
  %116 = add nuw nsw i64 %107, 64
  %117 = icmp ult i64 %107, 960
  br i1 %117, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %.lr.ph646.i, !llvm.loop !29

._crit_edge647.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %119 = icmp ult i64 %118, 64
  call void @llvm.assume(i1 %119)
  %120 = icmp eq i64 %118, 0
  br i1 %120, label %334, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

121:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i, %.lr.ph646.i
  %122 = phi i64 [ %100, %.lr.ph646.i ], [ %128, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i ]
  %123 = shl nuw nsw i64 %122, 2
  %124 = and i64 %123, 448
  br label %130

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %125 = trunc i64 %122 to i32
  %126 = and i32 %125, 127
  %127 = getelementptr inbounds float, ptr addrspace(3) %103, i32 %126
  store float %331, ptr addrspace(3) %127, align 4, !tbaa !30
  %128 = add nuw nsw i64 %122, 64
  %129 = icmp ult i64 %122, 64
  br i1 %129, label %121, label %._crit_edge647.i, !llvm.loop !32

130:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %121
  %131 = phi i64 [ 0, %121 ], [ %332, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %132 = phi float [ 0.000000e+00, %121 ], [ %331, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %133 = add nuw nsw i64 %131, %124
  %134 = trunc i64 %133 to i32
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %134
  %.sroa.0239.0.copyload.i = load i16, ptr addrspace(3) %135, align 2, !tbaa.struct !19
  %136 = shl nuw nsw i64 %131, 4
  %137 = or disjoint i64 %136, %106
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %138
  %.sroa.0230.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !19
  %140 = zext i16 %.sroa.0239.0.copyload.i to i32
  %141 = lshr i32 %140, 10
  %142 = and i32 %141, 31
  %143 = and i32 %140, 1023
  switch i32 %142, label %149 [
    i32 31, label %144
    i32 0, label %151
  ]

144:                                              ; preds = %130
  %.sroa.0239.0.copyload.signext.i = sext i16 %.sroa.0239.0.copyload.i to i32
  %145 = and i32 %.sroa.0239.0.copyload.signext.i, -2147483648
  %.not628.i = icmp eq i32 %143, 0
  %146 = select i1 %.not628.i, i32 2139095040, i32 2143289344
  %147 = or disjoint i32 %146, %145
  %148 = bitcast i32 %147 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

149:                                              ; preds = %130
  %150 = or disjoint i32 %143, 1024
  br label %151

151:                                              ; preds = %149, %130
  %152 = phi i32 [ %150, %149 ], [ %143, %130 ]
  %153 = uitofp i32 %152 to float
  %.not.i = icmp eq i32 %142, 0
  %154 = add nsw i32 %142, -25
  %155 = select i1 %.not.i, i32 -24, i32 %154
  %156 = call float @__ocml_ldexp_f32(float noundef %153, i32 noundef %155) #5
  %157 = fneg contract float %156
  %.not598599.i = icmp slt i16 %.sroa.0239.0.copyload.i, 0
  %158 = select contract i1 %.not598599.i, float %157, float %156
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %151, %144
  %159 = phi float [ %148, %144 ], [ %158, %151 ]
  %160 = zext i16 %.sroa.0230.0.copyload.i to i32
  %161 = lshr i32 %160, 10
  %162 = and i32 %161, 31
  %163 = and i32 %160, 1023
  switch i32 %162, label %169 [
    i32 31, label %164
    i32 0, label %171
  ]

164:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0230.0.copyload.signext.i = sext i16 %.sroa.0230.0.copyload.i to i32
  %165 = and i32 %.sroa.0230.0.copyload.signext.i, -2147483648
  %.not627.i = icmp eq i32 %163, 0
  %166 = select i1 %.not627.i, i32 2139095040, i32 2143289344
  %167 = or disjoint i32 %166, %165
  %168 = bitcast i32 %167 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

169:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %170 = or disjoint i32 %163, 1024
  br label %171

171:                                              ; preds = %169, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %172 = phi i32 [ %170, %169 ], [ %163, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %173 = uitofp i32 %172 to float
  %.not600.i = icmp eq i32 %162, 0
  %174 = add nsw i32 %162, -25
  %175 = select i1 %.not600.i, i32 -24, i32 %174
  %176 = call float @__ocml_ldexp_f32(float noundef %173, i32 noundef %175) #5
  %177 = fneg contract float %176
  %.not601602.i = icmp slt i16 %.sroa.0230.0.copyload.i, 0
  %178 = select contract i1 %.not601602.i, float %177, float %176
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i: ; preds = %171, %164
  %179 = phi float [ %168, %164 ], [ %178, %171 ]
  %180 = fmul contract float %159, %179
  %181 = fadd contract float %132, %180
  %182 = or disjoint i64 %131, 1
  %183 = add nuw nsw i64 %182, %124
  %184 = trunc i64 %183 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %184
  %.sroa.0221.0.copyload.i = load i16, ptr addrspace(3) %185, align 2, !tbaa.struct !19
  %186 = shl nuw nsw i64 %182, 4
  %187 = or disjoint i64 %186, %106
  %188 = trunc i64 %187 to i32
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %188
  %.sroa.0212.0.copyload.i = load i16, ptr addrspace(3) %189, align 2, !tbaa.struct !19
  %190 = zext i16 %.sroa.0221.0.copyload.i to i32
  %191 = lshr i32 %190, 10
  %192 = and i32 %191, 31
  %193 = and i32 %190, 1023
  switch i32 %192, label %199 [
    i32 31, label %194
    i32 0, label %201
  ]

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %.sroa.0221.0.copyload.signext.i = sext i16 %.sroa.0221.0.copyload.i to i32
  %195 = and i32 %.sroa.0221.0.copyload.signext.i, -2147483648
  %.not626.i = icmp eq i32 %193, 0
  %196 = select i1 %.not626.i, i32 2139095040, i32 2143289344
  %197 = or disjoint i32 %196, %195
  %198 = bitcast i32 %197 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

199:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %200 = or disjoint i32 %193, 1024
  br label %201

201:                                              ; preds = %199, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i
  %202 = phi i32 [ %200, %199 ], [ %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i ]
  %203 = uitofp i32 %202 to float
  %.not603.i = icmp eq i32 %192, 0
  %204 = add nsw i32 %192, -25
  %205 = select i1 %.not603.i, i32 -24, i32 %204
  %206 = call float @__ocml_ldexp_f32(float noundef %203, i32 noundef %205) #5
  %207 = fneg contract float %206
  %.not604605.i = icmp slt i16 %.sroa.0221.0.copyload.i, 0
  %208 = select contract i1 %.not604605.i, float %207, float %206
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i: ; preds = %201, %194
  %209 = phi float [ %198, %194 ], [ %208, %201 ]
  %210 = zext i16 %.sroa.0212.0.copyload.i to i32
  %211 = lshr i32 %210, 10
  %212 = and i32 %211, 31
  %213 = and i32 %210, 1023
  switch i32 %212, label %219 [
    i32 31, label %214
    i32 0, label %221
  ]

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %.sroa.0212.0.copyload.signext.i = sext i16 %.sroa.0212.0.copyload.i to i32
  %215 = and i32 %.sroa.0212.0.copyload.signext.i, -2147483648
  %.not625.i = icmp eq i32 %213, 0
  %216 = select i1 %.not625.i, i32 2139095040, i32 2143289344
  %217 = or disjoint i32 %216, %215
  %218 = bitcast i32 %217 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %220 = or disjoint i32 %213, 1024
  br label %221

221:                                              ; preds = %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i
  %222 = phi i32 [ %220, %219 ], [ %213, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i ]
  %223 = uitofp i32 %222 to float
  %.not606.i = icmp eq i32 %212, 0
  %224 = add nsw i32 %212, -25
  %225 = select i1 %.not606.i, i32 -24, i32 %224
  %226 = call float @__ocml_ldexp_f32(float noundef %223, i32 noundef %225) #5
  %227 = fneg contract float %226
  %.not607608.i = icmp slt i16 %.sroa.0212.0.copyload.i, 0
  %228 = select contract i1 %.not607608.i, float %227, float %226
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i: ; preds = %221, %214
  %229 = phi float [ %218, %214 ], [ %228, %221 ]
  %230 = fmul contract float %209, %229
  %231 = fadd contract float %181, %230
  %232 = or disjoint i64 %131, 2
  %233 = add nuw nsw i64 %232, %124
  %234 = trunc i64 %233 to i32
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %234
  %.sroa.0203.0.copyload.i = load i16, ptr addrspace(3) %235, align 2, !tbaa.struct !19
  %236 = shl nuw nsw i64 %232, 4
  %237 = or disjoint i64 %236, %106
  %238 = trunc i64 %237 to i32
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %238
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %239, align 2, !tbaa.struct !19
  %240 = zext i16 %.sroa.0203.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %.sroa.0203.0.copyload.signext.i = sext i16 %.sroa.0203.0.copyload.i to i32
  %245 = and i32 %.sroa.0203.0.copyload.signext.i, -2147483648
  %.not624.i = icmp eq i32 %243, 0
  %246 = select i1 %.not624.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not609.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not609.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #5
  %257 = fneg contract float %256
  %.not610611.i = icmp slt i16 %.sroa.0203.0.copyload.i, 0
  %258 = select contract i1 %.not610611.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = zext i16 %.sroa.0194.0.copyload.i to i32
  %261 = lshr i32 %260, 10
  %262 = and i32 %261, 31
  %263 = and i32 %260, 1023
  switch i32 %262, label %269 [
    i32 31, label %264
    i32 0, label %271
  ]

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %265 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not623.i = icmp eq i32 %263, 0
  %266 = select i1 %.not623.i, i32 2139095040, i32 2143289344
  %267 = or disjoint i32 %266, %265
  %268 = bitcast i32 %267 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %270 = or disjoint i32 %263, 1024
  br label %271

271:                                              ; preds = %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i
  %272 = phi i32 [ %270, %269 ], [ %263, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i ]
  %273 = uitofp i32 %272 to float
  %.not612.i = icmp eq i32 %262, 0
  %274 = add nsw i32 %262, -25
  %275 = select i1 %.not612.i, i32 -24, i32 %274
  %276 = call float @__ocml_ldexp_f32(float noundef %273, i32 noundef %275) #5
  %277 = fneg contract float %276
  %.not613614.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %278 = select contract i1 %.not613614.i, float %277, float %276
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i: ; preds = %271, %264
  %279 = phi float [ %268, %264 ], [ %278, %271 ]
  %280 = fmul contract float %259, %279
  %281 = fadd contract float %231, %280
  %282 = or disjoint i64 %131, 3
  %283 = add nuw nsw i64 %282, %124
  %284 = trunc i64 %283 to i32
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %284
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %285, align 2, !tbaa.struct !19
  %286 = shl nuw nsw i64 %282, 4
  %287 = or disjoint i64 %286, %106
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %105, i32 %288
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !19
  %290 = zext i16 %.sroa.0185.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %295 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not622.i = icmp eq i32 %293, 0
  %296 = select i1 %.not622.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not615.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not615.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #5
  %307 = fneg contract float %306
  %.not616617.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %308 = select contract i1 %.not616617.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = zext i16 %.sroa.0176.0.copyload.i to i32
  %311 = lshr i32 %310, 10
  %312 = and i32 %311, 31
  %313 = and i32 %310, 1023
  switch i32 %312, label %319 [
    i32 31, label %314
    i32 0, label %321
  ]

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %315 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not621.i = icmp eq i32 %313, 0
  %316 = select i1 %.not621.i, i32 2139095040, i32 2143289344
  %317 = or disjoint i32 %316, %315
  %318 = bitcast i32 %317 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %320 = or disjoint i32 %313, 1024
  br label %321

321:                                              ; preds = %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i
  %322 = phi i32 [ %320, %319 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i ]
  %323 = uitofp i32 %322 to float
  %.not618.i = icmp eq i32 %312, 0
  %324 = add nsw i32 %312, -25
  %325 = select i1 %.not618.i, i32 -24, i32 %324
  %326 = call float @__ocml_ldexp_f32(float noundef %323, i32 noundef %325) #5
  %327 = fneg contract float %326
  %.not619620.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %328 = select contract i1 %.not619620.i, float %327, float %326
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %321, %314
  %329 = phi float [ %318, %314 ], [ %328, %321 ]
  %330 = fmul contract float %309, %329
  %331 = fadd contract float %281, %330
  %332 = add nuw nsw i64 %131, 4
  %333 = icmp ult i64 %131, 60
  br i1 %333, label %130, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit10.i.i.i, !llvm.loop !33

334:                                              ; preds = %._crit_edge647.i
  %335 = shl nuw i32 %.tr.i, 7
  %336 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %337 = icmp eq i64 %336, 0
  call void @llvm.assume(i1 %337)
  %338 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %339 = icmp eq i64 %338, 0
  call void @llvm.assume(i1 %339)
  %340 = sext i32 %3 to i64
  %341 = call i32 @llvm.amdgcn.groupstaticsize()
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = sext i32 %335 to i64
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

.preheader.i:                                     ; preds = %.split.us.i, %334
  %360 = phi i64 [ 0, %334 ], [ %366, %.split.us.i ]
  %361 = icmp slt i64 %360, %340
  %362 = shl i64 %360, 4
  %.tr597.i = trunc i64 %360 to i32
  %363 = shl i32 %.tr597.i, 4
  %364 = sext i32 %363 to i64
  %365 = add nsw i64 %364, %343
  %.fr.i = freeze i1 %361
  %brmerge.not.i = select i1 %.fr.i, i1 %344, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %455, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %366 = add nuw nsw i64 %360, 1
  %exitcond.not.i = icmp eq i64 %366, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %367 = trunc i64 %362 to i32
  %368 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %367
  %369 = load float, ptr addrspace(3) %368, align 4, !tbaa !30
  %370 = getelementptr inbounds float, ptr %9, i64 %365
  store float %369, ptr %370, align 32, !tbaa !30
  br i1 %345, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %371 = trunc i64 %362 to i32
  %372 = or disjoint i32 %371, 1
  %373 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %372
  %374 = load float, ptr addrspace(3) %373, align 4, !tbaa !30
  %375 = or disjoint i64 %365, 1
  %376 = getelementptr inbounds float, ptr %9, i64 %375
  store float %374, ptr %376, align 4, !tbaa !30
  br i1 %346, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %377 = trunc i64 %362 to i32
  %378 = or disjoint i32 %377, 2
  %379 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %378
  %380 = load float, ptr addrspace(3) %379, align 4, !tbaa !30
  %381 = or disjoint i64 %365, 2
  %382 = getelementptr inbounds float, ptr %9, i64 %381
  store float %380, ptr %382, align 8, !tbaa !30
  br i1 %347, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %383 = trunc i64 %362 to i32
  %384 = or disjoint i32 %383, 3
  %385 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !30
  %387 = or disjoint i64 %365, 3
  %388 = getelementptr inbounds float, ptr %9, i64 %387
  store float %386, ptr %388, align 4, !tbaa !30
  br i1 %348, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %389 = trunc i64 %362 to i32
  %390 = or disjoint i32 %389, 4
  %391 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !30
  %393 = or disjoint i64 %365, 4
  %394 = getelementptr inbounds float, ptr %9, i64 %393
  store float %392, ptr %394, align 16, !tbaa !30
  br i1 %349, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %395 = trunc i64 %362 to i32
  %396 = or disjoint i32 %395, 5
  %397 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %396
  %398 = load float, ptr addrspace(3) %397, align 4, !tbaa !30
  %399 = or disjoint i64 %365, 5
  %400 = getelementptr inbounds float, ptr %9, i64 %399
  store float %398, ptr %400, align 4, !tbaa !30
  br i1 %350, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %401 = trunc i64 %362 to i32
  %402 = or disjoint i32 %401, 6
  %403 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %402
  %404 = load float, ptr addrspace(3) %403, align 4, !tbaa !30
  %405 = or disjoint i64 %365, 6
  %406 = getelementptr inbounds float, ptr %9, i64 %405
  store float %404, ptr %406, align 8, !tbaa !30
  br i1 %351, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %407 = trunc i64 %362 to i32
  %408 = or disjoint i32 %407, 7
  %409 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %408
  %410 = load float, ptr addrspace(3) %409, align 4, !tbaa !30
  %411 = or disjoint i64 %365, 7
  %412 = getelementptr inbounds float, ptr %9, i64 %411
  store float %410, ptr %412, align 4, !tbaa !30
  br i1 %352, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %413 = trunc i64 %362 to i32
  %414 = or disjoint i32 %413, 8
  %415 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %414
  %416 = load float, ptr addrspace(3) %415, align 4, !tbaa !30
  %417 = or disjoint i64 %365, 8
  %418 = getelementptr inbounds float, ptr %9, i64 %417
  store float %416, ptr %418, align 32, !tbaa !30
  br i1 %353, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %419 = trunc i64 %362 to i32
  %420 = or disjoint i32 %419, 9
  %421 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %420
  %422 = load float, ptr addrspace(3) %421, align 4, !tbaa !30
  %423 = or disjoint i64 %365, 9
  %424 = getelementptr inbounds float, ptr %9, i64 %423
  store float %422, ptr %424, align 4, !tbaa !30
  br i1 %354, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %425 = trunc i64 %362 to i32
  %426 = or disjoint i32 %425, 10
  %427 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !30
  %429 = or disjoint i64 %365, 10
  %430 = getelementptr inbounds float, ptr %9, i64 %429
  store float %428, ptr %430, align 8, !tbaa !30
  br i1 %355, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %431 = trunc i64 %362 to i32
  %432 = or disjoint i32 %431, 11
  %433 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %432
  %434 = load float, ptr addrspace(3) %433, align 4, !tbaa !30
  %435 = or disjoint i64 %365, 11
  %436 = getelementptr inbounds float, ptr %9, i64 %435
  store float %434, ptr %436, align 4, !tbaa !30
  br i1 %356, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %437 = trunc i64 %362 to i32
  %438 = or disjoint i32 %437, 12
  %439 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !30
  %441 = or disjoint i64 %365, 12
  %442 = getelementptr inbounds float, ptr %9, i64 %441
  store float %440, ptr %442, align 16, !tbaa !30
  br i1 %357, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %443 = trunc i64 %362 to i32
  %444 = or disjoint i32 %443, 13
  %445 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %444
  %446 = load float, ptr addrspace(3) %445, align 4, !tbaa !30
  %447 = or disjoint i64 %365, 13
  %448 = getelementptr inbounds float, ptr %9, i64 %447
  store float %446, ptr %448, align 4, !tbaa !30
  br i1 %358, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %449 = trunc i64 %362 to i32
  %450 = or disjoint i32 %449, 14
  %451 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %450
  %452 = load float, ptr addrspace(3) %451, align 4, !tbaa !30
  %453 = or disjoint i64 %365, 14
  %454 = getelementptr inbounds float, ptr %9, i64 %453
  store float %452, ptr %454, align 8, !tbaa !30
  br i1 %359, label %455, label %.split.us.i

455:                                              ; preds = %.preheader.split.15.i
  %456 = trunc i64 %362 to i32
  %457 = or disjoint i32 %456, 15
  %458 = getelementptr inbounds float, ptr addrspace(3) %342, i32 %457
  %459 = load float, ptr addrspace(3) %458, align 4, !tbaa !30
  %460 = or disjoint i64 %365, 15
  %461 = getelementptr inbounds float, ptr %9, i64 %460
  store float %459, ptr %461, align 4, !tbaa !30
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge647.i, %.split.us.i
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
!29 = distinct !{!29, !25, !26, !27}
!30 = !{!31, !31, i64 0}
!31 = !{!"float", !22, i64 0}
!32 = distinct !{!32, !25}
!33 = distinct !{!33, !25}
!34 = distinct !{!34, !25}
;----------------- End AdaptiveCpp IR dump ---------------
