#Massimo Gorenca 27/03/2026
/*
int square(int x){
    return x*x;
}
int sumSquares(int a, int b){
    return square(a) + square(b);
}
int main(void){
    int r=sumSquares(2,3);

*/
square:

    addi sp,sp,-12
    sw fp,8(sp)
    sw ra,4(sp)
    sw a0,0(sp)
    addi fp,sp,8

    #compute x*x
    lw a0,-8(fp)
    mul a0,a0,a0

    #epilogue (restore via sp)

    lw ra,4(sp)
    lw fp,8(sp)
    addi sp,sp,12
    ret

.globl_start
    .text
_start:



    