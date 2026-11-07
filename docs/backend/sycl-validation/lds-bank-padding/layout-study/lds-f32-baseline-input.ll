;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: input
source_filename = "/tmp/lds-f32-failure-20261108/tmp/triton-sycl-cache/compile-_eh6fh73/kernel.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.hipsycl::sycl::range" = type { %"struct.hipsycl::sycl::detail::device_array" }
%"struct.hipsycl::sycl::detail::device_array" = type { i64, i64, i64 }
%"struct.hipsycl::sycl::id" = type { %"struct.hipsycl::sycl::detail::device_array" }
%"class.hipsycl::sycl::local_accessor" = type { %"class.hipsycl::sycl::specialized", %"class.hipsycl::sycl::specialized.227" }
%"class.hipsycl::sycl::specialized" = type { %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized" }
%"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized" = type { i64 }
%"class.hipsycl::sycl::specialized.227" = type { %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized.228" }
%"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized.228" = type { %"class.hipsycl::sycl::range" }
%class.anon.229 = type { ptr, ptr, ptr, ptr, i64, %"class.hipsycl::sycl::local_accessor", %"class.hipsycl::sycl::local_accessor", %"class.hipsycl::sycl::local_accessor" }
%"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for" = type { %class.anon.229 }
%"struct.hipsycl::sycl::nd_item" = type { ptr, %"struct.hipsycl::sycl::id", %"struct.hipsycl::sycl::id", %"class.hipsycl::sycl::range", %"class.hipsycl::sycl::range", %"struct.hipsycl::sycl::id", ptr, ptr }
%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy" = type { ptr, %"struct.hipsycl::sycl::id" }
%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380" = type { ptr, %"struct.hipsycl::sycl::id" }
%"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset" = type { %class.anon.229, %"struct.hipsycl::sycl::id" }
%class.anon.449 = type { ptr, ptr, ptr, ptr, i64, %"class.hipsycl::sycl::local_accessor", %"class.hipsycl::sycl::local_accessor", %"class.hipsycl::sycl::local_accessor" }
%"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457" = type { %class.anon.449 }
%"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458" = type { %class.anon.449, %"struct.hipsycl::sycl::id" }

$_ZN7hipsycl4sycl5rangeILi3EEC2ILi3EvEEmmm = comdat any

$_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm = comdat any

$_ZN7hipsycl4sycl2idILi3EEC2Ev = comdat any

$_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_ = comdat any

$_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv = comdat any

$_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm = comdat any

$_ZNK7hipsycl4sycl5rangeILi3EEixEi = comdat any

$_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv = comdat any

$_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv = comdat any

$_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv = comdat any

$_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv = comdat any

$_ZN7hipsycl4sycl7nd_itemILi3EEC2EPKNS0_2idILi3EEES4_S4_NS0_5rangeILi3EEES8_PSt8functionIFvvEEPv = comdat any

$_ZN7hipsycl4sycl6detail16__acpp_get_gid_zEv = comdat any

$_ZN7hipsycl4sycl6detail16__acpp_get_gid_yEv = comdat any

$_ZN7hipsycl4sycl6detail16__acpp_get_gid_xEv = comdat any

$_ZN7hipsycl4sycl2idILi3EEC2ILi3EvEEmmm = comdat any

$_ZN7hipsycl4sycl6detail16__acpp_get_lid_zEv = comdat any

$_ZN7hipsycl4sycl6detail16__acpp_get_lid_yEv = comdat any

$_ZN7hipsycl4sycl6detail16__acpp_get_lid_xEv = comdat any

$_ZN7hipsycl4sycl6detail18__acpp_get_lsize_zEv = comdat any

$_ZN7hipsycl4sycl6detail18__acpp_get_lsize_yEv = comdat any

$_ZN7hipsycl4sycl6detail18__acpp_get_lsize_xEv = comdat any

$_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_zEv = comdat any

$_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_yEv = comdat any

$_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_xEv = comdat any

$_ZN7hipsycl4syclplERKNS0_2idILi3EEES4_ = comdat any

$_ZN7hipsycl4syclmlERKNS0_2idILi3EEES4_ = comdat any

$_ZN7hipsycl4sycl2idILi3EEC2ERKNS0_5rangeILi3EEE = comdat any

$_ZN7hipsycl4sycl6detail12device_arrayImLm3EEC2Ev = comdat any

$_Z14padding_layoutN7hipsycl4sycl7nd_itemILi3EEEPfS3_S3_S3_lNS0_14local_accessorIfLi3EEES5_S5_ = comdat any

$_ZNK7hipsycl4sycl7nd_itemILi3EE9get_groupEi = comdat any

$_ZNK7hipsycl4sycl7nd_itemILi3EE19get_local_linear_idEv = comdat any

$_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm = comdat any

$_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm = comdat any

$_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm = comdat any

$_ZNK7hipsycl4sycl7nd_itemILi3EE15get_local_rangeEv = comdat any

$_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE = comdat any

$_ZNK7hipsycl4sycl7nd_itemILi3EE12get_local_idEi = comdat any

$_ZN7hipsycl4sycl6detail12get_group_idILi3EEEmi = comdat any

$_Z31__acpp_sscp_get_local_linear_idILi3EEmv = comdat any

$_ZN7hipsycl4sycl6detail9linear_idILi3EE3getERKNS0_2idILi3EEERKNS0_5rangeILi3EEE = comdat any

$_Z37__acpp_sscp_typed_get_local_linear_idILi3EiET0_v = comdat any

$_Z37__acpp_sscp_typed_get_local_linear_idILi3EmET0_v = comdat any

$_ZN7hipsycl4sycl6detail13get_linear_idEmmmmm = comdat any

$_ZNK7hipsycl4sycl2idILi3EE3getEi = comdat any

$_ZNK7hipsycl4sycl5rangeILi3EE3getEi = comdat any

$_ZN7hipsycl4sycl2idILi3EEixEi = comdat any

$_ZN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEC2EPKNS0_14local_accessorIfLi3EEENS0_2idILi3EEE = comdat any

$_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EE17create_next_proxyEm = comdat any

$_ZN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEC2EPKNS0_14local_accessorIfLi3EEENS0_2idILi3EEE = comdat any

$_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EE19invoke_value_accessEm = comdat any

$_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEERfNS0_2idILi3EEE = comdat any

$_ZN7hipsycl4sycl6detail12local_memory7get_ptrIfEEPT_m = comdat any

$_ZNK7hipsycl4sycl11specializedImEcvmEv = comdat any

$_ZNK7hipsycl4sycl11specializedINS0_5rangeILi3EEEEcvS3_Ev = comdat any

$_ZN7hipsycl4sycl6detail20local_device_barrierENS0_6access11fence_spaceE = comdat any

$_ZN7hipsycl4sycl6detail12sscp_barrierENS0_6access11fence_spaceE = comdat any

$_ZN7hipsycl4sycl6detail12get_local_idILi3EEEmi = comdat any

$_ZN7hipsycl4sycl11specializedImEC2ERKS2_ = comdat any

$_ZN7hipsycl4sycl11specializedINS0_5rangeILi3EEEEC2ERKS4_ = comdat any

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl5rangeILi3EEC2ILi3EvEEmmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) unnamed_addr #3 comdat align 2 {
  %5 = getelementptr inbounds %"class.hipsycl::sycl::range", ptr %0, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %5, i32 0, i32 0
  store i64 %1, ptr %6, align 8, !tbaa !7
  %7 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %5, i32 0, i32 1
  store i64 %2, ptr %7, align 8, !tbaa !12
  %8 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %5, i32 0, i32 2
  store i64 %3, ptr %8, align 8, !tbaa !13
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 0
  br label %12

6:                                                ; preds = %2
  %7 = icmp eq i64 %1, 1
  br i1 %7, label %8, label %10

8:                                                ; preds = %6
  %9 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 1
  br label %12

10:                                               ; preds = %6
  %11 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 2
  br label %12

12:                                               ; preds = %10, %8, %4
  %13 = phi ptr [ %5, %4 ], [ %9, %8 ], [ %11, %10 ]
  ret ptr %13
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl2idILi3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #3 comdat align 2 {
  %2 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %2, i32 0, i32 0
  store i64 0, ptr %3, align 8, !tbaa !7
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %2, i32 0, i32 1
  store i64 0, ptr %4, align 8, !tbaa !12
  %5 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %2, i32 0, i32 2
  store i64 0, ptr %5, align 8, !tbaa !13
  ret void
}

; Function Attrs: inlinehint nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(32) %1) unnamed_addr #5 comdat align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::sycl::local_accessor", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"class.hipsycl::sycl::local_accessor", ptr %1, i32 0, i32 0
  call void @_ZN7hipsycl4sycl11specializedImEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4) #3
  %5 = getelementptr inbounds %"class.hipsycl::sycl::local_accessor", ptr %0, i32 0, i32 1
  %6 = getelementptr inbounds %"class.hipsycl::sycl::local_accessor", ptr %1, i32 0, i32 1
  call void @_ZN7hipsycl4sycl11specializedINS0_5rangeILi3EEEEC2ERKS4_(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %6) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #4 comdat align 2 {
  %2 = getelementptr inbounds %"class.hipsycl::sycl::range", ptr %0, i32 0, i32 0
  %3 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %2, i64 noundef 0) #3
  %4 = load i64, ptr %3, align 8, !tbaa !14
  br label %5

5:                                                ; preds = %16, %1
  %6 = phi i64 [ %4, %1 ], [ %15, %16 ]
  %7 = phi i32 [ 1, %1 ], [ %17, %16 ]
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %10, label %9

