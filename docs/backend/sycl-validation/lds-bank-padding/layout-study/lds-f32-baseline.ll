;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/lds-f32-failure-20261108/tmp/triton-sycl-cache/compile-_eh6fh73/kernel.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #0

; Function Attrs: nofree nosync nounwind
define void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr nocapture readonly %0, ptr nocapture readonly %1) local_unnamed_addr #1 {
entry:
  %num_groups_x = load i64, ptr %0, align 8
  %2 = getelementptr inbounds { [3 x i64], [3 x i64], [3 x i64], ptr, ptr }, ptr %0, i64 0, i32 0, i64 1
  %num_groups_y = load i64, ptr %2, align 8
  %3 = getelementptr inbounds { [3 x i64], [3 x i64], [3 x i64], ptr, ptr }, ptr %0, i64 0, i32 0, i64 2
  %num_groups_z = load i64, ptr %3, align 8
  %4 = getelementptr inbounds { [3 x i64], [3 x i64], [3 x i64], ptr, ptr }, ptr %0, i64 0, i32 1, i64 0
  %group_id_x = load i64, ptr %4, align 8
  %5 = getelementptr inbounds { [3 x i64], [3 x i64], [3 x i64], ptr, ptr }, ptr %0, i64 0, i32 1, i64 1
  %group_id_y = load i64, ptr %5, align 8
  %6 = getelementptr inbounds { [3 x i64], [3 x i64], [3 x i64], ptr, ptr }, ptr %0, i64 0, i32 1, i64 2
  %group_id_z = load i64, ptr %6, align 8
  %7 = getelementptr inbounds { [3 x i64], [3 x i64], [3 x i64], ptr, ptr }, ptr %0, i64 0, i32 3
  %local_mem_ptr = load ptr, ptr %7, align 8, !dereferenceable !8
  %8 = load ptr, ptr %1, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds ptr, ptr %1, i64 2
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds ptr, ptr %1, i64 3
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds ptr, ptr %1, i64 4
  %20 = load ptr, ptr %19, align 8
  %21 = load i64, ptr %20, align 8
  %22 = icmp ult i64 %group_id_z, 2147483647
  %23 = icmp ult i64 %group_id_y, 2147483647
  %24 = icmp ult i64 %group_id_x, 2147483647
  %25 = icmp ult i64 %num_groups_z, 2147483648
  %26 = icmp ult i64 %num_groups_y, 2147483648
  %27 = icmp ult i64 %num_groups_x, 2147483648
  %28 = shl nuw nsw i64 %group_id_z, 8
  %29 = getelementptr inbounds i8, ptr %local_mem_ptr, i64 1024
  %30 = getelementptr i8, ptr %local_mem_ptr, i64 3072
  %31 = shl nuw nsw i64 %group_id_z, 6
  %32 = shl nuw nsw i64 %group_id_z, 9
  br label %cbs.while.header.i

cbs.while.header.i:                               ; preds = %cbs.while.header.i.backedge, %entry
  %LastBarrierId.i.1 = phi i64 [ 0, %entry ], [ %LastBarrierId.i.1.be, %cbs.while.header.i.backedge ]
  switch i64 %LastBarrierId.i.1, label %cbs.while.default.i [
    i64 1, label %header.x.subcfg.1b.i.preheader
    i64 4, label %header.x.subcfg.4b.i.preheader
    i64 2, label %header.x.subcfg.2b.i.preheader
    i64 5, label %cbs.while.header.i.backedge
    i64 3, label %header.x.subcfg.3b.i.preheader
    i64 0, label %header.x.subcfg.0b.i
    i64 -1, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT__original.exit"
  ]

header.x.subcfg.3b.i.preheader:                   ; preds = %cbs.while.header.i
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !9
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !9
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !9
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !9
  br label %264

header.x.subcfg.2b.i.preheader:                   ; preds = %cbs.while.header.i
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !10
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 512 dereferenceable(256) %30, i8 0, i64 256, i1 false), !tbaa !11
  br label %cbs.while.header.i.backedge

