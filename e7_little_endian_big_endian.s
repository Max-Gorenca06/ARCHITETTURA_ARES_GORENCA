#Si scriva un programma RISC-V che legga una word a 32 bit dalla memoria (value), ne inverta i 4 byte (byte-swap / conversione endianness) e salvi il risultato in result. Ad esempio:

#Input:  0x12345678  -  byte: [12][34][56][78]  (dal più significativo)
#Output: 0x78563412  -  byte: [78][56][34][12]  (byte invertiti)
#Suggerimenti:
#Usare srli e andi 0xFF per estrarre ogni singolo byte
#Usare slli per spostare ogni byte nella sua nuova posizione
#Usare or per combinare i quattro byte spostati nel risultato

.globl _start
.data
    value:  .word 0x12345678   # word da invertire
    result: .word 0            # spazio per il risultato

.text
_start:

    # completare il codice qui
    #caricamento
    la t0,value
    lw t1,0(t0)
    #prendo il primo byte (quello in fondo)
    andi t2,t1,0xFF # t2=0x00000078 lo sposto in fondo
    slli t2,t2,24	#t2=0x78000000 lo sposto all'inizio (di 24)
    # prendo il secondo byte
    srli t3,t1,8 # porto il byte nella ultima posizione a destra
    andi t3,t3,0xFF #pulisco
    slli t3,t3,16
    #prendo il 3 byte
    srli t4,t1,16
    andi t4,t4,0xFF
    slli t4,t4,8
    #prendo il 4 byte
    srli t5,t1,24
    andi t5,t5,0xFF
    
    #riattacco tutti i pezzi
    or t1,t2,t3 #combina i primi due
    or t1,t1,t4 # aggiunge il terzo
    or t1,t1,t5 # aggiunge l'ultimo, t1 è ora 0x78563412

    la t0,result
    sw t1,0(t0)

    # uscita dal programma
    li a7, 10
    ecall