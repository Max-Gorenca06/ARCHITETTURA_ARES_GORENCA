.text
.globl main

data:
    var1: 
main:

    #x=A[3]

    lw s1,12(s0) # carica in s1 il contenuto di memoria [s0+12]

    #A[5]=A[5]+s2
    lw t0,20(s0) # carico in t0 il valore di A[5]
    add t0,t0,s2 #sommiamo ad A[5] il valore di s2
    sw t0,20(s0) #salvo il valore aggiornato di t0

    #SCAMBIAMO I VALORI DI A[0] E A[1]

    lw t0,0(s0) #leggo A[0] e lo metto in t0
    lw t1,4(s0) #leggo a[1] e lo metto in t0

    sw t1,0(s0) #memorizza dentro a[0] il val di a[1]
    sw t0,4(s0)#memorizza dentro a[0] il val di a[1]

    #ES A[10]=A[1]+A[2]

    lw t0,40(s0) #carico in t0 a[10], si puo anche togliere pk val sovrascritto
    lw t1,4(s0)  #carico in t1 a[1]
    lw t2,8(s0) #carico in t2 a[2]
    add t0,t1,t2 # a[10]=a[1]+a[2]
    sw t0,40(s0)# salvo il valore aggiornato di t0

    # A[3]=A[0]+100
    lw t1,0(s0)
    addi t0,t1,100
    sw t0,12(s0)

    

    
    
    
    
    


    
    