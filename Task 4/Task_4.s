.section .bss
.globl ram

# reserves 256 bytes of memory labeled RAM
.lcomm ram, 256 # reserve 256 bytes for RAM (uninitialized memory)

# swtiches to the text section, where actual machine instructions reside
.section .text
# makes fill_ram4 label visible to the linker so C code can call it
.globl fill_ram4 # make function visible to C program

fill_ram4:
    movq $10, %rcx # stores starting value (decrements until it gets to 0)
    movq $0, %rax # holds the running total

# starts the loop
sum_loop:
    # RAX = RAX + RCX
    addq %rcx, %rax

    # if RCX != 0, executes the loop again
    loop sum_loop

    movq %rax, ram+0x50 # stores the value of rax (summed number) into 0x50

    ret

.section .note.GNU-stack,"",@progbits
