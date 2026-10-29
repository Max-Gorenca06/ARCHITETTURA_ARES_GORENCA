/*
    int dotproduct(int arr1[], int arr2[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr1[i] * arr2[i];
    }
    return sum;
}
 */
.globl _start
.data

arr1:  .word 1, 2, 3, 4       # Primo vettore
arr2:  .word 5, 6, 7, 8       # Secondo vettore
                              # Risultato: (1*5) + (2*6) + (3*7) + (4*8) = 70
size: .word 4

    
.text
_start:
   la   a0, arr1
    la   a1, arr2
    la   t0, size
    lw   a2, 0(t0)            # a2 = size (4)
    
    jal  ra, dotproduct
    
    # Exit
    li   a7, 10
    ecall

dotproduct:
    li t0,0 #i=0
    li t1,0 #sum=0
    
    loop:
        bge t0,a2,end_loop #i<size
        slli t3,t0,2 #OFFSET
        add t4,a0,t3 #ind base +off
        lw t5,0(t4) #arr1[i]
        
        add t4,a1,t3 #calcolo indirizzo nuovo vett (base + offset)
        lw t6,0(t4) #arr2[i]
        mul t4,t5,t6 #arr1[i] * arr2[i]
        add t1,t1,t4 # sum+= arr1[i] * arr2[i]   
        addi t0,t0,1
    j loop
    end_loop:
    mv a0,t1
    ret
    
    