# C语言基础题库

## 1. 基础语法题

### 1.1 变量交换
**题目**：编写一个程序，不使用第三个变量，交换两个整数的值。

**答案**：
```c
// 方法一：使用加减法
void swap1(int *a, int *b) {
    *a = *a + *b;      // a中存储两数之和
    *b = *a - *b;      // 从和中减去b得到原来的a
    *a = *a - *b;      // 从和中减去新的b得到新的a
}

// 方法二：使用异或运算
void swap2(int *a, int *b) {
    *a = *a ^ *b;      // a = a^b
    *b = *a ^ *b;      // b = (a^b)^b = a
    *a = *a ^ *b;      // a = (a^b)^a = b
}
```

### 1.2 判断素数
**题目**：编写一个函数判断一个数是否为素数。

**答案**：
```c
// 判断一个数是否为素数
int isPrime(int n) {
    // 处理特殊情况
    if (n <= 1) return 0;    // 1和负数不是素数
    if (n <= 3) return 1;    // 2和3是素数
    
    // 如果能被2或3整除，则不是素数
    if (n % 2 == 0 || n % 3 == 0) return 0;
    
    // 从5开始检查到sqrt(n)，每次增加6
    for (int i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0)
            return 0;
    }
    
    return 1;
}
```

## 2. 数组题

### 2.1 数组逆序
**题目**：编写一个函数将数组元素逆序。

**答案**：
```c
// 将数组元素逆序
void reverseArray(int arr[], int size) {
    int start = 0;              // 数组开始位置
    int end = size - 1;         // 数组结束位置
    
    // 从两端向中间移动，交换元素
    while (start < end) {
        // 交换元素
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        
        // 移动指针
        start++;
        end--;
    }
}
```

### 2.2 查找最大值和最小值
**题目**：编写一个函数找出数组中的最大值和最小值。

**答案**：
```c
// 查找数组中的最大值和最小值
void findMinMax(int arr[], int size, int *min, int *max) {
    // 初始化最大值和最小值为第一个元素
    *min = *max = arr[0];
    
    // 遍历数组其余元素
    for (int i = 1; i < size; i++) {
        if (arr[i] < *min) {
            *min = arr[i];    // 更新最小值
        }
        if (arr[i] > *max) {
            *max = arr[i];    // 更新最大值
        }
    }
}
```

## 3. 字符串题

### 3.1 字符串反转
**题目**：编写一个函数将字符串反转。

**答案**：
```c
// 反转字符串
void reverseString(char *str) {
    int length = strlen(str);    // 获取字符串长度
    int start = 0;              // 开始位置
    int end = length - 1;       // 结束位置
    
    // 从两端向中间移动，交换字符
    while (start < end) {
        // 交换字符
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;
        
        // 移动指针
        start++;
        end--;
    }
}
```

### 3.2 判断回文
**题目**：编写一个函数判断字符串是否为回文。

**答案**：
```c
// 判断字符串是否为回文
int isPalindrome(const char *str) {
    int left = 0;                    // 左指针
    int right = strlen(str) - 1;     // 右指针
    
    // 从两端向中间比较字符
    while (left < right) {
        // 跳过非字母数字字符
        while (left < right && !isalnum(str[left])) left++;
        while (left < right && !isalnum(str[right])) right--;
        
        // 比较字符（忽略大小写）
        if (tolower(str[left]) != tolower(str[right])) {
            return 0;    // 不是回文
        }
        
        left++;
        right--;
    }
    
    return 1;    // 是回文
}
```

## 4. 数学计算题

### 4.1 阶乘计算
**题目**：编写函数计算n的阶乘。

**答案**：
```c
// 使用递归计算阶乘
unsigned long long factorial(int n) {
    // 处理基本情况
    if (n == 0 || n == 1) {
        return 1;
    }
    
    // 递归计算
    return n * factorial(n - 1);
}

// 使用循环计算阶乘（避免递归栈溢出）
unsigned long long factorialIterative(int n) {
    unsigned long long result = 1;
    
    // 从1到n相乘
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    
    return result;
}
```

### 4.2 斐波那契数列
**题目**：生成斐波那契数列的前n个数。

**答案**：
```c
// 生成斐波那契数列
void generateFibonacci(int n, unsigned long long *fib) {
    // 处理前两个数
    if (n >= 1) fib[0] = 0;
    if (n >= 2) fib[1] = 1;
    
    // 生成后续数字
    for (int i = 2; i < n; i++) {
        fib[i] = fib[i-1] + fib[i-2];
    }
}
```

## 5. 位运算题

### 5.1 二进制中1的个数
**题目**：计算一个整数的二进制表示中1的个数。

**答案**：
```c
// 计算二进制中1的个数
int countOnes(unsigned int n) {
    int count = 0;
    
    // 每次消除最右边的1
    while (n) {
        n &= (n - 1);    // Brian Kernighan算法
        count++;
    }
    
    return count;
}
```

### 5.2 判断是否为2的幂
**题目**：判断一个数是否为2的幂。

