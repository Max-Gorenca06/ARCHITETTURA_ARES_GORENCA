/*
int strcchar(char *str1, char *str2, char mychar) {
    int v1 = charcount(str1, mychar);
    int v2 = charcount(str2, mychar);
    if (v1 == v2) 
        return 1;
    else
        return 0;
}

}
 */
.globl _start
.data
    str1:   .string "torino"
    str2:   .string "milano"
    mychar: .byte 'i'
    
.text
_start:
    # chiama strcchar
    la   a0, str1
    la   a1, str2
    la   a2, mychar
    lbu  a2, 0(a2)
    jal  ra, strcchar
    
    # Risultato atteso in a0: 1
    
    #exit
    li   a7, 10
    ecall

#******************************************************
# charcount: Non incollarlo nella risposta!
# a0 -> str
# a1 -> char
# restituisce il numero di occorenze di char in str 
#******************************************************
charcount: 
    li    t0, 0
charcount_l1: 
    lbu   t1, 0(a0)
    beqz  t1, charcount_l3
    addi  a0, a0, 1
    bne   t1, a1, charcount_l1             
    addi  t0, t0, 1
    j     charcount_l1
charcount_l3: 
    mv    a0, t0
    ret                

#******************************************************
# completa la funzione strcchar nel campo qui sotto
# NON E' UNA FUNZIONE FOGLIA, QUINDI USO REGISTRI S
#ricordati di mettere il ret e di sommare il giusto

strcchar:
    # prologo
    addi sp,sp,-20
    sw ra,16(sp)
    sw s0,12(sp)
    sw s1,8(sp)
    sw s2,4(sp)
    sw s3,0(sp)

    mv s0,a0 #str1
    mv s1,a1 #str2
    mv s2,a2 #mychar

#PRIMA CHIAMATA
    mv a0,s0
    mv a1,s2
    jal ra,charcount #chiamata1
    mv s3,a0
#SECONDA CHIAMATA
    
    mv a0,s1 #sposto str2 in a0
    mv a1,s2 #mycahr in a1
    jal ra,charcount

    beq s3,a0,ramo_if

    li a0,0
    j epilogo
    ramo_if:
        li a0,1
        j epilogo
    

    
    

    epilogo:

    lw ra,16(sp)
    lw s0,12(sp)
    lw s1,8(sp)
    lw s2,4(sp)
    lw s3,0(sp)
    addi sp,sp,20
    ret

    



    
    
    