cbs.while.header.i.backedge:                      ; preds = %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i, %.preheader447.subcfg.3b.i.preheader, %.preheader.subcfg.4b.i.7.3, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i, %header.x.subcfg.2b.i.preheader, %cbs.while.header.i
  %LastBarrierId.i.1.be = phi i64 [ -1, %cbs.while.header.i ], [ 3, %header.x.subcfg.2b.i.preheader ], [ 2, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i ], [ 5, %.preheader.subcfg.4b.i.7.3 ], [ 4, %.preheader447.subcfg.3b.i.preheader ], [ 1, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i ]
  br label %cbs.while.header.i

header.x.subcfg.4b.i.preheader:                   ; preds = %cbs.while.header.i
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !15
  br label %.preheader446.subcfg.4b.i.preheader

header.x.subcfg.1b.i.preheader:                   ; preds = %cbs.while.header.i
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !16
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i: ; preds = %header.x.subcfg.1b.i.preheader, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i
  %33 = phi i64 [ 0, %header.x.subcfg.1b.i.preheader ], [ %38, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i ]
  %34 = or i64 %33, %32
  %35 = getelementptr inbounds float, ptr %12, i64 %34
  %36 = load float, ptr %35, align 4, !tbaa !11, !llvm.access.group !16
  %37 = getelementptr inbounds float, ptr %29, i64 %33
  store float %36, ptr %37, align 4, !tbaa !11, !llvm.access.group !16
  %38 = add nuw nsw i64 %33, 1
  %exitcond31.not = icmp eq i64 %38, 512
  br i1 %exitcond31.not, label %cbs.while.header.i.backedge, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit2.i.subcfg.1b.i, !llvm.loop !17

.preheader446.subcfg.4b.i.preheader:              ; preds = %header.x.subcfg.4b.i.preheader, %.preheader.subcfg.4b.i.7.3
  %39 = phi i1 [ true, %header.x.subcfg.4b.i.preheader ], [ false, %.preheader.subcfg.4b.i.7.3 ]
  %40 = phi i64 [ 0, %header.x.subcfg.4b.i.preheader ], [ 32, %.preheader.subcfg.4b.i.7.3 ]
  %41 = or disjoint i64 %40, %31
  %42 = icmp ult i64 %41, %21
  br i1 %42, label %43, label %.preheader.subcfg.4b.i

43:                                               ; preds = %.preheader446.subcfg.4b.i.preheader
  %44 = getelementptr inbounds float, ptr %30, i64 %40
  %45 = load float, ptr %44, align 128, !tbaa !11, !llvm.access.group !15
  %46 = getelementptr inbounds float, ptr %15, i64 %41
  store float %45, ptr %46, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i

.preheader.subcfg.4b.i:                           ; preds = %43, %.preheader446.subcfg.4b.i.preheader
  %47 = or disjoint i64 %41, 1
  %48 = icmp ult i64 %47, %21
  br i1 %48, label %49, label %.preheader.subcfg.4b.i.1

49:                                               ; preds = %.preheader.subcfg.4b.i
  %50 = or disjoint i64 %40, 1
  %51 = getelementptr inbounds float, ptr %30, i64 %50
  %52 = load float, ptr %51, align 4, !tbaa !11, !llvm.access.group !15
  %53 = getelementptr inbounds float, ptr %15, i64 %47
  store float %52, ptr %53, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.1

.preheader.subcfg.4b.i.1:                         ; preds = %49, %.preheader.subcfg.4b.i
  %54 = or disjoint i64 %41, 2
  %55 = icmp ult i64 %54, %21
  br i1 %55, label %56, label %.preheader.subcfg.4b.i.2

56:                                               ; preds = %.preheader.subcfg.4b.i.1
  %57 = or disjoint i64 %40, 2
  %58 = getelementptr inbounds float, ptr %30, i64 %57
  %59 = load float, ptr %58, align 8, !tbaa !11, !llvm.access.group !15
  %60 = getelementptr inbounds float, ptr %15, i64 %54
  store float %59, ptr %60, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.2

.preheader.subcfg.4b.i.2:                         ; preds = %56, %.preheader.subcfg.4b.i.1
  %61 = or disjoint i64 %41, 3
  %62 = icmp ult i64 %61, %21
  br i1 %62, label %63, label %.preheader.subcfg.4b.i.3

