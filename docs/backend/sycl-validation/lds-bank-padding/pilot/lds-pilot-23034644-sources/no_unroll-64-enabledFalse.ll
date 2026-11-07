;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-xs70ouz4/kernel.cpp"
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

.lr.ph697.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i
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

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i, %6
  %56 = phi i64 [ %35, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i ]
  %57 = lshr i64 %56, 5
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775776
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0320.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i: ; preds = %60, %55
  %.sroa.0322.1.i = phi i16 [ %.sroa.0320.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0322.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !19
  %67 = add nuw nsw i64 %56, 64
  %68 = icmp ult i64 %56, 1984
  br i1 %68, label %55, label %.lr.ph697.i, !llvm.loop !24

.lr.ph700.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph697.i
  %83 = phi i64 [ %49, %.lr.ph697.i ], [ %92, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %84 = lshr i64 %83, 6
  %85 = shl nuw nsw i64 %83, 5
  %86 = and i64 %85, 2016
  %87 = or disjoint i64 %86, %84
  %88 = trunc i64 %87 to i32
  %89 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %88
  %.sroa.0369.0.copyload.i = load i16, ptr addrspace(3) %89, align 2, !tbaa.struct !19
  %90 = trunc i64 %83 to i32
  %91 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %90
  store i16 %.sroa.0369.0.copyload.i, ptr addrspace(3) %91, align 2, !tbaa.struct !19
  %92 = add nuw nsw i64 %83, 64
  %93 = icmp ult i64 %83, 1984
  br i1 %93, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph700.i, !llvm.loop !28

.lr.ph703.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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

104:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph700.i
  %105 = phi i64 [ %73, %.lr.ph700.i ], [ %116, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %106 = lshr i64 %105, 6
  %107 = icmp slt i64 %106, %76
  %108 = and i1 %107, %82
  br i1 %108, label %109, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

109:                                              ; preds = %104
  %110 = and i64 %105, 9223372036854775744
  %111 = or disjoint i64 %110, %78
  %112 = or disjoint i64 %111, %73
  %113 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %112
  %.sroa.0279.0.copyload.i = load i16, ptr %113, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %109, %104
  %.sroa.0281.1.i = phi i16 [ %.sroa.0279.0.copyload.i, %109 ], [ 0, %104 ]
  %114 = trunc i64 %105 to i32
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %114
  store i16 %.sroa.0281.1.i, ptr addrspace(3) %115, align 2, !tbaa.struct !19
  %116 = add nuw nsw i64 %105, 64
  %117 = icmp ult i64 %105, 4032
  br i1 %117, label %104, label %.lr.ph703.i, !llvm.loop !29

.lr.ph706.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph703.i
  %132 = phi i64 [ %98, %.lr.ph703.i ], [ %141, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %133 = lshr i64 %132, 6
  %134 = shl nuw nsw i64 %132, 6
  %135 = and i64 %134, 4032
  %136 = or disjoint i64 %135, %133
  %137 = trunc i64 %136 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %102, i32 %137
  %.sroa.0370.0.copyload.i = load i16, ptr addrspace(3) %138, align 2, !tbaa.struct !19
  %139 = trunc i64 %132 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %139
  store i16 %.sroa.0370.0.copyload.i, ptr addrspace(3) %140, align 2, !tbaa.struct !19
  %141 = add nuw nsw i64 %132, 64
  %142 = icmp ult i64 %132, 4032
  br i1 %142, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph706.i, !llvm.loop !30

.lr.ph709.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
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
  br label %304

155:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph706.i
  %156 = phi i64 [ %122, %.lr.ph706.i ], [ %171, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %157 = shl nuw nsw i64 %156, 2
  %158 = and i64 %157, 9223372036854775744
  br label %173

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %159 = or disjoint i64 %158, %128
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %160
  store float %227, ptr addrspace(3) %161, align 4, !tbaa !31
  %162 = or disjoint i64 %158, %129
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %163
  store float %252, ptr addrspace(3) %164, align 4, !tbaa !31
  %165 = or disjoint i64 %158, %130
  %166 = trunc i64 %165 to i32
  %167 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %166
  store float %277, ptr addrspace(3) %167, align 4, !tbaa !31
  %168 = or disjoint i64 %158, %131
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds float, ptr addrspace(3) %125, i32 %169
  store float %302, ptr addrspace(3) %170, align 4, !tbaa !31
  %171 = add nuw nsw i64 %156, 64
  %172 = icmp ult i64 %156, 448
  br i1 %172, label %155, label %.lr.ph709.i, !llvm.loop !33

173:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %155
  %174 = phi i64 [ 0, %155 ], [ %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %175 = phi float [ 0.000000e+00, %155 ], [ %302, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %176 = phi float [ 0.000000e+00, %155 ], [ %277, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %177 = phi float [ 0.000000e+00, %155 ], [ %252, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %178 = phi float [ 0.000000e+00, %155 ], [ %227, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %179 = add nuw i64 %174, %158
  %180 = trunc i64 %179 to i32
  %181 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %180
  %.sroa.0238.0.copyload.i = load i16, ptr addrspace(3) %181, align 2, !tbaa.struct !19
  %182 = shl nuw nsw i64 %174, 6
  %183 = or disjoint i64 %182, %128
  %184 = trunc i64 %183 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %184
  %.sroa.0229.0.copyload.i = load i16, ptr addrspace(3) %185, align 2, !tbaa.struct !19
  %186 = zext i16 %.sroa.0238.0.copyload.i to i32
  %187 = lshr i32 %186, 10
  %188 = and i32 %187, 31
  %189 = and i32 %186, 1023
  switch i32 %188, label %195 [
    i32 31, label %190
    i32 0, label %197
  ]

190:                                              ; preds = %173
  %.sroa.0238.0.copyload.signext.i = sext i16 %.sroa.0238.0.copyload.i to i32
  %191 = and i32 %.sroa.0238.0.copyload.signext.i, -2147483648
  %.not682.i = icmp eq i32 %189, 0
  %192 = select i1 %.not682.i, i32 2139095040, i32 2143289344
  %193 = or disjoint i32 %192, %191
  %194 = bitcast i32 %193 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

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
  %.not664665.i = icmp slt i16 %.sroa.0238.0.copyload.i, 0
  %204 = select contract i1 %.not664665.i, float %203, float %202
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %197, %190
  %205 = phi float [ %194, %190 ], [ %204, %197 ]
  %206 = zext i16 %.sroa.0229.0.copyload.i to i32
  %207 = lshr i32 %206, 10
  %208 = and i32 %207, 31
  %209 = and i32 %206, 1023
  switch i32 %208, label %215 [
    i32 31, label %210
    i32 0, label %217
  ]

210:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0229.0.copyload.signext.i = sext i16 %.sroa.0229.0.copyload.i to i32
  %211 = and i32 %.sroa.0229.0.copyload.signext.i, -2147483648
  %.not681.i = icmp eq i32 %209, 0
  %212 = select i1 %.not681.i, i32 2139095040, i32 2143289344
  %213 = or disjoint i32 %212, %211
  %214 = bitcast i32 %213 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

215:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %216 = or disjoint i32 %209, 1024
  br label %217

217:                                              ; preds = %215, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %218 = phi i32 [ %216, %215 ], [ %209, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %219 = uitofp i32 %218 to float
  %.not666.i = icmp eq i32 %208, 0
  %220 = add nsw i32 %208, -25
  %221 = select i1 %.not666.i, i32 -24, i32 %220
  %222 = call float @__ocml_ldexp_f32(float noundef %219, i32 noundef %221) #5
  %223 = fneg contract float %222
  %.not667668.i = icmp slt i16 %.sroa.0229.0.copyload.i, 0
  %224 = select contract i1 %.not667668.i, float %223, float %222
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %217, %210
  %225 = phi float [ %214, %210 ], [ %224, %217 ]
  %226 = fmul contract float %205, %225
  %227 = fadd contract float %178, %226
  %228 = or disjoint i64 %182, %129
  %229 = trunc i64 %228 to i32
  %230 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %229
  %.sroa.0220.0.copyload.i = load i16, ptr addrspace(3) %230, align 2, !tbaa.struct !19
  %231 = zext i16 %.sroa.0220.0.copyload.i to i32
  %232 = lshr i32 %231, 10
  %233 = and i32 %232, 31
  %234 = and i32 %231, 1023
  switch i32 %233, label %240 [
    i32 31, label %235
    i32 0, label %242
  ]

235:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0220.0.copyload.signext.i = sext i16 %.sroa.0220.0.copyload.i to i32
  %236 = and i32 %.sroa.0220.0.copyload.signext.i, -2147483648
  %.not680.i = icmp eq i32 %234, 0
  %237 = select i1 %.not680.i, i32 2139095040, i32 2143289344
  %238 = or disjoint i32 %237, %236
  %239 = bitcast i32 %238 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

240:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %241 = or disjoint i32 %234, 1024
  br label %242

242:                                              ; preds = %240, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %243 = phi i32 [ %241, %240 ], [ %234, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %244 = uitofp i32 %243 to float
  %.not669.i = icmp eq i32 %233, 0
  %245 = add nsw i32 %233, -25
  %246 = select i1 %.not669.i, i32 -24, i32 %245
  %247 = call float @__ocml_ldexp_f32(float noundef %244, i32 noundef %246) #5
  %248 = fneg contract float %247
  %.not670671.i = icmp slt i16 %.sroa.0220.0.copyload.i, 0
  %249 = select contract i1 %.not670671.i, float %248, float %247
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %242, %235
  %250 = phi float [ %239, %235 ], [ %249, %242 ]
  %251 = fmul contract float %205, %250
  %252 = fadd contract float %177, %251
  %253 = or disjoint i64 %182, %130
  %254 = trunc i64 %253 to i32
  %255 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %254
  %.sroa.0211.0.copyload.i = load i16, ptr addrspace(3) %255, align 2, !tbaa.struct !19
  %256 = zext i16 %.sroa.0211.0.copyload.i to i32
  %257 = lshr i32 %256, 10
  %258 = and i32 %257, 31
  %259 = and i32 %256, 1023
  switch i32 %258, label %265 [
    i32 31, label %260
    i32 0, label %267
  ]

260:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0211.0.copyload.signext.i = sext i16 %.sroa.0211.0.copyload.i to i32
  %261 = and i32 %.sroa.0211.0.copyload.signext.i, -2147483648
  %.not679.i = icmp eq i32 %259, 0
  %262 = select i1 %.not679.i, i32 2139095040, i32 2143289344
  %263 = or disjoint i32 %262, %261
  %264 = bitcast i32 %263 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

265:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %266 = or disjoint i32 %259, 1024
  br label %267

267:                                              ; preds = %265, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %268 = phi i32 [ %266, %265 ], [ %259, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %269 = uitofp i32 %268 to float
  %.not672.i = icmp eq i32 %258, 0
  %270 = add nsw i32 %258, -25
  %271 = select i1 %.not672.i, i32 -24, i32 %270
  %272 = call float @__ocml_ldexp_f32(float noundef %269, i32 noundef %271) #5
  %273 = fneg contract float %272
  %.not673674.i = icmp slt i16 %.sroa.0211.0.copyload.i, 0
  %274 = select contract i1 %.not673674.i, float %273, float %272
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %267, %260
  %275 = phi float [ %264, %260 ], [ %274, %267 ]
  %276 = fmul contract float %205, %275
  %277 = fadd contract float %176, %276
  %278 = or disjoint i64 %182, %131
  %279 = trunc i64 %278 to i32
  %280 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %279
  %.sroa.0202.0.copyload.i = load i16, ptr addrspace(3) %280, align 2, !tbaa.struct !19
  %281 = zext i16 %.sroa.0202.0.copyload.i to i32
  %282 = lshr i32 %281, 10
  %283 = and i32 %282, 31
  %284 = and i32 %281, 1023
  switch i32 %283, label %290 [
    i32 31, label %285
    i32 0, label %292
  ]

285:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0202.0.copyload.signext.i = sext i16 %.sroa.0202.0.copyload.i to i32
  %286 = and i32 %.sroa.0202.0.copyload.signext.i, -2147483648
  %.not678.i = icmp eq i32 %284, 0
  %287 = select i1 %.not678.i, i32 2139095040, i32 2143289344
  %288 = or disjoint i32 %287, %286
  %289 = bitcast i32 %288 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

290:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %291 = or disjoint i32 %284, 1024
  br label %292

292:                                              ; preds = %290, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %293 = phi i32 [ %291, %290 ], [ %284, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %294 = uitofp i32 %293 to float
  %.not675.i = icmp eq i32 %283, 0
  %295 = add nsw i32 %283, -25
  %296 = select i1 %.not675.i, i32 -24, i32 %295
  %297 = call float @__ocml_ldexp_f32(float noundef %294, i32 noundef %296) #5
  %298 = fneg contract float %297
  %.not676677.i = icmp slt i16 %.sroa.0202.0.copyload.i, 0
  %299 = select contract i1 %.not676677.i, float %298, float %297
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %292, %285
  %300 = phi float [ %289, %285 ], [ %299, %292 ]
  %301 = fmul contract float %205, %300
  %302 = fadd contract float %175, %301
  %303 = add nuw nsw i64 %174, 1
  %exitcond.not.i = icmp eq i64 %303, 64
  br i1 %exitcond.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %173, !llvm.loop !34

304:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i, %.lr.ph709.i
  %305 = phi i64 [ %147, %.lr.ph709.i ], [ %317, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i ]
  %306 = lshr i64 %305, 6
  %307 = icmp slt i64 %306, %149
  %308 = and i1 %307, %154
  br i1 %308, label %309, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

309:                                              ; preds = %304
  %310 = trunc i64 %305 to i32
  %311 = getelementptr inbounds float, ptr addrspace(3) %152, i32 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !31
  %313 = and i64 %305, 9223372036854775744
  %314 = or disjoint i64 %313, %153
  %315 = or disjoint i64 %314, %147
  %316 = getelementptr inbounds float, ptr %9, i64 %315
  store float %312, ptr %316, align 4, !tbaa !31
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i: ; preds = %309, %304
  %317 = add nuw nsw i64 %305, 64
  %318 = icmp ult i64 %305, 1984
  br i1 %318, label %304, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !35

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
