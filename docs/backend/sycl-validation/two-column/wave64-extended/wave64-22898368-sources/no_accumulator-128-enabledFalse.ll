;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-f9e8c4z6/kernel.cpp"
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
  store float 0.000000e+00, ptr addrspace(3) %37, align 4, !tbaa !19
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

.lr.ph576.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i
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
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

65:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i, %6
  %66 = phi i64 [ %44, %6 ], [ %77, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i ]
  %67 = lshr i64 %66, 3
  %68 = icmp slt i64 %67, %47
  %69 = and i1 %68, %54
  br i1 %69, label %70, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i

70:                                               ; preds = %65
  %71 = and i64 %66, 9223372036854775800
  %72 = or disjoint i64 %71, %49
  %73 = or disjoint i64 %72, %53
  %74 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %73
  %.sroa.0277.0.copyload.i = load i16, ptr %74, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i: ; preds = %70, %65
  %.sroa.0279.1.i = phi i16 [ %.sroa.0277.0.copyload.i, %70 ], [ 0, %65 ]
  %75 = trunc i64 %66 to i32
  %76 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %52, i32 %75
  store i16 %.sroa.0279.1.i, ptr addrspace(3) %76, align 2, !tbaa.struct !23
  %77 = add nuw nsw i64 %66, 128
  %78 = icmp ult i64 %66, 128
  br i1 %78, label %65, label %.lr.ph576.i, !llvm.loop !26

