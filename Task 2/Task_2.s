# stores the values 0xFF into RAM locations 0x50 - 0x58 using indirect addressing

# tells the assembler that the following lines define data rather than executable code
.section .bss
.globl ram

# reserves 256 bytes of memory labeled RAM
.lcomm ram, 256 # reserve 256 bytes for RAM (uninitialized memory)

# swtiches to the text section, where actual machine instructions reside
.section .text
# makes fill_ram2 label visible to the linker so C code can call it
.globl fill_ram2 # make function visible to C program

# starting label for function
fill_ram2:
    movb $0xFF, %al
    movq $ram+0x50, %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)
    incq %rbx

    movb %al, (%rbx)

    ret # return control back to C program

.section .note.GNU-stack,"",@progbits