#Massimo Gorenca 19-03-2026

#Considerando il seguente frammento di codice che ritorna l'N-esimo numero della sequenza di Fibonacci - Fib(n) - scrivere l'equivalente in RISC-V. Assumere che la variabile N sia memorizzata nel registro t0. Il risultato finale (variabile R) va lasciato nel registro t1. Si utilizzino altri registri temporanei per le variabili A e B, e il minor numero possibile di istruzioni.
/*
N ->è già caricato su t0
    int R = 1;
    int A = 0; int B = 1;
    while (N > 0) {
        R = A + B;
        A = B;
        B = R;
        N = N - 1;
    }
*/

.globl _start #main

.text 
_start: #qua ci va il nostro programma
        li t1,1 #r=1
        li t3,0 #a=0
        li t4,1 # b=1
#inzio il while
        while_start:
            ble t0,x0,while_end
            
            add t1,t3,t4 # R=A+B
            add t3,t4,zero # A=B
            add t4,t1,zero # B=R

            addi t0,t0,-1 # n=n-1

            beq zero,zero,while_start
        while_end:
            nop
        
    
exit:
    addi x17,x0,10 # il numero 10=exit
    ecall #chiamo il sistema operativo
    