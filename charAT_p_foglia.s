// MASSIMO GORENCA

// char charAt(char *str, int n) {
    //return str[n];
//}

.globl _start
.data
    str: .string "Hello World!"
    n:   .word   6

.text
_start:
    # call charAt
    la  a0, str
    la  a1, n
    lw  a1, 0(a1)
    jal ra, charAt

    #exit
    li   a7, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto

charAt:
   #calcoliamo l'indirizzo dell'elemento selezionato sommando a0 ad a1 
    add t0,a0,a1
    #leggiamo dalla memoria il valore a quell'indirzzo
    #lbu legge un byte e lo mette dentro a0(registro di ritorno)
    lbu a0,0(t0)

    jr ra