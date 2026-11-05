;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-443uk0m4/kernel.cpp"
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
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !14
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 33554432
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
  %33 = icmp ult i64 %32, 64
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

.lr.ph949.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %37 = icmp ult i64 %36, 33554431
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %39 = icmp eq i64 %38, 0
  call void @llvm.assume(i1 %39)
  %40 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %41 = icmp eq i64 %40, 0
  call void @llvm.assume(i1 %41)
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %43 = icmp ult i64 %42, 64
  call void @llvm.assume(i1 %43)
  %44 = shl i32 %.tr.i, 8
  %45 = sext i32 %5 to i64
  %46 = sext i32 %3 to i64
  %47 = sext i32 %44 to i64
  %48 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %49 = inttoptr i32 %48 to ptr addrspace(3)
  %50 = getelementptr inbounds i8, ptr addrspace(3) %49, i32 512
  %51 = and i64 %42, 7
  %52 = icmp slt i64 %51, %46
  br label %68

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i:  ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, %6
  %53 = phi i64 [ %32, %6 ], [ %56, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i ]
  %54 = trunc i64 %53 to i32
  %55 = getelementptr inbounds float, ptr addrspace(3) %35, i32 %54
  store float 0.000000e+00, ptr addrspace(3) %55, align 4, !tbaa !23
  %56 = add nuw nsw i64 %53, 64
  %57 = icmp ult i64 %53, 64
  br i1 %57, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %.lr.ph949.i, !llvm.loop !27

.lr.ph952.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit37.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %59 = icmp eq i64 %58, 0
  call void @llvm.assume(i1 %59)
  %60 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %61 = icmp eq i64 %60, 0
  call void @llvm.assume(i1 %61)
  %62 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %63 = icmp ult i64 %62, 64
  call void @llvm.assume(i1 %63)
  %64 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %65 = inttoptr i32 %64 to ptr addrspace(3)
  %66 = getelementptr inbounds i8, ptr addrspace(3) %65, i32 512
  %67 = getelementptr inbounds i8, ptr addrspace(3) %65, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

68:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit37.i.i.i, %.lr.ph949.i
  %69 = phi i64 [ %42, %.lr.ph949.i ], [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit37.i.i.i ]
  %70 = lshr i64 %69, 3
  %71 = icmp slt i64 %70, %45
  %72 = and i1 %71, %52
  br i1 %72, label %73, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit37.i.i.i

73:                                               ; preds = %68
  %74 = and i64 %69, 9223372036854775800
  %75 = or disjoint i64 %74, %47
  %76 = or disjoint i64 %75, %51
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0379.0.copyload.i = load i16, ptr %77, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit37.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit37.i.i.i: ; preds = %73, %68
  %.sroa.0381.1.i = phi i16 [ %.sroa.0379.0.copyload.i, %73 ], [ 0, %68 ]
  %78 = trunc i64 %69 to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %78
  store i16 %.sroa.0381.1.i, ptr addrspace(3) %79, align 2, !tbaa.struct !29
  %80 = add nuw nsw i64 %69, 64
  %81 = icmp ult i64 %69, 192
  br i1 %81, label %68, label %.lr.ph952.i, !llvm.loop !32