9:                                                ; preds = %5
  br label %18

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"class.hipsycl::sycl::range", ptr %0, i32 0, i32 0
  %12 = sext i32 %7 to i64
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %11, i64 noundef %12) #3
  %14 = load i64, ptr %13, align 8, !tbaa !14
  %15 = mul i64 %6, %14
  br label %16

16:                                               ; preds = %10
  %17 = add nsw i32 %7, 1
  br label %5, !llvm.loop !15

18:                                               ; preds = %9
  ret i64 %6
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 0
  br label %12

6:                                                ; preds = %2
  %7 = icmp eq i64 %1, 1
  br i1 %7, label %8, label %10

8:                                                ; preds = %6
  %9 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 1
  br label %12

10:                                               ; preds = %6
  %11 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 2
  br label %12

12:                                               ; preds = %10, %8, %4
  %13 = phi ptr [ %5, %4 ], [ %9, %8 ], [ %11, %10 ]
  ret ptr %13
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @"_ZZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENUlNS1_7nd_itemILi3EEEE_C2ERKS6_"(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(136) %1) unnamed_addr #5 align 2 {
  %3 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %class.anon.229, ptr %1, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %4, i64 40, i1 false)
  %5 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 5
  %6 = getelementptr inbounds %class.anon.229, ptr %1, i32 0, i32 5
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %5, ptr noundef nonnull align 8 dereferenceable(32) %6)
  %7 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 6
  %8 = getelementptr inbounds %class.anon.229, ptr %1, i32 0, i32 6
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %7, ptr noundef nonnull align 8 dereferenceable(32) %8)
  %9 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 7
  %10 = getelementptr inbounds %class.anon.229, ptr %1, i32 0, i32 7
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %9, ptr noundef nonnull align 8 dereferenceable(32) %10)
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::sycl::range", ptr %0, i32 0, i32 0
  %4 = sext i32 %1 to i64
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef %4) #3
  %6 = load i64, ptr %5, align 8, !tbaa !14
  ret i64 %6
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(136) %1) unnamed_addr #5 align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %1, i32 0, i32 0
  call fastcc void @"_ZZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENUlNS1_7nd_itemILi3EEEE_C2ERKS6_"(ptr noundef nonnull align 8 dereferenceable(136) %3, ptr noundef nonnull align 8 dereferenceable(136) %4) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define internal fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 align 2 {
  %2 = alloca %"struct.hipsycl::sycl::id", align 8
  %3 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  %4 = alloca %"struct.hipsycl::sycl::id", align 8
  %5 = alloca %"struct.hipsycl::sycl::id", align 8
  %6 = alloca %"class.hipsycl::sycl::range", align 8
  %7 = alloca %"class.hipsycl::sycl::range", align 8
  %8 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr %2) #3
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 24, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl2idILi3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #3
  call void @llvm.lifetime.start.p0(i64 144, ptr %3) #3
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 144, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %4) #3
  call void @_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %5) #3
  call void @_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %6) #3
  call void @_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %7) #3
  call void @_ZN7hipsycl4sycl7nd_itemILi3EEC2EPKNS0_2idILi3EEES4_S4_NS0_5rangeILi3EEES8_PSt8functionIFvvEEPv(ptr noundef nonnull align 8 dereferenceable(144) %3, ptr noundef %2, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %4, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %5, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %6, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %7, ptr noundef null, ptr noundef null) #3
  %9 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %0, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %3, i64 144, i1 false), !tbaa.struct !18
  call fastcc void @"_ZZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENKUlNS1_7nd_itemILi3EEEE_clES5_"(ptr noundef nonnull align 8 dereferenceable(136) %9, ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %8) #3
  call void @llvm.lifetime.end.p0(i64 144, ptr %3) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr %2) #3
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv(ptr noalias sret(%"struct.hipsycl::sycl::id") align 8 %0) local_unnamed_addr #6 comdat {
  %2 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_zEv() #3
  %3 = sext i32 %2 to i64
  %4 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_yEv() #3
  %5 = sext i32 %4 to i64
  %6 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_xEv() #3
  %7 = sext i32 %6 to i64
  call void @_ZN7hipsycl4sycl2idILi3EEC2ILi3EvEEmmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %3, i64 noundef %5, i64 noundef %7) #3
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv(ptr noalias sret(%"struct.hipsycl::sycl::id") align 8 %0) local_unnamed_addr #6 comdat {
  %2 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_zEv() #3
  %3 = sext i32 %2 to i64
  %4 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_yEv() #3
  %5 = sext i32 %4 to i64
  %6 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_xEv() #3
  %7 = sext i32 %6 to i64
  call void @_ZN7hipsycl4sycl2idILi3EEC2ILi3EvEEmmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %3, i64 noundef %5, i64 noundef %7) #3
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv(ptr noalias sret(%"class.hipsycl::sycl::range") align 8 %0) local_unnamed_addr #6 comdat {
  %2 = call noundef i32 @_ZN7hipsycl4sycl6detail18__acpp_get_lsize_zEv() #3
  %3 = sext i32 %2 to i64
  %4 = call noundef i32 @_ZN7hipsycl4sycl6detail18__acpp_get_lsize_yEv() #3
  %5 = sext i32 %4 to i64
  %6 = call noundef i32 @_ZN7hipsycl4sycl6detail18__acpp_get_lsize_xEv() #3
  %7 = sext i32 %6 to i64
  call void @_ZN7hipsycl4sycl5rangeILi3EEC2ILi3EvEEmmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %3, i64 noundef %5, i64 noundef %7) #3
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv(ptr noalias sret(%"class.hipsycl::sycl::range") align 8 %0) local_unnamed_addr #6 comdat {
  %2 = call noundef i32 @_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_zEv() #3
  %3 = sext i32 %2 to i64
  %4 = call noundef i32 @_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_yEv() #3
  %5 = sext i32 %4 to i64
  %6 = call noundef i32 @_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_xEv() #3
  %7 = sext i32 %6 to i64
  call void @_ZN7hipsycl4sycl5rangeILi3EEC2ILi3EvEEmmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %3, i64 noundef %5, i64 noundef %7) #3
  ret void
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl7nd_itemILi3EEC2EPKNS0_2idILi3EEES4_S4_NS0_5rangeILi3EEES8_PSt8functionIFvvEEPv(ptr noundef nonnull align 8 dereferenceable(144) %0, ptr noundef %1, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %2, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %3, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %4, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %5, ptr noundef %6, ptr noundef %7) unnamed_addr #3 comdat align 2 {
  %9 = alloca %"struct.hipsycl::sycl::id", align 8
  %10 = alloca %"struct.hipsycl::sycl::id", align 8
  %11 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 0
  store ptr %1, ptr %11, align 8, !tbaa !21
  %12 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %2, i64 24, i1 false), !tbaa.struct !25
  %13 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %3, i64 24, i1 false), !tbaa.struct !25
  %14 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %4, i64 24, i1 false), !tbaa.struct !25
  %15 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %5, i64 24, i1 false), !tbaa.struct !25
  %16 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 5
  call void @llvm.lifetime.start.p0(i64 24, ptr %9) #3
  call void @llvm.lifetime.start.p0(i64 24, ptr %10) #3
  call void @_ZN7hipsycl4sycl2idILi3EEC2ERKNS0_5rangeILi3EEE(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 8 dereferenceable(24) %4) #3
  call void @_ZN7hipsycl4syclmlERKNS0_2idILi3EEES4_(ptr sret(%"struct.hipsycl::sycl::id") align 8 %9, ptr noundef nonnull align 8 dereferenceable(24) %2, ptr noundef nonnull align 8 dereferenceable(24) %10) #3
  call void @_ZN7hipsycl4syclplERKNS0_2idILi3EEES4_(ptr sret(%"struct.hipsycl::sycl::id") align 8 %16, ptr noundef nonnull align 8 dereferenceable(24) %9, ptr noundef nonnull align 8 dereferenceable(24) %3) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr %10) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr %9) #3
  %17 = getelementptr inbounds %"struct.hipsycl::sycl::nd_item", ptr %0, i32 0, i32 6
  store ptr %7, ptr %17, align 8, !tbaa !26
  br label %18

