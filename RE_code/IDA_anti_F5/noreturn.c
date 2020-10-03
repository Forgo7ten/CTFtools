//
// compiled on Ubuntu 16.04 with:
//    gcc -o noreturn noreturn.c
//

#include <stdio.h>
#include <stdlib.h>

void ignore() {
    exit(0);                  // force a PLT/GOT entry for exit()
}

void deceptive() {
    puts("Hello World!");
    srand(0);                 // post-processing will swap srand() <--> exit()
    puts("Evil Code");
}

void main() {
    deceptive();
}


