; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @matmul(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) {
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %7, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, ptr %8, 1
  %17 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, i64 %9, 2
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, i64 %10, 3, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, i64 %12, 4, 0
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 %11, 3, 1
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 %13, 4, 1
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %0, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, ptr %1, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 %2, 2
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 %3, 3, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 %5, 4, 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %4, 3, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 %6, 4, 1
  %29 = call ptr @malloc(i64 128)
  %30 = ptrtoint ptr %29 to i64
  %31 = add i64 %30, 63
  %32 = urem i64 %31, 64
  %33 = sub i64 %31, %32
  %34 = inttoptr i64 %33 to ptr
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %29, 0
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, ptr %34, 1
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 0, 2
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 4, 3, 0
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 4, 3, 1
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 4, 4, 0
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, i64 1, 4, 1
  br label %42

42:                                               ; preds = %76, %14
  %43 = phi i64 [ %77, %76 ], [ 0, %14 ]
  %44 = icmp slt i64 %43, 4
  br i1 %44, label %45, label %78

45:                                               ; preds = %42
  br label %46

46:                                               ; preds = %49, %45
  %47 = phi i64 [ %75, %49 ], [ 0, %45 ]
  %48 = icmp slt i64 %47, 4
  br i1 %48, label %49, label %76

49:                                               ; preds = %46
  %50 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, 1
  %51 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, 2
  %52 = getelementptr float, ptr %50, i64 %51
  %53 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, 4, 0
  %54 = mul nuw nsw i64 %43, %53
  %55 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, 4, 1
  %56 = mul nuw nsw i64 %47, %55
  %57 = add nuw nsw i64 %54, %56
  %58 = getelementptr inbounds nuw float, ptr %52, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 1
  %61 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 2
  %62 = getelementptr float, ptr %60, i64 %61
  %63 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 4, 0
  %64 = mul nuw nsw i64 %43, %63
  %65 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 4, 1
  %66 = mul nuw nsw i64 %47, %65
  %67 = add nuw nsw i64 %64, %66
  %68 = getelementptr inbounds nuw float, ptr %62, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = fadd float %59, %69
  %71 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, 1
  %72 = mul nuw nsw i64 %43, 4
  %73 = add nuw nsw i64 %72, %47
  %74 = getelementptr inbounds nuw float, ptr %71, i64 %73
  store float %70, ptr %74, align 4
  %75 = add i64 %47, 1
  br label %46

76:                                               ; preds = %46
  %77 = add i64 %43, 1
  br label %42

78:                                               ; preds = %42
  %79 = call ptr @malloc(i64 128)
  %80 = ptrtoint ptr %79 to i64
  %81 = add i64 %80, 63
  %82 = urem i64 %81, 64
  %83 = sub i64 %81, %82
  %84 = inttoptr i64 %83 to ptr
  %85 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %79, 0
  %86 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %85, ptr %84, 1
  %87 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %86, i64 0, 2
  %88 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %87, i64 4, 3, 0
  %89 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %88, i64 4, 3, 1
  %90 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %89, i64 4, 4, 0
  %91 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %90, i64 1, 4, 1
  br label %92

92:                                               ; preds = %105, %78
  %93 = phi i64 [ %106, %105 ], [ 0, %78 ]
  %94 = icmp slt i64 %93, 4
  br i1 %94, label %95, label %107

95:                                               ; preds = %92
  br label %96

96:                                               ; preds = %99, %95
  %97 = phi i64 [ %104, %99 ], [ 0, %95 ]
  %98 = icmp slt i64 %97, 4
  br i1 %98, label %99, label %105

99:                                               ; preds = %96
  %100 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %91, 1
  %101 = mul nuw nsw i64 %93, 4
  %102 = add nuw nsw i64 %101, %97
  %103 = getelementptr inbounds nuw float, ptr %100, i64 %102
  store float 0.000000e+00, ptr %103, align 4
  %104 = add i64 %97, 1
  br label %96

105:                                              ; preds = %96
  %106 = add i64 %93, 1
  br label %92

107:                                              ; preds = %92
  br label %108

108:                                              ; preds = %149, %107
  %109 = phi i64 [ %150, %149 ], [ 0, %107 ]
  %110 = icmp slt i64 %109, 4
  br i1 %110, label %111, label %151

111:                                              ; preds = %108
  br label %112

112:                                              ; preds = %147, %111
  %113 = phi i64 [ %148, %147 ], [ 0, %111 ]
  %114 = icmp slt i64 %113, 4
  br i1 %114, label %115, label %149

115:                                              ; preds = %112
  br label %116

116:                                              ; preds = %119, %115
  %117 = phi i64 [ %146, %119 ], [ 0, %115 ]
  %118 = icmp slt i64 %117, 4
  br i1 %118, label %119, label %147

119:                                              ; preds = %116
  %120 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, 1
  %121 = mul nuw nsw i64 %109, 4
  %122 = add nuw nsw i64 %121, %117
  %123 = getelementptr inbounds nuw float, ptr %120, i64 %122
  %124 = load float, ptr %123, align 4
  %125 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 1
  %126 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 2
  %127 = getelementptr float, ptr %125, i64 %126
  %128 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 4, 0
  %129 = mul nuw nsw i64 %117, %128
  %130 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 4, 1
  %131 = mul nuw nsw i64 %113, %130
  %132 = add nuw nsw i64 %129, %131
  %133 = getelementptr inbounds nuw float, ptr %127, i64 %132
  %134 = load float, ptr %133, align 4
  %135 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %91, 1
  %136 = mul nuw nsw i64 %109, 4
  %137 = add nuw nsw i64 %136, %113
  %138 = getelementptr inbounds nuw float, ptr %135, i64 %137
  %139 = load float, ptr %138, align 4
  %140 = fmul float %124, %134
  %141 = fadd float %139, %140
  %142 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %91, 1
  %143 = mul nuw nsw i64 %109, 4
  %144 = add nuw nsw i64 %143, %113
  %145 = getelementptr inbounds nuw float, ptr %142, i64 %144
  store float %141, ptr %145, align 4
  %146 = add i64 %117, 1
  br label %116

147:                                              ; preds = %116
  %148 = add i64 %113, 1
  br label %112

149:                                              ; preds = %112
  %150 = add i64 %109, 1
  br label %108

151:                                              ; preds = %108
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %91
}

define void @_mlir_ciface_matmul(ptr %0, ptr %1, ptr %2) {
  %4 = load { ptr, ptr, i64, [2 x i64], [2 x i64] }, ptr %1, align 8
  %5 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 0
  %6 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 1
  %7 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 2
  %8 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 3, 0
  %9 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 3, 1
  %10 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 4, 0
  %11 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, 4, 1
  %12 = load { ptr, ptr, i64, [2 x i64], [2 x i64] }, ptr %2, align 8
  %13 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 0
  %14 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 1
  %15 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 2
  %16 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 3, 0
  %17 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 3, 1
  %18 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 4, 0
  %19 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, 4, 1
  %20 = call { ptr, ptr, i64, [2 x i64], [2 x i64] } @matmul(ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, ptr %13, ptr %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %19)
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, ptr %0, align 8
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
