    .data
a:  .byte 10              @ char a = 10
b:  .byte 20              @ char b = 20
s:  .byte 0               @ char s = 0
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

    @ chamada a printf("O valor de s é %d.\n", s)
    ldr r0, =msg          @ primeiro argumento: formato
    ldr r1, =s
    ldrb r1, [r1]         @ segundo argumento: valor de s
    bl printf             @ chama printf

    pop {lr}              @ restaura o registrador de retorno
    bx lr                 @ retorna da função main