18:                                               ; preds = %8
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define internal fastcc void @"_ZZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENKUlNS1_7nd_itemILi3EEEE_clES5_"(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %1) unnamed_addr #6 align 2 {
  %3 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  %4 = alloca %"class.hipsycl::sycl::local_accessor", align 8
  %5 = alloca %"class.hipsycl::sycl::local_accessor", align 8
  %6 = alloca %"class.hipsycl::sycl::local_accessor", align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %1, i64 144, i1 false), !tbaa.struct !18
  %7 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8, !tbaa !27
  %9 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8, !tbaa !34
  %11 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8, !tbaa !35
  %13 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8, !tbaa !36
  %15 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 4
  %16 = load i64, ptr %15, align 8, !tbaa !37
  %17 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 5
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %4, ptr noundef nonnull align 8 dereferenceable(32) %17)
  %18 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 6
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %5, ptr noundef nonnull align 8 dereferenceable(32) %18)
  %19 = getelementptr inbounds %class.anon.229, ptr %0, i32 0, i32 7
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %6, ptr noundef nonnull align 8 dereferenceable(32) %19)
  call void @_Z14padding_layoutN7hipsycl4sycl7nd_itemILi3EEEPfS3_S3_S3_lNS0_14local_accessorIfLi3EEES5_S5_(ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %3, ptr noundef %8, ptr noundef %10, ptr noundef %12, ptr noundef %14, i64 noundef %16, ptr noundef %4, ptr noundef %5, ptr noundef %6) #3
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_zEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_group_id_z() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_yEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_group_id_y() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_xEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_group_id_x() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl2idILi3EEC2ILi3EvEEmmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) unnamed_addr #3 comdat align 2 {
  %5 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %5, i32 0, i32 0
  store i64 %1, ptr %6, align 8, !tbaa !7
  %7 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %5, i32 0, i32 1
  store i64 %2, ptr %7, align 8, !tbaa !12
  %8 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %5, i32 0, i32 2
  store i64 %3, ptr %8, align 8, !tbaa !13
  ret void
}

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_group_id_z() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_group_id_y() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_group_id_x() local_unnamed_addr #3

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_zEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_local_id_z() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_yEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_local_id_y() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_xEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_local_id_x() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_local_id_z() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_local_id_y() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_local_id_x() local_unnamed_addr #3

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail18__acpp_get_lsize_zEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_local_size_z() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail18__acpp_get_lsize_yEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_local_size_y() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail18__acpp_get_lsize_xEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_local_size_x() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_local_size_z() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_local_size_y() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_local_size_x() local_unnamed_addr #3

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_zEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_num_groups_z() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_yEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_num_groups_y() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_ZN7hipsycl4sycl6detail20__acpp_get_ngroups_xEv() local_unnamed_addr #6 comdat {
  br label %1

1:                                                ; preds = %0
  %2 = call i64 @__acpp_sscp_get_num_groups_x() #3
  %3 = trunc i64 %2 to i32
  br label %4

4:                                                ; preds = %1
  ret i32 %3
}

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_num_groups_z() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_num_groups_y() local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @__acpp_sscp_get_num_groups_x() local_unnamed_addr #3

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4syclplERKNS0_2idILi3EEES4_(ptr noalias sret(%"struct.hipsycl::sycl::id") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 comdat {
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 24, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl2idILi3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #3
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %1, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %4, i64 noundef 0) #3
  %6 = load i64, ptr %5, align 8, !tbaa !14
  %7 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %2, i32 0, i32 0
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef 0) #3
  %9 = load i64, ptr %8, align 8, !tbaa !14
  %10 = add i64 %6, %9
  %11 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %11, i64 noundef 0) #3
  store i64 %10, ptr %12, align 8, !tbaa !14
  br label %13

13:                                               ; preds = %27, %3
  %14 = phi i64 [ 1, %3 ], [ %28, %27 ]
  %15 = icmp ult i64 %14, 3
  br i1 %15, label %17, label %16

16:                                               ; preds = %13
  br label %29

17:                                               ; preds = %13
  %18 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %1, i32 0, i32 0
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %18, i64 noundef %14) #3
  %20 = load i64, ptr %19, align 8, !tbaa !14
  %21 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %2, i32 0, i32 0
  %22 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %21, i64 noundef %14) #3
  %23 = load i64, ptr %22, align 8, !tbaa !14
  %24 = add i64 %20, %23
  %25 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %25, i64 noundef %14) #3
  store i64 %24, ptr %26, align 8, !tbaa !14
  br label %27

27:                                               ; preds = %17
  %28 = add i64 %14, 1
  br label %13, !llvm.loop !38

29:                                               ; preds = %16
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4syclmlERKNS0_2idILi3EEES4_(ptr noalias sret(%"struct.hipsycl::sycl::id") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 comdat {
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 24, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl2idILi3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #3
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %1, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %4, i64 noundef 0) #3
  %6 = load i64, ptr %5, align 8, !tbaa !14
  %7 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %2, i32 0, i32 0
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef 0) #3
  %9 = load i64, ptr %8, align 8, !tbaa !14
  %10 = mul i64 %6, %9
  %11 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %11, i64 noundef 0) #3
  store i64 %10, ptr %12, align 8, !tbaa !14
  br label %13

13:                                               ; preds = %27, %3
  %14 = phi i64 [ 1, %3 ], [ %28, %27 ]
  %15 = icmp ult i64 %14, 3
  br i1 %15, label %17, label %16

16:                                               ; preds = %13
  br label %29

17:                                               ; preds = %13
  %18 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %1, i32 0, i32 0
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %18, i64 noundef %14) #3
  %20 = load i64, ptr %19, align 8, !tbaa !14
  %21 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %2, i32 0, i32 0
  %22 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %21, i64 noundef %14) #3
  %23 = load i64, ptr %22, align 8, !tbaa !14
  %24 = mul i64 %20, %23
  %25 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %25, i64 noundef %14) #3
  store i64 %24, ptr %26, align 8, !tbaa !14
  br label %27

27:                                               ; preds = %17
  %28 = add i64 %14, 1
  br label %13, !llvm.loop !39

29:                                               ; preds = %16
  ret void
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl2idILi3EEC2ERKNS0_5rangeILi3EEE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #3 comdat align 2 {
  %3 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  call void @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #3
  %4 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef 0) #3
  %5 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %5, i64 noundef 0) #3
  store i64 %4, ptr %6, align 8, !tbaa !14
  br label %7

7:                                                ; preds = %16, %2
  %8 = phi i64 [ 1, %2 ], [ %17, %16 ]
  %9 = icmp ult i64 %8, 3
  br i1 %9, label %11, label %10

10:                                               ; preds = %7
  br label %18

11:                                               ; preds = %7
  %12 = trunc i64 %8 to i32
  %13 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef %12) #3
  %14 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %15 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %14, i64 noundef %8) #3
  store i64 %13, ptr %15, align 8, !tbaa !14
  br label %16

16:                                               ; preds = %11
  %17 = add i64 %8, 1
  br label %7, !llvm.loop !40

18:                                               ; preds = %10
  ret void
}

; Function Attrs: inlinehint nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #5 comdat align 2 {
  %2 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 0
  store i64 0, ptr %2, align 8, !tbaa !7
  %3 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 1
  store i64 0, ptr %3, align 8, !tbaa !12
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::detail::device_array", ptr %0, i32 0, i32 2
  store i64 0, ptr %4, align 8, !tbaa !13
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_Z14padding_layoutN7hipsycl4sycl7nd_itemILi3EEEPfS3_S3_S3_lNS0_14local_accessorIfLi3EEES5_S5_(ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i64 noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) local_unnamed_addr #6 comdat {
  %10 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %11 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %12 = alloca %"class.hipsycl::sycl::range", align 8
  %13 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %14 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %15 = alloca %"class.hipsycl::sycl::range", align 8
  %16 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %17 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %18 = alloca %"class.hipsycl::sycl::range", align 8
  %19 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %20 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %21 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %22 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %23 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %24 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %25 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %26 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %27 = alloca %"class.hipsycl::sycl::range", align 8
  %28 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", align 8
  %29 = alloca %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", align 8
  %30 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE9get_groupEi(ptr noundef nonnull align 8 dereferenceable(144) %0, i32 noundef 0) #3
  %31 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE19get_local_linear_idEv(ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  br label %32

32:                                               ; preds = %54, %9
  %33 = phi i64 [ %31, %9 ], [ %56, %54 ]
  %34 = icmp slt i64 %33, 256
  br i1 %34, label %36, label %35

35:                                               ; preds = %32
  br label %57

36:                                               ; preds = %32
  %37 = sdiv i64 %33, 128
  %38 = srem i64 %37, 2
  %39 = sdiv i64 %33, 32
  %40 = srem i64 %39, 4
  %41 = sdiv i64 %33, 1
  %42 = srem i64 %41, 32
  %43 = mul nsw i64 %30, 256
  %44 = mul nsw i64 %38, 128
  %45 = add nsw i64 %43, %44
  %46 = mul nsw i64 %40, 32
  %47 = add nsw i64 %45, %46
  %48 = add nsw i64 %47, %42
  %49 = getelementptr inbounds float, ptr %1, i64 %48
  %50 = getelementptr inbounds float, ptr %49, i64 0
  %51 = getelementptr inbounds float, ptr %50, i64 0
  %52 = load float, ptr %51, align 4, !tbaa !41
  call void @llvm.lifetime.start.p0(i64 32, ptr %10) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %11) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %11, ptr noundef nonnull align 8 dereferenceable(32) %6, i64 noundef %38) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %10, ptr noundef nonnull align 8 dereferenceable(32) %11, i64 noundef %40) #3
  %53 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %10, i64 noundef %42) #3
  store float %52, ptr %53, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %11) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %10) #3
  br label %54

54:                                               ; preds = %36
  call void @llvm.lifetime.start.p0(i64 24, ptr %12) #3
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE15get_local_rangeEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %12, ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  %55 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %12) #3
  %56 = add i64 %33, %55
  call void @llvm.lifetime.end.p0(i64 24, ptr %12) #3
  br label %32, !llvm.loop !43

