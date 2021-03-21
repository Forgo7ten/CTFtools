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
__CRTInit����һЩ��ʼ��������
����C�⡢C�ĳ�ʼ��������C++�⡢C++�ĳ�ʼ�������ȡ�
C��C++�ֱ���һ�ű��������ʼ������ָ�룬
ÿ������ʹ��2��ָ������ȷ��Χ��
__CRTInit�����ε�����2�����еĺ�����
C��ʼ��������[ __xi_a, __xi_z]
C++��ʼ��������: [ __xc_a, __xc_z]
���ڶ��մ���ע�ͣ��ͻ����������Ƕδ�������á�
ͨ������Ķ����ơ�.CRT$XIU������.CRT$XCU����
���������before1����ڡ�C��ʼ���������У���������
[__xi_a, ..., before1(xiu), ..., __xi_z].
ͬ��before2��ᱻ���������ڡ�C++��ʼ���������У�������
[__xc_a, ..., before2(xcu), ..., __xc_z]��
*/

typedef int func();

#pragma data_seg(".CRT$XIU")  
static func* before1[] = { before_main1 }; // ����C��ʼ���������У�C���Ժ����������

#pragma data_seg(".CRT$XCU")  
static func* before2[] = { before_main2 }; // ����C++��ʼ���������У�C++�����������

#pragma data_seg() 

int _tmain(int argc, _TCHAR* argv[])
{
	_onexit(after_main);
	printf("hello world\n");
	getchar();
	return 0;
}