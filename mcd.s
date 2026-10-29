// MASSIMO GORENCA

/* Scrivere una procedura RISC-V per il calcolo del massimo comune divisore di due numeri interi positivi a e b. A tale scopo, implementare l'algoritmo di Euclide come procedura mcd(a,b) da richiamare nel main. L'algoritmo di Euclide in pseudo-codice è il seguente:

int mcd(int a, int b) {
    while (a != b) { 
        if (a > b)
            a = a - b;
        else
            b = b - a;
    }
    return a;
}
Il valore di ritorno deve essere lasciato sul registro a0.
Attenzione:
Incollare nel campo di sotto soltanto il contenuto della funzione mcd (in RISC-V)
Attenzione alle convenzioni di chiamata!
Usare il seguente codice "main" per sviluppo e debugging nel simulatore
*/
.globl _start
.data
    num1: .word 24
    num2: .word 30
.text
_start:
    # call mcd
    la    a0, num1
    la    a1, num2
    lw    a0, 0(a0)
    lw    a1, 0(a1)     
    jal   ra, mcd

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione mcd nel campo di sotto
mcd:

loop:
    beq a0,a1,fine_loop
    blt a0,a1,else
    sub a0,a0,a1
    j loop
else:
    sub a1,a1,a0
    j loop
fine_loop:
    ret
