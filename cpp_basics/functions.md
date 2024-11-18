# C++ 函数

## 函数基础

### 函数声明与定义
```cpp
// 函数声明
int add(int a, int b);

// 函数定义
int add(int a, int b) {
    return a + b;
}
```

### 函数参数
```cpp
// 值传递
void setValue(int x) {
    x = 100;  // 不会改变原始值
}

// 引用传递
void setValueByRef(int& x) {
    x = 100;  // 会改变原始值
}

// 常量引用
void printValue(const int& x) {
    cout << x;  // 不能修改x的值
}
```

## 函数重载
```cpp
int add(int a, int b) {
    return a + b;
}

double add(double a, double b) {
    return a + b;
}

int add(int a, int b, int c) {
    return a + b + c;
}
```

## 默认参数
```cpp
void printMessage(string msg = "Hello", int times = 1) {
    for(int i = 0; i < times; i++) {
        cout << msg << endl;
    }
}
```

## 函数模板
```cpp
template <typename T>
T maximum(T a, T b) {
    return (a > b) ? a : b;
}
``` 