63:                                               ; preds = %.preheader.subcfg.4b.i.2
  %64 = or disjoint i64 %40, 3
  %65 = getelementptr inbounds float, ptr %30, i64 %64
  %66 = load float, ptr %65, align 4, !tbaa !11, !llvm.access.group !15
  %67 = getelementptr inbounds float, ptr %15, i64 %61
  store float %66, ptr %67, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.3

.preheader.subcfg.4b.i.3:                         ; preds = %63, %.preheader.subcfg.4b.i.2
  %68 = or disjoint i64 %41, 4
  %69 = icmp ult i64 %68, %21
  br i1 %69, label %70, label %.preheader.subcfg.4b.i.4

70:                                               ; preds = %.preheader.subcfg.4b.i.3
  %71 = or disjoint i64 %40, 4
  %72 = getelementptr inbounds float, ptr %30, i64 %71
  %73 = load float, ptr %72, align 16, !tbaa !11, !llvm.access.group !15
  %74 = getelementptr inbounds float, ptr %15, i64 %68
  store float %73, ptr %74, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.4

.preheader.subcfg.4b.i.4:                         ; preds = %70, %.preheader.subcfg.4b.i.3
  %75 = or disjoint i64 %41, 5
  %76 = icmp ult i64 %75, %21
  br i1 %76, label %77, label %.preheader.subcfg.4b.i.5

77:                                               ; preds = %.preheader.subcfg.4b.i.4
  %78 = or disjoint i64 %40, 5
  %79 = getelementptr inbounds float, ptr %30, i64 %78
  %80 = load float, ptr %79, align 4, !tbaa !11, !llvm.access.group !15
  %81 = getelementptr inbounds float, ptr %15, i64 %75
  store float %80, ptr %81, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.5

.preheader.subcfg.4b.i.5:                         ; preds = %77, %.preheader.subcfg.4b.i.4
  %82 = or disjoint i64 %41, 6
  %83 = icmp ult i64 %82, %21
  br i1 %83, label %84, label %.preheader.subcfg.4b.i.6

84:                                               ; preds = %.preheader.subcfg.4b.i.5
  %85 = or disjoint i64 %40, 6
  %86 = getelementptr inbounds float, ptr %30, i64 %85
  %87 = load float, ptr %86, align 8, !tbaa !11, !llvm.access.group !15
  %88 = getelementptr inbounds float, ptr %15, i64 %82
  store float %87, ptr %88, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.6

.preheader.subcfg.4b.i.6:                         ; preds = %84, %.preheader.subcfg.4b.i.5
  %89 = or disjoint i64 %41, 7
  %90 = icmp ult i64 %89, %21
  br i1 %90, label %91, label %.preheader.subcfg.4b.i.7

91:                                               ; preds = %.preheader.subcfg.4b.i.6
  %92 = or disjoint i64 %40, 7
  %93 = getelementptr inbounds float, ptr %30, i64 %92
  %94 = load float, ptr %93, align 4, !tbaa !11, !llvm.access.group !15
  %95 = getelementptr inbounds float, ptr %15, i64 %89
  store float %94, ptr %95, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.7

.preheader.subcfg.4b.i.7:                         ; preds = %91, %.preheader.subcfg.4b.i.6
  %96 = or disjoint i64 %40, 8
  %97 = or disjoint i64 %96, %31
  %98 = icmp ult i64 %97, %21
  br i1 %98, label %99, label %.preheader.subcfg.4b.i.128

99:                                               ; preds = %.preheader.subcfg.4b.i.7
  %100 = getelementptr inbounds float, ptr %30, i64 %96
  %101 = load float, ptr %100, align 32, !tbaa !11, !llvm.access.group !15
  %102 = getelementptr inbounds float, ptr %15, i64 %97
  store float %101, ptr %102, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.128

.preheader.subcfg.4b.i.128:                       ; preds = %99, %.preheader.subcfg.4b.i.7
  %103 = or disjoint i64 %97, 1
  %104 = icmp ult i64 %103, %21
  br i1 %104, label %105, label %.preheader.subcfg.4b.i.1.1

105:                                              ; preds = %.preheader.subcfg.4b.i.128
  %106 = or disjoint i64 %40, 9
  %107 = getelementptr inbounds float, ptr %30, i64 %106
  %108 = load float, ptr %107, align 4, !tbaa !11, !llvm.access.group !15
  %109 = getelementptr inbounds float, ptr %15, i64 %103
  store float %108, ptr %109, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.1.1

