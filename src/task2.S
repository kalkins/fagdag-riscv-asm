#################### CONSTANTS #########################
.section .rodata
test_string:
        .string "Hello world\n"

#################### CODE #########################
.section .text.init
.global main
main:
        # TODO: Print test_string
        ret
