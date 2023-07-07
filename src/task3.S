#################### CODE #########################
.section .text.init
.global main
main:
        # TODO: Use the mystery function
        ret

mystery:
        # TODO: Understand this function, replace the blanks, and give it a proper name
        addi    sp, sp, -104
        sd      ra, 0(sp)
        sd      a1, 8(sp)
        sd      a2, 16(sp)
        sd      a3, 24(sp)
        sd      a4, 32(sp)
        sd      a5, 40(sp)
        sd      a6, 48(sp)
        sd      a7, 56(sp)
        sd      s0, 64(sp)
        sd      s1, 72(sp)
        sd      s2, 80(sp)
        sd      s3, 88(sp)
        sd      s4, 96(sp)

        mv      s0, a0
        addi    s1, sp, 8
        li      s2, 37
        li      s3, 100
        j       2f
1:
        addi    s0, s0, 1
2:
        lb      t0, 0(s0)
        beq     t0, s2, 3f
        beqz    t0, 8f
        mv      a0, t0
        # TODO: Insert instruction here
        j       1b

3:
        addi    s0, s0, 1
        lb      t0, 0(s0)
        beq     t0, s3, 4f
        mv      s4, t0
        li      a0, 37
        # TODO: Insert instruction here
        beqz    s4, 8f
        mv      a0, s4
        # TODO: Insert instruction here
        j       1b

4:
        ld      t1, 0(s1)
        addi    s1, s1, 8
        li      t2, 10000000000000000000
        li      t3, 10
        j       6f
5:
        divu    t2, t2, t3
6:
        divu    t4, t1, t2
        beqz    t4, 5b
7:
        addi    a0, t4, 48
        # TODO: Insert instruction here
        remu    t1, t1, t2
        divu    t2, t2, t3
        beqz    t2, 1b
        divu    t4, t1, t2
        j       7b

8:
        ld      ra, 0(sp)
        ld      s0, 64(sp)
        ld      s1, 72(sp)
        ld      s2, 80(sp)
        ld      s3, 88(sp)
        ld      s4, 96(sp)
        addi    sp, sp, 104
        ret
