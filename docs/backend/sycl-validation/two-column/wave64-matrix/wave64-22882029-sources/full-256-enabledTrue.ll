;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-22882029/tmp/triton-sycl-cache/compile-abq7wwqk/kernel.cpp"
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
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !14
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !14
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !14
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !14
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !14
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !17
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !17
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !17
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !17
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !17
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !17
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !20
  %23 = icmp ult i64 %22, 8388608
  call void @llvm.assume(i1 %23), !noalias !20
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !20
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !20
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !20
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !20
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 8388607
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %31 = icmp eq i64 %30, 0
  call void @llvm.assume(i1 %31)
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %35 = icmp ult i64 %34, 256
  call void @llvm.assume(i1 %35)
  %36 = shl nuw i32 %.tr.i, 9
  %37 = sext i32 %3 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %36 to i64
  %40 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %41 = inttoptr i32 %40 to ptr addrspace(3)
  %42 = getelementptr inbounds i8, ptr addrspace(3) %41, i32 512
  %43 = and i64 %34, 63
  %44 = icmp slt i64 %43, %38
  br label %60

.lr.ph640.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i
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
  %51 = shl i32 %.tr.i, 10
  %52 = sext i32 %4 to i64
  %53 = sext i32 %5 to i64
  %54 = sext i32 %51 to i64
  %55 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %56 = inttoptr i32 %55 to ptr addrspace(3)
  %57 = getelementptr inbounds i8, ptr addrspace(3) %56, i32 1536
  %58 = and i64 %49, 63
  %59 = icmp slt i64 %58, %53
  br label %84

60:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i, %6
  %61 = phi i64 [ %34, %6 ], [ %72, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i ]
  %62 = lshr i64 %61, 6
  %63 = icmp slt i64 %62, %37
  %64 = and i1 %63, %44
  br i1 %64, label %65, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

65:                                               ; preds = %60
  %66 = and i64 %61, 9223372036854775744
  %67 = or disjoint i64 %66, %39
  %68 = or disjoint i64 %67, %43
  %69 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %68
  %.sroa.0295.0.copyload.i = load i16, ptr %69, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i.i: ; preds = %65, %60
  %.sroa.0297.1.i = phi i16 [ %.sroa.0295.0.copyload.i, %65 ], [ 0, %60 ]
  %70 = trunc i64 %61 to i32
  %71 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %42, i32 %70
  store i16 %.sroa.0297.1.i, ptr addrspace(3) %71, align 2, !tbaa.struct !23
  %72 = add nuw nsw i64 %61, 256
  %73 = icmp ult i64 %61, 256
  br i1 %73, label %60, label %.lr.ph640.i, !llvm.loop !28

.lr.ph643.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %75 = icmp eq i64 %74, 0
  call void @llvm.assume(i1 %75)
  %76 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %77 = icmp eq i64 %76, 0
  call void @llvm.assume(i1 %77)
  %78 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %79 = icmp ult i64 %78, 256
  call void @llvm.assume(i1 %79)
  %80 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %81 = inttoptr i32 %80 to ptr addrspace(3)
  %82 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 1536
  %83 = getelementptr inbounds i8, ptr addrspace(3) %81, i32 3584
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i

84:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i, %.lr.ph640.i
  %85 = phi i64 [ %49, %.lr.ph640.i ], [ %96, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i ]
  %86 = lshr i64 %85, 6
  %87 = icmp slt i64 %86, %52
  %88 = and i1 %87, %59
  br i1 %88, label %89, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i