.preheader.subcfg.4b.i.1.1:                       ; preds = %105, %.preheader.subcfg.4b.i.128
  %110 = or disjoint i64 %97, 2
  %111 = icmp ult i64 %110, %21
  br i1 %111, label %112, label %.preheader.subcfg.4b.i.2.1

112:                                              ; preds = %.preheader.subcfg.4b.i.1.1
  %113 = or disjoint i64 %40, 10
  %114 = getelementptr inbounds float, ptr %30, i64 %113
  %115 = load float, ptr %114, align 8, !tbaa !11, !llvm.access.group !15
  %116 = getelementptr inbounds float, ptr %15, i64 %110
  store float %115, ptr %116, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.2.1

.preheader.subcfg.4b.i.2.1:                       ; preds = %112, %.preheader.subcfg.4b.i.1.1
  %117 = or disjoint i64 %97, 3
  %118 = icmp ult i64 %117, %21
  br i1 %118, label %119, label %.preheader.subcfg.4b.i.3.1

119:                                              ; preds = %.preheader.subcfg.4b.i.2.1
  %120 = or disjoint i64 %40, 11
  %121 = getelementptr inbounds float, ptr %30, i64 %120
  %122 = load float, ptr %121, align 4, !tbaa !11, !llvm.access.group !15
  %123 = getelementptr inbounds float, ptr %15, i64 %117
  store float %122, ptr %123, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.3.1

.preheader.subcfg.4b.i.3.1:                       ; preds = %119, %.preheader.subcfg.4b.i.2.1
  %124 = or disjoint i64 %97, 4
  %125 = icmp ult i64 %124, %21
  br i1 %125, label %126, label %.preheader.subcfg.4b.i.4.1

126:                                              ; preds = %.preheader.subcfg.4b.i.3.1
  %127 = or disjoint i64 %40, 12
  %128 = getelementptr inbounds float, ptr %30, i64 %127
  %129 = load float, ptr %128, align 16, !tbaa !11, !llvm.access.group !15
  %130 = getelementptr inbounds float, ptr %15, i64 %124
  store float %129, ptr %130, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.4.1

.preheader.subcfg.4b.i.4.1:                       ; preds = %126, %.preheader.subcfg.4b.i.3.1
  %131 = or disjoint i64 %97, 5
  %132 = icmp ult i64 %131, %21
  br i1 %132, label %133, label %.preheader.subcfg.4b.i.5.1

133:                                              ; preds = %.preheader.subcfg.4b.i.4.1
  %134 = or disjoint i64 %40, 13
  %135 = getelementptr inbounds float, ptr %30, i64 %134
  %136 = load float, ptr %135, align 4, !tbaa !11, !llvm.access.group !15
  %137 = getelementptr inbounds float, ptr %15, i64 %131
  store float %136, ptr %137, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.5.1

.preheader.subcfg.4b.i.5.1:                       ; preds = %133, %.preheader.subcfg.4b.i.4.1
  %138 = or disjoint i64 %97, 6
  %139 = icmp ult i64 %138, %21
  br i1 %139, label %140, label %.preheader.subcfg.4b.i.6.1

140:                                              ; preds = %.preheader.subcfg.4b.i.5.1
  %141 = or disjoint i64 %40, 14
  %142 = getelementptr inbounds float, ptr %30, i64 %141
  %143 = load float, ptr %142, align 8, !tbaa !11, !llvm.access.group !15
  %144 = getelementptr inbounds float, ptr %15, i64 %138
  store float %143, ptr %144, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.6.1

.preheader.subcfg.4b.i.6.1:                       ; preds = %140, %.preheader.subcfg.4b.i.5.1
  %145 = or disjoint i64 %97, 7
  %146 = icmp ult i64 %145, %21
  br i1 %146, label %147, label %.preheader.subcfg.4b.i.7.1

147:                                              ; preds = %.preheader.subcfg.4b.i.6.1
  %148 = or disjoint i64 %40, 15
  %149 = getelementptr inbounds float, ptr %30, i64 %148
  %150 = load float, ptr %149, align 4, !tbaa !11, !llvm.access.group !15
  %151 = getelementptr inbounds float, ptr %15, i64 %145
  store float %150, ptr %151, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.7.1

