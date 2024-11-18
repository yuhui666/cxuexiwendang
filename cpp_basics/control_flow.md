# C++ 控制流程

## 条件语句

### if 语句
```cpp
if (condition) {
    // 代码块
} else if (another_condition) {
    // 代码块
} else {
    // 代码块
}
```

### switch 语句
```cpp
switch (expression) {
    case value1:
        // 代码块
        break;
    case value2:
        // 代码块
        break;
    default:
        // 默认代码块
}
```

## 循环语句

### for 循环
```cpp
for (int i = 0; i < 10; i++) {
    // 循环代码块
}

// 基于范围的for循环（C++11）
for (const auto& item : container) {
    // 处理item
}
```

### while 循环
```cpp
while (condition) {
    // 循环代码块
}
```

### do-while 循环
```cpp
do {
    // 循环代码块
} while (condition);
```

## 跳转语句

### break
```cpp
for (int i = 0; i < 10; i++) {
    if (i == 5) break;
    // 当i等于5时跳出循环
}
```

### continue
```cpp
for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) continue;
    // 只处理奇数
}
``` 