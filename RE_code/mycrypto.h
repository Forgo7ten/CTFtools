#ifndef _MYCRTPTO_

#define _MYCRTPTO_

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

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
void crc8encode(char* str);		//crc8位加密
void crc8decode(char * str);	//crc8位解密

/****************
以下是代码部分
****************/

#define tea_DELTA 0x9e3779b9


/*
tea加密函数
32轮加密，请根据需要更改
uint32_t* origin   为要加密的数据是两个32位无符号整数
uint32_t* key      为加密解密密钥，为4个32位无符号整数，即密钥长度为128位
*/
void tea_encode(uint32_t* origin, uint32_t* key) {
    uint32_t v0 = origin[0], v1 = origin[1], sum = 0, i;           /* set up */
    uint32_t delta = 0x9e3779b9;                     /* a key schedule constant */
    uint32_t k0 = key[0], k1 = key[1], k2 = key[2], k3 = key[3];   /* cache key */
    for (i = 0; i < 32; i++) {                       /* basic cycle start */
        sum += delta;
        v0 += ((v1 << 4) + k0) ^ (v1 + sum) ^ ((v1 >> 5) + k1);
        v1 += ((v0 << 4) + k2) ^ (v0 + sum) ^ ((v0 >> 5) + k3);
    }                                              /* end cycle */
    origin[0] = v0; origin[1] = v1;
}


/*
tea解密函数
32轮解密，请根据需要更改
uint32_t* origin   为要加密的数据是两个32位无符号整数
uint32_t* key      为加密解密密钥，为4个32位无符号整数，即密钥长度为128位
*/
void tea_decode(uint32_t* origin, uint32_t* key) {
    uint32_t v0 = origin[0], v1 = origin[1], i;  /* set up */
    uint32_t delta = 0x9e3779b9, sum = delta << 5; //32轮运算，所以是2的5次方；16轮运算，所以是2的4次方；8轮运算，所以是2的3次方/* a key schedule constant */
    uint32_t k0 = key[0], k1 = key[1], k2 = key[2], k3 = key[3];   /* cache key */
    for (i = 0; i < 32; i++) {                         /* basic cycle start */
        v1 -= ((v0 << 4) + k2) ^ (v0 + sum) ^ ((v0 >> 5) + k3);
        v0 -= ((v1 << 4) + k0) ^ (v1 + sum) ^ ((v1 >> 5) + k1);
        sum -= delta;
    }                                              /* end cycle */
    origin[0] = v0; origin[1] = v1;
}


/*
xtea加密函数
num_rounds         加密轮数
uint32_t* origin   为要加密的数据是两个32位无符号整数
uint32_t* k        为加密解密密钥，为4个32位无符号整数，即密钥长度为128位
*/
void xtea_encode(unsigned int num_rounds, uint32_t origin[2], uint32_t const key[4]) {
    unsigned int i;
    uint32_t v0 = origin[0], v1 = origin[1], sum = 0, delta = 0x9E3779B9;
    for (i = 0; i < num_rounds; i++) {
        v0 += (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + key[sum & 3]);
        sum += delta;
        v1 += (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + key[(sum >> 11) & 3]);
    }
    origin[0] = v0; origin[1] = v1;
}


/*
xtea解密函数
num_rounds         加密轮数
uint32_t* origin   为要加密的数据是两个32位无符号整数
uint32_t* k        为加密解密密钥，为4个32位无符号整数，即密钥长度为128位
*/
void xtea_decode(unsigned int num_rounds, uint32_t origin[2], uint32_t const key[4]) {
    unsigned int i;
    uint32_t v0 = origin[0], v1 = origin[1], delta = 0x9E3779B9, sum = delta * num_rounds;
    for (i = 0; i < num_rounds; i++) {
        v1 -= (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + key[(sum >> 11) & 3]);
        sum -= delta;
        v0 -= (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + key[sum & 3]);
    }
    origin[0] = v0; origin[1] = v1;
}

// xxtea加密解密

