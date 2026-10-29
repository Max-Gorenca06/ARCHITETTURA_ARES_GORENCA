/*
    
    
    int strlen(char *str) {
    int len = 0;
    while (str[len] != '\0') {
        len++;
    }
    return len;

    int bothshort(char *str1, char *str2, int N) {
    if (strlen(str1) <= N && strlen(str2) <= N)
        return 1;
    else
        return 0;
    }
}


 */
.globl _start
.data

    str1:   .string "dog"          # lunghezza 3
    str2:   .string "cat"          # lunghezza 3
    N:      .word   4              # 3 <= 4 e 3 <= 4 -> deve restituire 1

    
.text
_start:
    la   a0, str1              # a0 = str1
    la   a1, str2              # a1 = str2
    la   a2, N
    lw   a2, 0(a2)             # a2 = N (4)
    
    jal  ra, bothshort
    
    # Exit
    li   a7, 10
    ecall

strlen:
    li t0,0 #i++
    loop:  
        add t1,a0,t0
        lbu t2,0(t1) #str[len]
        beqz t2,end_loop #str [i]== '\0'
        
        addi t0,t0,1 # i++

        j loop
    end_loop:
        mv a0,t0 #len (che è i)
        ret
    
bothshort:
    addi sp,sp,-16
    sw s0,12(sp)
    sw s1,8(sp)
    sw s2,4(sp)
    sw ra,0(sp)

    mv s0,a0 #str1
    mv s1,a1 #str2
    mv s2,a2 #N

    jal ra,strlen #prima chiamata
    bgt a0,s2,return_0 # controllo se è subito <=N

    mv a0,s1 #sposto str2 dentro a0 che viene passata a strlen
    jal ra,strlen
    bgt a0,s2,return_0
    #åltrimenti l'if funziona e ritorno 1
    li a0,1
    j epilogo

    return_0:
        li a0,0
        j epilogo

    epilogo:
    lw ra,0(sp)
    lw s2,4(sp)
    lw s1,8(sp)
    lw s0,12(sp)
    addi sp,sp,16
    ret    