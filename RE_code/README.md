# RE_code

- RE crypto
- outside_main

## RE crypto


自己学习RE加密算法整理制作的C语言头文件
包含：
```c
void tea_encode(uint32_t* origin, uint32_t* key);//tea加密
void tea_decode(uint32_t* origin, uint32_t* key);//tea解密
void xtea_encode(unsigned int num_rounds, uint32_t origin[2], uint32_t const key[4]);//xxtea加密
void xtea_decode(unsigned int num_rounds, uint32_t origin[2], uint32_t const key[4]);//xxtea解密
void rc4_init(unsigned char* s, unsigned char* key, unsigned long Len_k); //rc4初始化函数
void rc4_crypt(unsigned char* Data, unsigned long Len_D, unsigned char* key, unsigned long Len_k);//rc4加解密函数
int base64_encode(const unsigned char* src, unsigned char* dst);//base64加密
int base64_decode(const unsigned char* src, unsigned char* dst);//base64解密
void base64_myen(char* src, char* dst, char* mytable);//base64自定义字符表加密
void base64_myde(char* src, char* dst, char* mytable);//base64自定义字符表解密
unsigned __int64 crc64decode(unsigned __int64 Dst);//crc64解密
```



## outside_main

将C语言代码写到main函数外的例子

## python_code

python代码

## shit_code

- obfusGenerator.cpp：源码
- shit：成品

输入生成函数个数即可生成一堆无用函数，并可以插入自己的加密代码

## IDA_anti_F5

IDA反F5