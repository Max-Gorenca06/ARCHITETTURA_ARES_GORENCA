#Si scriva un programma in linguaggio RISC-V che carichi 4 numeri interi presente nella memoria in word contigue e calcoli il valore intero della loro media aritmetica (arrotondamento per difetto). Il valore calcolato va salvato in un'ulteriore posizione della memoria contigua a quelle usate per il calcolo. In questo esercizio, utilizzare soltanto il set delle istruzioni intere di base rv32i
.globl _start
.data
    numbers: .word 12, 16, 20, 24  # numeri di esempio
    result:  .word 0               # spazio per il risultato

.text
_start:
    
    # completare il codice qui
    la t0,numbers
    lw t1,0(t0)
    lw t2,4(t0)
    lw t3,8(t0)
    lw t4,12(t0)
    
    add t5,t1,t2
    add t5,t5,t3
    add t5,t5,t4

    srai t6,t5,2

    la t0,result
    sw t6,0(t0)

    
    
    
    

    # uscita
    li a7, 10   # codice di uscita
    ecall