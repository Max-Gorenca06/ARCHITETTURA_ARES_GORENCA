#Si scriva un programma RISC-V che legga due numeri interi pari dalla memoria (num1 e num2) e calcoli la loro media aritmetica. Il risultato va salvato nella variabile di memoria result. In questo esercizio, utilizzare soltanto il set delle istruzioni intere di base rv32i (usare un'operazione di shift per eseguire la divisione per 2).

.globl _start
.data
    num1:   .word 8    # primo intero pari
    num2:   .word 10   # secondo intero pari
    result: .word 0    # spazio per il risultato

.text
_start:

    # completare il codice qui
    la t0,num1
    lw t1,0(t0)

    la t0,num2
    lw t2,0(t0)

    add t3,t1,t2

    srai t4,t3,1

    la t0,result #t0=indirizzo di result
    sw t4, 0(t0)# memorizza il valore di t0 in result
    

    # uscita dal programma
    li a7, 10
    ecall

