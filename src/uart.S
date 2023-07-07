#################### CONSTANTS #########################
.equ    UART_BASE, 0x10000000
.equ    RBR, 0
.equ    THR, 0
.equ    IER, 1
.equ    DLL, 0
.equ    DLM, 1
.equ    IIR, 2
.equ    FCR, 2
.equ    LCR, 3
.equ    MCR, 4
.equ    LSR, 5
.equ    MSR, 6
.equ    SCR, 7

#################### CODE #########################
.section .text.init
.global init_uart
init_uart:
        li      t0, UART_BASE

        # DLAB = 0, 8-bit, 1 stop bit, no parity, no break
        li      t1, 0b00000011
        sb      t1, LCR(t0)

        # Disable FIFO
        sb      zero, FCR(t0)

        # Disable interrupts
        sb      zero, IER(t0)
        ret

.global write_char
write_char:
        # TODO: Write the argument to UART
        ret
