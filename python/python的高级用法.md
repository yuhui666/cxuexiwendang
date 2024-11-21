# Python 高级用法

Python不仅提供了简单易用的基础语法，还支持许多高级特性，以下是一些常用的高级用法及其示例代码。

## 1. 列表推导式

列表推导式是一种简洁的创建列表的方式，支持条件过滤和嵌套。

```python
# 创建一个包含平方数的列表
squares = [x**2 for x in range(10)]  # 生成0到9的平方数列表

# 带条件的列表推导式
even_squares = [x**2 for x in range(10) if x % 2 == 0]  # 生成偶数的平方

# 嵌套列表推导式
matrix = [[i + j for j in range(3)] for i in range(3)]  # 生成3x3矩阵
```

## 2. 生成器表达式

生成器表达式用于创建生成器对象，节省内存。

```python
# 创建一个生成器对象
gen = (x**2 for x in range(10))  # 生成0到9的平方数生成器

# 迭代生成器
for num in gen:
    print(num)  # 打印每个平方数
```

## 3. 装饰器

装饰器用于在不修改原函数的情况下，扩展函数的功能。

```python
# 定义一个简单的装饰器
def my_decorator(func):
    def wrapper():
        print("函数开始执行")
        func()
        print("函数执行结束")
    return wrapper

# 使用装饰器
@my_decorator
def say_hello():
    print("Hello, World!")

# 调用函数
say_hello()  # 输出装饰器的效果
```

## 4. 上下文管理器

上下文管理器用于管理资源的获取和释放，常用于文件操作。

```python
# 使用with语句打开文件
with open('file.txt', 'w') as f:
    f.write('Hello, World!')  # 自动管理文件的打开和关闭
```

## 5. 多线程

多线程用于并发执行任务，提高程序的效率。

```python
import threading  # 导入线程模块

# 定义一个简单的线程函数
def print_numbers():
    for i in range(5):
        print(i)

# 创建线程
thread = threading.Thread(target=print_numbers)

# 启动线程
thread.start()

# 等待线程完成
thread.join()
```

## 6. 正则表达式

正则表达式用于字符串的模式匹配和处理。

```python
import re  # 导入正则表达式模块

# 定义一个正则表达式模式
pattern = r'\d+'  # 匹配一个或多个数字

# 搜索字符串
result = re.findall(pattern, 'There are 123 apples and 456 oranges.')
print(result)  # 输出匹配的数字列表
```

## 7. 数据类

数据类用于简化类的定义，自动生成常用方法。

```python
from dataclasses import dataclass  # 导入数据类模块

# 定义一个数据类
@dataclass
class Point:
    x: int
    y: int

# 创建数据类实例
p = Point(1, 2)
print(p)  # 输出Point(x=1, y=2)
```

## 8. 异步编程

异步编程用于处理I/O密集型任务，提高程序的响应速度。

```python
import asyncio  # 导入异步模块

# 定义一个异步函数
async def say_hello():
    print("Hello")
    await asyncio.sleep(1)  # 模拟异步操作
    print("World")

# 运行异步函数
asyncio.run(say_hello())
```

这个文档介绍了一些Python的高级用法及其基本示例。希望对你有帮助！