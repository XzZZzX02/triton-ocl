;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-6i3bnle6/kernel.cpp"
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
  %11 = icmp ult i64 %10, 44739242
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 48
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 44739243
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
  %33 = icmp ult i64 %32, 48
  call void @llvm.assume(i1 %33)
  %34 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %35 = inttoptr i32 %34 to ptr addrspace(3)
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i

.lr.ph573.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %37 = icmp ult i64 %36, 44739242
  call void @llvm.assume(i1 %37)
  %.tr.i = trunc i64 %36 to i32
  %38 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %39 = icmp eq i64 %38, 0
  call void @llvm.assume(i1 %39)
  %40 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %41 = icmp eq i64 %40, 0
  call void @llvm.assume(i1 %41)
  %42 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %43 = icmp ult i64 %42, 48
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
  store float 0.000000e+00, ptr addrspace(3) %55, align 4, !tbaa !19
  %56 = add nuw nsw i64 %53, 48
  %57 = icmp ult i64 %53, 80
  br i1 %57, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %.lr.ph573.i, !llvm.loop !23

.lr.ph576.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i
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
  %63 = icmp ult i64 %62, 48
  call void @llvm.assume(i1 %63)
  %64 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %65 = inttoptr i32 %64 to ptr addrspace(3)
  %66 = getelementptr inbounds i8, ptr addrspace(3) %65, i32 512
  %67 = getelementptr inbounds i8, ptr addrspace(3) %65, i32 1024
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i

68:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i, %.lr.ph573.i
  %69 = phi i64 [ %42, %.lr.ph573.i ], [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i ]
  %70 = lshr i64 %69, 3
  %71 = icmp slt i64 %70, %45
  %72 = and i1 %71, %52
  br i1 %72, label %73, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i

73:                                               ; preds = %68
  %74 = and i64 %69, 9223372036854775800
  %75 = or disjoint i64 %74, %47
  %76 = or disjoint i64 %75, %51
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0277.0.copyload.i = load i16, ptr %77, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit27.i.i.i: ; preds = %73, %68
  %.sroa.0279.1.i = phi i16 [ %.sroa.0277.0.copyload.i, %73 ], [ 0, %68 ]
  %78 = trunc i64 %69 to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %78
  store i16 %.sroa.0279.1.i, ptr addrspace(3) %79, align 2, !tbaa.struct !25
  %80 = add nuw nsw i64 %69, 48
  %81 = icmp ult i64 %69, 208
  br i1 %81, label %68, label %.lr.ph576.i, !llvm.loop !28

