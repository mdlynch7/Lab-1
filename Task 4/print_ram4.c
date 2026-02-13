#include <stdio.h>
extern unsigned char ram[]; // RAM declared in assembly
extern void fill_ram4(void); // Assembly function
int main() {
    fill_ram4();
    printf("Result: %d\n", ram[0x50]);

    return 0;
}