.preheader.subcfg.4b.i.7.1:                       ; preds = %147, %.preheader.subcfg.4b.i.6.1
  %152 = or disjoint i64 %40, 16
  %153 = or disjoint i64 %152, %31
  %154 = icmp ult i64 %153, %21
  br i1 %154, label %155, label %.preheader.subcfg.4b.i.229

155:                                              ; preds = %.preheader.subcfg.4b.i.7.1
  %156 = getelementptr inbounds float, ptr %30, i64 %152
  %157 = load float, ptr %156, align 64, !tbaa !11, !llvm.access.group !15
  %158 = getelementptr inbounds float, ptr %15, i64 %153
  store float %157, ptr %158, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.229

.preheader.subcfg.4b.i.229:                       ; preds = %155, %.preheader.subcfg.4b.i.7.1
  %159 = or disjoint i64 %153, 1
  %160 = icmp ult i64 %159, %21
  br i1 %160, label %161, label %.preheader.subcfg.4b.i.1.2

161:                                              ; preds = %.preheader.subcfg.4b.i.229
  %162 = or disjoint i64 %40, 17
  %163 = getelementptr inbounds float, ptr %30, i64 %162
  %164 = load float, ptr %163, align 4, !tbaa !11, !llvm.access.group !15
  %165 = getelementptr inbounds float, ptr %15, i64 %159
  store float %164, ptr %165, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.1.2

.preheader.subcfg.4b.i.1.2:                       ; preds = %161, %.preheader.subcfg.4b.i.229
  %166 = or disjoint i64 %153, 2
  %167 = icmp ult i64 %166, %21
  br i1 %167, label %168, label %.preheader.subcfg.4b.i.2.2

168:                                              ; preds = %.preheader.subcfg.4b.i.1.2
  %169 = or disjoint i64 %40, 18
  %170 = getelementptr inbounds float, ptr %30, i64 %169
  %171 = load float, ptr %170, align 8, !tbaa !11, !llvm.access.group !15
  %172 = getelementptr inbounds float, ptr %15, i64 %166
  store float %171, ptr %172, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.2.2

.preheader.subcfg.4b.i.2.2:                       ; preds = %168, %.preheader.subcfg.4b.i.1.2
  %173 = or disjoint i64 %153, 3
  %174 = icmp ult i64 %173, %21
  br i1 %174, label %175, label %.preheader.subcfg.4b.i.3.2

175:                                              ; preds = %.preheader.subcfg.4b.i.2.2
  %176 = or disjoint i64 %40, 19
  %177 = getelementptr inbounds float, ptr %30, i64 %176
  %178 = load float, ptr %177, align 4, !tbaa !11, !llvm.access.group !15
  %179 = getelementptr inbounds float, ptr %15, i64 %173
  store float %178, ptr %179, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.3.2

.preheader.subcfg.4b.i.3.2:                       ; preds = %175, %.preheader.subcfg.4b.i.2.2
  %180 = or disjoint i64 %153, 4
  %181 = icmp ult i64 %180, %21
  br i1 %181, label %182, label %.preheader.subcfg.4b.i.4.2

182:                                              ; preds = %.preheader.subcfg.4b.i.3.2
  %183 = or disjoint i64 %40, 20
  %184 = getelementptr inbounds float, ptr %30, i64 %183
  %185 = load float, ptr %184, align 16, !tbaa !11, !llvm.access.group !15
  %186 = getelementptr inbounds float, ptr %15, i64 %180
  store float %185, ptr %186, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.4.2

.preheader.subcfg.4b.i.4.2:                       ; preds = %182, %.preheader.subcfg.4b.i.3.2
  %187 = or disjoint i64 %153, 5
  %188 = icmp ult i64 %187, %21
  br i1 %188, label %189, label %.preheader.subcfg.4b.i.5.2

189:                                              ; preds = %.preheader.subcfg.4b.i.4.2
  %190 = or disjoint i64 %40, 21
  %191 = getelementptr inbounds float, ptr %30, i64 %190
  %192 = load float, ptr %191, align 4, !tbaa !11, !llvm.access.group !15
  %193 = getelementptr inbounds float, ptr %15, i64 %187
  store float %192, ptr %193, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.5.2