57:                                               ; preds = %35
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext 0) #3
  %58 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE19get_local_linear_idEv(ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  br label %59

59:                                               ; preds = %81, %57
  %60 = phi i64 [ %58, %57 ], [ %83, %81 ]
  %61 = icmp slt i64 %60, 512
  br i1 %61, label %63, label %62

62:                                               ; preds = %59
  br label %84

63:                                               ; preds = %59
  %64 = sdiv i64 %60, 256
  %65 = srem i64 %64, 2
  %66 = sdiv i64 %60, 8
  %67 = srem i64 %66, 32
  %68 = sdiv i64 %60, 1
  %69 = srem i64 %68, 8
  %70 = mul nsw i64 %30, 512
  %71 = mul nsw i64 %65, 256
  %72 = add nsw i64 %70, %71
  %73 = mul nsw i64 %67, 8
  %74 = add nsw i64 %72, %73
  %75 = add nsw i64 %74, %69
  %76 = getelementptr inbounds float, ptr %2, i64 %75
  %77 = getelementptr inbounds float, ptr %76, i64 0
  %78 = getelementptr inbounds float, ptr %77, i64 0
  %79 = load float, ptr %78, align 4, !tbaa !41
  call void @llvm.lifetime.start.p0(i64 32, ptr %13) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %14) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %14, ptr noundef nonnull align 8 dereferenceable(32) %7, i64 noundef %65) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %13, ptr noundef nonnull align 8 dereferenceable(32) %14, i64 noundef %67) #3
  %80 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %13, i64 noundef %69) #3
  store float %79, ptr %80, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %14) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %13) #3
  br label %81

81:                                               ; preds = %63
  call void @llvm.lifetime.start.p0(i64 24, ptr %15) #3
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE15get_local_rangeEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %15, ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  %82 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %15) #3
  %83 = add i64 %60, %82
  call void @llvm.lifetime.end.p0(i64 24, ptr %15) #3
  br label %59, !llvm.loop !44

84:                                               ; preds = %62
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext 0) #3
  %85 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE19get_local_linear_idEv(ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  br label %86

86:                                               ; preds = %98, %84
  %87 = phi i64 [ %85, %84 ], [ %100, %98 ]
  %88 = icmp slt i64 %87, 64
  br i1 %88, label %90, label %89

89:                                               ; preds = %86
  br label %101

90:                                               ; preds = %86
  %91 = sdiv i64 %87, 32
  %92 = srem i64 %91, 2
  %93 = sdiv i64 %87, 8
  %94 = srem i64 %93, 4
  %95 = sdiv i64 %87, 1
  %96 = srem i64 %95, 8
  call void @llvm.lifetime.start.p0(i64 32, ptr %16) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %17) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %17, ptr noundef nonnull align 8 dereferenceable(32) %8, i64 noundef %92) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %16, ptr noundef nonnull align 8 dereferenceable(32) %17, i64 noundef %94) #3
  %97 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %16, i64 noundef %96) #3
  store float 0.000000e+00, ptr %97, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %17) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %16) #3
  br label %98

98:                                               ; preds = %90
  call void @llvm.lifetime.start.p0(i64 24, ptr %18) #3
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE15get_local_rangeEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %18, ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  %99 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %18) #3
  %100 = add i64 %87, %99
  call void @llvm.lifetime.end.p0(i64 24, ptr %18) #3
  br label %86, !llvm.loop !45

101:                                              ; preds = %89
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext 0) #3
  %102 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE19get_local_linear_idEv(ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  br label %103

103:                                              ; preds = %131, %101
  %104 = phi i64 [ %102, %101 ], [ %133, %131 ]
  %105 = icmp slt i64 %104, 64
  br i1 %105, label %107, label %106

106:                                              ; preds = %103
  br label %134

107:                                              ; preds = %103
  %108 = sdiv i64 %104, 32
  %109 = srem i64 %108, 2
  %110 = sdiv i64 %104, 8
  %111 = srem i64 %110, 4
  %112 = sdiv i64 %104, 1
  %113 = srem i64 %112, 8
  br label %114

114:                                              ; preds = %128, %107
  %115 = phi i64 [ 0, %107 ], [ %129, %128 ]
  %116 = icmp slt i64 %115, 32
  br i1 %116, label %118, label %117

117:                                              ; preds = %114
  br label %130

118:                                              ; preds = %114
  call void @llvm.lifetime.start.p0(i64 32, ptr %19) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %20) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %20, ptr noundef nonnull align 8 dereferenceable(32) %6, i64 noundef %109) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %19, ptr noundef nonnull align 8 dereferenceable(32) %20, i64 noundef %111) #3
  %119 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %19, i64 noundef %115) #3
  %120 = load float, ptr %119, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %20) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %19) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %21) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %22) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %22, ptr noundef nonnull align 8 dereferenceable(32) %7, i64 noundef %109) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %21, ptr noundef nonnull align 8 dereferenceable(32) %22, i64 noundef %115) #3
  %121 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %21, i64 noundef %113) #3
  %122 = load float, ptr %121, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %22) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %21) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %23) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %24) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %24, ptr noundef nonnull align 8 dereferenceable(32) %8, i64 noundef %109) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %23, ptr noundef nonnull align 8 dereferenceable(32) %24, i64 noundef %111) #3
  %123 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %23, i64 noundef %113) #3
  %124 = load float, ptr %123, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %24) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %23) #3
  %125 = fmul contract float %120, %122
  %126 = fadd contract float %124, %125
  call void @llvm.lifetime.start.p0(i64 32, ptr %25) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %26) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %26, ptr noundef nonnull align 8 dereferenceable(32) %8, i64 noundef %109) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %25, ptr noundef nonnull align 8 dereferenceable(32) %26, i64 noundef %111) #3
  %127 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %25, i64 noundef %113) #3
  store float %126, ptr %127, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %26) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %25) #3
  br label %128

128:                                              ; preds = %118
  %129 = add nsw i64 %115, 1
  br label %114, !llvm.loop !46

130:                                              ; preds = %117
  br label %131

131:                                              ; preds = %130
  call void @llvm.lifetime.start.p0(i64 24, ptr %27) #3
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE15get_local_rangeEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %27, ptr noundef nonnull align 8 dereferenceable(144) %0) #3
  %132 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %27) #3
  %133 = add i64 %104, %132
  call void @llvm.lifetime.end.p0(i64 24, ptr %27) #3
  br label %103, !llvm.loop !47

134:                                              ; preds = %106
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext 0) #3
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext 0) #3
  %135 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE12get_local_idEi(ptr noundef nonnull align 8 dereferenceable(144) %0, i32 noundef 0) #3
  %136 = icmp eq i64 %135, 0
  br i1 %136, label %137, label %184

137:                                              ; preds = %134
  %138 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE12get_local_idEi(ptr noundef nonnull align 8 dereferenceable(144) %0, i32 noundef 1) #3
  %139 = icmp eq i64 %138, 0
  br i1 %139, label %140, label %184

140:                                              ; preds = %137
  %141 = call noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE12get_local_idEi(ptr noundef nonnull align 8 dereferenceable(144) %0, i32 noundef 2) #3
  %142 = icmp eq i64 %141, 0
  br i1 %142, label %143, label %184

143:                                              ; preds = %140
  br label %144

144:                                              ; preds = %181, %143
  %145 = phi i64 [ 0, %143 ], [ %182, %181 ]
  %146 = icmp slt i64 %145, 2
  br i1 %146, label %148, label %147

147:                                              ; preds = %144
  br label %183

148:                                              ; preds = %144
  br label %149

149:                                              ; preds = %178, %148
  %150 = phi i64 [ 0, %148 ], [ %179, %178 ]
  %151 = icmp slt i64 %150, 4
  br i1 %151, label %153, label %152

152:                                              ; preds = %149
  br label %180

153:                                              ; preds = %149
  br label %154

154:                                              ; preds = %175, %153
  %155 = phi i64 [ 0, %153 ], [ %176, %175 ]
  %156 = icmp slt i64 %155, 8
  br i1 %156, label %158, label %157

157:                                              ; preds = %154
  br label %177

158:                                              ; preds = %154
  %159 = mul nsw i64 %30, 64
  %160 = mul nsw i64 %145, 32
  %161 = add nsw i64 %159, %160
  %162 = mul nsw i64 %150, 8
  %163 = add nsw i64 %161, %162
  %164 = add nsw i64 %163, %155
  call void @llvm.lifetime.start.p0(i64 32, ptr %28) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr %29) #3
  call void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %29, ptr noundef nonnull align 8 dereferenceable(32) %8, i64 noundef %145) #3
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %28, ptr noundef nonnull align 8 dereferenceable(32) %29, i64 noundef %150) #3
  %165 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %28, i64 noundef %155) #3
  %166 = load float, ptr %165, align 4, !tbaa !41
  call void @llvm.lifetime.end.p0(i64 32, ptr %29) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr %28) #3
  %167 = icmp ult i64 %164, %5
  %168 = zext i1 %167 to i8
  %169 = trunc i8 %168 to i1
  br i1 %169, label %170, label %174

170:                                              ; preds = %158
  %171 = getelementptr inbounds float, ptr %3, i64 %164
  %172 = getelementptr inbounds float, ptr %171, i64 0
  %173 = getelementptr inbounds float, ptr %172, i64 0
  store float %166, ptr %173, align 4, !tbaa !41
  br label %174

174:                                              ; preds = %170, %158
  br label %175

175:                                              ; preds = %174
  %176 = add nsw i64 %155, 1
  br label %154, !llvm.loop !48

177:                                              ; preds = %157
  br label %178

178:                                              ; preds = %177
  %179 = add nsw i64 %150, 1
  br label %149, !llvm.loop !49

180:                                              ; preds = %152
  br label %181

181:                                              ; preds = %180
  %182 = add nsw i64 %145, 1
  br label %144, !llvm.loop !50

183:                                              ; preds = %147
  br label %184

184:                                              ; preds = %183, %140, %137, %134
  call void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext 0) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE9get_groupEi(ptr noundef nonnull align 8 dereferenceable(144) %0, i32 noundef %1) local_unnamed_addr #4 comdat align 2 {
  br label %3

3:                                                ; preds = %2
  %4 = call noundef i64 @_ZN7hipsycl4sycl6detail12get_group_idILi3EEEmi(i32 noundef %1) #3
  br label %5

