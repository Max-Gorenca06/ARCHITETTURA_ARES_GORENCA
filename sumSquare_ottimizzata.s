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
sumSquares:// OTTIMIZZATA
    #prologo, devo aprire il frame di attivazione della fnzne
    addi sp,sp,-12  // 4 variabili di tipo word
    sw   ra,8(sp)
    sw	 s1,0(sp)
    addi s1,ra,0

    mv s1,a1
    #corpo della funzione
    #square(a)
    jal ra,square
    sw a0,4(sp) // salviamo il val di ritorno
    
    #square(b)
    lw a0,0(sp)
    jal ra,square

    lw t3,4(sp) // pesco il val di ritorno di a
    add a0,a0,t3 // square(a)+square(b)
    
    #epilogo, chiudo il frame di attivazione
    lw   ra,0(sp)
    lw 	 ra, 8(sp) // ripristino return address
    addi sp,sp,12 //som la stessa quantità, non cambia dim stack
    jalr zero,0(ra)
    

square: // OTTIMIZZATA
    // LA FUNZIONE FOGLIA DI SOLITO HA SOLO IL CORPO
    // usa solo i registri temporanei
    #compute x*x
    mul a0,a0,a0

    ret



    