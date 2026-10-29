/*
    int both_longer_n(char *str1, char *str2, int N) {
    if (strlen(str1) > N && strlen(str2) > N)
        return 1;
    else
        return 0;
}
*/
.globl _start
.data
    str1: .string "milan"
    str2: .string "torino"
    N: .word 3
.text
_start:
    # chiama both_longer_n
    la a0, str1
    la a1, str2
    la a2, N
    lw a2, 0(a2)
    jal ra, both_longer_n
    #exit
    li a7, 10
    ecall
#******************************************************
# strlen
# a0 -> str
# restituisce la lunghezza della stringa
#******************************************************
strlen:
    mv t0, a0
    sr1: lbu t1, 0(t0)
    beqz t1, sr2
    addi t0, t0, 1
    j sr1
    sr2: sub a0, t0, a0
    ret

both_longer_n:	
    #prologo
    addi sp,sp,-20
    sw ra,16(sp)
    sw s0,12(sp)
    sw s1,8(sp)
    sw s2,4(sp)
    sw s3,0(sp)

    mv s0,a0 #str1
    mv s1,a1 #str2
    mv s2,a2 #N
    jal ra,strlen #chiamo su str1 e calcolo lungh
    mv s3,a0 #sposto il ris1 su s3 per poter fare altra ch
    mv a0,s1 #sposto il punt di a0 su str2
    jal ra,strlen #calcolo lungh s2

    ble s3,s2,no_succ
    ble a0,s2,no_succ

    li a0,1
    j epilogo
    no_succ:
        li a0,0
        j epilogo

    
    #epilogo
    epilogo:
        lw ra,16(sp)
        lw s0,12(sp)
        lw s1,8(sp)
        lw s2,4(sp)
        lw s3,0(sp)
        addi sp,sp,20
    ret
        
    