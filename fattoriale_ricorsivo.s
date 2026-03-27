#Massimo Gorenca 27/03/2026
/*
int fact(int n){
    if(n=0)
        return 1
    else
        return n*fact(n-1)
}

void main(){
    int n=5
    return fact(n)
}
*/

.globl _start
    .text
_start:
    // MAIN
    // call fact(n)
    addi a0,zero,5
    jal fact

    li a7,10
    ecall

fact:
    #prolog
    addi sp,sp,-8
    sw ra,4(sp)
    sw a0,0(sp)
    #corpo
    # controllo se caso base
    beq a0,zero,fbase
    #chiamata ricorsiva
    addi a0,a0,-1 #n=n-1
    jal ra,fact 
    
    #cosa contiene a0 qui?!!! --> contiene il fattoriale(n-1)
    lw a1,0(sp)
    mul a0,a0,a1 # n* X
    beq zero,zero,fexit

fbase: // caso base
    addi a0,zero,1
fexit:
    lw ra,4(sp)
    addi sp,sp,8
    ret

