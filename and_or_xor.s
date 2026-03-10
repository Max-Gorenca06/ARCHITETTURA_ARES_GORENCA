#Si scriva un programma RISC-V che legga due interi a 32 bit dalla memoria (a e b), calcoli il loro AND, OR
#e XOR bit a bit, e salvi ciascun risultato nella variabile di memoria corrispondente (res_and, res_or,
#res_xor). Utilizzare soltanto il set delle istruzioni intere di base rv32i.


.globl _start
.data
    a: .word 0xAAAAAAAA # primo operando
    b: .word 0x12345678 # secondo operando
    res_and: .word 0 # risultato di a AND b
    res_or: .word 0 # risultato di a OR b
    res_xor: .word 0 # risultato di a XOR b
.text

_start:

# completare il codice qui
    la t0,a #carico dentro t0 l'indirizzo di a
    lw t1,0(t0) #carico dentro t0 il valore di a
    
    la t0,b #carico dentro t1 l'indirizzo di b
    lw t2,0(t0) #carico dentro t2 il valore di b
    
    and t3,t1,t2 # t3=t1&t2
    or t4,t1,t2 # t4=t1 or t2
    xor t5,t1,t2 # t5=t1 XOR t2

    la t0,res_and #carico l'indirizzo di res_and e lo metto in t0, che non mi serve più
    sw t3,0(t0) # copia il valore di t3 in t0, ovvero in res_and

    la t0, res_or #carico l'indirizzo di res_or e lo metto in t0, che non mi serve più
    sw t4, 0(t0)

    la t0, res_xor #carico l'indirizzo di res_xor e lo metto in t0, che non mi serve più
    sw t5,0(t0)
    
    
    
    
    

# uscita dal programma
li a7, 10
ecall