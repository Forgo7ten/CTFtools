//
// compiled on Ubuntu 16.04 with:
//    gcc -o return return.c -masm=intel
//

#include <stdio.h>

void evil() {
    puts("Evil Code");
}

extern void gadget();
__asm__ (".global gadget        \n"
         "gadget:               \n"
         "  pop       rax       \n"
         "  mov       rsp, rbp  \n"
         "  call      rax       \n"
         "  pop       rbp       \n"
         "  ret                 \n");

void * gadgets[] = {gadget, evil};

void deceptive() {
    puts("Hello World!");
    __asm__("mov rsp, %0;\n"
            "ret"
            :
            :"i" (gadgets));
}

void main() {
    deceptive();
}

