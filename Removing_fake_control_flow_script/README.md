# Removing fake control flow script

IDA处理虚假控制流程脚本

此脚本搬运于2019 RoarCTF官方WP

## 使用方法

IDA菜单栏  File → Script file，选择unfake.py  ，进行去除

## 使用条件
当分析的程序中含有虚假控制流程时
虚假控制流程例如：
代码中的条件都是永真条件（while;do...while）均为while(1)
例如IDA伪代码
```c
__int64 __fastcall main(__int64 a1, char **a2, char **a3)
{
  signed __int64 v4; // [rsp+1E0h] [rbp-110h]
  int i; // [rsp+1E8h] [rbp-108h]
  int v6; // [rsp+1ECh] [rbp-104h]
  int v7; // [rsp+1ECh] [rbp-104h]
  char s1[48]; // [rsp+1F0h] [rbp-100h]
  char s[60]; // [rsp+220h] [rbp-D0h]
  unsigned int v10; // [rsp+25Ch] [rbp-94h]
  char *v11; // [rsp+260h] [rbp-90h]
  int v12; // [rsp+26Ch] [rbp-84h]
  bool v13; // [rsp+272h] [rbp-7Eh]
  unsigned __int8 v14; // [rsp+273h] [rbp-7Dh]
  int v15; // [rsp+274h] [rbp-7Ch]
  char *v16; // [rsp+278h] [rbp-78h]
  int v17; // [rsp+284h] [rbp-6Ch]
  int v18; // [rsp+288h] [rbp-68h]
  bool v19; // [rsp+28Fh] [rbp-61h]
  char *v20; // [rsp+290h] [rbp-60h]
  int v21; // [rsp+298h] [rbp-58h]
  bool v22; // [rsp+29Fh] [rbp-51h]
  __int64 v23; // [rsp+2A0h] [rbp-50h]
  bool v24; // [rsp+2AFh] [rbp-41h]
  __int64 v25; // [rsp+2B0h] [rbp-40h]
  __int64 v26; // [rsp+2B8h] [rbp-38h]
  __int64 v27; // [rsp+2C0h] [rbp-30h]
  __int64 v28; // [rsp+2C8h] [rbp-28h]
  int v29; // [rsp+2D0h] [rbp-20h]
  int v30; // [rsp+2D4h] [rbp-1Ch]
  char *v31; // [rsp+2D8h] [rbp-18h]
  int v32; // [rsp+2E0h] [rbp-10h]
  int v33; // [rsp+2E4h] [rbp-Ch]
  bool v34; // [rsp+2EBh] [rbp-5h]

  v10 = 0;
  memset(s, 0, 0x30uLL);
  memset(s1, 0, 0x30uLL);
  printf("Input:", 0LL);
  v11 = s;
  if ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 )
    goto LABEL_43;
  while ( 1 )
  {
    __isoc99_scanf("%s", v11);
    v6 = 0;
    if ( dword_603058 < 10 || (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) == 0 )
      break;
LABEL_43:
    __isoc99_scanf("%s", v11);
  }
  while ( 1 )
  {
    do
      v12 = v6;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
    v13 = v12 < 64;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 )
      ;
    if ( !v13 )
      break;
    v14 = s[v6];
    do
      v15 = v14;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
    if ( v15 == 10 )
    {
      v16 = &s[v6];
      *v16 = 0;
      break;
    }
    v17 = v6 + 1;
    do
      v6 = v17;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
  }
  for ( i = 0; ; ++i )
  {
    do
      v18 = i;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
    do
      v19 = v18 < 6;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
    if ( !v19 )
      break;
    do
      v20 = s;
    while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
    v4 = *(_QWORD *)&v20[8 * i];
    v7 = 0;
    while ( 1 )
    {
      v21 = v7;
      do
        v22 = v21 < 64;
      while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
      if ( !v22 )
        break;
      v23 = v4;
      v24 = v4 < 0;
      if ( v4 >= 0 )
      {
        v27 = v4;
        do
          v28 = 2 * v27;
        while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
        v4 = v28;
      }
      else
      {
        v25 = 2 * v4;
        do
          v26 = v25;
        while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
        v4 = v26 ^ 0xB0004B7679FA26B3LL;
      }
      v29 = v7;
      do
        v7 = v29 + 1;
      while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
    }
    v30 = 8 * i;
    v31 = &s1[8 * i];
    if ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 )
LABEL_55:
      *(_QWORD *)v31 = v4;
    *(_QWORD *)v31 = v4;
    if ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 )
      goto LABEL_55;
    v32 = i + 1;
  }
  do
    v33 = memcmp(s1, &unk_402170, 0x30uLL);
  while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 );
  v34 = v33 != 0;
  while ( dword_603058 >= 10 && (((_BYTE)dword_603054 - 1) * (_BYTE)dword_603054 & 1) != 0 )
    ;
  if ( v34 )
    puts("Wrong!");
  else
    puts("Correct!");
  return v10;
}
```
使用脚本的效果
```c
__int64 __fastcall main(__int64 a1, char **a2, char **a3)
{
  signed __int64 v4; // [rsp+1E0h] [rbp-110h]
  signed int j; // [rsp+1E8h] [rbp-108h]
  signed int i; // [rsp+1ECh] [rbp-104h]
  signed int k; // [rsp+1ECh] [rbp-104h]
  char s1[48]; // [rsp+1F0h] [rbp-100h]
  char s[60]; // [rsp+220h] [rbp-D0h]
  unsigned int v10; // [rsp+25Ch] [rbp-94h]
  char *v11; // [rsp+260h] [rbp-90h]
  int v12; // [rsp+26Ch] [rbp-84h]
  bool v13; // [rsp+272h] [rbp-7Eh]
  unsigned __int8 v14; // [rsp+273h] [rbp-7Dh]
  int v15; // [rsp+274h] [rbp-7Ch]
  char *v16; // [rsp+278h] [rbp-78h]
  int v17; // [rsp+284h] [rbp-6Ch]
  int v18; // [rsp+288h] [rbp-68h]
  bool v19; // [rsp+28Fh] [rbp-61h]
  char *v20; // [rsp+290h] [rbp-60h]
  int v21; // [rsp+298h] [rbp-58h]
  bool v22; // [rsp+29Fh] [rbp-51h]
  __int64 v23; // [rsp+2A0h] [rbp-50h]
  bool v24; // [rsp+2AFh] [rbp-41h]
  __int64 v25; // [rsp+2B0h] [rbp-40h]
  __int64 v26; // [rsp+2B8h] [rbp-38h]
  __int64 v27; // [rsp+2C0h] [rbp-30h]
  __int64 v28; // [rsp+2C8h] [rbp-28h]
  int v29; // [rsp+2D0h] [rbp-20h]
  int v30; // [rsp+2D4h] [rbp-1Ch]
  char *v31; // [rsp+2D8h] [rbp-18h]
  int v32; // [rsp+2E0h] [rbp-10h]
  int v33; // [rsp+2E4h] [rbp-Ch]
  bool v34; // [rsp+2EBh] [rbp-5h]

  v10 = 0;
  memset(s, 0, 0x30uLL);
  memset(s1, 0, 0x30uLL);
  printf("Input:", 0LL);
  v11 = s;
  __isoc99_scanf("%s", s);
  for ( i = 0; ; ++i )
  {
    v12 = i;
    v13 = i < 64;
    if ( i >= 64 )
      break;
    v14 = s[i];
    v15 = v14;
    if ( v14 == 10 )
    {
      v16 = &s[i];
      *v16 = 0;
      break;
    }
    v17 = i + 1;
  }
  for ( j = 0; ; ++j )
  {
    v18 = j;
    v19 = j < 6;
    if ( j >= 6 )
      break;
    v20 = s;
    v4 = *(_QWORD *)&s[8 * j];
    for ( k = 0; ; ++k )
    {
      v21 = k;
      v22 = k < 64;
      if ( k >= 64 )
        break;
      v23 = v4;
      v24 = v4 < 0;
      if ( v4 >= 0 )
      {
        v27 = v4;
        v28 = 2 * v4;
        v4 *= 2LL;
      }
      else
      {
        v25 = 2 * v4;
        v26 = 2 * v4;
        v4 = 2 * v4 ^ 0xB0004B7679FA26B3LL;
      }
      v29 = k;
    }
    v30 = 8 * j;
    v31 = &s1[8 * j];
    *(_QWORD *)v31 = v4;
    v32 = j + 1;
  }
  v33 = memcmp(s1, &unk_402170, 0x30uLL);
  v34 = v33 != 0;
  if ( v33 != 0 )
    puts("Wrong!");
  else
    puts("Correct!");
  return v10;
}
```