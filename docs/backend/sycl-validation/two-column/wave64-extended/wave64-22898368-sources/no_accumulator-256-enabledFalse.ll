;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-wave64-extended-22898368/tmp/triton-sycl-cache/compile-wjmdakum/kernel.cpp"
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
  %11 = icmp ult i64 %10, 8388607
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %17 = icmp ult i64 %16, 256
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %23 = icmp ult i64 %22, 8388608
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
  %33 = icmp ult i64 %32, 256
  call void @llvm.assume(i1 %33)
  %34 = icmp ult i64 %32, 128
  br i1 %34, label %.lr.ph.i, label %.lr.ph573.i

.lr.ph.i:                                         ; preds = %6
  %35 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %36 = inttoptr i32 %35 to ptr addrspace(3)
  %37 = trunc i64 %32 to i32
  %38 = getelementptr inbounds float, ptr addrspace(3) %36, i32 %37
  store float 0.000000e+00, ptr addrspace(3) %38, align 4, !tbaa !19
  br label %.lr.ph573.i

.lr.ph573.i:                                      ; preds = %.lr.ph.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %40 = icmp ult i64 %39, 8388607
  call void @llvm.assume(i1 %40)
  %41 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %42 = icmp eq i64 %41, 0
  call void @llvm.assume(i1 %42)
  %43 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %44 = icmp eq i64 %43, 0
  call void @llvm.assume(i1 %44)
  %45 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %46 = icmp ult i64 %45, 256
  call void @llvm.assume(i1 %46)
  %47 = sext i32 %5 to i64
  %48 = sext i32 %3 to i64
  %49 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %50 = inttoptr i32 %49 to ptr addrspace(3)
  %51 = getelementptr inbounds i8, ptr addrspace(3) %50, i32 512
  %52 = and i64 %45, 7
  %53 = lshr i64 %45, 3
  %54 = icmp slt i64 %53, %47
  %55 = icmp slt i64 %52, %48
  %56 = and i1 %54, %55
  br i1 %56, label %57, label %.lr.ph579.i

57:                                               ; preds = %.lr.ph573.i
  %58 = shl nuw nsw i64 %39, 8
  %59 = and i64 %45, 248
  %60 = or disjoint i64 %59, %58
  %61 = or disjoint i64 %60, %52
  %62 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %61
  %.sroa.0277.0.copyload.i = load i16, ptr %62, align 2, !tbaa.struct !23
  br label %.lr.ph579.i

.lr.ph579.i:                                      ; preds = %57, %.lr.ph573.i
  %.sroa.0279.1.i = phi i16 [ %.sroa.0277.0.copyload.i, %57 ], [ 0, %.lr.ph573.i ]
  %63 = trunc i64 %45 to i32
  %64 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %51, i32 %63
  store i16 %.sroa.0279.1.i, ptr addrspace(3) %64, align 2, !tbaa.struct !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %66 = icmp eq i64 %65, 0
  call void @llvm.assume(i1 %66)
  %67 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %68 = icmp eq i64 %67, 0
  call void @llvm.assume(i1 %68)
  %69 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %70 = icmp ult i64 %69, 256
  call void @llvm.assume(i1 %70)
  %71 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %72 = inttoptr i32 %71 to ptr addrspace(3)
  %73 = getelementptr inbounds i8, ptr addrspace(3) %72, i32 512
  %74 = getelementptr inbounds i8, ptr addrspace(3) %72, i32 1024
  %75 = lshr i64 %69, 5
  %76 = shl nuw nsw i64 %69, 3
  %77 = and i64 %76, 248
  %78 = or disjoint i64 %77, %75
  %79 = trunc i64 %78 to i32
  %80 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %73, i32 %79
  %.sroa.0340.0.copyload.i = load i16, ptr addrspace(3) %80, align 2, !tbaa.struct !23
  %81 = trunc i64 %69 to i32
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %74, i32 %81
  store i16 %.sroa.0340.0.copyload.i, ptr addrspace(3) %82, align 2, !tbaa.struct !23
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %84 = icmp eq i64 %83, 0
  call void @llvm.assume(i1 %84)
  %85 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %86 = icmp eq i64 %85, 0
  call void @llvm.assume(i1 %86)
  %87 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %88 = icmp ult i64 %87, 256
  call void @llvm.assume(i1 %88)
  %.tr551.i = trunc i64 %39 to i32
  %89 = shl nuw i32 %.tr551.i, 9
  %90 = sext i32 %4 to i64
  %91 = sext i32 %5 to i64
  %92 = sext i32 %89 to i64
  %93 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %94 = inttoptr i32 %93 to ptr addrspace(3)
  %95 = getelementptr inbounds i8, ptr addrspace(3) %94, i32 1536
  %96 = and i64 %87, 31
  %97 = icmp slt i64 %96, %91
  br label %108

