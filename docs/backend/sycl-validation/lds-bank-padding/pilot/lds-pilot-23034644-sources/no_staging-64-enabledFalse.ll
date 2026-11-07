;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-6llhp1jr/kernel.cpp"
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p3.i32(ptr addrspace(3) nocapture writeonly, i8, i32, i1 immarg) #4

; Function Attrs: nounwind
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5) #5 {
  %7 = addrspacecast ptr addrspace(1) %0 to ptr
  %8 = addrspacecast ptr addrspace(1) %1 to ptr
  %9 = addrspacecast ptr addrspace(1) %2 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 32) ]
  %10 = call i64 @__ockl_get_group_id(i32 noundef 2) #6, !noalias !10
  %11 = icmp ult i64 %10, 33554431
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 64
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 33554432
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 33554431
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 11
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 64
  call void @llvm.assume(i1 %32)
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %34, label %.lr.ph.i

34:                                               ; preds = %6
  %35 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %36 = icmp eq i64 %35, 0
  call void @llvm.assume(i1 %36)
  %37 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %38 = icmp eq i64 %37, 0
  call void @llvm.assume(i1 %38)
  %39 = sext i32 %5 to i64
  %40 = sext i32 %3 to i64
  %41 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %42 = inttoptr i32 %41 to ptr addrspace(3)
  %43 = getelementptr inbounds i8, ptr addrspace(3) %42, i32 8192
  %44 = sext i32 %30 to i64
  br label %.preheader1172.i

.preheader1172.i:                                 ; preds = %.split.us.i, %34
  %45 = phi i64 [ 0, %34 ], [ %53, %.split.us.i ]
  %46 = icmp slt i64 %45, %39
  %47 = shl i64 %45, 5
  %.tr1167.i = trunc i64 %45 to i32
  %48 = shl i32 %.tr1167.i, 5
  %49 = sext i32 %48 to i64
  %50 = add nsw i64 %49, %44
  %.fr.i = freeze i1 %46
  br i1 %.fr.i, label %.preheader1172.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.us.preheader.i: ; preds = %.preheader1172.i
  %.tr1202.i = trunc i64 %45 to i32
  %51 = shl i32 %.tr1202.i, 6
  %52 = add i32 %51, 8192
  %scevgep.i = getelementptr i8, ptr addrspace(3) %42, i32 %52
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(64) %scevgep.i, i8 0, i32 64, i1 false)
  br label %.split.us.i

.split.us.i:                                      ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.us.preheader.i
  %53 = add nuw nsw i64 %45, 1
  %exitcond1197.not.i = icmp eq i64 %53, 64
  br i1 %exitcond1197.not.i, label %.lr.ph.i, label %.preheader1172.i, !llvm.loop !19

.preheader1172.split.i:                           ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.i, %.preheader1172.i
  %54 = phi i64 [ %62, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.i ], [ 0, %.preheader1172.i ]
  %55 = icmp slt i64 %54, %40
  br i1 %55, label %56, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.i

56:                                               ; preds = %.preheader1172.split.i
  %57 = add nuw nsw i64 %50, %54
  %58 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %7, i64 %57
  %.sroa.0447.0.copyload.i = load i16, ptr %58, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit36.i.i.i: ; preds = %56, %.preheader1172.split.i
  %.sroa.0449.2.i = phi i16 [ %.sroa.0447.0.copyload.i, %56 ], [ 0, %.preheader1172.split.i ]
  %59 = add nuw nsw i64 %54, %47
  %60 = trunc i64 %59 to i32
  %61 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %43, i32 %60
  store i16 %.sroa.0449.2.i, ptr addrspace(3) %61, align 2, !tbaa.struct !23
  %62 = add nuw nsw i64 %54, 1
  %exitcond.not.i = icmp eq i64 %62, 32
  br i1 %exitcond.not.i, label %.split.us.i, label %.preheader1172.split.i, !llvm.loop !28

.lr.ph.i:                                         ; preds = %.split.us.i, %6
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %64 = icmp eq i64 %63, 0
  call void @llvm.assume(i1 %64)
  %65 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %66 = icmp eq i64 %65, 0
  call void @llvm.assume(i1 %66)
  %67 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %68 = icmp ult i64 %67, 64
  call void @llvm.assume(i1 %68)
  %69 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %70 = inttoptr i32 %69 to ptr addrspace(3)
  %71 = getelementptr inbounds i8, ptr addrspace(3) %70, i32 8192
  %72 = getelementptr inbounds i8, ptr addrspace(3) %70, i32 12288
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i

._crit_edge.i:                                    ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %74 = icmp ult i64 %73, 64
  call void @llvm.assume(i1 %74)
  %75 = icmp eq i64 %73, 0
  br i1 %75, label %87, label %.lr.ph1185.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, %.lr.ph.i
  %76 = phi i64 [ %67, %.lr.ph.i ], [ %85, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i ]
  %77 = lshr i64 %76, 6
  %78 = shl nuw nsw i64 %76, 5
  %79 = and i64 %78, 2016
  %80 = or disjoint i64 %79, %77
  %81 = trunc i64 %80 to i32
  %82 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %71, i32 %81
  %.sroa.0556.0.copyload.i = load i16, ptr addrspace(3) %82, align 2, !tbaa.struct !23
  %83 = trunc i64 %76 to i32
  %84 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %72, i32 %83
  store i16 %.sroa.0556.0.copyload.i, ptr addrspace(3) %84, align 2, !tbaa.struct !23
  %85 = add nuw nsw i64 %76, 64
  %86 = icmp ult i64 %76, 1984
  br i1 %86, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit5.i.i.i, label %._crit_edge.i, !llvm.loop !29

87:                                               ; preds = %._crit_edge.i
  %88 = shl i32 %.tr.i, 12
  %89 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %90 = icmp eq i64 %89, 0
  call void @llvm.assume(i1 %90)
  %91 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %92 = icmp eq i64 %91, 0
  call void @llvm.assume(i1 %92)
  %93 = sext i32 %4 to i64
  %94 = sext i32 %5 to i64
  %95 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %96 = inttoptr i32 %95 to ptr addrspace(3)
  %97 = getelementptr inbounds i8, ptr addrspace(3) %96, i32 16384
  %98 = sext i32 %88 to i64
  br label %.preheader.i

