.globl _start
.data
    v1: .word 8
    v2: .word 9
    v3: .word 0
.text
_start:
    li t0, 0x10000000 # base address of our .data segment
    lw t1, 0(t0) # copy the first word to t1
    lw t2, 4(t0) # copy the second word to t2
    add t3, t1, t2 # sum the words and save it on register t3
    sw t3, 8(t0) # store the sum in the 3rd word starting from address …

#uscita
li a7,10

ecall