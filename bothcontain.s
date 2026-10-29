/*
    int bothcontain(char *str1, char *str2, char ch) {
    if (contains(str1, ch) && contains(str2, ch))
        return 1;
    else
        return 0;
}
    int contains(char *str, char ch) {
    int i = 0;
    while (str[i] != '\0') {
        if (str[i] == ch) {
            return 1;  // Carattere trovato!
        }
        i++;
    }
    return 0;  // Fine stringa raggiunta senza trovare ch
}


 */
.globl _start
.data

    str1:   .string "programming"
    str2:   .string "algorithm"
    ch:     .byte 'a'             # Entrambe contengono 'a' -> deve restituire 1

    
.text
_start:
    la   a0, str1             # a0 = str1
    la   a1, str2             # a1 = str2
    la   a2, ch
    lbu  a2, 0(a2)            # a2 = 'a'
    
    jal  ra, bothcontain
    
    # Exit
    li   a7, 10
    ecall  

contains:
    li t0,0 #i=0
    
    loop:
    add t1,a0,t0 #offset è i
    lbu t2,0(t1)
    beqz t2,end_loop
    beq t2,a1,ret_1
    addi t0,t0,1 #i++
    j loop

    ret_1: #VITTORIA
    li a0,1
    ret
    end_loop:
    li a0,0 #fine stringa raggiunta senza  trovare ch
    ret

bothcontain:
#prologo
    addi sp,sp,-16
    sw a0,12(sp)
    sw a1,8(sp)
    sw a2,4(sp)
    sw ra,0(sp)

    mv a1,a2 #metto ch in a1 per contains, che ricordo accetta solo 2 par (a0,a1)

    jal ra,contains
    beqz a0,return_0 #se contiene 0, posso gia uscire
    mv t3,a0

    # PER LA SECONDA CHIAMATA, DEVO RICARICARE I VALORI DALLO STACK
    lw a0,8(sp) #str2 ( è 8(sp) e non 12(sp) perche devo caricare str2 e non str1)
    lw a1,4(sp) #ricarica ch dallo stack
    
    jal ra,contains
    beqz a0,return_0
    
    li a0,1 #ritorno 1
    j epilogo
    
    return_0:
        li a0,0 
        j epilogo

epilogo:
    lw ra,0(sp)
    addi sp,sp,16
    ret