5:                                                ; preds = %3
  ret i64 %4
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE19get_local_linear_idEv(ptr noundef nonnull align 8 dereferenceable(144) %0) local_unnamed_addr #4 comdat align 2 {
  br label %2

2:                                                ; preds = %1
  %3 = call noundef i64 @_Z31__acpp_sscp_get_local_linear_idILi3EEmv() #3
  br label %4

4:                                                ; preds = %2
  ret i64 %3
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEENS0_6detail8accessor21local_subscript_proxyIfLi3ELi1EEEm(ptr noalias sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380") align 8 %0, ptr noundef nonnull align 8 dereferenceable(32) %1, i64 noundef %2) local_unnamed_addr #4 comdat align 2 {
  %4 = alloca %"struct.hipsycl::sycl::id", align 8
  %5 = alloca %"struct.hipsycl::sycl::id", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr %4) #3
  call void @llvm.memset.p0.i64(ptr align 8 %4, i8 0, i64 24, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl2idILi3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #3
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl2idILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %4, i32 noundef 0) #3
  store i64 %2, ptr %6, align 8, !tbaa !14
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %4, i64 24, i1 false), !tbaa.struct !25
  call void @_ZN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEC2EPKNS0_14local_accessorIfLi3EEENS0_2idILi3EEE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %1, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %5) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr %4) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEixILi3ELi1ELb1EEENS3_IfLi3ELi2EEEm(ptr noalias sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %0, ptr noundef nonnull align 8 dereferenceable(32) %1, i64 noundef %2) local_unnamed_addr #4 comdat align 2 {
  call void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EE17create_next_proxyEm(ptr sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %0, ptr noundef nonnull align 8 dereferenceable(32) %1, i64 noundef %2) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEixILi3ELi2ELb1EEERfm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EE19invoke_value_accessEm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1) #3
  ret ptr %3
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZNK7hipsycl4sycl7nd_itemILi3EE15get_local_rangeEv(ptr noalias sret(%"class.hipsycl::sycl::range") align 8 %0, ptr noundef nonnull align 8 dereferenceable(144) %1) local_unnamed_addr #4 comdat align 2 {
  br label %3

3:                                                ; preds = %2
  call void @_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %0) #3
  br label %4

4:                                                ; preds = %3
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZNK7hipsycl4sycl7nd_itemILi3EE7barrierENS0_6access11fence_spaceE(ptr noundef nonnull align 8 dereferenceable(144) %0, i8 noundef signext %1) local_unnamed_addr #4 comdat align 2 {
  br label %3

3:                                                ; preds = %2
  call void @_ZN7hipsycl4sycl6detail20local_device_barrierENS0_6access11fence_spaceE(i8 noundef signext %1) #3
  br label %4

4:                                                ; preds = %3
  br label %5

5:                                                ; preds = %4
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl7nd_itemILi3EE12get_local_idEi(ptr noundef nonnull align 8 dereferenceable(144) %0, i32 noundef %1) local_unnamed_addr #4 comdat align 2 {
  br label %3

3:                                                ; preds = %2
  %4 = call noundef i64 @_ZN7hipsycl4sycl6detail12get_local_idILi3EEEmi(i32 noundef %1) #3
  br label %5

5:                                                ; preds = %3
  ret i64 %4
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZN7hipsycl4sycl6detail12get_group_idILi3EEEmi(i32 noundef %0) local_unnamed_addr #6 comdat {
  switch i32 %0, label %11 [
    i32 0, label %2
    i32 1, label %5
    i32 2, label %8
  ]

2:                                                ; preds = %1
  %3 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_zEv() #3
  %4 = sext i32 %3 to i64
  br label %12

5:                                                ; preds = %1
  %6 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_yEv() #3
  %7 = sext i32 %6 to i64
  br label %12

8:                                                ; preds = %1
  %9 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_gid_xEv() #3
  %10 = sext i32 %9 to i64
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %8, %5, %2
  %13 = phi i64 [ 0, %11 ], [ %10, %8 ], [ %7, %5 ], [ %4, %2 ]
  ret i64 %13
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_Z31__acpp_sscp_get_local_linear_idILi3EEmv() local_unnamed_addr #4 comdat {
  %1 = call zeroext i1 @__acpp_sscp_if_global_sizes_fit_in_int() #3
  br i1 %1, label %2, label %5

2:                                                ; preds = %0
  %3 = call noundef i32 @_Z37__acpp_sscp_typed_get_local_linear_idILi3EiET0_v() #3
  %4 = sext i32 %3 to i64
  br label %7

5:                                                ; preds = %0
  %6 = call noundef i64 @_Z37__acpp_sscp_typed_get_local_linear_idILi3EmET0_v() #3
  br label %7

7:                                                ; preds = %5, %2
  %8 = phi i64 [ %4, %2 ], [ %6, %5 ]
  ret i64 %8
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZN7hipsycl4sycl6detail9linear_idILi3EE3getERKNS0_2idILi3EEERKNS0_5rangeILi3EEE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 comdat align 2 {
  %3 = call noundef i64 @_ZNK7hipsycl4sycl2idILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 0) #3
  %4 = call noundef i64 @_ZNK7hipsycl4sycl2idILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 1) #3
  %5 = call noundef i64 @_ZNK7hipsycl4sycl2idILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 2) #3
  %6 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef 1) #3
  %7 = call noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef 2) #3
  %8 = call noundef i64 @_ZN7hipsycl4sycl6detail13get_linear_idEmmmmm(i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7) #3
  ret i64 %8
}

; Function Attrs: nounwind
declare dso_local zeroext i1 @__acpp_sscp_if_global_sizes_fit_in_int() local_unnamed_addr #3

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i32 @_Z37__acpp_sscp_typed_get_local_linear_idILi3EiET0_v() local_unnamed_addr #4 comdat {
  %1 = call i64 @__acpp_sscp_get_local_id_x() #3
  %2 = trunc i64 %1 to i32
  %3 = call i64 @__acpp_sscp_get_local_id_y() #3
  %4 = trunc i64 %3 to i32
  %5 = call i64 @__acpp_sscp_get_local_id_z() #3
  %6 = trunc i64 %5 to i32
  %7 = call i64 @__acpp_sscp_get_local_size_x() #3
  %8 = trunc i64 %7 to i32
  %9 = call i64 @__acpp_sscp_get_local_size_y() #3
  %10 = trunc i64 %9 to i32
  %11 = mul nsw i32 %8, %10
  %12 = mul nsw i32 %11, %6
  %13 = mul nsw i32 %8, %4
  %14 = add nsw i32 %12, %13
  %15 = add nsw i32 %14, %2
  ret i32 %15
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_Z37__acpp_sscp_typed_get_local_linear_idILi3EmET0_v() local_unnamed_addr #4 comdat {
  %1 = call i64 @__acpp_sscp_get_local_id_x() #3
  %2 = call i64 @__acpp_sscp_get_local_id_y() #3
  %3 = call i64 @__acpp_sscp_get_local_id_z() #3
  %4 = call i64 @__acpp_sscp_get_local_size_x() #3
  %5 = call i64 @__acpp_sscp_get_local_size_y() #3
  %6 = mul i64 %4, %5
  %7 = mul i64 %6, %3
  %8 = mul i64 %4, %2
  %9 = add i64 %7, %8
  %10 = add i64 %9, %1
  ret i64 %10
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZN7hipsycl4sycl6detail13get_linear_idEmmmmm(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) local_unnamed_addr #6 comdat {
  %6 = mul i64 %0, %3
  %7 = mul i64 %6, %4
  %8 = mul i64 %1, %4
  %9 = add i64 %7, %8
  %10 = add i64 %9, %2
  ret i64 %10
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl2idILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %4 = sext i32 %1 to i64
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef %4) #3
  %6 = load i64, ptr %5, align 8, !tbaa !14
  ret i64 %6
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl5rangeILi3EE3getEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::sycl::range", ptr %0, i32 0, i32 0
  %4 = sext i32 %1 to i64
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef %4) #3
  %6 = load i64, ptr %5, align 8, !tbaa !14
  ret i64 %6
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl2idILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = getelementptr inbounds %"struct.hipsycl::sycl::id", ptr %0, i32 0, i32 0
  %4 = sext i32 %1 to i64
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl6detail12device_arrayImLm3EEixEm(ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef %4) #3
  ret ptr %5
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEC2EPKNS0_14local_accessorIfLi3EEENS0_2idILi3EEE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %1, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %2) unnamed_addr #3 comdat align 2 {
  %4 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", ptr %0, i32 0, i32 0
  store ptr %1, ptr %4, align 8, !tbaa !51
  %5 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", ptr %0, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %2, i64 24, i1 false), !tbaa.struct !25
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EE17create_next_proxyEm(ptr noalias sret(%"class.hipsycl::sycl::detail::accessor::local_subscript_proxy") align 8 %0, ptr noundef nonnull align 8 dereferenceable(32) %1, i64 noundef %2) local_unnamed_addr #4 comdat align 2 {
  %4 = alloca %"struct.hipsycl::sycl::id", align 8
  %5 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", ptr %1, i32 0, i32 1
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl2idILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %5, i32 noundef 1) #3
  store i64 %2, ptr %6, align 8, !tbaa !14
  %7 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", ptr %1, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8, !tbaa !51
  %9 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy.380", ptr %1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %9, i64 24, i1 false), !tbaa.struct !25
  call void @_ZN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEC2EPKNS0_14local_accessorIfLi3EEENS0_2idILi3EEE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %8, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %4) #3
  ret void
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEC2EPKNS0_14local_accessorIfLi3EEENS0_2idILi3EEE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %1, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %2) unnamed_addr #3 comdat align 2 {
  %4 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", ptr %0, i32 0, i32 0
  store ptr %1, ptr %4, align 8, !tbaa !53
  %5 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", ptr %0, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %2, i64 24, i1 false), !tbaa.struct !25
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EE19invoke_value_accessEm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1) local_unnamed_addr #4 comdat align 2 {
  %3 = alloca %"struct.hipsycl::sycl::id", align 8
  %4 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", ptr %0, i32 0, i32 1
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN7hipsycl4sycl2idILi3EEixEi(ptr noundef nonnull align 8 dereferenceable(24) %4, i32 noundef 2) #3
  store i64 %1, ptr %5, align 8, !tbaa !14
  %6 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", ptr %0, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8, !tbaa !53
  %8 = getelementptr inbounds %"class.hipsycl::sycl::detail::accessor::local_subscript_proxy", ptr %0, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %8, i64 24, i1 false), !tbaa.struct !25
  %9 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEERfNS0_2idILi3EEE(ptr noundef nonnull align 8 dereferenceable(32) %7, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %3) #3
  ret ptr %9
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7hipsycl4sycl14local_accessorIfLi3EEixILi3ELb0EEERfNS0_2idILi3EEE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %1) local_unnamed_addr #4 comdat align 2 {
  %3 = alloca %"class.hipsycl::sycl::range", align 8
  %4 = getelementptr inbounds %"class.hipsycl::sycl::local_accessor", ptr %0, i32 0, i32 0
  %5 = call noundef i64 @_ZNK7hipsycl4sycl11specializedImEcvmEv(ptr noundef nonnull align 8 dereferenceable(8) %4) #3
  %6 = call noundef ptr @_ZN7hipsycl4sycl6detail12local_memory7get_ptrIfEEPT_m(i64 noundef %5) #3
  call void @llvm.lifetime.start.p0(i64 24, ptr %3) #3
  %7 = getelementptr inbounds %"class.hipsycl::sycl::local_accessor", ptr %0, i32 0, i32 1
  call void @_ZNK7hipsycl4sycl11specializedINS0_5rangeILi3EEEEcvS3_Ev(ptr sret(%"class.hipsycl::sycl::range") align 8 %3, ptr noundef nonnull align 8 dereferenceable(24) %7) #3
  %8 = call noundef i64 @_ZN7hipsycl4sycl6detail9linear_idILi3EE3getERKNS0_2idILi3EEERKNS0_5rangeILi3EEE(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %3) #3
  %9 = getelementptr inbounds float, ptr %6, i64 %8
  call void @llvm.lifetime.end.p0(i64 24, ptr %3) #3
  ret ptr %9
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef ptr @_ZN7hipsycl4sycl6detail12local_memory7get_ptrIfEEPT_m(i64 noundef %0) local_unnamed_addr #4 comdat align 2 {
  br label %2

