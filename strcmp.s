// MASSIMO GORENCA

/* Scrivere una procedura RISC-V strcmp per confrontare due stringhe di caratteri. strcmp(str1, str2) restituisce 0 se str1è uguale a str2, 1 nel caso contrario.

Il valore di ritorno deve essere lasciato sul registro a0.
Attenzione:
Incollare nel campo di sotto soltanto il contenuto della funzione strcmp (in RISC-V)
Attenzione alle convenzioni di chiamata!
Usare il seguente codice "main" per sviluppo e debugging nel simulatore
*/

#****************************************************
# completare la funzione strcmp nel campo di sotto.globl _start
.data
    str1: .string  "first."
    str2: .string  "second."
.text
_start:
    # call strcmp
    la   a0, str1
    la   a1, str2
    jal  ra, strcmp
    #exit
    li   a7, 10
    ecall

#****************************************************
strcmp:
    loop:
        lbu t0,0(a0) #legge il carattere corrente di str1
        lbu t1,0(a1) # legge carattere corrente di str2
        bne t0,t1,diversi

        beqz t0,uguali # se siamo qui, allora i caratteri sono uguali e controllo che non siano 0
        addi a0,a0,1 # aggiungo 1 al puntatore di str1
        addi a1,a1,1 # aggiungo 1 al puntatore di str2
        j loop
    uguali:
        li a0,0
        ret
    diversi:
        li a0,1 #maggiore o minore
        ret

    
    