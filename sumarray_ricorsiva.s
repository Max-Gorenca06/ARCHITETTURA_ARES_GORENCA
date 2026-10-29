.globl _start
.data
    array: .word  1,2,3,4,5,6,7,8,9,10
    size:  .word  10
    
.text
_start:
    # chiama sumarray
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, sumarray

    
    #exit
    li   a7, 10
    ecall

sumarray:
    #caso base
    beqz a1,RETO
    #prologo
    addi sp,sp,-8
    sw ra,0(sp)
    sw s0, 4(sp)

    lw s0,0(a0) #s0 =array[0]
    addi a0,a0,4 # a0= array [i+1]
    addi a1,a1,-1 #a1 = size -1
    jal sumarray

    # a0== sumarray(array+1,size-1)
    add a0,s0,a0
    
    
    #epilogo
    lw s0,4(sp)
    lw ra, 0(sp)
    addi sp,sp,8
    ret
RETO:
    addi a0,zero,0
    ret

