#include<stdio.h> 

// 会将代码放在.init段
__attribute__((constructor)) void before_main() { 
   printf("before main\n"); 
} 


// 会将代码放在.fini段
__attribute__((destructor)) void after_main() { 
   printf("after main\n"); 
} 
  
int main(int argc, char **argv) { 
   printf("in main\n"); 
   return 0; 
}