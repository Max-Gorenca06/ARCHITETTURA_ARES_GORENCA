/*
// Funzione helper (già definita nel file assembly):
// int is_prime(int n); -> restituisce 1 se n è primo, 0 altrimenti.

int count_prime(int arr[], int size) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (is_prime(arr[i]) == 1) {
            count++;
        }
    }
    return count;
}
 */
.globl _start
.data

arr:   .word 4, 7, 10, 13, 15, 17     # I primi sono 7, 13, 17 -> totale 3
size:  .word 6

    
.text
_start:
    la   a0, arr
    la   t0, size
    lw   a1, 0(t0)
    
    jal  ra, count_prime
    
    li   a7, 10
    ecall

is_prime: #FNZ HELPER, RITORNA 1 se PRIMO, 0 NON PRIMO
    li t0,2 
    blt a0,t0,not_p #se n<2 non sarà mai primo
    loop_p:
    mul t1,t0,t0 #calcolo i^2
    bgt t1,a0,is_p #se abbiamo gia superato la radice quadrata e non abbiamo trovato nessun divisore, allora è PRIMO

    rem t1,a0,t0 #t1= n%i (resto della divisione)
    beqz t1,not_p
    
    addi t0,t0,1 #i++
    j loop_p
    is_p:
        li a0,1 #ritorna 1(è primo)
        ret
    not_p:
        li a0,0 #ritorna 0(non è primo)
        ret
    

count_prime:
    addi sp,sp,-12
    sw ra,8(sp)
    sw a0,4(sp)
    sw a1,0(sp) #size
    #corpo
    li t2,0 # i=0
    li t3,0 #count=0
    loop:
        lw a0,4(sp) #ripristina indirizzo base dell'array prima di calcolar el'offset
        bge t2,a1,end_loop
        #preparo arr
        slli t5,t2,2 #offset
        add t6,a0,t5 #t6=base+offset
        lw t5,0(t6) #t5=arr[i]
        mv a0,t5
        jal ra,is_prime
        mv t4,a0 #sposto dinuvo il ris di a0 in t4 per salvarlo per poter fare la prossima chiamata
        li t0,1 #uso t0 per ospitare 1
        beqz t4,salta_incremento
        addi t3,t3,1 #count++
        salta_incremento:
        addi t2,t2,1 #i++
        j loop
    end_loop:
    mv a0,t3
    
    #epilogo
    lw a1,0(sp)
    lw a0,4(sp)
    lw ra,8(sp)
    addi sp,sp,12

    