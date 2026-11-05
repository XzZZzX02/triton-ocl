;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898370/tmp/triton-sycl-cache/compile-a61siym6/kernel.cpp"
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
  %36 = shl nuw i32 %.tr.i, 8
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 7
  %44 = icmp slt i64 %43, %38
  br label %55

.lr.ph714.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i
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
  %54 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0325.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i: ; preds = %60, %55
  %.sroa.0327.1.i = phi i16 [ %.sroa.0325.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0327.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !19
  %67 = add nuw nsw i64 %56, 128
  %68 = icmp ult i64 %56, 128
  br i1 %68, label %55, label %.lr.ph714.i, !llvm.loop !24

.lr.ph717.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  %75 = shl i32 %.tr.i, 9
  %76 = sext i32 %4 to i64
  %77 = sext i32 %5 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 1536
  %82 = and i64 %73, 31
  %83 = icmp slt i64 %82, %77
  br label %105

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph714.i
  %84 = phi i64 [ %49, %.lr.ph714.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 5
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 248
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0386.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !19
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0386.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  %93 = add nuw nsw i64 %84, 128
  %94 = icmp ult i64 %84, 128
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph717.i, !llvm.loop !28

.lr.ph720.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 1536
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i

105:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph717.i
  %106 = phi i64 [ %73, %.lr.ph717.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %107 = lshr i64 %106, 5
  %108 = icmp slt i64 %107, %76
  %109 = and i1 %108, %83
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

110:                                              ; preds = %105
  %111 = and i64 %106, 9223372036854775776
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %82
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0284.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %110, %105
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %110 ], [ 0, %105 ]
  %115 = trunc i64 %106 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !19
  %117 = add nuw nsw i64 %106, 128
  %118 = icmp ult i64 %106, 384
  br i1 %118, label %105, label %.lr.ph720.i, !llvm.loop !29

.lr.ph723.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %120 = icmp eq i64 %119, 0
  call void @llvm.assume(i1 %120)
  %121 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %122 = icmp eq i64 %121, 0
  call void @llvm.assume(i1 %122)
  %123 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %124 = icmp ult i64 %123, 128
  call void @llvm.assume(i1 %124)
  %125 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %126 = inttoptr i32 %125 to ptr addrspace(3)
  %127 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 1024
  %128 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 2560
  %129 = and i64 %123, 15
  %130 = shl nuw nsw i64 %123, 1
  %131 = and i64 %130, 224
  br label %149

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph720.i
  %132 = phi i64 [ %99, %.lr.ph720.i ], [ %141, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %133 = lshr i64 %132, 4
  %134 = shl nuw nsw i64 %132, 5
  %135 = and i64 %134, 480
  %136 = or disjoint i64 %135, %133
  %137 = trunc i64 %136 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %137
  %.sroa.0387.0.copyload.i = load i16, ptr addrspace(3) %138, align 2, !tbaa.struct !19
  %139 = trunc i64 %132 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %139
  store i16 %.sroa.0387.0.copyload.i, ptr addrspace(3) %140, align 2, !tbaa.struct !19
  %141 = add nuw nsw i64 %132, 128
  %142 = icmp ult i64 %132, 384
  br i1 %142, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph723.i, !llvm.loop !30

._crit_edge724.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %143 = trunc i64 %123 to i32
  %144 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %143
  store float %350, ptr addrspace(3) %144, align 4, !tbaa !31
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %145 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %146 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %147 = icmp ult i64 %146, 128
  call void @llvm.assume(i1 %147)
  %148 = icmp eq i64 %146, 0
  br i1 %148, label %353, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

149:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph723.i
  %150 = phi i64 [ 0, %.lr.ph723.i ], [ %351, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %151 = phi float [ 0.000000e+00, %.lr.ph723.i ], [ %350, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %152 = add nuw nsw i64 %150, %131
  %153 = trunc i64 %152 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %153
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %154, align 2, !tbaa.struct !19
  %155 = shl nuw nsw i64 %150, 4
  %156 = or disjoint i64 %155, %129
  %157 = trunc i64 %156 to i32
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %157
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %158, align 2, !tbaa.struct !19
  %159 = zext i16 %.sroa.0243.0.copyload.i to i32
  %160 = lshr i32 %159, 10
  %161 = and i32 %160, 31
  %162 = and i32 %159, 1023
  switch i32 %161, label %168 [
    i32 31, label %163
    i32 0, label %170
  ]

163:                                              ; preds = %149
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %164 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not702.i = icmp eq i32 %162, 0
  %165 = select i1 %.not702.i, i32 2139095040, i32 2143289344
  %166 = or disjoint i32 %165, %164
  %167 = bitcast i32 %166 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

168:                                              ; preds = %149
  %169 = or disjoint i32 %162, 1024
  br label %170

170:                                              ; preds = %168, %149
  %171 = phi i32 [ %169, %168 ], [ %162, %149 ]
  %172 = uitofp i32 %171 to float
  %.not.i = icmp eq i32 %161, 0
  %173 = add nsw i32 %161, -25
  %174 = select i1 %.not.i, i32 -24, i32 %173
  %175 = call float @__ocml_ldexp_f32(float noundef %172, i32 noundef %174) #5
  %176 = fneg contract float %175
  %.not672673.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %177 = select contract i1 %.not672673.i, float %176, float %175
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %170, %163
  %178 = phi float [ %167, %163 ], [ %177, %170 ]
  %179 = zext i16 %.sroa.0234.0.copyload.i to i32
  %180 = lshr i32 %179, 10
  %181 = and i32 %180, 31
  %182 = and i32 %179, 1023
  switch i32 %181, label %188 [
    i32 31, label %183
    i32 0, label %190
  ]

183:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %184 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not701.i = icmp eq i32 %182, 0
  %185 = select i1 %.not701.i, i32 2139095040, i32 2143289344
  %186 = or disjoint i32 %185, %184
  %187 = bitcast i32 %186 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

188:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %189 = or disjoint i32 %182, 1024
  br label %190

190:                                              ; preds = %188, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %191 = phi i32 [ %189, %188 ], [ %182, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %192 = uitofp i32 %191 to float
  %.not674.i = icmp eq i32 %181, 0
  %193 = add nsw i32 %181, -25
  %194 = select i1 %.not674.i, i32 -24, i32 %193
  %195 = call float @__ocml_ldexp_f32(float noundef %192, i32 noundef %194) #5
  %196 = fneg contract float %195
  %.not675676.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %197 = select contract i1 %.not675676.i, float %196, float %195
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %190, %183
  %198 = phi float [ %187, %183 ], [ %197, %190 ]
  %199 = fmul contract float %178, %198
  %200 = fadd contract float %151, %199
  %201 = or disjoint i64 %150, 1
  %202 = add nuw nsw i64 %201, %131
  %203 = trunc i64 %202 to i32
  %204 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %203
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %204, align 2, !tbaa.struct !19
  %205 = shl nuw nsw i64 %201, 4
  %206 = or disjoint i64 %205, %129
  %207 = trunc i64 %206 to i32
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %207
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %208, align 2, !tbaa.struct !19
  %209 = zext i16 %.sroa.0225.0.copyload.i to i32
  %210 = lshr i32 %209, 10
  %211 = and i32 %210, 31
  %212 = and i32 %209, 1023
  switch i32 %211, label %218 [
    i32 31, label %213
    i32 0, label %220
  ]

213:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %214 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not700.i = icmp eq i32 %212, 0
  %215 = select i1 %.not700.i, i32 2139095040, i32 2143289344
  %216 = or disjoint i32 %215, %214
  %217 = bitcast i32 %216 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

218:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %219 = or disjoint i32 %212, 1024
  br label %220

220:                                              ; preds = %218, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %221 = phi i32 [ %219, %218 ], [ %212, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %222 = uitofp i32 %221 to float
  %.not677.i = icmp eq i32 %211, 0
  %223 = add nsw i32 %211, -25
  %224 = select i1 %.not677.i, i32 -24, i32 %223
  %225 = call float @__ocml_ldexp_f32(float noundef %222, i32 noundef %224) #5
  %226 = fneg contract float %225
  %.not678679.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %227 = select contract i1 %.not678679.i, float %226, float %225
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %220, %213
  %228 = phi float [ %217, %213 ], [ %227, %220 ]
  %229 = zext i16 %.sroa.0216.0.copyload.i to i32
  %230 = lshr i32 %229, 10
  %231 = and i32 %230, 31
  %232 = and i32 %229, 1023
  switch i32 %231, label %238 [
    i32 31, label %233
    i32 0, label %240
  ]

233:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %234 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not699.i = icmp eq i32 %232, 0
  %235 = select i1 %.not699.i, i32 2139095040, i32 2143289344
  %236 = or disjoint i32 %235, %234
  %237 = bitcast i32 %236 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

238:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %239 = or disjoint i32 %232, 1024
  br label %240

240:                                              ; preds = %238, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %241 = phi i32 [ %239, %238 ], [ %232, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %242 = uitofp i32 %241 to float
  %.not680.i = icmp eq i32 %231, 0
  %243 = add nsw i32 %231, -25
  %244 = select i1 %.not680.i, i32 -24, i32 %243
  %245 = call float @__ocml_ldexp_f32(float noundef %242, i32 noundef %244) #5
  %246 = fneg contract float %245
  %.not681682.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %247 = select contract i1 %.not681682.i, float %246, float %245
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %240, %233
  %248 = phi float [ %237, %233 ], [ %247, %240 ]
  %249 = fmul contract float %228, %248
  %250 = fadd contract float %200, %249
  %251 = or disjoint i64 %150, 2
  %252 = add nuw nsw i64 %251, %131
  %253 = trunc i64 %252 to i32
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %253
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %254, align 2, !tbaa.struct !19
  %255 = shl nuw nsw i64 %251, 4
  %256 = or disjoint i64 %255, %129
  %257 = trunc i64 %256 to i32
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %257
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %258, align 2, !tbaa.struct !19
  %259 = zext i16 %.sroa.0207.0.copyload.i to i32
  %260 = lshr i32 %259, 10
  %261 = and i32 %260, 31
  %262 = and i32 %259, 1023
  switch i32 %261, label %268 [
    i32 31, label %263
    i32 0, label %270
  ]

263:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %264 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not698.i = icmp eq i32 %262, 0
  %265 = select i1 %.not698.i, i32 2139095040, i32 2143289344
  %266 = or disjoint i32 %265, %264
  %267 = bitcast i32 %266 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

268:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %269 = or disjoint i32 %262, 1024
  br label %270

270:                                              ; preds = %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %271 = phi i32 [ %269, %268 ], [ %262, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %272 = uitofp i32 %271 to float
  %.not683.i = icmp eq i32 %261, 0
  %273 = add nsw i32 %261, -25
  %274 = select i1 %.not683.i, i32 -24, i32 %273
  %275 = call float @__ocml_ldexp_f32(float noundef %272, i32 noundef %274) #5
  %276 = fneg contract float %275
  %.not684685.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %277 = select contract i1 %.not684685.i, float %276, float %275
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %270, %263
  %278 = phi float [ %267, %263 ], [ %277, %270 ]
  %279 = zext i16 %.sroa.0198.0.copyload.i to i32
  %280 = lshr i32 %279, 10
  %281 = and i32 %280, 31
  %282 = and i32 %279, 1023
  switch i32 %281, label %288 [
    i32 31, label %283
    i32 0, label %290
  ]

283:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %284 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not697.i = icmp eq i32 %282, 0
  %285 = select i1 %.not697.i, i32 2139095040, i32 2143289344
  %286 = or disjoint i32 %285, %284
  %287 = bitcast i32 %286 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

288:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %289 = or disjoint i32 %282, 1024
  br label %290

290:                                              ; preds = %288, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %291 = phi i32 [ %289, %288 ], [ %282, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %292 = uitofp i32 %291 to float
  %.not686.i = icmp eq i32 %281, 0
  %293 = add nsw i32 %281, -25
  %294 = select i1 %.not686.i, i32 -24, i32 %293
  %295 = call float @__ocml_ldexp_f32(float noundef %292, i32 noundef %294) #5
  %296 = fneg contract float %295
  %.not687688.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %297 = select contract i1 %.not687688.i, float %296, float %295
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %290, %283
  %298 = phi float [ %287, %283 ], [ %297, %290 ]
  %299 = fmul contract float %278, %298
  %300 = fadd contract float %250, %299
  %301 = or disjoint i64 %150, 3
  %302 = add nuw nsw i64 %301, %131
  %303 = trunc i64 %302 to i32
  %304 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %303
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %304, align 2, !tbaa.struct !19
  %305 = shl nuw nsw i64 %301, 4
  %306 = or disjoint i64 %305, %129
  %307 = trunc i64 %306 to i32
  %308 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %307
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %308, align 2, !tbaa.struct !19
  %309 = zext i16 %.sroa.0189.0.copyload.i to i32
  %310 = lshr i32 %309, 10
  %311 = and i32 %310, 31
  %312 = and i32 %309, 1023
  switch i32 %311, label %318 [
    i32 31, label %313
    i32 0, label %320
  ]

313:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %314 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %312, 0
  %315 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %316 = or disjoint i32 %315, %314
  %317 = bitcast i32 %316 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

318:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %319 = or disjoint i32 %312, 1024
  br label %320

320:                                              ; preds = %318, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %321 = phi i32 [ %319, %318 ], [ %312, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %322 = uitofp i32 %321 to float
  %.not689.i = icmp eq i32 %311, 0
  %323 = add nsw i32 %311, -25
  %324 = select i1 %.not689.i, i32 -24, i32 %323
  %325 = call float @__ocml_ldexp_f32(float noundef %322, i32 noundef %324) #5
  %326 = fneg contract float %325
  %.not690691.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %327 = select contract i1 %.not690691.i, float %326, float %325
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %320, %313
  %328 = phi float [ %317, %313 ], [ %327, %320 ]
  %329 = zext i16 %.sroa.0180.0.copyload.i to i32
  %330 = lshr i32 %329, 10
  %331 = and i32 %330, 31
  %332 = and i32 %329, 1023
  switch i32 %331, label %338 [
    i32 31, label %333
    i32 0, label %340
  ]

333:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %334 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %332, 0
  %335 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %336 = or disjoint i32 %335, %334
  %337 = bitcast i32 %336 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

338:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %339 = or disjoint i32 %332, 1024
  br label %340

340:                                              ; preds = %338, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %341 = phi i32 [ %339, %338 ], [ %332, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %342 = uitofp i32 %341 to float
  %.not692.i = icmp eq i32 %331, 0
  %343 = add nsw i32 %331, -25
  %344 = select i1 %.not692.i, i32 -24, i32 %343
  %345 = call float @__ocml_ldexp_f32(float noundef %342, i32 noundef %344) #5
  %346 = fneg contract float %345
  %.not693694.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %347 = select contract i1 %.not693694.i, float %346, float %345
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %340, %333
  %348 = phi float [ %337, %333 ], [ %347, %340 ]
  %349 = fmul contract float %328, %348
  %350 = fadd contract float %300, %349
  %351 = add nuw nsw i64 %150, 4
  %352 = icmp ult i64 %150, 28
  br i1 %352, label %149, label %._crit_edge724.i, !llvm.loop !33

353:                                              ; preds = %._crit_edge724.i
  %354 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %355 = icmp eq i64 %354, 0
  call void @llvm.assume(i1 %355)
  %356 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %357 = icmp eq i64 %356, 0
  call void @llvm.assume(i1 %357)
  %358 = sext i32 %3 to i64
  %359 = call i32 @llvm.amdgcn.groupstaticsize()
  %360 = inttoptr i32 %359 to ptr addrspace(3)
  %361 = icmp sgt i32 %4, 0
  %362 = icmp ugt i32 %4, 1
  %363 = icmp ugt i32 %4, 2
  %364 = icmp ugt i32 %4, 3
  %365 = icmp ugt i32 %4, 4
  %366 = icmp ugt i32 %4, 5
  %367 = icmp ugt i32 %4, 6
  %368 = icmp ugt i32 %4, 7
  %369 = icmp ugt i32 %4, 8
  %370 = icmp ugt i32 %4, 9
  %371 = icmp ugt i32 %4, 10
  %372 = icmp ugt i32 %4, 11
  %373 = icmp ugt i32 %4, 12
  %374 = icmp ugt i32 %4, 13
  %375 = icmp ugt i32 %4, 14
  %376 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %353
  %377 = phi i64 [ 0, %353 ], [ %383, %.split.us.i ]
  %378 = icmp slt i64 %377, %358
  %379 = shl i64 %377, 4
  %.tr671.i = trunc i64 %377 to i32
  %380 = shl i32 %.tr671.i, 4
  %381 = sext i32 %380 to i64
  %382 = add nsw i64 %145, %381
  %.fr.i = freeze i1 %378
  %brmerge.not.i = select i1 %.fr.i, i1 %361, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %472, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %383 = add nuw nsw i64 %377, 1
  %exitcond.not.i = icmp eq i64 %383, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %384 = trunc i64 %379 to i32
  %385 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %384
  %386 = load float, ptr addrspace(3) %385, align 4, !tbaa !31
  %387 = getelementptr inbounds float, ptr %9, i64 %382
  store float %386, ptr %387, align 32, !tbaa !31
  br i1 %362, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %388 = trunc i64 %379 to i32
  %389 = or disjoint i32 %388, 1
  %390 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %389
  %391 = load float, ptr addrspace(3) %390, align 4, !tbaa !31
  %392 = or disjoint i64 %382, 1
  %393 = getelementptr inbounds float, ptr %9, i64 %392
  store float %391, ptr %393, align 4, !tbaa !31
  br i1 %363, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %394 = trunc i64 %379 to i32
  %395 = or disjoint i32 %394, 2
  %396 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !31
  %398 = or disjoint i64 %382, 2
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 8, !tbaa !31
  br i1 %364, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %400 = trunc i64 %379 to i32
  %401 = or disjoint i32 %400, 3
  %402 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !31
  %404 = or disjoint i64 %382, 3
  %405 = getelementptr inbounds float, ptr %9, i64 %404
  store float %403, ptr %405, align 4, !tbaa !31
  br i1 %365, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %406 = trunc i64 %379 to i32
  %407 = or disjoint i32 %406, 4
  %408 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !31
  %410 = or disjoint i64 %382, 4
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 16, !tbaa !31
  br i1 %366, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %412 = trunc i64 %379 to i32
  %413 = or disjoint i32 %412, 5
  %414 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !31
  %416 = or disjoint i64 %382, 5
  %417 = getelementptr inbounds float, ptr %9, i64 %416
  store float %415, ptr %417, align 4, !tbaa !31
  br i1 %367, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %418 = trunc i64 %379 to i32
  %419 = or disjoint i32 %418, 6
  %420 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !31
  %422 = or disjoint i64 %382, 6
  %423 = getelementptr inbounds float, ptr %9, i64 %422
  store float %421, ptr %423, align 8, !tbaa !31
  br i1 %368, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %424 = trunc i64 %379 to i32
  %425 = or disjoint i32 %424, 7
  %426 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !31
  %428 = or disjoint i64 %382, 7
  %429 = getelementptr inbounds float, ptr %9, i64 %428
  store float %427, ptr %429, align 4, !tbaa !31
  br i1 %369, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %430 = trunc i64 %379 to i32
  %431 = or disjoint i32 %430, 8
  %432 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %431
  %433 = load float, ptr addrspace(3) %432, align 4, !tbaa !31
  %434 = or disjoint i64 %382, 8
  %435 = getelementptr inbounds float, ptr %9, i64 %434
  store float %433, ptr %435, align 32, !tbaa !31
  br i1 %370, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %436 = trunc i64 %379 to i32
  %437 = or disjoint i32 %436, 9
  %438 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %437
  %439 = load float, ptr addrspace(3) %438, align 4, !tbaa !31
  %440 = or disjoint i64 %382, 9
  %441 = getelementptr inbounds float, ptr %9, i64 %440
  store float %439, ptr %441, align 4, !tbaa !31
  br i1 %371, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %442 = trunc i64 %379 to i32
  %443 = or disjoint i32 %442, 10
  %444 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %443
  %445 = load float, ptr addrspace(3) %444, align 4, !tbaa !31
  %446 = or disjoint i64 %382, 10
  %447 = getelementptr inbounds float, ptr %9, i64 %446
  store float %445, ptr %447, align 8, !tbaa !31
  br i1 %372, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %448 = trunc i64 %379 to i32
  %449 = or disjoint i32 %448, 11
  %450 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !31
  %452 = or disjoint i64 %382, 11
  %453 = getelementptr inbounds float, ptr %9, i64 %452
  store float %451, ptr %453, align 4, !tbaa !31
  br i1 %373, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %454 = trunc i64 %379 to i32
  %455 = or disjoint i32 %454, 12
  %456 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !31
  %458 = or disjoint i64 %382, 12
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 16, !tbaa !31
  br i1 %374, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %460 = trunc i64 %379 to i32
  %461 = or disjoint i32 %460, 13
  %462 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !31
  %464 = or disjoint i64 %382, 13
  %465 = getelementptr inbounds float, ptr %9, i64 %464
  store float %463, ptr %465, align 4, !tbaa !31
  br i1 %375, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %466 = trunc i64 %379 to i32
  %467 = or disjoint i32 %466, 14
  %468 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !31
  %470 = or disjoint i64 %382, 14
  %471 = getelementptr inbounds float, ptr %9, i64 %470
  store float %469, ptr %471, align 8, !tbaa !31
  br i1 %376, label %472, label %.split.us.i

472:                                              ; preds = %.preheader.split.15.i
  %473 = trunc i64 %379 to i32
  %474 = or disjoint i32 %473, 15
  %475 = getelementptr inbounds float, ptr addrspace(3) %360, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !31
  %477 = or disjoint i64 %382, 15
  %478 = getelementptr inbounds float, ptr %9, i64 %477
  store float %476, ptr %478, align 4, !tbaa !31
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge724.i, %.split.us.i
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
!30 = distinct !{!30, !25, !26, !27}
!31 = !{!32, !32, i64 0}
!32 = !{!"float", !22, i64 0}
!33 = distinct !{!33, !25}
!34 = distinct !{!34, !25}
;----------------- End AdaptiveCpp IR dump ---------------
