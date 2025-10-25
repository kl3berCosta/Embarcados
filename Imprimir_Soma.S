    .data
a:  .byte 10              
b:  .byte 20              
s:  .byte 0               
msg: .asciz "O valor de s é %d.\n"

    .text
    .global main
    .extern printf

main:
    push {lr}             @ salva o registrador de retorno

    ldr r0, =a
    ldrb r1, [r0]         @ r1 = a
    ldr r0, =b
    ldrb r2, [r0]         @ r2 = b
    add r3, r1, r2        @ r3 = a + b

    ldr r0, =s
    strb r3, [r0]         @ s = r3

    @ imprimir na tela
    ldr r0, =msg          
    ldr r1, =s
    ldrb r1, [r1]        
    bl printf             

    pop {lr}              
    bx lr                 
