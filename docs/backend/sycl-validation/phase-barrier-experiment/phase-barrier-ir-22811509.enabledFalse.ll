;---------------- Begin AdaptiveCpp IR dump --------------
; AdaptiveCpp SSCP S2 IR dump; Compiling kernels: <Kernel:_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ13launch_memoryENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_>, stage: final
source_filename = "/tmp/sycl-phase-barrier-ir-22811509/tmp/triton-sycl-cache/compile-3ce9n0ws/kernel.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #0

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

declare hidden i64 @__ockl_get_local_id(i32 noundef) local_unnamed_addr #2

declare hidden i64 @__ockl_get_group_id(i32 noundef) local_unnamed_addr #2

declare hidden i64 @__ockl_get_num_groups(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.groupstaticsize() #3

; Function Attrs: nounwind
define amdgpu_kernel void @"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ13launch_memoryENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_"(ptr addrspace(1) %0, ptr addrspace(1) %1, i32 %2, i32 %3) #4 {
  %5 = addrspacecast ptr addrspace(1) %0 to ptr
  %6 = addrspacecast ptr addrspace(1) %1 to ptr
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 32) ]
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 32) ]
  %7 = call i64 @__ockl_get_group_id(i32 noundef 2) #5, !noalias !10
  %8 = icmp ult i64 %7, 33554431
  call void @llvm.assume(i1 %8), !noalias !10
  %9 = call i64 @__ockl_get_group_id(i32 noundef 1) #5, !noalias !10
  %10 = icmp ult i64 %9, 2147483647
  call void @llvm.assume(i1 %10), !noalias !10
  %11 = call i64 @__ockl_get_group_id(i32 noundef 0) #5, !noalias !10
  %12 = icmp ult i64 %11, 2147483647
  call void @llvm.assume(i1 %12), !noalias !10
  %13 = call i64 @__ockl_get_local_id(i32 noundef 2) #5, !noalias !13
  %14 = icmp ult i64 %13, 64
  call void @llvm.assume(i1 %14), !noalias !13
  %15 = call i64 @__ockl_get_local_id(i32 noundef 1) #5, !noalias !13
  %16 = icmp eq i64 %15, 0
  call void @llvm.assume(i1 %16), !noalias !13
  %17 = call i64 @__ockl_get_local_id(i32 noundef 0) #5, !noalias !13
  %18 = icmp eq i64 %17, 0
  call void @llvm.assume(i1 %18), !noalias !13
  %19 = call i64 @__ockl_get_num_groups(i32 noundef 2) #5, !noalias !16
  %20 = icmp ult i64 %19, 33554432
  call void @llvm.assume(i1 %20), !noalias !16
  %21 = call i64 @__ockl_get_num_groups(i32 noundef 1) #5, !noalias !16
  %22 = icmp ult i64 %21, 2147483648
  call void @llvm.assume(i1 %22), !noalias !16
  %23 = call i64 @__ockl_get_num_groups(i32 noundef 0) #5, !noalias !16
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24), !noalias !16
  %25 = call i64 @__ockl_get_group_id(i32 noundef 2) #5
  %26 = icmp ult i64 %25, 33554431
  call void @llvm.assume(i1 %26)
  %.tr.i = trunc i64 %25 to i32
  %27 = shl nuw nsw i32 %.tr.i, 4
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %29 = icmp ult i64 %28, 64
  call void @llvm.assume(i1 %29)
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %31, label %.loopexit.i

31:                                               ; preds = %4
  %32 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %33 = icmp eq i64 %32, 0
  call void @llvm.assume(i1 %33)
  %34 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %35 = icmp eq i64 %34, 0
  call void @llvm.assume(i1 %35)
  %36 = call noundef i32 @llvm.amdgcn.groupstaticsize()
  %37 = inttoptr i32 %36 to ptr addrspace(3)
  %38 = icmp slt i32 %27, %2
  br i1 %38, label %39, label %44

39:                                               ; preds = %31
  %40 = mul i32 %27, %3
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, ptr %5, i64 %41
  %43 = load float, ptr %42, align 32, !tbaa !19
  br label %44