2:                                                ; preds = %1
  %3 = call ptr addrspace(3) @__acpp_sscp_get_dynamic_local_memory() #3
  %4 = addrspacecast ptr addrspace(3) %3 to ptr
  %5 = getelementptr inbounds i8, ptr %4, i64 %0
  br label %6

6:                                                ; preds = %2
  ret ptr %5
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZNK7hipsycl4sycl11specializedImEcvmEv(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #4 comdat align 2 {
  %2 = getelementptr inbounds %"class.hipsycl::sycl::specialized", ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized", ptr %2, i32 0, i32 0
  %4 = load i64, ptr %3, align 8, !tbaa !55
  ret i64 %4
}

; Function Attrs: mustprogress nounwind
define linkonce_odr dso_local void @_ZNK7hipsycl4sycl11specializedINS0_5rangeILi3EEEEcvS3_Ev(ptr noalias sret(%"class.hipsycl::sycl::range") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 comdat align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::sycl::specialized.227", ptr %1, i32 0, i32 0
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized.228", ptr %3, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %4, i64 24, i1 false), !tbaa.struct !25
  ret void
}

; Function Attrs: nounwind
declare dso_local ptr addrspace(3) @__acpp_sscp_get_dynamic_local_memory() local_unnamed_addr #3

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail20local_device_barrierENS0_6access11fence_spaceE(i8 noundef signext %0) local_unnamed_addr #6 comdat {
  br label %2

2:                                                ; preds = %1
  call void @_ZN7hipsycl4sycl6detail12sscp_barrierENS0_6access11fence_spaceE(i8 noundef signext %0) #3
  br label %3

3:                                                ; preds = %2
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl6detail12sscp_barrierENS0_6access11fence_spaceE(i8 noundef signext %0) local_unnamed_addr #6 comdat {
  %2 = icmp eq i8 %0, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  call void @__acpp_sscp_work_group_barrier(i32 noundef 2, i32 noundef 4) #7
  br label %5

4:                                                ; preds = %1
  call void @__acpp_sscp_work_group_barrier(i32 noundef 3, i32 noundef 4) #7
  br label %5

5:                                                ; preds = %4, %3
  ret void
}

; Function Attrs: convergent nounwind
declare dso_local void @__acpp_sscp_work_group_barrier(i32 noundef, i32 noundef) local_unnamed_addr #7

; Function Attrs: inlinehint mustprogress nounwind
define linkonce_odr dso_local noundef i64 @_ZN7hipsycl4sycl6detail12get_local_idILi3EEEmi(i32 noundef %0) local_unnamed_addr #6 comdat {
  switch i32 %0, label %11 [
    i32 0, label %2
    i32 1, label %5
    i32 2, label %8
  ]

2:                                                ; preds = %1
  %3 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_zEv() #3
  %4 = sext i32 %3 to i64
  br label %12

5:                                                ; preds = %1
  %6 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_yEv() #3
  %7 = sext i32 %6 to i64
  br label %12

8:                                                ; preds = %1
  %9 = call noundef i32 @_ZN7hipsycl4sycl6detail16__acpp_get_lid_xEv() #3
  %10 = sext i32 %9 to i64
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %8, %5, %2
  %13 = phi i64 [ 0, %11 ], [ %10, %8 ], [ %7, %5 ], [ %4, %2 ]
  ret i64 %13
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(160) %0, ptr noundef nonnull align 8 dereferenceable(160) %1) unnamed_addr #5 align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %1, i32 0, i32 0
  call fastcc void @"_ZZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENUlNS1_7nd_itemILi3EEEE_C2ERKS6_"(ptr noundef nonnull align 8 dereferenceable(136) %3, ptr noundef nonnull align 8 dereferenceable(136) %4) #3
  %5 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %0, i32 0, i32 1
  %6 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %6, i64 24, i1 false), !tbaa.struct !25
  ret void
}

; Function Attrs: mustprogress nounwind
define internal fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(160) %0) unnamed_addr #4 align 2 {
  %2 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  %3 = alloca %"struct.hipsycl::sycl::id", align 8
  %4 = alloca %"struct.hipsycl::sycl::id", align 8
  %5 = alloca %"class.hipsycl::sycl::range", align 8
  %6 = alloca %"class.hipsycl::sycl::range", align 8
  %7 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  call void @llvm.lifetime.start.p0(i64 144, ptr %2) #3
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 144, i1 false), !annotation !17
  %8 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %0, i32 0, i32 1
  call void @_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %3) #3
  call void @_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %4) #3
  call void @_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %5) #3
  call void @_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %6) #3
  call void @_ZN7hipsycl4sycl7nd_itemILi3EEC2EPKNS0_2idILi3EEES4_S4_NS0_5rangeILi3EEES8_PSt8functionIFvvEEPv(ptr noundef nonnull align 8 dereferenceable(144) %2, ptr noundef %8, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %3, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %4, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %5, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %6, ptr noundef null, ptr noundef null) #3
  %9 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %0, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %2, i64 144, i1 false), !tbaa.struct !18
  call fastcc void @"_ZZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENKUlNS1_7nd_itemILi3EEEE_clES5_"(ptr noundef nonnull align 8 dereferenceable(136) %9, ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %7) #3
  call void @llvm.lifetime.end.p0(i64 144, ptr %2) #3
  ret void
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl11specializedImEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #3 comdat align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::sycl::specialized", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds %"class.hipsycl::sycl::specialized", ptr %1, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized", ptr %5, i32 0, i32 0
  %7 = load i64, ptr %6, align 8, !tbaa !55
  store i64 %7, ptr %4, align 8, !tbaa !56
  ret void
}

