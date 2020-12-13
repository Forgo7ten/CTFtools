#ifndef _WIN32_WINNT            // Specifies that the minimum required platform is Windows Vista.
#define _WIN32_WINNT 0x0600     // Change this to the appropriate value to target other versions of Windows.
#endif

#include <stdio.h>
#include <tchar.h>
#include <stdlib.h>

int before_main1()
{
	printf("before_main1()\n");

	return 0;
}
int before_main2()
{
	printf("before_main2()\n");

	return 0;
}
int after_main()
{
	printf("after_main()\n");
	return 0;
}

/*
__CRTInit中做一些初始化工作：
包括C库、C的初始化函数，C++库、C++的初始化函数等。
C和C++分别有一张表来保存初始化函数指针，
每个表又使用2个指针来明确范围，
__CRTInit会依次调用这2个表中的函数。
C初始化函数表：[ __xi_a, __xi_z]
C++初始化函数表: [ __xc_a, __xc_z]
现在对照代码注释，就会明白上述那段代码的作用。
通过特殊的段名称“.CRT$XIU”，“.CRT$XCU”，
链接器会把before1表放在“C初始化函数表”中，类似这样
[__xi_a, ..., before1(xiu), ..., __xi_z].
同理，before2表会被链接器放在“C++初始化函数表”中，象这样
[__xc_a, ..., before2(xcu), ..., __xc_z]，
*/

typedef int func();

#pragma data_seg(".CRT$XIU")  
static func* before1[] = { before_main1 }; // 放入C初始化函数表中（C语言函数用这个）

#pragma data_seg(".CRT$XCU")  
static func* before2[] = { before_main2 }; // 放入C++初始化函数表中（C++函数用这个）

#pragma data_seg() 

int _tmain(int argc, _TCHAR* argv[])
{
	_onexit(after_main);
	printf("hello world\n");
	getchar();
	return 0;
}