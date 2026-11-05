;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898370/tmp/triton-sycl-cache/compile-zvsb6skf/kernel.cpp"
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
  %11 = icmp ult i64 %10, 44739242
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 48
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 44739243
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 44739242
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 48
  call void @llvm.assume(i1 %35)
  %36 = shl i32 %.tr.i, 8
  %37 = sext i32 %5 to i64
  %38 = sext i32 %3 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 7
  %44 = icmp slt i64 %43, %38
  br label %55

.lr.ph714.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
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
  %50 = icmp ult i64 %49, 48
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
  %.sroa.0325.0.copyload.i = load i16, ptr %64, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %60, %55
  %.sroa.0327.1.i = phi i16 [ %.sroa.0325.0.copyload.i, %60 ], [ 0, %55 ]
  %65 = trunc i64 %56 to i32
  %66 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %65
  store i16 %.sroa.0327.1.i, ptr addrspace(3) %66, align 2, !tbaa.struct !23
  %67 = add nuw nsw i64 %56, 48
  %68 = icmp ult i64 %56, 208
  br i1 %68, label %55, label %.lr.ph714.i, !llvm.loop !28

.lr.ph717.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i
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
  %74 = icmp ult i64 %73, 48
  call void @llvm.assume(i1 %74)
  %75 = shl i32 %.tr.i, 9
  %76 = sext i32 %4 to i64
  %77 = sext i32 %5 to i64
  %78 = sext i32 %75 to i64
  %79 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %80 = inttoptr i32 %79 to ptr addrspace(3)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %80, i32 1536
  br label %103

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, %.lr.ph714.i
  %82 = phi i64 [ %49, %.lr.ph714.i ], [ %91, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i ]
  %83 = lshr i64 %82, 5
  %84 = shl nuw nsw i64 %82, 3
  %85 = and i64 %84, 248
  %86 = or disjoint i64 %85, %83
  %87 = trunc i64 %86 to i32
  %88 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %53, i32 %87
  %.sroa.0387.0.copyload.i = load i16, ptr addrspace(3) %88, align 2, !tbaa.struct !23
  %89 = trunc i64 %82 to i32
  %90 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %54, i32 %89
  store i16 %.sroa.0387.0.copyload.i, ptr addrspace(3) %90, align 2, !tbaa.struct !23
  %91 = add nuw nsw i64 %82, 48
  %92 = icmp ult i64 %82, 208
  br i1 %92, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, label %.lr.ph717.i, !llvm.loop !32

.lr.ph720.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %94 = icmp eq i64 %93, 0
  call void @llvm.assume(i1 %94)
  %95 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %96 = icmp eq i64 %95, 0
  call void @llvm.assume(i1 %96)
  %97 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %98 = icmp ult i64 %97, 48
  call void @llvm.assume(i1 %98)
  %99 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %100 = inttoptr i32 %99 to ptr addrspace(3)
  %101 = getelementptr inbounds i8, ptr addrspace(3) %100, i32 1536
  %102 = getelementptr inbounds i8, ptr addrspace(3) %100, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

103:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i, %.lr.ph717.i
  %104 = phi i64 [ %73, %.lr.ph717.i ], [ %117, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i ]
  %105 = lshr i64 %104, 5
  %106 = and i64 %104, 31
  %107 = icmp slt i64 %105, %76
  %108 = icmp slt i64 %106, %77
  %109 = and i1 %107, %108
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i

110:                                              ; preds = %103
  %111 = and i64 %104, 9223372036854775776
  %112 = or disjoint i64 %111, %78
  %113 = or disjoint i64 %112, %106
  %114 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %113
  %.sroa.0284.0.copyload.i = load i16, ptr %114, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit30.i.i.i.i: ; preds = %110, %103
  %.sroa.0286.1.i = phi i16 [ %.sroa.0284.0.copyload.i, %110 ], [ 0, %103 ]
  %115 = trunc i64 %104 to i32
  %116 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %81, i32 %115
  store i16 %.sroa.0286.1.i, ptr addrspace(3) %116, align 2, !tbaa.struct !23
  %117 = add nuw nsw i64 %104, 48
  %118 = icmp ult i64 %104, 464
  br i1 %118, label %103, label %.lr.ph720.i, !llvm.loop !33

