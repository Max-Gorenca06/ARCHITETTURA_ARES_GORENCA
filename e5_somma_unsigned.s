#Si scriva un programma in linguaggio RISC-V che calcoli la somma degli elementi di un array con 3 elementi (byte) in due modi diversi:

#Considerando i valori come numeri con segno (signed byte)
#Considerando i valori come numeri senza segno (unsigned byte)
#I risultati vanno salvati nelle variabili result1 e result2

.globl _start
.data
    array:   .byte 130, 150, 200   # array di 3 byte
    result1: .word 0               # risultato signed
    result2: .word 0               # risultato unsigned
    
.text
    _start:
    

    # completare il codice qui
    la t0,array
    lb t1,0(t0)
    lb t2,1(t0)
    lb t3,2(t0)
    add t4,t1,t2
    add t4,t4,t3

    la t0,result1
    sw t4,0(t0)

    la t0,array
    lbu t1,0(t0)
    lbu t2,1(t0)
    lbu t3,2(t0)

    add t4,t1,t2
    add t4,t4,t3

    la t0,result2
    sw t4,0(t0)
    
    # uscita dal programma
    li a7, 10   # codice di uscita
    ecall