44:                                               ; preds = %39, %31
  %45 = phi float [ %43, %39 ], [ -7.000000e+00, %31 ]
  store float %45, ptr addrspace(3) %37, align 4, !tbaa !19
  %46 = add nuw nsw i32 %27, 1
  %47 = icmp slt i32 %46, %2
  br i1 %47, label %48, label %53

48:                                               ; preds = %44
  %49 = mul i32 %46, %3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, ptr %5, i64 %50
  %52 = load float, ptr %51, align 4, !tbaa !19
  br label %53

53:                                               ; preds = %48, %44
  %54 = phi float [ %52, %48 ], [ -7.000000e+00, %44 ]
  %55 = getelementptr inbounds float, ptr addrspace(3) %37, i32 1
  store float %54, ptr addrspace(3) %55, align 4, !tbaa !19
  %56 = add nuw nsw i32 %27, 2
  %57 = icmp slt i32 %56, %2
  br i1 %57, label %58, label %63

58:                                               ; preds = %53
  %59 = mul i32 %56, %3
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, ptr %5, i64 %60
  %62 = load float, ptr %61, align 8, !tbaa !19
  br label %63

63:                                               ; preds = %58, %53
  %64 = phi float [ %62, %58 ], [ -7.000000e+00, %53 ]
  %65 = getelementptr inbounds float, ptr addrspace(3) %37, i32 2
  store float %64, ptr addrspace(3) %65, align 4, !tbaa !19
  %66 = add nuw nsw i32 %27, 3
  %67 = icmp slt i32 %66, %2
  br i1 %67, label %68, label %73

68:                                               ; preds = %63
  %69 = mul i32 %66, %3
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, ptr %5, i64 %70
  %72 = load float, ptr %71, align 4, !tbaa !19
  br label %73

73:                                               ; preds = %68, %63
  %74 = phi float [ %72, %68 ], [ -7.000000e+00, %63 ]
  %75 = getelementptr inbounds float, ptr addrspace(3) %37, i32 3
  store float %74, ptr addrspace(3) %75, align 4, !tbaa !19
  %76 = add nuw nsw i32 %27, 4
  %77 = icmp slt i32 %76, %2
  br i1 %77, label %78, label %83

78:                                               ; preds = %73
  %79 = mul i32 %76, %3
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, ptr %5, i64 %80
  %82 = load float, ptr %81, align 16, !tbaa !19
  br label %83

83:                                               ; preds = %78, %73
  %84 = phi float [ %82, %78 ], [ -7.000000e+00, %73 ]
  %85 = getelementptr inbounds float, ptr addrspace(3) %37, i32 4
  store float %84, ptr addrspace(3) %85, align 4, !tbaa !19
  %86 = add nuw nsw i32 %27, 5
  %87 = icmp slt i32 %86, %2
  br i1 %87, label %88, label %93

88:                                               ; preds = %83
  %89 = mul i32 %86, %3
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, ptr %5, i64 %90
  %92 = load float, ptr %91, align 4, !tbaa !19
  br label %93

93:                                               ; preds = %88, %83
  %94 = phi float [ %92, %88 ], [ -7.000000e+00, %83 ]
  %95 = getelementptr inbounds float, ptr addrspace(3) %37, i32 5
  store float %94, ptr addrspace(3) %95, align 4, !tbaa !19
  %96 = add nuw nsw i32 %27, 6
  %97 = icmp slt i32 %96, %2
  br i1 %97, label %98, label %103

98:                                               ; preds = %93
  %99 = mul i32 %96, %3
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, ptr %5, i64 %100
  %102 = load float, ptr %101, align 8, !tbaa !19
  br label %103

103:                                              ; preds = %98, %93
  %104 = phi float [ %102, %98 ], [ -7.000000e+00, %93 ]
  %105 = getelementptr inbounds float, ptr addrspace(3) %37, i32 6
  store float %104, ptr addrspace(3) %105, align 4, !tbaa !19
  %106 = add nuw nsw i32 %27, 7
  %107 = icmp slt i32 %106, %2
  br i1 %107, label %108, label %113

