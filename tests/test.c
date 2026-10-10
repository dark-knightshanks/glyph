#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>


typedef struct {
    float *allocated;
    float *alligned;
    int64_t offset;
    int64_t size[2];
    int64_t stride[2];
}MemRef2D;

void _mlir_ciface_matmul(MemRef2D *res, MemRef2D *a, MemRef2D *b);

int main(){
    float a_data[16];
    float b_data[16];

    for(int i = 0; i < 16; ++i){
        a_data[i] = 1.0f;
        b_data[i] = 2.0f;
    }
    MemRef2D a = {a_data, a_data, 0, {4,4}, {4,1}};
    MemRef2D b = {b_data, b_data, 0, {4,4}, {4,1}};
    MemRef2D res;

    _mlir_ciface_matmul(&res, &a, &b);

    printf("Result Matrix (4x4):\n");                                                                                                       
        for (int i = 0; i < 4; i++) {                                                                                                           
            for (int j = 0; j < 4; j++) {                                                                                                       
                printf("%6.1f ", res.alligned[i * 4 + j]);                                                                                       
            }                                                                                                                                   
            printf("\n");                                                                                                                       
        }  
    free(res.allocated);
    return 0;
}