**答案**：
```c
// 判断是否为2的幂
int isPowerOfTwo(int n) {
    // 2的幂的二进制表示只有一个1
    return n > 0 && !(n & (n - 1));
}
```

## 6. 进制转换题

### 6.1 十进制转二进制
**题目**：将十进制数转换为二进制字符串。

**答案**：
```c
// 十进制转二进制
void decimalToBinary(int n, char *binary) {
    int index = 0;
    
    // 处理0的特殊情况
    if (n == 0) {
        binary[0] = '0';
        binary[1] = '\0';
        return;
    }
    
    // 转换过程
    while (n > 0) {
        binary[index++] = (n % 2) + '0';
        n /= 2;
    }
    binary[index] = '\0';
    
    // 反转字符串
    for (int i = 0; i < index/2; i++) {
        char temp = binary[i];
        binary[i] = binary[index-1-i];
        binary[index-1-i] = temp;
    }
}
```

### 6.2 二进制转十进制
**题目**：将二进制字符串转换为十进制数。

**答案**：
```c
// 二进制转十进制
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int power = 0;
    int len = strlen(binary);
    
    // 从右向左处理每一位
    for (int i = len - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += (1 << power);
        }
        power++;
    }
    
    return decimal;
}
```

## 7. 数组操作题

### 7.1 数组去重
**题目**：删除排序数组中的重复元素。

**答案**：
```c
// 数组去重
int removeDuplicates(int* nums, int numsSize) {
    if (numsSize == 0) return 0;
    
    int writeIndex = 1;    // 写入位置
    
    // 遍历数组
    for (int i = 1; i < numsSize; i++) {
        // 找到不重复的元素
        if (nums[i] != nums[writeIndex-1]) {
            nums[writeIndex] = nums[i];
            writeIndex++;
        }
    }
    
    return writeIndex;
}
```

### 7.2 数组旋转
**题目**：将数组向右旋转k步。

**答案**：
```c
// 反转数组的指定部分
void reverse(int* nums, int start, int end) {
    while (start < end) {
        int temp = nums[start];
        nums[start] = nums[end];
        nums[end] = temp;
        start++;
        end--;
    }
}

// 数组旋转
void rotate(int* nums, int numsSize, int k) {
    // 处理k大于数组长度的情况
    k %= numsSize;
    
    // 三次反转完成旋转
    reverse(nums, 0, numsSize-1);       // 反转整个数组
    reverse(nums, 0, k-1);              // 反转前k个元素
    reverse(nums, k, numsSize-1);       // 反转剩余元素
}
```

## 8. 字符串处理题

### 8.1 字符串压缩
**题目**：实现基本的字符串压缩功能。

**答案**：
```c
// 字符串压缩
void compressString(const char* src, char* dest) {
    int count = 1;
    int writeIndex = 0;
    
    // 遍历源字符串
    for (int i = 0; src[i] != '\0'; i++) {
        // 统计连续相同字符
        if (src[i] == src[i+1]) {
            count++;
        } else {
            // 写入字符和计数
            dest[writeIndex++] = src[i];
            if (count > 1) {
                int len = sprintf(&dest[writeIndex], "%d", count);
                writeIndex += len;
            }
            count = 1;
        }
    }
    dest[writeIndex] = '\0';
}
```

### 8.2 单词反转
**题目**：反转字符串中的单词顺序。

**答案**：
```c
// 反转字符串中的单词
void reverseWords(char* s) {
    int len = strlen(s);
    
    // 1. 反转整个字符串
    reverse(s, 0, len-1);
    
    // 2. 反转每个单词
    int start = 0;
    for (int i = 0; i <= len; i++) {
        if (s[i] == ' ' || s[i] == '\0') {
            reverse(s, start, i-1);
            start = i + 1;
        }
    }
}

// 反转字符串的辅助函数
void reverse(char* s, int start, int end) {
    while (start < end) {
        char temp = s[start];
        s[start] = s[end];
        s[end] = temp;
        start++;
        end--;
    }
}
```

## 9. 理论基础题

### 9.1 数据类型
**题目**：解释C语言中基本数据类型的大小和范围。

**答案**：
```c
/*
1. char: 1字节
   - 有符号：-128 到 127
   - 无符号：0 到 255

2. short: 2字节
   - 有符号：-32,768 到 32,767
   - 无符号：0 到 65,535

3. int: 通常4字节
   - 有符号：-2,147,483,648 到 2,147,483,647
   - 无符号：0 到 4,294,967,295

4. long: 4或8字节（取决于系统）
   - 32位系统：与int相同
   - 64位系统：-9,223,372,036,854,775,808 到 9,223,372,036,854,775,807

5. float: 4字节
   - 范围：±3.4E-38 到 ±3.4E+38
   - 精度：6-7位有效数字

6. double: 8字节
   - 范围：±1.7E-308 到 ±1.7E+308
   - 精度：15-17位有效数字
*/

// 验证数据类型大小的代码
void printTypeSizes() {
    printf("char: %zu bytes\n", sizeof(char));
    printf("short: %zu bytes\n", sizeof(short));
    printf("int: %zu bytes\n", sizeof(int));
    printf("long: %zu bytes\n", sizeof(long));
    printf("float: %zu bytes\n", sizeof(float));
    printf("double: %zu bytes\n", sizeof(double));
}
```