; Function Attrs: nounwind
define linkonce_odr dso_local void @_ZN7hipsycl4sycl11specializedINS0_5rangeILi3EEEEC2ERKS4_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #3 comdat align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::sycl::specialized.227", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized.228", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds %"class.hipsycl::sycl::specialized.227", ptr %1, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.hipsycl::sycl::detail::__acpp_sscp_emit_param_type_annotation_specialized.228", ptr %5, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %6, i64 24, i1 false), !tbaa.struct !25
  ret void
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @"_ZZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENUlNS1_7nd_itemILi3EEEE_C2ERKS6_"(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(136) %1) unnamed_addr #5 align 2 {
  %3 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %class.anon.449, ptr %1, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %4, i64 40, i1 false)
  %5 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 5
  %6 = getelementptr inbounds %class.anon.449, ptr %1, i32 0, i32 5
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %5, ptr noundef nonnull align 8 dereferenceable(32) %6)
  %7 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 6
  %8 = getelementptr inbounds %class.anon.449, ptr %1, i32 0, i32 6
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %7, ptr noundef nonnull align 8 dereferenceable(32) %8)
  %9 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 7
  %10 = getelementptr inbounds %class.anon.449, ptr %1, i32 0, i32 7
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %9, ptr noundef nonnull align 8 dereferenceable(32) %10)
  ret void
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(136) %1) unnamed_addr #5 align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %1, i32 0, i32 0
  call fastcc void @"_ZZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENUlNS1_7nd_itemILi3EEEE_C2ERKS6_"(ptr noundef nonnull align 8 dereferenceable(136) %3, ptr noundef nonnull align 8 dereferenceable(136) %4) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define internal fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 align 2 {
  %2 = alloca %"struct.hipsycl::sycl::id", align 8
  %3 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  %4 = alloca %"struct.hipsycl::sycl::id", align 8
  %5 = alloca %"struct.hipsycl::sycl::id", align 8
  %6 = alloca %"class.hipsycl::sycl::range", align 8
  %7 = alloca %"class.hipsycl::sycl::range", align 8
  %8 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr %2) #3
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 24, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl2idILi3EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #3
  call void @llvm.lifetime.start.p0(i64 144, ptr %3) #3
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 144, i1 false), !annotation !17
  call void @_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %4) #3
  call void @_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %5) #3
  call void @_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %6) #3
  call void @_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %7) #3
  call void @_ZN7hipsycl4sycl7nd_itemILi3EEC2EPKNS0_2idILi3EEES4_S4_NS0_5rangeILi3EEES8_PSt8functionIFvvEEPv(ptr noundef nonnull align 8 dereferenceable(144) %3, ptr noundef %2, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %4, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %5, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %6, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %7, ptr noundef null, ptr noundef null) #3
  %9 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %0, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %3, i64 144, i1 false), !tbaa.struct !18
  call fastcc void @"_ZZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENKUlNS1_7nd_itemILi3EEEE_clES5_"(ptr noundef nonnull align 8 dereferenceable(136) %9, ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %8) #3
  call void @llvm.lifetime.end.p0(i64 144, ptr %3) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr %2) #3
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define internal fastcc void @"_ZZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENKUlNS1_7nd_itemILi3EEEE_clES5_"(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %1) unnamed_addr #6 align 2 {
  %3 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  %4 = alloca %"class.hipsycl::sycl::local_accessor", align 8
  %5 = alloca %"class.hipsycl::sycl::local_accessor", align 8
  %6 = alloca %"class.hipsycl::sycl::local_accessor", align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %1, i64 144, i1 false), !tbaa.struct !18
  %7 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8, !tbaa !57
  %9 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8, !tbaa !59
  %11 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8, !tbaa !60
  %13 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8, !tbaa !61
  %15 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 4
  %16 = load i64, ptr %15, align 8, !tbaa !62
  %17 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 5
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %4, ptr noundef nonnull align 8 dereferenceable(32) %17)
  %18 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 6
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %5, ptr noundef nonnull align 8 dereferenceable(32) %18)
  %19 = getelementptr inbounds %class.anon.449, ptr %0, i32 0, i32 7
  call void @_ZN7hipsycl4sycl14local_accessorIfLi3EEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(32) %6, ptr noundef nonnull align 8 dereferenceable(32) %19)
  call void @_Z14padding_layoutN7hipsycl4sycl7nd_itemILi3EEEPfS3_S3_S3_lNS0_14local_accessorIfLi3EEES5_S5_(ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %3, ptr noundef %8, ptr noundef %10, ptr noundef %12, ptr noundef %14, i64 noundef %16, ptr noundef %4, ptr noundef %5, ptr noundef %6) #3
  ret void
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(160) %0, ptr noundef nonnull align 8 dereferenceable(160) %1) unnamed_addr #5 align 2 {
  %3 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %1, i32 0, i32 0
  call fastcc void @"_ZZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENUlNS1_7nd_itemILi3EEEE_C2ERKS6_"(ptr noundef nonnull align 8 dereferenceable(136) %3, ptr noundef nonnull align 8 dereferenceable(136) %4) #3
  %5 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %0, i32 0, i32 1
  %6 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %6, i64 24, i1 false), !tbaa.struct !25
  ret void
}

; Function Attrs: mustprogress nounwind
define internal fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(160) %0) unnamed_addr #4 align 2 {
  %2 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  %3 = alloca %"struct.hipsycl::sycl::id", align 8
  %4 = alloca %"struct.hipsycl::sycl::id", align 8
  %5 = alloca %"class.hipsycl::sycl::range", align 8
  %6 = alloca %"class.hipsycl::sycl::range", align 8
  %7 = alloca %"struct.hipsycl::sycl::nd_item", align 8
  call void @llvm.lifetime.start.p0(i64 144, ptr %2) #3
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 144, i1 false), !annotation !17
  %8 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %0, i32 0, i32 1
  call void @_ZN7hipsycl4sycl6detail12get_group_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %3) #3
  call void @_ZN7hipsycl4sycl6detail12get_local_idILi3EEENS0_2idIXT_EEEv(ptr sret(%"struct.hipsycl::sycl::id") align 8 %4) #3
  call void @_ZN7hipsycl4sycl6detail14get_local_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %5) #3
  call void @_ZN7hipsycl4sycl6detail13get_grid_sizeILi3EEENS0_5rangeIXT_EEEv(ptr sret(%"class.hipsycl::sycl::range") align 8 %6) #3
  call void @_ZN7hipsycl4sycl7nd_itemILi3EEC2EPKNS0_2idILi3EEES4_S4_NS0_5rangeILi3EEES8_PSt8functionIFvvEEPv(ptr noundef nonnull align 8 dereferenceable(144) %2, ptr noundef %8, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %3, ptr noundef byval(%"struct.hipsycl::sycl::id") align 8 %4, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %5, ptr noundef byval(%"class.hipsycl::sycl::range") align 8 %6, ptr noundef null, ptr noundef null) #3
  %9 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %0, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %2, i64 144, i1 false), !tbaa.struct !18
  call fastcc void @"_ZZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEENKUlNS1_7nd_itemILi3EEEE_clES5_"(ptr noundef nonnull align 8 dereferenceable(136) %9, ptr noundef byval(%"struct.hipsycl::sycl::nd_item") align 8 %7) #3
  call void @llvm.lifetime.end.p0(i64 144, ptr %2) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr %0, ptr %1, ptr %2, ptr %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16) #4 {
  %18 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", align 8
  %19 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", align 8
  %20 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", align 8
  %21 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 0
  store ptr %0, ptr %21, align 8
  %22 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 1
  store ptr %1, ptr %22, align 8
  %23 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 2
  store ptr %2, ptr %23, align 8
  %24 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 3
  store ptr %3, ptr %24, align 8
  %25 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 4
  store i64 %4, ptr %25, align 8
  %26 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  store i64 %5, ptr %26, align 8
  %27 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %6, ptr %27, align 8
  %28 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %7, ptr %28, align 8
  %29 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %8, ptr %29, align 8
  %30 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  store i64 %9, ptr %30, align 8
  %31 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %10, ptr %31, align 8
  %32 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %11, ptr %32, align 8
  %33 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %12, ptr %33, align 8
  %34 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 7, i32 0, i32 0, i32 0
  store i64 %13, ptr %34, align 8
  %35 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %14, ptr %35, align 8
  %36 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %15, ptr %36, align 8
  %37 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for", ptr %20, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %16, ptr %37, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %19, ptr align 1 %20, i64 136, i1 false)
  call void @llvm.lifetime.start.p0(i64 136, ptr %18) #3
  call void @llvm.memset.p0.i64(ptr align 8 %18, i8 0, i64 136, i1 false), !annotation !17
  call fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(136) %18, ptr noundef nonnull align 8 dereferenceable(136) %19)
  call fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(136) %18) #3
  call void @llvm.lifetime.end.p0(i64 136, ptr %18) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr %0, ptr %1, ptr %2, ptr %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %19) #4 {
  %21 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", align 8
  %22 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", align 8
  %23 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", align 8
  %24 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 0
  store ptr %0, ptr %24, align 8
  %25 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 1
  store ptr %1, ptr %25, align 8
  %26 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 2
  store ptr %2, ptr %26, align 8
  %27 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 3
  store ptr %3, ptr %27, align 8
  %28 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 4
  store i64 %4, ptr %28, align 8
  %29 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  store i64 %5, ptr %29, align 8
  %30 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %6, ptr %30, align 8
  %31 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %7, ptr %31, align 8
  %32 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %8, ptr %32, align 8
  %33 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  store i64 %9, ptr %33, align 8
  %34 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %10, ptr %34, align 8
  %35 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %11, ptr %35, align 8
  %36 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %12, ptr %36, align 8
  %37 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 7, i32 0, i32 0, i32 0
  store i64 %13, ptr %37, align 8
  %38 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %14, ptr %38, align 8
  %39 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %15, ptr %39, align 8
  %40 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %16, ptr %40, align 8
  %41 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 1, i32 0, i32 0
  store i64 %17, ptr %41, align 8
  %42 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 1, i32 0, i32 1
  store i64 %18, ptr %42, align 8
  %43 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset", ptr %23, i32 0, i32 1, i32 0, i32 2
  store i64 %19, ptr %43, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %22, ptr align 1 %23, i64 160, i1 false)
  call void @llvm.lifetime.start.p0(i64 160, ptr %21) #3
  call void @llvm.memset.p0.i64(ptr align 8 %21, i8 0, i64 160, i1 false), !annotation !17
  call fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(160) %21, ptr noundef nonnull align 8 dereferenceable(160) %22)
  call fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ21launch_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(160) %21) #3
  call void @llvm.lifetime.end.p0(i64 160, ptr %21) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ22profile_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr %0, ptr %1, ptr %2, ptr %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16) #4 {
  %18 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", align 8
  %19 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", align 8
  %20 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", align 8
  %21 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 0
  store ptr %0, ptr %21, align 8
  %22 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 1
  store ptr %1, ptr %22, align 8
  %23 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 2
  store ptr %2, ptr %23, align 8
  %24 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 3
  store ptr %3, ptr %24, align 8
  %25 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 4
  store i64 %4, ptr %25, align 8
  %26 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  store i64 %5, ptr %26, align 8
  %27 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %6, ptr %27, align 8
  %28 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %7, ptr %28, align 8
  %29 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %8, ptr %29, align 8
  %30 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  store i64 %9, ptr %30, align 8
  %31 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %10, ptr %31, align 8
  %32 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %11, ptr %32, align 8
  %33 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %12, ptr %33, align 8
  %34 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 7, i32 0, i32 0, i32 0
  store i64 %13, ptr %34, align 8
  %35 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %14, ptr %35, align 8
  %36 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %15, ptr %36, align 8
  %37 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for.457", ptr %20, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %16, ptr %37, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %19, ptr align 1 %20, i64 136, i1 false)
  call void @llvm.lifetime.start.p0(i64 136, ptr %18) #3
  call void @llvm.memset.p0.i64(ptr align 8 %18, i8 0, i64 136, i1 false), !annotation !17
  call fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(136) %18, ptr noundef nonnull align 8 dereferenceable(136) %19)
  call fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(136) %18) #3
  call void @llvm.lifetime.end.p0(i64 136, ptr %18) #3
  ret void
}

