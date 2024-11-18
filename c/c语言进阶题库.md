# C语言进阶题库

## 1. 指针进阶题

### 1.1 链表反转
**题目**：编写一个函数反转单链表。

**答案**：
```c
// 定义链表节点结构
struct ListNode {
    int val;
    struct ListNode *next;
};

// 反转链表函数
struct ListNode* reverseList(struct ListNode* head) {
    struct ListNode *prev = NULL;    // 前一个节点
    struct ListNode *curr = head;    // 当前节点
    struct ListNode *next = NULL;    // 下一个节点
    
    // 遍历链表，逐个反转节点的指向
    while (curr != NULL) {
        next = curr->next;     // 保存下一个节点
        curr->next = prev;     // 反转当前节点的指向
        prev = curr;           // 移动prev指针
        curr = next;           // 移动curr指针
    }
    
    return prev;    // 返回新的头节点
}
```

### 1.2 环形链表检测
**题目**：编写一个函数检测链表是否有环。

**答案**：
```c
// 检测链表是否有环（快慢指针法）
int hasCycle(struct ListNode *head) {
    // 处理空链表和单节点链表
    if (head == NULL || head->next == NULL) {
        return 0;
    }
    
    struct ListNode *slow = head;        // 慢指针
    struct ListNode *fast = head->next;  // 快指针
    
    // 快慢指针移动
    while (slow != fast) {
        // 如果快指针到达末尾，说明无环
        if (fast == NULL || fast->next == NULL) {
            return 0;
        }
        slow = slow->next;         // 慢指针移动一步
        fast = fast->next->next;   // 快指针移动两步
    }
    
    return 1;    // 有环
}
```

## 2. 算法题

### 2.1 二分查找变体
**题目**：在部分有序的数组中找出目标值的位置。

**答案**：
```c
// 在旋转排序数组中查找目标值
int search(int* nums, int numsSize, int target) {
    int left = 0;
    int right = numsSize - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        // 找到目标值
        if (nums[mid] == target) {
            return mid;
        }
        
        // 判断哪一部分是有序的
        if (nums[left] <= nums[mid]) {
            // 左半部分有序
            if (target >= nums[left] && target < nums[mid]) {
                right = mid - 1;    // 在左半部分查找
            } else {
                left = mid + 1;     // 在右半部分查找
            }
        } else {
            // 右半部分有序
            if (target > nums[mid] && target <= nums[right]) {
                left = mid + 1;     // 在右半部分查找
            } else {
                right = mid - 1;    // 在左半部分查找
            }
        }
    }
    
    return -1;    // 未找到目标值
}
```

### 2.2 动态规划
**题目**：计算最长递增子序列的长度。

**答案**：
```c
// 计算最长递增子序列的长度
int lengthOfLIS(int* nums, int numsSize) {
    if (numsSize == 0) return 0;
    
    // 创建dp数组，初始值都为1
    int *dp = (int*)malloc(numsSize * sizeof(int));
    for (int i = 0; i < numsSize; i++) {
        dp[i] = 1;
    }
    
    int maxLen = 1;    // 记录最长长度
    
    // 动态规划过程
    for (int i = 1; i < numsSize; i++) {
        for (int j = 0; j < i; j++) {
            if (nums[i] > nums[j]) {
                dp[i] = fmax(dp[i], dp[j] + 1);
            }
        }
        maxLen = fmax(maxLen, dp[i]);
    }
    
    free(dp);    // 释放内存
    return maxLen;
}
```

## 3. 系统编程题

### 3.1 文件操作
**题目**：编写程序统计文件中的字符数、单词数和行数。

**答案**：
```c
// 统计文件中的字符数、单词数和行数
void countFileStats(const char* filename, int* chars, int* words, int* lines) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("无法打开文件\n");
        return;
    }
    
    *chars = 0;    // 字符计数
    *words = 0;    // 单词计数
    *lines = 0;    // 行计数
    int inWord = 0;    // 是否在单词内的标志
    
    char c;
    while ((c = fgetc(file)) != EOF) {
        (*chars)++;    // 增加字符计数
        
        // 统计行数
        if (c == '\n') {
            (*lines)++;
        }
        
        // 统计单词数
        if (isspace(c)) {
            inWord = 0;
        } else if (!inWord) {
            inWord = 1;
            (*words)++;
        }
    }
    
    // 处理最后一行没有换行符的情况
    if (*chars > 0 && c != '\n') {
        (*lines)++;
    }
    
    fclose(file);
}
```

### 3.2 进程通信
**题目**：使用管道实现父子进程间的通信。

**答案**：
```c
// 使用管道进行进程间通信
void processCommunication() {
    int pipefd[2];    // 管道文件描述符
    pid_t pid;
    char buf[100];
    
    // 创建管道
    if (pipe(pipefd) == -1) {
        perror("pipe");
        exit(EXIT_FAILURE);
    }
    
    // 创建子进程
    pid = fork();
    if (pid == -1) {
        perror("fork");
        exit(EXIT_FAILURE);
    }
    
    if (pid == 0) {    // 子进程
        close(pipefd[1]);    // 关闭写端
        
        // 从管道读取数据
        read(pipefd[0], buf, sizeof(buf));
        printf("子进程收到消息: %s\n", buf);
        
        close(pipefd[0]);    // 关闭读端
    } else {    // 父进程
        close(pipefd[0]);    // 关闭读端
        
        // 向管道写入数据
        write(pipefd[1], "Hello from parent!", 18);
        
        close(pipefd[1]);    // 关闭写端
        wait(NULL);          // 等待子进程结束
    }
}

```

