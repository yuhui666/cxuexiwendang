# C语言条件语句详解：if-else 和 switch

## 1. if 语句基础教程

### 1.1 if 语句的基本形式

#### 基本语法
```cpp
if (条件) {
    // 条件为真时执行的代码
}
```

#### 示例
```cpp
int age = 18;
if (age >= 18) {
    printf("您已成年\n");
}
```

### 1.2 if-else 语句

#### 基本语法
```cpp
if (条件) {
    // 条件为真时执行的代码
} else {
    // 条件为假时执行的代码
}
```

#### 示例
```cpp
int score = 75;
if (score >= 60) {
    printf("及格\n");
} else {
    printf("不及格\n");
}
```

### 1.3 if-else if-else 语句

#### 基本语法
```cpp
if (条件1) {
    // 条件1为真时执行
} else if (条件2) {
    // 条件2为真时执行
} else {
    // 所有条件都为假时执行
}
```

#### 示例
```cpp
int score = 85;
if (score >= 90) {
    printf("优秀\n");
} else if (score >= 80) {
    printf("良好\n");
} else if (score >= 60) {
    printf("及格\n");
} else {
    printf("不及格\n");
}
```

## 2. switch 语句

### 2.1 基本语法
```cpp
switch (表达式) {
    case 常量1:
        语句1;
        break;
    case 常量2:
        语句2;
        break;
    default:
        默认语句;
}
```

### 2.2 示例
```cpp
int day = 1;
switch (day) {
    case 1:
        printf("星期一\n");
        break;
    case 2:
        printf("星期二\n");
        break;
    // ... 其他case
    default:
        printf("输入错误\n");
}
```

### 2.3 注意事项
- switch 只能用于整型或字符型表达式
- case 标签必须是常量表达式
- break 语句用于跳出 switch
- default 子句是可选的

## 3. if-else 和 switch 的选择

### 3.1 使用 if-else 的场景
- 条件是范围判断
- 条件是布尔表达式
- 条件较少时

### 3.2 使用 switch 的场景
- 条件是等值判断
- 条件较多时
- 需要提高代码可读性时