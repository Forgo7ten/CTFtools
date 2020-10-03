# uncompyle6

uncompyle6可将python字节码转换回等效的python源代码

- 安装
	```bash
	pip install uncompyle6
	```

- 使用
	例如有一个pcat.pyc，想反编译输出文件为pcat.py
	```
	uncompyle6 -o pcat.py pcat.pyc
	```

github项目：https://github.com/rocky/python-uncompyle6