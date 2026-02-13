# stores the values 0xFF into RAM locations 0x50 - 0x58 using direct addressing

# tells the assembler that the following lines define data rather than executable code
.section .bss
.globl ram

# reserves 256 bytes of memory labeled RAM
.lcomm ram, 256 # reserve 256 bytes for RAM (uninitialized memory)

# swtiches to the text section, where actual machine instructions reside
.section .text
# makes fill_ram3 label visible to the linker so C code can call it
.globl fill_ram3 # make function visible to C program

# starting label for function
fill_ram3:
    # store 00 into RAM locations 50H - 58H using direct addressing

    # moves the byte (movb) with value 0x00 directly into the memory address of ram plus an offset of 0x5(0-8)
    movb $0x00, ram+0x50
    movb $0x00, ram+0x51
    movb $0x00, ram+0x52
    movb $0x00, ram+0x53
    movb $0x00, ram+0x54
    movb $0x00, ram+0x55
    movb $0x00, ram+0x56
    movb $0x00, ram+0x57
    movb $0x00, ram+0x58

    ret # return control back to C program

.section .note.GNU-stack,"",@progbits