//
// compiled on Ubuntu 16.04 with:
//    gcc -o predicate predicate.c -masm=intel
//

#include <stdio.h>

#define positive_sp_predicate \
    __asm__ ("  push     rax      \n"\
             "  xor      eax, eax \n"\
             "  jz       opaque   \n"\
             "  add      rsp, 4   \n"\
             "opaque:             \n"\
             "  pop      rax      \n");

void protected()
{
    positive_sp_predicate;
    puts("Can't decompile this function");
}

void main()
{
    protected();
}