108:                                              ; preds = %103
  %109 = mul i32 %106, %3
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, ptr %5, i64 %110
  %112 = load float, ptr %111, align 4, !tbaa !19
  br label %113

113:                                              ; preds = %108, %103
  %114 = phi float [ %112, %108 ], [ -7.000000e+00, %103 ]
  %115 = getelementptr inbounds float, ptr addrspace(3) %37, i32 7
  store float %114, ptr addrspace(3) %115, align 4, !tbaa !19
  %116 = add nuw nsw i32 %27, 8
  %117 = icmp slt i32 %116, %2
  br i1 %117, label %118, label %123

118:                                              ; preds = %113
  %119 = mul i32 %116, %3
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, ptr %5, i64 %120
  %122 = load float, ptr %121, align 32, !tbaa !19
  br label %123

123:                                              ; preds = %118, %113
  %124 = phi float [ %122, %118 ], [ -7.000000e+00, %113 ]
  %125 = getelementptr inbounds float, ptr addrspace(3) %37, i32 8
  store float %124, ptr addrspace(3) %125, align 4, !tbaa !19
  %126 = add nuw nsw i32 %27, 9
  %127 = icmp slt i32 %126, %2
  br i1 %127, label %128, label %133

128:                                              ; preds = %123
  %129 = mul i32 %126, %3
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, ptr %5, i64 %130
  %132 = load float, ptr %131, align 4, !tbaa !19
  br label %133

133:                                              ; preds = %128, %123
  %134 = phi float [ %132, %128 ], [ -7.000000e+00, %123 ]
  %135 = getelementptr inbounds float, ptr addrspace(3) %37, i32 9
  store float %134, ptr addrspace(3) %135, align 4, !tbaa !19
  %136 = add nuw nsw i32 %27, 10
  %137 = icmp slt i32 %136, %2
  br i1 %137, label %138, label %143

138:                                              ; preds = %133
  %139 = mul i32 %136, %3
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, ptr %5, i64 %140
  %142 = load float, ptr %141, align 8, !tbaa !19
  br label %143

143:                                              ; preds = %138, %133
  %144 = phi float [ %142, %138 ], [ -7.000000e+00, %133 ]
  %145 = getelementptr inbounds float, ptr addrspace(3) %37, i32 10
  store float %144, ptr addrspace(3) %145, align 4, !tbaa !19
  %146 = add nuw nsw i32 %27, 11
  %147 = icmp slt i32 %146, %2
  br i1 %147, label %148, label %153

148:                                              ; preds = %143
  %149 = mul i32 %146, %3
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, ptr %5, i64 %150
  %152 = load float, ptr %151, align 4, !tbaa !19
  br label %153

153:                                              ; preds = %148, %143
  %154 = phi float [ %152, %148 ], [ -7.000000e+00, %143 ]
  %155 = getelementptr inbounds float, ptr addrspace(3) %37, i32 11
  store float %154, ptr addrspace(3) %155, align 4, !tbaa !19
  %156 = add nuw nsw i32 %27, 12
  %157 = icmp slt i32 %156, %2
  br i1 %157, label %158, label %163

158:                                              ; preds = %153
  %159 = mul i32 %156, %3
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, ptr %5, i64 %160
  %162 = load float, ptr %161, align 16, !tbaa !19
  br label %163

163:                                              ; preds = %158, %153
  %164 = phi float [ %162, %158 ], [ -7.000000e+00, %153 ]
  %165 = getelementptr inbounds float, ptr addrspace(3) %37, i32 12
  store float %164, ptr addrspace(3) %165, align 4, !tbaa !19
  %166 = add nuw nsw i32 %27, 13
  %167 = icmp slt i32 %166, %2
  br i1 %167, label %168, label %173

168:                                              ; preds = %163
  %169 = mul i32 %166, %3
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, ptr %5, i64 %170
  %172 = load float, ptr %171, align 4, !tbaa !19
  br label %173

