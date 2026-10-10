module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @matmul(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr, %arg8: !llvm.ptr, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg7, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg8, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg9, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg10, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg12, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg11, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg13, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg0, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg1, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg2, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg3, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg5, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg4, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg6, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.mlir.constant(4 : index) : i64
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %20 = llvm.mlir.constant(4 : index) : i64
    %21 = llvm.mlir.constant(4 : index) : i64
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.mlir.constant(16 : index) : i64
    %24 = llvm.mlir.zero : !llvm.ptr
    %25 = llvm.getelementptr %24[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.mlir.constant(64 : index) : i64
    %28 = llvm.add %26, %27 : i64
    %29 = llvm.call @malloc(%28) : (i64) -> !llvm.ptr
    %30 = llvm.ptrtoint %29 : !llvm.ptr to i64
    %31 = llvm.mlir.constant(1 : index) : i64
    %32 = llvm.sub %27, %31 : i64
    %33 = llvm.add %30, %32 : i64
    %34 = llvm.urem %33, %27 : i64
    %35 = llvm.sub %33, %34 : i64
    %36 = llvm.inttoptr %35 : i64 to !llvm.ptr
    %37 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %38 = llvm.insertvalue %29, %37[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %36, %38[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.mlir.constant(0 : index) : i64
    %41 = llvm.insertvalue %40, %39[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %42 = llvm.insertvalue %20, %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %21, %42[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.insertvalue %21, %43[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.insertvalue %22, %44[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%18 : i64)
  ^bb1(%46: i64):  // 2 preds: ^bb0, ^bb5
    %47 = llvm.icmp "slt" %46, %17 : i64
    llvm.cond_br %47, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%18 : i64)
  ^bb3(%48: i64):  // 2 preds: ^bb2, ^bb4
    %49 = llvm.icmp "slt" %48, %17 : i64
    llvm.cond_br %49, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %50 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.getelementptr %50[%51] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %53 = llvm.extractvalue %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.mul %46, %53 overflow<nsw, nuw> : i64
    %55 = llvm.extractvalue %15[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.mul %48, %55 overflow<nsw, nuw> : i64
    %57 = llvm.add %54, %56 overflow<nsw, nuw> : i64
    %58 = llvm.getelementptr inbounds|nuw %52[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %59 = llvm.load %58 : !llvm.ptr -> f32
    %60 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %61 = llvm.extractvalue %7[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.getelementptr %60[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %63 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.mul %46, %63 overflow<nsw, nuw> : i64
    %65 = llvm.extractvalue %7[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.mul %48, %65 overflow<nsw, nuw> : i64
    %67 = llvm.add %64, %66 overflow<nsw, nuw> : i64
    %68 = llvm.getelementptr inbounds|nuw %62[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %69 = llvm.load %68 : !llvm.ptr -> f32
    %70 = llvm.fadd %59, %69 : f32
    %71 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.mlir.constant(4 : index) : i64
    %73 = llvm.mul %46, %72 overflow<nsw, nuw> : i64
    %74 = llvm.add %73, %48 overflow<nsw, nuw> : i64
    %75 = llvm.getelementptr inbounds|nuw %71[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %70, %75 : f32, !llvm.ptr
    %76 = llvm.add %48, %16 : i64
    llvm.br ^bb3(%76 : i64)
  ^bb5:  // pred: ^bb3
    %77 = llvm.add %46, %16 : i64
    llvm.br ^bb1(%77 : i64)
  ^bb6:  // pred: ^bb1
    %78 = llvm.mlir.constant(4 : index) : i64
    %79 = llvm.mlir.constant(4 : index) : i64
    %80 = llvm.mlir.constant(1 : index) : i64
    %81 = llvm.mlir.constant(16 : index) : i64
    %82 = llvm.mlir.zero : !llvm.ptr
    %83 = llvm.getelementptr %82[%81] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %84 = llvm.ptrtoint %83 : !llvm.ptr to i64
    %85 = llvm.mlir.constant(64 : index) : i64
    %86 = llvm.add %84, %85 : i64
    %87 = llvm.call @malloc(%86) : (i64) -> !llvm.ptr
    %88 = llvm.ptrtoint %87 : !llvm.ptr to i64
    %89 = llvm.mlir.constant(1 : index) : i64
    %90 = llvm.sub %85, %89 : i64
    %91 = llvm.add %88, %90 : i64
    %92 = llvm.urem %91, %85 : i64
    %93 = llvm.sub %91, %92 : i64
    %94 = llvm.inttoptr %93 : i64 to !llvm.ptr
    %95 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %96 = llvm.insertvalue %87, %95[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.insertvalue %94, %96[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %98 = llvm.mlir.constant(0 : index) : i64
    %99 = llvm.insertvalue %98, %97[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %100 = llvm.insertvalue %78, %99[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.insertvalue %79, %100[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %102 = llvm.insertvalue %79, %101[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.insertvalue %80, %102[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb7(%18 : i64)
  ^bb7(%104: i64):  // 2 preds: ^bb6, ^bb11
    %105 = llvm.icmp "slt" %104, %17 : i64
    llvm.cond_br %105, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%18 : i64)
  ^bb9(%106: i64):  // 2 preds: ^bb8, ^bb10
    %107 = llvm.icmp "slt" %106, %17 : i64
    llvm.cond_br %107, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %108 = llvm.extractvalue %103[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.mlir.constant(4 : index) : i64
    %110 = llvm.mul %104, %109 overflow<nsw, nuw> : i64
    %111 = llvm.add %110, %106 overflow<nsw, nuw> : i64
    %112 = llvm.getelementptr inbounds|nuw %108[%111] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %19, %112 : f32, !llvm.ptr
    %113 = llvm.add %106, %16 : i64
    llvm.br ^bb9(%113 : i64)
  ^bb11:  // pred: ^bb9
    %114 = llvm.add %104, %16 : i64
    llvm.br ^bb7(%114 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%18 : i64)
  ^bb13(%115: i64):  // 2 preds: ^bb12, ^bb20
    %116 = llvm.icmp "slt" %115, %17 : i64
    llvm.cond_br %116, ^bb14, ^bb21
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%18 : i64)
  ^bb15(%117: i64):  // 2 preds: ^bb14, ^bb19
    %118 = llvm.icmp "slt" %117, %17 : i64
    llvm.cond_br %118, ^bb16, ^bb20
  ^bb16:  // pred: ^bb15
    llvm.br ^bb17(%18 : i64)
  ^bb17(%119: i64):  // 2 preds: ^bb16, ^bb18
    %120 = llvm.icmp "slt" %119, %17 : i64
    llvm.cond_br %120, ^bb18, ^bb19
  ^bb18:  // pred: ^bb17
    %121 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %122 = llvm.mlir.constant(4 : index) : i64
    %123 = llvm.mul %115, %122 overflow<nsw, nuw> : i64
    %124 = llvm.add %123, %119 overflow<nsw, nuw> : i64
    %125 = llvm.getelementptr inbounds|nuw %121[%124] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %126 = llvm.load %125 : !llvm.ptr -> f32
    %127 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %128 = llvm.extractvalue %7[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %129 = llvm.getelementptr %127[%128] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %130 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %131 = llvm.mul %119, %130 overflow<nsw, nuw> : i64
    %132 = llvm.extractvalue %7[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %133 = llvm.mul %117, %132 overflow<nsw, nuw> : i64
    %134 = llvm.add %131, %133 overflow<nsw, nuw> : i64
    %135 = llvm.getelementptr inbounds|nuw %129[%134] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %136 = llvm.load %135 : !llvm.ptr -> f32
    %137 = llvm.extractvalue %103[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.mlir.constant(4 : index) : i64
    %139 = llvm.mul %115, %138 overflow<nsw, nuw> : i64
    %140 = llvm.add %139, %117 overflow<nsw, nuw> : i64
    %141 = llvm.getelementptr inbounds|nuw %137[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %142 = llvm.load %141 : !llvm.ptr -> f32
    %143 = llvm.fmul %126, %136 : f32
    %144 = llvm.fadd %142, %143 : f32
    %145 = llvm.extractvalue %103[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %146 = llvm.mlir.constant(4 : index) : i64
    %147 = llvm.mul %115, %146 overflow<nsw, nuw> : i64
    %148 = llvm.add %147, %117 overflow<nsw, nuw> : i64
    %149 = llvm.getelementptr inbounds|nuw %145[%148] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %144, %149 : f32, !llvm.ptr
    %150 = llvm.add %119, %16 : i64
    llvm.br ^bb17(%150 : i64)
  ^bb19:  // pred: ^bb17
    %151 = llvm.add %117, %16 : i64
    llvm.br ^bb15(%151 : i64)
  ^bb20:  // pred: ^bb15
    %152 = llvm.add %115, %16 : i64
    llvm.br ^bb13(%152 : i64)
  ^bb21:  // pred: ^bb13
    llvm.return %103 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
  llvm.func @_mlir_ciface_matmul(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {llvm.emit_c_interface} {
    %0 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.extractvalue %0[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.extractvalue %0[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.extractvalue %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.extractvalue %8[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.extractvalue %8[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.extractvalue %8[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.extractvalue %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.extractvalue %8[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.extractvalue %8[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.call @matmul(%1, %2, %3, %4, %5, %6, %7, %9, %10, %11, %12, %13, %14, %15) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.store %16, %arg0 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
    llvm.return
  }
}

