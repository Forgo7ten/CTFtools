from hashlib import md5
text='flag'
m=md5() # 创建md5对象
# Tips
# 此处必须encode
# 若写法为m.update(str)  报错为： Unicode-objects must be encoded before hashing
# 因为python3里默认的str是unicode
# 或者 b = bytes(str, encoding='utf-8')，作用相同，都是encode为bytes
m.update(text.encode('utf-8'))
result = m.hexdigest()
print(result)