89:                                               ; preds = %84
  %90 = and i64 %85, 9223372036854775744
  %91 = or disjoint i64 %90, %54
  %92 = or disjoint i64 %91, %58
  %93 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %92
  %.sroa.0280.0.copyload.i = load i16, ptr %93, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit21.i.i.i.i: ; preds = %89, %84
  %.sroa.0282.1.i = phi i16 [ %.sroa.0280.0.copyload.i, %89 ], [ 0, %84 ]
  %94 = trunc i64 %85 to i32
  %95 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %57, i32 %94
  store i16 %.sroa.0282.1.i, ptr addrspace(3) %95, align 2, !tbaa.struct !23
  %96 = add nuw nsw i64 %85, 256
  %97 = icmp ult i64 %85, 768
  br i1 %97, label %84, label %.lr.ph643.i, !llvm.loop !32

._crit_edge644.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %99 = icmp eq i64 %98, 0
  call void @llvm.assume(i1 %99)
  %100 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %101 = icmp eq i64 %100, 0
  call void @llvm.assume(i1 %101)
  %102 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %103 = icmp ult i64 %102, 256
  call void @llvm.assume(i1 %103)
  %104 = icmp ult i64 %102, 128
  br i1 %104, label %.lr.ph646.i, label %._crit_edge647.i

.lr.ph646.i:                                      ; preds = %._crit_edge644.i
  %105 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %106 = inttoptr i32 %105 to ptr addrspace(3)
  %107 = getelementptr inbounds i8, ptr addrspace(3) %106, i32 512
  %108 = getelementptr inbounds i8, ptr addrspace(3) %106, i32 3584
  %109 = and i64 %102, 15
  %110 = shl nuw nsw i64 %102, 2
  %111 = and i64 %110, 448
  br label %130

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, %.lr.ph643.i
  %112 = phi i64 [ %78, %.lr.ph643.i ], [ %121, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i ]
  %113 = lshr i64 %112, 4
  %114 = shl nuw nsw i64 %112, 6
  %115 = and i64 %114, 960
  %116 = or disjoint i64 %115, %113
  %117 = trunc i64 %116 to i32
  %118 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %82, i32 %117
  %.sroa.0348.0.copyload.i = load i16, ptr addrspace(3) %118, align 2, !tbaa.struct !23
  %119 = trunc i64 %112 to i32
  %120 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %83, i32 %119
  store i16 %.sroa.0348.0.copyload.i, ptr addrspace(3) %120, align 2, !tbaa.struct !23
  %121 = add nuw nsw i64 %112, 256
  %122 = icmp ult i64 %112, 768
  br i1 %122, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit6.i.i.i.i, label %._crit_edge644.i, !llvm.loop !33

._crit_edge647.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, %._crit_edge644.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = shl nuw nsw i64 %28, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %125 = icmp ult i64 %124, 256
  call void @llvm.assume(i1 %125)
  %126 = icmp eq i64 %124, 0
  br i1 %126, label %334, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i
  %127 = trunc i64 %102 to i32
  %128 = and i32 %127, 127
  %129 = getelementptr inbounds float, ptr addrspace(3) %106, i32 %128
  store float %331, ptr addrspace(3) %129, align 4, !tbaa !34
  br label %._crit_edge647.i

130:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i, %.lr.ph646.i
  %131 = phi i64 [ 0, %.lr.ph646.i ], [ %332, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %132 = phi float [ 0.000000e+00, %.lr.ph646.i ], [ %331, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i ]
  %133 = add nuw nsw i64 %131, %111
  %134 = trunc i64 %133 to i32
  %135 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %107, i32 %134
  %.sroa.0239.0.copyload.i = load i16, ptr addrspace(3) %135, align 2, !tbaa.struct !23
  %136 = shl nuw nsw i64 %131, 4
  %137 = or disjoint i64 %136, %109
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %108, i32 %138
  %.sroa.0230.0.copyload.i = load i16, ptr addrspace(3) %139, align 2, !tbaa.struct !23
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
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

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
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i: ; preds = %151, %144
  %159 = phi float [ %148, %144 ], [ %158, %151 ]
  %160 = zext i16 %.sroa.0230.0.copyload.i to i32
  %161 = lshr i32 %160, 10
  %162 = and i32 %161, 31
  %163 = and i32 %160, 1023
  switch i32 %162, label %169 [
    i32 31, label %164
    i32 0, label %171
  ]

164:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %.sroa.0230.0.copyload.signext.i = sext i16 %.sroa.0230.0.copyload.i to i32
  %165 = and i32 %.sroa.0230.0.copyload.signext.i, -2147483648
  %.not627.i = icmp eq i32 %163, 0
  %166 = select i1 %.not627.i, i32 2139095040, i32 2143289344
  %167 = or disjoint i32 %166, %165
  %168 = bitcast i32 %167 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

169:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %170 = or disjoint i32 %163, 1024
  br label %171

171:                                              ; preds = %169, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i
  %172 = phi i32 [ %170, %169 ], [ %163, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i.i ]
  %173 = uitofp i32 %172 to float
  %.not600.i = icmp eq i32 %162, 0
  %174 = add nsw i32 %162, -25
  %175 = select i1 %.not600.i, i32 -24, i32 %174
  %176 = call float @__ocml_ldexp_f32(float noundef %173, i32 noundef %175) #5
  %177 = fneg contract float %176
  %.not601602.i = icmp slt i16 %.sroa.0230.0.copyload.i, 0
  %178 = select contract i1 %.not601602.i, float %177, float %176
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i: ; preds = %171, %164
  %179 = phi float [ %168, %164 ], [ %178, %171 ]
  %180 = fmul contract float %159, %179
  %181 = fadd contract float %132, %180
  %182 = or disjoint i64 %131, 1
  %183 = add nuw nsw i64 %182, %111
  %184 = trunc i64 %183 to i32
  %185 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %107, i32 %184
  %.sroa.0221.0.copyload.i = load i16, ptr addrspace(3) %185, align 2, !tbaa.struct !23
  %186 = shl nuw nsw i64 %182, 4
  %187 = or disjoint i64 %186, %109
  %188 = trunc i64 %187 to i32
  %189 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %108, i32 %188
  %.sroa.0212.0.copyload.i = load i16, ptr addrspace(3) %189, align 2, !tbaa.struct !23
  %190 = zext i16 %.sroa.0221.0.copyload.i to i32
  %191 = lshr i32 %190, 10
  %192 = and i32 %191, 31
  %193 = and i32 %190, 1023
  switch i32 %192, label %199 [
    i32 31, label %194
    i32 0, label %201
  ]

194:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %.sroa.0221.0.copyload.signext.i = sext i16 %.sroa.0221.0.copyload.i to i32
  %195 = and i32 %.sroa.0221.0.copyload.signext.i, -2147483648
  %.not626.i = icmp eq i32 %193, 0
  %196 = select i1 %.not626.i, i32 2139095040, i32 2143289344
  %197 = or disjoint i32 %196, %195
  %198 = bitcast i32 %197 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

199:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %200 = or disjoint i32 %193, 1024
  br label %201

201:                                              ; preds = %199, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i
  %202 = phi i32 [ %200, %199 ], [ %193, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit16.i.i.i.i ]
  %203 = uitofp i32 %202 to float
  %.not603.i = icmp eq i32 %192, 0
  %204 = add nsw i32 %192, -25
  %205 = select i1 %.not603.i, i32 -24, i32 %204
  %206 = call float @__ocml_ldexp_f32(float noundef %203, i32 noundef %205) #5
  %207 = fneg contract float %206
  %.not604605.i = icmp slt i16 %.sroa.0221.0.copyload.i, 0
  %208 = select contract i1 %.not604605.i, float %207, float %206
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i: ; preds = %201, %194
  %209 = phi float [ %198, %194 ], [ %208, %201 ]
  %210 = zext i16 %.sroa.0212.0.copyload.i to i32
  %211 = lshr i32 %210, 10
  %212 = and i32 %211, 31
  %213 = and i32 %210, 1023
  switch i32 %212, label %219 [
    i32 31, label %214
    i32 0, label %221
  ]

214:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %.sroa.0212.0.copyload.signext.i = sext i16 %.sroa.0212.0.copyload.i to i32
  %215 = and i32 %.sroa.0212.0.copyload.signext.i, -2147483648
  %.not625.i = icmp eq i32 %213, 0
  %216 = select i1 %.not625.i, i32 2139095040, i32 2143289344
  %217 = or disjoint i32 %216, %215
  %218 = bitcast i32 %217 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %220 = or disjoint i32 %213, 1024
  br label %221

221:                                              ; preds = %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i
  %222 = phi i32 [ %220, %219 ], [ %213, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit15.i.i.i.i ]
  %223 = uitofp i32 %222 to float
  %.not606.i = icmp eq i32 %212, 0
  %224 = add nsw i32 %212, -25
  %225 = select i1 %.not606.i, i32 -24, i32 %224
  %226 = call float @__ocml_ldexp_f32(float noundef %223, i32 noundef %225) #5
  %227 = fneg contract float %226
  %.not607608.i = icmp slt i16 %.sroa.0212.0.copyload.i, 0
  %228 = select contract i1 %.not607608.i, float %227, float %226
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i: ; preds = %221, %214
  %229 = phi float [ %218, %214 ], [ %228, %221 ]
  %230 = fmul contract float %209, %229
  %231 = fadd contract float %181, %230
  %232 = or disjoint i64 %131, 2
  %233 = add nuw nsw i64 %232, %111
  %234 = trunc i64 %233 to i32
  %235 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %107, i32 %234
  %.sroa.0203.0.copyload.i = load i16, ptr addrspace(3) %235, align 2, !tbaa.struct !23
  %236 = shl nuw nsw i64 %232, 4
  %237 = or disjoint i64 %236, %109
  %238 = trunc i64 %237 to i32
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %108, i32 %238
  %.sroa.0194.0.copyload.i = load i16, ptr addrspace(3) %239, align 2, !tbaa.struct !23
  %240 = zext i16 %.sroa.0203.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i
  %.sroa.0203.0.copyload.signext.i = sext i16 %.sroa.0203.0.copyload.i to i32
  %245 = and i32 %.sroa.0203.0.copyload.signext.i, -2147483648
  %.not624.i = icmp eq i32 %243, 0
  %246 = select i1 %.not624.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit14.i.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not609.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not609.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #5
  %257 = fneg contract float %256
  %.not610611.i = icmp slt i16 %.sroa.0203.0.copyload.i, 0
  %258 = select contract i1 %.not610611.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = zext i16 %.sroa.0194.0.copyload.i to i32
  %261 = lshr i32 %260, 10
  %262 = and i32 %261, 31
  %263 = and i32 %260, 1023
  switch i32 %262, label %269 [
    i32 31, label %264
    i32 0, label %271
  ]

264:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i
  %.sroa.0194.0.copyload.signext.i = sext i16 %.sroa.0194.0.copyload.i to i32
  %265 = and i32 %.sroa.0194.0.copyload.signext.i, -2147483648
  %.not623.i = icmp eq i32 %263, 0
  %266 = select i1 %.not623.i, i32 2139095040, i32 2143289344
  %267 = or disjoint i32 %266, %265
  %268 = bitcast i32 %267 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i
  %270 = or disjoint i32 %263, 1024
  br label %271

271:                                              ; preds = %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i
  %272 = phi i32 [ %270, %269 ], [ %263, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit13.i.i.i.i ]
  %273 = uitofp i32 %272 to float
  %.not612.i = icmp eq i32 %262, 0
  %274 = add nsw i32 %262, -25
  %275 = select i1 %.not612.i, i32 -24, i32 %274
  %276 = call float @__ocml_ldexp_f32(float noundef %273, i32 noundef %275) #5
  %277 = fneg contract float %276
  %.not613614.i = icmp slt i16 %.sroa.0194.0.copyload.i, 0
  %278 = select contract i1 %.not613614.i, float %277, float %276
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i: ; preds = %271, %264
  %279 = phi float [ %268, %264 ], [ %278, %271 ]
  %280 = fmul contract float %259, %279
  %281 = fadd contract float %231, %280
  %282 = or disjoint i64 %131, 3
  %283 = add nuw nsw i64 %282, %111
  %284 = trunc i64 %283 to i32
  %285 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %107, i32 %284
  %.sroa.0185.0.copyload.i = load i16, ptr addrspace(3) %285, align 2, !tbaa.struct !23
  %286 = shl nuw nsw i64 %282, 4
  %287 = or disjoint i64 %286, %109
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %108, i32 %288
  %.sroa.0176.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !23
  %290 = zext i16 %.sroa.0185.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i
  %.sroa.0185.0.copyload.signext.i = sext i16 %.sroa.0185.0.copyload.i to i32
  %295 = and i32 %.sroa.0185.0.copyload.signext.i, -2147483648
  %.not622.i = icmp eq i32 %293, 0
  %296 = select i1 %.not622.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit12.i.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not615.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not615.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #5
  %307 = fneg contract float %306
  %.not616617.i = icmp slt i16 %.sroa.0185.0.copyload.i, 0
  %308 = select contract i1 %.not616617.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = zext i16 %.sroa.0176.0.copyload.i to i32
  %311 = lshr i32 %310, 10
  %312 = and i32 %311, 31
  %313 = and i32 %310, 1023
  switch i32 %312, label %319 [
    i32 31, label %314
    i32 0, label %321
  ]

314:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %.sroa.0176.0.copyload.signext.i = sext i16 %.sroa.0176.0.copyload.i to i32
  %315 = and i32 %.sroa.0176.0.copyload.signext.i, -2147483648
  %.not621.i = icmp eq i32 %313, 0
  %316 = select i1 %.not621.i, i32 2139095040, i32 2143289344
  %317 = or disjoint i32 %316, %315
  %318 = bitcast i32 %317 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

319:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %320 = or disjoint i32 %313, 1024
  br label %321

321:                                              ; preds = %319, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i
  %322 = phi i32 [ %320, %319 ], [ %313, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit11.i.i.i.i ]
  %323 = uitofp i32 %322 to float
  %.not618.i = icmp eq i32 %312, 0
  %324 = add nsw i32 %312, -25
  %325 = select i1 %.not618.i, i32 -24, i32 %324
  %326 = call float @__ocml_ldexp_f32(float noundef %323, i32 noundef %325) #5
  %327 = fneg contract float %326
  %.not619620.i = icmp slt i16 %.sroa.0176.0.copyload.i, 0
  %328 = select contract i1 %.not619620.i, float %327, float %326
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i.i: ; preds = %321, %314
  %329 = phi float [ %318, %314 ], [ %328, %321 ]
  %330 = fmul contract float %309, %329
  %331 = fadd contract float %281, %330
  %332 = add nuw nsw i64 %131, 4
  %333 = icmp ult i64 %131, 60
  br i1 %333, label %130, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i.i, !llvm.loop !36

334:                                              ; preds = %._crit_edge647.i
  %335 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %336 = icmp eq i64 %335, 0
  call void @llvm.assume(i1 %336)
  %337 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %338 = icmp eq i64 %337, 0
  call void @llvm.assume(i1 %338)
  %339 = sext i32 %3 to i64
  %340 = call i32 @llvm.amdgcn.groupstaticsize()
  %341 = inttoptr i32 %340 to ptr addrspace(3)
  %342 = icmp sgt i32 %4, 0
  %343 = icmp ugt i32 %4, 1
  %344 = icmp ugt i32 %4, 2
  %345 = icmp ugt i32 %4, 3
  %346 = icmp ugt i32 %4, 4
  %347 = icmp ugt i32 %4, 5
  %348 = icmp ugt i32 %4, 6
  %349 = icmp ugt i32 %4, 7
  %350 = icmp ugt i32 %4, 8
  %351 = icmp ugt i32 %4, 9
  %352 = icmp ugt i32 %4, 10
  %353 = icmp ugt i32 %4, 11
  %354 = icmp ugt i32 %4, 12
  %355 = icmp ugt i32 %4, 13
  %356 = icmp ugt i32 %4, 14
  %357 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %334
  %358 = phi i64 [ 0, %334 ], [ %364, %.split.us.i ]
  %359 = icmp slt i64 %358, %339
  %360 = shl i64 %358, 4
  %.tr597.i = trunc i64 %358 to i32
  %361 = shl i32 %.tr597.i, 4
  %362 = sext i32 %361 to i64
  %363 = add nsw i64 %123, %362
  %.fr.i = freeze i1 %359
  %brmerge.not.i = select i1 %.fr.i, i1 %342, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %453, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %364 = add nuw nsw i64 %358, 1
  %exitcond.not.i = icmp eq i64 %364, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !37

.preheader.split.1.i:                             ; preds = %.preheader.i
  %365 = trunc i64 %360 to i32
  %366 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %365
  %367 = load float, ptr addrspace(3) %366, align 4, !tbaa !34
  %368 = getelementptr inbounds float, ptr %9, i64 %363
  store float %367, ptr %368, align 32, !tbaa !34
  br i1 %343, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %369 = trunc i64 %360 to i32
  %370 = or disjoint i32 %369, 1
  %371 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %370
  %372 = load float, ptr addrspace(3) %371, align 4, !tbaa !34
  %373 = or disjoint i64 %363, 1
  %374 = getelementptr inbounds float, ptr %9, i64 %373
  store float %372, ptr %374, align 4, !tbaa !34
  br i1 %344, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %375 = trunc i64 %360 to i32
  %376 = or disjoint i32 %375, 2
  %377 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %376
  %378 = load float, ptr addrspace(3) %377, align 4, !tbaa !34
  %379 = or disjoint i64 %363, 2
  %380 = getelementptr inbounds float, ptr %9, i64 %379
  store float %378, ptr %380, align 8, !tbaa !34
  br i1 %345, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %381 = trunc i64 %360 to i32
  %382 = or disjoint i32 %381, 3
  %383 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %382
  %384 = load float, ptr addrspace(3) %383, align 4, !tbaa !34
  %385 = or disjoint i64 %363, 3
  %386 = getelementptr inbounds float, ptr %9, i64 %385
  store float %384, ptr %386, align 4, !tbaa !34
  br i1 %346, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %387 = trunc i64 %360 to i32
  %388 = or disjoint i32 %387, 4
  %389 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %388
  %390 = load float, ptr addrspace(3) %389, align 4, !tbaa !34
  %391 = or disjoint i64 %363, 4
  %392 = getelementptr inbounds float, ptr %9, i64 %391
  store float %390, ptr %392, align 16, !tbaa !34
  br i1 %347, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %393 = trunc i64 %360 to i32
  %394 = or disjoint i32 %393, 5
  %395 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %394
  %396 = load float, ptr addrspace(3) %395, align 4, !tbaa !34
  %397 = or disjoint i64 %363, 5
  %398 = getelementptr inbounds float, ptr %9, i64 %397
  store float %396, ptr %398, align 4, !tbaa !34
  br i1 %348, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %399 = trunc i64 %360 to i32
  %400 = or disjoint i32 %399, 6
  %401 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %400
  %402 = load float, ptr addrspace(3) %401, align 4, !tbaa !34
  %403 = or disjoint i64 %363, 6
  %404 = getelementptr inbounds float, ptr %9, i64 %403
  store float %402, ptr %404, align 8, !tbaa !34
  br i1 %349, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %405 = trunc i64 %360 to i32
  %406 = or disjoint i32 %405, 7
  %407 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %406
  %408 = load float, ptr addrspace(3) %407, align 4, !tbaa !34
  %409 = or disjoint i64 %363, 7
  %410 = getelementptr inbounds float, ptr %9, i64 %409
  store float %408, ptr %410, align 4, !tbaa !34
  br i1 %350, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %411 = trunc i64 %360 to i32
  %412 = or disjoint i32 %411, 8
  %413 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %412
  %414 = load float, ptr addrspace(3) %413, align 4, !tbaa !34
  %415 = or disjoint i64 %363, 8
  %416 = getelementptr inbounds float, ptr %9, i64 %415
  store float %414, ptr %416, align 32, !tbaa !34
  br i1 %351, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %417 = trunc i64 %360 to i32
  %418 = or disjoint i32 %417, 9
  %419 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %418
  %420 = load float, ptr addrspace(3) %419, align 4, !tbaa !34
  %421 = or disjoint i64 %363, 9
  %422 = getelementptr inbounds float, ptr %9, i64 %421
  store float %420, ptr %422, align 4, !tbaa !34
  br i1 %352, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %423 = trunc i64 %360 to i32
  %424 = or disjoint i32 %423, 10
  %425 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %424
  %426 = load float, ptr addrspace(3) %425, align 4, !tbaa !34
  %427 = or disjoint i64 %363, 10
  %428 = getelementptr inbounds float, ptr %9, i64 %427
  store float %426, ptr %428, align 8, !tbaa !34
  br i1 %353, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %429 = trunc i64 %360 to i32
  %430 = or disjoint i32 %429, 11
  %431 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %430
  %432 = load float, ptr addrspace(3) %431, align 4, !tbaa !34
  %433 = or disjoint i64 %363, 11
  %434 = getelementptr inbounds float, ptr %9, i64 %433
  store float %432, ptr %434, align 4, !tbaa !34
  br i1 %354, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %435 = trunc i64 %360 to i32
  %436 = or disjoint i32 %435, 12
  %437 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %436
  %438 = load float, ptr addrspace(3) %437, align 4, !tbaa !34
  %439 = or disjoint i64 %363, 12
  %440 = getelementptr inbounds float, ptr %9, i64 %439
  store float %438, ptr %440, align 16, !tbaa !34
  br i1 %355, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %441 = trunc i64 %360 to i32
  %442 = or disjoint i32 %441, 13
  %443 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %442
  %444 = load float, ptr addrspace(3) %443, align 4, !tbaa !34
  %445 = or disjoint i64 %363, 13
  %446 = getelementptr inbounds float, ptr %9, i64 %445
  store float %444, ptr %446, align 4, !tbaa !34
  br i1 %356, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %447 = trunc i64 %360 to i32
  %448 = or disjoint i32 %447, 14
  %449 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %448
  %450 = load float, ptr addrspace(3) %449, align 4, !tbaa !34
  %451 = or disjoint i64 %363, 14
  %452 = getelementptr inbounds float, ptr %9, i64 %451
  store float %450, ptr %452, align 8, !tbaa !34
  br i1 %357, label %453, label %.split.us.i

453:                                              ; preds = %.preheader.split.15.i
  %454 = trunc i64 %360 to i32
  %455 = or disjoint i32 %454, 15
  %456 = getelementptr inbounds float, ptr addrspace(3) %341, i32 %455
  %457 = load float, ptr addrspace(3) %456, align 4, !tbaa !34
  %458 = or disjoint i64 %363, 15
  %459 = getelementptr inbounds float, ptr %9, i64 %458
  store float %457, ptr %459, align 4, !tbaa !34
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_1clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge647.i, %.split.us.i
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
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !26, i64 0}
!36 = distinct !{!36, !29}
!37 = distinct !{!37, !29}
;----------------- End AdaptiveCpp IR dump ---------------
