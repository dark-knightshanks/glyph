module {

func.func @matmul(%a0 : tensor<4x4xf32> , %a1: tensor<4x4xf32>) -> tensor<4x4xf32> attributes {llvm.emit_c_interface} {
    %buf = tensor.empty() : tensor<4x4xf32>
    %c = linalg.add ins(%a0,%a1 : tensor<4x4xf32>, tensor<4x4xf32>) outs(%buf : tensor<4x4xf32>) -> tensor<4x4xf32>
    %b = arith.constant 0.0 : f32
    %f = tensor.empty() : tensor<4x4xf32>
    %e = linalg.fill ins(%b : f32) outs(%f : tensor<4x4xf32>) -> tensor<4x4xf32>
    %out = linalg.matmul ins(%c , %a1 : tensor<4x4xf32> , tensor<4x4xf32>) outs(%e : tensor<4x4xf32>) -> tensor<4x4xf32>
    return %out : tensor<4x4xf32>
    }
}