.lr.ph723.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
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
  %124 = icmp ult i64 %123, 48
  call void @llvm.assume(i1 %124)
  %125 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %126 = inttoptr i32 %125 to ptr addrspace(3)
  %127 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 1024
  %128 = getelementptr inbounds i8, ptr addrspace(3) %126, i32 2560
  %129 = and i64 %123, 15
  br label %144

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph720.i
  %130 = phi i64 [ %97, %.lr.ph720.i ], [ %139, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %131 = lshr i64 %130, 4
  %132 = shl nuw nsw i64 %130, 5
  %133 = and i64 %132, 480
  %134 = or disjoint i64 %133, %131
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %101, i32 %135
  %.sroa.0386.0.copyload.i = load i16, ptr addrspace(3) %136, align 2, !tbaa.struct !23
  %137 = trunc i64 %130 to i32
  %138 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %102, i32 %137
  store i16 %.sroa.0386.0.copyload.i, ptr addrspace(3) %138, align 2, !tbaa.struct !23
  %139 = add nuw nsw i64 %130, 48
  %140 = icmp ult i64 %130, 464
  br i1 %140, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %.lr.ph723.i, !llvm.loop !34

._crit_edge724.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %142 = icmp ult i64 %141, 48
  call void @llvm.assume(i1 %142)
  %143 = icmp eq i64 %141, 0
  br i1 %143, label %357, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

144:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %.lr.ph723.i
  %145 = phi i64 [ %123, %.lr.ph723.i ], [ %151, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i ]
  %146 = shl nuw nsw i64 %145, 1
  %147 = and i64 %146, 224
  br label %153

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %148 = trunc i64 %145 to i32
  %149 = and i32 %148, 127
  %150 = getelementptr inbounds float, ptr addrspace(3) %126, i32 %149
  store float %354, ptr addrspace(3) %150, align 4, !tbaa !35
  %151 = add nuw nsw i64 %145, 48
  %152 = icmp ult i64 %145, 80
  br i1 %152, label %144, label %._crit_edge724.i, !llvm.loop !37

153:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %144
  %154 = phi i64 [ 0, %144 ], [ %355, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %155 = phi float [ 0.000000e+00, %144 ], [ %354, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %156 = add nuw nsw i64 %154, %147
  %157 = trunc i64 %156 to i32
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %157
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %158, align 2, !tbaa.struct !23
  %159 = shl nuw nsw i64 %154, 4
  %160 = or disjoint i64 %159, %129
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %161
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %162, align 2, !tbaa.struct !23
  %163 = zext i16 %.sroa.0243.0.copyload.i to i32
  %164 = lshr i32 %163, 10
  %165 = and i32 %164, 31
  %166 = and i32 %163, 1023
  switch i32 %165, label %172 [
    i32 31, label %167
    i32 0, label %174
  ]

167:                                              ; preds = %153
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %168 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not702.i = icmp eq i32 %166, 0
  %169 = select i1 %.not702.i, i32 2139095040, i32 2143289344
  %170 = or disjoint i32 %169, %168
  %171 = bitcast i32 %170 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

172:                                              ; preds = %153
  %173 = or disjoint i32 %166, 1024
  br label %174

174:                                              ; preds = %172, %153
  %175 = phi i32 [ %173, %172 ], [ %166, %153 ]
  %176 = uitofp i32 %175 to float
  %.not.i = icmp eq i32 %165, 0
  %177 = add nsw i32 %165, -25
  %178 = select i1 %.not.i, i32 -24, i32 %177
  %179 = call float @__ocml_ldexp_f32(float noundef %176, i32 noundef %178) #5
  %180 = fneg contract float %179
  %.not672673.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %181 = select contract i1 %.not672673.i, float %180, float %179
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i: ; preds = %174, %167
  %182 = phi float [ %171, %167 ], [ %181, %174 ]
  %183 = zext i16 %.sroa.0234.0.copyload.i to i32
  %184 = lshr i32 %183, 10
  %185 = and i32 %184, 31
  %186 = and i32 %183, 1023
  switch i32 %185, label %192 [
    i32 31, label %187
    i32 0, label %194
  ]

187:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %188 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not701.i = icmp eq i32 %186, 0
  %189 = select i1 %.not701.i, i32 2139095040, i32 2143289344
  %190 = or disjoint i32 %189, %188
  %191 = bitcast i32 %190 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

192:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %193 = or disjoint i32 %186, 1024
  br label %194

194:                                              ; preds = %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %195 = phi i32 [ %193, %192 ], [ %186, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i ]
  %196 = uitofp i32 %195 to float
  %.not674.i = icmp eq i32 %185, 0
  %197 = add nsw i32 %185, -25
  %198 = select i1 %.not674.i, i32 -24, i32 %197
  %199 = call float @__ocml_ldexp_f32(float noundef %196, i32 noundef %198) #5
  %200 = fneg contract float %199
  %.not675676.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %201 = select contract i1 %.not675676.i, float %200, float %199
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i: ; preds = %194, %187
  %202 = phi float [ %191, %187 ], [ %201, %194 ]
  %203 = fmul contract float %182, %202
  %204 = fadd contract float %155, %203
  %205 = or disjoint i64 %154, 1
  %206 = add nuw nsw i64 %205, %147
  %207 = trunc i64 %206 to i32
  %208 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %207
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %208, align 2, !tbaa.struct !23
  %209 = shl nuw nsw i64 %205, 4
  %210 = or disjoint i64 %209, %129
  %211 = trunc i64 %210 to i32
  %212 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %211
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %212, align 2, !tbaa.struct !23
  %213 = zext i16 %.sroa.0225.0.copyload.i to i32
  %214 = lshr i32 %213, 10
  %215 = and i32 %214, 31
  %216 = and i32 %213, 1023
  switch i32 %215, label %222 [
    i32 31, label %217
    i32 0, label %224
  ]

217:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %218 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not700.i = icmp eq i32 %216, 0
  %219 = select i1 %.not700.i, i32 2139095040, i32 2143289344
  %220 = or disjoint i32 %219, %218
  %221 = bitcast i32 %220 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

222:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %223 = or disjoint i32 %216, 1024
  br label %224

224:                                              ; preds = %222, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %225 = phi i32 [ %223, %222 ], [ %216, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i ]
  %226 = uitofp i32 %225 to float
  %.not677.i = icmp eq i32 %215, 0
  %227 = add nsw i32 %215, -25
  %228 = select i1 %.not677.i, i32 -24, i32 %227
  %229 = call float @__ocml_ldexp_f32(float noundef %226, i32 noundef %228) #5
  %230 = fneg contract float %229
  %.not678679.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %231 = select contract i1 %.not678679.i, float %230, float %229
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i: ; preds = %224, %217
  %232 = phi float [ %221, %217 ], [ %231, %224 ]
  %233 = zext i16 %.sroa.0216.0.copyload.i to i32
  %234 = lshr i32 %233, 10
  %235 = and i32 %234, 31
  %236 = and i32 %233, 1023
  switch i32 %235, label %242 [
    i32 31, label %237
    i32 0, label %244
  ]

237:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %238 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not699.i = icmp eq i32 %236, 0
  %239 = select i1 %.not699.i, i32 2139095040, i32 2143289344
  %240 = or disjoint i32 %239, %238
  %241 = bitcast i32 %240 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

242:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %243 = or disjoint i32 %236, 1024
  br label %244

244:                                              ; preds = %242, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %245 = phi i32 [ %243, %242 ], [ %236, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i ]
  %246 = uitofp i32 %245 to float
  %.not680.i = icmp eq i32 %235, 0
  %247 = add nsw i32 %235, -25
  %248 = select i1 %.not680.i, i32 -24, i32 %247
  %249 = call float @__ocml_ldexp_f32(float noundef %246, i32 noundef %248) #5
  %250 = fneg contract float %249
  %.not681682.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %251 = select contract i1 %.not681682.i, float %250, float %249
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i: ; preds = %244, %237
  %252 = phi float [ %241, %237 ], [ %251, %244 ]
  %253 = fmul contract float %232, %252
  %254 = fadd contract float %204, %253
  %255 = or disjoint i64 %154, 2
  %256 = add nuw nsw i64 %255, %147
  %257 = trunc i64 %256 to i32
  %258 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %257
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %258, align 2, !tbaa.struct !23
  %259 = shl nuw nsw i64 %255, 4
  %260 = or disjoint i64 %259, %129
  %261 = trunc i64 %260 to i32
  %262 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %261
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %262, align 2, !tbaa.struct !23
  %263 = zext i16 %.sroa.0207.0.copyload.i to i32
  %264 = lshr i32 %263, 10
  %265 = and i32 %264, 31
  %266 = and i32 %263, 1023
  switch i32 %265, label %272 [
    i32 31, label %267
    i32 0, label %274
  ]

267:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %268 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not698.i = icmp eq i32 %266, 0
  %269 = select i1 %.not698.i, i32 2139095040, i32 2143289344
  %270 = or disjoint i32 %269, %268
  %271 = bitcast i32 %270 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

272:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %273 = or disjoint i32 %266, 1024
  br label %274

274:                                              ; preds = %272, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %275 = phi i32 [ %273, %272 ], [ %266, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i ]
  %276 = uitofp i32 %275 to float
  %.not683.i = icmp eq i32 %265, 0
  %277 = add nsw i32 %265, -25
  %278 = select i1 %.not683.i, i32 -24, i32 %277
  %279 = call float @__ocml_ldexp_f32(float noundef %276, i32 noundef %278) #5
  %280 = fneg contract float %279
  %.not684685.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %281 = select contract i1 %.not684685.i, float %280, float %279
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %274, %267
  %282 = phi float [ %271, %267 ], [ %281, %274 ]
  %283 = zext i16 %.sroa.0198.0.copyload.i to i32
  %284 = lshr i32 %283, 10
  %285 = and i32 %284, 31
  %286 = and i32 %283, 1023
  switch i32 %285, label %292 [
    i32 31, label %287
    i32 0, label %294
  ]

287:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %288 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not697.i = icmp eq i32 %286, 0
  %289 = select i1 %.not697.i, i32 2139095040, i32 2143289344
  %290 = or disjoint i32 %289, %288
  %291 = bitcast i32 %290 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

292:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %293 = or disjoint i32 %286, 1024
  br label %294

294:                                              ; preds = %292, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %295 = phi i32 [ %293, %292 ], [ %286, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %296 = uitofp i32 %295 to float
  %.not686.i = icmp eq i32 %285, 0
  %297 = add nsw i32 %285, -25
  %298 = select i1 %.not686.i, i32 -24, i32 %297
  %299 = call float @__ocml_ldexp_f32(float noundef %296, i32 noundef %298) #5
  %300 = fneg contract float %299
  %.not687688.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %301 = select contract i1 %.not687688.i, float %300, float %299
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i: ; preds = %294, %287
  %302 = phi float [ %291, %287 ], [ %301, %294 ]
  %303 = fmul contract float %282, %302
  %304 = fadd contract float %254, %303
  %305 = or disjoint i64 %154, 3
  %306 = add nuw nsw i64 %305, %147
  %307 = trunc i64 %306 to i32
  %308 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %127, i32 %307
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %308, align 2, !tbaa.struct !23
  %309 = shl nuw nsw i64 %305, 4
  %310 = or disjoint i64 %309, %129
  %311 = trunc i64 %310 to i32
  %312 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %128, i32 %311
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %312, align 2, !tbaa.struct !23
  %313 = zext i16 %.sroa.0189.0.copyload.i to i32
  %314 = lshr i32 %313, 10
  %315 = and i32 %314, 31
  %316 = and i32 %313, 1023
  switch i32 %315, label %322 [
    i32 31, label %317
    i32 0, label %324
  ]

317:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %318 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not696.i = icmp eq i32 %316, 0
  %319 = select i1 %.not696.i, i32 2139095040, i32 2143289344
  %320 = or disjoint i32 %319, %318
  %321 = bitcast i32 %320 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

322:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %323 = or disjoint i32 %316, 1024
  br label %324

324:                                              ; preds = %322, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i
  %325 = phi i32 [ %323, %322 ], [ %316, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i.i ]
  %326 = uitofp i32 %325 to float
  %.not689.i = icmp eq i32 %315, 0
  %327 = add nsw i32 %315, -25
  %328 = select i1 %.not689.i, i32 -24, i32 %327
  %329 = call float @__ocml_ldexp_f32(float noundef %326, i32 noundef %328) #5
  %330 = fneg contract float %329
  %.not690691.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %331 = select contract i1 %.not690691.i, float %330, float %329
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i: ; preds = %324, %317
  %332 = phi float [ %321, %317 ], [ %331, %324 ]
  %333 = zext i16 %.sroa.0180.0.copyload.i to i32
  %334 = lshr i32 %333, 10
  %335 = and i32 %334, 31
  %336 = and i32 %333, 1023
  switch i32 %335, label %342 [
    i32 31, label %337
    i32 0, label %344
  ]

337:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %338 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not695.i = icmp eq i32 %336, 0
  %339 = select i1 %.not695.i, i32 2139095040, i32 2143289344
  %340 = or disjoint i32 %339, %338
  %341 = bitcast i32 %340 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

342:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %343 = or disjoint i32 %336, 1024
  br label %344

344:                                              ; preds = %342, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i
  %345 = phi i32 [ %343, %342 ], [ %336, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i.i ]
  %346 = uitofp i32 %345 to float
  %.not692.i = icmp eq i32 %335, 0
  %347 = add nsw i32 %335, -25
  %348 = select i1 %.not692.i, i32 -24, i32 %347
  %349 = call float @__ocml_ldexp_f32(float noundef %346, i32 noundef %348) #5
  %350 = fneg contract float %349
  %.not693694.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %351 = select contract i1 %.not693694.i, float %350, float %349
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %344, %337
  %352 = phi float [ %341, %337 ], [ %351, %344 ]
  %353 = fmul contract float %332, %352
  %354 = fadd contract float %304, %353
  %355 = add nuw nsw i64 %154, 4
  %356 = icmp ult i64 %154, 28
  br i1 %356, label %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !38

357:                                              ; preds = %._crit_edge724.i
  %358 = shl i32 %.tr.i, 7
  %359 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %360 = icmp eq i64 %359, 0
  call void @llvm.assume(i1 %360)
  %361 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %362 = icmp eq i64 %361, 0
  call void @llvm.assume(i1 %362)
  %363 = sext i32 %3 to i64
  %364 = call i32 @llvm.amdgcn.groupstaticsize()
  %365 = inttoptr i32 %364 to ptr addrspace(3)
  %366 = sext i32 %358 to i64
  %367 = icmp sgt i32 %4, 0
  %368 = icmp ugt i32 %4, 1
  %369 = icmp ugt i32 %4, 2
  %370 = icmp ugt i32 %4, 3
  %371 = icmp ugt i32 %4, 4
  %372 = icmp ugt i32 %4, 5
  %373 = icmp ugt i32 %4, 6
  %374 = icmp ugt i32 %4, 7
  %375 = icmp ugt i32 %4, 8
  %376 = icmp ugt i32 %4, 9
  %377 = icmp ugt i32 %4, 10
  %378 = icmp ugt i32 %4, 11
  %379 = icmp ugt i32 %4, 12
  %380 = icmp ugt i32 %4, 13
  %381 = icmp ugt i32 %4, 14
  %382 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %357
  %383 = phi i64 [ 0, %357 ], [ %389, %.split.us.i ]
  %384 = icmp slt i64 %383, %363
  %385 = shl i64 %383, 4
  %.tr671.i = trunc i64 %383 to i32
  %386 = shl i32 %.tr671.i, 4
  %387 = sext i32 %386 to i64
  %388 = add nsw i64 %387, %366
  %.fr.i = freeze i1 %384
  %brmerge.not.i = select i1 %.fr.i, i1 %367, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %478, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %389 = add nuw nsw i64 %383, 1
  %exitcond.not.i = icmp eq i64 %389, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %390 = trunc i64 %385 to i32
  %391 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %390
  %392 = load float, ptr addrspace(3) %391, align 4, !tbaa !35
  %393 = getelementptr inbounds float, ptr %9, i64 %388
  store float %392, ptr %393, align 32, !tbaa !35
  br i1 %368, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %394 = trunc i64 %385 to i32
  %395 = or disjoint i32 %394, 1
  %396 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !35
  %398 = or disjoint i64 %388, 1
  %399 = getelementptr inbounds float, ptr %9, i64 %398
  store float %397, ptr %399, align 4, !tbaa !35
  br i1 %369, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %400 = trunc i64 %385 to i32
  %401 = or disjoint i32 %400, 2
  %402 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %401
  %403 = load float, ptr addrspace(3) %402, align 4, !tbaa !35
  %404 = or disjoint i64 %388, 2
  %405 = getelementptr inbounds float, ptr %9, i64 %404
  store float %403, ptr %405, align 8, !tbaa !35
  br i1 %370, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %406 = trunc i64 %385 to i32
  %407 = or disjoint i32 %406, 3
  %408 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %407
  %409 = load float, ptr addrspace(3) %408, align 4, !tbaa !35
  %410 = or disjoint i64 %388, 3
  %411 = getelementptr inbounds float, ptr %9, i64 %410
  store float %409, ptr %411, align 4, !tbaa !35
  br i1 %371, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %412 = trunc i64 %385 to i32
  %413 = or disjoint i32 %412, 4
  %414 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %413
  %415 = load float, ptr addrspace(3) %414, align 4, !tbaa !35
  %416 = or disjoint i64 %388, 4
  %417 = getelementptr inbounds float, ptr %9, i64 %416
  store float %415, ptr %417, align 16, !tbaa !35
  br i1 %372, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %418 = trunc i64 %385 to i32
  %419 = or disjoint i32 %418, 5
  %420 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %419
  %421 = load float, ptr addrspace(3) %420, align 4, !tbaa !35
  %422 = or disjoint i64 %388, 5
  %423 = getelementptr inbounds float, ptr %9, i64 %422
  store float %421, ptr %423, align 4, !tbaa !35
  br i1 %373, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %424 = trunc i64 %385 to i32
  %425 = or disjoint i32 %424, 6
  %426 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %425
  %427 = load float, ptr addrspace(3) %426, align 4, !tbaa !35
  %428 = or disjoint i64 %388, 6
  %429 = getelementptr inbounds float, ptr %9, i64 %428
  store float %427, ptr %429, align 8, !tbaa !35
  br i1 %374, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %430 = trunc i64 %385 to i32
  %431 = or disjoint i32 %430, 7
  %432 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %431
  %433 = load float, ptr addrspace(3) %432, align 4, !tbaa !35
  %434 = or disjoint i64 %388, 7
  %435 = getelementptr inbounds float, ptr %9, i64 %434
  store float %433, ptr %435, align 4, !tbaa !35
  br i1 %375, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %436 = trunc i64 %385 to i32
  %437 = or disjoint i32 %436, 8
  %438 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %437
  %439 = load float, ptr addrspace(3) %438, align 4, !tbaa !35
  %440 = or disjoint i64 %388, 8
  %441 = getelementptr inbounds float, ptr %9, i64 %440
  store float %439, ptr %441, align 32, !tbaa !35
  br i1 %376, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %442 = trunc i64 %385 to i32
  %443 = or disjoint i32 %442, 9
  %444 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %443
  %445 = load float, ptr addrspace(3) %444, align 4, !tbaa !35
  %446 = or disjoint i64 %388, 9
  %447 = getelementptr inbounds float, ptr %9, i64 %446
  store float %445, ptr %447, align 4, !tbaa !35
  br i1 %377, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %448 = trunc i64 %385 to i32
  %449 = or disjoint i32 %448, 10
  %450 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %449
  %451 = load float, ptr addrspace(3) %450, align 4, !tbaa !35
  %452 = or disjoint i64 %388, 10
  %453 = getelementptr inbounds float, ptr %9, i64 %452
  store float %451, ptr %453, align 8, !tbaa !35
  br i1 %378, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %454 = trunc i64 %385 to i32
  %455 = or disjoint i32 %454, 11
  %456 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !35
  %458 = or disjoint i64 %388, 11
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 4, !tbaa !35
  br i1 %379, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %460 = trunc i64 %385 to i32
  %461 = or disjoint i32 %460, 12
  %462 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %461
  %463 = load float, ptr addrspace(3) %462, align 4, !tbaa !35
  %464 = or disjoint i64 %388, 12
  %465 = getelementptr inbounds float, ptr %9, i64 %464
  store float %463, ptr %465, align 16, !tbaa !35
  br i1 %380, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %466 = trunc i64 %385 to i32
  %467 = or disjoint i32 %466, 13
  %468 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %467
  %469 = load float, ptr addrspace(3) %468, align 4, !tbaa !35
  %470 = or disjoint i64 %388, 13
  %471 = getelementptr inbounds float, ptr %9, i64 %470
  store float %469, ptr %471, align 4, !tbaa !35
  br i1 %381, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %472 = trunc i64 %385 to i32
  %473 = or disjoint i32 %472, 14
  %474 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %473
  %475 = load float, ptr addrspace(3) %474, align 4, !tbaa !35
  %476 = or disjoint i64 %388, 14
  %477 = getelementptr inbounds float, ptr %9, i64 %476
  store float %475, ptr %477, align 8, !tbaa !35
  br i1 %382, label %478, label %.split.us.i

478:                                              ; preds = %.preheader.split.15.i
  %479 = trunc i64 %385 to i32
  %480 = or disjoint i32 %479, 15
  %481 = getelementptr inbounds float, ptr addrspace(3) %365, i32 %480
  %482 = load float, ptr addrspace(3) %481, align 4, !tbaa !35
  %483 = or disjoint i64 %388, 15
  %484 = getelementptr inbounds float, ptr %9, i64 %483
  store float %482, ptr %484, align 4, !tbaa !35
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge724.i, %.split.us.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="48,48" }
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
!39 = distinct !{!39, !29}
;----------------- End AdaptiveCpp IR dump ---------------
