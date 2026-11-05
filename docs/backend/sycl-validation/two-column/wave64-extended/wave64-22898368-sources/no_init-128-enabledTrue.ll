;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-5rylzzqa/kernel.cpp"
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
  %28 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %29 = icmp eq i64 %28, 0
  call void @llvm.assume(i1 %29)
  %30 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %33 = icmp ult i64 %32, 128
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  %36 = trunc i64 %32 to i32
  %37 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %36
  store float 0.000000e+00, ptr addrspace(3) %37, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %39 = icmp ult i64 %38, 16777215
  call void @llvm.assume(i1 %39)
  %.tr.i = trunc i64 %38 to i32
  %40 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %41 = icmp eq i64 %40, 0
  call void @llvm.assume(i1 %41)
  %42 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %43 = icmp eq i64 %42, 0
  call void @llvm.assume(i1 %43)
  %44 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %45 = icmp ult i64 %44, 128
  call void @llvm.assume(i1 %45)
  %46 = shl nuw i32 %.tr.i, 8
  %47 = sext i32 %5 to i64
  %48 = sext i32 %3 to i64
  %49 = sext i32 %46 to i64
  %50 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %51 = inttoptr i32 %50 to ptr addrspace(3)
  %52 = getelementptr inbounds i8, ptr addrspace(3) %51, i32 512
  %53 = and i64 %44, 7
  %54 = icmp slt i64 %53, %48
  br label %65

.lr.ph771.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %56 = icmp eq i64 %55, 0
  call void @llvm.assume(i1 %56)
  %57 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %58 = icmp eq i64 %57, 0
  call void @llvm.assume(i1 %58)
  %59 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %60 = icmp ult i64 %59, 128
  call void @llvm.assume(i1 %60)
  %61 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %62 = inttoptr i32 %61 to ptr addrspace(3)
  %63 = getelementptr inbounds i8, ptr addrspace(3) %62, i32 512
  %64 = getelementptr inbounds i8, ptr addrspace(3) %62, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i

65:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %66 = phi i64 [ %44, %6 ], [ %77, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %67 = lshr i64 %66, 3
  %68 = icmp slt i64 %67, %47
  %69 = and i1 %68, %54
  br i1 %69, label %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

70:                                               ; preds = %65
  %71 = and i64 %66, 9223372036854775800
  %72 = or disjoint i64 %71, %49
  %73 = or disjoint i64 %72, %53
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0331.0.copyload.i = load i16, ptr %74, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %70, %65
  %.sroa.0333.1.i = phi i16 [ %.sroa.0331.0.copyload.i, %70 ], [ 0, %65 ]
  %75 = trunc i64 %66 to i32
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %75
  store i16 %.sroa.0333.1.i, ptr addrspace(3) %76, align 2, !tbaa.struct !27
  %77 = add nuw nsw i64 %66, 128
  %78 = icmp ult i64 %66, 128
  br i1 %78, label %65, label %.lr.ph771.i, !llvm.loop !30

.lr.ph774.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %80 = icmp eq i64 %79, 0
  call void @llvm.assume(i1 %80)
  %81 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %82 = icmp eq i64 %81, 0
  call void @llvm.assume(i1 %82)
  %83 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %84 = icmp ult i64 %83, 128
  call void @llvm.assume(i1 %84)
  %85 = shl i32 %.tr.i, 9
  %86 = sext i32 %4 to i64
  %87 = sext i32 %5 to i64
  %88 = sext i32 %85 to i64
  %89 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %90 = inttoptr i32 %89 to ptr addrspace(3)
  %91 = getelementptr inbounds i8, ptr addrspace(3) %90, i32 1536
  %92 = and i64 %83, 31
  %93 = icmp slt i64 %92, %87
  br label %115

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, %.lr.ph771.i
  %94 = phi i64 [ %59, %.lr.ph771.i ], [ %103, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i ]
  %95 = lshr i64 %94, 5
  %96 = shl nuw nsw i64 %94, 3
  %97 = and i64 %96, 248
  %98 = or disjoint i64 %97, %95
  %99 = trunc i64 %98 to i32
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %99
  %.sroa.0419.0.copyload.i = load i16, ptr addrspace(3) %100, align 2, !tbaa.struct !27
  %101 = trunc i64 %94 to i32
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %64, i32 %101
  store i16 %.sroa.0419.0.copyload.i, ptr addrspace(3) %102, align 2, !tbaa.struct !27
  %103 = add nuw nsw i64 %94, 128
  %104 = icmp ult i64 %94, 128
  br i1 %104, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit14.i.i.i.i, label %.lr.ph774.i, !llvm.loop !34

.lr.ph777.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %106 = icmp eq i64 %105, 0
  call void @llvm.assume(i1 %106)
  %107 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %108 = icmp eq i64 %107, 0
  call void @llvm.assume(i1 %108)
  %109 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %110 = icmp ult i64 %109, 128
  call void @llvm.assume(i1 %110)
  %111 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %112 = inttoptr i32 %111 to ptr addrspace(3)
  %113 = getelementptr inbounds i8, ptr addrspace(3) %112, i32 1536
  %114 = getelementptr inbounds i8, ptr addrspace(3) %112, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

115:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i, %.lr.ph774.i
  %116 = phi i64 [ %83, %.lr.ph774.i ], [ %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i ]
  %117 = lshr i64 %116, 5
  %118 = icmp slt i64 %117, %86
  %119 = and i1 %118, %93
  br i1 %119, label %120, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i

120:                                              ; preds = %115
  %121 = and i64 %116, 9223372036854775776
  %122 = or disjoint i64 %121, %88
  %123 = or disjoint i64 %122, %92
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %123
  %.sroa.0290.0.copyload.i = load i16, ptr %124, align 2, !tbaa.struct !27
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i.i: ; preds = %120, %115
  %.sroa.0292.1.i = phi i16 [ %.sroa.0290.0.copyload.i, %120 ], [ 0, %115 ]
  %125 = trunc i64 %116 to i32
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %91, i32 %125
  store i16 %.sroa.0292.1.i, ptr addrspace(3) %126, align 2, !tbaa.struct !27
  %127 = add nuw nsw i64 %116, 128
  %128 = icmp ult i64 %116, 384
  br i1 %128, label %115, label %.lr.ph777.i, !llvm.loop !35

.lr.ph780.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %130 = icmp eq i64 %129, 0
  call void @llvm.assume(i1 %130)
  %131 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %132 = icmp eq i64 %131, 0
  call void @llvm.assume(i1 %132)
  %133 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %134 = icmp ult i64 %133, 128
  call void @llvm.assume(i1 %134)
  %135 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %136 = inttoptr i32 %135 to ptr addrspace(3)
  %137 = getelementptr inbounds i8, ptr addrspace(3) %136, i32 1024
  %138 = getelementptr inbounds i8, ptr addrspace(3) %136, i32 2560
  %139 = and i64 %133, 15
  %140 = trunc i64 %133 to i32
  %141 = getelementptr inbounds float, ptr addrspace(3) %136, i32 %140
  %142 = load float, ptr addrspace(3) %141, align 4, !tbaa !23
  %143 = shl nuw nsw i64 %133, 1
  %144 = and i64 %143, 224
  br label %160

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph777.i
  %145 = phi i64 [ %109, %.lr.ph777.i ], [ %154, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %146 = lshr i64 %145, 4
  %147 = shl nuw nsw i64 %145, 5
  %148 = and i64 %147, 480
  %149 = or disjoint i64 %148, %146
  %150 = trunc i64 %149 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %113, i32 %150
  %.sroa.0418.0.copyload.i = load i16, ptr addrspace(3) %151, align 2, !tbaa.struct !27
  %152 = trunc i64 %145 to i32
  %153 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %114, i32 %152
  store i16 %.sroa.0418.0.copyload.i, ptr addrspace(3) %153, align 2, !tbaa.struct !27
  %154 = add nuw nsw i64 %145, 128
  %155 = icmp ult i64 %145, 384
  br i1 %155, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %.lr.ph780.i, !llvm.loop !36

._crit_edge781.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  store float %361, ptr addrspace(3) %141, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %157 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %158 = icmp ult i64 %157, 128
  call void @llvm.assume(i1 %158)
  %159 = icmp eq i64 %157, 0
  br i1 %159, label %364, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

160:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph780.i
  %161 = phi i64 [ 0, %.lr.ph780.i ], [ %362, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %162 = phi float [ %142, %.lr.ph780.i ], [ %361, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %163 = add nuw nsw i64 %161, %144
  %164 = trunc i64 %163 to i32
  %165 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %137, i32 %164
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %165, align 2, !tbaa.struct !27
  %166 = shl nuw nsw i64 %161, 4
  %167 = or disjoint i64 %166, %139
  %168 = trunc i64 %167 to i32
  %169 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %168
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %169, align 2, !tbaa.struct !27
  %170 = zext i16 %.sroa.0243.0.copyload.i to i32
  %171 = lshr i32 %170, 10
  %172 = and i32 %171, 31
  %173 = and i32 %170, 1023
  switch i32 %172, label %179 [
    i32 31, label %174
    i32 0, label %181
  ]

174:                                              ; preds = %160
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %175 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not756.i = icmp eq i32 %173, 0
  %176 = select i1 %.not756.i, i32 2139095040, i32 2143289344
  %177 = or disjoint i32 %176, %175
  %178 = bitcast i32 %177 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i

179:                                              ; preds = %160
  %180 = or disjoint i32 %173, 1024
  br label %181

181:                                              ; preds = %179, %160
  %182 = phi i32 [ %180, %179 ], [ %173, %160 ]
  %183 = uitofp i32 %182 to float
  %.not.i = icmp eq i32 %172, 0
  %184 = add nsw i32 %172, -25
  %185 = select i1 %.not.i, i32 -24, i32 %184
  %186 = call float @__ocml_ldexp_f32(float noundef %183, i32 noundef %185) #5
  %187 = fneg contract float %186
  %.not726727.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %188 = select contract i1 %.not726727.i, float %187, float %186
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i: ; preds = %181, %174
  %189 = phi float [ %178, %174 ], [ %188, %181 ]
  %190 = zext i16 %.sroa.0234.0.copyload.i to i32
  %191 = lshr i32 %190, 10
  %192 = and i32 %191, 31
  %193 = and i32 %190, 1023
  switch i32 %192, label %199 [
    i32 31, label %194
    i32 0, label %201
  ]

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %195 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not755.i = icmp eq i32 %193, 0
  %196 = select i1 %.not755.i, i32 2139095040, i32 2143289344
  %197 = or disjoint i32 %196, %195
  %198 = bitcast i32 %197 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i

199:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i
  %200 = or disjoint i32 %193, 1024
  br label %201

201:                                              ; preds = %199, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i
  %202 = phi i32 [ %200, %199 ], [ %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i.i ]
  %203 = uitofp i32 %202 to float
  %.not728.i = icmp eq i32 %192, 0
  %204 = add nsw i32 %192, -25
  %205 = select i1 %.not728.i, i32 -24, i32 %204
  %206 = call float @__ocml_ldexp_f32(float noundef %203, i32 noundef %205) #5
  %207 = fneg contract float %206
  %.not729730.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %208 = select contract i1 %.not729730.i, float %207, float %206
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i: ; preds = %201, %194
  %209 = phi float [ %198, %194 ], [ %208, %201 ]
  %210 = fmul contract float %189, %209
  %211 = fadd contract float %162, %210
  %212 = or disjoint i64 %161, 1
  %213 = add nuw nsw i64 %212, %144
  %214 = trunc i64 %213 to i32
  %215 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %137, i32 %214
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %215, align 2, !tbaa.struct !27
  %216 = shl nuw nsw i64 %212, 4
  %217 = or disjoint i64 %216, %139
  %218 = trunc i64 %217 to i32
  %219 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %218
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %219, align 2, !tbaa.struct !27
  %220 = zext i16 %.sroa.0225.0.copyload.i to i32
  %221 = lshr i32 %220, 10
  %222 = and i32 %221, 31
  %223 = and i32 %220, 1023
  switch i32 %222, label %229 [
    i32 31, label %224
    i32 0, label %231
  ]

224:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %225 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not754.i = icmp eq i32 %223, 0
  %226 = select i1 %.not754.i, i32 2139095040, i32 2143289344
  %227 = or disjoint i32 %226, %225
  %228 = bitcast i32 %227 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

229:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i
  %230 = or disjoint i32 %223, 1024
  br label %231

231:                                              ; preds = %229, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i
  %232 = phi i32 [ %230, %229 ], [ %223, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i.i ]
  %233 = uitofp i32 %232 to float
  %.not731.i = icmp eq i32 %222, 0
  %234 = add nsw i32 %222, -25
  %235 = select i1 %.not731.i, i32 -24, i32 %234
  %236 = call float @__ocml_ldexp_f32(float noundef %233, i32 noundef %235) #5
  %237 = fneg contract float %236
  %.not732733.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %238 = select contract i1 %.not732733.i, float %237, float %236
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i: ; preds = %231, %224
  %239 = phi float [ %228, %224 ], [ %238, %231 ]
  %240 = zext i16 %.sroa.0216.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %245 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not753.i = icmp eq i32 %243, 0
  %246 = select i1 %.not753.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not734.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not734.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #5
  %257 = fneg contract float %256
  %.not735736.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %258 = select contract i1 %.not735736.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = fmul contract float %239, %259
  %261 = fadd contract float %211, %260
  %262 = or disjoint i64 %161, 2
  %263 = add nuw nsw i64 %262, %144
  %264 = trunc i64 %263 to i32
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %137, i32 %264
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %265, align 2, !tbaa.struct !27
  %266 = shl nuw nsw i64 %262, 4
  %267 = or disjoint i64 %266, %139
  %268 = trunc i64 %267 to i32
  %269 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %268
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %269, align 2, !tbaa.struct !27
  %270 = zext i16 %.sroa.0207.0.copyload.i to i32
  %271 = lshr i32 %270, 10
  %272 = and i32 %271, 31
  %273 = and i32 %270, 1023
  switch i32 %272, label %279 [
    i32 31, label %274
    i32 0, label %281
  ]

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %275 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not752.i = icmp eq i32 %273, 0
  %276 = select i1 %.not752.i, i32 2139095040, i32 2143289344
  %277 = or disjoint i32 %276, %275
  %278 = bitcast i32 %277 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %280 = or disjoint i32 %273, 1024
  br label %281

281:                                              ; preds = %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i
  %282 = phi i32 [ %280, %279 ], [ %273, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i.i ]
  %283 = uitofp i32 %282 to float
  %.not737.i = icmp eq i32 %272, 0
  %284 = add nsw i32 %272, -25
  %285 = select i1 %.not737.i, i32 -24, i32 %284
  %286 = call float @__ocml_ldexp_f32(float noundef %283, i32 noundef %285) #5
  %287 = fneg contract float %286
  %.not738739.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %288 = select contract i1 %.not738739.i, float %287, float %286
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i: ; preds = %281, %274
  %289 = phi float [ %278, %274 ], [ %288, %281 ]
  %290 = zext i16 %.sroa.0198.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %295 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not751.i = icmp eq i32 %293, 0
  %296 = select i1 %.not751.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not740.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not740.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #5
  %307 = fneg contract float %306
  %.not741742.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %308 = select contract i1 %.not741742.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = fmul contract float %289, %309
  %311 = fadd contract float %261, %310
  %312 = or disjoint i64 %161, 3
  %313 = add nuw nsw i64 %312, %144
  %314 = trunc i64 %313 to i32
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %137, i32 %314
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %315, align 2, !tbaa.struct !27
  %316 = shl nuw nsw i64 %312, 4
  %317 = or disjoint i64 %316, %139
  %318 = trunc i64 %317 to i32
  %319 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %318
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %319, align 2, !tbaa.struct !27
  %320 = zext i16 %.sroa.0189.0.copyload.i to i32
  %321 = lshr i32 %320, 10
  %322 = and i32 %321, 31
  %323 = and i32 %320, 1023
  switch i32 %322, label %329 [
    i32 31, label %324
    i32 0, label %331
  ]

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %325 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not750.i = icmp eq i32 %323, 0
  %326 = select i1 %.not750.i, i32 2139095040, i32 2143289344
  %327 = or disjoint i32 %326, %325
  %328 = bitcast i32 %327 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

329:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %330 = or disjoint i32 %323, 1024
  br label %331

331:                                              ; preds = %329, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i
  %332 = phi i32 [ %330, %329 ], [ %323, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i.i ]
  %333 = uitofp i32 %332 to float
  %.not743.i = icmp eq i32 %322, 0
  %334 = add nsw i32 %322, -25
  %335 = select i1 %.not743.i, i32 -24, i32 %334
  %336 = call float @__ocml_ldexp_f32(float noundef %333, i32 noundef %335) #5
  %337 = fneg contract float %336
  %.not744745.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %338 = select contract i1 %.not744745.i, float %337, float %336
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i: ; preds = %331, %324
  %339 = phi float [ %328, %324 ], [ %338, %331 ]
  %340 = zext i16 %.sroa.0180.0.copyload.i to i32
  %341 = lshr i32 %340, 10
  %342 = and i32 %341, 31
  %343 = and i32 %340, 1023
  switch i32 %342, label %349 [
    i32 31, label %344
    i32 0, label %351
  ]

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %345 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not749.i = icmp eq i32 %343, 0
  %346 = select i1 %.not749.i, i32 2139095040, i32 2143289344
  %347 = or disjoint i32 %346, %345
  %348 = bitcast i32 %347 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

349:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %350 = or disjoint i32 %343, 1024
  br label %351

351:                                              ; preds = %349, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i
  %352 = phi i32 [ %350, %349 ], [ %343, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i.i ]
  %353 = uitofp i32 %352 to float
  %.not746.i = icmp eq i32 %342, 0
  %354 = add nsw i32 %342, -25
  %355 = select i1 %.not746.i, i32 -24, i32 %354
  %356 = call float @__ocml_ldexp_f32(float noundef %353, i32 noundef %355) #5
  %357 = fneg contract float %356
  %.not747748.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %358 = select contract i1 %.not747748.i, float %357, float %356
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %351, %344
  %359 = phi float [ %348, %344 ], [ %358, %351 ]
  %360 = fmul contract float %339, %359
  %361 = fadd contract float %311, %360
  %362 = add nuw nsw i64 %161, 4
  %363 = icmp ult i64 %161, 28
  br i1 %363, label %160, label %._crit_edge781.i, !llvm.loop !37

364:                                              ; preds = %._crit_edge781.i
  %365 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %366 = icmp eq i64 %365, 0
  call void @llvm.assume(i1 %366)
  %367 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %368 = icmp eq i64 %367, 0
  call void @llvm.assume(i1 %368)
  %369 = sext i32 %3 to i64
  %370 = call i32 @llvm.amdgcn.groupstaticsize()
  %371 = inttoptr i32 %370 to ptr addrspace(3)
  %372 = icmp sgt i32 %4, 0
  %373 = icmp ugt i32 %4, 1
  %374 = icmp ugt i32 %4, 2
  %375 = icmp ugt i32 %4, 3
  %376 = icmp ugt i32 %4, 4
  %377 = icmp ugt i32 %4, 5
  %378 = icmp ugt i32 %4, 6
  %379 = icmp ugt i32 %4, 7
  %380 = icmp ugt i32 %4, 8
  %381 = icmp ugt i32 %4, 9
  %382 = icmp ugt i32 %4, 10
  %383 = icmp ugt i32 %4, 11
  %384 = icmp ugt i32 %4, 12
  %385 = icmp ugt i32 %4, 13
  %386 = icmp ugt i32 %4, 14
  %387 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %364
  %388 = phi i64 [ 0, %364 ], [ %394, %.split.us.i ]
  %389 = icmp slt i64 %388, %369
  %390 = shl i64 %388, 4
  %.tr725.i = trunc i64 %388 to i32
  %391 = shl i32 %.tr725.i, 4
  %392 = sext i32 %391 to i64
  %393 = add nsw i64 %156, %392
  %.fr.i = freeze i1 %389
  %brmerge.not.i = select i1 %.fr.i, i1 %372, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %483, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %394 = add nuw nsw i64 %388, 1
  %exitcond.not.i = icmp eq i64 %394, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !38

.preheader.split.1.i:                             ; preds = %.preheader.i
  %395 = trunc i64 %390 to i32
  %396 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %395
  %397 = load float, ptr addrspace(3) %396, align 4, !tbaa !23
  %398 = getelementptr inbounds float, ptr %9, i64 %393
  store float %397, ptr %398, align 32, !tbaa !23
  br i1 %373, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %399 = trunc i64 %390 to i32
  %400 = or disjoint i32 %399, 1
  %401 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %400
  %402 = load float, ptr addrspace(3) %401, align 4, !tbaa !23
  %403 = or disjoint i64 %393, 1
  %404 = getelementptr inbounds float, ptr %9, i64 %403
  store float %402, ptr %404, align 4, !tbaa !23
  br i1 %374, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %405 = trunc i64 %390 to i32
  %406 = or disjoint i32 %405, 2
  %407 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %406
  %408 = load float, ptr addrspace(3) %407, align 4, !tbaa !23
  %409 = or disjoint i64 %393, 2
  %410 = getelementptr inbounds float, ptr %9, i64 %409
  store float %408, ptr %410, align 8, !tbaa !23
  br i1 %375, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %411 = trunc i64 %390 to i32
  %412 = or disjoint i32 %411, 3
  %413 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %412
  %414 = load float, ptr addrspace(3) %413, align 4, !tbaa !23
  %415 = or disjoint i64 %393, 3
  %416 = getelementptr inbounds float, ptr %9, i64 %415
  store float %414, ptr %416, align 4, !tbaa !23
  br i1 %376, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %417 = trunc i64 %390 to i32
  %418 = or disjoint i32 %417, 4
  %419 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %418
  %420 = load float, ptr addrspace(3) %419, align 4, !tbaa !23
  %421 = or disjoint i64 %393, 4
  %422 = getelementptr inbounds float, ptr %9, i64 %421
  store float %420, ptr %422, align 16, !tbaa !23
  br i1 %377, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %423 = trunc i64 %390 to i32
  %424 = or disjoint i32 %423, 5
  %425 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !23
  %427 = or disjoint i64 %393, 5
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 4, !tbaa !23
  br i1 %378, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %429 = trunc i64 %390 to i32
  %430 = or disjoint i32 %429, 6
  %431 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !23
  %433 = or disjoint i64 %393, 6
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 8, !tbaa !23
  br i1 %379, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %435 = trunc i64 %390 to i32
  %436 = or disjoint i32 %435, 7
  %437 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !23
  %439 = or disjoint i64 %393, 7
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 4, !tbaa !23
  br i1 %380, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %441 = trunc i64 %390 to i32
  %442 = or disjoint i32 %441, 8
  %443 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !23
  %445 = or disjoint i64 %393, 8
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 32, !tbaa !23
  br i1 %381, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %447 = trunc i64 %390 to i32
  %448 = or disjoint i32 %447, 9
  %449 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !23
  %451 = or disjoint i64 %393, 9
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 4, !tbaa !23
  br i1 %382, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %453 = trunc i64 %390 to i32
  %454 = or disjoint i32 %453, 10
  %455 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %454
  %456 = load float, ptr addrspace(3) %455, align 4, !tbaa !23
  %457 = or disjoint i64 %393, 10
  %458 = getelementptr inbounds float, ptr %9, i64 %457
  store float %456, ptr %458, align 8, !tbaa !23
  br i1 %383, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %459 = trunc i64 %390 to i32
  %460 = or disjoint i32 %459, 11
  %461 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %460
  %462 = load float, ptr addrspace(3) %461, align 4, !tbaa !23
  %463 = or disjoint i64 %393, 11
  %464 = getelementptr inbounds float, ptr %9, i64 %463
  store float %462, ptr %464, align 4, !tbaa !23
  br i1 %384, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %465 = trunc i64 %390 to i32
  %466 = or disjoint i32 %465, 12
  %467 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %466
  %468 = load float, ptr addrspace(3) %467, align 4, !tbaa !23
  %469 = or disjoint i64 %393, 12
  %470 = getelementptr inbounds float, ptr %9, i64 %469
  store float %468, ptr %470, align 16, !tbaa !23
  br i1 %385, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %471 = trunc i64 %390 to i32
  %472 = or disjoint i32 %471, 13
  %473 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %472
  %474 = load float, ptr addrspace(3) %473, align 4, !tbaa !23
  %475 = or disjoint i64 %393, 13
  %476 = getelementptr inbounds float, ptr %9, i64 %475
  store float %474, ptr %476, align 4, !tbaa !23
  br i1 %386, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %477 = trunc i64 %390 to i32
  %478 = or disjoint i32 %477, 14
  %479 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %478
  %480 = load float, ptr addrspace(3) %479, align 4, !tbaa !23
  %481 = or disjoint i64 %393, 14
  %482 = getelementptr inbounds float, ptr %9, i64 %481
  store float %480, ptr %482, align 8, !tbaa !23
  br i1 %387, label %483, label %.split.us.i

483:                                              ; preds = %.preheader.split.15.i
  %484 = trunc i64 %390 to i32
  %485 = or disjoint i32 %484, 15
  %486 = getelementptr inbounds float, ptr addrspace(3) %371, i32 %485
  %487 = load float, ptr addrspace(3) %486, align 4, !tbaa !23
  %488 = or disjoint i64 %393, 15
  %489 = getelementptr inbounds float, ptr %9, i64 %488
  store float %487, ptr %489, align 4, !tbaa !23
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge781.i, %.split.us.i
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
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !{i64 0, i64 2, !28}
!28 = !{!29, !29, i64 0}
!29 = !{!"short", !25, i64 0}
!30 = distinct !{!30, !31, !32, !33}
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!"llvm.loop.vectorize.width", i32 1}
!33 = !{!"llvm.loop.interleave.count", i32 1}
!34 = distinct !{!34, !31, !32, !33}
!35 = distinct !{!35, !31, !32, !33}
!36 = distinct !{!36, !31, !32, !33}
!37 = distinct !{!37, !31}
!38 = distinct !{!38, !31}
;----------------- End AdaptiveCpp IR dump ---------------
