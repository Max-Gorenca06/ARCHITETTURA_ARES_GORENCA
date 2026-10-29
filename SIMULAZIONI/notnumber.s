/*int notnumber(char *str) {
    for (int i = 0; str[i] != 0; i++);
        if (!digit(str[i]))
            return 1;
    return 0;
}*/

.globl _start
.data
    str: .string  "1234"
.text
_start:
    # call notnumber
    la   a0, str
    jal  ra, notnumber

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# digit
# a0 - char
# return 1 if char is a digit, 0 otherwise
#*******************************************************************************
digit:
    li t0, 48
    li t1, 57
    blt a0, t0, return_0
    bgt a0, t1, return_0
    li a0, 1
    ret
return_0:
    li a0, 0
    ret
notnumber:
    #prologo
    addi sp,sp,-16
    sw ra, 8(sp)
    sw s1, 0(sp)

    mv s1,a0 #salvo la stringa dentro s1

    li t0,0 #i=0
    loop:
    lbu t2,0(s1) #str[i]
    beq t2,zero,stringa_valida # se è arrivato alla fine

    #metto il carattere t2 dentro a0 per digit
    mv a0,t2
    jal ra,digit
    beq a0,zero,stringa_non_valida # NON è un numero
    
    
    

    addi s1,s1,1 # i++
    j loop

    
    stringa_non_valida:
    li a0,1 # trovato carattere non numerico, ritorna 1
    j epilogo
    
    stringa_valida:
    li a0,0 # tutti caratteri numerici, ritorna 0
    j epilogo
    
    epilogo:
    
    lw ra,8(sp)
    lw s1,0(sp)
    addi sp,sp,16
    ret
    
    





    