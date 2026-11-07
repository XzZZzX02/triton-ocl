;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-8hkx2i9o/kernel.cpp"
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
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 8388608
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 8388607
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 11
  %31 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %34 = icmp eq i64 %33, 0
  call void @llvm.assume(i1 %34)
  %35 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %36 = icmp ult i64 %35, 256
  call void @llvm.assume(i1 %36)
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = sext i32 %30 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 8192
  %43 = and i64 %35, 31
  %44 = icmp slt i64 %43, %38
  br label %55

.lr.ph1190.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit45.i.i.i
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
  %50 = icmp ult i64 %49, 256
  call void @llvm.assume(i1 %50)
  %51 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %52 = inttoptr i32 %51 to ptr addrspace(3)
  %53 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 8192
  %54 = getelementptr inbounds i8, ptr addrspace(3) %52, i32 12288
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit45.i.i.i, %6
  %56 = phi i64 [ %35, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit45.i.i.i ]
  %57 = lshr i64 %56, 5
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit45.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775776
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0455.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit45.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit45.i.i.i: ; preds = %60, %55
  %.sroa.0457.1.i = phi i16 [ %.sroa.0455.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0457.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !19
  %67 = add nuw nsw i64 %56, 256
  %68 = icmp ult i64 %56, 1792
  br i1 %68, label %55, label %.lr.ph1190.i, !llvm.loop !24

.lr.ph1193.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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
  %74 = icmp ult i64 %73, 256
  call void @llvm.assume(i1 %74)
  %75 = shl i32 %.tr.i, 12
  %76 = sext i32 %4 to i64
  %77 = sext i32 %5 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 16384
  %82 = and i64 %73, 63
  %83 = icmp slt i64 %82, %77
  br label %105

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1190.i
  %84 = phi i64 [ %49, %.lr.ph1190.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 6
  %86 = shl nuw nsw i64 %84, 5
  %87 = and i64 %86, 2016
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0564.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !19
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0564.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  %93 = add nuw nsw i64 %84, 256
  %94 = icmp ult i64 %84, 1792
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph1193.i, !llvm.loop !28

.lr.ph1196.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %100 = icmp ult i64 %99, 256
  call void @llvm.assume(i1 %100)
  %101 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %102 = inttoptr i32 %101 to ptr addrspace(3)
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 16384
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 24576
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i

105:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1193.i
  %106 = phi i64 [ %73, %.lr.ph1193.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %107 = lshr i64 %106, 6
  %108 = icmp slt i64 %107, %76
  %109 = and i1 %108, %83
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

110:                                              ; preds = %105
  %111 = and i64 %106, 9223372036854775744
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %82
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0414.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %110, %105
  %.sroa.0416.1.i = phi i16 [ %.sroa.0414.0.copyload.i, %110 ], [ 0, %105 ]
  %115 = trunc i64 %106 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0416.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !19
  %117 = add nuw nsw i64 %106, 256
  %118 = icmp ult i64 %106, 3840
  br i1 %118, label %105, label %.lr.ph1196.i, !llvm.loop !29

.lr.ph1199.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
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
  %124 = icmp ult i64 %123, 256
  call void @llvm.assume(i1 %124)
  %125 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %126 = inttoptr i32 %125 to ptr addrspace(3)
  %127 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 12288
  %128 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 24576
  %129 = and i64 %123, 15
  %130 = or disjoint i64 %129, 16
  %131 = or disjoint i64 %129, 32
  %132 = or disjoint i64 %129, 48
  br label %157

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph1196.i
  %133 = phi i64 [ %99, %.lr.ph1196.i ], [ %142, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %134 = lshr i64 %133, 6
  %135 = shl nuw nsw i64 %133, 6
  %136 = and i64 %135, 4032
  %137 = or disjoint i64 %136, %134
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %138
  %.sroa.0565.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !19
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %140
  store i16 %.sroa.0565.0.copyload.i, ptr addrspace(3) %141, align 2, !tbaa.struct !19
  %142 = add nuw nsw i64 %133, 256
  %143 = icmp ult i64 %133, 3840
  br i1 %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph1199.i, !llvm.loop !30

.lr.ph1202.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %144 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %145 = icmp eq i64 %144, 0
  call void @llvm.assume(i1 %145)
  %146 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %147 = icmp eq i64 %146, 0
  call void @llvm.assume(i1 %147)
  %148 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %149 = icmp ult i64 %148, 256
  call void @llvm.assume(i1 %149)
  %150 = sext i32 %3 to i64
  %151 = sext i32 %4 to i64
  %152 = call i32 @llvm.amdgcn.groupstaticsize()
  %153 = inttoptr i32 %152 to ptr addrspace(3)
  %154 = sext i32 %30 to i64
  %155 = and i64 %148, 63
  %156 = icmp slt i64 %155, %151
  br label %682

157:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph1199.i
  %158 = phi i64 [ %123, %.lr.ph1199.i ], [ %173, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %159 = shl nuw nsw i64 %158, 2
  %160 = and i64 %159, 9223372036854775744
  br label %175

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %161 = or disjoint i64 %160, %129
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %162
  store float %604, ptr addrspace(3) %163, align 4, !tbaa !31
  %164 = or disjoint i64 %160, %130
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %165
  store float %629, ptr addrspace(3) %166, align 4, !tbaa !31
  %167 = or disjoint i64 %160, %131
  %168 = trunc i64 %167 to i32
  %169 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %168
  store float %654, ptr addrspace(3) %169, align 4, !tbaa !31
  %170 = or disjoint i64 %160, %132
  %171 = trunc i64 %170 to i32
  %172 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %171
  store float %679, ptr addrspace(3) %172, align 4, !tbaa !31
  %173 = add nuw nsw i64 %158, 256
  %174 = icmp ult i64 %158, 256
  br i1 %174, label %157, label %.lr.ph1202.i, !llvm.loop !33

175:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %157
  %176 = phi i64 [ 0, %157 ], [ %680, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %177 = phi float [ 0.000000e+00, %157 ], [ %679, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %178 = phi float [ 0.000000e+00, %157 ], [ %654, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %179 = phi float [ 0.000000e+00, %157 ], [ %629, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %180 = phi float [ 0.000000e+00, %157 ], [ %604, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %181 = add nuw nsw i64 %176, %160
  %182 = trunc i64 %181 to i32
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %182
  %.sroa.0373.0.copyload.i = load i16, ptr addrspace(3) %183, align 2, !tbaa.struct !19
  %184 = shl nuw nsw i64 %176, 6
  %185 = or disjoint i64 %184, %129
  %186 = trunc i64 %185 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %186
  %.sroa.0364.0.copyload.i = load i16, ptr addrspace(3) %187, align 2, !tbaa.struct !19
  %188 = zext i16 %.sroa.0373.0.copyload.i to i32
  %189 = lshr i32 %188, 10
  %190 = and i32 %189, 31
  %191 = and i32 %188, 1023
  switch i32 %190, label %197 [
    i32 31, label %192
    i32 0, label %199
  ]

192:                                              ; preds = %175
  %.sroa.0373.0.copyload.signext.i = sext i16 %.sroa.0373.0.copyload.i to i32
  %193 = and i32 %.sroa.0373.0.copyload.signext.i, -2147483648
  %.not1175.i = icmp eq i32 %191, 0
  %194 = select i1 %.not1175.i, i32 2139095040, i32 2143289344
  %195 = or disjoint i32 %194, %193
  %196 = bitcast i32 %195 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i

197:                                              ; preds = %175
  %198 = or disjoint i32 %191, 1024
  br label %199

199:                                              ; preds = %197, %175
  %200 = phi i32 [ %198, %197 ], [ %191, %175 ]
  %201 = uitofp i32 %200 to float
  %.not.i = icmp eq i32 %190, 0
  %202 = add nsw i32 %190, -25
  %203 = select i1 %.not.i, i32 -24, i32 %202
  %204 = call float @__ocml_ldexp_f32(float noundef %201, i32 noundef %203) #5
  %205 = fneg contract float %204
  %.not10971098.i = icmp slt i16 %.sroa.0373.0.copyload.i, 0
  %206 = select contract i1 %.not10971098.i, float %205, float %204
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i: ; preds = %199, %192
  %207 = phi float [ %196, %192 ], [ %206, %199 ]
  %208 = zext i16 %.sroa.0364.0.copyload.i to i32
  %209 = lshr i32 %208, 10
  %210 = and i32 %209, 31
  %211 = and i32 %208, 1023
  switch i32 %210, label %217 [
    i32 31, label %212
    i32 0, label %219
  ]

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i
  %.sroa.0364.0.copyload.signext.i = sext i16 %.sroa.0364.0.copyload.i to i32
  %213 = and i32 %.sroa.0364.0.copyload.signext.i, -2147483648
  %.not1174.i = icmp eq i32 %211, 0
  %214 = select i1 %.not1174.i, i32 2139095040, i32 2143289344
  %215 = or disjoint i32 %214, %213
  %216 = bitcast i32 %215 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i
  %218 = or disjoint i32 %211, 1024
  br label %219

219:                                              ; preds = %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i
  %220 = phi i32 [ %218, %217 ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i ]
  %221 = uitofp i32 %220 to float
  %.not1099.i = icmp eq i32 %210, 0
  %222 = add nsw i32 %210, -25
  %223 = select i1 %.not1099.i, i32 -24, i32 %222
  %224 = call float @__ocml_ldexp_f32(float noundef %221, i32 noundef %223) #5
  %225 = fneg contract float %224
  %.not11001101.i = icmp slt i16 %.sroa.0364.0.copyload.i, 0
  %226 = select contract i1 %.not11001101.i, float %225, float %224
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i: ; preds = %219, %212
  %227 = phi float [ %216, %212 ], [ %226, %219 ]
  %228 = fmul contract float %207, %227
  %229 = fadd contract float %180, %228
  %230 = or disjoint i64 %184, %130
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %231
  %.sroa.0355.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !19
  %233 = zext i16 %.sroa.0355.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i
  %.sroa.0355.0.copyload.signext.i = sext i16 %.sroa.0355.0.copyload.i to i32
  %238 = and i32 %.sroa.0355.0.copyload.signext.i, -2147483648
  %.not1173.i = icmp eq i32 %236, 0
  %239 = select i1 %.not1173.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i
  %245 = phi i32 [ %243, %242 ], [ %236, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i ]
  %246 = uitofp i32 %245 to float
  %.not1102.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not1102.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #5
  %250 = fneg contract float %249
  %.not11031104.i = icmp slt i16 %.sroa.0355.0.copyload.i, 0
  %251 = select contract i1 %.not11031104.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = fmul contract float %207, %252
  %254 = fadd contract float %179, %253
  %255 = or disjoint i64 %184, %131
  %256 = trunc i64 %255 to i32
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %256
  %.sroa.0346.0.copyload.i = load i16, ptr addrspace(3) %257, align 2, !tbaa.struct !19
  %258 = zext i16 %.sroa.0346.0.copyload.i to i32
  %259 = lshr i32 %258, 10
  %260 = and i32 %259, 31
  %261 = and i32 %258, 1023
  switch i32 %260, label %267 [
    i32 31, label %262
    i32 0, label %269
  ]

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i
  %.sroa.0346.0.copyload.signext.i = sext i16 %.sroa.0346.0.copyload.i to i32
  %263 = and i32 %.sroa.0346.0.copyload.signext.i, -2147483648
  %.not1172.i = icmp eq i32 %261, 0
  %264 = select i1 %.not1172.i, i32 2139095040, i32 2143289344
  %265 = or disjoint i32 %264, %263
  %266 = bitcast i32 %265 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i
  %268 = or disjoint i32 %261, 1024
  br label %269

269:                                              ; preds = %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i
  %270 = phi i32 [ %268, %267 ], [ %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i ]
  %271 = uitofp i32 %270 to float
  %.not1105.i = icmp eq i32 %260, 0
  %272 = add nsw i32 %260, -25
  %273 = select i1 %.not1105.i, i32 -24, i32 %272
  %274 = call float @__ocml_ldexp_f32(float noundef %271, i32 noundef %273) #5
  %275 = fneg contract float %274
  %.not11061107.i = icmp slt i16 %.sroa.0346.0.copyload.i, 0
  %276 = select contract i1 %.not11061107.i, float %275, float %274
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i: ; preds = %269, %262
  %277 = phi float [ %266, %262 ], [ %276, %269 ]
  %278 = fmul contract float %207, %277
  %279 = fadd contract float %178, %278
  %280 = or disjoint i64 %184, %132
  %281 = trunc i64 %280 to i32
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %281
  %.sroa.0337.0.copyload.i = load i16, ptr addrspace(3) %282, align 2, !tbaa.struct !19
  %283 = zext i16 %.sroa.0337.0.copyload.i to i32
  %284 = lshr i32 %283, 10
  %285 = and i32 %284, 31
  %286 = and i32 %283, 1023
  switch i32 %285, label %292 [
    i32 31, label %287
    i32 0, label %294
  ]

287:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i
  %.sroa.0337.0.copyload.signext.i = sext i16 %.sroa.0337.0.copyload.i to i32
  %288 = and i32 %.sroa.0337.0.copyload.signext.i, -2147483648
  %.not1171.i = icmp eq i32 %286, 0
  %289 = select i1 %.not1171.i, i32 2139095040, i32 2143289344
  %290 = or disjoint i32 %289, %288
  %291 = bitcast i32 %290 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

292:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i
  %293 = or disjoint i32 %286, 1024
  br label %294

294:                                              ; preds = %292, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i
  %295 = phi i32 [ %293, %292 ], [ %286, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i ]
  %296 = uitofp i32 %295 to float
  %.not1108.i = icmp eq i32 %285, 0
  %297 = add nsw i32 %285, -25
  %298 = select i1 %.not1108.i, i32 -24, i32 %297
  %299 = call float @__ocml_ldexp_f32(float noundef %296, i32 noundef %298) #5
  %300 = fneg contract float %299
  %.not11091110.i = icmp slt i16 %.sroa.0337.0.copyload.i, 0
  %301 = select contract i1 %.not11091110.i, float %300, float %299
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i: ; preds = %294, %287
  %302 = phi float [ %291, %287 ], [ %301, %294 ]
  %303 = fmul contract float %207, %302
  %304 = fadd contract float %177, %303
  %305 = or disjoint i64 %176, 1
  %306 = add nuw nsw i64 %305, %160
  %307 = trunc i64 %306 to i32
  %308 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %307
  %.sroa.0328.0.copyload.i = load i16, ptr addrspace(3) %308, align 2, !tbaa.struct !19
  %309 = shl nuw nsw i64 %305, 6
  %310 = or disjoint i64 %309, %129
  %311 = trunc i64 %310 to i32
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %311
  %.sroa.0319.0.copyload.i = load i16, ptr addrspace(3) %312, align 2, !tbaa.struct !19
  %313 = zext i16 %.sroa.0328.0.copyload.i to i32
  %314 = lshr i32 %313, 10
  %315 = and i32 %314, 31
  %316 = and i32 %313, 1023
  switch i32 %315, label %322 [
    i32 31, label %317
    i32 0, label %324
  ]

317:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %.sroa.0328.0.copyload.signext.i = sext i16 %.sroa.0328.0.copyload.i to i32
  %318 = and i32 %.sroa.0328.0.copyload.signext.i, -2147483648
  %.not1170.i = icmp eq i32 %316, 0
  %319 = select i1 %.not1170.i, i32 2139095040, i32 2143289344
  %320 = or disjoint i32 %319, %318
  %321 = bitcast i32 %320 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

322:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %323 = or disjoint i32 %316, 1024
  br label %324

324:                                              ; preds = %322, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %325 = phi i32 [ %323, %322 ], [ %316, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i ]
  %326 = uitofp i32 %325 to float
  %.not1111.i = icmp eq i32 %315, 0
  %327 = add nsw i32 %315, -25
  %328 = select i1 %.not1111.i, i32 -24, i32 %327
  %329 = call float @__ocml_ldexp_f32(float noundef %326, i32 noundef %328) #5
  %330 = fneg contract float %329
  %.not11121113.i = icmp slt i16 %.sroa.0328.0.copyload.i, 0
  %331 = select contract i1 %.not11121113.i, float %330, float %329
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i: ; preds = %324, %317
  %332 = phi float [ %321, %317 ], [ %331, %324 ]
  %333 = zext i16 %.sroa.0319.0.copyload.i to i32
  %334 = lshr i32 %333, 10
  %335 = and i32 %334, 31
  %336 = and i32 %333, 1023
  switch i32 %335, label %342 [
    i32 31, label %337
    i32 0, label %344
  ]

337:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %.sroa.0319.0.copyload.signext.i = sext i16 %.sroa.0319.0.copyload.i to i32
  %338 = and i32 %.sroa.0319.0.copyload.signext.i, -2147483648
  %.not1169.i = icmp eq i32 %336, 0
  %339 = select i1 %.not1169.i, i32 2139095040, i32 2143289344
  %340 = or disjoint i32 %339, %338
  %341 = bitcast i32 %340 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

342:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %343 = or disjoint i32 %336, 1024
  br label %344

344:                                              ; preds = %342, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %345 = phi i32 [ %343, %342 ], [ %336, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i ]
  %346 = uitofp i32 %345 to float
  %.not1114.i = icmp eq i32 %335, 0
  %347 = add nsw i32 %335, -25
  %348 = select i1 %.not1114.i, i32 -24, i32 %347
  %349 = call float @__ocml_ldexp_f32(float noundef %346, i32 noundef %348) #5
  %350 = fneg contract float %349
  %.not11151116.i = icmp slt i16 %.sroa.0319.0.copyload.i, 0
  %351 = select contract i1 %.not11151116.i, float %350, float %349
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i: ; preds = %344, %337
  %352 = phi float [ %341, %337 ], [ %351, %344 ]
  %353 = fmul contract float %332, %352
  %354 = fadd contract float %229, %353
  %355 = or disjoint i64 %309, %130
  %356 = trunc i64 %355 to i32
  %357 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %356
  %.sroa.0310.0.copyload.i = load i16, ptr addrspace(3) %357, align 2, !tbaa.struct !19
  %358 = zext i16 %.sroa.0310.0.copyload.i to i32
  %359 = lshr i32 %358, 10
  %360 = and i32 %359, 31
  %361 = and i32 %358, 1023
  switch i32 %360, label %367 [
    i32 31, label %362
    i32 0, label %369
  ]

362:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %.sroa.0310.0.copyload.signext.i = sext i16 %.sroa.0310.0.copyload.i to i32
  %363 = and i32 %.sroa.0310.0.copyload.signext.i, -2147483648
  %.not1168.i = icmp eq i32 %361, 0
  %364 = select i1 %.not1168.i, i32 2139095040, i32 2143289344
  %365 = or disjoint i32 %364, %363
  %366 = bitcast i32 %365 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

367:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %368 = or disjoint i32 %361, 1024
  br label %369

369:                                              ; preds = %367, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %370 = phi i32 [ %368, %367 ], [ %361, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i ]
  %371 = uitofp i32 %370 to float
  %.not1117.i = icmp eq i32 %360, 0
  %372 = add nsw i32 %360, -25
  %373 = select i1 %.not1117.i, i32 -24, i32 %372
  %374 = call float @__ocml_ldexp_f32(float noundef %371, i32 noundef %373) #5
  %375 = fneg contract float %374
  %.not11181119.i = icmp slt i16 %.sroa.0310.0.copyload.i, 0
  %376 = select contract i1 %.not11181119.i, float %375, float %374
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i: ; preds = %369, %362
  %377 = phi float [ %366, %362 ], [ %376, %369 ]
  %378 = fmul contract float %332, %377
  %379 = fadd contract float %254, %378
  %380 = or disjoint i64 %309, %131
  %381 = trunc i64 %380 to i32
  %382 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %381
  %.sroa.0301.0.copyload.i = load i16, ptr addrspace(3) %382, align 2, !tbaa.struct !19
  %383 = zext i16 %.sroa.0301.0.copyload.i to i32
  %384 = lshr i32 %383, 10
  %385 = and i32 %384, 31
  %386 = and i32 %383, 1023
  switch i32 %385, label %392 [
    i32 31, label %387
    i32 0, label %394
  ]

387:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %.sroa.0301.0.copyload.signext.i = sext i16 %.sroa.0301.0.copyload.i to i32
  %388 = and i32 %.sroa.0301.0.copyload.signext.i, -2147483648
  %.not1167.i = icmp eq i32 %386, 0
  %389 = select i1 %.not1167.i, i32 2139095040, i32 2143289344
  %390 = or disjoint i32 %389, %388
  %391 = bitcast i32 %390 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

392:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %393 = or disjoint i32 %386, 1024
  br label %394

394:                                              ; preds = %392, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %395 = phi i32 [ %393, %392 ], [ %386, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i ]
  %396 = uitofp i32 %395 to float
  %.not1120.i = icmp eq i32 %385, 0
  %397 = add nsw i32 %385, -25
  %398 = select i1 %.not1120.i, i32 -24, i32 %397
  %399 = call float @__ocml_ldexp_f32(float noundef %396, i32 noundef %398) #5
  %400 = fneg contract float %399
  %.not11211122.i = icmp slt i16 %.sroa.0301.0.copyload.i, 0
  %401 = select contract i1 %.not11211122.i, float %400, float %399
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i: ; preds = %394, %387
  %402 = phi float [ %391, %387 ], [ %401, %394 ]
  %403 = fmul contract float %332, %402
  %404 = fadd contract float %279, %403
  %405 = or disjoint i64 %309, %132
  %406 = trunc i64 %405 to i32
  %407 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %406
  %.sroa.0292.0.copyload.i = load i16, ptr addrspace(3) %407, align 2, !tbaa.struct !19
  %408 = zext i16 %.sroa.0292.0.copyload.i to i32
  %409 = lshr i32 %408, 10
  %410 = and i32 %409, 31
  %411 = and i32 %408, 1023
  switch i32 %410, label %417 [
    i32 31, label %412
    i32 0, label %419
  ]

412:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %.sroa.0292.0.copyload.signext.i = sext i16 %.sroa.0292.0.copyload.i to i32
  %413 = and i32 %.sroa.0292.0.copyload.signext.i, -2147483648
  %.not1166.i = icmp eq i32 %411, 0
  %414 = select i1 %.not1166.i, i32 2139095040, i32 2143289344
  %415 = or disjoint i32 %414, %413
  %416 = bitcast i32 %415 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

417:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %418 = or disjoint i32 %411, 1024
  br label %419

419:                                              ; preds = %417, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %420 = phi i32 [ %418, %417 ], [ %411, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i ]
  %421 = uitofp i32 %420 to float
  %.not1123.i = icmp eq i32 %410, 0
  %422 = add nsw i32 %410, -25
  %423 = select i1 %.not1123.i, i32 -24, i32 %422
  %424 = call float @__ocml_ldexp_f32(float noundef %421, i32 noundef %423) #5
  %425 = fneg contract float %424
  %.not11241125.i = icmp slt i16 %.sroa.0292.0.copyload.i, 0
  %426 = select contract i1 %.not11241125.i, float %425, float %424
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i: ; preds = %419, %412
  %427 = phi float [ %416, %412 ], [ %426, %419 ]
  %428 = fmul contract float %332, %427
  %429 = fadd contract float %304, %428
  %430 = or disjoint i64 %176, 2
  %431 = add nuw nsw i64 %430, %160
  %432 = trunc i64 %431 to i32
  %433 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %432
  %.sroa.0283.0.copyload.i = load i16, ptr addrspace(3) %433, align 2, !tbaa.struct !19
  %434 = shl nuw nsw i64 %430, 6
  %435 = or disjoint i64 %434, %129
  %436 = trunc i64 %435 to i32
  %437 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %436
  %.sroa.0274.0.copyload.i = load i16, ptr addrspace(3) %437, align 2, !tbaa.struct !19
  %438 = zext i16 %.sroa.0283.0.copyload.i to i32
  %439 = lshr i32 %438, 10
  %440 = and i32 %439, 31
  %441 = and i32 %438, 1023
  switch i32 %440, label %447 [
    i32 31, label %442
    i32 0, label %449
  ]

442:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %.sroa.0283.0.copyload.signext.i = sext i16 %.sroa.0283.0.copyload.i to i32
  %443 = and i32 %.sroa.0283.0.copyload.signext.i, -2147483648
  %.not1165.i = icmp eq i32 %441, 0
  %444 = select i1 %.not1165.i, i32 2139095040, i32 2143289344
  %445 = or disjoint i32 %444, %443
  %446 = bitcast i32 %445 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

447:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %448 = or disjoint i32 %441, 1024
  br label %449

449:                                              ; preds = %447, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %450 = phi i32 [ %448, %447 ], [ %441, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i ]
  %451 = uitofp i32 %450 to float
  %.not1126.i = icmp eq i32 %440, 0
  %452 = add nsw i32 %440, -25
  %453 = select i1 %.not1126.i, i32 -24, i32 %452
  %454 = call float @__ocml_ldexp_f32(float noundef %451, i32 noundef %453) #5
  %455 = fneg contract float %454
  %.not11271128.i = icmp slt i16 %.sroa.0283.0.copyload.i, 0
  %456 = select contract i1 %.not11271128.i, float %455, float %454
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i: ; preds = %449, %442
  %457 = phi float [ %446, %442 ], [ %456, %449 ]
  %458 = zext i16 %.sroa.0274.0.copyload.i to i32
  %459 = lshr i32 %458, 10
  %460 = and i32 %459, 31
  %461 = and i32 %458, 1023
  switch i32 %460, label %467 [
    i32 31, label %462
    i32 0, label %469
  ]

462:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %.sroa.0274.0.copyload.signext.i = sext i16 %.sroa.0274.0.copyload.i to i32
  %463 = and i32 %.sroa.0274.0.copyload.signext.i, -2147483648
  %.not1164.i = icmp eq i32 %461, 0
  %464 = select i1 %.not1164.i, i32 2139095040, i32 2143289344
  %465 = or disjoint i32 %464, %463
  %466 = bitcast i32 %465 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

467:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %468 = or disjoint i32 %461, 1024
  br label %469

469:                                              ; preds = %467, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %470 = phi i32 [ %468, %467 ], [ %461, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i ]
  %471 = uitofp i32 %470 to float
  %.not1129.i = icmp eq i32 %460, 0
  %472 = add nsw i32 %460, -25
  %473 = select i1 %.not1129.i, i32 -24, i32 %472
  %474 = call float @__ocml_ldexp_f32(float noundef %471, i32 noundef %473) #5
  %475 = fneg contract float %474
  %.not11301131.i = icmp slt i16 %.sroa.0274.0.copyload.i, 0
  %476 = select contract i1 %.not11301131.i, float %475, float %474
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i: ; preds = %469, %462
  %477 = phi float [ %466, %462 ], [ %476, %469 ]
  %478 = fmul contract float %457, %477
  %479 = fadd contract float %354, %478
  %480 = or disjoint i64 %434, %130
  %481 = trunc i64 %480 to i32
  %482 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %481
  %.sroa.0265.0.copyload.i = load i16, ptr addrspace(3) %482, align 2, !tbaa.struct !19
  %483 = zext i16 %.sroa.0265.0.copyload.i to i32
  %484 = lshr i32 %483, 10
  %485 = and i32 %484, 31
  %486 = and i32 %483, 1023
  switch i32 %485, label %492 [
    i32 31, label %487
    i32 0, label %494
  ]

487:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %.sroa.0265.0.copyload.signext.i = sext i16 %.sroa.0265.0.copyload.i to i32
  %488 = and i32 %.sroa.0265.0.copyload.signext.i, -2147483648
  %.not1163.i = icmp eq i32 %486, 0
  %489 = select i1 %.not1163.i, i32 2139095040, i32 2143289344
  %490 = or disjoint i32 %489, %488
  %491 = bitcast i32 %490 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

492:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %493 = or disjoint i32 %486, 1024
  br label %494

494:                                              ; preds = %492, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %495 = phi i32 [ %493, %492 ], [ %486, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i ]
  %496 = uitofp i32 %495 to float
  %.not1132.i = icmp eq i32 %485, 0
  %497 = add nsw i32 %485, -25
  %498 = select i1 %.not1132.i, i32 -24, i32 %497
  %499 = call float @__ocml_ldexp_f32(float noundef %496, i32 noundef %498) #5
  %500 = fneg contract float %499
  %.not11331134.i = icmp slt i16 %.sroa.0265.0.copyload.i, 0
  %501 = select contract i1 %.not11331134.i, float %500, float %499
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %494, %487
  %502 = phi float [ %491, %487 ], [ %501, %494 ]
  %503 = fmul contract float %457, %502
  %504 = fadd contract float %379, %503
  %505 = or disjoint i64 %434, %131
  %506 = trunc i64 %505 to i32
  %507 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %506
  %.sroa.0256.0.copyload.i = load i16, ptr addrspace(3) %507, align 2, !tbaa.struct !19
  %508 = zext i16 %.sroa.0256.0.copyload.i to i32
  %509 = lshr i32 %508, 10
  %510 = and i32 %509, 31
  %511 = and i32 %508, 1023
  switch i32 %510, label %517 [
    i32 31, label %512
    i32 0, label %519
  ]

512:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0256.0.copyload.signext.i = sext i16 %.sroa.0256.0.copyload.i to i32
  %513 = and i32 %.sroa.0256.0.copyload.signext.i, -2147483648
  %.not1162.i = icmp eq i32 %511, 0
  %514 = select i1 %.not1162.i, i32 2139095040, i32 2143289344
  %515 = or disjoint i32 %514, %513
  %516 = bitcast i32 %515 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

517:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %518 = or disjoint i32 %511, 1024
  br label %519

519:                                              ; preds = %517, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %520 = phi i32 [ %518, %517 ], [ %511, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %521 = uitofp i32 %520 to float
  %.not1135.i = icmp eq i32 %510, 0
  %522 = add nsw i32 %510, -25
  %523 = select i1 %.not1135.i, i32 -24, i32 %522
  %524 = call float @__ocml_ldexp_f32(float noundef %521, i32 noundef %523) #5
  %525 = fneg contract float %524
  %.not11361137.i = icmp slt i16 %.sroa.0256.0.copyload.i, 0
  %526 = select contract i1 %.not11361137.i, float %525, float %524
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %519, %512
  %527 = phi float [ %516, %512 ], [ %526, %519 ]
  %528 = fmul contract float %457, %527
  %529 = fadd contract float %404, %528
  %530 = or disjoint i64 %434, %132
  %531 = trunc i64 %530 to i32
  %532 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %531
  %.sroa.0247.0.copyload.i = load i16, ptr addrspace(3) %532, align 2, !tbaa.struct !19
  %533 = zext i16 %.sroa.0247.0.copyload.i to i32
  %534 = lshr i32 %533, 10
  %535 = and i32 %534, 31
  %536 = and i32 %533, 1023
  switch i32 %535, label %542 [
    i32 31, label %537
    i32 0, label %544
  ]

537:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0247.0.copyload.signext.i = sext i16 %.sroa.0247.0.copyload.i to i32
  %538 = and i32 %.sroa.0247.0.copyload.signext.i, -2147483648
  %.not1161.i = icmp eq i32 %536, 0
  %539 = select i1 %.not1161.i, i32 2139095040, i32 2143289344
  %540 = or disjoint i32 %539, %538
  %541 = bitcast i32 %540 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

542:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %543 = or disjoint i32 %536, 1024
  br label %544

544:                                              ; preds = %542, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %545 = phi i32 [ %543, %542 ], [ %536, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %546 = uitofp i32 %545 to float
  %.not1138.i = icmp eq i32 %535, 0
  %547 = add nsw i32 %535, -25
  %548 = select i1 %.not1138.i, i32 -24, i32 %547
  %549 = call float @__ocml_ldexp_f32(float noundef %546, i32 noundef %548) #5
  %550 = fneg contract float %549
  %.not11391140.i = icmp slt i16 %.sroa.0247.0.copyload.i, 0
  %551 = select contract i1 %.not11391140.i, float %550, float %549
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %544, %537
  %552 = phi float [ %541, %537 ], [ %551, %544 ]
  %553 = fmul contract float %457, %552
  %554 = fadd contract float %429, %553
  %555 = or disjoint i64 %176, 3
  %556 = add nuw nsw i64 %555, %160
  %557 = trunc i64 %556 to i32
  %558 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %557
  %.sroa.0238.0.copyload.i = load i16, ptr addrspace(3) %558, align 2, !tbaa.struct !19
  %559 = shl nuw nsw i64 %555, 6
  %560 = or disjoint i64 %559, %129
  %561 = trunc i64 %560 to i32
  %562 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %561
  %.sroa.0229.0.copyload.i = load i16, ptr addrspace(3) %562, align 2, !tbaa.struct !19
  %563 = zext i16 %.sroa.0238.0.copyload.i to i32
  %564 = lshr i32 %563, 10
  %565 = and i32 %564, 31
  %566 = and i32 %563, 1023
  switch i32 %565, label %572 [
    i32 31, label %567
    i32 0, label %574
  ]

567:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0238.0.copyload.signext.i = sext i16 %.sroa.0238.0.copyload.i to i32
  %568 = and i32 %.sroa.0238.0.copyload.signext.i, -2147483648
  %.not1160.i = icmp eq i32 %566, 0
  %569 = select i1 %.not1160.i, i32 2139095040, i32 2143289344
  %570 = or disjoint i32 %569, %568
  %571 = bitcast i32 %570 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

572:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %573 = or disjoint i32 %566, 1024
  br label %574

574:                                              ; preds = %572, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %575 = phi i32 [ %573, %572 ], [ %566, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %576 = uitofp i32 %575 to float
  %.not1141.i = icmp eq i32 %565, 0
  %577 = add nsw i32 %565, -25
  %578 = select i1 %.not1141.i, i32 -24, i32 %577
  %579 = call float @__ocml_ldexp_f32(float noundef %576, i32 noundef %578) #5
  %580 = fneg contract float %579
  %.not11421143.i = icmp slt i16 %.sroa.0238.0.copyload.i, 0
  %581 = select contract i1 %.not11421143.i, float %580, float %579
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %574, %567
  %582 = phi float [ %571, %567 ], [ %581, %574 ]
  %583 = zext i16 %.sroa.0229.0.copyload.i to i32
  %584 = lshr i32 %583, 10
  %585 = and i32 %584, 31
  %586 = and i32 %583, 1023
  switch i32 %585, label %592 [
    i32 31, label %587
    i32 0, label %594
  ]

587:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0229.0.copyload.signext.i = sext i16 %.sroa.0229.0.copyload.i to i32
  %588 = and i32 %.sroa.0229.0.copyload.signext.i, -2147483648
  %.not1159.i = icmp eq i32 %586, 0
  %589 = select i1 %.not1159.i, i32 2139095040, i32 2143289344
  %590 = or disjoint i32 %589, %588
  %591 = bitcast i32 %590 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

592:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %593 = or disjoint i32 %586, 1024
  br label %594

594:                                              ; preds = %592, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %595 = phi i32 [ %593, %592 ], [ %586, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %596 = uitofp i32 %595 to float
  %.not1144.i = icmp eq i32 %585, 0
  %597 = add nsw i32 %585, -25
  %598 = select i1 %.not1144.i, i32 -24, i32 %597
  %599 = call float @__ocml_ldexp_f32(float noundef %596, i32 noundef %598) #5
  %600 = fneg contract float %599
  %.not11451146.i = icmp slt i16 %.sroa.0229.0.copyload.i, 0
  %601 = select contract i1 %.not11451146.i, float %600, float %599
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %594, %587
  %602 = phi float [ %591, %587 ], [ %601, %594 ]
  %603 = fmul contract float %582, %602
  %604 = fadd contract float %479, %603
  %605 = or disjoint i64 %559, %130
  %606 = trunc i64 %605 to i32
  %607 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %606
  %.sroa.0220.0.copyload.i = load i16, ptr addrspace(3) %607, align 2, !tbaa.struct !19
  %608 = zext i16 %.sroa.0220.0.copyload.i to i32
  %609 = lshr i32 %608, 10
  %610 = and i32 %609, 31
  %611 = and i32 %608, 1023
  switch i32 %610, label %617 [
    i32 31, label %612
    i32 0, label %619
  ]

612:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0220.0.copyload.signext.i = sext i16 %.sroa.0220.0.copyload.i to i32
  %613 = and i32 %.sroa.0220.0.copyload.signext.i, -2147483648
  %.not1158.i = icmp eq i32 %611, 0
  %614 = select i1 %.not1158.i, i32 2139095040, i32 2143289344
  %615 = or disjoint i32 %614, %613
  %616 = bitcast i32 %615 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

617:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %618 = or disjoint i32 %611, 1024
  br label %619

619:                                              ; preds = %617, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %620 = phi i32 [ %618, %617 ], [ %611, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %621 = uitofp i32 %620 to float
  %.not1147.i = icmp eq i32 %610, 0
  %622 = add nsw i32 %610, -25
  %623 = select i1 %.not1147.i, i32 -24, i32 %622
  %624 = call float @__ocml_ldexp_f32(float noundef %621, i32 noundef %623) #5
  %625 = fneg contract float %624
  %.not11481149.i = icmp slt i16 %.sroa.0220.0.copyload.i, 0
  %626 = select contract i1 %.not11481149.i, float %625, float %624
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %619, %612
  %627 = phi float [ %616, %612 ], [ %626, %619 ]
  %628 = fmul contract float %582, %627
  %629 = fadd contract float %504, %628
  %630 = or disjoint i64 %559, %131
  %631 = trunc i64 %630 to i32
  %632 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %631
  %.sroa.0211.0.copyload.i = load i16, ptr addrspace(3) %632, align 2, !tbaa.struct !19
  %633 = zext i16 %.sroa.0211.0.copyload.i to i32
  %634 = lshr i32 %633, 10
  %635 = and i32 %634, 31
  %636 = and i32 %633, 1023
  switch i32 %635, label %642 [
    i32 31, label %637
    i32 0, label %644
  ]

637:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0211.0.copyload.signext.i = sext i16 %.sroa.0211.0.copyload.i to i32
  %638 = and i32 %.sroa.0211.0.copyload.signext.i, -2147483648
  %.not1157.i = icmp eq i32 %636, 0
  %639 = select i1 %.not1157.i, i32 2139095040, i32 2143289344
  %640 = or disjoint i32 %639, %638
  %641 = bitcast i32 %640 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

642:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %643 = or disjoint i32 %636, 1024
  br label %644

644:                                              ; preds = %642, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %645 = phi i32 [ %643, %642 ], [ %636, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %646 = uitofp i32 %645 to float
  %.not1150.i = icmp eq i32 %635, 0
  %647 = add nsw i32 %635, -25
  %648 = select i1 %.not1150.i, i32 -24, i32 %647
  %649 = call float @__ocml_ldexp_f32(float noundef %646, i32 noundef %648) #5
  %650 = fneg contract float %649
  %.not11511152.i = icmp slt i16 %.sroa.0211.0.copyload.i, 0
  %651 = select contract i1 %.not11511152.i, float %650, float %649
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %644, %637
  %652 = phi float [ %641, %637 ], [ %651, %644 ]
  %653 = fmul contract float %582, %652
  %654 = fadd contract float %529, %653
  %655 = or disjoint i64 %559, %132
  %656 = trunc i64 %655 to i32
  %657 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %656
  %.sroa.0202.0.copyload.i = load i16, ptr addrspace(3) %657, align 2, !tbaa.struct !19
  %658 = zext i16 %.sroa.0202.0.copyload.i to i32
  %659 = lshr i32 %658, 10
  %660 = and i32 %659, 31
  %661 = and i32 %658, 1023
  switch i32 %660, label %667 [
    i32 31, label %662
    i32 0, label %669
  ]

662:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0202.0.copyload.signext.i = sext i16 %.sroa.0202.0.copyload.i to i32
  %663 = and i32 %.sroa.0202.0.copyload.signext.i, -2147483648
  %.not1156.i = icmp eq i32 %661, 0
  %664 = select i1 %.not1156.i, i32 2139095040, i32 2143289344
  %665 = or disjoint i32 %664, %663
  %666 = bitcast i32 %665 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

667:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %668 = or disjoint i32 %661, 1024
  br label %669

669:                                              ; preds = %667, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %670 = phi i32 [ %668, %667 ], [ %661, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %671 = uitofp i32 %670 to float
  %.not1153.i = icmp eq i32 %660, 0
  %672 = add nsw i32 %660, -25
  %673 = select i1 %.not1153.i, i32 -24, i32 %672
  %674 = call float @__ocml_ldexp_f32(float noundef %671, i32 noundef %673) #5
  %675 = fneg contract float %674
  %.not11541155.i = icmp slt i16 %.sroa.0202.0.copyload.i, 0
  %676 = select contract i1 %.not11541155.i, float %675, float %674
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %669, %662
  %677 = phi float [ %666, %662 ], [ %676, %669 ]
  %678 = fmul contract float %582, %677
  %679 = fadd contract float %554, %678
  %680 = add nuw nsw i64 %176, 4
  %681 = icmp ult i64 %176, 60
  br i1 %681, label %175, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, !llvm.loop !34

682:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i, %.lr.ph1202.i
  %683 = phi i64 [ %148, %.lr.ph1202.i ], [ %695, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i ]
  %684 = lshr i64 %683, 6
  %685 = icmp slt i64 %684, %150
  %686 = and i1 %685, %156
  br i1 %686, label %687, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

687:                                              ; preds = %682
  %688 = trunc i64 %683 to i32
  %689 = getelementptr inbounds float, ptr addrspace(3) %153, i32 %688
  %690 = load float, ptr addrspace(3) %689, align 4, !tbaa !31
  %691 = and i64 %683, 9223372036854775744
  %692 = or disjoint i64 %691, %154
  %693 = or disjoint i64 %692, %155
  %694 = getelementptr inbounds float, ptr %9, i64 %693
  store float %690, ptr %694, align 4, !tbaa !31
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i: ; preds = %687, %682
  %695 = add nuw nsw i64 %683, 256
  %696 = icmp ult i64 %683, 1792
  br i1 %696, label %682, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !35

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i
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
!29 = distinct !{!29, !25, !26, !27}
!30 = distinct !{!30, !25, !26, !27}
!31 = !{!32, !32, i64 0}
!32 = !{!"float", !22, i64 0}
!33 = distinct !{!33, !25}
!34 = distinct !{!34, !25}
!35 = distinct !{!35, !25}
;----------------- End AdaptiveCpp IR dump ---------------
