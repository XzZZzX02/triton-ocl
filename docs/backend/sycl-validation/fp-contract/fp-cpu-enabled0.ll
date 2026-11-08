;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ18launch_product_addENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/fp-cpu-dump-20261108/tmp/triton-sycl-cache/compile-9tvxap_r/kernel.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #0

; Function Attrs: nofree nosync nounwind
define void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ18launch_product_addENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr nocapture readonly %0, ptr nocapture readonly %1) local_unnamed_addr #1 {
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
  %7 = load ptr, ptr %1, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds ptr, ptr %1, i64 1
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds ptr, ptr %1, i64 2
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds ptr, ptr %1, i64 3
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ult i64 %group_id_z, 33554431
  %19 = icmp ult i64 %group_id_y, 2147483647
  %20 = icmp ult i64 %group_id_x, 2147483647
  %21 = icmp ult i64 %num_groups_z, 33554432
  %22 = icmp ult i64 %num_groups_y, 2147483648
  %23 = icmp ult i64 %num_groups_x, 2147483648
  %24 = shl nuw nsw i64 %group_id_z, 6
  br label %cbs.while.header.i

cbs.while.header.i:                               ; preds = %cbs.while.header.i.backedge, %entry
  %LastBarrierId.i.1 = phi i64 [ 0, %entry ], [ %LastBarrierId.i.1.be, %cbs.while.header.i.backedge ]
  switch i64 %LastBarrierId.i.1, label %cbs.while.default.i [
    i64 2, label %cbs.while.header.i.backedge
    i64 0, label %header.z.subcfg.0b.i.preheader
    i64 1, label %header.z.subcfg.1b.i
    i64 -1, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ18launch_product_addENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT__original.exit"
  ]

cbs.while.header.i.backedge:                      ; preds = %latch.z.subcfg.1b.i, %cbs.while.header.i, %header.z.subcfg.0b.i.preheader
  %LastBarrierId.i.1.be = phi i64 [ 1, %header.z.subcfg.0b.i.preheader ], [ -1, %cbs.while.header.i ], [ 2, %latch.z.subcfg.1b.i ]
  br label %cbs.while.header.i

header.z.subcfg.0b.i.preheader:                   ; preds = %cbs.while.header.i
  call void @llvm.assume(i1 true) [ "align"(ptr %17, i64 32) ], !llvm.access.group !8
  call void @llvm.assume(i1 true) [ "align"(ptr %14, i64 32) ], !llvm.access.group !8
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 32) ], !llvm.access.group !8
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 32) ], !llvm.access.group !8
  tail call void @llvm.assume(i1 %18), !noalias !9, !llvm.access.group !8
  tail call void @llvm.assume(i1 %19), !noalias !9, !llvm.access.group !8
  tail call void @llvm.assume(i1 %20), !noalias !9, !llvm.access.group !8
  tail call void @llvm.assume(i1 %21), !noalias !12, !llvm.access.group !8
  tail call void @llvm.assume(i1 %22), !noalias !12, !llvm.access.group !8
  tail call void @llvm.assume(i1 %23), !noalias !12, !llvm.access.group !8
  br label %cbs.while.header.i.backedge

header.z.subcfg.1b.i:                             ; preds = %cbs.while.header.i, %latch.z.subcfg.1b.i
  %indvar.z.subcfg.1.i = phi i64 [ %addInd.z.subcfg.1.i, %latch.z.subcfg.1b.i ], [ 0, %cbs.while.header.i ]
  %25 = icmp eq i64 %indvar.z.subcfg.1.i, 0
  br i1 %25, label %.preheader, label %latch.z.subcfg.1b.i

.preheader:                                       ; preds = %header.z.subcfg.1b.i, %.preheader
  %26 = phi i64 [ %37, %.preheader ], [ 0, %header.z.subcfg.1b.i ]
  %27 = add nuw nsw i64 %26, %24
  %28 = getelementptr inbounds float, ptr %8, i64 %27
  %29 = load float, ptr %28, align 4, !tbaa !15, !llvm.access.group !19
  %30 = getelementptr inbounds float, ptr %11, i64 %27
  %31 = load float, ptr %30, align 4, !tbaa !15, !llvm.access.group !19
  %32 = getelementptr inbounds float, ptr %14, i64 %27
  %33 = load float, ptr %32, align 4, !tbaa !15, !llvm.access.group !19
  %34 = fmul contract float %29, %31
  %35 = fadd contract float %34, %33
  %36 = getelementptr inbounds float, ptr %17, i64 %27
  store float %35, ptr %36, align 4, !tbaa !15, !llvm.access.group !19
  %37 = add nuw nsw i64 %26, 1
  %exitcond.not = icmp eq i64 %37, 64
  br i1 %exitcond.not, label %latch.z.subcfg.1b.i, label %.preheader, !llvm.loop !20

latch.z.subcfg.1b.i:                              ; preds = %.preheader, %header.z.subcfg.1b.i
  %addInd.z.subcfg.1.i = add nuw nsw i64 %indvar.z.subcfg.1.i, 1
  %exit.cond.z.subcfg.1.i.not = icmp eq i64 %indvar.z.subcfg.1.i, 63
  br i1 %exit.cond.z.subcfg.1.i.not, label %cbs.while.header.i.backedge, label %header.z.subcfg.1b.i

cbs.while.default.i:                              ; preds = %cbs.while.header.i
  unreachable

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ18launch_product_addENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT__original.exit": ; preds = %cbs.while.header.i
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { nofree nosync nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2, !2}
!hipsycl.sscp.annotations = !{!3, !4, !5, !6, !7}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 17.0.0 (http://10.4.0.1/dcutoolkit/driverruntime/llvm-project.git ff5bf917a679c83afe927af051a20b86fef7b07d)"}
!3 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ18launch_product_addENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"hipsycl_kernel_dimension", i32 3}
!4 = !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!5 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!6 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!7 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ18launch_product_addENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"kernel", i32 1}
!8 = distinct !{}
!9 = !{!10}
!10 = distinct !{!10, !11, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv: argument 0"}
!11 = distinct !{!11, !"_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv: argument 0"}
!14 = distinct !{!14, !"_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
;----------------- End AdaptiveCpp IR dump ---------------
