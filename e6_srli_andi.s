#Si scriva un programma in linguaggio RISC-V che:

#Legga il valore di una word in memoria (var1) in un registro

#Estragga i singoli byte di questa word utilizzando shift e operazioni logiche

#Salvi ciascun byte estratto nelle variabili byte1 (byte meno significativo), byte2, byte3 e byte4 (byte più significativo)

#Suggerimenti:

#Usare srli per spostare il byte desiderato nella posizione meno significativa
#Usare andi con la maschera 0xFF per isolare il byte

.globl _start
.data
    var1:  .word 0x12345678   # Word
    byte4: .byte 0            # byte più significativo (sarà 0x12)
    byte3: .byte 0            
    byte2: .byte 0             
    byte1: .byte 0            # byte meno significativo (sarà 0x78)
    
.text
_start:
    # completare il codice qui

    # caricamento della word
    la t0,var1
    lw t1,0(t0)
    #estrazione byte 1
    andi t2,t1,0xFF # applica maschera 0xFF(11111111)
    la t0,byte1
    sb t2,0(t0)
    #estrazione byte 2
    srli t2,t1,8 #sposta la word a destra di 8 bit
    andi t2,t2,0xFF #applica la maschera 0xFF 
    la t0,byte2
    sb t2,0(t0)
    #estrazione byte 3
    srli t2,t1,16
    andi t2,t2,0xFF
    la t0,byte3
    sb t2,0(t0)
    #estrazione byte 4
    srli t2,t1,24
    andi t2,t2,0xFF
    la t0,byte4
    sb t2,0(t0)
    
    
    # uscita dal programma
    li a7, 10   # codice di uscita
    ecall