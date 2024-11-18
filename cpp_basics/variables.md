# C++ 变量和数据类型

## 基本数据类型

### 整数类型
- `int`: 通常为4字节，范围 -2^31 ~ 2^31-1
- `short`: 通常为2字节，范围 -32,768 ~ 32,767
- `long`: 至少4字节
- `long long`: 至少8字节
- `unsigned`: 用于声明无符号整数类型

示例：
```cpp
int number = 42;
unsigned int positiveNumber = 100;
long long bigNumber = 1234567890LL;
```

### 浮点类型
- `float`: 单精度浮点数，4字节
- `double`: 双精度浮点数，8字节
- `long double`: 扩展精度浮点数

示例：
```cpp
float pi = 3.14159f;
double precise = 3.14159265359;
```

### 字符类型
- `char`: 1字节，用于存储单个字符
- `wchar_t`: 宽字符类型

示例：
```cpp
char letter = 'A';
wchar_t wideChar = L'世';
```

### 布尔类型
- `bool`: 表示true或false

示例：
```cpp
bool isValid = true;
bool isEmpty = false;
```

## 变量声明与初始化

### 变量声明
```cpp
int age;           // 声明变量
int count = 0;     // 声明并初始化
```

### 常量声明
```cpp
const double PI = 3.14159;  // 常量声明
#define MAX_SIZE 100        // 宏定义常量
```

## 类型转换

### 隐式转换
```cpp
int x = 10;
double y = x;    // int 自动转换为 double
```

### 显式转换
```cpp
double pi = 3.14159;
int intPi = (int)pi;           // C风格转换
int modernPi = static_cast<int>(pi);  // 现代C++转换