#define xxtea_MX (((z>>5^y<<2) + (y>>3^z<<4)) ^ ((sum^y) + (key[(p&3)^e] ^ z)))
#if 0
int main()//例子
{
    uint32_t v[2] = { 1,2 };
    uint32_t const k[4] = { 2,2,3,4 };
    int n = 2; //n的绝对值表示v的长度，取正表示加密，取负表示解密
    // v为要加密的数据是两个32位无符号整数
    // k为加密解密密钥，为4个32位无符号整数，即密钥长度为128位
    printf("加密前原始数据：%u %u\n", v[0], v[1]);
    xxtea(v, n, k);
    printf("加密后的数据：%u %u\n", v[0], v[1]);
    xxtea(v, -n, k);
    printf("解密后的数据：%u %u\n", v[0], v[1]);
    return 0;
}
#endif
/*
xxtea加解密函数，n>0加密，n<0解密
origin    为要加密的数据是两个32位无符号整数（若加密字符串先转换为16进制整数）
n         的绝对值表示v的长度(即有几个32位整数)，取正表示加密，取负表示解密
key       为加密解密密钥，为4个32位无符号整数，即密钥长度为128位
*/
void xxtea_crypt(uint32_t* origin, int n, uint32_t const key[4])
{
    uint32_t y, z, sum;
    unsigned p, rounds, e;
    if (n > 1)            /* Coding Part */
    {
        rounds = 6 + 52 / n;
        sum = 0;
        z = origin[n - 1];
        do
        {
            sum += tea_DELTA;
            e = (sum >> 2) & 3;
            for (p = 0; p < n - 1; p++)
            {
                y = origin[p + 1];
                z = origin[p] += xxtea_MX;
            }
            y = origin[0];
            z = origin[n - 1] += xxtea_MX;
        } while (--rounds);
    }
    else if (n < -1)      /* Decoding Part */
    {
        n = -n;
        rounds = 6 + 52 / n;
        sum = rounds * tea_DELTA;
        y = origin[0];
        do
        {
            e = (sum >> 2) & 3;
            for (p = n - 1; p > 0; p--)
            {
                z = origin[p - 1];
                y = origin[p] -= xxtea_MX;
            }
            z = origin[n - 1];
            y = origin[0] -= xxtea_MX;
            sum -= tea_DELTA;
        } while (--rounds);
    }
}


void rc4_init(unsigned char* s, unsigned char* key, unsigned long Len_k) //初始化函数
{
    int i = 0, j = 0;
    char k[256] = { 0 };
    unsigned char tmp = 0;
    for (i = 0; i < 256; i++) {
        s[i] = i;
        k[i] = key[i % Len_k];
    }
    for (i = 0; i < 256; i++) {
        j = (j + s[i] + k[i]) % 256;
        tmp = s[i];
        s[i] = s[j]; //交换s[i]和s[j]
        s[j] = tmp;
    }
}

/*
RC4加解密函数
unsigned char* Data     加解密的数据
unsigned long Len_D     加解密数据的长度
unsigned char* key      密钥
unsigned long Len_k     密钥长度
*/
void rc4_crypt(unsigned char* Data, unsigned long Len_D, unsigned char* key, unsigned long Len_k) //加解密
{
    unsigned char s[256];
    rc4_init(s, key, Len_k);
    int i = 0, j = 0, t = 0;
    unsigned long k = 0;
    unsigned char tmp;
    for (k = 0; k < Len_D; k++) {
        i = (i + 1) % 256;
        j = (j + s[i]) % 256;
        tmp = s[i];
        s[i] = s[j]; //交换s[x]和s[y]
        s[j] = tmp;
        t = (s[i] + s[j]) % 256;
        Data[k] ^= s[t];
    }
}

