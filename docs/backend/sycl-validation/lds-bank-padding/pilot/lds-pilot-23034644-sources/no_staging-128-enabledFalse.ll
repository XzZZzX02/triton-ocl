;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-lds-pilot-23034644/tmp/triton-sycl-cache/compile-4nynl6f4/kernel.cpp"
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
  %11 = icmp ult i64 %10, 16777215
  call void @llvm.assume(i1 %11), !noalias !10
  %12 = call i64 @__ockl_get_group_id(i32 noundef 1) #6, !noalias !10
  %13 = icmp ult i64 %12, 2147483647
  call void @llvm.assume(i1 %13), !noalias !10
  %14 = call i64 @__ockl_get_group_id(i32 noundef 0) #6, !noalias !10
  %15 = icmp ult i64 %14, 2147483647
  call void @llvm.assume(i1 %15), !noalias !10
  %16 = call i64 @__ockl_get_local_id(i32 noundef 2) #6, !noalias !13
  %17 = icmp ult i64 %16, 128
  call void @llvm.assume(i1 %17), !noalias !13
  %18 = call i64 @__ockl_get_local_id(i32 noundef 1) #6, !noalias !13
  %19 = icmp eq i64 %18, 0
  call void @llvm.assume(i1 %19), !noalias !13
  %20 = call i64 @__ockl_get_local_id(i32 noundef 0) #6, !noalias !13
  %21 = icmp eq i64 %20, 0
  call void @llvm.assume(i1 %21), !noalias !13
  %22 = call i64 @__ockl_get_num_groups(i32 noundef 2) #6, !noalias !16
  %23 = icmp ult i64 %22, 16777216
  call void @llvm.assume(i1 %23), !noalias !16
  %24 = call i64 @__ockl_get_num_groups(i32 noundef 1) #6, !noalias !16
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25), !noalias !16
  %26 = call i64 @__ockl_get_num_groups(i32 noundef 0) #6, !noalias !16
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27), !noalias !16
  %28 = call i64 @__ockl_get_group_id(i32 noundef 2) #6
  %29 = icmp ult i64 %28, 16777215
  call void @llvm.assume(i1 %29)
  %.tr.i = trunc i64 %28 to i32
  %30 = shl i32 %.tr.i, 11
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = call i64 @__ockl_get_local_id(i32 noundef 2) #6
  %32 = icmp ult i64 %31, 128
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
  %68 = icmp ult i64 %67, 128
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
  %74 = icmp ult i64 %73, 128
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
  %85 = add nuw nsw i64 %76, 128
  %86 = icmp ult i64 %76, 1920
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
  %122 = icmp ult i64 %121, 128
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
  %132 = icmp ult i64 %131, 128
  call void @llvm.assume(i1 %132)
  %133 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %134 = inttoptr i32 %133 to ptr addrspace(3)
  %135 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 12288
  %136 = getelementptr inbounds i8, ptr addrspace(3) %134, i32 24576
  %137 = and i64 %131, 15
  %138 = or disjoint i64 %137, 16
  %139 = or disjoint i64 %137, 32
  %140 = or disjoint i64 %137, 48
  br label %165

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
  %150 = add nuw nsw i64 %141, 128
  %151 = icmp ult i64 %141, 3968
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
  %157 = icmp ult i64 %156, 128
  call void @llvm.assume(i1 %157)
  %158 = sext i32 %3 to i64
  %159 = sext i32 %4 to i64
  %160 = call i32 @llvm.amdgcn.groupstaticsize()
  %161 = inttoptr i32 %160 to ptr addrspace(3)
  %162 = sext i32 %30 to i64
  %163 = and i64 %156, 63
  %164 = icmp slt i64 %163, %159
  br label %690

165:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, %.lr.ph1188.i
  %166 = phi i64 [ %131, %.lr.ph1188.i ], [ %181, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i ]
  %167 = shl nuw nsw i64 %166, 2
  %168 = and i64 %167, 9223372036854775744
  br label %183

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i: ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i
  %169 = or disjoint i64 %168, %137
  %170 = trunc i64 %169 to i32
  %171 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %170
  store float %612, ptr addrspace(3) %171, align 4, !tbaa !33
  %172 = or disjoint i64 %168, %138
  %173 = trunc i64 %172 to i32
  %174 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %173
  store float %637, ptr addrspace(3) %174, align 4, !tbaa !33
  %175 = or disjoint i64 %168, %139
  %176 = trunc i64 %175 to i32
  %177 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %176
  store float %662, ptr addrspace(3) %177, align 4, !tbaa !33
  %178 = or disjoint i64 %168, %140
  %179 = trunc i64 %178 to i32
  %180 = getelementptr inbounds float, ptr addrspace(3) %134, i32 %179
  store float %687, ptr addrspace(3) %180, align 4, !tbaa !33
  %181 = add nuw nsw i64 %166, 128
  %182 = icmp ult i64 %166, 384
  br i1 %182, label %165, label %.lr.ph1191.i, !llvm.loop !35

183:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i, %165
  %184 = phi i64 [ 0, %165 ], [ %688, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %185 = phi float [ 0.000000e+00, %165 ], [ %687, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %186 = phi float [ 0.000000e+00, %165 ], [ %662, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %187 = phi float [ 0.000000e+00, %165 ], [ %637, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %188 = phi float [ 0.000000e+00, %165 ], [ %612, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i ]
  %189 = add nuw i64 %184, %168
  %190 = trunc i64 %189 to i32
  %191 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %190
  %.sroa.0373.0.copyload.i = load i16, ptr addrspace(3) %191, align 2, !tbaa.struct !23
  %192 = shl nuw nsw i64 %184, 6
  %193 = or disjoint i64 %192, %137
  %194 = trunc i64 %193 to i32
  %195 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %194
  %.sroa.0364.0.copyload.i = load i16, ptr addrspace(3) %195, align 2, !tbaa.struct !23
  %196 = zext i16 %.sroa.0373.0.copyload.i to i32
  %197 = lshr i32 %196, 10
  %198 = and i32 %197, 31
  %199 = and i32 %196, 1023
  switch i32 %198, label %205 [
    i32 31, label %200
    i32 0, label %207
  ]

200:                                              ; preds = %183
  %.sroa.0373.0.copyload.signext.i = sext i16 %.sroa.0373.0.copyload.i to i32
  %201 = and i32 %.sroa.0373.0.copyload.signext.i, -2147483648
  %.not1165.i = icmp eq i32 %199, 0
  %202 = select i1 %.not1165.i, i32 2139095040, i32 2143289344
  %203 = or disjoint i32 %202, %201
  %204 = bitcast i32 %203 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

205:                                              ; preds = %183
  %206 = or disjoint i32 %199, 1024
  br label %207

207:                                              ; preds = %205, %183
  %208 = phi i32 [ %206, %205 ], [ %199, %183 ]
  %209 = uitofp i32 %208 to float
  %.not.i = icmp eq i32 %198, 0
  %210 = add nsw i32 %198, -25
  %211 = select i1 %.not.i, i32 -24, i32 %210
  %212 = call float @__ocml_ldexp_f32(float noundef %209, i32 noundef %211) #6
  %213 = fneg contract float %212
  %.not10871088.i = icmp slt i16 %.sroa.0373.0.copyload.i, 0
  %214 = select contract i1 %.not10871088.i, float %213, float %212
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i: ; preds = %207, %200
  %215 = phi float [ %204, %200 ], [ %214, %207 ]
  %216 = zext i16 %.sroa.0364.0.copyload.i to i32
  %217 = lshr i32 %216, 10
  %218 = and i32 %217, 31
  %219 = and i32 %216, 1023
  switch i32 %218, label %225 [
    i32 31, label %220
    i32 0, label %227
  ]

220:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %.sroa.0364.0.copyload.signext.i = sext i16 %.sroa.0364.0.copyload.i to i32
  %221 = and i32 %.sroa.0364.0.copyload.signext.i, -2147483648
  %.not1164.i = icmp eq i32 %219, 0
  %222 = select i1 %.not1164.i, i32 2139095040, i32 2143289344
  %223 = or disjoint i32 %222, %221
  %224 = bitcast i32 %223 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

225:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %226 = or disjoint i32 %219, 1024
  br label %227

227:                                              ; preds = %225, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i
  %228 = phi i32 [ %226, %225 ], [ %219, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit35.i.i.i ]
  %229 = uitofp i32 %228 to float
  %.not1089.i = icmp eq i32 %218, 0
  %230 = add nsw i32 %218, -25
  %231 = select i1 %.not1089.i, i32 -24, i32 %230
  %232 = call float @__ocml_ldexp_f32(float noundef %229, i32 noundef %231) #6
  %233 = fneg contract float %232
  %.not10901091.i = icmp slt i16 %.sroa.0364.0.copyload.i, 0
  %234 = select contract i1 %.not10901091.i, float %233, float %232
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i: ; preds = %227, %220
  %235 = phi float [ %224, %220 ], [ %234, %227 ]
  %236 = fmul contract float %215, %235
  %237 = fadd contract float %188, %236
  %238 = or disjoint i64 %192, %138
  %239 = trunc i64 %238 to i32
  %240 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %239
  %.sroa.0355.0.copyload.i = load i16, ptr addrspace(3) %240, align 2, !tbaa.struct !23
  %241 = zext i16 %.sroa.0355.0.copyload.i to i32
  %242 = lshr i32 %241, 10
  %243 = and i32 %242, 31
  %244 = and i32 %241, 1023
  switch i32 %243, label %250 [
    i32 31, label %245
    i32 0, label %252
  ]

245:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %.sroa.0355.0.copyload.signext.i = sext i16 %.sroa.0355.0.copyload.i to i32
  %246 = and i32 %.sroa.0355.0.copyload.signext.i, -2147483648
  %.not1163.i = icmp eq i32 %244, 0
  %247 = select i1 %.not1163.i, i32 2139095040, i32 2143289344
  %248 = or disjoint i32 %247, %246
  %249 = bitcast i32 %248 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

250:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %251 = or disjoint i32 %244, 1024
  br label %252

252:                                              ; preds = %250, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i
  %253 = phi i32 [ %251, %250 ], [ %244, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit34.i.i.i ]
  %254 = uitofp i32 %253 to float
  %.not1092.i = icmp eq i32 %243, 0
  %255 = add nsw i32 %243, -25
  %256 = select i1 %.not1092.i, i32 -24, i32 %255
  %257 = call float @__ocml_ldexp_f32(float noundef %254, i32 noundef %256) #6
  %258 = fneg contract float %257
  %.not10931094.i = icmp slt i16 %.sroa.0355.0.copyload.i, 0
  %259 = select contract i1 %.not10931094.i, float %258, float %257
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i: ; preds = %252, %245
  %260 = phi float [ %249, %245 ], [ %259, %252 ]
  %261 = fmul contract float %215, %260
  %262 = fadd contract float %187, %261
  %263 = or disjoint i64 %192, %139
  %264 = trunc i64 %263 to i32
  %265 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %264
  %.sroa.0346.0.copyload.i = load i16, ptr addrspace(3) %265, align 2, !tbaa.struct !23
  %266 = zext i16 %.sroa.0346.0.copyload.i to i32
  %267 = lshr i32 %266, 10
  %268 = and i32 %267, 31
  %269 = and i32 %266, 1023
  switch i32 %268, label %275 [
    i32 31, label %270
    i32 0, label %277
  ]

270:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %.sroa.0346.0.copyload.signext.i = sext i16 %.sroa.0346.0.copyload.i to i32
  %271 = and i32 %.sroa.0346.0.copyload.signext.i, -2147483648
  %.not1162.i = icmp eq i32 %269, 0
  %272 = select i1 %.not1162.i, i32 2139095040, i32 2143289344
  %273 = or disjoint i32 %272, %271
  %274 = bitcast i32 %273 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

275:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %276 = or disjoint i32 %269, 1024
  br label %277

277:                                              ; preds = %275, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i
  %278 = phi i32 [ %276, %275 ], [ %269, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit33.i.i.i ]
  %279 = uitofp i32 %278 to float
  %.not1095.i = icmp eq i32 %268, 0
  %280 = add nsw i32 %268, -25
  %281 = select i1 %.not1095.i, i32 -24, i32 %280
  %282 = call float @__ocml_ldexp_f32(float noundef %279, i32 noundef %281) #6
  %283 = fneg contract float %282
  %.not10961097.i = icmp slt i16 %.sroa.0346.0.copyload.i, 0
  %284 = select contract i1 %.not10961097.i, float %283, float %282
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i: ; preds = %277, %270
  %285 = phi float [ %274, %270 ], [ %284, %277 ]
  %286 = fmul contract float %215, %285
  %287 = fadd contract float %186, %286
  %288 = or disjoint i64 %192, %140
  %289 = trunc i64 %288 to i32
  %290 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %289
  %.sroa.0337.0.copyload.i = load i16, ptr addrspace(3) %290, align 2, !tbaa.struct !23
  %291 = zext i16 %.sroa.0337.0.copyload.i to i32
  %292 = lshr i32 %291, 10
  %293 = and i32 %292, 31
  %294 = and i32 %291, 1023
  switch i32 %293, label %300 [
    i32 31, label %295
    i32 0, label %302
  ]

295:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %.sroa.0337.0.copyload.signext.i = sext i16 %.sroa.0337.0.copyload.i to i32
  %296 = and i32 %.sroa.0337.0.copyload.signext.i, -2147483648
  %.not1161.i = icmp eq i32 %294, 0
  %297 = select i1 %.not1161.i, i32 2139095040, i32 2143289344
  %298 = or disjoint i32 %297, %296
  %299 = bitcast i32 %298 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

300:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %301 = or disjoint i32 %294, 1024
  br label %302

302:                                              ; preds = %300, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i
  %303 = phi i32 [ %301, %300 ], [ %294, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit32.i.i.i ]
  %304 = uitofp i32 %303 to float
  %.not1098.i = icmp eq i32 %293, 0
  %305 = add nsw i32 %293, -25
  %306 = select i1 %.not1098.i, i32 -24, i32 %305
  %307 = call float @__ocml_ldexp_f32(float noundef %304, i32 noundef %306) #6
  %308 = fneg contract float %307
  %.not10991100.i = icmp slt i16 %.sroa.0337.0.copyload.i, 0
  %309 = select contract i1 %.not10991100.i, float %308, float %307
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i: ; preds = %302, %295
  %310 = phi float [ %299, %295 ], [ %309, %302 ]
  %311 = fmul contract float %215, %310
  %312 = fadd contract float %185, %311
  %313 = or disjoint i64 %184, 1
  %314 = add nuw i64 %313, %168
  %315 = trunc i64 %314 to i32
  %316 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %315
  %.sroa.0328.0.copyload.i = load i16, ptr addrspace(3) %316, align 2, !tbaa.struct !23
  %317 = shl nuw nsw i64 %313, 6
  %318 = or disjoint i64 %317, %137
  %319 = trunc i64 %318 to i32
  %320 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %319
  %.sroa.0319.0.copyload.i = load i16, ptr addrspace(3) %320, align 2, !tbaa.struct !23
  %321 = zext i16 %.sroa.0328.0.copyload.i to i32
  %322 = lshr i32 %321, 10
  %323 = and i32 %322, 31
  %324 = and i32 %321, 1023
  switch i32 %323, label %330 [
    i32 31, label %325
    i32 0, label %332
  ]

325:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %.sroa.0328.0.copyload.signext.i = sext i16 %.sroa.0328.0.copyload.i to i32
  %326 = and i32 %.sroa.0328.0.copyload.signext.i, -2147483648
  %.not1160.i = icmp eq i32 %324, 0
  %327 = select i1 %.not1160.i, i32 2139095040, i32 2143289344
  %328 = or disjoint i32 %327, %326
  %329 = bitcast i32 %328 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

330:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %331 = or disjoint i32 %324, 1024
  br label %332

332:                                              ; preds = %330, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i
  %333 = phi i32 [ %331, %330 ], [ %324, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit31.i.i.i ]
  %334 = uitofp i32 %333 to float
  %.not1101.i = icmp eq i32 %323, 0
  %335 = add nsw i32 %323, -25
  %336 = select i1 %.not1101.i, i32 -24, i32 %335
  %337 = call float @__ocml_ldexp_f32(float noundef %334, i32 noundef %336) #6
  %338 = fneg contract float %337
  %.not11021103.i = icmp slt i16 %.sroa.0328.0.copyload.i, 0
  %339 = select contract i1 %.not11021103.i, float %338, float %337
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i: ; preds = %332, %325
  %340 = phi float [ %329, %325 ], [ %339, %332 ]
  %341 = zext i16 %.sroa.0319.0.copyload.i to i32
  %342 = lshr i32 %341, 10
  %343 = and i32 %342, 31
  %344 = and i32 %341, 1023
  switch i32 %343, label %350 [
    i32 31, label %345
    i32 0, label %352
  ]

345:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %.sroa.0319.0.copyload.signext.i = sext i16 %.sroa.0319.0.copyload.i to i32
  %346 = and i32 %.sroa.0319.0.copyload.signext.i, -2147483648
  %.not1159.i = icmp eq i32 %344, 0
  %347 = select i1 %.not1159.i, i32 2139095040, i32 2143289344
  %348 = or disjoint i32 %347, %346
  %349 = bitcast i32 %348 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

350:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %351 = or disjoint i32 %344, 1024
  br label %352

352:                                              ; preds = %350, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i
  %353 = phi i32 [ %351, %350 ], [ %344, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit30.i.i.i ]
  %354 = uitofp i32 %353 to float
  %.not1104.i = icmp eq i32 %343, 0
  %355 = add nsw i32 %343, -25
  %356 = select i1 %.not1104.i, i32 -24, i32 %355
  %357 = call float @__ocml_ldexp_f32(float noundef %354, i32 noundef %356) #6
  %358 = fneg contract float %357
  %.not11051106.i = icmp slt i16 %.sroa.0319.0.copyload.i, 0
  %359 = select contract i1 %.not11051106.i, float %358, float %357
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i: ; preds = %352, %345
  %360 = phi float [ %349, %345 ], [ %359, %352 ]
  %361 = fmul contract float %340, %360
  %362 = fadd contract float %237, %361
  %363 = or disjoint i64 %317, %138
  %364 = trunc i64 %363 to i32
  %365 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %364
  %.sroa.0310.0.copyload.i = load i16, ptr addrspace(3) %365, align 2, !tbaa.struct !23
  %366 = zext i16 %.sroa.0310.0.copyload.i to i32
  %367 = lshr i32 %366, 10
  %368 = and i32 %367, 31
  %369 = and i32 %366, 1023
  switch i32 %368, label %375 [
    i32 31, label %370
    i32 0, label %377
  ]

370:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %.sroa.0310.0.copyload.signext.i = sext i16 %.sroa.0310.0.copyload.i to i32
  %371 = and i32 %.sroa.0310.0.copyload.signext.i, -2147483648
  %.not1158.i = icmp eq i32 %369, 0
  %372 = select i1 %.not1158.i, i32 2139095040, i32 2143289344
  %373 = or disjoint i32 %372, %371
  %374 = bitcast i32 %373 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

375:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %376 = or disjoint i32 %369, 1024
  br label %377

377:                                              ; preds = %375, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i
  %378 = phi i32 [ %376, %375 ], [ %369, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit29.i.i.i ]
  %379 = uitofp i32 %378 to float
  %.not1107.i = icmp eq i32 %368, 0
  %380 = add nsw i32 %368, -25
  %381 = select i1 %.not1107.i, i32 -24, i32 %380
  %382 = call float @__ocml_ldexp_f32(float noundef %379, i32 noundef %381) #6
  %383 = fneg contract float %382
  %.not11081109.i = icmp slt i16 %.sroa.0310.0.copyload.i, 0
  %384 = select contract i1 %.not11081109.i, float %383, float %382
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i: ; preds = %377, %370
  %385 = phi float [ %374, %370 ], [ %384, %377 ]
  %386 = fmul contract float %340, %385
  %387 = fadd contract float %262, %386
  %388 = or disjoint i64 %317, %139
  %389 = trunc i64 %388 to i32
  %390 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %389
  %.sroa.0301.0.copyload.i = load i16, ptr addrspace(3) %390, align 2, !tbaa.struct !23
  %391 = zext i16 %.sroa.0301.0.copyload.i to i32
  %392 = lshr i32 %391, 10
  %393 = and i32 %392, 31
  %394 = and i32 %391, 1023
  switch i32 %393, label %400 [
    i32 31, label %395
    i32 0, label %402
  ]

395:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %.sroa.0301.0.copyload.signext.i = sext i16 %.sroa.0301.0.copyload.i to i32
  %396 = and i32 %.sroa.0301.0.copyload.signext.i, -2147483648
  %.not1157.i = icmp eq i32 %394, 0
  %397 = select i1 %.not1157.i, i32 2139095040, i32 2143289344
  %398 = or disjoint i32 %397, %396
  %399 = bitcast i32 %398 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

400:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %401 = or disjoint i32 %394, 1024
  br label %402

402:                                              ; preds = %400, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i
  %403 = phi i32 [ %401, %400 ], [ %394, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit28.i.i.i ]
  %404 = uitofp i32 %403 to float
  %.not1110.i = icmp eq i32 %393, 0
  %405 = add nsw i32 %393, -25
  %406 = select i1 %.not1110.i, i32 -24, i32 %405
  %407 = call float @__ocml_ldexp_f32(float noundef %404, i32 noundef %406) #6
  %408 = fneg contract float %407
  %.not11111112.i = icmp slt i16 %.sroa.0301.0.copyload.i, 0
  %409 = select contract i1 %.not11111112.i, float %408, float %407
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i: ; preds = %402, %395
  %410 = phi float [ %399, %395 ], [ %409, %402 ]
  %411 = fmul contract float %340, %410
  %412 = fadd contract float %287, %411
  %413 = or disjoint i64 %317, %140
  %414 = trunc i64 %413 to i32
  %415 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %414
  %.sroa.0292.0.copyload.i = load i16, ptr addrspace(3) %415, align 2, !tbaa.struct !23
  %416 = zext i16 %.sroa.0292.0.copyload.i to i32
  %417 = lshr i32 %416, 10
  %418 = and i32 %417, 31
  %419 = and i32 %416, 1023
  switch i32 %418, label %425 [
    i32 31, label %420
    i32 0, label %427
  ]

420:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %.sroa.0292.0.copyload.signext.i = sext i16 %.sroa.0292.0.copyload.i to i32
  %421 = and i32 %.sroa.0292.0.copyload.signext.i, -2147483648
  %.not1156.i = icmp eq i32 %419, 0
  %422 = select i1 %.not1156.i, i32 2139095040, i32 2143289344
  %423 = or disjoint i32 %422, %421
  %424 = bitcast i32 %423 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

425:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %426 = or disjoint i32 %419, 1024
  br label %427

427:                                              ; preds = %425, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i
  %428 = phi i32 [ %426, %425 ], [ %419, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit27.i.i.i ]
  %429 = uitofp i32 %428 to float
  %.not1113.i = icmp eq i32 %418, 0
  %430 = add nsw i32 %418, -25
  %431 = select i1 %.not1113.i, i32 -24, i32 %430
  %432 = call float @__ocml_ldexp_f32(float noundef %429, i32 noundef %431) #6
  %433 = fneg contract float %432
  %.not11141115.i = icmp slt i16 %.sroa.0292.0.copyload.i, 0
  %434 = select contract i1 %.not11141115.i, float %433, float %432
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i: ; preds = %427, %420
  %435 = phi float [ %424, %420 ], [ %434, %427 ]
  %436 = fmul contract float %340, %435
  %437 = fadd contract float %312, %436
  %438 = or disjoint i64 %184, 2
  %439 = add nuw i64 %438, %168
  %440 = trunc i64 %439 to i32
  %441 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %440
  %.sroa.0283.0.copyload.i = load i16, ptr addrspace(3) %441, align 2, !tbaa.struct !23
  %442 = shl nuw nsw i64 %438, 6
  %443 = or disjoint i64 %442, %137
  %444 = trunc i64 %443 to i32
  %445 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %444
  %.sroa.0274.0.copyload.i = load i16, ptr addrspace(3) %445, align 2, !tbaa.struct !23
  %446 = zext i16 %.sroa.0283.0.copyload.i to i32
  %447 = lshr i32 %446, 10
  %448 = and i32 %447, 31
  %449 = and i32 %446, 1023
  switch i32 %448, label %455 [
    i32 31, label %450
    i32 0, label %457
  ]

450:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %.sroa.0283.0.copyload.signext.i = sext i16 %.sroa.0283.0.copyload.i to i32
  %451 = and i32 %.sroa.0283.0.copyload.signext.i, -2147483648
  %.not1155.i = icmp eq i32 %449, 0
  %452 = select i1 %.not1155.i, i32 2139095040, i32 2143289344
  %453 = or disjoint i32 %452, %451
  %454 = bitcast i32 %453 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

455:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %456 = or disjoint i32 %449, 1024
  br label %457

457:                                              ; preds = %455, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i
  %458 = phi i32 [ %456, %455 ], [ %449, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit26.i.i.i ]
  %459 = uitofp i32 %458 to float
  %.not1116.i = icmp eq i32 %448, 0
  %460 = add nsw i32 %448, -25
  %461 = select i1 %.not1116.i, i32 -24, i32 %460
  %462 = call float @__ocml_ldexp_f32(float noundef %459, i32 noundef %461) #6
  %463 = fneg contract float %462
  %.not11171118.i = icmp slt i16 %.sroa.0283.0.copyload.i, 0
  %464 = select contract i1 %.not11171118.i, float %463, float %462
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i: ; preds = %457, %450
  %465 = phi float [ %454, %450 ], [ %464, %457 ]
  %466 = zext i16 %.sroa.0274.0.copyload.i to i32
  %467 = lshr i32 %466, 10
  %468 = and i32 %467, 31
  %469 = and i32 %466, 1023
  switch i32 %468, label %475 [
    i32 31, label %470
    i32 0, label %477
  ]

470:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %.sroa.0274.0.copyload.signext.i = sext i16 %.sroa.0274.0.copyload.i to i32
  %471 = and i32 %.sroa.0274.0.copyload.signext.i, -2147483648
  %.not1154.i = icmp eq i32 %469, 0
  %472 = select i1 %.not1154.i, i32 2139095040, i32 2143289344
  %473 = or disjoint i32 %472, %471
  %474 = bitcast i32 %473 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

475:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %476 = or disjoint i32 %469, 1024
  br label %477

477:                                              ; preds = %475, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i
  %478 = phi i32 [ %476, %475 ], [ %469, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit25.i.i.i ]
  %479 = uitofp i32 %478 to float
  %.not1119.i = icmp eq i32 %468, 0
  %480 = add nsw i32 %468, -25
  %481 = select i1 %.not1119.i, i32 -24, i32 %480
  %482 = call float @__ocml_ldexp_f32(float noundef %479, i32 noundef %481) #6
  %483 = fneg contract float %482
  %.not11201121.i = icmp slt i16 %.sroa.0274.0.copyload.i, 0
  %484 = select contract i1 %.not11201121.i, float %483, float %482
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i: ; preds = %477, %470
  %485 = phi float [ %474, %470 ], [ %484, %477 ]
  %486 = fmul contract float %465, %485
  %487 = fadd contract float %362, %486
  %488 = or disjoint i64 %442, %138
  %489 = trunc i64 %488 to i32
  %490 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %489
  %.sroa.0265.0.copyload.i = load i16, ptr addrspace(3) %490, align 2, !tbaa.struct !23
  %491 = zext i16 %.sroa.0265.0.copyload.i to i32
  %492 = lshr i32 %491, 10
  %493 = and i32 %492, 31
  %494 = and i32 %491, 1023
  switch i32 %493, label %500 [
    i32 31, label %495
    i32 0, label %502
  ]

495:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %.sroa.0265.0.copyload.signext.i = sext i16 %.sroa.0265.0.copyload.i to i32
  %496 = and i32 %.sroa.0265.0.copyload.signext.i, -2147483648
  %.not1153.i = icmp eq i32 %494, 0
  %497 = select i1 %.not1153.i, i32 2139095040, i32 2143289344
  %498 = or disjoint i32 %497, %496
  %499 = bitcast i32 %498 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

500:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %501 = or disjoint i32 %494, 1024
  br label %502

502:                                              ; preds = %500, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i
  %503 = phi i32 [ %501, %500 ], [ %494, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit24.i.i.i ]
  %504 = uitofp i32 %503 to float
  %.not1122.i = icmp eq i32 %493, 0
  %505 = add nsw i32 %493, -25
  %506 = select i1 %.not1122.i, i32 -24, i32 %505
  %507 = call float @__ocml_ldexp_f32(float noundef %504, i32 noundef %506) #6
  %508 = fneg contract float %507
  %.not11231124.i = icmp slt i16 %.sroa.0265.0.copyload.i, 0
  %509 = select contract i1 %.not11231124.i, float %508, float %507
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i: ; preds = %502, %495
  %510 = phi float [ %499, %495 ], [ %509, %502 ]
  %511 = fmul contract float %465, %510
  %512 = fadd contract float %387, %511
  %513 = or disjoint i64 %442, %139
  %514 = trunc i64 %513 to i32
  %515 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %514
  %.sroa.0256.0.copyload.i = load i16, ptr addrspace(3) %515, align 2, !tbaa.struct !23
  %516 = zext i16 %.sroa.0256.0.copyload.i to i32
  %517 = lshr i32 %516, 10
  %518 = and i32 %517, 31
  %519 = and i32 %516, 1023
  switch i32 %518, label %525 [
    i32 31, label %520
    i32 0, label %527
  ]

520:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %.sroa.0256.0.copyload.signext.i = sext i16 %.sroa.0256.0.copyload.i to i32
  %521 = and i32 %.sroa.0256.0.copyload.signext.i, -2147483648
  %.not1152.i = icmp eq i32 %519, 0
  %522 = select i1 %.not1152.i, i32 2139095040, i32 2143289344
  %523 = or disjoint i32 %522, %521
  %524 = bitcast i32 %523 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

525:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %526 = or disjoint i32 %519, 1024
  br label %527

527:                                              ; preds = %525, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i
  %528 = phi i32 [ %526, %525 ], [ %519, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit23.i.i.i ]
  %529 = uitofp i32 %528 to float
  %.not1125.i = icmp eq i32 %518, 0
  %530 = add nsw i32 %518, -25
  %531 = select i1 %.not1125.i, i32 -24, i32 %530
  %532 = call float @__ocml_ldexp_f32(float noundef %529, i32 noundef %531) #6
  %533 = fneg contract float %532
  %.not11261127.i = icmp slt i16 %.sroa.0256.0.copyload.i, 0
  %534 = select contract i1 %.not11261127.i, float %533, float %532
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i: ; preds = %527, %520
  %535 = phi float [ %524, %520 ], [ %534, %527 ]
  %536 = fmul contract float %465, %535
  %537 = fadd contract float %412, %536
  %538 = or disjoint i64 %442, %140
  %539 = trunc i64 %538 to i32
  %540 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %539
  %.sroa.0247.0.copyload.i = load i16, ptr addrspace(3) %540, align 2, !tbaa.struct !23
  %541 = zext i16 %.sroa.0247.0.copyload.i to i32
  %542 = lshr i32 %541, 10
  %543 = and i32 %542, 31
  %544 = and i32 %541, 1023
  switch i32 %543, label %550 [
    i32 31, label %545
    i32 0, label %552
  ]

545:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %.sroa.0247.0.copyload.signext.i = sext i16 %.sroa.0247.0.copyload.i to i32
  %546 = and i32 %.sroa.0247.0.copyload.signext.i, -2147483648
  %.not1151.i = icmp eq i32 %544, 0
  %547 = select i1 %.not1151.i, i32 2139095040, i32 2143289344
  %548 = or disjoint i32 %547, %546
  %549 = bitcast i32 %548 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

550:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %551 = or disjoint i32 %544, 1024
  br label %552

552:                                              ; preds = %550, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i
  %553 = phi i32 [ %551, %550 ], [ %544, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit22.i.i.i ]
  %554 = uitofp i32 %553 to float
  %.not1128.i = icmp eq i32 %543, 0
  %555 = add nsw i32 %543, -25
  %556 = select i1 %.not1128.i, i32 -24, i32 %555
  %557 = call float @__ocml_ldexp_f32(float noundef %554, i32 noundef %556) #6
  %558 = fneg contract float %557
  %.not11291130.i = icmp slt i16 %.sroa.0247.0.copyload.i, 0
  %559 = select contract i1 %.not11291130.i, float %558, float %557
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i: ; preds = %552, %545
  %560 = phi float [ %549, %545 ], [ %559, %552 ]
  %561 = fmul contract float %465, %560
  %562 = fadd contract float %437, %561
  %563 = or disjoint i64 %184, 3
  %564 = add nuw i64 %563, %168
  %565 = trunc i64 %564 to i32
  %566 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %135, i32 %565
  %.sroa.0238.0.copyload.i = load i16, ptr addrspace(3) %566, align 2, !tbaa.struct !23
  %567 = shl nuw nsw i64 %563, 6
  %568 = or disjoint i64 %567, %137
  %569 = trunc i64 %568 to i32
  %570 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %569
  %.sroa.0229.0.copyload.i = load i16, ptr addrspace(3) %570, align 2, !tbaa.struct !23
  %571 = zext i16 %.sroa.0238.0.copyload.i to i32
  %572 = lshr i32 %571, 10
  %573 = and i32 %572, 31
  %574 = and i32 %571, 1023
  switch i32 %573, label %580 [
    i32 31, label %575
    i32 0, label %582
  ]

575:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %.sroa.0238.0.copyload.signext.i = sext i16 %.sroa.0238.0.copyload.i to i32
  %576 = and i32 %.sroa.0238.0.copyload.signext.i, -2147483648
  %.not1150.i = icmp eq i32 %574, 0
  %577 = select i1 %.not1150.i, i32 2139095040, i32 2143289344
  %578 = or disjoint i32 %577, %576
  %579 = bitcast i32 %578 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

580:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %581 = or disjoint i32 %574, 1024
  br label %582

582:                                              ; preds = %580, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i
  %583 = phi i32 [ %581, %580 ], [ %574, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit21.i.i.i ]
  %584 = uitofp i32 %583 to float
  %.not1131.i = icmp eq i32 %573, 0
  %585 = add nsw i32 %573, -25
  %586 = select i1 %.not1131.i, i32 -24, i32 %585
  %587 = call float @__ocml_ldexp_f32(float noundef %584, i32 noundef %586) #6
  %588 = fneg contract float %587
  %.not11321133.i = icmp slt i16 %.sroa.0238.0.copyload.i, 0
  %589 = select contract i1 %.not11321133.i, float %588, float %587
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i: ; preds = %582, %575
  %590 = phi float [ %579, %575 ], [ %589, %582 ]
  %591 = zext i16 %.sroa.0229.0.copyload.i to i32
  %592 = lshr i32 %591, 10
  %593 = and i32 %592, 31
  %594 = and i32 %591, 1023
  switch i32 %593, label %600 [
    i32 31, label %595
    i32 0, label %602
  ]

595:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %.sroa.0229.0.copyload.signext.i = sext i16 %.sroa.0229.0.copyload.i to i32
  %596 = and i32 %.sroa.0229.0.copyload.signext.i, -2147483648
  %.not1149.i = icmp eq i32 %594, 0
  %597 = select i1 %.not1149.i, i32 2139095040, i32 2143289344
  %598 = or disjoint i32 %597, %596
  %599 = bitcast i32 %598 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

600:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %601 = or disjoint i32 %594, 1024
  br label %602

602:                                              ; preds = %600, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i
  %603 = phi i32 [ %601, %600 ], [ %594, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit20.i.i.i ]
  %604 = uitofp i32 %603 to float
  %.not1134.i = icmp eq i32 %593, 0
  %605 = add nsw i32 %593, -25
  %606 = select i1 %.not1134.i, i32 -24, i32 %605
  %607 = call float @__ocml_ldexp_f32(float noundef %604, i32 noundef %606) #6
  %608 = fneg contract float %607
  %.not11351136.i = icmp slt i16 %.sroa.0229.0.copyload.i, 0
  %609 = select contract i1 %.not11351136.i, float %608, float %607
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i: ; preds = %602, %595
  %610 = phi float [ %599, %595 ], [ %609, %602 ]
  %611 = fmul contract float %590, %610
  %612 = fadd contract float %487, %611
  %613 = or disjoint i64 %567, %138
  %614 = trunc i64 %613 to i32
  %615 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %614
  %.sroa.0220.0.copyload.i = load i16, ptr addrspace(3) %615, align 2, !tbaa.struct !23
  %616 = zext i16 %.sroa.0220.0.copyload.i to i32
  %617 = lshr i32 %616, 10
  %618 = and i32 %617, 31
  %619 = and i32 %616, 1023
  switch i32 %618, label %625 [
    i32 31, label %620
    i32 0, label %627
  ]

620:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %.sroa.0220.0.copyload.signext.i = sext i16 %.sroa.0220.0.copyload.i to i32
  %621 = and i32 %.sroa.0220.0.copyload.signext.i, -2147483648
  %.not1148.i = icmp eq i32 %619, 0
  %622 = select i1 %.not1148.i, i32 2139095040, i32 2143289344
  %623 = or disjoint i32 %622, %621
  %624 = bitcast i32 %623 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

625:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %626 = or disjoint i32 %619, 1024
  br label %627

627:                                              ; preds = %625, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i
  %628 = phi i32 [ %626, %625 ], [ %619, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit19.i.i.i ]
  %629 = uitofp i32 %628 to float
  %.not1137.i = icmp eq i32 %618, 0
  %630 = add nsw i32 %618, -25
  %631 = select i1 %.not1137.i, i32 -24, i32 %630
  %632 = call float @__ocml_ldexp_f32(float noundef %629, i32 noundef %631) #6
  %633 = fneg contract float %632
  %.not11381139.i = icmp slt i16 %.sroa.0220.0.copyload.i, 0
  %634 = select contract i1 %.not11381139.i, float %633, float %632
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i: ; preds = %627, %620
  %635 = phi float [ %624, %620 ], [ %634, %627 ]
  %636 = fmul contract float %590, %635
  %637 = fadd contract float %512, %636
  %638 = or disjoint i64 %567, %139
  %639 = trunc i64 %638 to i32
  %640 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %639
  %.sroa.0211.0.copyload.i = load i16, ptr addrspace(3) %640, align 2, !tbaa.struct !23
  %641 = zext i16 %.sroa.0211.0.copyload.i to i32
  %642 = lshr i32 %641, 10
  %643 = and i32 %642, 31
  %644 = and i32 %641, 1023
  switch i32 %643, label %650 [
    i32 31, label %645
    i32 0, label %652
  ]

645:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %.sroa.0211.0.copyload.signext.i = sext i16 %.sroa.0211.0.copyload.i to i32
  %646 = and i32 %.sroa.0211.0.copyload.signext.i, -2147483648
  %.not1147.i = icmp eq i32 %644, 0
  %647 = select i1 %.not1147.i, i32 2139095040, i32 2143289344
  %648 = or disjoint i32 %647, %646
  %649 = bitcast i32 %648 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

650:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %651 = or disjoint i32 %644, 1024
  br label %652

652:                                              ; preds = %650, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i
  %653 = phi i32 [ %651, %650 ], [ %644, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit18.i.i.i ]
  %654 = uitofp i32 %653 to float
  %.not1140.i = icmp eq i32 %643, 0
  %655 = add nsw i32 %643, -25
  %656 = select i1 %.not1140.i, i32 -24, i32 %655
  %657 = call float @__ocml_ldexp_f32(float noundef %654, i32 noundef %656) #6
  %658 = fneg contract float %657
  %.not11411142.i = icmp slt i16 %.sroa.0211.0.copyload.i, 0
  %659 = select contract i1 %.not11411142.i, float %658, float %657
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i: ; preds = %652, %645
  %660 = phi float [ %649, %645 ], [ %659, %652 ]
  %661 = fmul contract float %590, %660
  %662 = fadd contract float %537, %661
  %663 = or disjoint i64 %567, %140
  %664 = trunc i64 %663 to i32
  %665 = getelementptr inbounds %struct.triton_sycl_float16_storage, ptr addrspace(3) %136, i32 %664
  %.sroa.0202.0.copyload.i = load i16, ptr addrspace(3) %665, align 2, !tbaa.struct !23
  %666 = zext i16 %.sroa.0202.0.copyload.i to i32
  %667 = lshr i32 %666, 10
  %668 = and i32 %667, 31
  %669 = and i32 %666, 1023
  switch i32 %668, label %675 [
    i32 31, label %670
    i32 0, label %677
  ]

670:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %.sroa.0202.0.copyload.signext.i = sext i16 %.sroa.0202.0.copyload.i to i32
  %671 = and i32 %.sroa.0202.0.copyload.signext.i, -2147483648
  %.not1146.i = icmp eq i32 %669, 0
  %672 = select i1 %.not1146.i, i32 2139095040, i32 2143289344
  %673 = or disjoint i32 %672, %671
  %674 = bitcast i32 %673 to float
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

675:                                              ; preds = %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %676 = or disjoint i32 %669, 1024
  br label %677

677:                                              ; preds = %675, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i
  %678 = phi i32 [ %676, %675 ], [ %669, %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit17.i.i.i ]
  %679 = uitofp i32 %678 to float
  %.not1143.i = icmp eq i32 %668, 0
  %680 = add nsw i32 %668, -25
  %681 = select i1 %.not1143.i, i32 -24, i32 %680
  %682 = call float @__ocml_ldexp_f32(float noundef %679, i32 noundef %681) #6
  %683 = fneg contract float %682
  %.not11441145.i = icmp slt i16 %.sroa.0202.0.copyload.i, 0
  %684 = select contract i1 %.not11441145.i, float %683, float %682
  br label %_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i

_ZNK27triton_sycl_float16_storageILi10ELi15EEcvfEv.exit.i.i.i: ; preds = %677, %670
  %685 = phi float [ %674, %670 ], [ %684, %677 ]
  %686 = fmul contract float %590, %685
  %687 = fadd contract float %562, %686
  %688 = add nuw nsw i64 %184, 4
  %689 = icmp ult i64 %184, 60
  br i1 %689, label %183, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit13.i.i.i, !llvm.loop !36

690:                                              ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i, %.lr.ph1191.i
  %691 = phi i64 [ %156, %.lr.ph1191.i ], [ %703, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i ]
  %692 = lshr i64 %691, 6
  %693 = icmp slt i64 %692, %158
  %694 = and i1 %693, %164
  br i1 %694, label %695, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i

695:                                              ; preds = %690
  %696 = trunc i64 %691 to i32
  %697 = getelementptr inbounds float, ptr addrspace(3) %161, i32 %696
  %698 = load float, ptr addrspace(3) %697, align 4, !tbaa !33
  %699 = and i64 %691, 9223372036854775744
  %700 = or disjoint i64 %699, %162
  %701 = or disjoint i64 %700, %163
  %702 = getelementptr inbounds float, ptr %9, i64 %701
  store float %698, ptr %702, align 4, !tbaa !33
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit15.i.i.i: ; preds = %695, %690
  %703 = add nuw nsw i64 %691, 128
  %704 = icmp ult i64 %691, 1920
  br i1 %704, label %690, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ14profile_kernelENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit", !llvm.loop !37

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
attributes #5 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
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
