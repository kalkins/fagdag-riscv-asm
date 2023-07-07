#################### CODE #########################
.section .text.init
.global main
main:
        # TODO: Read input from UART.
        # You should add a function to uart.S to read a single character.
        # Here, you should read a full line, then print it out again and return.
        addi    sp, sp, -100
        sd      ra, 0(sp)
        sd      s0, 8(sp)
        sd      s1, 16(sp)
        sd      s2, 24(sp)

        li      s0, '\n'
        addi    s1, sp, 32
        mv      s2, s1
1:      call    read_char
        sb      a0, 0(s1)
        addi    s1, s1, 1
        bne     a0, s0, 1b
2:      lb      a0, 0(s2)
        addi    s2, s2, 1
        call    write_char
        blt     s2, s1, 2b

        ld      ra, 0(sp)
        ld      s0, 8(sp)
        ld      s1, 16(sp)
        ld      s2, 24(sp)
        addi    sp, sp, 100
        ret
