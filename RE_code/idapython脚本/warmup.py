#coding:utf-8

judge=0x600B00
for i in range(182):
    addr=0x600B00+i
    byte=get_bytes(addr,1)#获取指定地址的指定字节数
    byte=ord(byte)^0xC
    patch_byte(addr,byte)#打patch修改字节