.preheader.i:                                     ; preds = %.split1182.us.i, %87
  %99 = phi i64 [ 0, %87 ], [ %107, %.split1182.us.i ]
  %100 = icmp slt i64 %99, %93
  %101 = shl i64 %99, 6
  %.tr1166.i = trunc i64 %99 to i32
  %102 = shl i32 %.tr1166.i, 6
  %103 = sext i32 %102 to i64
  %104 = add nsw i64 %103, %98
  %.fr1183.i = freeze i1 %100
  br i1 %.fr1183.i, label %.preheader.split.i, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i: ; preds = %.preheader.i
  %.tr1201.i = trunc i64 %99 to i32
  %105 = shl i32 %.tr1201.i, 7
  %106 = add i32 %105, 16384
  %scevgep1198.i = getelementptr i8, ptr addrspace(3) %96, i32 %106
  call void @llvm.memset.p3.i32(ptr addrspace(3) noundef align 2 dereferenceable(128) %scevgep1198.i, i8 0, i32 128, i1 false)
  br label %.split1182.us.i

.split1182.us.i:                                  ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.us.preheader.i
  %107 = add nuw nsw i64 %99, 1
  %exitcond1200.not.i = icmp eq i64 %107, 64
  br i1 %exitcond1200.not.i, label %.lr.ph1185.i, label %.preheader.i, !llvm.loop !30

.preheader.split.i:                               ; preds = %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i, %.preheader.i
  %108 = phi i64 [ %116, %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i ], [ 0, %.preheader.i ]
  %109 = icmp slt i64 %108, %94
  br i1 %109, label %110, label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

110:                                              ; preds = %.preheader.split.i
  %111 = add nuw nsw i64 %104, %108
  %112 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr %8, i64 %111
  %.sroa.0410.0.copyload.i = load i16, ptr %112, align 2, !tbaa.struct !23
  br label %_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i

_ZN27triton_sycl_float16_storageILi10ELi15EE4fromEdb.exit.i.i.i: ; preds = %110, %.preheader.split.i
  %.sroa.0412.2.i = phi i16 [ %.sroa.0410.0.copyload.i, %110 ], [ 0, %.preheader.split.i ]
  %113 = add nuw nsw i64 %108, %101
  %114 = trunc i64 %113 to i32
  %115 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %97, i32 %114
  store i16 %.sroa.0412.2.i, ptr addrspace(3) %115, align 2, !tbaa.struct !23
  %116 = add nuw nsw i64 %108, 1
  %exitcond1199.not.i = icmp eq i64 %116, 64
  br i1 %exitcond1199.not.i, label %.split1182.us.i, label %.preheader.split.i, !llvm.loop !31

.lr.ph1185.i:                                     ; preds = %.split1182.us.i, %._crit_edge.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %118 = icmp eq i64 %117, 0
  call void @llvm.assume(i1 %118)
  %119 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %120 = icmp eq i64 %119, 0
  call void @llvm.assume(i1 %120)
  %121 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %122 = icmp ult i64 %121, 64
  call void @llvm.assume(i1 %122)
  %123 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %124 = inttoptr i32 %123 to ptr addrspace(3)
  %125 = getelementptr inbounds i8, ptr addrspace(3) %124, i32 16384
  %126 = getelementptr inbounds i8, ptr addrspace(3) %124, i32 24576
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i

.lr.ph1188.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %127 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %128 = icmp eq i64 %127, 0
  call void @llvm.assume(i1 %128)
  %129 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %130 = icmp eq i64 %129, 0
  call void @llvm.assume(i1 %130)
  %131 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %132 = icmp ult i64 %131, 64
  call void @llvm.assume(i1 %132)
  %133 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %134 = inttoptr i32 %133 to ptr addrspace(3)
  %135 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 12288
  %136 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 24576
  %137 = and i64 %131, 15
  %138 = or disjoint i64 %137, 16
  %139 = or disjoint i64 %137, 32
  %140 = or i64 %131, 48
  br label %164

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i: ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i, %.lr.ph1185.i
  %141 = phi i64 [ %121, %.lr.ph1185.i ], [ %150, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i ]
  %142 = lshr i64 %141, 6
  %143 = shl nuw nsw i64 %141, 6
  %144 = and i64 %143, 4032
  %145 = or disjoint i64 %144, %142
  %146 = trunc i64 %145 to i32
  %147 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %125, i32 %146
  %.sroa.0557.0.copyload.i = load i16, ptr addrspace(3) %147, align 2, !tbaa.struct !23
  %148 = trunc i64 %141 to i32
  %149 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %126, i32 %148
  store i16 %.sroa.0557.0.copyload.i, ptr addrspace(3) %149, align 2, !tbaa.struct !23
  %150 = add nuw nsw i64 %141, 64
  %151 = icmp ult i64 %141, 4032
  br i1 %151, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit11.i.i.i, label %.lr.ph1188.i, !llvm.loop !32

.lr.ph1191.i:                                     ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %152 = call i64 @__ockl_get_local_id(i32 noundef 0) #6
  %153 = icmp eq i64 %152, 0
  call void @llvm.assume(i1 %153)
  %154 = call i64 @__ockl_get_local_id(i32 noundef 1) #6
  %155 = icmp eq i64 %154, 0
  call void @llvm.assume(i1 %155)
  %156 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %157 = icmp ult i64 %156, 64
  call void @llvm.assume(i1 %157)
  %158 = sext i32 %3 to i64
  %159 = sext i32 %4 to i64
  %160 = call i32 @llvm.amdgcn.groupstaticsize()
  %161 = inttoptr i32 %160 to ptr addrspace(3)
  %162 = sext i32 %30 to i64
  %163 = icmp slt i64 %156, %159
  br label %689

164:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %.lr.ph1188.i
  %165 = phi i64 [ %131, %.lr.ph1188.i ], [ %180, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i ]
  %166 = shl nuw nsw i64 %165, 2
  %167 = and i64 %166, 9223372036854775744
  br label %182

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %168 = or disjoint i64 %167, %137
  %169 = trunc i64 %168 to i32
  %170 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %169
  store float %611, ptr addrspace(3) %170, align 4, !tbaa !33
  %171 = or disjoint i64 %167, %138
  %172 = trunc i64 %171 to i32
  %173 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %172
  store float %636, ptr addrspace(3) %173, align 4, !tbaa !33
  %174 = or disjoint i64 %167, %139
  %175 = trunc i64 %174 to i32
  %176 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %175
  store float %661, ptr addrspace(3) %176, align 4, !tbaa !33
  %177 = or disjoint i64 %167, %140
  %178 = trunc i64 %177 to i32
  %179 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %178
  store float %686, ptr addrspace(3) %179, align 4, !tbaa !33
  %180 = add nuw nsw i64 %165, 64
  %181 = icmp ult i64 %165, 448
  br i1 %181, label %164, label %.lr.ph1191.i, !llvm.loop !35

182:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %164
  %183 = phi i64 [ 0, %164 ], [ %687, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %184 = phi float [ 0.000000e+00, %164 ], [ %686, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %185 = phi float [ 0.000000e+00, %164 ], [ %661, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %186 = phi float [ 0.000000e+00, %164 ], [ %636, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %187 = phi float [ 0.000000e+00, %164 ], [ %611, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %188 = add nuw i64 %183, %167
  %189 = trunc i64 %188 to i32
  %190 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %189
  %.sroa.0373.0.copyload.i = load i16, ptr addrspace(3) %190, align 2, !tbaa.struct !23
  %191 = shl nuw nsw i64 %183, 6
  %192 = or disjoint i64 %191, %137
  %193 = trunc i64 %192 to i32
  %194 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %193
  %.sroa.0364.0.copyload.i = load i16, ptr addrspace(3) %194, align 2, !tbaa.struct !23
  %195 = zext i16 %.sroa.0373.0.copyload.i to i32
  %196 = lshr i32 %195, 10
  %197 = and i32 %196, 31
  %198 = and i32 %195, 1023
  switch i32 %197, label %204 [
    i32 31, label %199
    i32 0, label %206
  ]

199:                                              ; preds = %182
  %.sroa.0373.0.copyload.signext.i = sext i16 %.sroa.0373.0.copyload.i to i32
  %200 = and i32 %.sroa.0373.0.copyload.signext.i, -2147483648
  %.not1165.i = icmp eq i32 %198, 0
  %201 = select i1 %.not1165.i, i32 2139095040, i32 2143289344
  %202 = or disjoint i32 %201, %200
  %203 = bitcast i32 %202 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

204:                                              ; preds = %182
  %205 = or disjoint i32 %198, 1024
  br label %206

206:                                              ; preds = %204, %182
  %207 = phi i32 [ %205, %204 ], [ %198, %182 ]
  %208 = uitofp i32 %207 to float
  %.not.i = icmp eq i32 %197, 0
  %209 = add nsw i32 %197, -25
  %210 = select i1 %.not.i, i32 -24, i32 %209
  %211 = call float @__ocml_ldexp_f32(float noundef %208, i32 noundef %210) #6
  %212 = fneg contract float %211
  %.not10871088.i = icmp slt i16 %.sroa.0373.0.copyload.i, 0
  %213 = select contract i1 %.not10871088.i, float %212, float %211
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i: ; preds = %206, %199
  %214 = phi float [ %203, %199 ], [ %213, %206 ]
  %215 = zext i16 %.sroa.0364.0.copyload.i to i32
  %216 = lshr i32 %215, 10
  %217 = and i32 %216, 31
  %218 = and i32 %215, 1023
  switch i32 %217, label %224 [
    i32 31, label %219
    i32 0, label %226
  ]

219:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %.sroa.0364.0.copyload.signext.i = sext i16 %.sroa.0364.0.copyload.i to i32
  %220 = and i32 %.sroa.0364.0.copyload.signext.i, -2147483648
  %.not1164.i = icmp eq i32 %218, 0
  %221 = select i1 %.not1164.i, i32 2139095040, i32 2143289344
  %222 = or disjoint i32 %221, %220
  %223 = bitcast i32 %222 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

224:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %225 = or disjoint i32 %218, 1024
  br label %226

226:                                              ; preds = %224, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %227 = phi i32 [ %225, %224 ], [ %218, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i ]
  %228 = uitofp i32 %227 to float
  %.not1089.i = icmp eq i32 %217, 0
  %229 = add nsw i32 %217, -25
  %230 = select i1 %.not1089.i, i32 -24, i32 %229
  %231 = call float @__ocml_ldexp_f32(float noundef %228, i32 noundef %230) #6
  %232 = fneg contract float %231
  %.not10901091.i = icmp slt i16 %.sroa.0364.0.copyload.i, 0
  %233 = select contract i1 %.not10901091.i, float %232, float %231
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i: ; preds = %226, %219
  %234 = phi float [ %223, %219 ], [ %233, %226 ]
  %235 = fmul contract float %214, %234
  %236 = fadd contract float %187, %235
  %237 = or disjoint i64 %191, %138
  %238 = trunc i64 %237 to i32
  %239 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %238
  %.sroa.0355.0.copyload.i = load i16, ptr addrspace(3) %239, align 2, !tbaa.struct !23
  %240 = zext i16 %.sroa.0355.0.copyload.i to i32
  %241 = lshr i32 %240, 10
  %242 = and i32 %241, 31
  %243 = and i32 %240, 1023
  switch i32 %242, label %249 [
    i32 31, label %244
    i32 0, label %251
  ]

244:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %.sroa.0355.0.copyload.signext.i = sext i16 %.sroa.0355.0.copyload.i to i32
  %245 = and i32 %.sroa.0355.0.copyload.signext.i, -2147483648
  %.not1163.i = icmp eq i32 %243, 0
  %246 = select i1 %.not1163.i, i32 2139095040, i32 2143289344
  %247 = or disjoint i32 %246, %245
  %248 = bitcast i32 %247 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

249:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %250 = or disjoint i32 %243, 1024
  br label %251

251:                                              ; preds = %249, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %252 = phi i32 [ %250, %249 ], [ %243, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i ]
  %253 = uitofp i32 %252 to float
  %.not1092.i = icmp eq i32 %242, 0
  %254 = add nsw i32 %242, -25
  %255 = select i1 %.not1092.i, i32 -24, i32 %254
  %256 = call float @__ocml_ldexp_f32(float noundef %253, i32 noundef %255) #6
  %257 = fneg contract float %256
  %.not10931094.i = icmp slt i16 %.sroa.0355.0.copyload.i, 0
  %258 = select contract i1 %.not10931094.i, float %257, float %256
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i: ; preds = %251, %244
  %259 = phi float [ %248, %244 ], [ %258, %251 ]
  %260 = fmul contract float %214, %259
  %261 = fadd contract float %186, %260
  %262 = or disjoint i64 %191, %139
  %263 = trunc i64 %262 to i32
  %264 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %263
  %.sroa.0346.0.copyload.i = load i16, ptr addrspace(3) %264, align 2, !tbaa.struct !23
  %265 = zext i16 %.sroa.0346.0.copyload.i to i32
  %266 = lshr i32 %265, 10
  %267 = and i32 %266, 31
  %268 = and i32 %265, 1023
  switch i32 %267, label %274 [
    i32 31, label %269
    i32 0, label %276
  ]

269:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %.sroa.0346.0.copyload.signext.i = sext i16 %.sroa.0346.0.copyload.i to i32
  %270 = and i32 %.sroa.0346.0.copyload.signext.i, -2147483648
  %.not1162.i = icmp eq i32 %268, 0
  %271 = select i1 %.not1162.i, i32 2139095040, i32 2143289344
  %272 = or disjoint i32 %271, %270
  %273 = bitcast i32 %272 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

274:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %275 = or disjoint i32 %268, 1024
  br label %276

276:                                              ; preds = %274, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %277 = phi i32 [ %275, %274 ], [ %268, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i ]
  %278 = uitofp i32 %277 to float
  %.not1095.i = icmp eq i32 %267, 0
  %279 = add nsw i32 %267, -25
  %280 = select i1 %.not1095.i, i32 -24, i32 %279
  %281 = call float @__ocml_ldexp_f32(float noundef %278, i32 noundef %280) #6
  %282 = fneg contract float %281
  %.not10961097.i = icmp slt i16 %.sroa.0346.0.copyload.i, 0
  %283 = select contract i1 %.not10961097.i, float %282, float %281
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i: ; preds = %276, %269
  %284 = phi float [ %273, %269 ], [ %283, %276 ]
  %285 = fmul contract float %214, %284
  %286 = fadd contract float %185, %285
  %287 = or disjoint i64 %191, %140
  %288 = trunc i64 %287 to i32
  %289 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %288
  %.sroa.0337.0.copyload.i = load i16, ptr addrspace(3) %289, align 2, !tbaa.struct !23
  %290 = zext i16 %.sroa.0337.0.copyload.i to i32
  %291 = lshr i32 %290, 10
  %292 = and i32 %291, 31
  %293 = and i32 %290, 1023
  switch i32 %292, label %299 [
    i32 31, label %294
    i32 0, label %301
  ]

294:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %.sroa.0337.0.copyload.signext.i = sext i16 %.sroa.0337.0.copyload.i to i32
  %295 = and i32 %.sroa.0337.0.copyload.signext.i, -2147483648
  %.not1161.i = icmp eq i32 %293, 0
  %296 = select i1 %.not1161.i, i32 2139095040, i32 2143289344
  %297 = or disjoint i32 %296, %295
  %298 = bitcast i32 %297 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

299:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %300 = or disjoint i32 %293, 1024
  br label %301

301:                                              ; preds = %299, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %302 = phi i32 [ %300, %299 ], [ %293, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i ]
  %303 = uitofp i32 %302 to float
  %.not1098.i = icmp eq i32 %292, 0
  %304 = add nsw i32 %292, -25
  %305 = select i1 %.not1098.i, i32 -24, i32 %304
  %306 = call float @__ocml_ldexp_f32(float noundef %303, i32 noundef %305) #6
  %307 = fneg contract float %306
  %.not10991100.i = icmp slt i16 %.sroa.0337.0.copyload.i, 0
  %308 = select contract i1 %.not10991100.i, float %307, float %306
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i: ; preds = %301, %294
  %309 = phi float [ %298, %294 ], [ %308, %301 ]
  %310 = fmul contract float %214, %309
  %311 = fadd contract float %184, %310
  %312 = or disjoint i64 %183, 1
  %313 = add nuw i64 %312, %167
  %314 = trunc i64 %313 to i32
  %315 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %314
  %.sroa.0328.0.copyload.i = load i16, ptr addrspace(3) %315, align 2, !tbaa.struct !23
  %316 = shl nuw nsw i64 %312, 6
  %317 = or disjoint i64 %316, %137
  %318 = trunc i64 %317 to i32
  %319 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %318
  %.sroa.0319.0.copyload.i = load i16, ptr addrspace(3) %319, align 2, !tbaa.struct !23
  %320 = zext i16 %.sroa.0328.0.copyload.i to i32
  %321 = lshr i32 %320, 10
  %322 = and i32 %321, 31
  %323 = and i32 %320, 1023
  switch i32 %322, label %329 [
    i32 31, label %324
    i32 0, label %331
  ]

324:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %.sroa.0328.0.copyload.signext.i = sext i16 %.sroa.0328.0.copyload.i to i32
  %325 = and i32 %.sroa.0328.0.copyload.signext.i, -2147483648
  %.not1160.i = icmp eq i32 %323, 0
  %326 = select i1 %.not1160.i, i32 2139095040, i32 2143289344
  %327 = or disjoint i32 %326, %325
  %328 = bitcast i32 %327 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

329:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %330 = or disjoint i32 %323, 1024
  br label %331

331:                                              ; preds = %329, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %332 = phi i32 [ %330, %329 ], [ %323, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i ]
  %333 = uitofp i32 %332 to float
  %.not1101.i = icmp eq i32 %322, 0
  %334 = add nsw i32 %322, -25
  %335 = select i1 %.not1101.i, i32 -24, i32 %334
  %336 = call float @__ocml_ldexp_f32(float noundef %333, i32 noundef %335) #6
  %337 = fneg contract float %336
  %.not11021103.i = icmp slt i16 %.sroa.0328.0.copyload.i, 0
  %338 = select contract i1 %.not11021103.i, float %337, float %336
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i: ; preds = %331, %324
  %339 = phi float [ %328, %324 ], [ %338, %331 ]
  %340 = zext i16 %.sroa.0319.0.copyload.i to i32
  %341 = lshr i32 %340, 10
  %342 = and i32 %341, 31
  %343 = and i32 %340, 1023
  switch i32 %342, label %349 [
    i32 31, label %344
    i32 0, label %351
  ]

344:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %.sroa.0319.0.copyload.signext.i = sext i16 %.sroa.0319.0.copyload.i to i32
  %345 = and i32 %.sroa.0319.0.copyload.signext.i, -2147483648
  %.not1159.i = icmp eq i32 %343, 0
  %346 = select i1 %.not1159.i, i32 2139095040, i32 2143289344
  %347 = or disjoint i32 %346, %345
  %348 = bitcast i32 %347 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

349:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %350 = or disjoint i32 %343, 1024
  br label %351

351:                                              ; preds = %349, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %352 = phi i32 [ %350, %349 ], [ %343, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i ]
  %353 = uitofp i32 %352 to float
  %.not1104.i = icmp eq i32 %342, 0
  %354 = add nsw i32 %342, -25
  %355 = select i1 %.not1104.i, i32 -24, i32 %354
  %356 = call float @__ocml_ldexp_f32(float noundef %353, i32 noundef %355) #6
  %357 = fneg contract float %356
  %.not11051106.i = icmp slt i16 %.sroa.0319.0.copyload.i, 0
  %358 = select contract i1 %.not11051106.i, float %357, float %356
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i: ; preds = %351, %344
  %359 = phi float [ %348, %344 ], [ %358, %351 ]
  %360 = fmul contract float %339, %359
  %361 = fadd contract float %236, %360
  %362 = or disjoint i64 %316, %138
  %363 = trunc i64 %362 to i32
  %364 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %363
  %.sroa.0310.0.copyload.i = load i16, ptr addrspace(3) %364, align 2, !tbaa.struct !23
  %365 = zext i16 %.sroa.0310.0.copyload.i to i32
  %366 = lshr i32 %365, 10
  %367 = and i32 %366, 31
  %368 = and i32 %365, 1023
  switch i32 %367, label %374 [
    i32 31, label %369
    i32 0, label %376
  ]

369:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %.sroa.0310.0.copyload.signext.i = sext i16 %.sroa.0310.0.copyload.i to i32
  %370 = and i32 %.sroa.0310.0.copyload.signext.i, -2147483648
  %.not1158.i = icmp eq i32 %368, 0
  %371 = select i1 %.not1158.i, i32 2139095040, i32 2143289344
  %372 = or disjoint i32 %371, %370
  %373 = bitcast i32 %372 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

374:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %375 = or disjoint i32 %368, 1024
  br label %376

376:                                              ; preds = %374, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %377 = phi i32 [ %375, %374 ], [ %368, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i ]
  %378 = uitofp i32 %377 to float
  %.not1107.i = icmp eq i32 %367, 0
  %379 = add nsw i32 %367, -25
  %380 = select i1 %.not1107.i, i32 -24, i32 %379
  %381 = call float @__ocml_ldexp_f32(float noundef %378, i32 noundef %380) #6
  %382 = fneg contract float %381
  %.not11081109.i = icmp slt i16 %.sroa.0310.0.copyload.i, 0
  %383 = select contract i1 %.not11081109.i, float %382, float %381
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i: ; preds = %376, %369
  %384 = phi float [ %373, %369 ], [ %383, %376 ]
  %385 = fmul contract float %339, %384
  %386 = fadd contract float %261, %385
  %387 = or disjoint i64 %316, %139
  %388 = trunc i64 %387 to i32
  %389 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %388
  %.sroa.0301.0.copyload.i = load i16, ptr addrspace(3) %389, align 2, !tbaa.struct !23
  %390 = zext i16 %.sroa.0301.0.copyload.i to i32
  %391 = lshr i32 %390, 10
  %392 = and i32 %391, 31
  %393 = and i32 %390, 1023
  switch i32 %392, label %399 [
    i32 31, label %394
    i32 0, label %401
  ]

394:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %.sroa.0301.0.copyload.signext.i = sext i16 %.sroa.0301.0.copyload.i to i32
  %395 = and i32 %.sroa.0301.0.copyload.signext.i, -2147483648
  %.not1157.i = icmp eq i32 %393, 0
  %396 = select i1 %.not1157.i, i32 2139095040, i32 2143289344
  %397 = or disjoint i32 %396, %395
  %398 = bitcast i32 %397 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

399:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %400 = or disjoint i32 %393, 1024
  br label %401

401:                                              ; preds = %399, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %402 = phi i32 [ %400, %399 ], [ %393, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i ]
  %403 = uitofp i32 %402 to float
  %.not1110.i = icmp eq i32 %392, 0
  %404 = add nsw i32 %392, -25
  %405 = select i1 %.not1110.i, i32 -24, i32 %404
  %406 = call float @__ocml_ldexp_f32(float noundef %403, i32 noundef %405) #6
  %407 = fneg contract float %406
  %.not11111112.i = icmp slt i16 %.sroa.0301.0.copyload.i, 0
  %408 = select contract i1 %.not11111112.i, float %407, float %406
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %401, %394
  %409 = phi float [ %398, %394 ], [ %408, %401 ]
  %410 = fmul contract float %339, %409
  %411 = fadd contract float %286, %410
  %412 = or disjoint i64 %316, %140
  %413 = trunc i64 %412 to i32
  %414 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %413
  %.sroa.0292.0.copyload.i = load i16, ptr addrspace(3) %414, align 2, !tbaa.struct !23
  %415 = zext i16 %.sroa.0292.0.copyload.i to i32
  %416 = lshr i32 %415, 10
  %417 = and i32 %416, 31
  %418 = and i32 %415, 1023
  switch i32 %417, label %424 [
    i32 31, label %419
    i32 0, label %426
  ]

419:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0292.0.copyload.signext.i = sext i16 %.sroa.0292.0.copyload.i to i32
  %420 = and i32 %.sroa.0292.0.copyload.signext.i, -2147483648
  %.not1156.i = icmp eq i32 %418, 0
  %421 = select i1 %.not1156.i, i32 2139095040, i32 2143289344
  %422 = or disjoint i32 %421, %420
  %423 = bitcast i32 %422 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

424:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %425 = or disjoint i32 %418, 1024
  br label %426

426:                                              ; preds = %424, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %427 = phi i32 [ %425, %424 ], [ %418, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %428 = uitofp i32 %427 to float
  %.not1113.i = icmp eq i32 %417, 0
  %429 = add nsw i32 %417, -25
  %430 = select i1 %.not1113.i, i32 -24, i32 %429
  %431 = call float @__ocml_ldexp_f32(float noundef %428, i32 noundef %430) #6
  %432 = fneg contract float %431
  %.not11141115.i = icmp slt i16 %.sroa.0292.0.copyload.i, 0
  %433 = select contract i1 %.not11141115.i, float %432, float %431
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %426, %419
  %434 = phi float [ %423, %419 ], [ %433, %426 ]
  %435 = fmul contract float %339, %434
  %436 = fadd contract float %311, %435
  %437 = or disjoint i64 %183, 2
  %438 = add nuw i64 %437, %167
  %439 = trunc i64 %438 to i32
  %440 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %439
  %.sroa.0283.0.copyload.i = load i16, ptr addrspace(3) %440, align 2, !tbaa.struct !23
  %441 = shl nuw nsw i64 %437, 6
  %442 = or disjoint i64 %441, %137
  %443 = trunc i64 %442 to i32
  %444 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %443
  %.sroa.0274.0.copyload.i = load i16, ptr addrspace(3) %444, align 2, !tbaa.struct !23
  %445 = zext i16 %.sroa.0283.0.copyload.i to i32
  %446 = lshr i32 %445, 10
  %447 = and i32 %446, 31
  %448 = and i32 %445, 1023
  switch i32 %447, label %454 [
    i32 31, label %449
    i32 0, label %456
  ]

449:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0283.0.copyload.signext.i = sext i16 %.sroa.0283.0.copyload.i to i32
  %450 = and i32 %.sroa.0283.0.copyload.signext.i, -2147483648
  %.not1155.i = icmp eq i32 %448, 0
  %451 = select i1 %.not1155.i, i32 2139095040, i32 2143289344
  %452 = or disjoint i32 %451, %450
  %453 = bitcast i32 %452 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

454:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %455 = or disjoint i32 %448, 1024
  br label %456

456:                                              ; preds = %454, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %457 = phi i32 [ %455, %454 ], [ %448, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %458 = uitofp i32 %457 to float
  %.not1116.i = icmp eq i32 %447, 0
  %459 = add nsw i32 %447, -25
  %460 = select i1 %.not1116.i, i32 -24, i32 %459
  %461 = call float @__ocml_ldexp_f32(float noundef %458, i32 noundef %460) #6
  %462 = fneg contract float %461
  %.not11171118.i = icmp slt i16 %.sroa.0283.0.copyload.i, 0
  %463 = select contract i1 %.not11171118.i, float %462, float %461
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %456, %449
  %464 = phi float [ %453, %449 ], [ %463, %456 ]
  %465 = zext i16 %.sroa.0274.0.copyload.i to i32
  %466 = lshr i32 %465, 10
  %467 = and i32 %466, 31
  %468 = and i32 %465, 1023
  switch i32 %467, label %474 [
    i32 31, label %469
    i32 0, label %476
  ]

469:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0274.0.copyload.signext.i = sext i16 %.sroa.0274.0.copyload.i to i32
  %470 = and i32 %.sroa.0274.0.copyload.signext.i, -2147483648
  %.not1154.i = icmp eq i32 %468, 0
  %471 = select i1 %.not1154.i, i32 2139095040, i32 2143289344
  %472 = or disjoint i32 %471, %470
  %473 = bitcast i32 %472 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

474:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %475 = or disjoint i32 %468, 1024
  br label %476

476:                                              ; preds = %474, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %477 = phi i32 [ %475, %474 ], [ %468, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %478 = uitofp i32 %477 to float
  %.not1119.i = icmp eq i32 %467, 0
  %479 = add nsw i32 %467, -25
  %480 = select i1 %.not1119.i, i32 -24, i32 %479
  %481 = call float @__ocml_ldexp_f32(float noundef %478, i32 noundef %480) #6
  %482 = fneg contract float %481
  %.not11201121.i = icmp slt i16 %.sroa.0274.0.copyload.i, 0
  %483 = select contract i1 %.not11201121.i, float %482, float %481
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %476, %469
  %484 = phi float [ %473, %469 ], [ %483, %476 ]
  %485 = fmul contract float %464, %484
  %486 = fadd contract float %361, %485
  %487 = or disjoint i64 %441, %138
  %488 = trunc i64 %487 to i32
  %489 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %488
  %.sroa.0265.0.copyload.i = load i16, ptr addrspace(3) %489, align 2, !tbaa.struct !23
  %490 = zext i16 %.sroa.0265.0.copyload.i to i32
  %491 = lshr i32 %490, 10
  %492 = and i32 %491, 31
  %493 = and i32 %490, 1023
  switch i32 %492, label %499 [
    i32 31, label %494
    i32 0, label %501
  ]

494:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0265.0.copyload.signext.i = sext i16 %.sroa.0265.0.copyload.i to i32
  %495 = and i32 %.sroa.0265.0.copyload.signext.i, -2147483648
  %.not1153.i = icmp eq i32 %493, 0
  %496 = select i1 %.not1153.i, i32 2139095040, i32 2143289344
  %497 = or disjoint i32 %496, %495
  %498 = bitcast i32 %497 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

499:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %500 = or disjoint i32 %493, 1024
  br label %501

501:                                              ; preds = %499, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %502 = phi i32 [ %500, %499 ], [ %493, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %503 = uitofp i32 %502 to float
  %.not1122.i = icmp eq i32 %492, 0
  %504 = add nsw i32 %492, -25
  %505 = select i1 %.not1122.i, i32 -24, i32 %504
  %506 = call float @__ocml_ldexp_f32(float noundef %503, i32 noundef %505) #6
  %507 = fneg contract float %506
  %.not11231124.i = icmp slt i16 %.sroa.0265.0.copyload.i, 0
  %508 = select contract i1 %.not11231124.i, float %507, float %506
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %501, %494
  %509 = phi float [ %498, %494 ], [ %508, %501 ]
  %510 = fmul contract float %464, %509
  %511 = fadd contract float %386, %510
  %512 = or disjoint i64 %441, %139
  %513 = trunc i64 %512 to i32
  %514 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %513
  %.sroa.0256.0.copyload.i = load i16, ptr addrspace(3) %514, align 2, !tbaa.struct !23
  %515 = zext i16 %.sroa.0256.0.copyload.i to i32
  %516 = lshr i32 %515, 10
  %517 = and i32 %516, 31
  %518 = and i32 %515, 1023
  switch i32 %517, label %524 [
    i32 31, label %519
    i32 0, label %526
  ]

519:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0256.0.copyload.signext.i = sext i16 %.sroa.0256.0.copyload.i to i32
  %520 = and i32 %.sroa.0256.0.copyload.signext.i, -2147483648
  %.not1152.i = icmp eq i32 %518, 0
  %521 = select i1 %.not1152.i, i32 2139095040, i32 2143289344
  %522 = or disjoint i32 %521, %520
  %523 = bitcast i32 %522 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

524:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %525 = or disjoint i32 %518, 1024
  br label %526

526:                                              ; preds = %524, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %527 = phi i32 [ %525, %524 ], [ %518, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %528 = uitofp i32 %527 to float
  %.not1125.i = icmp eq i32 %517, 0
  %529 = add nsw i32 %517, -25
  %530 = select i1 %.not1125.i, i32 -24, i32 %529
  %531 = call float @__ocml_ldexp_f32(float noundef %528, i32 noundef %530) #6
  %532 = fneg contract float %531
  %.not11261127.i = icmp slt i16 %.sroa.0256.0.copyload.i, 0
  %533 = select contract i1 %.not11261127.i, float %532, float %531
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %526, %519
  %534 = phi float [ %523, %519 ], [ %533, %526 ]
  %535 = fmul contract float %464, %534
  %536 = fadd contract float %411, %535
  %537 = or disjoint i64 %441, %140
  %538 = trunc i64 %537 to i32
  %539 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %538
  %.sroa.0247.0.copyload.i = load i16, ptr addrspace(3) %539, align 2, !tbaa.struct !23
  %540 = zext i16 %.sroa.0247.0.copyload.i to i32
  %541 = lshr i32 %540, 10
  %542 = and i32 %541, 31
  %543 = and i32 %540, 1023
  switch i32 %542, label %549 [
    i32 31, label %544
    i32 0, label %551
  ]

544:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0247.0.copyload.signext.i = sext i16 %.sroa.0247.0.copyload.i to i32
  %545 = and i32 %.sroa.0247.0.copyload.signext.i, -2147483648
  %.not1151.i = icmp eq i32 %543, 0
  %546 = select i1 %.not1151.i, i32 2139095040, i32 2143289344
  %547 = or disjoint i32 %546, %545
  %548 = bitcast i32 %547 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

549:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %550 = or disjoint i32 %543, 1024
  br label %551

551:                                              ; preds = %549, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %552 = phi i32 [ %550, %549 ], [ %543, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %553 = uitofp i32 %552 to float
  %.not1128.i = icmp eq i32 %542, 0
  %554 = add nsw i32 %542, -25
  %555 = select i1 %.not1128.i, i32 -24, i32 %554
  %556 = call float @__ocml_ldexp_f32(float noundef %553, i32 noundef %555) #6
  %557 = fneg contract float %556
  %.not11291130.i = icmp slt i16 %.sroa.0247.0.copyload.i, 0
  %558 = select contract i1 %.not11291130.i, float %557, float %556
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %551, %544
  %559 = phi float [ %548, %544 ], [ %558, %551 ]
  %560 = fmul contract float %464, %559
  %561 = fadd contract float %436, %560
  %562 = or disjoint i64 %183, 3
  %563 = add nuw i64 %562, %167
  %564 = trunc i64 %563 to i32
  %565 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %564
  %.sroa.0238.0.copyload.i = load i16, ptr addrspace(3) %565, align 2, !tbaa.struct !23
  %566 = shl nuw nsw i64 %562, 6
  %567 = or disjoint i64 %566, %137
  %568 = trunc i64 %567 to i32
  %569 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %568
  %.sroa.0229.0.copyload.i = load i16, ptr addrspace(3) %569, align 2, !tbaa.struct !23
  %570 = zext i16 %.sroa.0238.0.copyload.i to i32
  %571 = lshr i32 %570, 10
  %572 = and i32 %571, 31
  %573 = and i32 %570, 1023
  switch i32 %572, label %579 [
    i32 31, label %574
    i32 0, label %581
  ]

574:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0238.0.copyload.signext.i = sext i16 %.sroa.0238.0.copyload.i to i32
  %575 = and i32 %.sroa.0238.0.copyload.signext.i, -2147483648
  %.not1150.i = icmp eq i32 %573, 0
  %576 = select i1 %.not1150.i, i32 2139095040, i32 2143289344
  %577 = or disjoint i32 %576, %575
  %578 = bitcast i32 %577 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

579:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %580 = or disjoint i32 %573, 1024
  br label %581

581:                                              ; preds = %579, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %582 = phi i32 [ %580, %579 ], [ %573, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %583 = uitofp i32 %582 to float
  %.not1131.i = icmp eq i32 %572, 0
  %584 = add nsw i32 %572, -25
  %585 = select i1 %.not1131.i, i32 -24, i32 %584
  %586 = call float @__ocml_ldexp_f32(float noundef %583, i32 noundef %585) #6
  %587 = fneg contract float %586
  %.not11321133.i = icmp slt i16 %.sroa.0238.0.copyload.i, 0
  %588 = select contract i1 %.not11321133.i, float %587, float %586
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %581, %574
  %589 = phi float [ %578, %574 ], [ %588, %581 ]
  %590 = zext i16 %.sroa.0229.0.copyload.i to i32
  %591 = lshr i32 %590, 10
  %592 = and i32 %591, 31
  %593 = and i32 %590, 1023
  switch i32 %592, label %599 [
    i32 31, label %594
    i32 0, label %601
  ]

594:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0229.0.copyload.signext.i = sext i16 %.sroa.0229.0.copyload.i to i32
  %595 = and i32 %.sroa.0229.0.copyload.signext.i, -2147483648
  %.not1149.i = icmp eq i32 %593, 0
  %596 = select i1 %.not1149.i, i32 2139095040, i32 2143289344
  %597 = or disjoint i32 %596, %595
  %598 = bitcast i32 %597 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

599:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %600 = or disjoint i32 %593, 1024
  br label %601

601:                                              ; preds = %599, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %602 = phi i32 [ %600, %599 ], [ %593, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %603 = uitofp i32 %602 to float
  %.not1134.i = icmp eq i32 %592, 0
  %604 = add nsw i32 %592, -25
  %605 = select i1 %.not1134.i, i32 -24, i32 %604
  %606 = call float @__ocml_ldexp_f32(float noundef %603, i32 noundef %605) #6
  %607 = fneg contract float %606
  %.not11351136.i = icmp slt i16 %.sroa.0229.0.copyload.i, 0
  %608 = select contract i1 %.not11351136.i, float %607, float %606
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %601, %594
  %609 = phi float [ %598, %594 ], [ %608, %601 ]
  %610 = fmul contract float %589, %609
  %611 = fadd contract float %486, %610
  %612 = or disjoint i64 %566, %138
  %613 = trunc i64 %612 to i32
  %614 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %613
  %.sroa.0220.0.copyload.i = load i16, ptr addrspace(3) %614, align 2, !tbaa.struct !23
  %615 = zext i16 %.sroa.0220.0.copyload.i to i32
  %616 = lshr i32 %615, 10
  %617 = and i32 %616, 31
  %618 = and i32 %615, 1023
  switch i32 %617, label %624 [
    i32 31, label %619
    i32 0, label %626
  ]

619:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0220.0.copyload.signext.i = sext i16 %.sroa.0220.0.copyload.i to i32
  %620 = and i32 %.sroa.0220.0.copyload.signext.i, -2147483648
  %.not1148.i = icmp eq i32 %618, 0
  %621 = select i1 %.not1148.i, i32 2139095040, i32 2143289344
  %622 = or disjoint i32 %621, %620
  %623 = bitcast i32 %622 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

624:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %625 = or disjoint i32 %618, 1024
  br label %626

626:                                              ; preds = %624, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %627 = phi i32 [ %625, %624 ], [ %618, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %628 = uitofp i32 %627 to float
  %.not1137.i = icmp eq i32 %617, 0
  %629 = add nsw i32 %617, -25
  %630 = select i1 %.not1137.i, i32 -24, i32 %629
  %631 = call float @__ocml_ldexp_f32(float noundef %628, i32 noundef %630) #6
  %632 = fneg contract float %631
  %.not11381139.i = icmp slt i16 %.sroa.0220.0.copyload.i, 0
  %633 = select contract i1 %.not11381139.i, float %632, float %631
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %626, %619
  %634 = phi float [ %623, %619 ], [ %633, %626 ]
  %635 = fmul contract float %589, %634
  %636 = fadd contract float %511, %635
  %637 = or disjoint i64 %566, %139
  %638 = trunc i64 %637 to i32
  %639 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %638
  %.sroa.0211.0.copyload.i = load i16, ptr addrspace(3) %639, align 2, !tbaa.struct !23
  %640 = zext i16 %.sroa.0211.0.copyload.i to i32
  %641 = lshr i32 %640, 10
  %642 = and i32 %641, 31
  %643 = and i32 %640, 1023
  switch i32 %642, label %649 [
    i32 31, label %644
    i32 0, label %651
  ]

644:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0211.0.copyload.signext.i = sext i16 %.sroa.0211.0.copyload.i to i32
  %645 = and i32 %.sroa.0211.0.copyload.signext.i, -2147483648
  %.not1147.i = icmp eq i32 %643, 0
  %646 = select i1 %.not1147.i, i32 2139095040, i32 2143289344
  %647 = or disjoint i32 %646, %645
  %648 = bitcast i32 %647 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

649:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %650 = or disjoint i32 %643, 1024
  br label %651

651:                                              ; preds = %649, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %652 = phi i32 [ %650, %649 ], [ %643, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %653 = uitofp i32 %652 to float
  %.not1140.i = icmp eq i32 %642, 0
  %654 = add nsw i32 %642, -25
  %655 = select i1 %.not1140.i, i32 -24, i32 %654
  %656 = call float @__ocml_ldexp_f32(float noundef %653, i32 noundef %655) #6
  %657 = fneg contract float %656
  %.not11411142.i = icmp slt i16 %.sroa.0211.0.copyload.i, 0
  %658 = select contract i1 %.not11411142.i, float %657, float %656
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %651, %644
  %659 = phi float [ %648, %644 ], [ %658, %651 ]
  %660 = fmul contract float %589, %659
  %661 = fadd contract float %536, %660
  %662 = or disjoint i64 %566, %140
  %663 = trunc i64 %662 to i32
  %664 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %663
  %.sroa.0202.0.copyload.i = load i16, ptr addrspace(3) %664, align 2, !tbaa.struct !23
  %665 = zext i16 %.sroa.0202.0.copyload.i to i32
  %666 = lshr i32 %665, 10
  %667 = and i32 %666, 31
  %668 = and i32 %665, 1023
  switch i32 %667, label %674 [
    i32 31, label %669
    i32 0, label %676
  ]

669:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0202.0.copyload.signext.i = sext i16 %.sroa.0202.0.copyload.i to i32
  %670 = and i32 %.sroa.0202.0.copyload.signext.i, -2147483648
  %.not1146.i = icmp eq i32 %668, 0
  %671 = select i1 %.not1146.i, i32 2139095040, i32 2143289344
  %672 = or disjoint i32 %671, %670
  %673 = bitcast i32 %672 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

674:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %675 = or disjoint i32 %668, 1024
  br label %676

676:                                              ; preds = %674, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %677 = phi i32 [ %675, %674 ], [ %668, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %678 = uitofp i32 %677 to float
  %.not1143.i = icmp eq i32 %667, 0
  %679 = add nsw i32 %667, -25
  %680 = select i1 %.not1143.i, i32 -24, i32 %679
  %681 = call float @__ocml_ldexp_f32(float noundef %678, i32 noundef %680) #6
  %682 = fneg contract float %681
  %.not11441145.i = icmp slt i16 %.sroa.0202.0.copyload.i, 0
  %683 = select contract i1 %.not11441145.i, float %682, float %681
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %676, %669
  %684 = phi float [ %673, %669 ], [ %683, %676 ]
  %685 = fmul contract float %589, %684
  %686 = fadd contract float %561, %685
  %687 = add nuw nsw i64 %183, 4
  %688 = icmp ult i64 %183, 60
  br i1 %688, label %182, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, !llvm.loop !36

689:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, %.lr.ph1191.i
  %690 = phi i64 [ %156, %.lr.ph1191.i ], [ %702, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i ]
  %691 = lshr i64 %690, 6
  %692 = icmp slt i64 %691, %158
  %693 = and i1 %692, %163
  br i1 %693, label %694, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i

694:                                              ; preds = %689
  %695 = trunc i64 %690 to i32
  %696 = getelementptr inbounds float, ptr addrspace(3) %161, i32 %695
  %697 = load float, ptr addrspace(3) %696, align 4, !tbaa !33
  %698 = and i64 %690, 9223372036854775744
  %699 = or disjoint i64 %698, %162
  %700 = or disjoint i64 %699, %156
  %701 = getelementptr inbounds float, ptr %9, i64 %700
  store float %697, ptr %701, align 4, !tbaa !33
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i: ; preds = %694, %689
  %702 = add nuw nsw i64 %690, 64
  %703 = icmp ult i64 %690, 1984
  br i1 %703, label %689, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !37

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="64,64" }
attributes #6 = { nounwind }

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
!19 = distinct !{!19, !20, !21, !22}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!"llvm.loop.vectorize.width", i32 1}
!22 = !{!"llvm.loop.interleave.count", i32 1}
!23 = !{i64 0, i64 2, !24}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C++ TBAA"}
!28 = distinct !{!28, !20, !21, !22}
!29 = distinct !{!29, !20, !21, !22}
!30 = distinct !{!30, !20, !21, !22}
!31 = distinct !{!31, !20, !21, !22}
!32 = distinct !{!32, !20, !21, !22}
!33 = !{!34, !34, i64 0}
!34 = !{!"float", !26, i64 0}
!35 = distinct !{!35, !20}
!36 = distinct !{!36, !20}
!37 = distinct !{!37, !20}
;----------------- End AdaptiveCpp IR dump ---------------
