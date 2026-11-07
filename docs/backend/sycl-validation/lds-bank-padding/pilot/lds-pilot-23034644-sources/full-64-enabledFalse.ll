;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-7c8vulob/kernel.cpp"
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
  %30 = shl i32 %.tr.i, 11
  %31 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %34 = icmp eq i64 %33, 0
  call void @llvm.assume(i1 %34)
  %35 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %36 = icmp ult i64 %35, 64
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
  %50 = icmp ult i64 %49, 64
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
  %67 = add nuw nsw i64 %56, 64
  %68 = icmp ult i64 %56, 1984
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
  %74 = icmp ult i64 %73, 64
  call void @llvm.assume(i1 %74)
  %75 = shl i32 %.tr.i, 12
  %76 = sext i32 %4 to i64
  %77 = sext i32 %5 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 16384
  %82 = icmp slt i64 %73, %77
  br label %104

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph1190.i
  %83 = phi i64 [ %49, %.lr.ph1190.i ], [ %92, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %84 = lshr i64 %83, 6
  %85 = shl nuw nsw i64 %83, 5
  %86 = and i64 %85, 2016
  %87 = or disjoint i64 %86, %84
  %88 = trunc i64 %87 to i32
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %88
  %.sroa.0564.0.copyload.i = load i16, ptr addrspace(3) %89, align 2, !tbaa.struct !19
  %90 = trunc i64 %83 to i32
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %90
  store i16 %.sroa.0564.0.copyload.i, ptr addrspace(3) %91, align 2, !tbaa.struct !19
  %92 = add nuw nsw i64 %83, 64
  %93 = icmp ult i64 %83, 1984
  br i1 %93, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph1193.i, !llvm.loop !28

.lr.ph1196.i:                                     ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %95 = icmp eq i64 %94, 0
  call void @llvm.assume(i1 %95)
  %96 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %97 = icmp eq i64 %96, 0
  call void @llvm.assume(i1 %97)
  %98 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %99 = icmp ult i64 %98, 64
  call void @llvm.assume(i1 %99)
  %100 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %101 = inttoptr i32 %100 to ptr addrspace(3)
  %102 = getelementptr inbounds i8, ptr addrspace(3) %101, i32 16384
  %103 = getelementptr inbounds i8, ptr addrspace(3) %101, i32 24576
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i

104:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph1193.i
  %105 = phi i64 [ %73, %.lr.ph1193.i ], [ %116, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %106 = lshr i64 %105, 6
  %107 = icmp slt i64 %106, %76
  %108 = and i1 %107, %82
  br i1 %108, label %109, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

109:                                              ; preds = %104
  %110 = and i64 %105, 9223372036854775744
  %111 = or disjoint i64 %110, %78
  %112 = or disjoint i64 %111, %73
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %112
  %.sroa.0414.0.copyload.i = load i16, ptr %113, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %109, %104
  %.sroa.0416.1.i = phi i16 [ %.sroa.0414.0.copyload.i, %109 ], [ 0, %104 ]
  %114 = trunc i64 %105 to i32
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %114
  store i16 %.sroa.0416.1.i, ptr addrspace(3) %115, align 2, !tbaa.struct !19
  %116 = add nuw nsw i64 %105, 64
  %117 = icmp ult i64 %105, 4032
  br i1 %117, label %104, label %.lr.ph1196.i, !llvm.loop !29

.lr.ph1199.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %119 = icmp eq i64 %118, 0
  call void @llvm.assume(i1 %119)
  %120 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %121 = icmp eq i64 %120, 0
  call void @llvm.assume(i1 %121)
  %122 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %123 = icmp ult i64 %122, 64
  call void @llvm.assume(i1 %123)
  %124 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %125 = inttoptr i32 %124 to ptr addrspace(3)
  %126 = getelementptr inbounds i8, ptr addrspace(3) %125, i32 12288
  %127 = getelementptr inbounds i8, ptr addrspace(3) %125, i32 24576
  %128 = and i64 %122, 15
  %129 = or disjoint i64 %128, 16
  %130 = or disjoint i64 %128, 32
  %131 = or i64 %122, 48
  br label %155

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph1196.i
  %132 = phi i64 [ %98, %.lr.ph1196.i ], [ %141, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %133 = lshr i64 %132, 6
  %134 = shl nuw nsw i64 %132, 6
  %135 = and i64 %134, 4032
  %136 = or disjoint i64 %135, %133
  %137 = trunc i64 %136 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %102, i32 %137
  %.sroa.0565.0.copyload.i = load i16, ptr addrspace(3) %138, align 2, !tbaa.struct !19
  %139 = trunc i64 %132 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %139
  store i16 %.sroa.0565.0.copyload.i, ptr addrspace(3) %140, align 2, !tbaa.struct !19
  %141 = add nuw nsw i64 %132, 64
  %142 = icmp ult i64 %132, 4032
  br i1 %142, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph1199.i, !llvm.loop !30

.lr.ph1202.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %144 = icmp eq i64 %143, 0
  call void @llvm.assume(i1 %144)
  %145 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %146 = icmp eq i64 %145, 0
  call void @llvm.assume(i1 %146)
  %147 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %148 = icmp ult i64 %147, 64
  call void @llvm.assume(i1 %148)
  %149 = sext i32 %3 to i64
  %150 = sext i32 %4 to i64
  %151 = call i32 @llvm.amdgcn.groupstaticsize()
  %152 = inttoptr i32 %151 to ptr addrspace(3)
  %153 = sext i32 %30 to i64
  %154 = icmp slt i64 %147, %150
  br label %680

155:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph1199.i
  %156 = phi i64 [ %122, %.lr.ph1199.i ], [ %171, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %157 = shl nuw nsw i64 %156, 2
  %158 = and i64 %157, 9223372036854775744
  br label %173

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %159 = or disjoint i64 %158, %128
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %160
  store float %602, ptr addrspace(3) %161, align 4, !tbaa !31
  %162 = or disjoint i64 %158, %129
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %163
  store float %627, ptr addrspace(3) %164, align 4, !tbaa !31
  %165 = or disjoint i64 %158, %130
  %166 = trunc i64 %165 to i32
  %167 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %166
  store float %652, ptr addrspace(3) %167, align 4, !tbaa !31
  %168 = or disjoint i64 %158, %131
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %169
  store float %677, ptr addrspace(3) %170, align 4, !tbaa !31
  %171 = add nuw nsw i64 %156, 64
  %172 = icmp ult i64 %156, 448
  br i1 %172, label %155, label %.lr.ph1202.i, !llvm.loop !33

173:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %155
  %174 = phi i64 [ 0, %155 ], [ %678, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %175 = phi float [ 0.000000e+00, %155 ], [ %677, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %176 = phi float [ 0.000000e+00, %155 ], [ %652, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %177 = phi float [ 0.000000e+00, %155 ], [ %627, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %178 = phi float [ 0.000000e+00, %155 ], [ %602, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %179 = add nuw i64 %174, %158
  %180 = trunc i64 %179 to i32
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %180
  %.sroa.0373.0.copyload.i = load i16, ptr addrspace(3) %181, align 2, !tbaa.struct !19
  %182 = shl nuw nsw i64 %174, 6
  %183 = or disjoint i64 %182, %128
  %184 = trunc i64 %183 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %184
  %.sroa.0364.0.copyload.i = load i16, ptr addrspace(3) %185, align 2, !tbaa.struct !19
  %186 = zext i16 %.sroa.0373.0.copyload.i to i32
  %187 = lshr i32 %186, 10
  %188 = and i32 %187, 31
  %189 = and i32 %186, 1023
  switch i32 %188, label %195 [
    i32 31, label %190
    i32 0, label %197
  ]

190:                                              ; preds = %173
  %.sroa.0373.0.copyload.signext.i = sext i16 %.sroa.0373.0.copyload.i to i32
  %191 = and i32 %.sroa.0373.0.copyload.signext.i, -2147483648
  %.not1175.i = icmp eq i32 %189, 0
  %192 = select i1 %.not1175.i, i32 2139095040, i32 2143289344
  %193 = or disjoint i32 %192, %191
  %194 = bitcast i32 %193 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i

195:                                              ; preds = %173
  %196 = or disjoint i32 %189, 1024
  br label %197

197:                                              ; preds = %195, %173
  %198 = phi i32 [ %196, %195 ], [ %189, %173 ]
  %199 = uitofp i32 %198 to float
  %.not.i = icmp eq i32 %188, 0
  %200 = add nsw i32 %188, -25
  %201 = select i1 %.not.i, i32 -24, i32 %200
  %202 = call float @__ocml_ldexp_f32(float noundef %199, i32 noundef %201) #5
  %203 = fneg contract float %202
  %.not10971098.i = icmp slt i16 %.sroa.0373.0.copyload.i, 0
  %204 = select contract i1 %.not10971098.i, float %203, float %202
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i: ; preds = %197, %190
  %205 = phi float [ %194, %190 ], [ %204, %197 ]
  %206 = zext i16 %.sroa.0364.0.copyload.i to i32
  %207 = lshr i32 %206, 10
  %208 = and i32 %207, 31
  %209 = and i32 %206, 1023
  switch i32 %208, label %215 [
    i32 31, label %210
    i32 0, label %217
  ]

210:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i
  %.sroa.0364.0.copyload.signext.i = sext i16 %.sroa.0364.0.copyload.i to i32
  %211 = and i32 %.sroa.0364.0.copyload.signext.i, -2147483648
  %.not1174.i = icmp eq i32 %209, 0
  %212 = select i1 %.not1174.i, i32 2139095040, i32 2143289344
  %213 = or disjoint i32 %212, %211
  %214 = bitcast i32 %213 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i

215:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i
  %216 = or disjoint i32 %209, 1024
  br label %217

217:                                              ; preds = %215, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i
  %218 = phi i32 [ %216, %215 ], [ %209, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit39.i.i.i ]
  %219 = uitofp i32 %218 to float
  %.not1099.i = icmp eq i32 %208, 0
  %220 = add nsw i32 %208, -25
  %221 = select i1 %.not1099.i, i32 -24, i32 %220
  %222 = call float @__ocml_ldexp_f32(float noundef %219, i32 noundef %221) #5
  %223 = fneg contract float %222
  %.not11001101.i = icmp slt i16 %.sroa.0364.0.copyload.i, 0
  %224 = select contract i1 %.not11001101.i, float %223, float %222
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i: ; preds = %217, %210
  %225 = phi float [ %214, %210 ], [ %224, %217 ]
  %226 = fmul contract float %205, %225
  %227 = fadd contract float %178, %226
  %228 = or disjoint i64 %182, %129
  %229 = trunc i64 %228 to i32
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %229
  %.sroa.0355.0.copyload.i = load i16, ptr addrspace(3) %230, align 2, !tbaa.struct !19
  %231 = zext i16 %.sroa.0355.0.copyload.i to i32
  %232 = lshr i32 %231, 10
  %233 = and i32 %232, 31
  %234 = and i32 %231, 1023
  switch i32 %233, label %240 [
    i32 31, label %235
    i32 0, label %242
  ]

235:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i
  %.sroa.0355.0.copyload.signext.i = sext i16 %.sroa.0355.0.copyload.i to i32
  %236 = and i32 %.sroa.0355.0.copyload.signext.i, -2147483648
  %.not1173.i = icmp eq i32 %234, 0
  %237 = select i1 %.not1173.i, i32 2139095040, i32 2143289344
  %238 = or disjoint i32 %237, %236
  %239 = bitcast i32 %238 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i

240:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i
  %241 = or disjoint i32 %234, 1024
  br label %242

242:                                              ; preds = %240, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i
  %243 = phi i32 [ %241, %240 ], [ %234, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit38.i.i.i ]
  %244 = uitofp i32 %243 to float
  %.not1102.i = icmp eq i32 %233, 0
  %245 = add nsw i32 %233, -25
  %246 = select i1 %.not1102.i, i32 -24, i32 %245
  %247 = call float @__ocml_ldexp_f32(float noundef %244, i32 noundef %246) #5
  %248 = fneg contract float %247
  %.not11031104.i = icmp slt i16 %.sroa.0355.0.copyload.i, 0
  %249 = select contract i1 %.not11031104.i, float %248, float %247
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i: ; preds = %242, %235
  %250 = phi float [ %239, %235 ], [ %249, %242 ]
  %251 = fmul contract float %205, %250
  %252 = fadd contract float %177, %251
  %253 = or disjoint i64 %182, %130
  %254 = trunc i64 %253 to i32
  %255 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %254
  %.sroa.0346.0.copyload.i = load i16, ptr addrspace(3) %255, align 2, !tbaa.struct !19
  %256 = zext i16 %.sroa.0346.0.copyload.i to i32
  %257 = lshr i32 %256, 10
  %258 = and i32 %257, 31
  %259 = and i32 %256, 1023
  switch i32 %258, label %265 [
    i32 31, label %260
    i32 0, label %267
  ]

260:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i
  %.sroa.0346.0.copyload.signext.i = sext i16 %.sroa.0346.0.copyload.i to i32
  %261 = and i32 %.sroa.0346.0.copyload.signext.i, -2147483648
  %.not1172.i = icmp eq i32 %259, 0
  %262 = select i1 %.not1172.i, i32 2139095040, i32 2143289344
  %263 = or disjoint i32 %262, %261
  %264 = bitcast i32 %263 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i

265:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i
  %266 = or disjoint i32 %259, 1024
  br label %267

267:                                              ; preds = %265, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i
  %268 = phi i32 [ %266, %265 ], [ %259, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit37.i.i.i ]
  %269 = uitofp i32 %268 to float
  %.not1105.i = icmp eq i32 %258, 0
  %270 = add nsw i32 %258, -25
  %271 = select i1 %.not1105.i, i32 -24, i32 %270
  %272 = call float @__ocml_ldexp_f32(float noundef %269, i32 noundef %271) #5
  %273 = fneg contract float %272
  %.not11061107.i = icmp slt i16 %.sroa.0346.0.copyload.i, 0
  %274 = select contract i1 %.not11061107.i, float %273, float %272
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i: ; preds = %267, %260
  %275 = phi float [ %264, %260 ], [ %274, %267 ]
  %276 = fmul contract float %205, %275
  %277 = fadd contract float %176, %276
  %278 = or disjoint i64 %182, %131
  %279 = trunc i64 %278 to i32
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %279
  %.sroa.0337.0.copyload.i = load i16, ptr addrspace(3) %280, align 2, !tbaa.struct !19
  %281 = zext i16 %.sroa.0337.0.copyload.i to i32
  %282 = lshr i32 %281, 10
  %283 = and i32 %282, 31
  %284 = and i32 %281, 1023
  switch i32 %283, label %290 [
    i32 31, label %285
    i32 0, label %292
  ]

285:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i
  %.sroa.0337.0.copyload.signext.i = sext i16 %.sroa.0337.0.copyload.i to i32
  %286 = and i32 %.sroa.0337.0.copyload.signext.i, -2147483648
  %.not1171.i = icmp eq i32 %284, 0
  %287 = select i1 %.not1171.i, i32 2139095040, i32 2143289344
  %288 = or disjoint i32 %287, %286
  %289 = bitcast i32 %288 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

290:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i
  %291 = or disjoint i32 %284, 1024
  br label %292

292:                                              ; preds = %290, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i
  %293 = phi i32 [ %291, %290 ], [ %284, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit36.i.i.i ]
  %294 = uitofp i32 %293 to float
  %.not1108.i = icmp eq i32 %283, 0
  %295 = add nsw i32 %283, -25
  %296 = select i1 %.not1108.i, i32 -24, i32 %295
  %297 = call float @__ocml_ldexp_f32(float noundef %294, i32 noundef %296) #5
  %298 = fneg contract float %297
  %.not11091110.i = icmp slt i16 %.sroa.0337.0.copyload.i, 0
  %299 = select contract i1 %.not11091110.i, float %298, float %297
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i: ; preds = %292, %285
  %300 = phi float [ %289, %285 ], [ %299, %292 ]
  %301 = fmul contract float %205, %300
  %302 = fadd contract float %175, %301
  %303 = or disjoint i64 %174, 1
  %304 = add nuw i64 %303, %158
  %305 = trunc i64 %304 to i32
  %306 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %305
  %.sroa.0328.0.copyload.i = load i16, ptr addrspace(3) %306, align 2, !tbaa.struct !19
  %307 = shl nuw nsw i64 %303, 6
  %308 = or disjoint i64 %307, %128
  %309 = trunc i64 %308 to i32
  %310 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %309
  %.sroa.0319.0.copyload.i = load i16, ptr addrspace(3) %310, align 2, !tbaa.struct !19
  %311 = zext i16 %.sroa.0328.0.copyload.i to i32
  %312 = lshr i32 %311, 10
  %313 = and i32 %312, 31
  %314 = and i32 %311, 1023
  switch i32 %313, label %320 [
    i32 31, label %315
    i32 0, label %322
  ]

315:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %.sroa.0328.0.copyload.signext.i = sext i16 %.sroa.0328.0.copyload.i to i32
  %316 = and i32 %.sroa.0328.0.copyload.signext.i, -2147483648
  %.not1170.i = icmp eq i32 %314, 0
  %317 = select i1 %.not1170.i, i32 2139095040, i32 2143289344
  %318 = or disjoint i32 %317, %316
  %319 = bitcast i32 %318 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

320:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %321 = or disjoint i32 %314, 1024
  br label %322

322:                                              ; preds = %320, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %323 = phi i32 [ %321, %320 ], [ %314, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i ]
  %324 = uitofp i32 %323 to float
  %.not1111.i = icmp eq i32 %313, 0
  %325 = add nsw i32 %313, -25
  %326 = select i1 %.not1111.i, i32 -24, i32 %325
  %327 = call float @__ocml_ldexp_f32(float noundef %324, i32 noundef %326) #5
  %328 = fneg contract float %327
  %.not11121113.i = icmp slt i16 %.sroa.0328.0.copyload.i, 0
  %329 = select contract i1 %.not11121113.i, float %328, float %327
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i: ; preds = %322, %315
  %330 = phi float [ %319, %315 ], [ %329, %322 ]
  %331 = zext i16 %.sroa.0319.0.copyload.i to i32
  %332 = lshr i32 %331, 10
  %333 = and i32 %332, 31
  %334 = and i32 %331, 1023
  switch i32 %333, label %340 [
    i32 31, label %335
    i32 0, label %342
  ]

335:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %.sroa.0319.0.copyload.signext.i = sext i16 %.sroa.0319.0.copyload.i to i32
  %336 = and i32 %.sroa.0319.0.copyload.signext.i, -2147483648
  %.not1169.i = icmp eq i32 %334, 0
  %337 = select i1 %.not1169.i, i32 2139095040, i32 2143289344
  %338 = or disjoint i32 %337, %336
  %339 = bitcast i32 %338 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

340:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %341 = or disjoint i32 %334, 1024
  br label %342

342:                                              ; preds = %340, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %343 = phi i32 [ %341, %340 ], [ %334, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i ]
  %344 = uitofp i32 %343 to float
  %.not1114.i = icmp eq i32 %333, 0
  %345 = add nsw i32 %333, -25
  %346 = select i1 %.not1114.i, i32 -24, i32 %345
  %347 = call float @__ocml_ldexp_f32(float noundef %344, i32 noundef %346) #5
  %348 = fneg contract float %347
  %.not11151116.i = icmp slt i16 %.sroa.0319.0.copyload.i, 0
  %349 = select contract i1 %.not11151116.i, float %348, float %347
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i: ; preds = %342, %335
  %350 = phi float [ %339, %335 ], [ %349, %342 ]
  %351 = fmul contract float %330, %350
  %352 = fadd contract float %227, %351
  %353 = or disjoint i64 %307, %129
  %354 = trunc i64 %353 to i32
  %355 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %354
  %.sroa.0310.0.copyload.i = load i16, ptr addrspace(3) %355, align 2, !tbaa.struct !19
  %356 = zext i16 %.sroa.0310.0.copyload.i to i32
  %357 = lshr i32 %356, 10
  %358 = and i32 %357, 31
  %359 = and i32 %356, 1023
  switch i32 %358, label %365 [
    i32 31, label %360
    i32 0, label %367
  ]

360:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %.sroa.0310.0.copyload.signext.i = sext i16 %.sroa.0310.0.copyload.i to i32
  %361 = and i32 %.sroa.0310.0.copyload.signext.i, -2147483648
  %.not1168.i = icmp eq i32 %359, 0
  %362 = select i1 %.not1168.i, i32 2139095040, i32 2143289344
  %363 = or disjoint i32 %362, %361
  %364 = bitcast i32 %363 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

365:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %366 = or disjoint i32 %359, 1024
  br label %367

367:                                              ; preds = %365, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %368 = phi i32 [ %366, %365 ], [ %359, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i ]
  %369 = uitofp i32 %368 to float
  %.not1117.i = icmp eq i32 %358, 0
  %370 = add nsw i32 %358, -25
  %371 = select i1 %.not1117.i, i32 -24, i32 %370
  %372 = call float @__ocml_ldexp_f32(float noundef %369, i32 noundef %371) #5
  %373 = fneg contract float %372
  %.not11181119.i = icmp slt i16 %.sroa.0310.0.copyload.i, 0
  %374 = select contract i1 %.not11181119.i, float %373, float %372
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i: ; preds = %367, %360
  %375 = phi float [ %364, %360 ], [ %374, %367 ]
  %376 = fmul contract float %330, %375
  %377 = fadd contract float %252, %376
  %378 = or disjoint i64 %307, %130
  %379 = trunc i64 %378 to i32
  %380 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %379
  %.sroa.0301.0.copyload.i = load i16, ptr addrspace(3) %380, align 2, !tbaa.struct !19
  %381 = zext i16 %.sroa.0301.0.copyload.i to i32
  %382 = lshr i32 %381, 10
  %383 = and i32 %382, 31
  %384 = and i32 %381, 1023
  switch i32 %383, label %390 [
    i32 31, label %385
    i32 0, label %392
  ]

385:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %.sroa.0301.0.copyload.signext.i = sext i16 %.sroa.0301.0.copyload.i to i32
  %386 = and i32 %.sroa.0301.0.copyload.signext.i, -2147483648
  %.not1167.i = icmp eq i32 %384, 0
  %387 = select i1 %.not1167.i, i32 2139095040, i32 2143289344
  %388 = or disjoint i32 %387, %386
  %389 = bitcast i32 %388 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

390:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %391 = or disjoint i32 %384, 1024
  br label %392

392:                                              ; preds = %390, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %393 = phi i32 [ %391, %390 ], [ %384, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i ]
  %394 = uitofp i32 %393 to float
  %.not1120.i = icmp eq i32 %383, 0
  %395 = add nsw i32 %383, -25
  %396 = select i1 %.not1120.i, i32 -24, i32 %395
  %397 = call float @__ocml_ldexp_f32(float noundef %394, i32 noundef %396) #5
  %398 = fneg contract float %397
  %.not11211122.i = icmp slt i16 %.sroa.0301.0.copyload.i, 0
  %399 = select contract i1 %.not11211122.i, float %398, float %397
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i: ; preds = %392, %385
  %400 = phi float [ %389, %385 ], [ %399, %392 ]
  %401 = fmul contract float %330, %400
  %402 = fadd contract float %277, %401
  %403 = or disjoint i64 %307, %131
  %404 = trunc i64 %403 to i32
  %405 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %404
  %.sroa.0292.0.copyload.i = load i16, ptr addrspace(3) %405, align 2, !tbaa.struct !19
  %406 = zext i16 %.sroa.0292.0.copyload.i to i32
  %407 = lshr i32 %406, 10
  %408 = and i32 %407, 31
  %409 = and i32 %406, 1023
  switch i32 %408, label %415 [
    i32 31, label %410
    i32 0, label %417
  ]

410:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %.sroa.0292.0.copyload.signext.i = sext i16 %.sroa.0292.0.copyload.i to i32
  %411 = and i32 %.sroa.0292.0.copyload.signext.i, -2147483648
  %.not1166.i = icmp eq i32 %409, 0
  %412 = select i1 %.not1166.i, i32 2139095040, i32 2143289344
  %413 = or disjoint i32 %412, %411
  %414 = bitcast i32 %413 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

415:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %416 = or disjoint i32 %409, 1024
  br label %417

417:                                              ; preds = %415, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %418 = phi i32 [ %416, %415 ], [ %409, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i ]
  %419 = uitofp i32 %418 to float
  %.not1123.i = icmp eq i32 %408, 0
  %420 = add nsw i32 %408, -25
  %421 = select i1 %.not1123.i, i32 -24, i32 %420
  %422 = call float @__ocml_ldexp_f32(float noundef %419, i32 noundef %421) #5
  %423 = fneg contract float %422
  %.not11241125.i = icmp slt i16 %.sroa.0292.0.copyload.i, 0
  %424 = select contract i1 %.not11241125.i, float %423, float %422
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i: ; preds = %417, %410
  %425 = phi float [ %414, %410 ], [ %424, %417 ]
  %426 = fmul contract float %330, %425
  %427 = fadd contract float %302, %426
  %428 = or disjoint i64 %174, 2
  %429 = add nuw i64 %428, %158
  %430 = trunc i64 %429 to i32
  %431 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %430
  %.sroa.0283.0.copyload.i = load i16, ptr addrspace(3) %431, align 2, !tbaa.struct !19
  %432 = shl nuw nsw i64 %428, 6
  %433 = or disjoint i64 %432, %128
  %434 = trunc i64 %433 to i32
  %435 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %434
  %.sroa.0274.0.copyload.i = load i16, ptr addrspace(3) %435, align 2, !tbaa.struct !19
  %436 = zext i16 %.sroa.0283.0.copyload.i to i32
  %437 = lshr i32 %436, 10
  %438 = and i32 %437, 31
  %439 = and i32 %436, 1023
  switch i32 %438, label %445 [
    i32 31, label %440
    i32 0, label %447
  ]

440:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %.sroa.0283.0.copyload.signext.i = sext i16 %.sroa.0283.0.copyload.i to i32
  %441 = and i32 %.sroa.0283.0.copyload.signext.i, -2147483648
  %.not1165.i = icmp eq i32 %439, 0
  %442 = select i1 %.not1165.i, i32 2139095040, i32 2143289344
  %443 = or disjoint i32 %442, %441
  %444 = bitcast i32 %443 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

445:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %446 = or disjoint i32 %439, 1024
  br label %447

447:                                              ; preds = %445, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %448 = phi i32 [ %446, %445 ], [ %439, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i ]
  %449 = uitofp i32 %448 to float
  %.not1126.i = icmp eq i32 %438, 0
  %450 = add nsw i32 %438, -25
  %451 = select i1 %.not1126.i, i32 -24, i32 %450
  %452 = call float @__ocml_ldexp_f32(float noundef %449, i32 noundef %451) #5
  %453 = fneg contract float %452
  %.not11271128.i = icmp slt i16 %.sroa.0283.0.copyload.i, 0
  %454 = select contract i1 %.not11271128.i, float %453, float %452
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i: ; preds = %447, %440
  %455 = phi float [ %444, %440 ], [ %454, %447 ]
  %456 = zext i16 %.sroa.0274.0.copyload.i to i32
  %457 = lshr i32 %456, 10
  %458 = and i32 %457, 31
  %459 = and i32 %456, 1023
  switch i32 %458, label %465 [
    i32 31, label %460
    i32 0, label %467
  ]

460:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %.sroa.0274.0.copyload.signext.i = sext i16 %.sroa.0274.0.copyload.i to i32
  %461 = and i32 %.sroa.0274.0.copyload.signext.i, -2147483648
  %.not1164.i = icmp eq i32 %459, 0
  %462 = select i1 %.not1164.i, i32 2139095040, i32 2143289344
  %463 = or disjoint i32 %462, %461
  %464 = bitcast i32 %463 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

465:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %466 = or disjoint i32 %459, 1024
  br label %467

467:                                              ; preds = %465, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %468 = phi i32 [ %466, %465 ], [ %459, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i ]
  %469 = uitofp i32 %468 to float
  %.not1129.i = icmp eq i32 %458, 0
  %470 = add nsw i32 %458, -25
  %471 = select i1 %.not1129.i, i32 -24, i32 %470
  %472 = call float @__ocml_ldexp_f32(float noundef %469, i32 noundef %471) #5
  %473 = fneg contract float %472
  %.not11301131.i = icmp slt i16 %.sroa.0274.0.copyload.i, 0
  %474 = select contract i1 %.not11301131.i, float %473, float %472
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i: ; preds = %467, %460
  %475 = phi float [ %464, %460 ], [ %474, %467 ]
  %476 = fmul contract float %455, %475
  %477 = fadd contract float %352, %476
  %478 = or disjoint i64 %432, %129
  %479 = trunc i64 %478 to i32
  %480 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %479
  %.sroa.0265.0.copyload.i = load i16, ptr addrspace(3) %480, align 2, !tbaa.struct !19
  %481 = zext i16 %.sroa.0265.0.copyload.i to i32
  %482 = lshr i32 %481, 10
  %483 = and i32 %482, 31
  %484 = and i32 %481, 1023
  switch i32 %483, label %490 [
    i32 31, label %485
    i32 0, label %492
  ]

485:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %.sroa.0265.0.copyload.signext.i = sext i16 %.sroa.0265.0.copyload.i to i32
  %486 = and i32 %.sroa.0265.0.copyload.signext.i, -2147483648
  %.not1163.i = icmp eq i32 %484, 0
  %487 = select i1 %.not1163.i, i32 2139095040, i32 2143289344
  %488 = or disjoint i32 %487, %486
  %489 = bitcast i32 %488 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

490:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %491 = or disjoint i32 %484, 1024
  br label %492

492:                                              ; preds = %490, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %493 = phi i32 [ %491, %490 ], [ %484, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i ]
  %494 = uitofp i32 %493 to float
  %.not1132.i = icmp eq i32 %483, 0
  %495 = add nsw i32 %483, -25
  %496 = select i1 %.not1132.i, i32 -24, i32 %495
  %497 = call float @__ocml_ldexp_f32(float noundef %494, i32 noundef %496) #5
  %498 = fneg contract float %497
  %.not11331134.i = icmp slt i16 %.sroa.0265.0.copyload.i, 0
  %499 = select contract i1 %.not11331134.i, float %498, float %497
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %492, %485
  %500 = phi float [ %489, %485 ], [ %499, %492 ]
  %501 = fmul contract float %455, %500
  %502 = fadd contract float %377, %501
  %503 = or disjoint i64 %432, %130
  %504 = trunc i64 %503 to i32
  %505 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %504
  %.sroa.0256.0.copyload.i = load i16, ptr addrspace(3) %505, align 2, !tbaa.struct !19
  %506 = zext i16 %.sroa.0256.0.copyload.i to i32
  %507 = lshr i32 %506, 10
  %508 = and i32 %507, 31
  %509 = and i32 %506, 1023
  switch i32 %508, label %515 [
    i32 31, label %510
    i32 0, label %517
  ]

510:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0256.0.copyload.signext.i = sext i16 %.sroa.0256.0.copyload.i to i32
  %511 = and i32 %.sroa.0256.0.copyload.signext.i, -2147483648
  %.not1162.i = icmp eq i32 %509, 0
  %512 = select i1 %.not1162.i, i32 2139095040, i32 2143289344
  %513 = or disjoint i32 %512, %511
  %514 = bitcast i32 %513 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

515:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %516 = or disjoint i32 %509, 1024
  br label %517

517:                                              ; preds = %515, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %518 = phi i32 [ %516, %515 ], [ %509, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %519 = uitofp i32 %518 to float
  %.not1135.i = icmp eq i32 %508, 0
  %520 = add nsw i32 %508, -25
  %521 = select i1 %.not1135.i, i32 -24, i32 %520
  %522 = call float @__ocml_ldexp_f32(float noundef %519, i32 noundef %521) #5
  %523 = fneg contract float %522
  %.not11361137.i = icmp slt i16 %.sroa.0256.0.copyload.i, 0
  %524 = select contract i1 %.not11361137.i, float %523, float %522
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %517, %510
  %525 = phi float [ %514, %510 ], [ %524, %517 ]
  %526 = fmul contract float %455, %525
  %527 = fadd contract float %402, %526
  %528 = or disjoint i64 %432, %131
  %529 = trunc i64 %528 to i32
  %530 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %529
  %.sroa.0247.0.copyload.i = load i16, ptr addrspace(3) %530, align 2, !tbaa.struct !19
  %531 = zext i16 %.sroa.0247.0.copyload.i to i32
  %532 = lshr i32 %531, 10
  %533 = and i32 %532, 31
  %534 = and i32 %531, 1023
  switch i32 %533, label %540 [
    i32 31, label %535
    i32 0, label %542
  ]

535:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0247.0.copyload.signext.i = sext i16 %.sroa.0247.0.copyload.i to i32
  %536 = and i32 %.sroa.0247.0.copyload.signext.i, -2147483648
  %.not1161.i = icmp eq i32 %534, 0
  %537 = select i1 %.not1161.i, i32 2139095040, i32 2143289344
  %538 = or disjoint i32 %537, %536
  %539 = bitcast i32 %538 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

540:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %541 = or disjoint i32 %534, 1024
  br label %542

542:                                              ; preds = %540, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %543 = phi i32 [ %541, %540 ], [ %534, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %544 = uitofp i32 %543 to float
  %.not1138.i = icmp eq i32 %533, 0
  %545 = add nsw i32 %533, -25
  %546 = select i1 %.not1138.i, i32 -24, i32 %545
  %547 = call float @__ocml_ldexp_f32(float noundef %544, i32 noundef %546) #5
  %548 = fneg contract float %547
  %.not11391140.i = icmp slt i16 %.sroa.0247.0.copyload.i, 0
  %549 = select contract i1 %.not11391140.i, float %548, float %547
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %542, %535
  %550 = phi float [ %539, %535 ], [ %549, %542 ]
  %551 = fmul contract float %455, %550
  %552 = fadd contract float %427, %551
  %553 = or disjoint i64 %174, 3
  %554 = add nuw i64 %553, %158
  %555 = trunc i64 %554 to i32
  %556 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %555
  %.sroa.0238.0.copyload.i = load i16, ptr addrspace(3) %556, align 2, !tbaa.struct !19
  %557 = shl nuw nsw i64 %553, 6
  %558 = or disjoint i64 %557, %128
  %559 = trunc i64 %558 to i32
  %560 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %559
  %.sroa.0229.0.copyload.i = load i16, ptr addrspace(3) %560, align 2, !tbaa.struct !19
  %561 = zext i16 %.sroa.0238.0.copyload.i to i32
  %562 = lshr i32 %561, 10
  %563 = and i32 %562, 31
  %564 = and i32 %561, 1023
  switch i32 %563, label %570 [
    i32 31, label %565
    i32 0, label %572
  ]

565:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0238.0.copyload.signext.i = sext i16 %.sroa.0238.0.copyload.i to i32
  %566 = and i32 %.sroa.0238.0.copyload.signext.i, -2147483648
  %.not1160.i = icmp eq i32 %564, 0
  %567 = select i1 %.not1160.i, i32 2139095040, i32 2143289344
  %568 = or disjoint i32 %567, %566
  %569 = bitcast i32 %568 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

570:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %571 = or disjoint i32 %564, 1024
  br label %572

572:                                              ; preds = %570, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %573 = phi i32 [ %571, %570 ], [ %564, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %574 = uitofp i32 %573 to float
  %.not1141.i = icmp eq i32 %563, 0
  %575 = add nsw i32 %563, -25
  %576 = select i1 %.not1141.i, i32 -24, i32 %575
  %577 = call float @__ocml_ldexp_f32(float noundef %574, i32 noundef %576) #5
  %578 = fneg contract float %577
  %.not11421143.i = icmp slt i16 %.sroa.0238.0.copyload.i, 0
  %579 = select contract i1 %.not11421143.i, float %578, float %577
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %572, %565
  %580 = phi float [ %569, %565 ], [ %579, %572 ]
  %581 = zext i16 %.sroa.0229.0.copyload.i to i32
  %582 = lshr i32 %581, 10
  %583 = and i32 %582, 31
  %584 = and i32 %581, 1023
  switch i32 %583, label %590 [
    i32 31, label %585
    i32 0, label %592
  ]

585:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0229.0.copyload.signext.i = sext i16 %.sroa.0229.0.copyload.i to i32
  %586 = and i32 %.sroa.0229.0.copyload.signext.i, -2147483648
  %.not1159.i = icmp eq i32 %584, 0
  %587 = select i1 %.not1159.i, i32 2139095040, i32 2143289344
  %588 = or disjoint i32 %587, %586
  %589 = bitcast i32 %588 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

590:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %591 = or disjoint i32 %584, 1024
  br label %592

592:                                              ; preds = %590, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %593 = phi i32 [ %591, %590 ], [ %584, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %594 = uitofp i32 %593 to float
  %.not1144.i = icmp eq i32 %583, 0
  %595 = add nsw i32 %583, -25
  %596 = select i1 %.not1144.i, i32 -24, i32 %595
  %597 = call float @__ocml_ldexp_f32(float noundef %594, i32 noundef %596) #5
  %598 = fneg contract float %597
  %.not11451146.i = icmp slt i16 %.sroa.0229.0.copyload.i, 0
  %599 = select contract i1 %.not11451146.i, float %598, float %597
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %592, %585
  %600 = phi float [ %589, %585 ], [ %599, %592 ]
  %601 = fmul contract float %580, %600
  %602 = fadd contract float %477, %601
  %603 = or disjoint i64 %557, %129
  %604 = trunc i64 %603 to i32
  %605 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %604
  %.sroa.0220.0.copyload.i = load i16, ptr addrspace(3) %605, align 2, !tbaa.struct !19
  %606 = zext i16 %.sroa.0220.0.copyload.i to i32
  %607 = lshr i32 %606, 10
  %608 = and i32 %607, 31
  %609 = and i32 %606, 1023
  switch i32 %608, label %615 [
    i32 31, label %610
    i32 0, label %617
  ]

610:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0220.0.copyload.signext.i = sext i16 %.sroa.0220.0.copyload.i to i32
  %611 = and i32 %.sroa.0220.0.copyload.signext.i, -2147483648
  %.not1158.i = icmp eq i32 %609, 0
  %612 = select i1 %.not1158.i, i32 2139095040, i32 2143289344
  %613 = or disjoint i32 %612, %611
  %614 = bitcast i32 %613 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

615:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %616 = or disjoint i32 %609, 1024
  br label %617

617:                                              ; preds = %615, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %618 = phi i32 [ %616, %615 ], [ %609, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %619 = uitofp i32 %618 to float
  %.not1147.i = icmp eq i32 %608, 0
  %620 = add nsw i32 %608, -25
  %621 = select i1 %.not1147.i, i32 -24, i32 %620
  %622 = call float @__ocml_ldexp_f32(float noundef %619, i32 noundef %621) #5
  %623 = fneg contract float %622
  %.not11481149.i = icmp slt i16 %.sroa.0220.0.copyload.i, 0
  %624 = select contract i1 %.not11481149.i, float %623, float %622
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %617, %610
  %625 = phi float [ %614, %610 ], [ %624, %617 ]
  %626 = fmul contract float %580, %625
  %627 = fadd contract float %502, %626
  %628 = or disjoint i64 %557, %130
  %629 = trunc i64 %628 to i32
  %630 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %629
  %.sroa.0211.0.copyload.i = load i16, ptr addrspace(3) %630, align 2, !tbaa.struct !19
  %631 = zext i16 %.sroa.0211.0.copyload.i to i32
  %632 = lshr i32 %631, 10
  %633 = and i32 %632, 31
  %634 = and i32 %631, 1023
  switch i32 %633, label %640 [
    i32 31, label %635
    i32 0, label %642
  ]

635:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0211.0.copyload.signext.i = sext i16 %.sroa.0211.0.copyload.i to i32
  %636 = and i32 %.sroa.0211.0.copyload.signext.i, -2147483648
  %.not1157.i = icmp eq i32 %634, 0
  %637 = select i1 %.not1157.i, i32 2139095040, i32 2143289344
  %638 = or disjoint i32 %637, %636
  %639 = bitcast i32 %638 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

640:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %641 = or disjoint i32 %634, 1024
  br label %642

642:                                              ; preds = %640, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %643 = phi i32 [ %641, %640 ], [ %634, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %644 = uitofp i32 %643 to float
  %.not1150.i = icmp eq i32 %633, 0
  %645 = add nsw i32 %633, -25
  %646 = select i1 %.not1150.i, i32 -24, i32 %645
  %647 = call float @__ocml_ldexp_f32(float noundef %644, i32 noundef %646) #5
  %648 = fneg contract float %647
  %.not11511152.i = icmp slt i16 %.sroa.0211.0.copyload.i, 0
  %649 = select contract i1 %.not11511152.i, float %648, float %647
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %642, %635
  %650 = phi float [ %639, %635 ], [ %649, %642 ]
  %651 = fmul contract float %580, %650
  %652 = fadd contract float %527, %651
  %653 = or disjoint i64 %557, %131
  %654 = trunc i64 %653 to i32
  %655 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %654
  %.sroa.0202.0.copyload.i = load i16, ptr addrspace(3) %655, align 2, !tbaa.struct !19
  %656 = zext i16 %.sroa.0202.0.copyload.i to i32
  %657 = lshr i32 %656, 10
  %658 = and i32 %657, 31
  %659 = and i32 %656, 1023
  switch i32 %658, label %665 [
    i32 31, label %660
    i32 0, label %667
  ]

660:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0202.0.copyload.signext.i = sext i16 %.sroa.0202.0.copyload.i to i32
  %661 = and i32 %.sroa.0202.0.copyload.signext.i, -2147483648
  %.not1156.i = icmp eq i32 %659, 0
  %662 = select i1 %.not1156.i, i32 2139095040, i32 2143289344
  %663 = or disjoint i32 %662, %661
  %664 = bitcast i32 %663 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

665:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %666 = or disjoint i32 %659, 1024
  br label %667

667:                                              ; preds = %665, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %668 = phi i32 [ %666, %665 ], [ %659, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %669 = uitofp i32 %668 to float
  %.not1153.i = icmp eq i32 %658, 0
  %670 = add nsw i32 %658, -25
  %671 = select i1 %.not1153.i, i32 -24, i32 %670
  %672 = call float @__ocml_ldexp_f32(float noundef %669, i32 noundef %671) #5
  %673 = fneg contract float %672
  %.not11541155.i = icmp slt i16 %.sroa.0202.0.copyload.i, 0
  %674 = select contract i1 %.not11541155.i, float %673, float %672
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %667, %660
  %675 = phi float [ %664, %660 ], [ %674, %667 ]
  %676 = fmul contract float %580, %675
  %677 = fadd contract float %552, %676
  %678 = add nuw nsw i64 %174, 4
  %679 = icmp ult i64 %174, 60
  br i1 %679, label %173, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, !llvm.loop !34

680:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i, %.lr.ph1202.i
  %681 = phi i64 [ %147, %.lr.ph1202.i ], [ %693, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i ]
  %682 = lshr i64 %681, 6
  %683 = icmp slt i64 %682, %149
  %684 = and i1 %683, %154
  br i1 %684, label %685, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

685:                                              ; preds = %680
  %686 = trunc i64 %681 to i32
  %687 = getelementptr inbounds float, ptr addrspace(3) %152, i32 %686
  %688 = load float, ptr addrspace(3) %687, align 4, !tbaa !31
  %689 = and i64 %681, 9223372036854775744
  %690 = or disjoint i64 %689, %153
  %691 = or disjoint i64 %690, %147
  %692 = getelementptr inbounds float, ptr %9, i64 %691
  store float %688, ptr %692, align 4, !tbaa !31
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i: ; preds = %685, %680
  %693 = add nuw nsw i64 %681, 64
  %694 = icmp ult i64 %681, 1984
  br i1 %694, label %680, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !35

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
!30 = distinct !{!30, !25, !26, !27}
!31 = !{!32, !32, i64 0}
!32 = !{!"float", !22, i64 0}
!33 = distinct !{!33, !25}
!34 = distinct !{!34, !25}
!35 = distinct !{!35, !25}
;----------------- End AdaptiveCpp IR dump ---------------
