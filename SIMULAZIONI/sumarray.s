/*int sumarray(int[] array, int size) {
    if (size == 0) {
        return 0;
    } else {
        return array[0] + sumarray(array+1, size-1);
    }
}
*/

.globl _start
.data
    array: .word  1,2,3,4,5,6,7,8,9,10
    size:  .word  10
    
.text
_start:
    # chiama sumarray
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, sumarray
    
    #exit
    li   a7, 10
    ecall

sumarray:
    # 1. PROLOGO: Salvataggio standard
    addi sp, sp, -12
    sw ra, 8(sp)
    sw s0, 4(sp)
    sw s1, 0(sp)

    # 2. Salva size (s1) e il VALORE dell'elemento corrente (s0)
    mv s1, a1           # s1 = size
    lw s0, 0(a0)        # s0 = array[0] (IL VALORE)

    # 3. CASO BASE
    li a0, 0
    beq s1, zero, epilogo  # Se size == 0, ritorna 0 (a0 è già 0)

    # 4. LOGICA RICORSIVA
    addi a0, a0, 4      # a0 = array + 1 (punta al prossimo elemento)
    addi a1, s1, -1     # a1 = size - 1
    jal ra, sumarray    # Chiamata ricorsiva
    # a0 ha il risultato della ricorsione, s0 ha il valore originale array[0]
    add a0, a0, s0      # a0 = somma_ricorsiva + array[0]

epilogo:
    # 6. RIPRISTINO
    lw s1, 0(sp)
    lw s0, 4(sp)
    lw ra, 8(sp)
    addi sp, sp, 12
    ret