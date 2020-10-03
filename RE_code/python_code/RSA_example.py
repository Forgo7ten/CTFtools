import gmpy2
N = 103461035900816914121390101299049044413950405173712170434161686539878160984549
E = 65537
p = 282164587459512124844245113950593348271
q = 366669102002966856876605669837014229419
L = (p-1)*(q-1)
D = int(gmpy2.invert(E, L)) 
'''
gmpy2.invert()返回值类型为<class 'mpz'>
invert(x,y)  计算 x 关于1模 y 的乘法逆元
'''
enstr = 0xad939ff59f6e70bcbfad406f2494993757eee98b91bc244184a377520d06fc35
destr = gmpy2.powmod(enstr, D, N)
'''
gmpy2.powmod()返回值类型为<class 'mpz'>
gmpy2.powmod(x,y,z)，计算x^y mod z 的值并返回
'''
flag0 = hex(destr)[2:]     # flag0类型为str，存的是十六进制表示的字符串
flag1 = bytes.fromhex(flag0)  # 将其从十六进制转换为byte类型(此时已解释成字符)
flag = str(flag1, 'utf-8')  # 将byte类型转换为str类型
print(flag)
