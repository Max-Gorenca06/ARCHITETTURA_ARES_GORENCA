

/*
int notsorted(int[] array, int size) {
    for (int i = 0; i < size-1; i++) {
        if (array[i] > array[i+1]) {
            return 1;
        }
    }
    return 0;
} 
*/
.globl _start
.data
  size:  .word  10
  array: .word  1,3,5,6,7,8,9,25,30,40

.text
_start:
    # chiama notsorted
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, notsorted
    
    #exit
    li   a7, 10
    ecall   

notsorted:
    li t0,0 #i=0
    addi t1,a1,-1 #size=-1

    
    loop:
    bge t0,t1,is_sorted
    slli t2,t0,2 # ora t2 contiene l'offset in bte t2= i*4
    add t2,a0,t2 # t2= &v[i] (indirizzo effettivo)

    lw t3, 0(t2)
    lw t4, 4(t2)

    #confronto
    bgt t3,t4,not_sorted
    

    addi t0,t0,1
    j loop
    not_sorted:
    li a0,1 # return 1
    ret

    is_sorted:
    li a0,0 # return 0
    ret #oppure jalr x0,0(ra)
    end_loop:
    

    