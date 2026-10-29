/*
int find_first_digit(char *str) {
    int i = 0;
    while (str[i] != '\0') {
        if (str[i] >= '0' && str[i] <= '9') {
            return i;
        }
        i++;
    }
    return -1;
}
 */
.globl _start
.data

str: .string "hello123world"   # Cifra '1' si trova all'indice 5
    
.text
_start:
    la   a0, str              # a0 = indirizzo base della stringa
    jal  ra, find_first_digit  # Chiamata alla funzione
    
    # Exit
    li   a7, 10
    ecall

find_first_digit:
    li t0,0 #i=0
    li t3,'0'
    li t4,'9'
    loop:
    # SICCOME è una stringa, e ogni char occupa solo 1, non serve offset
    add t1,a0,t0 # i=ind base+offset(i)
    lbu t2,0(t1) #arr[i]
    beqz t2,end_loop #if(str[i]!='\0')
    blt t2,t3,salta #if(str[i]>=0) &&
    bgt t2,t4,salta #if(str[i]<=9)
    mv a0,t0 #return i
    ret
    salta:
    addi t0,t0,1
    j loop
    end_loop:
    li a0,-1
    ret