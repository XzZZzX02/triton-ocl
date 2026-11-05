;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898369/tmp/triton-sycl-cache/compile-yfahs25q/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
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

.lr.ph518.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
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
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i

55:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %56 = phi i64 [ %34, %6 ], [ %67, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %57 = lshr i64 %56, 3
  %58 = icmp slt i64 %57, %37
  %59 = and i1 %58, %44
  br i1 %59, label %60, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

60:                                               ; preds = %55
  %61 = and i64 %56, 9223372036854775800
  %62 = or disjoint i64 %61, %39
  %63 = or disjoint i64 %62, %43
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %63
  %.sroa.0271.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %60, %55
  %.sroa.0273.1.i = phi i16 [ %.sroa.0271.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0273.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  %67 = add nuw nsw i64 %56, 128
  %68 = icmp ult i64 %56, 128
  br i1 %68, label %55, label %.lr.ph518.i, !llvm.loop !28

.lr.ph521.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, %.lr.ph518.i
  %84 = phi i64 [ %49, %.lr.ph518.i ], [ %93, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i ]
  %85 = lshr i64 %84, 5
  %86 = shl nuw nsw i64 %84, 3
  %87 = and i64 %86, 248
  %88 = or disjoint i64 %87, %85
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %89
  %.sroa.0309.0.copyload.i = load i16, ptr addrspace(3) %90, align 2, !tbaa.struct !23
  %91 = trunc i64 %84 to i32
  %92 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %91
  store i16 %.sroa.0309.0.copyload.i, ptr addrspace(3) %92, align 2, !tbaa.struct !23
  %93 = add nuw nsw i64 %84, 128
  %94 = icmp ult i64 %84, 128
  br i1 %94, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, label %.lr.ph521.i, !llvm.loop !32

.lr.ph524.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i
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
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

105:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i, %.lr.ph521.i
  %106 = phi i64 [ %73, %.lr.ph521.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i ]
  %107 = lshr i64 %106, 5
  %108 = icmp slt i64 %107, %76
  %109 = and i1 %108, %83
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i

110:                                              ; preds = %105
  %111 = and i64 %106, 9223372036854775776
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %82
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0230.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit24.i.i.i.i: ; preds = %110, %105
  %.sroa.0232.1.i = phi i16 [ %.sroa.0230.0.copyload.i, %110 ], [ 0, %105 ]
  %115 = trunc i64 %106 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0232.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = add nuw nsw i64 %106, 128
  %118 = icmp ult i64 %106, 384
  br i1 %118, label %105, label %.lr.ph524.i, !llvm.loop !33

.lr.ph527.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph524.i
  %132 = phi i64 [ %99, %.lr.ph524.i ], [ %141, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %133 = lshr i64 %132, 4
  %134 = shl nuw nsw i64 %132, 5
  %135 = and i64 %134, 480
  %136 = or disjoint i64 %135, %133
  %137 = trunc i64 %136 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %103, i32 %137
  %.sroa.0308.0.copyload.i = load i16, ptr addrspace(3) %138, align 2, !tbaa.struct !23
  %139 = trunc i64 %132 to i32
  %140 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %104, i32 %139
  store i16 %.sroa.0308.0.copyload.i, ptr addrspace(3) %140, align 2, !tbaa.struct !23
  %141 = add nuw nsw i64 %132, 128
  %142 = icmp ult i64 %132, 384
  br i1 %142, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %.lr.ph527.i, !llvm.loop !34

._crit_edge528.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %143 = trunc i64 %123 to i32
  %144 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %143
  store float %200, ptr addrspace(3) %144, align 4, !tbaa !35
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
  br i1 %148, label %202, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

149:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph527.i
  %150 = phi i64 [ 0, %.lr.ph527.i ], [ %201, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %151 = phi float [ 0.000000e+00, %.lr.ph527.i ], [ %200, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %152 = add nuw nsw i64 %150, %131
  %153 = trunc i64 %152 to i32
  %154 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %153
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %154, align 2, !tbaa.struct !23
  %155 = shl nuw nsw i64 %150, 4
  %156 = or disjoint i64 %155, %129
  %157 = trunc i64 %156 to i32
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %157
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %158, align 2, !tbaa.struct !23
  %159 = zext i16 %.sroa.0189.0.copyload.i to i32
  %160 = lshr i32 %159, 10
  %161 = and i32 %160, 31
  %162 = and i32 %159, 1023
  switch i32 %161, label %168 [
    i32 31, label %163
    i32 0, label %170
  ]

163:                                              ; preds = %149
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %164 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not506.i = icmp eq i32 %162, 0
  %165 = select i1 %.not506.i, i32 2139095040, i32 2143289344
  %166 = or disjoint i32 %165, %164
  %167 = bitcast i32 %166 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

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
  %.not500501.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %177 = select contract i1 %.not500501.i, float %176, float %175
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %170, %163
  %178 = phi float [ %167, %163 ], [ %177, %170 ]
  %179 = zext i16 %.sroa.0180.0.copyload.i to i32
  %180 = lshr i32 %179, 10
  %181 = and i32 %180, 31
  %182 = and i32 %179, 1023
  switch i32 %181, label %188 [
    i32 31, label %183
    i32 0, label %190
  ]

183:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %184 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not505.i = icmp eq i32 %182, 0
  %185 = select i1 %.not505.i, i32 2139095040, i32 2143289344
  %186 = or disjoint i32 %185, %184
  %187 = bitcast i32 %186 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

188:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %189 = or disjoint i32 %182, 1024
  br label %190

190:                                              ; preds = %188, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %191 = phi i32 [ %189, %188 ], [ %182, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %192 = uitofp i32 %191 to float
  %.not502.i = icmp eq i32 %181, 0
  %193 = add nsw i32 %181, -25
  %194 = select i1 %.not502.i, i32 -24, i32 %193
  %195 = call float @__ocml_ldexp_f32(float noundef %192, i32 noundef %194) #5
  %196 = fneg contract float %195
  %.not503504.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %197 = select contract i1 %.not503504.i, float %196, float %195
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %190, %183
  %198 = phi float [ %187, %183 ], [ %197, %190 ]
  %199 = fmul contract float %178, %198
  %200 = fadd contract float %151, %199
  %201 = add nuw nsw i64 %150, 1
  %exitcond.not.i = icmp eq i64 %201, 32
  br i1 %exitcond.not.i, label %._crit_edge528.i, label %149, !llvm.loop !37

202:                                              ; preds = %._crit_edge528.i
  %203 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %204 = icmp eq i64 %203, 0
  call void @llvm.assume(i1 %204)
  %205 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %206 = icmp eq i64 %205, 0
  call void @llvm.assume(i1 %206)
  %207 = sext i32 %3 to i64
  %208 = call i32 @llvm.amdgcn.groupstaticsize()
  %209 = inttoptr i32 %208 to ptr addrspace(3)
  %210 = icmp sgt i32 %4, 0
  %211 = icmp ugt i32 %4, 1
  %212 = icmp ugt i32 %4, 2
  %213 = icmp ugt i32 %4, 3
  %214 = icmp ugt i32 %4, 4
  %215 = icmp ugt i32 %4, 5
  %216 = icmp ugt i32 %4, 6
  %217 = icmp ugt i32 %4, 7
  %218 = icmp ugt i32 %4, 8
  %219 = icmp ugt i32 %4, 9
  %220 = icmp ugt i32 %4, 10
  %221 = icmp ugt i32 %4, 11
  %222 = icmp ugt i32 %4, 12
  %223 = icmp ugt i32 %4, 13
  %224 = icmp ugt i32 %4, 14
  %225 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %202
  %226 = phi i64 [ 0, %202 ], [ %232, %.split.us.i ]
  %227 = icmp slt i64 %226, %207
  %228 = shl i64 %226, 4
  %.tr499.i = trunc i64 %226 to i32
  %229 = shl i32 %.tr499.i, 4
  %230 = sext i32 %229 to i64
  %231 = add nsw i64 %145, %230
  %.fr.i = freeze i1 %227
  %brmerge.not.i = select i1 %.fr.i, i1 %210, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %321, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %232 = add nuw nsw i64 %226, 1
  %exitcond531.not.i = icmp eq i64 %232, 8
  br i1 %exitcond531.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %233 = trunc i64 %228 to i32
  %234 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %233
  %235 = load float, ptr addrspace(3) %234, align 4, !tbaa !35
  %236 = getelementptr inbounds float, ptr %9, i64 %231
  store float %235, ptr %236, align 32, !tbaa !35
  br i1 %211, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %237 = trunc i64 %228 to i32
  %238 = or disjoint i32 %237, 1
  %239 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %238
  %240 = load float, ptr addrspace(3) %239, align 4, !tbaa !35
  %241 = or disjoint i64 %231, 1
  %242 = getelementptr inbounds float, ptr %9, i64 %241
  store float %240, ptr %242, align 4, !tbaa !35
  br i1 %212, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %243 = trunc i64 %228 to i32
  %244 = or disjoint i32 %243, 2
  %245 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %244
  %246 = load float, ptr addrspace(3) %245, align 4, !tbaa !35
  %247 = or disjoint i64 %231, 2
  %248 = getelementptr inbounds float, ptr %9, i64 %247
  store float %246, ptr %248, align 8, !tbaa !35
  br i1 %213, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %249 = trunc i64 %228 to i32
  %250 = or disjoint i32 %249, 3
  %251 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %250
  %252 = load float, ptr addrspace(3) %251, align 4, !tbaa !35
  %253 = or disjoint i64 %231, 3
  %254 = getelementptr inbounds float, ptr %9, i64 %253
  store float %252, ptr %254, align 4, !tbaa !35
  br i1 %214, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %255 = trunc i64 %228 to i32
  %256 = or disjoint i32 %255, 4
  %257 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %256
  %258 = load float, ptr addrspace(3) %257, align 4, !tbaa !35
  %259 = or disjoint i64 %231, 4
  %260 = getelementptr inbounds float, ptr %9, i64 %259
  store float %258, ptr %260, align 16, !tbaa !35
  br i1 %215, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %261 = trunc i64 %228 to i32
  %262 = or disjoint i32 %261, 5
  %263 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %262
  %264 = load float, ptr addrspace(3) %263, align 4, !tbaa !35
  %265 = or disjoint i64 %231, 5
  %266 = getelementptr inbounds float, ptr %9, i64 %265
  store float %264, ptr %266, align 4, !tbaa !35
  br i1 %216, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %267 = trunc i64 %228 to i32
  %268 = or disjoint i32 %267, 6
  %269 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %268
  %270 = load float, ptr addrspace(3) %269, align 4, !tbaa !35
  %271 = or disjoint i64 %231, 6
  %272 = getelementptr inbounds float, ptr %9, i64 %271
  store float %270, ptr %272, align 8, !tbaa !35
  br i1 %217, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %273 = trunc i64 %228 to i32
  %274 = or disjoint i32 %273, 7
  %275 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %274
  %276 = load float, ptr addrspace(3) %275, align 4, !tbaa !35
  %277 = or disjoint i64 %231, 7
  %278 = getelementptr inbounds float, ptr %9, i64 %277
  store float %276, ptr %278, align 4, !tbaa !35
  br i1 %218, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %279 = trunc i64 %228 to i32
  %280 = or disjoint i32 %279, 8
  %281 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %280
  %282 = load float, ptr addrspace(3) %281, align 4, !tbaa !35
  %283 = or disjoint i64 %231, 8
  %284 = getelementptr inbounds float, ptr %9, i64 %283
  store float %282, ptr %284, align 32, !tbaa !35
  br i1 %219, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %285 = trunc i64 %228 to i32
  %286 = or disjoint i32 %285, 9
  %287 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %286
  %288 = load float, ptr addrspace(3) %287, align 4, !tbaa !35
  %289 = or disjoint i64 %231, 9
  %290 = getelementptr inbounds float, ptr %9, i64 %289
  store float %288, ptr %290, align 4, !tbaa !35
  br i1 %220, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %291 = trunc i64 %228 to i32
  %292 = or disjoint i32 %291, 10
  %293 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %292
  %294 = load float, ptr addrspace(3) %293, align 4, !tbaa !35
  %295 = or disjoint i64 %231, 10
  %296 = getelementptr inbounds float, ptr %9, i64 %295
  store float %294, ptr %296, align 8, !tbaa !35
  br i1 %221, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %297 = trunc i64 %228 to i32
  %298 = or disjoint i32 %297, 11
  %299 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %298
  %300 = load float, ptr addrspace(3) %299, align 4, !tbaa !35
  %301 = or disjoint i64 %231, 11
  %302 = getelementptr inbounds float, ptr %9, i64 %301
  store float %300, ptr %302, align 4, !tbaa !35
  br i1 %222, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %303 = trunc i64 %228 to i32
  %304 = or disjoint i32 %303, 12
  %305 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %304
  %306 = load float, ptr addrspace(3) %305, align 4, !tbaa !35
  %307 = or disjoint i64 %231, 12
  %308 = getelementptr inbounds float, ptr %9, i64 %307
  store float %306, ptr %308, align 16, !tbaa !35
  br i1 %223, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %309 = trunc i64 %228 to i32
  %310 = or disjoint i32 %309, 13
  %311 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !35
  %313 = or disjoint i64 %231, 13
  %314 = getelementptr inbounds float, ptr %9, i64 %313
  store float %312, ptr %314, align 4, !tbaa !35
  br i1 %224, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %315 = trunc i64 %228 to i32
  %316 = or disjoint i32 %315, 14
  %317 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %316
  %318 = load float, ptr addrspace(3) %317, align 4, !tbaa !35
  %319 = or disjoint i64 %231, 14
  %320 = getelementptr inbounds float, ptr %9, i64 %319
  store float %318, ptr %320, align 8, !tbaa !35
  br i1 %225, label %321, label %.split.us.i

321:                                              ; preds = %.preheader.split.15.i
  %322 = trunc i64 %228 to i32
  %323 = or disjoint i32 %322, 15
  %324 = getelementptr inbounds float, ptr addrspace(3) %209, i32 %323
  %325 = load float, ptr addrspace(3) %324, align 4, !tbaa !35
  %326 = or disjoint i64 %231, 15
  %327 = getelementptr inbounds float, ptr %9, i64 %326
  store float %325, ptr %327, align 4, !tbaa !35
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge528.i, %.split.us.i
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
!33 = distinct !{!33, !29, !30, !31}
!34 = distinct !{!34, !29, !30, !31}
!35 = !{!36, !36, i64 0}
!36 = !{!"float", !26, i64 0}
!37 = distinct !{!37, !29}
!38 = distinct !{!38, !29}
;----------------- End AdaptiveCpp IR dump ---------------