/*
base64加密
const unsigned char* src    需要加密的数组
unsigned char* dst          加密之后存储的数组
*/
int base64_encode(const unsigned char* src, unsigned char* dst)
{

    size_t len = strlen((const char*)src);
    static unsigned char base64char[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    while (len > 2) {
        *dst++ = base64char[src[0] >> 2 & 0x3f];
        *dst++ = base64char[(src[0] & 0x3) << 4 | src[1] >> 4 & 0xf];
        *dst++ = base64char[(src[1] & 0xf) << 2 | src[2] >> 6 & 0x3];
        *dst++ = base64char[src[2] & 0x3f];
        len -= 3;
        src += 3;
    }

    if (len) {
        *dst++ = base64char[src[0] >> 2 & 0x3f];
        if (len > 1) {
            *dst++ = base64char[((src[0] & 0x3) << 4) | ((src[1] >> 4) & 0xf)];
            *dst++ = base64char[(src[1] & 0xf) << 2];
        }
        else {
            *dst++ = base64char[(src[0] & 0x3) << 4];
            *dst++ = '=';
        }
        *dst++ = '=';
    }

    *dst = 0;
    return 0;
}

/*
base64解密
const unsigned char* src    需要解密的字符
unsigned char* dst          解密之后存储的数组
*/
int base64_decode(const unsigned char* src, unsigned char* dst)
{
    static char base64char[] = {
            -1 , -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1 , -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1 , -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1,
            52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
            -1 ,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
            15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, 63,
            -1 , 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
            41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
    };

    int i;
    size_t len = strlen((const char*)src);

    for (i = 0; i < len; i++) {
        if (src[i] == -1) {
            return 1; //unexpected characters
        }
        else if (src[i] == '=') {
            len = i;
        }
    }

    if (len % 4 == 1) {
        return  2;
    }

    while (len > 3) {
        *dst++ = (unsigned char)(base64char[src[0]] << 2) | (base64char[src[1]] >> 4 & 0x3);
        *dst++ = (unsigned char)(base64char[src[1]] << 4) | (base64char[src[2]] >> 2 & 0xf);
        *dst++ = (unsigned char)(base64char[src[2]] << 6) | (base64char[src[3]]);

        src += 4;
        len -= 4;
    }

    if (len) {
        if (len > 1) {
            *dst++ = (base64char[src[0]] << 2) | (base64char[src[1]] >> 4 & 0x3);
        }

        if (len > 2) {
            *dst++ = (base64char[src[1]] << 4) | (base64char[src[2]] >> 2 & 0xf);
        }

    }
    *dst = 0;
    return 0;
}

/*
base64自定义字符表加密
char* src       存放待加密字符串的数组
char* dst       存放加密后字符串的数组
char* mytable   自定义字符表
*/
void base64_myen(char* src, char*dst, char* mytable)
{
    base64_encode((const unsigned char*)src,(unsigned char*)dst);
    int i, j;
    char base64_table[65] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    int len_s = strlen(dst);
    for (i = 0; i < len_s; i++)
    {
        for (j = 0; j < 65; j++)
        {
            if (dst[i] == base64_table[j])
            {
                dst[i] = mytable[j];
                break;
            }
        }
    }
}

/*
base64自定义字符表解密
char* src       存放待解密字符串的数组
char* dst       存放解密后字符串的数组
char* mytable   自定义字符表
*/
void base64_myde(char* src, char* dst, char* mytable)
{
    int i, j;
    char base64_table[65] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    int len_s = strlen(src);
    for (i = 0; i < len_s; i++)
    {
        for (j = 0; j < 65; j++)
        {
            if (src[i] == mytable[j])
            {
                src[i] = base64_table[j];
                break;
            }
        }
    }
    base64_decode((const unsigned char*)src, (unsigned char*)dst);
}

/*
CRC循环校验64位解密
Dst为加密数据
返回值为解密后的数据
0xB0004B7679FA26B3ui64为异或的值需修改
*/
unsigned __int64 crc64decode(unsigned __int64 Dst)
{
    int j;
    for (j = 0; j < 64; ++j)
    {
        if (!(Dst & 1))
            Dst /= 2;
        else
            Dst = ((Dst ^ 0xB0004B7679FA26B3ui64) >> 1) + 0x8000000000000000ui64;
    }
    return Dst;
}

/*
CRC循环校验8位加密字符串
0x31为异或的值可修改
*/
void crc8encode(char* str)
{
    unsigned char i, crc;
    int j;
    for (j = 0; j < strlen(str); ++j)
    {
        crc = str[j];
        /* 数据往左移了8位，需要计算8次 */
        for (i = 8; i > 0; --i)
        {
            if (crc & 0x80)  /* 判断最高位是否为1 */
            {
                /* 最高位为1，不需要异或，往左移一位，然后与0x31异或 */
                /* 0x31(多项式：x8+x5+x4+1，100110001)，最高位不需要异或，直接去掉 */
                crc = (crc << 1) ^ 0x31;
            }
            else
            {
                /* 最高位为0时，不需要异或，整体数据往左移一位 */
                crc = (crc << 1);
            }
        }
        str[j] = crc;
    }
}

/*
CRC循环校验8位解密字符串
0x31为异或的值可修改
*/
void crc8decode(char * str)
{
    int i,j;
    unsigned char dst;
    for (i = 0; i < strlen(str); ++i)
    {
        dst = str[i];
        for (j = 0; j < 8; ++j)
        {
            if (!(dst & 1))
                dst /= 2;
            else
                dst = ((dst ^ 0x31u) >> 1) + 0x80u;
        }
        str[i] = dst;
    }
    
}

#endif // !_MYCRTPTO_