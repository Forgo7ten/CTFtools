#ifndef _WIN32_WINNT            // Specifies that the minimum required platform is Windows Vista.
#define _WIN32_WINNT 0x0600     // Change this to the appropriate value to target other versions of Windows.
#endif

#include <stdio.h>
#include <tchar.h>
#include <iostream>
using namespace std;
using std::cout;

int func()
{
	cout << "func() called before main()" << endl;
	return 100;
}
class A
{
public:
	A()
	{
		cout << "A() constructor called" << endl;
	}
	~A()
	{
		cout << "~A() destructor called" << endl;
	}
};

A a;

int g_iValue = func();


int _tmain(int argc, _TCHAR* argv[])
{
	cout << "main() called" << endl;
	return 0;
}