173:                                              ; preds = %168, %163
  %174 = phi float [ %172, %168 ], [ -7.000000e+00, %163 ]
  %175 = getelementptr inbounds float, ptr addrspace(3) %37, i32 13
  store float %174, ptr addrspace(3) %175, align 4, !tbaa !19
  %176 = add nuw nsw i32 %27, 14
  %177 = icmp slt i32 %176, %2
  br i1 %177, label %178, label %183

178:                                              ; preds = %173
  %179 = mul i32 %176, %3
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, ptr %5, i64 %180
  %182 = load float, ptr %181, align 8, !tbaa !19
  br label %183

183:                                              ; preds = %178, %173
  %184 = phi float [ %182, %178 ], [ -7.000000e+00, %173 ]
  %185 = getelementptr inbounds float, ptr addrspace(3) %37, i32 14
  store float %184, ptr addrspace(3) %185, align 4, !tbaa !19
  %186 = add nuw nsw i32 %27, 15
  %187 = icmp slt i32 %186, %2
  br i1 %187, label %188, label %.loopexit.loopexit.i

188:                                              ; preds = %183
  %189 = mul i32 %186, %3
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, ptr %5, i64 %190
  %192 = load float, ptr %191, align 4, !tbaa !19
  br label %.loopexit.loopexit.i

.loopexit.loopexit.i:                             ; preds = %188, %183
  %193 = phi float [ %192, %188 ], [ -7.000000e+00, %183 ]
  %194 = getelementptr inbounds float, ptr addrspace(3) %37, i32 15
  store float %193, ptr addrspace(3) %194, align 4, !tbaa !19
  br label %.loopexit.i

.loopexit.i:                                      ; preds = %.loopexit.loopexit.i, %4
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %195 = call i64 @__ockl_get_local_id(i32 noundef 2) #5
  %196 = icmp ult i64 %195, 64
  call void @llvm.assume(i1 %196)
  %197 = icmp eq i64 %195, 0
  br i1 %197, label %198, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ13launch_memoryENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

198:                                              ; preds = %.loopexit.i
  %199 = call i64 @__ockl_get_local_id(i32 noundef 1) #5
  %200 = icmp eq i64 %199, 0
  call void @llvm.assume(i1 %200)
  %201 = call i64 @__ockl_get_local_id(i32 noundef 0) #5
  %202 = icmp eq i64 %201, 0
  call void @llvm.assume(i1 %202)
  %203 = call i32 @llvm.amdgcn.groupstaticsize()
  %204 = inttoptr i32 %203 to ptr addrspace(3)
  %205 = icmp slt i32 %27, %2
  br i1 %205, label %206, label %210

206:                                              ; preds = %198
  %207 = load float, ptr addrspace(3) %204, align 4, !tbaa !19
  %208 = zext i32 %27 to i64
  %209 = getelementptr inbounds float, ptr %6, i64 %208
  store float %207, ptr %209, align 32, !tbaa !19
  br label %210

210:                                              ; preds = %206, %198
  %211 = add nuw nsw i32 %27, 1
  %212 = icmp slt i32 %211, %2
  br i1 %212, label %213, label %218

213:                                              ; preds = %210
  %214 = getelementptr inbounds float, ptr addrspace(3) %204, i32 1
  %215 = load float, ptr addrspace(3) %214, align 4, !tbaa !19
  %216 = zext i32 %211 to i64
  %217 = getelementptr inbounds float, ptr %6, i64 %216
  store float %215, ptr %217, align 4, !tbaa !19
  br label %218

218:                                              ; preds = %213, %210
  %219 = add nuw nsw i32 %27, 2
  %220 = icmp slt i32 %219, %2
  br i1 %220, label %221, label %226

221:                                              ; preds = %218
  %222 = getelementptr inbounds float, ptr addrspace(3) %204, i32 2
  %223 = load float, ptr addrspace(3) %222, align 4, !tbaa !19
  %224 = zext i32 %219 to i64
  %225 = getelementptr inbounds float, ptr %6, i64 %224
  store float %223, ptr %225, align 8, !tbaa !19
  br label %226

