.globl _start
.data
  size:  .word  10
  array: .word  1,3,5,6,7,8,9,25,30,40

.text
/*
int issorted (int[] array, int size) {
    for (int i=0; i < size-1; i++) {
        if (array[i] > array[i+1]) {
            return 0;
        }
    }
    return 1;
}
*/
_start:
    # chiama issorted
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, issorted
    
    #exit
    li   a7, 10
    ecall   


issorted:
    #PROLOGO
    addi sp,sp,-40
    sw ra,36(sp)
    sw s0,32(sp)

    li t0,0 #questa è la nostra i
    addi t1,a1,-1 # t1= size-1
    loop:
    beq t0,t1,end_loop_1 #i<size-1
    slli t2,t0,2 #t2 ora contiene l'offset in byte
    add t3,a0,t2 # ora t3 punta ad array[i]
    lw t4,0(t3) # t5=i
    lw t5,4(t3) #t4=i+1

    blt t5,t4,end_loop_0
    
    addi t0,t0,1 #i+1
    j loop
    
    end_loop_1:
    addi a0,zero,1
    j epilogo
    end_loop_0:
        addi a0,zero,0
        j epilogo
    #epilogo
    epilogo:  
        lw ra, 36(sp)
        lw s0,32(sp)
        addi sp,sp,40
        ret