/*
int power(int base, int exp) {
    if (exp == 0) 
        return 1;
    else 
        return base * power(base, exp - 1);
}
 */
.globl _start
.data
    base: .word 3
    exp:  .word 4         # 3^4 = 81
    
.text
_start:
    la   t0, base
    lw   a0, 0(t0)    # a0 = base (3)
    la   t0, exp
    lw   a1, 0(t0)    # a1 = exp (4)
    
    jal  ra, power    # Chiamata a power(3, 4)
    
    # Exit
    li   a7, 10
    ecall

power:
    addi sp,sp,-8
    sw a0,4(sp)
    sw ra,0(sp)

    
    beqz a1,return_1
    addi a1,a1,-1 #decremento espontente
    jal ra,power #chiamo power
    # al ritorno, a0 contiene il risultato di power(base, exp -1)
    #recupero la base
    lw t0,4(sp) 
    mul a0,a0,t0 #a0= power(...)*base
    j epilogo
  
    
    return_1:
    li a0,1 #return 1
    
    epilogo:
    #epilogo
 
    lw ra,0(sp)
    addi sp,sp,8

    ret
    
    