## 4. 高级理论题

### 4.1 内存对齐
**题目**：解释C语言中的内存对齐机制及其重要性。

**答案**：
```c
/*
内存对齐的原因：
1. 硬件要求：某些CPU只能在特定地址读取数据
2. 性能优化：对齐的内存访问更快
3. 原子操作：某些平台要求对齐才能保证原子操作

对齐规则：
1. 基本类型的对齐值通常等于其大小
2. 结构体的对齐值等于其最大成员的对齐值
3. 结构体总大小是其对齐值的整数倍
*/

// 示例代码
struct BadAlignment {
    char c;     // 1字节
    int i;      // 4字节
    char d;     // 1字节
};  // 实际占用12字节

struct GoodAlignment {
    int i;      // 4字节
    char c;     // 1字节
    char d;     // 1字节
    // 2字节填充
};  // 实际占用8字节

// 查看结构体大小
void alignmentDemo() {
    printf("BadAlignment size: %zu\n", sizeof(struct BadAlignment));
    printf("GoodAlignment size: %zu\n", sizeof(struct GoodAlignment));
}
```

### 4.2 位操作
**题目**：解释C语言中的位操作技巧及其应用。

**答案**：
```c
/*
常用位操作：
1. 设置位：num |= (1 << pos)
2. 清除位：num &= ~(1 << pos)
3. 切换位：num ^= (1 << pos)
4. 检查位：(num >> pos) & 1
5. 计算二进制中1的个数
6. 判断是否是2的幂
*/

// 位操作实用技巧
void bitOperationDemo() {
    int num = 0;
    
    // 设置第3位（从0开始）
    num |= (1 << 3);    // num = 8
    
    // 清除第3位
    num &= ~(1 << 3);   // num = 0
    
    // 检查第3位
    int isBitSet = (num >> 3) & 1;
    
    // 计算1的个数
    int count = 0;
    while (num) {
        count += num & 1;
        num >>= 1;
    }
    
    // 判断是否是2的幂
    int isPowerOfTwo = num && !(num & (num - 1));
}
```

### 4.3 volatile关键字
**题目**：解释volatile关键字的作用和使用场景。

**答案**：
```c
/*
volatile的作用：
1. 防止编译器优化
2. 确保每次都从内存读取
3. 用于多线程和硬件访问

使用场景：
1. 硬件寄存器
2. 多线程共享变量
3. 信号处理函数中的变量
4. 嵌入式系统编程
*/

// 示例代码
volatile int sensor_value;    // 硬件传感器值
volatile int flag;            // 多线程共享标志

void volatileDemo() {
    while (flag == 0) {
        // 编译器不会优化掉这个循环
        // 每次都会从内存读取flag的值
    }
    
    // 读取传感器值
    int value = sensor_value;
    // 确保每次都直接从内存读取
}
```

### 4.4 函数调用约定
**题目**：解释C语言中的函数调用约定（Calling Convention）。

**答案**：
```c
/*
函数调用约定定义了：
1. 参数传递顺序
2. 参数存储位置（栈或寄存器）
3. 栈清理责任
4. 返回值处理方式

常见调用约定：
1. cdecl（C声明）
   - 调用者清理栈
   - 参数从右向左压栈
   - 用于大多数C程序

2. stdcall（标准调用）
   - 被调用者清理栈
   - 参数从右向左压栈
   - 常用于Windows API

3. fastcall（快速调用）
   - 使用寄存器传递参数
   - 提高性能
*/

// 示例代码
#ifdef _WIN32
    // Windows平台特定调用约定
    __cdecl void cdeclFunction(int a, int b) { }
    __stdcall void stdcallFunction(int a, int b) { }
    __fastcall void fastcallFunction(int a, int b) { }
#endif
```

### 4.5 线程安全
**题目**：解释C语言中的线程安全概念和实现方法。

**答案**：
```c
/*
线程安全的概念：
1. 多个线程同时访问时保持正确性
2. 避免竞态条件
3. 保护共享资源

实现方法：
1. 互斥锁
2. 原子操作
3. 线程局部存储
4. 可重入函数
*/

// 示例代码
#include <pthread.h>

// 互斥锁示例
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
int shared_resource = 0;

void threadSafeFunction() {
    pthread_mutex_lock(&mutex);
    // 访问共享资源
    shared_resource++;
    pthread_mutex_unlock(&mutex);
}

// 线程局部存储
__thread int threadLocal = 0;    // 每个线程独有

// 原子操作
#include <stdatomic.h>
atomic_int atomic_counter = 0;

void atomicOperation() {
    atomic_fetch_add(&atomic_counter, 1);
}
```

</rewritten_file>