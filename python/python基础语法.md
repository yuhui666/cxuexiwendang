# Python 基础语法详解

## 1. 基础概念

### 1.1 注释
Python中的注释有两种形式：
- 单行注释：使用 `#` 
- 多行注释：使用 `'''` 或 `"""`

```python
# 这是单行注释 - 用于简短的说明

'''
这是多行注释
适用于较长的说明文档
可以跨越多行
'''

"""
这也是多行注释
通常用于函数或类的文档字符串(docstring)
可以使用help()函数查看
"""
```

### 1.2 变量与数据类型

#### 1.2.1 变量命名规则
- 变量名只能包含字母、数字和下划线
- 不能以数字开头
- 不能使用Python关键字
- 区分大小写

```python
# 正确的变量命名
user_name = "张三"     # 使用下划线连接多个单词（推荐）
userName = "李四"      # 使用驼峰命名法
_private = "私有变量"   # 下划线开头表示私有变量

# 错误的变量命名
# 2name = "错误"      # 不能以数字开头
# my-name = "错误"    # 不能包含特殊字符
```

#### 1.2.2 基本数据类型
```python
# 整数类型 (int)
age = 25  # 表示年龄的整数

# 浮点数类型 (float)
price = 19.99  # 商品价格

# 字符串类型 (str)
name = "Python"  # 编程语言名称

# 布尔类型 (bool)
is_valid = True  # 表示有效状态

# 空值 (None)
empty = None  # 表示空值或未定义
```

#### 1.2.3 类型转换
```python
# 字符串转整数
str_num = "100"
num = int(str_num)  # 将字符串"100"转换为整数100

# 整数转字符串
number = 200
str_number = str(number)  # 将整数200转换为字符串"200"

# 字符串转浮点数
str_float = "3.14"
float_num = float(str_float)  # 将字符串"3.14"转换为浮点数3.14
```

## 2. 运算符

### 2.1 算术运算符
```python
# 加法
result = 5 + 3  # 结果: 8

# 减法
result = 10 - 4  # 结果: 6

# 乘法
result = 4 * 3  # 结果: 12

# 除法（返回浮点数）
result = 10 / 3  # 结果: 3.3333...

# 整除（返回整数）
result = 10 // 3  # 结果: 3

# 取余
result = 10 % 3  # 结果: 1

# 幂运算
result = 2 ** 3  # 结果: 8
```

### 2.2 比较运算符
```python
# 等于
5 == 5  # True

# 不等于
5 != 3  # True

# 大于
5 > 3  # True

# 小于
3 < 5  # True

# 大于等于
5 >= 5  # True

# 小于等于
3 <= 5  # True
```

### 2.3 逻辑运算符
```python
# 与运算 (and)
True and True  # True
True and False  # False

# 或运算 (or)
True or False  # True
False or False  # False

# 非运算 (not)
not True  # False
not False  # True
```

## 3. 控制流

### 3.1 条件语句
```python
# if 语句
age = 18
if age >= 18:
    print("成年人")  # 如果年龄大于等于18，输出"成年人"
elif age >= 12:
    print("青少年")  # 如果年龄大于等于12但小于18，输出"青少年"
else:
    print("儿童")  # 否则，输出"儿童"

# 条件表达式（三元运算符）
result = "成年" if age >= 18 else "未成年"  # 根据条件选择结果
```

### 3.2 循环语句

#### 3.2.1 while 循环
```python
# 基本while循环
count = 0
while count < 5:
    print(count)  # 输出当前计数
    count += 1  # 计数加1

# 带break的while循环
while True:
    if count >= 5:
        break  # 如果计数大于等于5，跳出循环
    print(count)
    count += 1
```

#### 3.2.2 for 循环
```python
# 遍历列表
fruits = ["苹果", "香蕉", "橙子"]
for fruit in fruits:
    print(fruit)  # 输出每个水果名称

# 使用range()
for i in range(5):  # 0到4
    print(i)  # 输出0到4

# 带步长的range()
for i in range(0, 10, 2):  # 0, 2, 4, 6, 8
    print(i)
```

## 4. 函数

### 4.1 函数定义和调用
```python
# 基本函数定义
def greet(name):
    """这是函数的文档字符串，用于说明函数功能"""
    return f"你好，{name}！"

# 调用函数
message = greet("张三")

# 带默认参数的函数
def greet_with_title(name, title="先生"):
    return f"你好，{title}{name}！"

# 可变参数
def sum_numbers(*args):
    return sum(args)

# 关键字参数
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")
```

### 4.2 lambda 函数
```python
# 简单的lambda函数
square = lambda x: x ** 2

# 带多个参数的lambda函数
add = lambda x, y: x + y
```

## 5. 异常处理

### 5.1 try-except 结构
```python
# 基本异常处理
try:
    number = int("abc")
except ValueError:
    print("无法将字符串转换为数字")

# 处理多个异常
try:
    result = 10 / 0
except ZeroDivisionError:
    print("除数不能为零")
except Exception as e:
    print(f"发生错误：{e}")
finally:
    print("这部分总是会执行")

# 自定义异常
class CustomError(Exception):
    pass

try:
    raise CustomError("这是自定义错误")
except CustomError as e:
    print(e)
```

## 6. 文件操作

### 6.1 读写文件
```python
# 读取文件
with open('file.txt', 'r', encoding='utf-8') as f:
    content = f.read()    # 读取全部内容
    lines = f.readlines()    # 读取所有行

# 写入文件
with open('file.txt', 'w', encoding='utf-8') as f:
    f.write('Hello, World!')    # 写入字符串
    f.writelines(['行1\n', '行2\n'])    # 写入多行
```

## 7. 模块和包

### 7.1 模块导入
```python
# 导入整个模块
import math

# 导入特定函数
from math import sqrt

# 导入并重命名
import math as m

# 导入多个函数
from math import sin, cos, tan
```

### 7.2 包管理
```python
# 创建包（需要创建__init__.py文件）
my_package/
    __init__.py
    module1.py
    module2.py

# 导入包中的模块
from my_package import module1
```