.preheader.subcfg.4b.i.5.2:                       ; preds = %189, %.preheader.subcfg.4b.i.4.2
  %194 = or disjoint i64 %153, 6
  %195 = icmp ult i64 %194, %21
  br i1 %195, label %196, label %.preheader.subcfg.4b.i.6.2

196:                                              ; preds = %.preheader.subcfg.4b.i.5.2
  %197 = or disjoint i64 %40, 22
  %198 = getelementptr inbounds float, ptr %30, i64 %197
  %199 = load float, ptr %198, align 8, !tbaa !11, !llvm.access.group !15
  %200 = getelementptr inbounds float, ptr %15, i64 %194
  store float %199, ptr %200, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.6.2

.preheader.subcfg.4b.i.6.2:                       ; preds = %196, %.preheader.subcfg.4b.i.5.2
  %201 = or disjoint i64 %153, 7
  %202 = icmp ult i64 %201, %21
  br i1 %202, label %203, label %.preheader.subcfg.4b.i.7.2

203:                                              ; preds = %.preheader.subcfg.4b.i.6.2
  %204 = or disjoint i64 %40, 23
  %205 = getelementptr inbounds float, ptr %30, i64 %204
  %206 = load float, ptr %205, align 4, !tbaa !11, !llvm.access.group !15
  %207 = getelementptr inbounds float, ptr %15, i64 %201
  store float %206, ptr %207, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.7.2

.preheader.subcfg.4b.i.7.2:                       ; preds = %203, %.preheader.subcfg.4b.i.6.2
  %208 = or disjoint i64 %40, 24
  %209 = or disjoint i64 %208, %31
  %210 = icmp ult i64 %209, %21
  br i1 %210, label %211, label %.preheader.subcfg.4b.i.330

211:                                              ; preds = %.preheader.subcfg.4b.i.7.2
  %212 = getelementptr inbounds float, ptr %30, i64 %208
  %213 = load float, ptr %212, align 32, !tbaa !11, !llvm.access.group !15
  %214 = getelementptr inbounds float, ptr %15, i64 %209
  store float %213, ptr %214, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.330

.preheader.subcfg.4b.i.330:                       ; preds = %211, %.preheader.subcfg.4b.i.7.2
  %215 = or disjoint i64 %209, 1
  %216 = icmp ult i64 %215, %21
  br i1 %216, label %217, label %.preheader.subcfg.4b.i.1.3

217:                                              ; preds = %.preheader.subcfg.4b.i.330
  %218 = or disjoint i64 %40, 25
  %219 = getelementptr inbounds float, ptr %30, i64 %218
  %220 = load float, ptr %219, align 4, !tbaa !11, !llvm.access.group !15
  %221 = getelementptr inbounds float, ptr %15, i64 %215
  store float %220, ptr %221, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.1.3

.preheader.subcfg.4b.i.1.3:                       ; preds = %217, %.preheader.subcfg.4b.i.330
  %222 = or disjoint i64 %209, 2
  %223 = icmp ult i64 %222, %21
  br i1 %223, label %224, label %.preheader.subcfg.4b.i.2.3

224:                                              ; preds = %.preheader.subcfg.4b.i.1.3
  %225 = or disjoint i64 %40, 26
  %226 = getelementptr inbounds float, ptr %30, i64 %225
  %227 = load float, ptr %226, align 8, !tbaa !11, !llvm.access.group !15
  %228 = getelementptr inbounds float, ptr %15, i64 %222
  store float %227, ptr %228, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.2.3

.preheader.subcfg.4b.i.2.3:                       ; preds = %224, %.preheader.subcfg.4b.i.1.3
  %229 = or disjoint i64 %209, 3
  %230 = icmp ult i64 %229, %21
  br i1 %230, label %231, label %.preheader.subcfg.4b.i.3.3

231:                                              ; preds = %.preheader.subcfg.4b.i.2.3
  %232 = or disjoint i64 %40, 27
  %233 = getelementptr inbounds float, ptr %30, i64 %232
  %234 = load float, ptr %233, align 4, !tbaa !11, !llvm.access.group !15
  %235 = getelementptr inbounds float, ptr %15, i64 %229
  store float %234, ptr %235, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.3.3

