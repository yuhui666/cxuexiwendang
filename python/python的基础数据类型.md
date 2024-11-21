# Python基础数据类型详解

Python有几种基本的数据类型，每种类型都有其特定的用途和特性。

## 1. 数值类型

### 整数 (int)
- 表示整数值，可以是正数、负数或零
- Python3中的整数没有大小限制

```python
# 定义一个普通整数
x = 42                  # 正整数赋值
y = -10                 # 负整数赋值
z = 0                   # 零值赋值

# 使用不同进制表示整数
binary = 0b1010         # 二进制表示：等于十进制的10
octal = 0o17           # 八进制表示：等于十进制的15
hexadecimal = 0xFF     # 十六进制表示：等于十进制的255

# 大数运算
big_number = 1_000_000  # 使用下划线使大数更易读
```

### 浮点数 (float)
- 表示带小数点的数值
- 可以使用科学计数法表示

```python
# 基本浮点数
pi = 3.14159           # 普通小数表示
e = 2.71828            # 另一个小数示例

# 科学计数法
speed_of_light = 3e8   # 3 x 10^8，表示光速
plancks_constant = 6.626e-34  # 表示普朗克常数

# 浮点数运算
result = 1.0 / 3.0     # 结果是0.3333333333333333
```

### 复数 (complex)
- 包含实部和虚部的数值
- 虚部用j或J表示

```python
# 定义复数
z1 = 3 + 4j           # 创建一个复数：实部3，虚部4
z2 = complex(1, 2)    # 使用complex()函数创建：实部1，虚部2

# 复数运算
sum_z = z1 + z2       # 复数加法
prod_z = z1 * z2      # 复数乘法

# 获取复数的部分
real_part = z1.real   # 获取实部：3.0
imag_part = z1.imag   # 获取虚部：4.0
```

## 2. 序列类型

### 字符串 (str)
- 用于表示文本数据
- 不可变序列类型

```python
# 字符串创建
name = "Python"        # 双引号字符串
message = 'Hello'      # 单引号字符串
multi_line = """
这是多行
字符串
"""                    # 三引号用于多行字符串

# 字符串操作
greeting = "Hello" + " " + "World"  # 字符串拼接
repeat = "Python" * 3               # 重复字符串：PythonPythonPython

# 字符串切片
text = "Python Programming"
first_word = text[:6]    # 获取前6个字符：Python
last_word = text[7:]     # 获取第7个字符之后的内容：Programming
```

### 列表 (list)
- 可变序列类型
- 可以包含不同类型的元素

```python
# 创建列表
numbers = [1, 2, 3, 4, 5]          # 数字列表
mixed = [1, "hello", 3.14, True]   # 混合类型列表
nested = [1, [2, 3], [4, 5, 6]]    # 嵌套列表

# 列表操作
numbers.append(6)      # 添加元素到末尾
numbers.insert(0, 0)   # 在索引0处插入元素
numbers.remove(3)      # 删除第一个值为3的元素
popped = numbers.pop() # 移除并返回最后一个元素

# 列表切片和修改
subset = numbers[1:4]  # 获取索引1到3的元素
numbers[0] = 99        # 修改第一个元素
```

### 元组 (tuple)
- 不可变序列类型
- 通常用于存储相关的数据项

```python
# 创建元组
point = (3, 4)                # 二维坐标点
rgb = (255, 128, 0)          # RGB颜色值
single = (1,)                # 单元素元组，注意逗号

# 元组解包
x, y = point                 # 解包坐标点
r, g, b = rgb               # 解包RGB值

# 元组操作
length = len(point)         # 获取元组长度
index = rgb.index(128)      # 获取元素128的索引
count = rgb.count(255)      # 计算255出现的次数
```

## 3. 映射类型

### 字典 (dict)
- 键值对的集合
- 键必须是不可变类型

```python
# 创建字典
person = {
    "name": "Alice",        # 字符串键
    "age": 25,             # 数字值
    "is_student": True     # 布尔值
}

# 字典操作
person["city"] = "Beijing"  # 添加新键值对
del person["age"]          # 删除键值对
age = person.get("age", 0)  # 安全获取值，不存在返回默认值

# 字典方法
keys = person.keys()       # 获取所有键
values = person.values()   # 获取所有值
items = person.items()     # 获取所有键值对
```

## 4. 集合类型

### 集合 (set)
- 无序不重复元素的集合
- 元素必须是不可变类型

```python
# 创建集合
numbers = {1, 2, 3, 4, 5}    # 直接创建集合
unique = set([1, 2, 2, 3, 3]) # 从列表创建集合，自动去重

# 集合操作
numbers.add(6)               # 添加单个元素
numbers.update([7, 8, 9])    # 添加多个元素
numbers.remove(1)            # 删除元素（不存在会报错）
numbers.discard(10)          # 安全删除元素（不存在不报错）

# 集合运算
set1 = {1, 2, 3}
set2 = {3, 4, 5}
union = set1 | set2         # 并集：{1, 2, 3, 4, 5}
intersect = set1 & set2     # 交集：{3}
diff = set1 - set2          # 差集：{1, 2}
```

## 5. 布尔类型 (bool)

```python
# 布尔值
is_valid = True             # 真值
is_empty = False           # 假值

# 比较运算
result1 = 5 > 3            # True
result2 = 10 == 20         # False

# 逻辑运算
and_result = True and False # False
or_result = True or False   # True
not_result = not True      # False
```

## 6. 空值类型 (None)

```python
# None类型使用
value = None              # 表示空值或未定义

# None的判断
is_none = value is None   # 正确的None判断方式
not_none = value is not None  # 判断不为None
```

## 类型转换

```python
# 字符串转换
str_num = str(42)         # 整数转字符串：'42'
str_float = str(3.14)     # 浮点数转字符串：'3.14'

# 数值转换
int_str = int("42")       # 字符串转整数：42
float_str = float("3.14") # 字符串转浮点数：3.14

# 容器类型转换
list_str = list("Python") # 字符串转列表：['P', 'y', 't', 'h', 'o', 'n']
tuple_list = tuple([1, 2, 3]) # 列表转元组：(1, 2, 3)
set_list = set([1, 2, 2, 3])  # 列表转集合：{1, 2, 3}
```

## 注意事项

1. 数据类型的选择
   - 根据数据的特性选择合适的类型
   - 考虑可变性需求
   - 注意性能影响

2. 类型转换注意事项
   - 确保转换的合理性
   - 处理可能的转换异常
   - 注意精度损失

3. 最佳实践
   - 使用类型提示增加代码可读性
   - 合理使用内置函数
   - 注意内存使用效率
