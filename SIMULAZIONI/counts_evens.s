/*
Invocata dal main passando un array di interi e la sua dimensione, 
la funzione conta quanti elementi dell'array sono numeri pari.
Per verificare se un singolo numero è pari, si appoggia alla sotto-funzione "is_even".

int count_evens(int[] array, int size) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (is_even(array[i])) {
            count++;
        }
    }
    return count;
}
*/
.globl _start
.data
  size:  .word 5
  array: .word 1, 4, 7, 10, 13  # Ci sono due numeri pari (4 e 10)

.text
_start:
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, count_evens
    
    # Fine programma, restituisce il conteggio in a0
    li   a7, 10
    ecall

#*******************************************************************************
# is_even
# a0 - numero intero
# return 1 se il numero è pari, 0 altrimenti
#*******************************************************************************
is_even:
    andi a0, a0, 1       # Fa l'AND bit a bit con 1 (se l'ultimo bit è 1, il numero è dispari)
    xori a0, a0, 1       # Inverte il risultato (1 diventa 0, 0 diventa 1)
    ret

count_evens:
    #prologo
    addi sp,sp,-16
    sw ra,12(sp)
    sw s0,8(sp)
    sw s1,4(sp)
    sw s2,0(sp)
    # inizializzazione
    mv s0,a0 # array
    mv s1, a1 # size
    li s2, 0 #count

    #ciclo
    li t0,0 #i=0
    loop:
    bge t0,s1,end_loop # i>size -> ciclo finito

    slli t1,t0,2 #dentro t1 c'è t1=i*4
    add t1,s0,t1 # t1=array[i]
    lw a0,0(t1) #metto in a0 per richiamre is_even
    jal ra, is_even

    beq a0,zero,dispari
    
    addi s2,s2,1 #count ++

    
    
    dispari: # se è dispari, salta l'incremento del contatore
    
    addi t0,t0,1
    j loop
    end_loop:
    mv a0,s2 #sposta il contatore finale dentro a0 ovvero il registro di output

    
    epilogo:
    lw ra, 12(sp)
    lw s0,8(sp)
    lw s1,4(sp)
    lw s2,0(sp)
    addi sp,sp,16

    ret
    

    