.lr.ph579.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph576.i
  %94 = phi i64 [ %59, %.lr.ph576.i ], [ %103, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %95 = lshr i64 %94, 5
  %96 = shl nuw nsw i64 %94, 3
  %97 = and i64 %96, 248
  %98 = or disjoint i64 %97, %95
  %99 = trunc i64 %98 to i32
  %100 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %63, i32 %99
  %.sroa.0340.0.copyload.i = load i16, ptr addrspace(3) %100, align 2, !tbaa.struct !23
  %101 = trunc i64 %94 to i32
  %102 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %64, i32 %101
  store i16 %.sroa.0340.0.copyload.i, ptr addrspace(3) %102, align 2, !tbaa.struct !23
  %103 = add nuw nsw i64 %94, 128
  %104 = icmp ult i64 %94, 128
  br i1 %104, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %.lr.ph579.i, !llvm.loop !30

.lr.ph582.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i

115:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph579.i
  %116 = phi i64 [ %83, %.lr.ph579.i ], [ %127, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %117 = lshr i64 %116, 5
  %118 = icmp slt i64 %117, %86
  %119 = and i1 %118, %93
  br i1 %119, label %120, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

120:                                              ; preds = %115
  %121 = and i64 %116, 9223372036854775776
  %122 = or disjoint i64 %121, %88
  %123 = or disjoint i64 %122, %92
  %124 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %123
  %.sroa.0236.0.copyload.i = load i16, ptr %124, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %120, %115
  %.sroa.0238.1.i = phi i16 [ %.sroa.0236.0.copyload.i, %120 ], [ 0, %115 ]
  %125 = trunc i64 %116 to i32
  %126 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %91, i32 %125
  store i16 %.sroa.0238.1.i, ptr addrspace(3) %126, align 2, !tbaa.struct !23
  %127 = add nuw nsw i64 %116, 128
  %128 = icmp ult i64 %116, 384
  br i1 %128, label %115, label %.lr.ph582.i, !llvm.loop !31

.lr.ph585.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
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
  %140 = shl nuw nsw i64 %133, 1
  %141 = and i64 %140, 224
  %142 = trunc i64 %133 to i32
  %143 = getelementptr inbounds float, ptr addrspace(3) %136, i32 %142
  %.pre.i = load float, ptr addrspace(3) %143, align 4, !tbaa !19
  br label %159

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph582.i
  %144 = phi i64 [ %109, %.lr.ph582.i ], [ %153, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %145 = lshr i64 %144, 4
  %146 = shl nuw nsw i64 %144, 5
  %147 = and i64 %146, 480
  %148 = or disjoint i64 %147, %145
  %149 = trunc i64 %148 to i32
  %150 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %113, i32 %149
  %.sroa.0341.0.copyload.i = load i16, ptr addrspace(3) %150, align 2, !tbaa.struct !23
  %151 = trunc i64 %144 to i32
  %152 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %114, i32 %151
  store i16 %.sroa.0341.0.copyload.i, ptr addrspace(3) %152, align 2, !tbaa.struct !23
  %153 = add nuw nsw i64 %144, 128
  %154 = icmp ult i64 %144, 384
  br i1 %154, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %.lr.ph585.i, !llvm.loop !32

._crit_edge586.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = shl nuw nsw i64 %38, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %157 = icmp ult i64 %156, 128
  call void @llvm.assume(i1 %157)
  %158 = icmp eq i64 %156, 0
  br i1 %158, label %212, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

159:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph585.i
  %160 = phi float [ %.pre.i, %.lr.ph585.i ], [ %210, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %161 = phi i64 [ 0, %.lr.ph585.i ], [ %211, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %162 = add nuw nsw i64 %161, %141
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %137, i32 %163
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %164, align 2, !tbaa.struct !23
  %165 = shl nuw nsw i64 %161, 4
  %166 = or disjoint i64 %165, %139
  %167 = trunc i64 %166 to i32
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %138, i32 %167
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %168, align 2, !tbaa.struct !23
  %169 = zext i16 %.sroa.0195.0.copyload.i to i32
  %170 = lshr i32 %169, 10
  %171 = and i32 %170, 31
  %172 = and i32 %169, 1023
  switch i32 %171, label %178 [
    i32 31, label %173
    i32 0, label %180
  ]

173:                                              ; preds = %159
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %174 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not560.i = icmp eq i32 %172, 0
  %175 = select i1 %.not560.i, i32 2139095040, i32 2143289344
  %176 = or disjoint i32 %175, %174
  %177 = bitcast i32 %176 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

178:                                              ; preds = %159
  %179 = or disjoint i32 %172, 1024
  br label %180

180:                                              ; preds = %178, %159
  %181 = phi i32 [ %179, %178 ], [ %172, %159 ]
  %182 = uitofp i32 %181 to float
  %.not.i = icmp eq i32 %171, 0
  %183 = add nsw i32 %171, -25
  %184 = select i1 %.not.i, i32 -24, i32 %183
  %185 = call float @__ocml_ldexp_f32(float noundef %182, i32 noundef %184) #5
  %186 = fneg contract float %185
  %.not554555.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %187 = select contract i1 %.not554555.i, float %186, float %185
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %180, %173
  %188 = phi float [ %177, %173 ], [ %187, %180 ]
  %189 = zext i16 %.sroa.0186.0.copyload.i to i32
  %190 = lshr i32 %189, 10
  %191 = and i32 %190, 31
  %192 = and i32 %189, 1023
  switch i32 %191, label %198 [
    i32 31, label %193
    i32 0, label %200
  ]

193:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %194 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not559.i = icmp eq i32 %192, 0
  %195 = select i1 %.not559.i, i32 2139095040, i32 2143289344
  %196 = or disjoint i32 %195, %194
  %197 = bitcast i32 %196 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

198:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %199 = or disjoint i32 %192, 1024
  br label %200

200:                                              ; preds = %198, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %201 = phi i32 [ %199, %198 ], [ %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %202 = uitofp i32 %201 to float
  %.not556.i = icmp eq i32 %191, 0
  %203 = add nsw i32 %191, -25
  %204 = select i1 %.not556.i, i32 -24, i32 %203
  %205 = call float @__ocml_ldexp_f32(float noundef %202, i32 noundef %204) #5
  %206 = fneg contract float %205
  %.not557558.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %207 = select contract i1 %.not557558.i, float %206, float %205
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %200, %193
  %208 = phi float [ %197, %193 ], [ %207, %200 ]
  %209 = fmul contract float %188, %208
  %210 = fadd contract float %160, %209
  store float %210, ptr addrspace(3) %143, align 4, !tbaa !19
  %211 = add nuw nsw i64 %161, 1
  %exitcond.not.i = icmp eq i64 %211, 32
  br i1 %exitcond.not.i, label %._crit_edge586.i, label %159, !llvm.loop !33

212:                                              ; preds = %._crit_edge586.i
  %213 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %214 = icmp eq i64 %213, 0
  call void @llvm.assume(i1 %214)
  %215 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %216 = icmp eq i64 %215, 0
  call void @llvm.assume(i1 %216)
  %217 = sext i32 %3 to i64
  %218 = call i32 @llvm.amdgcn.groupstaticsize()
  %219 = inttoptr i32 %218 to ptr addrspace(3)
  %220 = icmp sgt i32 %4, 0
  %221 = icmp ugt i32 %4, 1
  %222 = icmp ugt i32 %4, 2
  %223 = icmp ugt i32 %4, 3
  %224 = icmp ugt i32 %4, 4
  %225 = icmp ugt i32 %4, 5
  %226 = icmp ugt i32 %4, 6
  %227 = icmp ugt i32 %4, 7
  %228 = icmp ugt i32 %4, 8
  %229 = icmp ugt i32 %4, 9
  %230 = icmp ugt i32 %4, 10
  %231 = icmp ugt i32 %4, 11
  %232 = icmp ugt i32 %4, 12
  %233 = icmp ugt i32 %4, 13
  %234 = icmp ugt i32 %4, 14
  %235 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %212
  %236 = phi i64 [ 0, %212 ], [ %242, %.split.us.i ]
  %237 = icmp slt i64 %236, %217
  %238 = shl i64 %236, 4
  %.tr553.i = trunc i64 %236 to i32
  %239 = shl i32 %.tr553.i, 4
  %240 = sext i32 %239 to i64
  %241 = add nsw i64 %155, %240
  %.fr.i = freeze i1 %237
  %brmerge.not.i = select i1 %.fr.i, i1 %220, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %331, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %242 = add nuw nsw i64 %236, 1
  %exitcond589.not.i = icmp eq i64 %242, 8
  br i1 %exitcond589.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !34

.preheader.split.1.i:                             ; preds = %.preheader.i
  %243 = trunc i64 %238 to i32
  %244 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %243
  %245 = load float, ptr addrspace(3) %244, align 4, !tbaa !19
  %246 = getelementptr inbounds float, ptr %9, i64 %241
  store float %245, ptr %246, align 32, !tbaa !19
  br i1 %221, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %247 = trunc i64 %238 to i32
  %248 = or disjoint i32 %247, 1
  %249 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %248
  %250 = load float, ptr addrspace(3) %249, align 4, !tbaa !19
  %251 = or disjoint i64 %241, 1
  %252 = getelementptr inbounds float, ptr %9, i64 %251
  store float %250, ptr %252, align 4, !tbaa !19
  br i1 %222, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %253 = trunc i64 %238 to i32
  %254 = or disjoint i32 %253, 2
  %255 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %254
  %256 = load float, ptr addrspace(3) %255, align 4, !tbaa !19
  %257 = or disjoint i64 %241, 2
  %258 = getelementptr inbounds float, ptr %9, i64 %257
  store float %256, ptr %258, align 8, !tbaa !19
  br i1 %223, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %259 = trunc i64 %238 to i32
  %260 = or disjoint i32 %259, 3
  %261 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %260
  %262 = load float, ptr addrspace(3) %261, align 4, !tbaa !19
  %263 = or disjoint i64 %241, 3
  %264 = getelementptr inbounds float, ptr %9, i64 %263
  store float %262, ptr %264, align 4, !tbaa !19
  br i1 %224, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %265 = trunc i64 %238 to i32
  %266 = or disjoint i32 %265, 4
  %267 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %266
  %268 = load float, ptr addrspace(3) %267, align 4, !tbaa !19
  %269 = or disjoint i64 %241, 4
  %270 = getelementptr inbounds float, ptr %9, i64 %269
  store float %268, ptr %270, align 16, !tbaa !19
  br i1 %225, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %271 = trunc i64 %238 to i32
  %272 = or disjoint i32 %271, 5
  %273 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %272
  %274 = load float, ptr addrspace(3) %273, align 4, !tbaa !19
  %275 = or disjoint i64 %241, 5
  %276 = getelementptr inbounds float, ptr %9, i64 %275
  store float %274, ptr %276, align 4, !tbaa !19
  br i1 %226, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %277 = trunc i64 %238 to i32
  %278 = or disjoint i32 %277, 6
  %279 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %278
  %280 = load float, ptr addrspace(3) %279, align 4, !tbaa !19
  %281 = or disjoint i64 %241, 6
  %282 = getelementptr inbounds float, ptr %9, i64 %281
  store float %280, ptr %282, align 8, !tbaa !19
  br i1 %227, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %283 = trunc i64 %238 to i32
  %284 = or disjoint i32 %283, 7
  %285 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %284
  %286 = load float, ptr addrspace(3) %285, align 4, !tbaa !19
  %287 = or disjoint i64 %241, 7
  %288 = getelementptr inbounds float, ptr %9, i64 %287
  store float %286, ptr %288, align 4, !tbaa !19
  br i1 %228, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %289 = trunc i64 %238 to i32
  %290 = or disjoint i32 %289, 8
  %291 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %290
  %292 = load float, ptr addrspace(3) %291, align 4, !tbaa !19
  %293 = or disjoint i64 %241, 8
  %294 = getelementptr inbounds float, ptr %9, i64 %293
  store float %292, ptr %294, align 32, !tbaa !19
  br i1 %229, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %295 = trunc i64 %238 to i32
  %296 = or disjoint i32 %295, 9
  %297 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %296
  %298 = load float, ptr addrspace(3) %297, align 4, !tbaa !19
  %299 = or disjoint i64 %241, 9
  %300 = getelementptr inbounds float, ptr %9, i64 %299
  store float %298, ptr %300, align 4, !tbaa !19
  br i1 %230, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %301 = trunc i64 %238 to i32
  %302 = or disjoint i32 %301, 10
  %303 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %302
  %304 = load float, ptr addrspace(3) %303, align 4, !tbaa !19
  %305 = or disjoint i64 %241, 10
  %306 = getelementptr inbounds float, ptr %9, i64 %305
  store float %304, ptr %306, align 8, !tbaa !19
  br i1 %231, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %307 = trunc i64 %238 to i32
  %308 = or disjoint i32 %307, 11
  %309 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %308
  %310 = load float, ptr addrspace(3) %309, align 4, !tbaa !19
  %311 = or disjoint i64 %241, 11
  %312 = getelementptr inbounds float, ptr %9, i64 %311
  store float %310, ptr %312, align 4, !tbaa !19
  br i1 %232, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %313 = trunc i64 %238 to i32
  %314 = or disjoint i32 %313, 12
  %315 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %314
  %316 = load float, ptr addrspace(3) %315, align 4, !tbaa !19
  %317 = or disjoint i64 %241, 12
  %318 = getelementptr inbounds float, ptr %9, i64 %317
  store float %316, ptr %318, align 16, !tbaa !19
  br i1 %233, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %319 = trunc i64 %238 to i32
  %320 = or disjoint i32 %319, 13
  %321 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %320
  %322 = load float, ptr addrspace(3) %321, align 4, !tbaa !19
  %323 = or disjoint i64 %241, 13
  %324 = getelementptr inbounds float, ptr %9, i64 %323
  store float %322, ptr %324, align 4, !tbaa !19
  br i1 %234, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %325 = trunc i64 %238 to i32
  %326 = or disjoint i32 %325, 14
  %327 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %326
  %328 = load float, ptr addrspace(3) %327, align 4, !tbaa !19
  %329 = or disjoint i64 %241, 14
  %330 = getelementptr inbounds float, ptr %9, i64 %329
  store float %328, ptr %330, align 8, !tbaa !19
  br i1 %235, label %331, label %.split.us.i

331:                                              ; preds = %.preheader.split.15.i
  %332 = trunc i64 %238 to i32
  %333 = or disjoint i32 %332, 15
  %334 = getelementptr inbounds float, ptr addrspace(3) %219, i32 %333
  %335 = load float, ptr addrspace(3) %334, align 4, !tbaa !19
  %336 = or disjoint i64 %241, 15
  %337 = getelementptr inbounds float, ptr %9, i64 %336
  store float %335, ptr %337, align 4, !tbaa !19
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge586.i, %.split.us.i
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
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{i64 0, i64 2, !24}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !21, i64 0}
!26 = distinct !{!26, !27, !28, !29}
!27 = !{!"llvm.loop.mustprogress"}
!28 = !{!"llvm.loop.vectorize.width", i32 1}
!29 = !{!"llvm.loop.interleave.count", i32 1}
!30 = distinct !{!30, !27, !28, !29}
!31 = distinct !{!31, !27, !28, !29}
!32 = distinct !{!32, !27, !28, !29}
!33 = distinct !{!33, !27}
!34 = distinct !{!34, !27}
;----------------- End AdaptiveCpp IR dump ---------------