### 9.2 存储类别
**题目**：解释C语言中不同存储类别（auto、static、register、extern）的区别。

**答案**：
```c
/*
1. auto（自动存储类别）
   - 默认的存储类别
   - 变量在函数内部定义
   - 作用域为当前代码块
   - 生命周期为函数执行期间

2. static（静态存储类别）
   - 局部static变量：保持值不变，只初始化一次
   - 全局static变量：限制作用域在当前文件内
   - 生命周期为整个程序运行期间

3. register（寄存器存储类别）
   - 建议编译器将变量存储在寄存器中
   - 访问速度更快
   - 不能对register变量取地址
   - 编译器可能忽略register建议

4. extern（外部存储类别）
   - 声明变量或函数在其他文件中定义
   - 用于多文件程序中的变量共享
   - 全局变量默认是extern的
*/

// 示例代码
void storageClassDemo() {
    auto int a = 10;        // 自动变量（可省略auto）
    static int count = 0;   // 静态局部变量
    register int i;         // 寄存器变量
    extern int global_var;  // 外部变量声明
}
```

### 9.3 作用域规则
**题目**：解释C语言中的作用域规则和变量生命周期。

**答案**：
```c
/*
作用域类型：
1. 块作用域（Block scope）
   - 在代码块内声明的变量
   - 只在该块内可见
   - 包括函数参数

2. 文件作用域（File scope）
   - 在所有函数外声明的变量
   - 从声明点到文件末尾可见
   - 可以被static限制在文件内

3. 函数作用域（Function scope）
   - 仅适用于标签（labels）
   - 在整个函数内可见

4. 原型作用域（Prototype scope）
   - 函数原型中的参数名
   - 仅在原型声明中可见
*/

// 示例代码
int global = 10;    // 文件作用域

void scopeDemo() {
    int local = 20;    // 块作用域
    {
        int block = 30;    // 嵌套块作用域
        printf("%d %d %d\n", global, local, block);
    }
    // block在这里不可见
}
```

### 9.4 内存管理
**题目**：解释C语言中的内存分配方式和内存管理注意事项。

**答案**：
```c
/*
内存区域：
1. 栈区（Stack）
   - 自动分配和释放
   - 存储局部变量
   - 函数参数
   - LIFO（后进先出）结构

2. 堆区（Heap）
   - 动态分配的内存
   - 需要手动管理
   - 使用malloc/free
   - 容易造成内存泄漏

3. 全局区/数据段
   - 存储全局变量
   - 静态变量
   - 常量

4. 代码段
   - 存储程序的代码
   - 只读
*/

// 内存管理示例
void memoryManagementDemo() {
    // 栈内存
    int stackVar = 10;
    
    // 堆内存
    int *heapVar = (int*)malloc(sizeof(int));
    if (heapVar != NULL) {
        *heapVar = 20;
        free(heapVar);    // 必须释放
        heapVar = NULL;   // 避免悬空指针
    }
    
    // 静态内存
    static int staticVar = 30;
}
```

### 9.5 预处理器
**题目**：解释C语言中预处理器的作用和常用预处理指令。

**答案**：
```c
/*
常用预处理指令：
1. #include
   - 包含头文件
   - 有两种形式：<> 和 ""

2. #define
   - 定义宏
   - 常量定义
   - 带参数的宏

3. #ifdef, #ifndef, #endif
   - 条件编译
   - 头文件保护

4. #pragma
   - 编译器特定指令
   - 设置编译选项
*/

// 示例代码
#define MAX_SIZE 100    // 常量宏
#define SQUARE(x) ((x)*(x))    // 带参数的宏

// 头文件保护
#ifndef HEADER_H
#define HEADER_H
// 头文件内容
#endif

// 条件编译
#ifdef DEBUG
    #define LOG(msg) printf("%s\n", msg)
#else
    #define LOG(msg)
#endif
```

### 9.6 编译过程
**题目**：解释C程序的编译过程。

**答案**：
```c
/*
编译过程分为四个主要阶段：

1. 预处理（Preprocessing）
   - 处理所有预处理指令
   - 展开宏定义
   - 包含头文件
   - 删除注释
   命令：gcc -E source.c -o source.i

2. 编译（Compilation）
   - 将预处理后的代码转换为汇编代码
   - 进行语法检查
   - 代码优化
   命令：gcc -S source.i -o source.s

3. 汇编（Assembly）
   - 将汇编代码转换为目标文件
   - 生成机器码
   命令：gcc -c source.s -o source.o

4. 链接（Linking）
   - 将目标文件与库文件链接
   - 生成可执行文件
   命令：gcc source.o -o program

常见编译选项：
-Wall：启用所有警告
-O2：优化级别2
-g：包含调试信息
*/

// 完整编译命令示例
// gcc -Wall -O2 -g source.c -o program
```