.lr.ph955.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %83 = icmp eq i64 %82, 0
  call void @llvm.assume(i1 %83)
  %84 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %85 = icmp eq i64 %84, 0
  call void @llvm.assume(i1 %85)
  %86 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %87 = icmp ult i64 %86, 64
  call void @llvm.assume(i1 %87)
  %88 = shl i32 %.tr.i, 9
  %89 = sext i32 %4 to i64
  %90 = sext i32 %5 to i64
  %91 = sext i32 %88 to i64
  %92 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %93 = inttoptr i32 %92 to ptr addrspace(3)
  %94 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 1536
  %95 = and i64 %86, 31
  %96 = icmp slt i64 %95, %90
  br label %118

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph952.i
  %97 = phi i64 [ %62, %.lr.ph952.i ], [ %106, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %98 = lshr i64 %97, 5
  %99 = shl nuw nsw i64 %97, 3
  %100 = and i64 %99, 248
  %101 = or disjoint i64 %100, %98
  %102 = trunc i64 %101 to i32
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %66, i32 %102
  %.sroa.0490.0.copyload.i = load i16, ptr addrspace(3) %103, align 2, !tbaa.struct !29
  %104 = trunc i64 %97 to i32
  %105 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %67, i32 %104
  store i16 %.sroa.0490.0.copyload.i, ptr addrspace(3) %105, align 2, !tbaa.struct !29
  %106 = add nuw nsw i64 %97, 64
  %107 = icmp ult i64 %97, 192
  br i1 %107, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %.lr.ph955.i, !llvm.loop !35

.lr.ph958.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %109 = icmp eq i64 %108, 0
  call void @llvm.assume(i1 %109)
  %110 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %111 = icmp eq i64 %110, 0
  call void @llvm.assume(i1 %111)
  %112 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %113 = icmp ult i64 %112, 64
  call void @llvm.assume(i1 %113)
  %114 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %115 = inttoptr i32 %114 to ptr addrspace(3)
  %116 = getelementptr inbounds i8, ptr addrspace(3) %115, i32 1536
  %117 = getelementptr inbounds i8, ptr addrspace(3) %115, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i

118:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph955.i
  %119 = phi i64 [ %86, %.lr.ph955.i ], [ %130, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %120 = lshr i64 %119, 5
  %121 = icmp slt i64 %120, %89
  %122 = and i1 %121, %96
  br i1 %122, label %123, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

123:                                              ; preds = %118
  %124 = and i64 %119, 9223372036854775776
  %125 = or disjoint i64 %124, %91
  %126 = or disjoint i64 %125, %95
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %126
  %.sroa.0338.0.copyload.i = load i16, ptr %127, align 2, !tbaa.struct !29
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %123, %118
  %.sroa.0340.1.i = phi i16 [ %.sroa.0338.0.copyload.i, %123 ], [ 0, %118 ]
  %128 = trunc i64 %119 to i32
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %128
  store i16 %.sroa.0340.1.i, ptr addrspace(3) %129, align 2, !tbaa.struct !29
  %130 = add nuw nsw i64 %119, 64
  %131 = icmp ult i64 %119, 448
  br i1 %131, label %118, label %.lr.ph958.i, !llvm.loop !36

.lr.ph961.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %133 = icmp eq i64 %132, 0
  call void @llvm.assume(i1 %133)
  %134 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %135 = icmp eq i64 %134, 0
  call void @llvm.assume(i1 %135)
  %136 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %137 = icmp ult i64 %136, 64
  call void @llvm.assume(i1 %137)
  %138 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %139 = inttoptr i32 %138 to ptr addrspace(3)
  %140 = getelementptr inbounds i8, ptr addrspace(3) %139, i32 1024
  %141 = getelementptr inbounds i8, ptr addrspace(3) %139, i32 2560
  %142 = and i64 %136, 7
  %143 = lshr i64 %136, 3
  %144 = shl nuw nsw i64 %143, 4
  %145 = or disjoint i64 %144, %142
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds float, ptr addrspace(3) %139, i32 %146
  %148 = load float, ptr addrspace(3) %147, align 4, !tbaa !23
  %149 = or disjoint i64 %142, 8
  %150 = or disjoint i64 %144, %149
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds float, ptr addrspace(3) %139, i32 %151
  %153 = load float, ptr addrspace(3) %152, align 4, !tbaa !23
  %154 = shl nuw nsw i64 %143, 5
  br label %169

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph958.i
  %155 = phi i64 [ %112, %.lr.ph958.i ], [ %164, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %156 = lshr i64 %155, 4
  %157 = shl nuw nsw i64 %155, 5
  %158 = and i64 %157, 480
  %159 = or disjoint i64 %158, %156
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %116, i32 %160
  %.sroa.0491.0.copyload.i = load i16, ptr addrspace(3) %161, align 2, !tbaa.struct !29
  %162 = trunc i64 %155 to i32
  %163 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %117, i32 %162
  store i16 %.sroa.0491.0.copyload.i, ptr addrspace(3) %163, align 2, !tbaa.struct !29
  %164 = add nuw nsw i64 %155, 64
  %165 = icmp ult i64 %155, 448
  br i1 %165, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %.lr.ph961.i, !llvm.loop !37

._crit_edge962.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %446, ptr addrspace(3) %147, align 4, !tbaa !23
  store float %471, ptr addrspace(3) %152, align 4, !tbaa !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %166 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %167 = icmp ult i64 %166, 64
  call void @llvm.assume(i1 %167)
  %168 = icmp eq i64 %166, 0
  br i1 %168, label %474, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

169:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph961.i
  %170 = phi i64 [ 0, %.lr.ph961.i ], [ %472, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %171 = phi float [ %153, %.lr.ph961.i ], [ %471, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %172 = phi float [ %148, %.lr.ph961.i ], [ %446, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %173 = add nuw nsw i64 %170, %154
  %174 = trunc i64 %173 to i32
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %174
  %.sroa.0285.0.copyload.i = load i16, ptr addrspace(3) %175, align 2, !tbaa.struct !29
  %176 = shl nuw nsw i64 %170, 4
  %177 = or disjoint i64 %176, %142
  %178 = trunc i64 %177 to i32
  %179 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %178
  %.sroa.0276.0.copyload.i = load i16, ptr addrspace(3) %179, align 2, !tbaa.struct !29
  %180 = zext i16 %.sroa.0285.0.copyload.i to i32
  %181 = lshr i32 %180, 10
  %182 = and i32 %181, 31
  %183 = and i32 %180, 1023
  switch i32 %182, label %189 [
    i32 31, label %184
    i32 0, label %191
  ]

184:                                              ; preds = %169
  %.sroa.0285.0.copyload.signext.i = sext i16 %.sroa.0285.0.copyload.i to i32
  %185 = and i32 %.sroa.0285.0.copyload.signext.i, -2147483648
  %.not936.i = icmp eq i32 %183, 0
  %186 = select i1 %.not936.i, i32 2139095040, i32 2143289344
  %187 = or disjoint i32 %186, %185
  %188 = bitcast i32 %187 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

189:                                              ; preds = %169
  %190 = or disjoint i32 %183, 1024
  br label %191

191:                                              ; preds = %189, %169
  %192 = phi i32 [ %190, %189 ], [ %183, %169 ]
  %193 = uitofp i32 %192 to float
  %.not.i = icmp eq i32 %182, 0
  %194 = add nsw i32 %182, -25
  %195 = select i1 %.not.i, i32 -24, i32 %194
  %196 = call float @__ocml_ldexp_f32(float noundef %193, i32 noundef %195) #5
  %197 = fneg contract float %196
  %.not890891.i = icmp slt i16 %.sroa.0285.0.copyload.i, 0
  %198 = select contract i1 %.not890891.i, float %197, float %196
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i: ; preds = %191, %184
  %199 = phi float [ %188, %184 ], [ %198, %191 ]
  %200 = zext i16 %.sroa.0276.0.copyload.i to i32
  %201 = lshr i32 %200, 10
  %202 = and i32 %201, 31
  %203 = and i32 %200, 1023
  switch i32 %202, label %209 [
    i32 31, label %204
    i32 0, label %211
  ]

204:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %.sroa.0276.0.copyload.signext.i = sext i16 %.sroa.0276.0.copyload.i to i32
  %205 = and i32 %.sroa.0276.0.copyload.signext.i, -2147483648
  %.not935.i = icmp eq i32 %203, 0
  %206 = select i1 %.not935.i, i32 2139095040, i32 2143289344
  %207 = or disjoint i32 %206, %205
  %208 = bitcast i32 %207 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

209:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %210 = or disjoint i32 %203, 1024
  br label %211

211:                                              ; preds = %209, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %212 = phi i32 [ %210, %209 ], [ %203, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i ]
  %213 = uitofp i32 %212 to float
  %.not892.i = icmp eq i32 %202, 0
  %214 = add nsw i32 %202, -25
  %215 = select i1 %.not892.i, i32 -24, i32 %214
  %216 = call float @__ocml_ldexp_f32(float noundef %213, i32 noundef %215) #5
  %217 = fneg contract float %216
  %.not893894.i = icmp slt i16 %.sroa.0276.0.copyload.i, 0
  %218 = select contract i1 %.not893894.i, float %217, float %216
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i: ; preds = %211, %204
  %219 = phi float [ %208, %204 ], [ %218, %211 ]
  %220 = fmul contract float %199, %219
  %221 = fadd contract float %172, %220
  %222 = or disjoint i64 %176, %149
  %223 = trunc i64 %222 to i32
  %224 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %223
  %.sroa.0267.0.copyload.i = load i16, ptr addrspace(3) %224, align 2, !tbaa.struct !29
  %225 = zext i16 %.sroa.0267.0.copyload.i to i32
  %226 = lshr i32 %225, 10
  %227 = and i32 %226, 31
  %228 = and i32 %225, 1023
  switch i32 %227, label %234 [
    i32 31, label %229
    i32 0, label %236
  ]

229:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %.sroa.0267.0.copyload.signext.i = sext i16 %.sroa.0267.0.copyload.i to i32
  %230 = and i32 %.sroa.0267.0.copyload.signext.i, -2147483648
  %.not934.i = icmp eq i32 %228, 0
  %231 = select i1 %.not934.i, i32 2139095040, i32 2143289344
  %232 = or disjoint i32 %231, %230
  %233 = bitcast i32 %232 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

234:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %235 = or disjoint i32 %228, 1024
  br label %236

236:                                              ; preds = %234, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %237 = phi i32 [ %235, %234 ], [ %228, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i ]
  %238 = uitofp i32 %237 to float
  %.not895.i = icmp eq i32 %227, 0
  %239 = add nsw i32 %227, -25
  %240 = select i1 %.not895.i, i32 -24, i32 %239
  %241 = call float @__ocml_ldexp_f32(float noundef %238, i32 noundef %240) #5
  %242 = fneg contract float %241
  %.not896897.i = icmp slt i16 %.sroa.0267.0.copyload.i, 0
  %243 = select contract i1 %.not896897.i, float %242, float %241
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i: ; preds = %236, %229
  %244 = phi float [ %233, %229 ], [ %243, %236 ]
  %245 = fmul contract float %199, %244
  %246 = fadd contract float %171, %245
  %247 = or disjoint i64 %170, 1
  %248 = add nuw nsw i64 %247, %154
  %249 = trunc i64 %248 to i32
  %250 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %249
  %.sroa.0258.0.copyload.i = load i16, ptr addrspace(3) %250, align 2, !tbaa.struct !29
  %251 = shl nuw nsw i64 %247, 4
  %252 = or disjoint i64 %251, %142
  %253 = trunc i64 %252 to i32
  %254 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %253
  %.sroa.0249.0.copyload.i = load i16, ptr addrspace(3) %254, align 2, !tbaa.struct !29
  %255 = zext i16 %.sroa.0258.0.copyload.i to i32
  %256 = lshr i32 %255, 10
  %257 = and i32 %256, 31
  %258 = and i32 %255, 1023
  switch i32 %257, label %264 [
    i32 31, label %259
    i32 0, label %266
  ]

259:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %.sroa.0258.0.copyload.signext.i = sext i16 %.sroa.0258.0.copyload.i to i32
  %260 = and i32 %.sroa.0258.0.copyload.signext.i, -2147483648
  %.not933.i = icmp eq i32 %258, 0
  %261 = select i1 %.not933.i, i32 2139095040, i32 2143289344
  %262 = or disjoint i32 %261, %260
  %263 = bitcast i32 %262 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %265 = or disjoint i32 %258, 1024
  br label %266

266:                                              ; preds = %264, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %267 = phi i32 [ %265, %264 ], [ %258, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i ]
  %268 = uitofp i32 %267 to float
  %.not898.i = icmp eq i32 %257, 0
  %269 = add nsw i32 %257, -25
  %270 = select i1 %.not898.i, i32 -24, i32 %269
  %271 = call float @__ocml_ldexp_f32(float noundef %268, i32 noundef %270) #5
  %272 = fneg contract float %271
  %.not899900.i = icmp slt i16 %.sroa.0258.0.copyload.i, 0
  %273 = select contract i1 %.not899900.i, float %272, float %271
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i: ; preds = %266, %259
  %274 = phi float [ %263, %259 ], [ %273, %266 ]
  %275 = zext i16 %.sroa.0249.0.copyload.i to i32
  %276 = lshr i32 %275, 10
  %277 = and i32 %276, 31
  %278 = and i32 %275, 1023
  switch i32 %277, label %284 [
    i32 31, label %279
    i32 0, label %286
  ]

279:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %.sroa.0249.0.copyload.signext.i = sext i16 %.sroa.0249.0.copyload.i to i32
  %280 = and i32 %.sroa.0249.0.copyload.signext.i, -2147483648
  %.not932.i = icmp eq i32 %278, 0
  %281 = select i1 %.not932.i, i32 2139095040, i32 2143289344
  %282 = or disjoint i32 %281, %280
  %283 = bitcast i32 %282 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

284:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %285 = or disjoint i32 %278, 1024
  br label %286

286:                                              ; preds = %284, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %287 = phi i32 [ %285, %284 ], [ %278, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i ]
  %288 = uitofp i32 %287 to float
  %.not901.i = icmp eq i32 %277, 0
  %289 = add nsw i32 %277, -25
  %290 = select i1 %.not901.i, i32 -24, i32 %289
  %291 = call float @__ocml_ldexp_f32(float noundef %288, i32 noundef %290) #5
  %292 = fneg contract float %291
  %.not902903.i = icmp slt i16 %.sroa.0249.0.copyload.i, 0
  %293 = select contract i1 %.not902903.i, float %292, float %291
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %286, %279
  %294 = phi float [ %283, %279 ], [ %293, %286 ]
  %295 = fmul contract float %274, %294
  %296 = fadd contract float %221, %295
  %297 = or disjoint i64 %251, %149
  %298 = trunc i64 %297 to i32
  %299 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %298
  %.sroa.0240.0.copyload.i = load i16, ptr addrspace(3) %299, align 2, !tbaa.struct !29
  %300 = zext i16 %.sroa.0240.0.copyload.i to i32
  %301 = lshr i32 %300, 10
  %302 = and i32 %301, 31
  %303 = and i32 %300, 1023
  switch i32 %302, label %309 [
    i32 31, label %304
    i32 0, label %311
  ]

304:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0240.0.copyload.signext.i = sext i16 %.sroa.0240.0.copyload.i to i32
  %305 = and i32 %.sroa.0240.0.copyload.signext.i, -2147483648
  %.not931.i = icmp eq i32 %303, 0
  %306 = select i1 %.not931.i, i32 2139095040, i32 2143289344
  %307 = or disjoint i32 %306, %305
  %308 = bitcast i32 %307 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

309:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %310 = or disjoint i32 %303, 1024
  br label %311

311:                                              ; preds = %309, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %312 = phi i32 [ %310, %309 ], [ %303, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %313 = uitofp i32 %312 to float
  %.not904.i = icmp eq i32 %302, 0
  %314 = add nsw i32 %302, -25
  %315 = select i1 %.not904.i, i32 -24, i32 %314
  %316 = call float @__ocml_ldexp_f32(float noundef %313, i32 noundef %315) #5
  %317 = fneg contract float %316
  %.not905906.i = icmp slt i16 %.sroa.0240.0.copyload.i, 0
  %318 = select contract i1 %.not905906.i, float %317, float %316
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %311, %304
  %319 = phi float [ %308, %304 ], [ %318, %311 ]
  %320 = fmul contract float %274, %319
  %321 = fadd contract float %246, %320
  %322 = or disjoint i64 %170, 2
  %323 = add nuw nsw i64 %322, %154
  %324 = trunc i64 %323 to i32
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %324
  %.sroa.0231.0.copyload.i = load i16, ptr addrspace(3) %325, align 2, !tbaa.struct !29
  %326 = shl nuw nsw i64 %322, 4
  %327 = or disjoint i64 %326, %142
  %328 = trunc i64 %327 to i32
  %329 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %328
  %.sroa.0222.0.copyload.i = load i16, ptr addrspace(3) %329, align 2, !tbaa.struct !29
  %330 = zext i16 %.sroa.0231.0.copyload.i to i32
  %331 = lshr i32 %330, 10
  %332 = and i32 %331, 31
  %333 = and i32 %330, 1023
  switch i32 %332, label %339 [
    i32 31, label %334
    i32 0, label %341
  ]

334:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0231.0.copyload.signext.i = sext i16 %.sroa.0231.0.copyload.i to i32
  %335 = and i32 %.sroa.0231.0.copyload.signext.i, -2147483648
  %.not930.i = icmp eq i32 %333, 0
  %336 = select i1 %.not930.i, i32 2139095040, i32 2143289344
  %337 = or disjoint i32 %336, %335
  %338 = bitcast i32 %337 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

339:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %340 = or disjoint i32 %333, 1024
  br label %341

341:                                              ; preds = %339, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %342 = phi i32 [ %340, %339 ], [ %333, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %343 = uitofp i32 %342 to float
  %.not907.i = icmp eq i32 %332, 0
  %344 = add nsw i32 %332, -25
  %345 = select i1 %.not907.i, i32 -24, i32 %344
  %346 = call float @__ocml_ldexp_f32(float noundef %343, i32 noundef %345) #5
  %347 = fneg contract float %346
  %.not908909.i = icmp slt i16 %.sroa.0231.0.copyload.i, 0
  %348 = select contract i1 %.not908909.i, float %347, float %346
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %341, %334
  %349 = phi float [ %338, %334 ], [ %348, %341 ]
  %350 = zext i16 %.sroa.0222.0.copyload.i to i32
  %351 = lshr i32 %350, 10
  %352 = and i32 %351, 31
  %353 = and i32 %350, 1023
  switch i32 %352, label %359 [
    i32 31, label %354
    i32 0, label %361
  ]

354:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0222.0.copyload.signext.i = sext i16 %.sroa.0222.0.copyload.i to i32
  %355 = and i32 %.sroa.0222.0.copyload.signext.i, -2147483648
  %.not929.i = icmp eq i32 %353, 0
  %356 = select i1 %.not929.i, i32 2139095040, i32 2143289344
  %357 = or disjoint i32 %356, %355
  %358 = bitcast i32 %357 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

359:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %360 = or disjoint i32 %353, 1024
  br label %361

361:                                              ; preds = %359, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %362 = phi i32 [ %360, %359 ], [ %353, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %363 = uitofp i32 %362 to float
  %.not910.i = icmp eq i32 %352, 0
  %364 = add nsw i32 %352, -25
  %365 = select i1 %.not910.i, i32 -24, i32 %364
  %366 = call float @__ocml_ldexp_f32(float noundef %363, i32 noundef %365) #5
  %367 = fneg contract float %366
  %.not911912.i = icmp slt i16 %.sroa.0222.0.copyload.i, 0
  %368 = select contract i1 %.not911912.i, float %367, float %366
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %361, %354
  %369 = phi float [ %358, %354 ], [ %368, %361 ]
  %370 = fmul contract float %349, %369
  %371 = fadd contract float %296, %370
  %372 = or disjoint i64 %326, %149
  %373 = trunc i64 %372 to i32
  %374 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %373
  %.sroa.0213.0.copyload.i = load i16, ptr addrspace(3) %374, align 2, !tbaa.struct !29
  %375 = zext i16 %.sroa.0213.0.copyload.i to i32
  %376 = lshr i32 %375, 10
  %377 = and i32 %376, 31
  %378 = and i32 %375, 1023
  switch i32 %377, label %384 [
    i32 31, label %379
    i32 0, label %386
  ]

379:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0213.0.copyload.signext.i = sext i16 %.sroa.0213.0.copyload.i to i32
  %380 = and i32 %.sroa.0213.0.copyload.signext.i, -2147483648
  %.not928.i = icmp eq i32 %378, 0
  %381 = select i1 %.not928.i, i32 2139095040, i32 2143289344
  %382 = or disjoint i32 %381, %380
  %383 = bitcast i32 %382 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

384:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %385 = or disjoint i32 %378, 1024
  br label %386

386:                                              ; preds = %384, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %387 = phi i32 [ %385, %384 ], [ %378, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %388 = uitofp i32 %387 to float
  %.not913.i = icmp eq i32 %377, 0
  %389 = add nsw i32 %377, -25
  %390 = select i1 %.not913.i, i32 -24, i32 %389
  %391 = call float @__ocml_ldexp_f32(float noundef %388, i32 noundef %390) #5
  %392 = fneg contract float %391
  %.not914915.i = icmp slt i16 %.sroa.0213.0.copyload.i, 0
  %393 = select contract i1 %.not914915.i, float %392, float %391
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %386, %379
  %394 = phi float [ %383, %379 ], [ %393, %386 ]
  %395 = fmul contract float %349, %394
  %396 = fadd contract float %321, %395
  %397 = or disjoint i64 %170, 3
  %398 = add nuw nsw i64 %397, %154
  %399 = trunc i64 %398 to i32
  %400 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %399
  %.sroa.0204.0.copyload.i = load i16, ptr addrspace(3) %400, align 2, !tbaa.struct !29
  %401 = shl nuw nsw i64 %397, 4
  %402 = or disjoint i64 %401, %142
  %403 = trunc i64 %402 to i32
  %404 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %403
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %404, align 2, !tbaa.struct !29
  %405 = zext i16 %.sroa.0204.0.copyload.i to i32
  %406 = lshr i32 %405, 10
  %407 = and i32 %406, 31
  %408 = and i32 %405, 1023
  switch i32 %407, label %414 [
    i32 31, label %409
    i32 0, label %416
  ]

409:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0204.0.copyload.signext.i = sext i16 %.sroa.0204.0.copyload.i to i32
  %410 = and i32 %.sroa.0204.0.copyload.signext.i, -2147483648
  %.not927.i = icmp eq i32 %408, 0
  %411 = select i1 %.not927.i, i32 2139095040, i32 2143289344
  %412 = or disjoint i32 %411, %410
  %413 = bitcast i32 %412 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

414:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %415 = or disjoint i32 %408, 1024
  br label %416

416:                                              ; preds = %414, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %417 = phi i32 [ %415, %414 ], [ %408, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %418 = uitofp i32 %417 to float
  %.not916.i = icmp eq i32 %407, 0
  %419 = add nsw i32 %407, -25
  %420 = select i1 %.not916.i, i32 -24, i32 %419
  %421 = call float @__ocml_ldexp_f32(float noundef %418, i32 noundef %420) #5
  %422 = fneg contract float %421
  %.not917918.i = icmp slt i16 %.sroa.0204.0.copyload.i, 0
  %423 = select contract i1 %.not917918.i, float %422, float %421
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %416, %409
  %424 = phi float [ %413, %409 ], [ %423, %416 ]
  %425 = zext i16 %.sroa.0195.0.copyload.i to i32
  %426 = lshr i32 %425, 10
  %427 = and i32 %426, 31
  %428 = and i32 %425, 1023
  switch i32 %427, label %434 [
    i32 31, label %429
    i32 0, label %436
  ]

429:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %430 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not926.i = icmp eq i32 %428, 0
  %431 = select i1 %.not926.i, i32 2139095040, i32 2143289344
  %432 = or disjoint i32 %431, %430
  %433 = bitcast i32 %432 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

434:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %435 = or disjoint i32 %428, 1024
  br label %436

436:                                              ; preds = %434, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %437 = phi i32 [ %435, %434 ], [ %428, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %438 = uitofp i32 %437 to float
  %.not919.i = icmp eq i32 %427, 0
  %439 = add nsw i32 %427, -25
  %440 = select i1 %.not919.i, i32 -24, i32 %439
  %441 = call float @__ocml_ldexp_f32(float noundef %438, i32 noundef %440) #5
  %442 = fneg contract float %441
  %.not920921.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %443 = select contract i1 %.not920921.i, float %442, float %441
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %436, %429
  %444 = phi float [ %433, %429 ], [ %443, %436 ]
  %445 = fmul contract float %424, %444
  %446 = fadd contract float %371, %445
  %447 = or disjoint i64 %401, %149
  %448 = trunc i64 %447 to i32
  %449 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %448
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %449, align 2, !tbaa.struct !29
  %450 = zext i16 %.sroa.0186.0.copyload.i to i32
  %451 = lshr i32 %450, 10
  %452 = and i32 %451, 31
  %453 = and i32 %450, 1023
  switch i32 %452, label %459 [
    i32 31, label %454
    i32 0, label %461
  ]

454:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %455 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not925.i = icmp eq i32 %453, 0
  %456 = select i1 %.not925.i, i32 2139095040, i32 2143289344
  %457 = or disjoint i32 %456, %455
  %458 = bitcast i32 %457 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

459:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %460 = or disjoint i32 %453, 1024
  br label %461

461:                                              ; preds = %459, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %462 = phi i32 [ %460, %459 ], [ %453, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %463 = uitofp i32 %462 to float
  %.not922.i = icmp eq i32 %452, 0
  %464 = add nsw i32 %452, -25
  %465 = select i1 %.not922.i, i32 -24, i32 %464
  %466 = call float @__ocml_ldexp_f32(float noundef %463, i32 noundef %465) #5
  %467 = fneg contract float %466
  %.not923924.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %468 = select contract i1 %.not923924.i, float %467, float %466
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %461, %454
  %469 = phi float [ %458, %454 ], [ %468, %461 ]
  %470 = fmul contract float %424, %469
  %471 = fadd contract float %396, %470
  %472 = add nuw nsw i64 %170, 4
  %473 = icmp ult i64 %170, 28
  br i1 %473, label %169, label %._crit_edge962.i, !llvm.loop !38

474:                                              ; preds = %._crit_edge962.i
  %475 = shl nuw i32 %.tr.i, 7
  %476 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %477 = icmp eq i64 %476, 0
  call void @llvm.assume(i1 %477)
  %478 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %479 = icmp eq i64 %478, 0
  call void @llvm.assume(i1 %479)
  %480 = sext i32 %3 to i64
  %481 = call i32 @llvm.amdgcn.groupstaticsize()
  %482 = inttoptr i32 %481 to ptr addrspace(3)
  %483 = sext i32 %475 to i64
  %484 = icmp sgt i32 %4, 0
  %485 = icmp ugt i32 %4, 1
  %486 = icmp ugt i32 %4, 2
  %487 = icmp ugt i32 %4, 3
  %488 = icmp ugt i32 %4, 4
  %489 = icmp ugt i32 %4, 5
  %490 = icmp ugt i32 %4, 6
  %491 = icmp ugt i32 %4, 7
  %492 = icmp ugt i32 %4, 8
  %493 = icmp ugt i32 %4, 9
  %494 = icmp ugt i32 %4, 10
  %495 = icmp ugt i32 %4, 11
  %496 = icmp ugt i32 %4, 12
  %497 = icmp ugt i32 %4, 13
  %498 = icmp ugt i32 %4, 14
  %499 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %474
  %500 = phi i64 [ 0, %474 ], [ %506, %.split.us.i ]
  %501 = icmp slt i64 %500, %480
  %502 = shl i64 %500, 4
  %.tr889.i = trunc i64 %500 to i32
  %503 = shl i32 %.tr889.i, 4
  %504 = sext i32 %503 to i64
  %505 = add nsw i64 %504, %483
  %.fr.i = freeze i1 %501
  %brmerge.not.i = select i1 %.fr.i, i1 %484, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %595, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %506 = add nuw nsw i64 %500, 1
  %exitcond.not.i = icmp eq i64 %506, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !39

.preheader.split.1.i:                             ; preds = %.preheader.i
  %507 = trunc i64 %502 to i32
  %508 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %507
  %509 = load float, ptr addrspace(3) %508, align 4, !tbaa !23
  %510 = getelementptr inbounds float, ptr %9, i64 %505
  store float %509, ptr %510, align 32, !tbaa !23
  br i1 %485, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %511 = trunc i64 %502 to i32
  %512 = or disjoint i32 %511, 1
  %513 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %512
  %514 = load float, ptr addrspace(3) %513, align 4, !tbaa !23
  %515 = or disjoint i64 %505, 1
  %516 = getelementptr inbounds float, ptr %9, i64 %515
  store float %514, ptr %516, align 4, !tbaa !23
  br i1 %486, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %517 = trunc i64 %502 to i32
  %518 = or disjoint i32 %517, 2
  %519 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %518
  %520 = load float, ptr addrspace(3) %519, align 4, !tbaa !23
  %521 = or disjoint i64 %505, 2
  %522 = getelementptr inbounds float, ptr %9, i64 %521
  store float %520, ptr %522, align 8, !tbaa !23
  br i1 %487, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %523 = trunc i64 %502 to i32
  %524 = or disjoint i32 %523, 3
  %525 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %524
  %526 = load float, ptr addrspace(3) %525, align 4, !tbaa !23
  %527 = or disjoint i64 %505, 3
  %528 = getelementptr inbounds float, ptr %9, i64 %527
  store float %526, ptr %528, align 4, !tbaa !23
  br i1 %488, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %529 = trunc i64 %502 to i32
  %530 = or disjoint i32 %529, 4
  %531 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %530
  %532 = load float, ptr addrspace(3) %531, align 4, !tbaa !23
  %533 = or disjoint i64 %505, 4
  %534 = getelementptr inbounds float, ptr %9, i64 %533
  store float %532, ptr %534, align 16, !tbaa !23
  br i1 %489, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %535 = trunc i64 %502 to i32
  %536 = or disjoint i32 %535, 5
  %537 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %536
  %538 = load float, ptr addrspace(3) %537, align 4, !tbaa !23
  %539 = or disjoint i64 %505, 5
  %540 = getelementptr inbounds float, ptr %9, i64 %539
  store float %538, ptr %540, align 4, !tbaa !23
  br i1 %490, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %541 = trunc i64 %502 to i32
  %542 = or disjoint i32 %541, 6
  %543 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %542
  %544 = load float, ptr addrspace(3) %543, align 4, !tbaa !23
  %545 = or disjoint i64 %505, 6
  %546 = getelementptr inbounds float, ptr %9, i64 %545
  store float %544, ptr %546, align 8, !tbaa !23
  br i1 %491, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %547 = trunc i64 %502 to i32
  %548 = or disjoint i32 %547, 7
  %549 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %548
  %550 = load float, ptr addrspace(3) %549, align 4, !tbaa !23
  %551 = or disjoint i64 %505, 7
  %552 = getelementptr inbounds float, ptr %9, i64 %551
  store float %550, ptr %552, align 4, !tbaa !23
  br i1 %492, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %553 = trunc i64 %502 to i32
  %554 = or disjoint i32 %553, 8
  %555 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %554
  %556 = load float, ptr addrspace(3) %555, align 4, !tbaa !23
  %557 = or disjoint i64 %505, 8
  %558 = getelementptr inbounds float, ptr %9, i64 %557
  store float %556, ptr %558, align 32, !tbaa !23
  br i1 %493, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %559 = trunc i64 %502 to i32
  %560 = or disjoint i32 %559, 9
  %561 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %560
  %562 = load float, ptr addrspace(3) %561, align 4, !tbaa !23
  %563 = or disjoint i64 %505, 9
  %564 = getelementptr inbounds float, ptr %9, i64 %563
  store float %562, ptr %564, align 4, !tbaa !23
  br i1 %494, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %565 = trunc i64 %502 to i32
  %566 = or disjoint i32 %565, 10
  %567 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %566
  %568 = load float, ptr addrspace(3) %567, align 4, !tbaa !23
  %569 = or disjoint i64 %505, 10
  %570 = getelementptr inbounds float, ptr %9, i64 %569
  store float %568, ptr %570, align 8, !tbaa !23
  br i1 %495, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %571 = trunc i64 %502 to i32
  %572 = or disjoint i32 %571, 11
  %573 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %572
  %574 = load float, ptr addrspace(3) %573, align 4, !tbaa !23
  %575 = or disjoint i64 %505, 11
  %576 = getelementptr inbounds float, ptr %9, i64 %575
  store float %574, ptr %576, align 4, !tbaa !23
  br i1 %496, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %577 = trunc i64 %502 to i32
  %578 = or disjoint i32 %577, 12
  %579 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %578
  %580 = load float, ptr addrspace(3) %579, align 4, !tbaa !23
  %581 = or disjoint i64 %505, 12
  %582 = getelementptr inbounds float, ptr %9, i64 %581
  store float %580, ptr %582, align 16, !tbaa !23
  br i1 %497, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %583 = trunc i64 %502 to i32
  %584 = or disjoint i32 %583, 13
  %585 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %584
  %586 = load float, ptr addrspace(3) %585, align 4, !tbaa !23
  %587 = or disjoint i64 %505, 13
  %588 = getelementptr inbounds float, ptr %9, i64 %587
  store float %586, ptr %588, align 4, !tbaa !23
  br i1 %498, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %589 = trunc i64 %502 to i32
  %590 = or disjoint i32 %589, 14
  %591 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %590
  %592 = load float, ptr addrspace(3) %591, align 4, !tbaa !23
  %593 = or disjoint i64 %505, 14
  %594 = getelementptr inbounds float, ptr %9, i64 %593
  store float %592, ptr %594, align 8, !tbaa !23
  br i1 %499, label %595, label %.split.us.i

595:                                              ; preds = %.preheader.split.15.i
  %596 = trunc i64 %502 to i32
  %597 = or disjoint i32 %596, 15
  %598 = getelementptr inbounds float, ptr addrspace(3) %482, i32 %597
  %599 = load float, ptr addrspace(3) %598, align 4, !tbaa !23
  %600 = or disjoint i64 %505, 15
  %601 = getelementptr inbounds float, ptr %9, i64 %600
  store float %599, ptr %601, align 4, !tbaa !23
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge962.i, %.split.us.i
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
!10 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!11 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!12 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
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
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = !{i64 0, i64 2, !30}
!30 = !{!31, !31, i64 0}
!31 = !{!"short", !25, i64 0}
!32 = distinct !{!32, !28, !33, !34}
!33 = !{!"llvm.loop.vectorize.width", i32 1}
!34 = !{!"llvm.loop.interleave.count", i32 1}
!35 = distinct !{!35, !28, !33, !34}
!36 = distinct !{!36, !28, !33, !34}
!37 = distinct !{!37, !28, !33, !34}
!38 = distinct !{!38, !28}
!39 = distinct !{!39, !28}
;----------------- End AdaptiveCpp IR dump ---------------
