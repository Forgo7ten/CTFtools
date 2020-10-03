#ifndef _MYCRTPTO_

#define _MYCRTPTO_

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void tea_encode(uint32_t* origin, uint32_t* key);//tea����
void tea_decode(uint32_t* origin, uint32_t* key);//tea����
void xtea_encode(unsigned int num_rounds, uint32_t origin[2], uint32_t const key[4]);//xxtea����
void xtea_decode(unsigned int num_rounds, uint32_t origin[2], uint32_t const key[4]);//xxtea����
void rc4_init(unsigned char* s, unsigned char* key, unsigned long Len_k); //rc4��ʼ������
void rc4_crypt(unsigned char* Data, unsigned long Len_D, unsigned char* key, unsigned long Len_k);//rc4�ӽ��ܺ���
int base64_encode(const unsigned char* src, unsigned char* dst);//base64����
int base64_decode(const unsigned char* src, unsigned char* dst);//base64����
void base64_myen(char* src, char* dst, char* mytable);//base64�Զ����ַ������
void base64_myde(char* src, char* dst, char* mytable);//base64�Զ����ַ������
unsigned __int64 crc64decode(unsigned __int64 Dst);//crc64����
void crc8encode(char* str);		//crc8λ����
void crc8decode(char * str);	//crc8λ����

/****************
�����Ǵ��벿��
****************/

#define tea_DELTA 0x9e3779b9


/*
tea���ܺ���
32�ּ��ܣ��������Ҫ����
uint32_t* origin   ΪҪ���ܵ�����������32λ�޷�������
uint32_t* key      Ϊ���ܽ�����Կ��Ϊ4��32λ�޷�������������Կ����Ϊ128λ
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
tea���ܺ���
32�ֽ��ܣ��������Ҫ����
uint32_t* origin   ΪҪ���ܵ�����������32λ�޷�������
uint32_t* key      Ϊ���ܽ�����Կ��Ϊ4��32λ�޷�������������Կ����Ϊ128λ
*/
void tea_decode(uint32_t* origin, uint32_t* key) {
    uint32_t v0 = origin[0], v1 = origin[1], i;  /* set up */
    uint32_t delta = 0x9e3779b9, sum = delta << 5; //32�����㣬������2��5�η���16�����㣬������2��4�η���8�����㣬������2��3�η�/* a key schedule constant */
    uint32_t k0 = key[0], k1 = key[1], k2 = key[2], k3 = key[3];   /* cache key */
    for (i = 0; i < 32; i++) {                         /* basic cycle start */
        v1 -= ((v0 << 4) + k2) ^ (v0 + sum) ^ ((v0 >> 5) + k3);
        v0 -= ((v1 << 4) + k0) ^ (v1 + sum) ^ ((v1 >> 5) + k1);
        sum -= delta;
    }                                              /* end cycle */
    origin[0] = v0; origin[1] = v1;
}


/*
xtea���ܺ���
num_rounds         ��������
uint32_t* origin   ΪҪ���ܵ�����������32λ�޷�������
uint32_t* k        Ϊ���ܽ�����Կ��Ϊ4��32λ�޷�������������Կ����Ϊ128λ
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
xtea���ܺ���
num_rounds         ��������
uint32_t* origin   ΪҪ���ܵ�����������32λ�޷�������
uint32_t* k        Ϊ���ܽ�����Կ��Ϊ4��32λ�޷�������������Կ����Ϊ128λ
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

// xxtea���ܽ���

#define xxtea_MX (((z>>5^y<<2) + (y>>3^z<<4)) ^ ((sum^y) + (key[(p&3)^e] ^ z)))
#if 0
int main()//����
{
    uint32_t v[2] = { 1,2 };
    uint32_t const k[4] = { 2,2,3,4 };
    int n = 2; //n�ľ���ֵ��ʾv�ĳ��ȣ�ȡ����ʾ���ܣ�ȡ����ʾ����
    // vΪҪ���ܵ�����������32λ�޷�������
    // kΪ���ܽ�����Կ��Ϊ4��32λ�޷�������������Կ����Ϊ128λ
    printf("����ǰԭʼ���ݣ�%u %u\n", v[0], v[1]);
    xxtea(v, n, k);
    printf("���ܺ�����ݣ�%u %u\n", v[0], v[1]);
    xxtea(v, -n, k);
    printf("���ܺ�����ݣ�%u %u\n", v[0], v[1]);
    return 0;
}
#endif
/*
xxtea�ӽ��ܺ�����n>0���ܣ�n<0����
origin    ΪҪ���ܵ�����������32λ�޷����������������ַ�����ת��Ϊ16����������
n         �ľ���ֵ��ʾv�ĳ���(���м���32λ����)��ȡ����ʾ���ܣ�ȡ����ʾ����
key       Ϊ���ܽ�����Կ��Ϊ4��32λ�޷�������������Կ����Ϊ128λ
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


void rc4_init(unsigned char* s, unsigned char* key, unsigned long Len_k) //��ʼ������
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
        s[i] = s[j]; //����s[i]��s[j]
        s[j] = tmp;
    }
}

/*
RC4�ӽ��ܺ���
unsigned char* Data     �ӽ��ܵ�����
unsigned long Len_D     �ӽ������ݵĳ���
unsigned char* key      ��Կ
unsigned long Len_k     ��Կ����
*/
void rc4_crypt(unsigned char* Data, unsigned long Len_D, unsigned char* key, unsigned long Len_k) //�ӽ���
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
        s[i] = s[j]; //����s[x]��s[y]
        s[j] = tmp;
        t = (s[i] + s[j]) % 256;
        Data[k] ^= s[t];
    }
}

/*
base64����
const unsigned char* src    ��Ҫ���ܵ�����
unsigned char* dst          ����֮��洢������
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
base64����
const unsigned char* src    ��Ҫ���ܵ��ַ�
unsigned char* dst          ����֮��洢������
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
base64�Զ����ַ������
char* src       ��Ŵ������ַ���������
char* dst       ��ż��ܺ��ַ���������
char* mytable   �Զ����ַ���
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
base64�Զ����ַ������
char* src       ��Ŵ������ַ���������
char* dst       ��Ž��ܺ��ַ���������
char* mytable   �Զ����ַ���
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
CRCѭ��У��64λ����
DstΪ��������
����ֵΪ���ܺ������
0xB0004B7679FA26B3ui64Ϊ����ֵ���޸�
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
CRCѭ��У��8λ�����ַ���
0x31Ϊ����ֵ���޸�
*/
void crc8encode(char* str)
{
    unsigned char i, crc;
    int j;
    for (j = 0; j < strlen(str); ++j)
    {
        crc = str[j];
        /* ������������8λ����Ҫ����8�� */
        for (i = 8; i > 0; --i)
        {
            if (crc & 0x80)  /* �ж����λ�Ƿ�Ϊ1 */
            {
                /* ���λΪ1������Ҫ���������һλ��Ȼ����0x31��� */
                /* 0x31(����ʽ��x8+x5+x4+1��100110001)�����λ����Ҫ���ֱ��ȥ�� */
                crc = (crc << 1) ^ 0x31;
            }
            else
            {
                /* ���λΪ0ʱ������Ҫ�����������������һλ */
                crc = (crc << 1);
            }
        }
        str[j] = crc;
    }
}

/*
CRCѭ��У��8λ�����ַ���
0x31Ϊ����ֵ���޸�
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