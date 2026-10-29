/*
    int count_less (int array [], int size, int N) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (array[i] < N) {
            count++;
        }
    }
    return count;
}
*/
.globl _start
.data
    array: .word 8,5,3,7,2,6,4,1
    N: .word 4
    size: .word 8
.text
_start:
    # chiama count_less
    la a0, array
    la a1, size
    lw a1, 0(a1)
    la a2, N
    lw a2, 0(a2)
    jal ra, count_less
    #exit
    li a7, 10
    ecall
count_less:
    li t1,0 #i=0
    li t2,0 #count=0
    loop:
    #condizione if
    bge t1,a1,end_loop
    #devo posizionarmi in array di i
    slli t3,t1,2 # t3 contiene l'offset in byte
    add t4,a0,t3 # ora t4 punta a array[i]
    lw t5,0(t4) #t5=array[i]
    #ora faccio l'if
    bge t5,a2,skip_increment
    addi t2,t2,1 #count++
    skip_increment:
    addi t1,t1,1
    j loop
    end_loop:
    mv a0,t2 #copio in val ret
    ret
    