.lr.ph582.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i
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
  %104 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %105 = inttoptr i32 %104 to ptr addrspace(3)
  %106 = getelementptr inbounds i8, ptr addrspace(3) %105, i32 1536
  %107 = getelementptr inbounds i8, ptr addrspace(3) %105, i32 2560
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i

108:                                              ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.lr.ph579.i
  %109 = phi i64 [ %87, %.lr.ph579.i ], [ %120, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ]
  %110 = lshr i64 %109, 5
  %111 = icmp slt i64 %110, %90
  %112 = and i1 %111, %97
  br i1 %112, label %113, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

113:                                              ; preds = %108
  %114 = and i64 %109, 9223372036854775776
  %115 = or disjoint i64 %114, %92
  %116 = or disjoint i64 %115, %96
  %117 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %116
  %.sroa.0236.0.copyload.i = load i16, ptr %117, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %113, %108
  %.sroa.0238.1.i = phi i16 [ %.sroa.0236.0.copyload.i, %113 ], [ 0, %108 ]
  %118 = trunc i64 %109 to i32
  %119 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %95, i32 %118
  store i16 %.sroa.0238.1.i, ptr addrspace(3) %119, align 2, !tbaa.struct !23
  %120 = add nuw nsw i64 %109, 256
  %121 = icmp ult i64 %109, 256
  br i1 %121, label %108, label %.lr.ph582.i, !llvm.loop !26

._crit_edge583.i:                                 ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %123 = icmp eq i64 %122, 0
  call void @llvm.assume(i1 %123)
  %124 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %125 = icmp eq i64 %124, 0
  call void @llvm.assume(i1 %125)
  %126 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %127 = icmp ult i64 %126, 256
  call void @llvm.assume(i1 %127)
  %128 = icmp ult i64 %126, 128
  br i1 %128, label %.lr.ph585.i, label %._crit_edge586.i

.lr.ph585.i:                                      ; preds = %._crit_edge583.i
  %129 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %130 = inttoptr i32 %129 to ptr addrspace(3)
  %131 = getelementptr inbounds i8, ptr addrspace(3) %130, i32 1024
  %132 = getelementptr inbounds i8, ptr addrspace(3) %130, i32 2560
  %133 = and i64 %126, 15
  %134 = shl nuw nsw i64 %126, 1
  %135 = and i64 %134, 224
  %136 = trunc i64 %126 to i32
  %137 = getelementptr inbounds float, ptr addrspace(3) %130, i32 %136
  %.pre.i = load float, ptr addrspace(3) %137, align 4, !tbaa !19
  br label %153

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, %.lr.ph582.i
  %138 = phi i64 [ %102, %.lr.ph582.i ], [ %147, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i ]
  %139 = lshr i64 %138, 4
  %140 = shl nuw nsw i64 %138, 5
  %141 = and i64 %140, 480
  %142 = or disjoint i64 %141, %139
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %106, i32 %143
  %.sroa.0341.0.copyload.i = load i16, ptr addrspace(3) %144, align 2, !tbaa.struct !23
  %145 = trunc i64 %138 to i32
  %146 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %107, i32 %145
  store i16 %.sroa.0341.0.copyload.i, ptr addrspace(3) %146, align 2, !tbaa.struct !23
  %147 = add nuw nsw i64 %138, 256
  %148 = icmp ult i64 %138, 256
  br i1 %148, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit16.i.i.i, label %._crit_edge583.i, !llvm.loop !30

._crit_edge586.i:                                 ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %._crit_edge583.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %149 = shl nuw nsw i64 %39, 7
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %151 = icmp ult i64 %150, 256
  call void @llvm.assume(i1 %151)
  %152 = icmp eq i64 %150, 0
  br i1 %152, label %206, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

153:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %.lr.ph585.i
  %154 = phi float [ %.pre.i, %.lr.ph585.i ], [ %204, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %155 = phi i64 [ 0, %.lr.ph585.i ], [ %205, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %156 = add nuw nsw i64 %155, %135
  %157 = trunc i64 %156 to i32
  %158 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %131, i32 %157
  %.sroa.0195.0.copyload.i = load i16, ptr addrspace(3) %158, align 2, !tbaa.struct !23
  %159 = shl nuw nsw i64 %155, 4
  %160 = or disjoint i64 %159, %133
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %132, i32 %161
  %.sroa.0186.0.copyload.i = load i16, ptr addrspace(3) %162, align 2, !tbaa.struct !23
  %163 = zext i16 %.sroa.0195.0.copyload.i to i32
  %164 = lshr i32 %163, 10
  %165 = and i32 %164, 31
  %166 = and i32 %163, 1023
  switch i32 %165, label %172 [
    i32 31, label %167
    i32 0, label %174
  ]

167:                                              ; preds = %153
  %.sroa.0195.0.copyload.signext.i = sext i16 %.sroa.0195.0.copyload.i to i32
  %168 = and i32 %.sroa.0195.0.copyload.signext.i, -2147483648
  %.not560.i = icmp eq i32 %166, 0
  %169 = select i1 %.not560.i, i32 2139095040, i32 2143289344
  %170 = or disjoint i32 %169, %168
  %171 = bitcast i32 %170 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

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
  %.not554555.i = icmp slt i16 %.sroa.0195.0.copyload.i, 0
  %181 = select contract i1 %.not554555.i, float %180, float %179
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %174, %167
  %182 = phi float [ %171, %167 ], [ %181, %174 ]
  %183 = zext i16 %.sroa.0186.0.copyload.i to i32
  %184 = lshr i32 %183, 10
  %185 = and i32 %184, 31
  %186 = and i32 %183, 1023
  switch i32 %185, label %192 [
    i32 31, label %187
    i32 0, label %194
  ]

187:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0186.0.copyload.signext.i = sext i16 %.sroa.0186.0.copyload.i to i32
  %188 = and i32 %.sroa.0186.0.copyload.signext.i, -2147483648
  %.not559.i = icmp eq i32 %186, 0
  %189 = select i1 %.not559.i, i32 2139095040, i32 2143289344
  %190 = or disjoint i32 %189, %188
  %191 = bitcast i32 %190 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

192:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %193 = or disjoint i32 %186, 1024
  br label %194

194:                                              ; preds = %192, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %195 = phi i32 [ %193, %192 ], [ %186, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %196 = uitofp i32 %195 to float
  %.not556.i = icmp eq i32 %185, 0
  %197 = add nsw i32 %185, -25
  %198 = select i1 %.not556.i, i32 -24, i32 %197
  %199 = call float @__ocml_ldexp_f32(float noundef %196, i32 noundef %198) #5
  %200 = fneg contract float %199
  %.not557558.i = icmp slt i16 %.sroa.0186.0.copyload.i, 0
  %201 = select contract i1 %.not557558.i, float %200, float %199
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %194, %187
  %202 = phi float [ %191, %187 ], [ %201, %194 ]
  %203 = fmul contract float %182, %202
  %204 = fadd contract float %154, %203
  store float %204, ptr addrspace(3) %137, align 4, !tbaa !19
  %205 = add nuw nsw i64 %155, 1
  %exitcond.not.i = icmp eq i64 %205, 32
  br i1 %exitcond.not.i, label %._crit_edge586.i, label %153, !llvm.loop !31

206:                                              ; preds = %._crit_edge586.i
  %207 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %208 = icmp eq i64 %207, 0
  call void @llvm.assume(i1 %208)
  %209 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %210 = icmp eq i64 %209, 0
  call void @llvm.assume(i1 %210)
  %211 = sext i32 %3 to i64
  %212 = call i32 @llvm.amdgcn.groupstaticsize()
  %213 = inttoptr i32 %212 to ptr addrspace(3)
  %214 = icmp sgt i32 %4, 0
  %215 = icmp ugt i32 %4, 1
  %216 = icmp ugt i32 %4, 2
  %217 = icmp ugt i32 %4, 3
  %218 = icmp ugt i32 %4, 4
  %219 = icmp ugt i32 %4, 5
  %220 = icmp ugt i32 %4, 6
  %221 = icmp ugt i32 %4, 7
  %222 = icmp ugt i32 %4, 8
  %223 = icmp ugt i32 %4, 9
  %224 = icmp ugt i32 %4, 10
  %225 = icmp ugt i32 %4, 11
  %226 = icmp ugt i32 %4, 12
  %227 = icmp ugt i32 %4, 13
  %228 = icmp ugt i32 %4, 14
  %229 = icmp ugt i32 %4, 15
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split.us.i, %206
  %230 = phi i64 [ 0, %206 ], [ %236, %.split.us.i ]
  %231 = icmp slt i64 %230, %211
  %232 = shl i64 %230, 4
  %.tr553.i = trunc i64 %230 to i32
  %233 = shl i32 %.tr553.i, 4
  %234 = sext i32 %233 to i64
  %235 = add nsw i64 %149, %234
  %.fr.i = freeze i1 %231
  %brmerge.not.i = select i1 %.fr.i, i1 %214, i1 false
  br i1 %brmerge.not.i, label %.preheader.split.1.i, label %.split.us.i

.split.us.i:                                      ; preds = %325, %.preheader.split.15.i, %.preheader.split.14.i, %.preheader.split.13.i, %.preheader.split.12.i, %.preheader.split.11.i, %.preheader.split.10.i, %.preheader.split.9.i, %.preheader.split.8.i, %.preheader.split.7.i, %.preheader.split.6.i, %.preheader.split.5.i, %.preheader.split.4.i, %.preheader.split.3.i, %.preheader.split.2.i, %.preheader.split.1.i, %.preheader.i
  %236 = add nuw nsw i64 %230, 1
  %exitcond589.not.i = icmp eq i64 %236, 8
  br i1 %exitcond589.not.i, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", label %.preheader.i, !llvm.loop !32

.preheader.split.1.i:                             ; preds = %.preheader.i
  %237 = trunc i64 %232 to i32
  %238 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %237
  %239 = load float, ptr addrspace(3) %238, align 4, !tbaa !19
  %240 = getelementptr inbounds float, ptr %9, i64 %235
  store float %239, ptr %240, align 32, !tbaa !19
  br i1 %215, label %.preheader.split.2.i, label %.split.us.i

.preheader.split.2.i:                             ; preds = %.preheader.split.1.i
  %241 = trunc i64 %232 to i32
  %242 = or disjoint i32 %241, 1
  %243 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %242
  %244 = load float, ptr addrspace(3) %243, align 4, !tbaa !19
  %245 = or disjoint i64 %235, 1
  %246 = getelementptr inbounds float, ptr %9, i64 %245
  store float %244, ptr %246, align 4, !tbaa !19
  br i1 %216, label %.preheader.split.3.i, label %.split.us.i

.preheader.split.3.i:                             ; preds = %.preheader.split.2.i
  %247 = trunc i64 %232 to i32
  %248 = or disjoint i32 %247, 2
  %249 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %248
  %250 = load float, ptr addrspace(3) %249, align 4, !tbaa !19
  %251 = or disjoint i64 %235, 2
  %252 = getelementptr inbounds float, ptr %9, i64 %251
  store float %250, ptr %252, align 8, !tbaa !19
  br i1 %217, label %.preheader.split.4.i, label %.split.us.i

.preheader.split.4.i:                             ; preds = %.preheader.split.3.i
  %253 = trunc i64 %232 to i32
  %254 = or disjoint i32 %253, 3
  %255 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %254
  %256 = load float, ptr addrspace(3) %255, align 4, !tbaa !19
  %257 = or disjoint i64 %235, 3
  %258 = getelementptr inbounds float, ptr %9, i64 %257
  store float %256, ptr %258, align 4, !tbaa !19
  br i1 %218, label %.preheader.split.5.i, label %.split.us.i

.preheader.split.5.i:                             ; preds = %.preheader.split.4.i
  %259 = trunc i64 %232 to i32
  %260 = or disjoint i32 %259, 4
  %261 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %260
  %262 = load float, ptr addrspace(3) %261, align 4, !tbaa !19
  %263 = or disjoint i64 %235, 4
  %264 = getelementptr inbounds float, ptr %9, i64 %263
  store float %262, ptr %264, align 16, !tbaa !19
  br i1 %219, label %.preheader.split.6.i, label %.split.us.i

.preheader.split.6.i:                             ; preds = %.preheader.split.5.i
  %265 = trunc i64 %232 to i32
  %266 = or disjoint i32 %265, 5
  %267 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %266
  %268 = load float, ptr addrspace(3) %267, align 4, !tbaa !19
  %269 = or disjoint i64 %235, 5
  %270 = getelementptr inbounds float, ptr %9, i64 %269
  store float %268, ptr %270, align 4, !tbaa !19
  br i1 %220, label %.preheader.split.7.i, label %.split.us.i

.preheader.split.7.i:                             ; preds = %.preheader.split.6.i
  %271 = trunc i64 %232 to i32
  %272 = or disjoint i32 %271, 6
  %273 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %272
  %274 = load float, ptr addrspace(3) %273, align 4, !tbaa !19
  %275 = or disjoint i64 %235, 6
  %276 = getelementptr inbounds float, ptr %9, i64 %275
  store float %274, ptr %276, align 8, !tbaa !19
  br i1 %221, label %.preheader.split.8.i, label %.split.us.i

.preheader.split.8.i:                             ; preds = %.preheader.split.7.i
  %277 = trunc i64 %232 to i32
  %278 = or disjoint i32 %277, 7
  %279 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %278
  %280 = load float, ptr addrspace(3) %279, align 4, !tbaa !19
  %281 = or disjoint i64 %235, 7
  %282 = getelementptr inbounds float, ptr %9, i64 %281
  store float %280, ptr %282, align 4, !tbaa !19
  br i1 %222, label %.preheader.split.9.i, label %.split.us.i

.preheader.split.9.i:                             ; preds = %.preheader.split.8.i
  %283 = trunc i64 %232 to i32
  %284 = or disjoint i32 %283, 8
  %285 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %284
  %286 = load float, ptr addrspace(3) %285, align 4, !tbaa !19
  %287 = or disjoint i64 %235, 8
  %288 = getelementptr inbounds float, ptr %9, i64 %287
  store float %286, ptr %288, align 32, !tbaa !19
  br i1 %223, label %.preheader.split.10.i, label %.split.us.i

.preheader.split.10.i:                            ; preds = %.preheader.split.9.i
  %289 = trunc i64 %232 to i32
  %290 = or disjoint i32 %289, 9
  %291 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %290
  %292 = load float, ptr addrspace(3) %291, align 4, !tbaa !19
  %293 = or disjoint i64 %235, 9
  %294 = getelementptr inbounds float, ptr %9, i64 %293
  store float %292, ptr %294, align 4, !tbaa !19
  br i1 %224, label %.preheader.split.11.i, label %.split.us.i

.preheader.split.11.i:                            ; preds = %.preheader.split.10.i
  %295 = trunc i64 %232 to i32
  %296 = or disjoint i32 %295, 10
  %297 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %296
  %298 = load float, ptr addrspace(3) %297, align 4, !tbaa !19
  %299 = or disjoint i64 %235, 10
  %300 = getelementptr inbounds float, ptr %9, i64 %299
  store float %298, ptr %300, align 8, !tbaa !19
  br i1 %225, label %.preheader.split.12.i, label %.split.us.i

.preheader.split.12.i:                            ; preds = %.preheader.split.11.i
  %301 = trunc i64 %232 to i32
  %302 = or disjoint i32 %301, 11
  %303 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %302
  %304 = load float, ptr addrspace(3) %303, align 4, !tbaa !19
  %305 = or disjoint i64 %235, 11
  %306 = getelementptr inbounds float, ptr %9, i64 %305
  store float %304, ptr %306, align 4, !tbaa !19
  br i1 %226, label %.preheader.split.13.i, label %.split.us.i

.preheader.split.13.i:                            ; preds = %.preheader.split.12.i
  %307 = trunc i64 %232 to i32
  %308 = or disjoint i32 %307, 12
  %309 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %308
  %310 = load float, ptr addrspace(3) %309, align 4, !tbaa !19
  %311 = or disjoint i64 %235, 12
  %312 = getelementptr inbounds float, ptr %9, i64 %311
  store float %310, ptr %312, align 16, !tbaa !19
  br i1 %227, label %.preheader.split.14.i, label %.split.us.i

.preheader.split.14.i:                            ; preds = %.preheader.split.13.i
  %313 = trunc i64 %232 to i32
  %314 = or disjoint i32 %313, 13
  %315 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %314
  %316 = load float, ptr addrspace(3) %315, align 4, !tbaa !19
  %317 = or disjoint i64 %235, 13
  %318 = getelementptr inbounds float, ptr %9, i64 %317
  store float %316, ptr %318, align 4, !tbaa !19
  br i1 %228, label %.preheader.split.15.i, label %.split.us.i

.preheader.split.15.i:                            ; preds = %.preheader.split.14.i
  %319 = trunc i64 %232 to i32
  %320 = or disjoint i32 %319, 14
  %321 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %320
  %322 = load float, ptr addrspace(3) %321, align 4, !tbaa !19
  %323 = or disjoint i64 %235, 14
  %324 = getelementptr inbounds float, ptr %9, i64 %323
  store float %322, ptr %324, align 8, !tbaa !19
  br i1 %229, label %325, label %.split.us.i

325:                                              ; preds = %.preheader.split.15.i
  %326 = trunc i64 %232 to i32
  %327 = or disjoint i32 %326, 15
  %328 = getelementptr inbounds float, ptr addrspace(3) %213, i32 %327
  %329 = load float, ptr addrspace(3) %328, align 4, !tbaa !19
  %330 = or disjoint i64 %235, 15
  %331 = getelementptr inbounds float, ptr %9, i64 %330
  store float %329, ptr %331, align 4, !tbaa !19
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
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="256,256" }
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
!31 = distinct !{!31, !27}
!32 = distinct !{!32, !27}
;----------------- End AdaptiveCpp IR dump ---------------