226:                                              ; preds = %221, %218
  %227 = add nuw nsw i32 %27, 3
  %228 = icmp slt i32 %227, %2
  br i1 %228, label %229, label %234

229:                                              ; preds = %226
  %230 = getelementptr inbounds float, ptr addrspace(3) %204, i32 3
  %231 = load float, ptr addrspace(3) %230, align 4, !tbaa !19
  %232 = zext i32 %227 to i64
  %233 = getelementptr inbounds float, ptr %6, i64 %232
  store float %231, ptr %233, align 4, !tbaa !19
  br label %234

234:                                              ; preds = %229, %226
  %235 = add nuw nsw i32 %27, 4
  %236 = icmp slt i32 %235, %2
  br i1 %236, label %237, label %242

237:                                              ; preds = %234
  %238 = getelementptr inbounds float, ptr addrspace(3) %204, i32 4
  %239 = load float, ptr addrspace(3) %238, align 4, !tbaa !19
  %240 = zext i32 %235 to i64
  %241 = getelementptr inbounds float, ptr %6, i64 %240
  store float %239, ptr %241, align 16, !tbaa !19
  br label %242

242:                                              ; preds = %237, %234
  %243 = add nuw nsw i32 %27, 5
  %244 = icmp slt i32 %243, %2
  br i1 %244, label %245, label %250

245:                                              ; preds = %242
  %246 = getelementptr inbounds float, ptr addrspace(3) %204, i32 5
  %247 = load float, ptr addrspace(3) %246, align 4, !tbaa !19
  %248 = zext i32 %243 to i64
  %249 = getelementptr inbounds float, ptr %6, i64 %248
  store float %247, ptr %249, align 4, !tbaa !19
  br label %250

250:                                              ; preds = %245, %242
  %251 = add nuw nsw i32 %27, 6
  %252 = icmp slt i32 %251, %2
  br i1 %252, label %253, label %258

253:                                              ; preds = %250
  %254 = getelementptr inbounds float, ptr addrspace(3) %204, i32 6
  %255 = load float, ptr addrspace(3) %254, align 4, !tbaa !19
  %256 = zext i32 %251 to i64
  %257 = getelementptr inbounds float, ptr %6, i64 %256
  store float %255, ptr %257, align 8, !tbaa !19
  br label %258

258:                                              ; preds = %253, %250
  %259 = add nuw nsw i32 %27, 7
  %260 = icmp slt i32 %259, %2
  br i1 %260, label %261, label %266

261:                                              ; preds = %258
  %262 = getelementptr inbounds float, ptr addrspace(3) %204, i32 7
  %263 = load float, ptr addrspace(3) %262, align 4, !tbaa !19
  %264 = zext i32 %259 to i64
  %265 = getelementptr inbounds float, ptr %6, i64 %264
  store float %263, ptr %265, align 4, !tbaa !19
  br label %266

266:                                              ; preds = %261, %258
  %267 = add nuw nsw i32 %27, 8
  %268 = icmp slt i32 %267, %2
  br i1 %268, label %269, label %274

269:                                              ; preds = %266
  %270 = getelementptr inbounds float, ptr addrspace(3) %204, i32 8
  %271 = load float, ptr addrspace(3) %270, align 4, !tbaa !19
  %272 = zext i32 %267 to i64
  %273 = getelementptr inbounds float, ptr %6, i64 %272
  store float %271, ptr %273, align 32, !tbaa !19
  br label %274

274:                                              ; preds = %269, %266
  %275 = add nuw nsw i32 %27, 9
  %276 = icmp slt i32 %275, %2
  br i1 %276, label %277, label %282

277:                                              ; preds = %274
  %278 = getelementptr inbounds float, ptr addrspace(3) %204, i32 9
  %279 = load float, ptr addrspace(3) %278, align 4, !tbaa !19
  %280 = zext i32 %275 to i64
  %281 = getelementptr inbounds float, ptr %6, i64 %280
  store float %279, ptr %281, align 4, !tbaa !19
  br label %282

