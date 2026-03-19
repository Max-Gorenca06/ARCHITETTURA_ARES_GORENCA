#Massimo Gorenca 19-03-2026

#Scrivere le sequenze di istruzioni RISC-V corrispondente al seguente frammento di pseudocodice. Si supponga che le variabili x, y siano contenute rispettivamente nei registri t0, t1.
#x = (x - 2) + y
#if (x < y)
#    x = x + 1
#else
#    y = y + 1

.globl _start #main
    
.text 
_start: #qua ci va il nostro programma
    addi t0,t0,-2
    add t0,t0,t1
    
    bge t0,t1,else
    addi t0,t0,1
    beq zero,zero,exit
    else:
        addi t1,t1,1
    
    
exit:
    addi x17,x0,10 # il numero 10=exit
    ecall #chiamo il sistema operativo
    