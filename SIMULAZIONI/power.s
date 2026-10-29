/*
int power(int base, int exp) {
    if (exp == 0)
        return 1;
    else
        return base * power(base, exp-1);
}
*/
.globl _start
.data
    base: .word 3
    exp:  .word 4
.text
_start:
    # chiama power
    la    a0, base
    lw    a0, 0(a0)
    la    a1, exp
    lw    a1, 0(a1)
    jal   ra, power

    #uscita
    li    a7, 10
    ecall

power:
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)

    mv s0, a0		//s0 contiene base
    mv s1, a1		//s1 contiene exp

    bne s1, zero, corpo_else
    addi a0, zero, 1
    j epilogo
    
    corpo_else:
        add a0, zero, s0
        addi t1, s1, -1
        add a1, zero, t1
        jal ra, power

        mul a0, a0, s0

    epilogo:
        lw ra, 0(sp)
        lw s0, 4(sp)
        lw s1, 8(sp)
        addi sp, sp, 12
        ret