.preheader.subcfg.4b.i.3.3:                       ; preds = %231, %.preheader.subcfg.4b.i.2.3
  %236 = or disjoint i64 %209, 4
  %237 = icmp ult i64 %236, %21
  br i1 %237, label %238, label %.preheader.subcfg.4b.i.4.3

238:                                              ; preds = %.preheader.subcfg.4b.i.3.3
  %239 = or disjoint i64 %40, 28
  %240 = getelementptr inbounds float, ptr %30, i64 %239
  %241 = load float, ptr %240, align 16, !tbaa !11, !llvm.access.group !15
  %242 = getelementptr inbounds float, ptr %15, i64 %236
  store float %241, ptr %242, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.4.3

.preheader.subcfg.4b.i.4.3:                       ; preds = %238, %.preheader.subcfg.4b.i.3.3
  %243 = or disjoint i64 %209, 5
  %244 = icmp ult i64 %243, %21
  br i1 %244, label %245, label %.preheader.subcfg.4b.i.5.3

245:                                              ; preds = %.preheader.subcfg.4b.i.4.3
  %246 = or disjoint i64 %40, 29
  %247 = getelementptr inbounds float, ptr %30, i64 %246
  %248 = load float, ptr %247, align 4, !tbaa !11, !llvm.access.group !15
  %249 = getelementptr inbounds float, ptr %15, i64 %243
  store float %248, ptr %249, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.5.3

.preheader.subcfg.4b.i.5.3:                       ; preds = %245, %.preheader.subcfg.4b.i.4.3
  %250 = or disjoint i64 %209, 6
  %251 = icmp ult i64 %250, %21
  br i1 %251, label %252, label %.preheader.subcfg.4b.i.6.3

252:                                              ; preds = %.preheader.subcfg.4b.i.5.3
  %253 = or disjoint i64 %40, 30
  %254 = getelementptr inbounds float, ptr %30, i64 %253
  %255 = load float, ptr %254, align 8, !tbaa !11, !llvm.access.group !15
  %256 = getelementptr inbounds float, ptr %15, i64 %250
  store float %255, ptr %256, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.6.3

.preheader.subcfg.4b.i.6.3:                       ; preds = %252, %.preheader.subcfg.4b.i.5.3
  %257 = or disjoint i64 %209, 7
  %258 = icmp ult i64 %257, %21
  br i1 %258, label %259, label %.preheader.subcfg.4b.i.7.3

259:                                              ; preds = %.preheader.subcfg.4b.i.6.3
  %260 = or disjoint i64 %40, 31
  %261 = getelementptr inbounds float, ptr %30, i64 %260
  %262 = load float, ptr %261, align 4, !tbaa !11, !llvm.access.group !15
  %263 = getelementptr inbounds float, ptr %15, i64 %257
  store float %262, ptr %263, align 4, !tbaa !11, !llvm.access.group !15
  br label %.preheader.subcfg.4b.i.7.3

.preheader.subcfg.4b.i.7.3:                       ; preds = %259, %.preheader.subcfg.4b.i.6.3
  br i1 %39, label %.preheader446.subcfg.4b.i.preheader, label %cbs.while.header.i.backedge, !llvm.loop !19

264:                                              ; preds = %header.x.subcfg.3b.i.preheader, %.preheader447.subcfg.3b.i.preheader
  %265 = phi i64 [ 0, %header.x.subcfg.3b.i.preheader ], [ %291, %.preheader447.subcfg.3b.i.preheader ]
  %266 = lshr i64 %265, 5
  %267 = lshr i64 %265, 3
  %268 = and i64 %267, 3
  %269 = and i64 %265, 7
  %270 = shl nuw nsw i64 %266, 2
  %271 = or disjoint i64 %270, %268
  %272 = shl nuw nsw i64 %271, 5
  %273 = shl nuw nsw i64 %266, 8
  %274 = shl nuw nsw i64 %271, 3
  %275 = or disjoint i64 %274, %269
  %276 = getelementptr inbounds float, ptr %30, i64 %275
  %.promoted = load float, ptr %276, align 4, !tbaa !11
  br label %277

