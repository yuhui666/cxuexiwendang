# Python排序详解

## 1. 内置排序方法

### sort() 方法
- 用于列表的原地排序
- 直接修改原列表，不返回新列表

```python
# 基本排序
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
numbers.sort()                    # 对列表进行升序排序
print(numbers)                    # 输出: [1, 1, 2, 3, 4, 5, 6, 9]

# 降序排序
numbers.sort(reverse=True)        # reverse=True 表示降序排序
print(numbers)                    # 输出: [9, 6, 5, 4, 3, 2, 1, 1]

# 自定义排序
words = ['banana', 'pie', 'Apple', 'cherry']
words.sort(key=str.lower)        # 忽略大小写排序
print(words)                     # 输出: ['Apple', 'banana', 'cherry', 'pie']
```

### sorted() 函数
- 返回新的排序列表
- 不修改原序列
- 可用于任何可迭代对象

```python
# 基本用法
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
sorted_numbers = sorted(numbers)  # 创建新的排序列表
print(numbers)                   # 原列表不变
print(sorted_numbers)            # 输出排序后的新列表

# 对字符串排序
text = "Hello World"
sorted_text = sorted(text)       # 将字符串转换为排序后的字符列表
print(''.join(sorted_text))      # 重新组合为字符串

# 对元组排序
points = [(1, 5), (2, 3), (1, 2)]
sorted_points = sorted(points)    # 按照元组的第一个元素，然后是第二个元素排序
```

## 2. 自定义排序

### 使用 key 函数

```python
# 按字符串长度排序
words = ['python', 'java', 'c++', 'javascript']
sorted_by_length = sorted(words, key=len)  # 使用len函数作为key
print(sorted_by_length)          # 输出: ['c++', 'java', 'python', 'javascript']

# 按字典值排序
students = [
    {'name': 'Alice', 'grade': 95},
    {'name': 'Bob', 'grade': 75},
    {'name': 'Charlie', 'grade': 85}
]
# 使用lambda函数按grade排序
sorted_students = sorted(students, key=lambda x: x['grade'], reverse=True)

# 使用operator模块
from operator import itemgetter
sorted_by_name = sorted(students, key=itemgetter('name'))  # 按name排序
```

### 多级排序

```python
# 使用元组作为key
data = [('Alice', 25), ('Bob', 20), ('Charlie', 25)]
# 先按年龄升序，再按姓名升序
sorted_data = sorted(data, key=lambda x: (x[1], x[0]))

# 使用attrgetter排序对象
from operator import attrgetter

class Student:
    def __init__(self, name, grade, age):
        self.name = name
        self.grade = grade
        self.age = age

students = [
    Student('Alice', 95, 20),
    Student('Bob', 85, 19),
    Student('Charlie', 95, 18)
]

# 先按成绩降序，再按年龄升序
sorted_students = sorted(students, 
                       key=attrgetter('grade', 'age'),
                       reverse=True)
```

## 3. 特殊排序场景

### 稳定排序
```python
# sort()和sorted()都是稳定排序
data = [(1, 'A'), (2, 'B'), (1, 'C')]
# 按第一个元素排序，相同值的相对顺序保持不变
sorted_data = sorted(data, key=lambda x: x[0])  # [(1, 'A'), (1, 'C'), (2, 'B')]
```

### 自定义比较（Python 2 风格，不推荐）
```python
class CustomString:
    def __init__(self, string):
        self.string = string
    
    def __lt__(self, other):     # 定义小于比较
        return len(self.string) < len(other.string)
    
    def __str__(self):           # 字符串表示
        return self.string

# 使用自定义比较
strings = [CustomString("aaa"), CustomString("b"), CustomString("cc")]
sorted_strings = sorted(strings)  # 按字符串长度排序
```

## 4. 高级排序技巧

### 部分排序
```python
# 获取最大/最小的N个元素
import heapq

numbers = [3, 1, 4, 1, 5, 9, 2, 6]
# 获取最大的3个数
largest = heapq.nlargest(3, numbers)  # [9, 6, 5]
# 获取最小的3个数
smallest = heapq.nsmallest(3, numbers)  # [1, 1, 2]
```

### 按多个条件排序
```python
from operator import itemgetter

# 复杂数据结构排序
records = [
    ('Math', 'A', 95),
    ('Physics', 'B', 85),
    ('Math', 'B', 90),
    ('Physics', 'A', 95)
]

# 先按科目，再按等级，最后按分数
sorted_records = sorted(records, 
                      key=itemgetter(0, 1, 2))  # 使用多个键排序
```

## 5. 性能考虑

```python
# 避免多次计算key
names = ['john', 'alice', 'bob', 'charlie']

# 低效方式
sorted_names = sorted(names, key=lambda x: expensive_function(x))

# 更高效的方式
decorated = [(expensive_function(x), x) for x in names]  # 预计算key
decorated.sort()                  # 排序
result = [x for _, x in decorated]  # 提取排序后的值
```

## 最佳实践

1. 选择合适的排序方法
   - 需要原地排序用 sort()
   - 需要新列表用 sorted()
   - 需要部分排序用 heapq

2. 性能优化
   - 避免在 key 函数中进行复杂计算
   - 对于大数据集合考虑使用装饰器模式
   - 合理使用 reverse 参数

3. 代码可读性
   - 使用有意义的 key 函数
   - 适当添加注释说明排序逻辑
   - 考虑使用 operator 模块的工具函数

4. 注意事项
   - 确保排序的稳定性要求
   - 注意不同Python版本的差异
   - 考虑内存使用效率