.lr.ph579.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
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
  %87 = icmp ult i64 %86, 48
  call void @llvm.assume(i1 %87)
  %88 = shl i32 %.tr.i, 9
  %89 = sext i32 %4 to i64
  %90 = sext i32 %5 to i64
  %91 = sext i32 %88 to i64
  %92 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %93 = inttoptr i32 %92 to ptr addrspace(3)
  %94 = getelementptr inbounds i8, ptr addrspace(3) %93, i32 1536
  br label %116

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph576.i
  %95 = phi i64 [ %62, %.lr.ph576.i ], [ %104, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %96 = lshr i64 %95, 5
  %97 = shl nuw nsw i64 %95, 3
  %98 = and i64 %97, 248
  %99 = or disjoint i64 %98, %96
  %100 = trunc i64 %99 to i32
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %66, i32 %100
  %.sroa.0340.0.copyload.i = load i16, ptr addrspace(3) %101, align 2, !tbaa.struct !25
  %102 = trunc i64 %95 to i32
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %67, i32 %102
  store i16 %.sroa.0340.0.copyload.i, ptr addrspace(3) %103, align 2, !tbaa.struct !25
  %104 = add nuw nsw i64 %95, 48
  %105 = icmp ult i64 %95, 208
  br i1 %105, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %.lr.ph579.i, !llvm.loop !31

.lr.ph582.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %106 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %107 = icmp eq i64 %106, 0
  call void @llvm.assume(i1 %107)
  %108 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %109 = icmp eq i64 %108, 0
  call void @llvm.assume(i1 %109)
  %110 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %111 = icmp ult i64 %110, 48
  call void @llvm.assume(i1 %111)
  %112 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %113 = inttoptr i32 %112 to ptr addrspace(3)
  %114 = getelementptr inbounds i8, ptr addrspace(3) %113, i32 1536
  %115 = getelementptr inbounds i8, ptr addrspace(3) %113, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i

116:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph579.i
  %117 = phi i64 [ %86, %.lr.ph579.i ], [ %130, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %118 = lshr i64 %117, 5
  %119 = and i64 %117, 31
  %120 = icmp slt i64 %118, %89
  %121 = icmp slt i64 %119, %90
  %122 = and i1 %120, %121
  br i1 %122, label %123, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

123:                                              ; preds = %116
  %124 = and i64 %117, 9223372036854775776
  %125 = or disjoint i64 %124, %91
  %126 = or disjoint i64 %125, %119
  %127 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %126
  %.sroa.0236.0.copyload.i = load i16, ptr %127, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %123, %116
  %.sroa.0238.1.i = phi i16 [ %.sroa.0236.0.copyload.i, %123 ], [ 0, %116 ]
  %128 = trunc i64 %117 to i32
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %128
  store i16 %.sroa.0238.1.i, ptr addrspace(3) %129, align 2, !tbaa.struct !25
  %130 = add nuw nsw i64 %117, 48
  %131 = icmp ult i64 %117, 464
  br i1 %131, label %116, label %.lr.ph582.i, !llvm.loop !32

.lr.ph585.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
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
  %137 = icmp ult i64 %136, 48
  call void @llvm.assume(i1 %137)
  %138 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %139 = inttoptr i32 %138 to ptr addrspace(3)
  %140 = getelementptr inbounds i8, ptr addrspace(3) %139, i32 1024
  %141 = getelementptr inbounds i8, ptr addrspace(3) %139, i32 2560
  %142 = and i64 %136, 15
  br label %157

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph582.i
  %143 = phi i64 [ %110, %.lr.ph582.i ], [ %152, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %144 = lshr i64 %143, 4
  %145 = shl nuw nsw i64 %143, 5
  %146 = and i64 %145, 480
  %147 = or disjoint i64 %146, %144
  %148 = trunc i64 %147 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %114, i32 %148
  %.sroa.0341.0.copyload.i = load i16, ptr addrspace(3) %149, align 2, !tbaa.struct !25
  %150 = trunc i64 %143 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %115, i32 %150
  store i16 %.sroa.0341.0.copyload.i, ptr addrspace(3) %151, align 2, !tbaa.struct !25
  %152 = add nuw nsw i64 %143, 48
  %153 = icmp ult i64 %143, 464
  br i1 %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %.lr.ph585.i, !llvm.loop !33

._crit_edge586.i:                                 ; preds = %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i17.i.i.preheader.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %155 = icmp ult i64 %154, 48
  call void @llvm.assume(i1 %155)
  %156 = icmp eq i64 %154, 0
  br i1 %156, label %218, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

157:                                              ; preds = %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i17.i.i.preheader.i, %.lr.ph585.i
  %158 = phi i64 [ %136, %.lr.ph585.i ], [ %216, %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i17.i.i.preheader.i ]
  %159 = shl nuw nsw i64 %158, 1
  %160 = and i64 %159, 224
  %161 = trunc i64 %158 to i32
  %162 = getelementptr inbounds float, ptr addrspace(3) %139, i32 %161
  %.pre.i = load float, ptr addrspace(3) %162, align 4, !tbaa !19
  br label %163

163:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %157
  %164 = phi float [ %.pre.i, %157 ], [ %214, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %165 = phi i64 [ 0, %157 ], [ %215, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %166 = add nuw nsw i64 %165, %160
  %167 = trunc i64 %166 to i32
  %168 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %167
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %168, align 2, !tbaa.struct !25
  %169 = shl nuw nsw i64 %165, 4
  %170 = or disjoint i64 %169, %142
  %171 = trunc i64 %170 to i32
  %172 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %171
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %172, align 2, !tbaa.struct !25
  %173 = zext i16 %.sroa.0195.0.copyload.i to i32
  %174 = lshr i32 %173, 10
  %175 = and i32 %174, 31
  %176 = and i32 %173, 1023
  switch i32 %175, label %182 [
    i32 31, label %177
    i32 0, label %184
  ]

177:                                              ; preds = %163
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %178 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not560.i = icmp eq i32 %176, 0
  %179 = select i1 %.not560.i, i32 2139095040, i32 2143289344
  %180 = or disjoint i32 %179, %178
  %181 = bitcast i32 %180 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

182:                                              ; preds = %163
  %183 = or disjoint i32 %176, 1024
  br label %184

184:                                              ; preds = %182, %163
  %185 = phi i32 [ %183, %182 ], [ %176, %163 ]
  %186 = uitofp i32 %185 to float
  %.not.i = icmp eq i32 %175, 0
  %187 = add nsw i32 %175, -25
  %188 = select i1 %.not.i, i32 -24, i32 %187
  %189 = call float @__ocml_ldexp_f32(float noundef %186, i32 noundef %188) #5
  %190 = fneg contract float %189
  %.not554555.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %191 = select contract i1 %.not554555.i, float %190, float %189
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %184, %177
  %192 = phi float [ %181, %177 ], [ %191, %184 ]
  %193 = zext i16 %.sroa.0186.0.copyload.i to i32
  %194 = lshr i32 %193, 10
  %195 = and i32 %194, 31
  %196 = and i32 %193, 1023
  switch i32 %195, label %202 [
    i32 31, label %197
    i32 0, label %204
  ]

197:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %198 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not559.i = icmp eq i32 %196, 0
  %199 = select i1 %.not559.i, i32 2139095040, i32 2143289344
  %200 = or disjoint i32 %199, %198
  %201 = bitcast i32 %200 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

202:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %203 = or disjoint i32 %196, 1024
  br label %204

204:                                              ; preds = %202, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %205 = phi i32 [ %203, %202 ], [ %196, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %206 = uitofp i32 %205 to float
  %.not556.i = icmp eq i32 %195, 0
  %207 = add nsw i32 %195, -25
  %208 = select i1 %.not556.i, i32 -24, i32 %207
  %209 = call float @__ocml_ldexp_f32(float noundef %206, i32 noundef %208) #5
  %210 = fneg contract float %209
  %.not557558.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %211 = select contract i1 %.not557558.i, float %210, float %209
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %204, %197
  %212 = phi float [ %201, %197 ], [ %211, %204 ]
  %213 = fmul contract float %192, %212
  %214 = fadd contract float %164, %213
  store float %214, ptr addrspace(3) %162, align 4, !tbaa !19
  %215 = add nuw nsw i64 %165, 1
  %exitcond.not.i = icmp eq i64 %215, 32
  br i1 %exitcond.not.i, label %_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i17.i.i.preheader.i, label %163, !llvm.loop !34

_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm.exit.i17.i.i.preheader.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %216 = add nuw nsw i64 %158, 48
  %217 = icmp ult i64 %158, 80
  br i1 %217, label %157, label %._crit_edge586.i, !llvm.loop !35

218:                                              ; preds = %._crit_edge586.i
  %219 = shl i32 %.tr.i, 7
  %220 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %221 = icmp eq i64 %220, 0
  call void @llvm.assume(i1 %221)
  %222 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %223 = icmp eq i64 %222, 0
  call void @llvm.assume(i1 %223)
  %224 = sext i32 %3 to i64
  %225 = call i32 @llvm.amdgcn.groupstaticsize()
  %226 = inttoptr i32 %225 to ptr addrspace(3)
  %227 = sext i32 %219 to i64
  %228 = icmp sgt i32 %4, 0
  %229 = icmp ugt i32 %4, 1
  %230 = icmp ugt i32 %4, 2
  %231 = icmp ugt i32 %4, 3
  %232 = icmp ugt i32 %4, 4
  %233 = icmp ugt i32 %4, 5
  %234 = icmp ugt i32 %4, 6
  %235 = icmp ugt i32 %4, 7
  %236 = icmp ugt i32 %4, 8
  %237 = icmp ugt i32 %4, 9
  %238 = icmp ugt i32 %4, 10
  %239 = icmp ugt i32 %4, 11
  %240 = icmp ugt i32 %4, 12
  %241 = icmp ugt i32 %4, 13
  %242 = icmp ugt i32 %4, 14
  %243 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %218
  %244 = phi i64 [ 0, %218 ], [ %250, %.split.us.i ]
  %245 = icmp slt i64 %244, %224
  %246 = shl i64 %244, 4
  %.tr553.i = trunc i64 %244 to i32
  %247 = shl i32 %.tr553.i, 4
  %248 = sext i32 %247 to i64
  %249 = add nsw i64 %248, %227
  %.fr.i = freeze i1 %245
  %brmerge.not.i = select i1 %.fr.i, i1 %228, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %339, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %250 = add nuw nsw i64 %244, 1
  %exitcond589.not.i = icmp eq i64 %250, 8
  br i1 %exitcond589.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %251 = trunc i64 %246 to i32
  %252 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %251
  %253 = load float, ptr addrspace(3) %252, align 4, !tbaa !19
  %254 = getelementptr inbounds float, ptr %9, i64 %249
  store float %253, ptr %254, align 32, !tbaa !19
  br i1 %229, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %255 = trunc i64 %246 to i32
  %256 = or disjoint i32 %255, 1
  %257 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %256
  %258 = load float, ptr addrspace(3) %257, align 4, !tbaa !19
  %259 = or disjoint i64 %249, 1
  %260 = getelementptr inbounds float, ptr %9, i64 %259
  store float %258, ptr %260, align 4, !tbaa !19
  br i1 %230, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %261 = trunc i64 %246 to i32
  %262 = or disjoint i32 %261, 2
  %263 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %262
  %264 = load float, ptr addrspace(3) %263, align 4, !tbaa !19
  %265 = or disjoint i64 %249, 2
  %266 = getelementptr inbounds float, ptr %9, i64 %265
  store float %264, ptr %266, align 8, !tbaa !19
  br i1 %231, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %267 = trunc i64 %246 to i32
  %268 = or disjoint i32 %267, 3
  %269 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %268
  %270 = load float, ptr addrspace(3) %269, align 4, !tbaa !19
  %271 = or disjoint i64 %249, 3
  %272 = getelementptr inbounds float, ptr %9, i64 %271
  store float %270, ptr %272, align 4, !tbaa !19
  br i1 %232, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %273 = trunc i64 %246 to i32
  %274 = or disjoint i32 %273, 4
  %275 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %274
  %276 = load float, ptr addrspace(3) %275, align 4, !tbaa !19
  %277 = or disjoint i64 %249, 4
  %278 = getelementptr inbounds float, ptr %9, i64 %277
  store float %276, ptr %278, align 16, !tbaa !19
  br i1 %233, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %279 = trunc i64 %246 to i32
  %280 = or disjoint i32 %279, 5
  %281 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %280
  %282 = load float, ptr addrspace(3) %281, align 4, !tbaa !19
  %283 = or disjoint i64 %249, 5
  %284 = getelementptr inbounds float, ptr %9, i64 %283
  store float %282, ptr %284, align 4, !tbaa !19
  br i1 %234, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %285 = trunc i64 %246 to i32
  %286 = or disjoint i32 %285, 6
  %287 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %286
  %288 = load float, ptr addrspace(3) %287, align 4, !tbaa !19
  %289 = or disjoint i64 %249, 6
  %290 = getelementptr inbounds float, ptr %9, i64 %289
  store float %288, ptr %290, align 8, !tbaa !19
  br i1 %235, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %291 = trunc i64 %246 to i32
  %292 = or disjoint i32 %291, 7
  %293 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %292
  %294 = load float, ptr addrspace(3) %293, align 4, !tbaa !19
  %295 = or disjoint i64 %249, 7
  %296 = getelementptr inbounds float, ptr %9, i64 %295
  store float %294, ptr %296, align 4, !tbaa !19
  br i1 %236, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %297 = trunc i64 %246 to i32
  %298 = or disjoint i32 %297, 8
  %299 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %298
  %300 = load float, ptr addrspace(3) %299, align 4, !tbaa !19
  %301 = or disjoint i64 %249, 8
  %302 = getelementptr inbounds float, ptr %9, i64 %301
  store float %300, ptr %302, align 32, !tbaa !19
  br i1 %237, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %303 = trunc i64 %246 to i32
  %304 = or disjoint i32 %303, 9
  %305 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %304
  %306 = load float, ptr addrspace(3) %305, align 4, !tbaa !19
  %307 = or disjoint i64 %249, 9
  %308 = getelementptr inbounds float, ptr %9, i64 %307
  store float %306, ptr %308, align 4, !tbaa !19
  br i1 %238, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %309 = trunc i64 %246 to i32
  %310 = or disjoint i32 %309, 10
  %311 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !19
  %313 = or disjoint i64 %249, 10
  %314 = getelementptr inbounds float, ptr %9, i64 %313
  store float %312, ptr %314, align 8, !tbaa !19
  br i1 %239, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %315 = trunc i64 %246 to i32
  %316 = or disjoint i32 %315, 11
  %317 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %316
  %318 = load float, ptr addrspace(3) %317, align 4, !tbaa !19
  %319 = or disjoint i64 %249, 11
  %320 = getelementptr inbounds float, ptr %9, i64 %319
  store float %318, ptr %320, align 4, !tbaa !19
  br i1 %240, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %321 = trunc i64 %246 to i32
  %322 = or disjoint i32 %321, 12
  %323 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %322
  %324 = load float, ptr addrspace(3) %323, align 4, !tbaa !19
  %325 = or disjoint i64 %249, 12
  %326 = getelementptr inbounds float, ptr %9, i64 %325
  store float %324, ptr %326, align 16, !tbaa !19
  br i1 %241, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %327 = trunc i64 %246 to i32
  %328 = or disjoint i32 %327, 13
  %329 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %328
  %330 = load float, ptr addrspace(3) %329, align 4, !tbaa !19
  %331 = or disjoint i64 %249, 13
  %332 = getelementptr inbounds float, ptr %9, i64 %331
  store float %330, ptr %332, align 4, !tbaa !19
  br i1 %242, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %333 = trunc i64 %246 to i32
  %334 = or disjoint i32 %333, 14
  %335 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %334
  %336 = load float, ptr addrspace(3) %335, align 4, !tbaa !19
  %337 = or disjoint i64 %249, 14
  %338 = getelementptr inbounds float, ptr %9, i64 %337
  store float %336, ptr %338, align 8, !tbaa !19
  br i1 %243, label %339, label %.split.us.i

339:                                              ; preds = %.preheader.split.15.i
  %340 = trunc i64 %246 to i32
  %341 = or disjoint i32 %340, 15
  %342 = getelementptr inbounds float, ptr addrspace(3) %226, i32 %341
  %343 = load float, ptr addrspace(3) %342, align 4, !tbaa !19
  %344 = or disjoint i64 %249, 15
  %345 = getelementptr inbounds float, ptr %9, i64 %344
  store float %343, ptr %345, align 4, !tbaa !19
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
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="48,48" }
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
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{i64 0, i64 2, !26}
!26 = !{!27, !27, i64 0}
!27 = !{!"short", !21, i64 0}
!28 = distinct !{!28, !24, !29, !30}
!29 = !{!"llvm.loop.vectorize.width", i32 1}
!30 = !{!"llvm.loop.interleave.count", i32 1}
!31 = distinct !{!31, !24, !29, !30}
!32 = distinct !{!32, !24, !29, !30}
!33 = distinct !{!33, !24, !29, !30}
!34 = distinct !{!34, !24}
!35 = distinct !{!35, !24}
!36 = distinct !{!36, !24}
;----------------- End AdaptiveCpp IR dump ---------------
