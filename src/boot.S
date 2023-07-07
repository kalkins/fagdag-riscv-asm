#################### CONSTANTS #########################
.equ    TEST_BASE, 0x00100000
.equ    SHUTDOWN, 0x5555

#################### CODE #########################
.section .text.init
.global _start
_start:
.option push
.option norelax
        la      gp, _global_pointer
.option pop
        la      sp, _stack_end

        call    init_uart

        call    main

        # Exit
        li      t0, TEST_BASE
        li      t1, SHUTDOWN
1:      sw      t1, 0(t0)
        j 1b
