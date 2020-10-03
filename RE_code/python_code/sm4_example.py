from pysm4 import encrypt, decrypt
# 明文
clear_num = 0x0123456789abcdeffedcba9876543210
# 密钥
mk = 0x0123456789abcdeffedcba9876543210
# 加密
cipher_num = encrypt(clear_num, mk)
cipher_num1 = hex(cipher_num)[2:].replace('L', '')
print(cipher_num1)
# '681edf34d206965e86b3e94f536e4246'
# 解密
clear_num == decrypt(cipher_num, mk)
print(hex(clear_num))
