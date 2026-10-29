.globl _start
.data
    str: .string  "1234"
.text

/*
int isnumber(char *str) {
    for (int i = 0; str[i] != 0; i++);
        if (!digit(str[i]))
            return 0;
    return 1;
}
*/
_start:
    # call isnumber
    la   a0, str
    jal  ra, isnumber

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

isnumber:
#prologo
    addi sp,sp,-8
    sw ra,4(sp)
    sw s1,0(sp)
    mv s1,a0 # copio il valore di a0 in s1 perche cosi non viene perso
            #quando chiamo digit, altrimenti potrebbe venir perso
    li t1,0 # i =0
    #ora devo mettere la condizione di uscita dal for str[i]!=0
    
    
    
    loop:
    lbu t2,0(s1) #str[i]
    beq t2,zero,successo
    
    #metto il carattere t2 dentro a0 per digit
    mv a0,t2
    jal ra,digit # chiamo rigit su ra
    #controllo quello che ha risposto digit, se è 0, non è un numero, altrimenti lo è
    beq a0,zero,end_loop

    #altrimenti è un numero  e passiamo al carattere successivo
    
    addi s1,s1,1 #i+1
    j loop

    successo:
    li a0,1
    j epilogo
    end_loop:
    li a0,0
    j epilogo
#epilogo
epilogo:
    lw ra,4(sp)
    lw s1,0(sp)
    addi sp,sp,8
    ret

    
    