; Function Attrs: mustprogress nounwind
define void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ22profile_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr %0, ptr %1, ptr %2, ptr %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %19) #4 {
  %21 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", align 8
  %22 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", align 8
  %23 = alloca %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", align 8
  %24 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 0
  store ptr %0, ptr %24, align 8
  %25 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 1
  store ptr %1, ptr %25, align 8
  %26 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 2
  store ptr %2, ptr %26, align 8
  %27 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 3
  store ptr %3, ptr %27, align 8
  %28 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 4
  store i64 %4, ptr %28, align 8
  %29 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  store i64 %5, ptr %29, align 8
  %30 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %6, ptr %30, align 8
  %31 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %7, ptr %31, align 8
  %32 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 5, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %8, ptr %32, align 8
  %33 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  store i64 %9, ptr %33, align 8
  %34 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %10, ptr %34, align 8
  %35 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %11, ptr %35, align 8
  %36 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %12, ptr %36, align 8
  %37 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 7, i32 0, i32 0, i32 0
  store i64 %13, ptr %37, align 8
  %38 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 0
  store i64 %14, ptr %38, align 8
  %39 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 1
  store i64 %15, ptr %39, align 8
  %40 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 0, i32 7, i32 1, i32 0, i32 0, i32 0, i32 2
  store i64 %16, ptr %40, align 8
  %41 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 1, i32 0, i32 0
  store i64 %17, ptr %41, align 8
  %42 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 1, i32 0, i32 1
  store i64 %18, ptr %42, align 8
  %43 = getelementptr inbounds %"class.hipsycl::glue::__sscp_dispatch::ndrange_parallel_for_offset.458", ptr %23, i32 0, i32 1, i32 0, i32 2
  store i64 %19, ptr %43, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %22, ptr align 1 %23, i64 160, i1 false)
  call void @llvm.lifetime.start.p0(i64 160, ptr %21) #3
  call void @llvm.memset.p0.i64(ptr align 8 %21, i8 0, i64 160, i1 false), !annotation !17
  call fastcc void @"_ZN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEC2ERKSA_"(ptr noundef nonnull align 8 dereferenceable(160) %21, ptr noundef nonnull align 8 dereferenceable(160) %22)
  call fastcc void @"_ZNK7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ22profile_padding_layoutENK3$_0clERNS_4sycl7handlerEEUlNS4_7nd_itemILi3EEEE_Li3EEclEv"(ptr noundef nonnull align 8 dereferenceable(160) %21) #3
  call void @llvm.lifetime.end.p0(i64 160, ptr %21) #3
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind }
attributes #4 = { mustprogress nounwind }
attributes #5 = { inlinehint nounwind }
attributes #6 = { inlinehint mustprogress nounwind }
attributes #7 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!hipsycl.sscp.annotations = !{!3, !4, !5, !6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 17.0.0 (http://10.4.0.1/dcutoolkit/driverruntime/llvm-project.git ff5bf917a679c83afe927af051a20b86fef7b07d)"}
!3 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"hipsycl_kernel_dimension", i32 3}
!4 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ21launch_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"hipsycl_kernel_dimension", i32 3}
!5 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ22profile_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"hipsycl_kernel_dimension", i32 3}
!6 = !{ptr @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch27ndrange_parallel_for_offsetIZZ22profile_padding_layoutENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_", !"hipsycl_kernel_dimension", i32 3}
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTSN7hipsycl4sycl6detail12device_arrayImLm3EEE", !9, i64 0, !9, i64 8, !9, i64 16}
!9 = !{!"long", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!8, !9, i64 8}
!13 = !{!8, !9, i64 16}
!14 = !{!9, !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"auto-init"}
!18 = !{i64 0, i64 8, !19, i64 8, i64 8, !14, i64 16, i64 8, !14, i64 24, i64 8, !14, i64 32, i64 8, !14, i64 40, i64 8, !14, i64 48, i64 8, !14, i64 56, i64 8, !14, i64 64, i64 8, !14, i64 72, i64 8, !14, i64 80, i64 8, !14, i64 88, i64 8, !14, i64 96, i64 8, !14, i64 104, i64 8, !14, i64 112, i64 8, !14, i64 120, i64 8, !14, i64 128, i64 8, !19, i64 136, i64 8, !19}
!19 = !{!20, !20, i64 0}
!20 = !{!"any pointer", !10, i64 0}
!21 = !{!22, !20, i64 0}
!22 = !{!"_ZTSN7hipsycl4sycl7nd_itemILi3EEE", !20, i64 0, !23, i64 8, !23, i64 32, !24, i64 56, !24, i64 80, !23, i64 104, !20, i64 128, !20, i64 136}
!23 = !{!"_ZTSN7hipsycl4sycl2idILi3EEE", !8, i64 0}
!24 = !{!"_ZTSN7hipsycl4sycl5rangeILi3EEE", !8, i64 0}
!25 = !{i64 0, i64 8, !14, i64 8, i64 8, !14, i64 16, i64 8, !14}
!26 = !{!22, !20, i64 128}
!27 = !{!28, !20, i64 0}
!28 = !{!"_ZTSZZ21launch_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEEUlNS1_7nd_itemILi3EEEE_", !20, i64 0, !20, i64 8, !20, i64 16, !20, i64 24, !9, i64 32, !29, i64 40, !29, i64 72, !29, i64 104}
!29 = !{!"_ZTSN7hipsycl4sycl14local_accessorIfLi3EEE", !30, i64 0, !32, i64 8}
!30 = !{!"_ZTSN7hipsycl4sycl11specializedImEE", !31, i64 0}
!31 = !{!"_ZTSN7hipsycl4sycl6detail50__acpp_sscp_emit_param_type_annotation_specializedImEE", !9, i64 0}
!32 = !{!"_ZTSN7hipsycl4sycl11specializedINS0_5rangeILi3EEEEE", !33, i64 0}
!33 = !{!"_ZTSN7hipsycl4sycl6detail50__acpp_sscp_emit_param_type_annotation_specializedINS0_5rangeILi3EEEEE", !24, i64 0}
!34 = !{!28, !20, i64 8}
!35 = !{!28, !20, i64 16}
!36 = !{!28, !20, i64 24}
!37 = !{!28, !9, i64 32}
!38 = distinct !{!38, !16}
!39 = distinct !{!39, !16}
!40 = distinct !{!40, !16}
!41 = !{!42, !42, i64 0}
!42 = !{!"float", !10, i64 0}
!43 = distinct !{!43, !16}
!44 = distinct !{!44, !16}
!45 = distinct !{!45, !16}
!46 = distinct !{!46, !16}
!47 = distinct !{!47, !16}
!48 = distinct !{!48, !16}
!49 = distinct !{!49, !16}
!50 = distinct !{!50, !16}
!51 = !{!52, !20, i64 0}
!52 = !{!"_ZTSN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi1EEE", !20, i64 0, !23, i64 8}
!53 = !{!54, !20, i64 0}
!54 = !{!"_ZTSN7hipsycl4sycl6detail8accessor21local_subscript_proxyIfLi3ELi2EEE", !20, i64 0, !23, i64 8}
!55 = !{!30, !9, i64 0}
!56 = !{!31, !9, i64 0}
!57 = !{!58, !20, i64 0}
!58 = !{!"_ZTSZZ22profile_padding_layoutENK3$_0clERN7hipsycl4sycl7handlerEEUlNS1_7nd_itemILi3EEEE_", !20, i64 0, !20, i64 8, !20, i64 16, !20, i64 24, !9, i64 32, !29, i64 40, !29, i64 72, !29, i64 104}
!59 = !{!58, !20, i64 8}
!60 = !{!58, !20, i64 16}
!61 = !{!58, !20, i64 24}
!62 = !{!58, !9, i64 32}
;----------------- End AdaptiveCpp IR dump ---------------
