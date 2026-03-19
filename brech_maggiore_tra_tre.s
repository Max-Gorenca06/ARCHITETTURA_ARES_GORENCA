#Massimo Gorenca 19-03-2026

#Si scriva un programma in linguaggio RISC-V che dati tre numeri interi su t0, t1 e t2, inserisca il valore massimo tra i tre nel registro t3. Assumere che t0, t1 e t2 siano già stati inizializzati.
# 

.globl _start #main
    
.text 
_start: #qua ci va il nostro programma
        add t3,t0,x0  # assumo che il massimo sia t0
        
        ble t1,t3,check_t2 # se t1<t3,salta
        add t3,t1,x0 # altrimenti t1=t3
        check_t2:
            ble t2,t3,fine # se t2<t3,salta
            add t3,t2,x0

        fine:
            nop
        
    
exit:
    addi x17,x0,10 # il numero 10=exit
    ecall #chiamo il sistema operativo
    