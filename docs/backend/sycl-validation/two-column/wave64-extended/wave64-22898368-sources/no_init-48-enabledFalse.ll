;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-v_lxrjcp/kernel.cpp"
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

.lr.ph768.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i
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
  br i1 %57, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit.i.i.i, label %.lr.ph768.i, !llvm.loop !23

.lr.ph771.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i
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

68:                                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i, %.lr.ph768.i
  %69 = phi i64 [ %42, %.lr.ph768.i ], [ %80, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i ]
  %70 = lshr i64 %69, 3
  %71 = icmp slt i64 %70, %45
  %72 = and i1 %71, %52
  br i1 %72, label %73, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i

73:                                               ; preds = %68
  %74 = and i64 %69, 9223372036854775800
  %75 = or disjoint i64 %74, %47
  %76 = or disjoint i64 %75, %51
  %77 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %76
  %.sroa.0331.0.copyload.i = load i16, ptr %77, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit33.i.i.i: ; preds = %73, %68
  %.sroa.0333.1.i = phi i16 [ %.sroa.0331.0.copyload.i, %73 ], [ 0, %68 ]
  %78 = trunc i64 %69 to i32
  %79 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %50, i32 %78
  store i16 %.sroa.0333.1.i, ptr addrspace(3) %79, align 2, !tbaa.struct !25
  %80 = add nuw nsw i64 %69, 48
  %81 = icmp ult i64 %69, 208
  br i1 %81, label %68, label %.lr.ph771.i, !llvm.loop !28

.lr.ph774.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, %.lr.ph771.i
  %95 = phi i64 [ %62, %.lr.ph771.i ], [ %104, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i ]
  %96 = lshr i64 %95, 5
  %97 = shl nuw nsw i64 %95, 3
  %98 = and i64 %97, 248
  %99 = or disjoint i64 %98, %96
  %100 = trunc i64 %99 to i32
  %101 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %66, i32 %100
  %.sroa.0418.0.copyload.i = load i16, ptr addrspace(3) %101, align 2, !tbaa.struct !25
  %102 = trunc i64 %95 to i32
  %103 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %67, i32 %102
  store i16 %.sroa.0418.0.copyload.i, ptr addrspace(3) %103, align 2, !tbaa.struct !25
  %104 = add nuw nsw i64 %95, 48
  %105 = icmp ult i64 %95, 208
  br i1 %105, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit8.i.i.i, label %.lr.ph774.i, !llvm.loop !31

.lr.ph777.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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

116:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph774.i
  %117 = phi i64 [ %86, %.lr.ph774.i ], [ %130, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
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
  %.sroa.0290.0.copyload.i = load i16, ptr %127, align 2, !tbaa.struct !25
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %123, %116
  %.sroa.0292.1.i = phi i16 [ %.sroa.0290.0.copyload.i, %123 ], [ 0, %116 ]
  %128 = trunc i64 %117 to i32
  %129 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %94, i32 %128
  store i16 %.sroa.0292.1.i, ptr addrspace(3) %129, align 2, !tbaa.struct !25
  %130 = add nuw nsw i64 %117, 48
  %131 = icmp ult i64 %117, 464
  br i1 %131, label %116, label %.lr.ph777.i, !llvm.loop !32

.lr.ph780.i:                                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
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

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph777.i
  %143 = phi i64 [ %110, %.lr.ph777.i ], [ %152, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %144 = lshr i64 %143, 4
  %145 = shl nuw nsw i64 %143, 5
  %146 = and i64 %145, 480
  %147 = or disjoint i64 %146, %144
  %148 = trunc i64 %147 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %114, i32 %148
  %.sroa.0419.0.copyload.i = load i16, ptr addrspace(3) %149, align 2, !tbaa.struct !25
  %150 = trunc i64 %143 to i32
  %151 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %115, i32 %150
  store i16 %.sroa.0419.0.copyload.i, ptr addrspace(3) %151, align 2, !tbaa.struct !25
  %152 = add nuw nsw i64 %143, 48
  %153 = icmp ult i64 %143, 464
  br i1 %153, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %.lr.ph780.i, !llvm.loop !33

._crit_edge781.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i
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
  br i1 %156, label %370, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

157:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i, %.lr.ph780.i
  %158 = phi i64 [ %136, %.lr.ph780.i ], [ %164, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i ]
  %159 = trunc i64 %158 to i32
  %160 = getelementptr inbounds float, ptr addrspace(3) %139, i32 %159
  %161 = load float, ptr addrspace(3) %160, align 4, !tbaa !19
  %162 = shl nuw nsw i64 %158, 1
  %163 = and i64 %162, 224
  br label %166

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  store float %367, ptr addrspace(3) %160, align 4, !tbaa !19
  %164 = add nuw nsw i64 %158, 48
  %165 = icmp ult i64 %158, 80
  br i1 %165, label %157, label %._crit_edge781.i, !llvm.loop !34

166:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %157
  %167 = phi i64 [ 0, %157 ], [ %368, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %168 = phi float [ %161, %157 ], [ %367, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %169 = add nuw nsw i64 %167, %163
  %170 = trunc i64 %169 to i32
  %171 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %170
  %.sroa.0243.0.copyload.i = load i16, ptr addrspace(3) %171, align 2, !tbaa.struct !25
  %172 = shl nuw nsw i64 %167, 4
  %173 = or disjoint i64 %172, %142
  %174 = trunc i64 %173 to i32
  %175 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %174
  %.sroa.0234.0.copyload.i = load i16, ptr addrspace(3) %175, align 2, !tbaa.struct !25
  %176 = zext i16 %.sroa.0243.0.copyload.i to i32
  %177 = lshr i32 %176, 10
  %178 = and i32 %177, 31
  %179 = and i32 %176, 1023
  switch i32 %178, label %185 [
    i32 31, label %180
    i32 0, label %187
  ]

180:                                              ; preds = %166
  %.sroa.0243.0.copyload.signext.i = sext i16 %.sroa.0243.0.copyload.i to i32
  %181 = and i32 %.sroa.0243.0.copyload.signext.i, -2147483648
  %.not756.i = icmp eq i32 %179, 0
  %182 = select i1 %.not756.i, i32 2139095040, i32 2143289344
  %183 = or disjoint i32 %182, %181
  %184 = bitcast i32 %183 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

185:                                              ; preds = %166
  %186 = or disjoint i32 %179, 1024
  br label %187

187:                                              ; preds = %185, %166
  %188 = phi i32 [ %186, %185 ], [ %179, %166 ]
  %189 = uitofp i32 %188 to float
  %.not.i = icmp eq i32 %178, 0
  %190 = add nsw i32 %178, -25
  %191 = select i1 %.not.i, i32 -24, i32 %190
  %192 = call float @__ocml_ldexp_f32(float noundef %189, i32 noundef %191) #5
  %193 = fneg contract float %192
  %.not726727.i = icmp slt i16 %.sroa.0243.0.copyload.i, 0
  %194 = select contract i1 %.not726727.i, float %193, float %192
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %187, %180
  %195 = phi float [ %184, %180 ], [ %194, %187 ]
  %196 = zext i16 %.sroa.0234.0.copyload.i to i32
  %197 = lshr i32 %196, 10
  %198 = and i32 %197, 31
  %199 = and i32 %196, 1023
  switch i32 %198, label %205 [
    i32 31, label %200
    i32 0, label %207
  ]

200:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0234.0.copyload.signext.i = sext i16 %.sroa.0234.0.copyload.i to i32
  %201 = and i32 %.sroa.0234.0.copyload.signext.i, -2147483648
  %.not755.i = icmp eq i32 %199, 0
  %202 = select i1 %.not755.i, i32 2139095040, i32 2143289344
  %203 = or disjoint i32 %202, %201
  %204 = bitcast i32 %203 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

205:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %206 = or disjoint i32 %199, 1024
  br label %207

207:                                              ; preds = %205, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %208 = phi i32 [ %206, %205 ], [ %199, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %209 = uitofp i32 %208 to float
  %.not728.i = icmp eq i32 %198, 0
  %210 = add nsw i32 %198, -25
  %211 = select i1 %.not728.i, i32 -24, i32 %210
  %212 = call float @__ocml_ldexp_f32(float noundef %209, i32 noundef %211) #5
  %213 = fneg contract float %212
  %.not729730.i = icmp slt i16 %.sroa.0234.0.copyload.i, 0
  %214 = select contract i1 %.not729730.i, float %213, float %212
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %207, %200
  %215 = phi float [ %204, %200 ], [ %214, %207 ]
  %216 = fmul contract float %195, %215
  %217 = fadd contract float %168, %216
  %218 = or disjoint i64 %167, 1
  %219 = add nuw nsw i64 %218, %163
  %220 = trunc i64 %219 to i32
  %221 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %220
  %.sroa.0225.0.copyload.i = load i16, ptr addrspace(3) %221, align 2, !tbaa.struct !25
  %222 = shl nuw nsw i64 %218, 4
  %223 = or disjoint i64 %222, %142
  %224 = trunc i64 %223 to i32
  %225 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %224
  %.sroa.0216.0.copyload.i = load i16, ptr addrspace(3) %225, align 2, !tbaa.struct !25
  %226 = zext i16 %.sroa.0225.0.copyload.i to i32
  %227 = lshr i32 %226, 10
  %228 = and i32 %227, 31
  %229 = and i32 %226, 1023
  switch i32 %228, label %235 [
    i32 31, label %230
    i32 0, label %237
  ]

230:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0225.0.copyload.signext.i = sext i16 %.sroa.0225.0.copyload.i to i32
  %231 = and i32 %.sroa.0225.0.copyload.signext.i, -2147483648
  %.not754.i = icmp eq i32 %229, 0
  %232 = select i1 %.not754.i, i32 2139095040, i32 2143289344
  %233 = or disjoint i32 %232, %231
  %234 = bitcast i32 %233 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

235:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %236 = or disjoint i32 %229, 1024
  br label %237

237:                                              ; preds = %235, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %238 = phi i32 [ %236, %235 ], [ %229, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %239 = uitofp i32 %238 to float
  %.not731.i = icmp eq i32 %228, 0
  %240 = add nsw i32 %228, -25
  %241 = select i1 %.not731.i, i32 -24, i32 %240
  %242 = call float @__ocml_ldexp_f32(float noundef %239, i32 noundef %241) #5
  %243 = fneg contract float %242
  %.not732733.i = icmp slt i16 %.sroa.0225.0.copyload.i, 0
  %244 = select contract i1 %.not732733.i, float %243, float %242
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %237, %230
  %245 = phi float [ %234, %230 ], [ %244, %237 ]
  %246 = zext i16 %.sroa.0216.0.copyload.i to i32
  %247 = lshr i32 %246, 10
  %248 = and i32 %247, 31
  %249 = and i32 %246, 1023
  switch i32 %248, label %255 [
    i32 31, label %250
    i32 0, label %257
  ]

250:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0216.0.copyload.signext.i = sext i16 %.sroa.0216.0.copyload.i to i32
  %251 = and i32 %.sroa.0216.0.copyload.signext.i, -2147483648
  %.not753.i = icmp eq i32 %249, 0
  %252 = select i1 %.not753.i, i32 2139095040, i32 2143289344
  %253 = or disjoint i32 %252, %251
  %254 = bitcast i32 %253 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

255:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %256 = or disjoint i32 %249, 1024
  br label %257

257:                                              ; preds = %255, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %258 = phi i32 [ %256, %255 ], [ %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %259 = uitofp i32 %258 to float
  %.not734.i = icmp eq i32 %248, 0
  %260 = add nsw i32 %248, -25
  %261 = select i1 %.not734.i, i32 -24, i32 %260
  %262 = call float @__ocml_ldexp_f32(float noundef %259, i32 noundef %261) #5
  %263 = fneg contract float %262
  %.not735736.i = icmp slt i16 %.sroa.0216.0.copyload.i, 0
  %264 = select contract i1 %.not735736.i, float %263, float %262
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %257, %250
  %265 = phi float [ %254, %250 ], [ %264, %257 ]
  %266 = fmul contract float %245, %265
  %267 = fadd contract float %217, %266
  %268 = or disjoint i64 %167, 2
  %269 = add nuw nsw i64 %268, %163
  %270 = trunc i64 %269 to i32
  %271 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %270
  %.sroa.0207.0.copyload.i = load i16, ptr addrspace(3) %271, align 2, !tbaa.struct !25
  %272 = shl nuw nsw i64 %268, 4
  %273 = or disjoint i64 %272, %142
  %274 = trunc i64 %273 to i32
  %275 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %274
  %.sroa.0198.0.copyload.i = load i16, ptr addrspace(3) %275, align 2, !tbaa.struct !25
  %276 = zext i16 %.sroa.0207.0.copyload.i to i32
  %277 = lshr i32 %276, 10
  %278 = and i32 %277, 31
  %279 = and i32 %276, 1023
  switch i32 %278, label %285 [
    i32 31, label %280
    i32 0, label %287
  ]

280:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0207.0.copyload.signext.i = sext i16 %.sroa.0207.0.copyload.i to i32
  %281 = and i32 %.sroa.0207.0.copyload.signext.i, -2147483648
  %.not752.i = icmp eq i32 %279, 0
  %282 = select i1 %.not752.i, i32 2139095040, i32 2143289344
  %283 = or disjoint i32 %282, %281
  %284 = bitcast i32 %283 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

285:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %286 = or disjoint i32 %279, 1024
  br label %287

287:                                              ; preds = %285, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %288 = phi i32 [ %286, %285 ], [ %279, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %289 = uitofp i32 %288 to float
  %.not737.i = icmp eq i32 %278, 0
  %290 = add nsw i32 %278, -25
  %291 = select i1 %.not737.i, i32 -24, i32 %290
  %292 = call float @__ocml_ldexp_f32(float noundef %289, i32 noundef %291) #5
  %293 = fneg contract float %292
  %.not738739.i = icmp slt i16 %.sroa.0207.0.copyload.i, 0
  %294 = select contract i1 %.not738739.i, float %293, float %292
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %287, %280
  %295 = phi float [ %284, %280 ], [ %294, %287 ]
  %296 = zext i16 %.sroa.0198.0.copyload.i to i32
  %297 = lshr i32 %296, 10
  %298 = and i32 %297, 31
  %299 = and i32 %296, 1023
  switch i32 %298, label %305 [
    i32 31, label %300
    i32 0, label %307
  ]

300:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0198.0.copyload.signext.i = sext i16 %.sroa.0198.0.copyload.i to i32
  %301 = and i32 %.sroa.0198.0.copyload.signext.i, -2147483648
  %.not751.i = icmp eq i32 %299, 0
  %302 = select i1 %.not751.i, i32 2139095040, i32 2143289344
  %303 = or disjoint i32 %302, %301
  %304 = bitcast i32 %303 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

305:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %306 = or disjoint i32 %299, 1024
  br label %307

307:                                              ; preds = %305, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %308 = phi i32 [ %306, %305 ], [ %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %309 = uitofp i32 %308 to float
  %.not740.i = icmp eq i32 %298, 0
  %310 = add nsw i32 %298, -25
  %311 = select i1 %.not740.i, i32 -24, i32 %310
  %312 = call float @__ocml_ldexp_f32(float noundef %309, i32 noundef %311) #5
  %313 = fneg contract float %312
  %.not741742.i = icmp slt i16 %.sroa.0198.0.copyload.i, 0
  %314 = select contract i1 %.not741742.i, float %313, float %312
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %307, %300
  %315 = phi float [ %304, %300 ], [ %314, %307 ]
  %316 = fmul contract float %295, %315
  %317 = fadd contract float %267, %316
  %318 = or disjoint i64 %167, 3
  %319 = add nuw nsw i64 %318, %163
  %320 = trunc i64 %319 to i32
  %321 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %140, i32 %320
  %.sroa.0189.0.copyload.i = load i16, ptr addrspace(3) %321, align 2, !tbaa.struct !25
  %322 = shl nuw nsw i64 %318, 4
  %323 = or disjoint i64 %322, %142
  %324 = trunc i64 %323 to i32
  %325 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %141, i32 %324
  %.sroa.0180.0.copyload.i = load i16, ptr addrspace(3) %325, align 2, !tbaa.struct !25
  %326 = zext i16 %.sroa.0189.0.copyload.i to i32
  %327 = lshr i32 %326, 10
  %328 = and i32 %327, 31
  %329 = and i32 %326, 1023
  switch i32 %328, label %335 [
    i32 31, label %330
    i32 0, label %337
  ]

330:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0189.0.copyload.signext.i = sext i16 %.sroa.0189.0.copyload.i to i32
  %331 = and i32 %.sroa.0189.0.copyload.signext.i, -2147483648
  %.not750.i = icmp eq i32 %329, 0
  %332 = select i1 %.not750.i, i32 2139095040, i32 2143289344
  %333 = or disjoint i32 %332, %331
  %334 = bitcast i32 %333 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

335:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %336 = or disjoint i32 %329, 1024
  br label %337

337:                                              ; preds = %335, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %338 = phi i32 [ %336, %335 ], [ %329, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %339 = uitofp i32 %338 to float
  %.not743.i = icmp eq i32 %328, 0
  %340 = add nsw i32 %328, -25
  %341 = select i1 %.not743.i, i32 -24, i32 %340
  %342 = call float @__ocml_ldexp_f32(float noundef %339, i32 noundef %341) #5
  %343 = fneg contract float %342
  %.not744745.i = icmp slt i16 %.sroa.0189.0.copyload.i, 0
  %344 = select contract i1 %.not744745.i, float %343, float %342
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %337, %330
  %345 = phi float [ %334, %330 ], [ %344, %337 ]
  %346 = zext i16 %.sroa.0180.0.copyload.i to i32
  %347 = lshr i32 %346, 10
  %348 = and i32 %347, 31
  %349 = and i32 %346, 1023
  switch i32 %348, label %355 [
    i32 31, label %350
    i32 0, label %357
  ]

350:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0180.0.copyload.signext.i = sext i16 %.sroa.0180.0.copyload.i to i32
  %351 = and i32 %.sroa.0180.0.copyload.signext.i, -2147483648
  %.not749.i = icmp eq i32 %349, 0
  %352 = select i1 %.not749.i, i32 2139095040, i32 2143289344
  %353 = or disjoint i32 %352, %351
  %354 = bitcast i32 %353 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

355:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %356 = or disjoint i32 %349, 1024
  br label %357

357:                                              ; preds = %355, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %358 = phi i32 [ %356, %355 ], [ %349, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %359 = uitofp i32 %358 to float
  %.not746.i = icmp eq i32 %348, 0
  %360 = add nsw i32 %348, -25
  %361 = select i1 %.not746.i, i32 -24, i32 %360
  %362 = call float @__ocml_ldexp_f32(float noundef %359, i32 noundef %361) #5
  %363 = fneg contract float %362
  %.not747748.i = icmp slt i16 %.sroa.0180.0.copyload.i, 0
  %364 = select contract i1 %.not747748.i, float %363, float %362
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %357, %350
  %365 = phi float [ %354, %350 ], [ %364, %357 ]
  %366 = fmul contract float %345, %365
  %367 = fadd contract float %317, %366
  %368 = add nuw nsw i64 %167, 4
  %369 = icmp ult i64 %167, 28
  br i1 %369, label %166, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit18.i.i.i, !llvm.loop !35

370:                                              ; preds = %._crit_edge781.i
  %371 = shl i32 %.tr.i, 7
  %372 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %373 = icmp eq i64 %372, 0
  call void @llvm.assume(i1 %373)
  %374 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %375 = icmp eq i64 %374, 0
  call void @llvm.assume(i1 %375)
  %376 = sext i32 %3 to i64
  %377 = call i32 @llvm.amdgcn.groupstaticsize()
  %378 = inttoptr i32 %377 to ptr addrspace(3)
  %379 = sext i32 %371 to i64
  %380 = icmp sgt i32 %4, 0
  %381 = icmp ugt i32 %4, 1
  %382 = icmp ugt i32 %4, 2
  %383 = icmp ugt i32 %4, 3
  %384 = icmp ugt i32 %4, 4
  %385 = icmp ugt i32 %4, 5
  %386 = icmp ugt i32 %4, 6
  %387 = icmp ugt i32 %4, 7
  %388 = icmp ugt i32 %4, 8
  %389 = icmp ugt i32 %4, 9
  %390 = icmp ugt i32 %4, 10
  %391 = icmp ugt i32 %4, 11
  %392 = icmp ugt i32 %4, 12
  %393 = icmp ugt i32 %4, 13
  %394 = icmp ugt i32 %4, 14
  %395 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %370
  %396 = phi i64 [ 0, %370 ], [ %402, %.split.us.i ]
  %397 = icmp slt i64 %396, %376
  %398 = shl i64 %396, 4
  %.tr725.i = trunc i64 %396 to i32
  %399 = shl i32 %.tr725.i, 4
  %400 = sext i32 %399 to i64
  %401 = add nsw i64 %400, %379
  %.fr.i = freeze i1 %397
  %brmerge.not.i = select i1 %.fr.i, i1 %380, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %491, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %402 = add nuw nsw i64 %396, 1
  %exitcond.not.i = icmp eq i64 %402, 8
  br i1 %exitcond.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !36

.preheader.split.1.i:                             ; preds = %.preheader.i
  %403 = trunc i64 %398 to i32
  %404 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %403
  %405 = load float, ptr addrspace(3) %404, align 4, !tbaa !19
  %406 = getelementptr inbounds float, ptr %9, i64 %401
  store float %405, ptr %406, align 32, !tbaa !19
  br i1 %381, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %407 = trunc i64 %398 to i32
  %408 = or disjoint i32 %407, 1
  %409 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %408
  %410 = load float, ptr addrspace(3) %409, align 4, !tbaa !19
  %411 = or disjoint i64 %401, 1
  %412 = getelementptr inbounds float, ptr %9, i64 %411
  store float %410, ptr %412, align 4, !tbaa !19
  br i1 %382, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %413 = trunc i64 %398 to i32
  %414 = or disjoint i32 %413, 2
  %415 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %414
  %416 = load float, ptr addrspace(3) %415, align 4, !tbaa !19
  %417 = or disjoint i64 %401, 2
  %418 = getelementptr inbounds float, ptr %9, i64 %417
  store float %416, ptr %418, align 8, !tbaa !19
  br i1 %383, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %419 = trunc i64 %398 to i32
  %420 = or disjoint i32 %419, 3
  %421 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %420
  %422 = load float, ptr addrspace(3) %421, align 4, !tbaa !19
  %423 = or disjoint i64 %401, 3
  %424 = getelementptr inbounds float, ptr %9, i64 %423
  store float %422, ptr %424, align 4, !tbaa !19
  br i1 %384, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %425 = trunc i64 %398 to i32
  %426 = or disjoint i32 %425, 4
  %427 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %426
  %428 = load float, ptr addrspace(3) %427, align 4, !tbaa !19
  %429 = or disjoint i64 %401, 4
  %430 = getelementptr inbounds float, ptr %9, i64 %429
  store float %428, ptr %430, align 16, !tbaa !19
  br i1 %385, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %431 = trunc i64 %398 to i32
  %432 = or disjoint i32 %431, 5
  %433 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %432
  %434 = load float, ptr addrspace(3) %433, align 4, !tbaa !19
  %435 = or disjoint i64 %401, 5
  %436 = getelementptr inbounds float, ptr %9, i64 %435
  store float %434, ptr %436, align 4, !tbaa !19
  br i1 %386, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %437 = trunc i64 %398 to i32
  %438 = or disjoint i32 %437, 6
  %439 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %438
  %440 = load float, ptr addrspace(3) %439, align 4, !tbaa !19
  %441 = or disjoint i64 %401, 6
  %442 = getelementptr inbounds float, ptr %9, i64 %441
  store float %440, ptr %442, align 8, !tbaa !19
  br i1 %387, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %443 = trunc i64 %398 to i32
  %444 = or disjoint i32 %443, 7
  %445 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %444
  %446 = load float, ptr addrspace(3) %445, align 4, !tbaa !19
  %447 = or disjoint i64 %401, 7
  %448 = getelementptr inbounds float, ptr %9, i64 %447
  store float %446, ptr %448, align 4, !tbaa !19
  br i1 %388, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %449 = trunc i64 %398 to i32
  %450 = or disjoint i32 %449, 8
  %451 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %450
  %452 = load float, ptr addrspace(3) %451, align 4, !tbaa !19
  %453 = or disjoint i64 %401, 8
  %454 = getelementptr inbounds float, ptr %9, i64 %453
  store float %452, ptr %454, align 32, !tbaa !19
  br i1 %389, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %455 = trunc i64 %398 to i32
  %456 = or disjoint i32 %455, 9
  %457 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %456
  %458 = load float, ptr addrspace(3) %457, align 4, !tbaa !19
  %459 = or disjoint i64 %401, 9
  %460 = getelementptr inbounds float, ptr %9, i64 %459
  store float %458, ptr %460, align 4, !tbaa !19
  br i1 %390, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %461 = trunc i64 %398 to i32
  %462 = or disjoint i32 %461, 10
  %463 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %462
  %464 = load float, ptr addrspace(3) %463, align 4, !tbaa !19
  %465 = or disjoint i64 %401, 10
  %466 = getelementptr inbounds float, ptr %9, i64 %465
  store float %464, ptr %466, align 8, !tbaa !19
  br i1 %391, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %467 = trunc i64 %398 to i32
  %468 = or disjoint i32 %467, 11
  %469 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %468
  %470 = load float, ptr addrspace(3) %469, align 4, !tbaa !19
  %471 = or disjoint i64 %401, 11
  %472 = getelementptr inbounds float, ptr %9, i64 %471
  store float %470, ptr %472, align 4, !tbaa !19
  br i1 %392, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %473 = trunc i64 %398 to i32
  %474 = or disjoint i32 %473, 12
  %475 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %474
  %476 = load float, ptr addrspace(3) %475, align 4, !tbaa !19
  %477 = or disjoint i64 %401, 12
  %478 = getelementptr inbounds float, ptr %9, i64 %477
  store float %476, ptr %478, align 16, !tbaa !19
  br i1 %393, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %479 = trunc i64 %398 to i32
  %480 = or disjoint i32 %479, 13
  %481 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %480
  %482 = load float, ptr addrspace(3) %481, align 4, !tbaa !19
  %483 = or disjoint i64 %401, 13
  %484 = getelementptr inbounds float, ptr %9, i64 %483
  store float %482, ptr %484, align 4, !tbaa !19
  br i1 %394, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %485 = trunc i64 %398 to i32
  %486 = or disjoint i32 %485, 14
  %487 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %486
  %488 = load float, ptr addrspace(3) %487, align 4, !tbaa !19
  %489 = or disjoint i64 %401, 14
  %490 = getelementptr inbounds float, ptr %9, i64 %489
  store float %488, ptr %490, align 8, !tbaa !19
  br i1 %395, label %491, label %.split.us.i

491:                                              ; preds = %.preheader.split.15.i
  %492 = trunc i64 %398 to i32
  %493 = or disjoint i32 %492, 15
  %494 = getelementptr inbounds float, ptr addrspace(3) %378, i32 %493
  %495 = load float, ptr addrspace(3) %494, align 4, !tbaa !19
  %496 = or disjoint i64 %401, 15
  %497 = getelementptr inbounds float, ptr %9, i64 %496
  store float %495, ptr %497, align 4, !tbaa !19
  br label %.split.us.i

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %._crit_edge781.i, %.split.us.i
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
