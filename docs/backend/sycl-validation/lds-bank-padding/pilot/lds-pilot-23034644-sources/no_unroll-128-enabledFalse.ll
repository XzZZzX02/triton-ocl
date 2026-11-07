;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-dwzkz60d/kernel.cpp"
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
  %30 = shl i32 %.tr.i, 11
  %31 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %32 = icmp eq i64 %31, 0
  call void @llvm.assume(i1 %32)
  %33 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %34 = icmp eq i64 %33, 0
  call void @llvm.assume(i1 %34)
  %35 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %36 = icmp ult i64 %35, 128
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
  %50 = icmp ult i64 %49, 128
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
  %67 = add nuw nsw i64 %56, 128
  %68 = icmp ult i64 %56, 1920
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
  %74 = icmp ult i64 %73, 128
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, %.lr.ph697.i
  %84 = phi i64 [ %49, %.lr.ph697.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i ]
  %85 = lshr i64 %84, 6
  %86 = shl nuw nsw i64 %84, 5
  %87 = and i64 %86, 2016
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0369.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !19
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0369.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !19
  %93 = add nuw nsw i64 %84, 128
  %94 = icmp ult i64 %84, 1920
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i, label %.lr.ph700.i, !llvm.loop !28

.lr.ph703.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %103 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 16384
  %104 = getelementptr inbounds i8, ptr addrspace(3) %102, i32 24576
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i

105:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph700.i
  %106 = phi i64 [ %73, %.lr.ph700.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %107 = lshr i64 %106, 6
  %108 = icmp slt i64 %107, %76
  %109 = and i1 %108, %83
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

110:                                              ; preds = %105
  %111 = and i64 %106, 9223372036854775744
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %82
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0279.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !19
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %110, %105
  %.sroa.0281.1.i = phi i16 [ %.sroa.0279.0.copyload.i, %110 ], [ 0, %105 ]
  %115 = trunc i64 %106 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0281.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !19
  %117 = add nuw nsw i64 %106, 128
  %118 = icmp ult i64 %106, 3968
  br i1 %118, label %105, label %.lr.ph703.i, !llvm.loop !29

.lr.ph706.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i
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
  %127 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 12288
  %128 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 24576
  %129 = and i64 %123, 15
  %130 = or disjoint i64 %129, 16
  %131 = or disjoint i64 %129, 32
  %132 = or disjoint i64 %129, 48
  br label %157

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, %.lr.ph703.i
  %133 = phi i64 [ %99, %.lr.ph703.i ], [ %142, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i ]
  %134 = lshr i64 %133, 6
  %135 = shl nuw nsw i64 %133, 6
  %136 = and i64 %135, 4032
  %137 = or disjoint i64 %136, %134
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %138
  %.sroa.0370.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !19
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %140
  store i16 %.sroa.0370.0.copyload.i, ptr addrspace(3) %141, align 2, !tbaa.struct !19
  %142 = add nuw nsw i64 %133, 128
  %143 = icmp ult i64 %133, 3968
  br i1 %143, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i, label %.lr.ph706.i, !llvm.loop !30

.lr.ph709.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
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
  %149 = icmp ult i64 %148, 128
  call void @llvm.assume(i1 %149)
  %150 = sext i32 %3 to i64
  %151 = sext i32 %4 to i64
  %152 = call i32 @llvm.amdgcn.groupstaticsize()
  %153 = inttoptr i32 %152 to ptr addrspace(3)
  %154 = sext i32 %30 to i64
  %155 = and i64 %148, 63
  %156 = icmp slt i64 %155, %151
  br label %306

157:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph706.i
  %158 = phi i64 [ %123, %.lr.ph706.i ], [ %173, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %159 = shl nuw nsw i64 %158, 2
  %160 = and i64 %159, 9223372036854775744
  br label %175

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %161 = or disjoint i64 %160, %129
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %162
  store float %229, ptr addrspace(3) %163, align 4, !tbaa !31
  %164 = or disjoint i64 %160, %130
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %165
  store float %254, ptr addrspace(3) %166, align 4, !tbaa !31
  %167 = or disjoint i64 %160, %131
  %168 = trunc i64 %167 to i32
  %169 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %168
  store float %279, ptr addrspace(3) %169, align 4, !tbaa !31
  %170 = or disjoint i64 %160, %132
  %171 = trunc i64 %170 to i32
  %172 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %171
  store float %304, ptr addrspace(3) %172, align 4, !tbaa !31
  %173 = add nuw nsw i64 %158, 128
  %174 = icmp ult i64 %158, 384
  br i1 %174, label %157, label %.lr.ph709.i, !llvm.loop !33

175:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %157
  %176 = phi i64 [ 0, %157 ], [ %305, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %177 = phi float [ 0.000000e+00, %157 ], [ %304, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %178 = phi float [ 0.000000e+00, %157 ], [ %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %179 = phi float [ 0.000000e+00, %157 ], [ %254, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %180 = phi float [ 0.000000e+00, %157 ], [ %229, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %181 = add nuw i64 %176, %160
  %182 = trunc i64 %181 to i32
  %183 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %182
  %.sroa.0238.0.copyload.i = load i16, ptr addrspace(3) %183, align 2, !tbaa.struct !19
  %184 = shl nuw nsw i64 %176, 6
  %185 = or disjoint i64 %184, %129
  %186 = trunc i64 %185 to i32
  %187 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %186
  %.sroa.0229.0.copyload.i = load i16, ptr addrspace(3) %187, align 2, !tbaa.struct !19
  %188 = zext i16 %.sroa.0238.0.copyload.i to i32
  %189 = lshr i32 %188, 10
  %190 = and i32 %189, 31
  %191 = and i32 %188, 1023
  switch i32 %190, label %197 [
    i32 31, label %192
    i32 0, label %199
  ]

192:                                              ; preds = %175
  %.sroa.0238.0.copyload.signext.i = sext i16 %.sroa.0238.0.copyload.i to i32
  %193 = and i32 %.sroa.0238.0.copyload.signext.i, -2147483648
  %.not682.i = icmp eq i32 %191, 0
  %194 = select i1 %.not682.i, i32 2139095040, i32 2143289344
  %195 = or disjoint i32 %194, %193
  %196 = bitcast i32 %195 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

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
  %.not664665.i = icmp slt i16 %.sroa.0238.0.copyload.i, 0
  %206 = select contract i1 %.not664665.i, float %205, float %204
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %199, %192
  %207 = phi float [ %196, %192 ], [ %206, %199 ]
  %208 = zext i16 %.sroa.0229.0.copyload.i to i32
  %209 = lshr i32 %208, 10
  %210 = and i32 %209, 31
  %211 = and i32 %208, 1023
  switch i32 %210, label %217 [
    i32 31, label %212
    i32 0, label %219
  ]

212:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0229.0.copyload.signext.i = sext i16 %.sroa.0229.0.copyload.i to i32
  %213 = and i32 %.sroa.0229.0.copyload.signext.i, -2147483648
  %.not681.i = icmp eq i32 %211, 0
  %214 = select i1 %.not681.i, i32 2139095040, i32 2143289344
  %215 = or disjoint i32 %214, %213
  %216 = bitcast i32 %215 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %218 = or disjoint i32 %211, 1024
  br label %219

219:                                              ; preds = %217, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %220 = phi i32 [ %218, %217 ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %221 = uitofp i32 %220 to float
  %.not666.i = icmp eq i32 %210, 0
  %222 = add nsw i32 %210, -25
  %223 = select i1 %.not666.i, i32 -24, i32 %222
  %224 = call float @__ocml_ldexp_f32(float noundef %221, i32 noundef %223) #5
  %225 = fneg contract float %224
  %.not667668.i = icmp slt i16 %.sroa.0229.0.copyload.i, 0
  %226 = select contract i1 %.not667668.i, float %225, float %224
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %219, %212
  %227 = phi float [ %216, %212 ], [ %226, %219 ]
  %228 = fmul contract float %207, %227
  %229 = fadd contract float %180, %228
  %230 = or disjoint i64 %184, %130
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %231
  %.sroa.0220.0.copyload.i = load i16, ptr addrspace(3) %232, align 2, !tbaa.struct !19
  %233 = zext i16 %.sroa.0220.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0220.0.copyload.signext.i = sext i16 %.sroa.0220.0.copyload.i to i32
  %238 = and i32 %.sroa.0220.0.copyload.signext.i, -2147483648
  %.not680.i = icmp eq i32 %236, 0
  %239 = select i1 %.not680.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %245 = phi i32 [ %243, %242 ], [ %236, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %246 = uitofp i32 %245 to float
  %.not669.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not669.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #5
  %250 = fneg contract float %249
  %.not670671.i = icmp slt i16 %.sroa.0220.0.copyload.i, 0
  %251 = select contract i1 %.not670671.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = fmul contract float %207, %252
  %254 = fadd contract float %179, %253
  %255 = or disjoint i64 %184, %131
  %256 = trunc i64 %255 to i32
  %257 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %256
  %.sroa.0211.0.copyload.i = load i16, ptr addrspace(3) %257, align 2, !tbaa.struct !19
  %258 = zext i16 %.sroa.0211.0.copyload.i to i32
  %259 = lshr i32 %258, 10
  %260 = and i32 %259, 31
  %261 = and i32 %258, 1023
  switch i32 %260, label %267 [
    i32 31, label %262
    i32 0, label %269
  ]

262:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0211.0.copyload.signext.i = sext i16 %.sroa.0211.0.copyload.i to i32
  %263 = and i32 %.sroa.0211.0.copyload.signext.i, -2147483648
  %.not679.i = icmp eq i32 %261, 0
  %264 = select i1 %.not679.i, i32 2139095040, i32 2143289344
  %265 = or disjoint i32 %264, %263
  %266 = bitcast i32 %265 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %268 = or disjoint i32 %261, 1024
  br label %269

269:                                              ; preds = %267, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %270 = phi i32 [ %268, %267 ], [ %261, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %271 = uitofp i32 %270 to float
  %.not672.i = icmp eq i32 %260, 0
  %272 = add nsw i32 %260, -25
  %273 = select i1 %.not672.i, i32 -24, i32 %272
  %274 = call float @__ocml_ldexp_f32(float noundef %271, i32 noundef %273) #5
  %275 = fneg contract float %274
  %.not673674.i = icmp slt i16 %.sroa.0211.0.copyload.i, 0
  %276 = select contract i1 %.not673674.i, float %275, float %274
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %269, %262
  %277 = phi float [ %266, %262 ], [ %276, %269 ]
  %278 = fmul contract float %207, %277
  %279 = fadd contract float %178, %278
  %280 = or disjoint i64 %184, %132
  %281 = trunc i64 %280 to i32
  %282 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %281
  %.sroa.0202.0.copyload.i = load i16, ptr addrspace(3) %282, align 2, !tbaa.struct !19
  %283 = zext i16 %.sroa.0202.0.copyload.i to i32
  %284 = lshr i32 %283, 10
  %285 = and i32 %284, 31
  %286 = and i32 %283, 1023
  switch i32 %285, label %292 [
    i32 31, label %287
    i32 0, label %294
  ]

287:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0202.0.copyload.signext.i = sext i16 %.sroa.0202.0.copyload.i to i32
  %288 = and i32 %.sroa.0202.0.copyload.signext.i, -2147483648
  %.not678.i = icmp eq i32 %286, 0
  %289 = select i1 %.not678.i, i32 2139095040, i32 2143289344
  %290 = or disjoint i32 %289, %288
  %291 = bitcast i32 %290 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

292:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %293 = or disjoint i32 %286, 1024
  br label %294

294:                                              ; preds = %292, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %295 = phi i32 [ %293, %292 ], [ %286, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %296 = uitofp i32 %295 to float
  %.not675.i = icmp eq i32 %285, 0
  %297 = add nsw i32 %285, -25
  %298 = select i1 %.not675.i, i32 -24, i32 %297
  %299 = call float @__ocml_ldexp_f32(float noundef %296, i32 noundef %298) #5
  %300 = fneg contract float %299
  %.not676677.i = icmp slt i16 %.sroa.0202.0.copyload.i, 0
  %301 = select contract i1 %.not676677.i, float %300, float %299
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %294, %287
  %302 = phi float [ %291, %287 ], [ %301, %294 ]
  %303 = fmul contract float %207, %302
  %304 = fadd contract float %177, %303
  %305 = add nuw nsw i64 %176, 1
  %exitcond.not.i = icmp eq i64 %305, 64
  br i1 %exitcond.not.i, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %175, !llvm.loop !34

306:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i, %.lr.ph709.i
  %307 = phi i64 [ %148, %.lr.ph709.i ], [ %319, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i ]
  %308 = lshr i64 %307, 6
  %309 = icmp slt i64 %308, %150
  %310 = and i1 %309, %156
  br i1 %310, label %311, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

311:                                              ; preds = %306
  %312 = trunc i64 %307 to i32
  %313 = getelementptr inbounds float, ptr addrspace(3) %153, i32 %312
  %314 = load float, ptr addrspace(3) %313, align 4, !tbaa !31
  %315 = and i64 %307, 9223372036854775744
  %316 = or disjoint i64 %315, %154
  %317 = or disjoint i64 %316, %155
  %318 = getelementptr inbounds float, ptr %9, i64 %317
  store float %314, ptr %318, align 4, !tbaa !31
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i: ; preds = %311, %306
  %319 = add nuw nsw i64 %307, 128
  %320 = icmp ult i64 %307, 1920
  br i1 %320, label %306, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !35

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
!35 = distinct !{!35, !25}
;----------------- End AdaptiveCpp IR dump ---------------
