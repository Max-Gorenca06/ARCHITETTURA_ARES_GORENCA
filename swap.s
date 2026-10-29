// MASSIMO GORENCA

/* Scrivere una procedura swap(array, x, y) che scambi i valori di array[x] e array[y], dove arrayè un indirizzo in memoria.


Il seguente codice in C realizza swap (convertilo in RISC-V):
void swap(int array[], int x, int y) {
    int temp = array[x];
    array[x] = array[y];
    array[y] = temp;
}

Attenzione:
Incollare nel campo di sotto soltanto il contenuto della funzione swap (in RISC-V)
Attenzione alle convenzioni di chiamata!
Usare il seguente codice "main" per sviluppo e debugging nel simulatore
*/
.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
    x:     .word 0
    y:     .word 1
    
.text
_start:
    # chiama swap
    la   a0, array
    la   a1, x
    lw   a1, 0(a1)
    la   a2, y
    lw   a2, 0(a2)
    jal  ra, swap
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione swap nel campo di sotto

swap:
    #corpo
    slli t0,a1,2 #offset x, ho moltiplicato x per 4
    add t0,a0,t0 # indirizzo di array[x]

    slli t1,a2,2 #offset y
    add t1,a0,t1 #indirizzo di array[y]
    # carico valori in reg temporanei
    lw t2,0(t0) #leggo il val di x e lo metto in t2
    lw t3, 0(t1) # leggo il val di y e lo metto in t3
    # scambio
    sw t3,0(t0) #metto dentro t3 il val di x
    sw t2,0(t1) #metto dentro t2 il val di y

    ret