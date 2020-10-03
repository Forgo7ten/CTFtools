> 原帖地址：https://www.52pojie.cn/thread-1102117-1-1.html

# Py_decompiling

将python编译成的exe文件反编译为py文件

1. uncompyle6

   将pyc反编译为py文件

2. `archive_viewer.py`文件

   将exe反编译为pyc文件

   使用方法 cmd命令

   ```bash
   python archive_viewer.py [filename]
   ```

3. `pyinstxtractor.py`文件

   将exe反编译为pyc文件

## 使用步骤

以文件`SUN.exe`为例

### 将exe反编译

使用`pyinstxtractor.py`将exe文件反编译
将`pyinstxtractor.py`放入exe所在目录。
使用方法：cmd窗口输入：
```bash
python pyinstxtractor.py [filename]
```
如例子：

![1](README.img/1.png)

反汇编的文件夹存放在同目录下`[filename]_extracted`目录中

### 修改使之符合pyc文件pe头

进入`[filename]_extracted`目录

![image-20200212143256005](README.img/2.png)

找到这两个文件，使用winhex打开，（以SUN.exe为例）

![image-20200212143555066](README.img/3.png)

找到[filename]文件最开头的一字节。

![image-20200212143655134](README.img/4.png)

找到struct与之相同的一字节。
将struct前面的复制粘贴到[filename]的文件头（此文件是前8字节）

![image-20200212144008747](README.img/5.png)

![image-20200212143903625](README.img/6.png)

粘贴完之后

![image-20200212144159920](README.img/7.png)

然后使用Winhex将[filename]另存为pyc文件（手动添加.pyc后缀）

（以上步骤仅反编译主py文件。多个py文件，多余的pyc文件在`[filename]_extracted`目录的`PYZ-00.pyz_extracted`目录里）

### 使用uncompyle6将其反编译为py文件