282:                                              ; preds = %277, %274
  %283 = add nuw nsw i32 %27, 10
  %284 = icmp slt i32 %283, %2
  br i1 %284, label %285, label %290

285:                                              ; preds = %282
  %286 = getelementptr inbounds float, ptr addrspace(3) %204, i32 10
  %287 = load float, ptr addrspace(3) %286, align 4, !tbaa !19
  %288 = zext i32 %283 to i64
  %289 = getelementptr inbounds float, ptr %6, i64 %288
  store float %287, ptr %289, align 8, !tbaa !19
  br label %290

290:                                              ; preds = %285, %282
  %291 = add nuw nsw i32 %27, 11
  %292 = icmp slt i32 %291, %2
  br i1 %292, label %293, label %298

293:                                              ; preds = %290
  %294 = getelementptr inbounds float, ptr addrspace(3) %204, i32 11
  %295 = load float, ptr addrspace(3) %294, align 4, !tbaa !19
  %296 = zext i32 %291 to i64
  %297 = getelementptr inbounds float, ptr %6, i64 %296
  store float %295, ptr %297, align 4, !tbaa !19
  br label %298

298:                                              ; preds = %293, %290
  %299 = add nuw nsw i32 %27, 12
  %300 = icmp slt i32 %299, %2
  br i1 %300, label %301, label %306

301:                                              ; preds = %298
  %302 = getelementptr inbounds float, ptr addrspace(3) %204, i32 12
  %303 = load float, ptr addrspace(3) %302, align 4, !tbaa !19
  %304 = zext i32 %299 to i64
  %305 = getelementptr inbounds float, ptr %6, i64 %304
  store float %303, ptr %305, align 16, !tbaa !19
  br label %306

306:                                              ; preds = %301, %298
  %307 = add nuw nsw i32 %27, 13
  %308 = icmp slt i32 %307, %2
  br i1 %308, label %309, label %314

309:                                              ; preds = %306
  %310 = getelementptr inbounds float, ptr addrspace(3) %204, i32 13
  %311 = load float, ptr addrspace(3) %310, align 4, !tbaa !19
  %312 = zext i32 %307 to i64
  %313 = getelementptr inbounds float, ptr %6, i64 %312
  store float %311, ptr %313, align 4, !tbaa !19
  br label %314

314:                                              ; preds = %309, %306
  %315 = add nuw nsw i32 %27, 14
  %316 = icmp slt i32 %315, %2
  br i1 %316, label %317, label %322

317:                                              ; preds = %314
  %318 = getelementptr inbounds float, ptr addrspace(3) %204, i32 14
  %319 = load float, ptr addrspace(3) %318, align 4, !tbaa !19
  %320 = zext i32 %315 to i64
  %321 = getelementptr inbounds float, ptr %6, i64 %320
  store float %319, ptr %321, align 8, !tbaa !19
  br label %322

322:                                              ; preds = %317, %314
  %323 = add nuw nsw i32 %27, 15
  %324 = icmp slt i32 %323, %2
  br i1 %324, label %325, label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ13launch_memoryENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

325:                                              ; preds = %322
  %326 = getelementptr inbounds float, ptr addrspace(3) %204, i32 15
  %327 = load float, ptr addrspace(3) %326, align 4, !tbaa !19
  %328 = zext i32 %323 to i64
  %329 = getelementptr inbounds float, ptr %6, i64 %328
  store float %327, ptr %329, align 4, !tbaa !19
  br label %"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ13launch_memoryENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit"

"_Z18__acpp_sscp_kernelIN7hipsycl4glue15__sscp_dispatch20ndrange_parallel_forIZZ13launch_memoryENK3$_0clERNS0_4sycl7handlerEEUlNS5_7nd_itemILi3EEEE_Li3EEEEvRKT_.old.exit": ; preds = %.loopexit.i, %322, %325
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "amdgpu-flat-work-group-size"="64,64" }
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
!6 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}
!7 = !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
!8 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
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
;----------------- End AdaptiveCpp IR dump ---------------
