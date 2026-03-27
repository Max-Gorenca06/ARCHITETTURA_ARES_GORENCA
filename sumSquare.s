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
.globl _start
    .text
_start:
    li a0,2
    li a1,3
    jal sumSquares
    li a7,10
    ecall

#int sumSquares(int a, int b){
  #  return square(a) + square(b);
#}
sumSquares:
    #prologo, devo aprire il frame di attivazione della fnzne
    addi sp,sp,-16  // 4 variabili di tipo word
    sw 	 fp,12(sp)
    sw	 ra, 8(sp)
    //sw	 a0,4(sp) // deve contenere il risultato
    sw	 a1,0(sp)
    addi fp,sp,12 // voglio che punti alla prima istr del frame
    
    #corpo della funzione
    #square(a)
    jal square
    sw a0,4(sp) // salviamo il val di ritorno
    
    #square(b)
    lw a0,0(sp)
    jal square

    lw t3,4(sp) // pesco il val di ritorno di a
    add a0,a0,t3 // square(a)+square(b)
    
    #epilogo, chiudo il frame di attivazione
    lw	 fp,12(sp) // devo recuperare fp precedente
    lw 	 ra, 8(sp) // ripristino return address
    addi sp,sp,16 //som la stessa quantità, non cambia dim stack
    
    ret
    



    