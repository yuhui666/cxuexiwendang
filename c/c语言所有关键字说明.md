# C语言关键字详解

## 1. 数据类型关键字

### 1.1 基本数据类型
```c
void        // 空类型
char        // 字符型，1字节
short       // 短整型，通常2字节
int         // 整型，通常4字节
long        // 长整型，通常4或8字节
float       // 单精度浮点型，4字节
double      // 双精度浮点型，8字节
```

### 1.2 类型修饰符
```c
signed      // 有符号类型
unsigned    // 无符号类型
const       // 常量
volatile    // 易变的，告诉编译器不要优化
```

## 2. 控制流程关键字

### 2.1 条件判断
```c
if          // 条件语句
else        // if的替代分支
switch      // 开关语句
case        // switch的分支标签
default     // switch的默认分支
```

### 2.2 循环控制
```c
for         // for循环
while       // while循环
do          // do-while循环的开始
continue    // 继续下一次循环
break       // 跳出循环或switch语句
```

## 3. 存储类关键字

### 3.1 作用域和生命周期
```c
auto        // 自动存储，局部变量默认值
static      // 静态存储
extern      // 外部变量声明
register    // 寄存器存储（建议性）
```

## 4. 结构相关关键字

### 4.1 复合类型
```c
struct      // 结构体
union       // 联合体
enum        // 枚举类型
typedef     // 类型定义
```

## 5. 其他关键字

### 5.1 大小和偏移
```c
sizeof      // 获取类型或变量的大小
```

### 5.2 跳转
```c
goto        // 无条件跳转
return      // 函数返回
```

## 6. 关键字使用示例

### 6.1 数据类型示例
```c
// 基本数据类型使用
int count = 10;
char ch = 'A';
float price = 99.99f;
double pi = 3.14159;

// 类型修饰符使用
unsigned int age = 25;
const double TAX_RATE = 0.17;
volatile int sensor_data;
```

### 6.2 控制流程示例
```c
// if-else 示例
if (score >= 60) {
    printf("及格\n");
} else {
    printf("不及格\n");
}

// switch 示例
switch (grade) {
    case 'A': printf("优秀\n"); break;
    case 'B': printf("良好\n"); break;
    default: printf("其他\n");
}

// 循环示例
for (int i = 0; i < 10; i++) {
    if (i == 5) continue;
    printf("%d ", i);
}
```

### 6.3 存储类示例
```c
// static 示例
static int counter = 0;

// extern 示例
extern int global_var;

// register 示例
register int fast_counter;
```

### 6.4 结构示例
```c
// struct 示例
struct Person {
    char name[50];
    int age;
};

// union 示例
union Data {
    int i;
    float f;
    char str[20];
};

// enum 示例
enum Days {
    MON, TUE, WED, THU, FRI, SAT, SUN
};

// typedef 示例
typedef unsigned long ulong;
```

## 7. 注意事项

1. 关键字不能用作标识符（变量名、函数名等）
2. 关键字是大小写敏感的，都是小写
3. 不同编译器可能支持一些额外的关键字
4. C99和C11标准增加了一些新的关键字
5. 使用关键字时要注意其具体的作用域和生命周期

## 8. 最佳实践

1. 合理使用const来保护数据
2. 谨慎使用goto，可能导致代码难以维护
3. 适当使用static来控制变量的作用域
4. 理解volatile的正确使用场景
5. 注意sizeof运算符的使用陷阱