277:                                              ; preds = %264, %277
  %278 = phi i64 [ 0, %264 ], [ %290, %277 ]
  %279 = phi float [ %.promoted, %264 ], [ %289, %277 ]
  %280 = add nuw nsw i64 %278, %272
  %281 = getelementptr inbounds float, ptr %local_mem_ptr, i64 %280
  %282 = load float, ptr %281, align 4, !tbaa !11, !llvm.access.group !9
  %283 = shl nuw nsw i64 %278, 3
  %284 = add nuw nsw i64 %283, %273
  %285 = or disjoint i64 %284, %269
  %286 = getelementptr inbounds float, ptr %29, i64 %285
  %287 = load float, ptr %286, align 4, !tbaa !11, !llvm.access.group !9
  %288 = fmul contract float %282, %287
  %289 = fadd contract float %288, %279
  store float %289, ptr %276, align 4, !tbaa !11, !llvm.access.group !9
  %290 = add nuw nsw i64 %278, 1
  %exitcond24.not = icmp eq i64 %290, 32
  br i1 %exitcond24.not, label %.preheader447.subcfg.3b.i.preheader, label %277, !llvm.loop !20

.preheader447.subcfg.3b.i.preheader:              ; preds = %277
  %291 = add nuw nsw i64 %265, 1
  %exitcond25.not = icmp eq i64 %291, 64
  br i1 %exitcond25.not, label %cbs.while.header.i.backedge, label %264, !llvm.loop !21

header.x.subcfg.0b.i:                             ; preds = %cbs.while.header.i
  call void @llvm.assume(i1 true) [ "align"(ptr %18, i64 32) ], !llvm.access.group !22
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 32) ], !llvm.access.group !22
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 32) ], !llvm.access.group !22
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 32) ], !llvm.access.group !22
  tail call void @llvm.assume(i1 %22), !noalias !23, !llvm.access.group !22
  tail call void @llvm.assume(i1 %23), !noalias !23, !llvm.access.group !22
  tail call void @llvm.assume(i1 %24), !noalias !23, !llvm.access.group !22
  tail call void @llvm.assume(i1 %25), !noalias !26, !llvm.access.group !22
  tail call void @llvm.assume(i1 %26), !noalias !26, !llvm.access.group !22
  tail call void @llvm.assume(i1 %27), !noalias !26, !llvm.access.group !22
  call void @llvm.assume(i1 true) [ "align"(ptr %local_mem_ptr, i64 512) ], !llvm.access.group !22
  br label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i

_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i: ; preds = %header.x.subcfg.0b.i, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i
  %292 = phi i64 [ 0, %header.x.subcfg.0b.i ], [ %297, %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i ]
  %293 = or i64 %292, %28
  %294 = getelementptr inbounds float, ptr %9, i64 %293
  %295 = load float, ptr %294, align 4, !tbaa !11, !llvm.access.group !22
  %296 = getelementptr inbounds float, ptr %local_mem_ptr, i64 %292
  store float %295, ptr %296, align 4, !tbaa !11, !llvm.access.group !22
  %297 = add nuw nsw i64 %292, 1
  %exitcond.not = icmp eq i64 %297, 256
  br i1 %exitcond.not, label %cbs.while.header.i.backedge, label %_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv.exit3.i.subcfg.0b.i, !llvm.loop !29

cbs.while.default.i:                              ; preds = %cbs.while.header.i
  unreachable

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT__original.exit": ; preds = %cbs.while.header.i
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { nofree nosync nounwind }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2}
!hipsycl.sscp.annotations = !{!3, !4, !5, !6, !7}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 17.0.0 (http://10.4.0.1/dcutoolkit/driverruntime/llvm-project.git ff5bf917a679c83afe927af051a20b86fef7b07d)"}
!3 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"hipsycl_kernel_dimension", i32 3}
!4 = !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!5 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!6 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!7 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"kernel", i32 1}
!8 = !{i64 3328}
!9 = distinct !{}
!10 = distinct !{}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = distinct !{}
!16 = distinct !{}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = distinct !{}
!23 = !{!24}
!24 = distinct !{!24, !25, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv: argument 0"}
!25 = distinct !{!25, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv: argument 0"}
!28 = distinct !{!28, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv"}
!29 = distinct !{!29, !18}
;----------------- End AdaptiveCpp IR dump ---------------
