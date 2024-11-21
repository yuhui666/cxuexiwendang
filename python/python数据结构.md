# Python数据结构详解

## 1. 列表 (List)

### 基本操作
```python
# 创建列表
numbers = [1, 2, 3, 4, 5]        # 创建一个数字列表
mixed = [1, "hello", 3.14]       # 创建混合类型列表

# 访问元素
first = numbers[0]               # 获取第一个元素
last = numbers[-1]              # 获取最后一个元素
subset = numbers[1:4]           # 切片：获取索引1到3的元素

# 修改元素
numbers[0] = 10                 # 修改第一个元素
numbers[1:3] = [20, 30]         # 修改一段元素

# 列表方法
numbers.append(6)               # 在末尾添加元素
numbers.insert(0, 0)           # 在指定位置插入元素
numbers.extend([7, 8, 9])      # 扩展列表
numbers.remove(5)              # 删除第一个值为5的元素
popped = numbers.pop()         # 移除并返回最后一个元素
numbers.sort()                 # 排序（原地修改）
numbers.reverse()              # 反转列表
```

### 列表推导式
```python
# 基本列表推导式
squares = [x**2 for x in range(10)]          # 生成平方数列表

# 带条件的列表推导式
even_squares = [x**2 for x in range(10) if x % 2 == 0]  # 生成偶数的平方

# 嵌套列表推导式
matrix = [[i+j for j in range(3)] for i in range(3)]    # 生成3x3矩阵
```

## 2. 元组 (Tuple)

### 基本操作
```python
# 创建元组
point = (3, 4)                  # 创建一个坐标点元组
single = (1,)                   # 创建单元素元组（注意逗号）

# 元组解包
x, y = point                    # 解包坐标点
a, *rest = (1, 2, 3, 4)        # 扩展解包

# 元组方法
index = point.index(3)          # 查找元素3的索引
count = point.count(3)          # 计算元素3出现的次数
```

## 3. 字典 (Dictionary)

### 基本操作
```python
# 创建字典
person = {
    'name': 'Alice',            # 创建键值对
    'age': 25,                  # 数字类型的值
    'skills': ['Python', 'Java'] # 列表类型的值
}

# 访问和修改
name = person['name']           # 通过键访问值
person['age'] = 26             # 修改值
person['city'] = 'Beijing'     # 添加新键值对

# 字典方法
keys = person.keys()            # 获取所有键
values = person.values()        # 获取所有值
items = person.items()          # 获取所有键值对
value = person.get('phone', 'NA') # 安全获取值，不存在返回默认值
person.update({'phone': '123'})  # 更新或添加多个键值对
```

### 字典推导式
```python
# 基本字典推导式
squares = {x: x**2 for x in range(5)}        # 创建数字及其平方的映射

# 条件字典推导式
even_squares = {x: x**2 for x in range(5) if x % 2 == 0}  # 仅偶数的平方
```

## 4. 集合 (Set)

### 基本操作
```python
# 创建集合
numbers = {1, 2, 3, 4, 5}       # 直接创建集合
unique = set([1, 2, 2, 3, 3])   # 从列表创建集合（自动去重）

# 集合操作
numbers.add(6)                  # 添加单个元素
numbers.update([7, 8, 9])       # 添加多个元素
numbers.remove(1)               # 删除元素（不存在会报错）
numbers.discard(10)             # 安全删除元素（不存在不报错）
```

### 集合运算
```python
# 集合运算示例
set1 = {1, 2, 3}
set2 = {3, 4, 5}

union = set1 | set2             # 并集：{1, 2, 3, 4, 5}
intersection = set1 & set2      # 交集：{3}
difference = set1 - set2        # 差集：{1, 2}
sym_diff = set1 ^ set2          # 对称差集：{1, 2, 4, 5}
```

## 5. 栈和队列

### 使用列表实现栈
```python
# 栈的实现
stack = []                      # 创建空栈
stack.append(1)                 # 压栈操作
stack.append(2)                 # 继续压栈
top = stack.pop()              # 出栈操作（返回并删除顶部元素）
```

### 使用collections.deque实现队列
```python
from collections import deque

# 创建和操作队列
queue = deque()                 # 创建空队列
queue.append(1)                 # 入队操作
queue.append(2)                 # 继续入队
first = queue.popleft()         # 出队操作（返回并删除首个元素）
```

## 6. 堆（优先队列）

```python
import heapq

# 创建和操作堆
heap = []                       # 创建空堆
heapq.heappush(heap, 4)        # 添加元素
heapq.heappush(heap, 1)        # 添加更多元素
heapq.heappush(heap, 3)        # 自动维护堆属性

smallest = heapq.heappop(heap)  # 弹出最小元素
```

## 7. 树结构

### 二叉树实现
```python
class TreeNode:
    def __init__(self, value):
        self.value = value          # 节点值
        self.left = None            # 左子节点
        self.right = None           # 右子节点

# 创建和使用二叉树
root = TreeNode(1)                  # 创建根节点
root.left = TreeNode(2)             # 添加左子节点
root.right = TreeNode(3)            # 添加右子节点
```

## 8. 图结构

### 邻接列表实现
```python
# 使用字典实现图
graph = {
    'A': ['B', 'C'],           # A节点连接到B和C
    'B': ['A', 'D'],           # B节点连接到A和D
    'C': ['A', 'D'],           # C节点连接到A和D
    'D': ['B', 'C']            # D节点连接到B和C
}

# 遍历图的邻居
neighbors = graph['A']          # 获取A的所有邻居节点
```

## 实用技巧

1. 选择合适的数据结构
   - 需要快速查找：使用字典
   - 需要唯一性：使用集合
   - 需要保持顺序：使用列表或元组
   - 需要双端操作：使用deque

2. 性能考虑
   - 列表的append和pop操作是O(1)
   - 字典的键查找是O(1)
   - 集合的成员检测是O(1)
   - 列表的插入和删除是O(n)

3. 内存使用
   - 使用元组代替列表可以节省内存
   - 集合和字典的存储开销较大
   - 大量小对象考虑使用__slots__

## 最佳实践

1. 数据结构的选择
   - 根据实际需求选择合适的数据结构
   - 考虑操作的时间复杂度
   - 注意内存使用效率

2. 代码可读性
   - 使用有意义的变量名
   - 适当添加注释
   - 保持代码整洁

3. 性能优化
   - 避免频繁的列表修改操作
   - 合理使用生成器和迭代器
   - 注意大数据集的处理方式
