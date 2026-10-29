/*
int mulpos(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += (i+1) * arr[i];
    }
    return sum;

}
 */
.globl _start
    .data
        arr:   .word 2, 3, 4, 5
        size:  .word 4
        
    .text
    _start:
        # chiama mulpos
        la   a0, arr
        la   a1, size
        lw   a1, 0(a1)
        jal  ra, mulpos

        # Risultato atteso su a0: 40
        
        #exit
        li   a7, 10
        ecall

    #******************************************************
    # completare la funzione mulpos nel campo di sotto
    mulpos:
        li t0,0 # i=0
        li t1,0 #sum=0

        li t2,0 # valore di i+1
        loop:
            bge t0,a1,end_loop
            addi t2,t0,1 #i+1

            slli t3,t0,2 #offset
            add t3,a0,t3 # indirizzo effettivo

            lw t4,0(t3) # load valore corrente

            mul t5,t2,t4 # (i+1)*(arr[i])

            add t1,t1,t5 #sum= (i+1)*(arr[i])
            
            
            
            addi t0,t0,1 #i++
            j loop
        end_loop:
            mv a0,t1
            ret
