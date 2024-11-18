# C语言进阶项目教程

## 1. 文件压缩程序

### 1.1 项目描述
实现一个简单的文件压缩程序，使用哈夫曼编码算法。

### 1.2 核心代码
```cpp
// 哈夫曼树节点
struct HuffmanNode {
    char data;
    unsigned freq;
    struct HuffmanNode *left, *right;
};

// 创建新节点
struct HuffmanNode* createNode(char data, unsigned freq) {
    struct HuffmanNode* node = 
        (struct HuffmanNode*)malloc(sizeof(struct HuffmanNode));
    node->data = data;
    node->freq = freq;
    node->left = node->right = NULL;
    return node;
}

// 构建哈夫曼树
struct HuffmanNode* buildHuffmanTree(char data[], int freq[], int size) {
    // 实现略
}
```

## 2. 简单数据库系统

### 2.1 项目描述
实现一个基于文件的简单数据库系统，支持CRUD操作。

### 2.2 核心代码
```cpp
// 数据记录结构
struct Record {
    int id;
    char name[50];
    char data[100];
};

// 添加记录
void addRecord(FILE* file, struct Record record) {
    fseek(file, 0, SEEK_END);
    fwrite(&record, sizeof(struct Record), 1, file);
}

// 查询记录
struct Record* findRecord(FILE* file, int id) {
    struct Record* record = (struct Record*)malloc(sizeof(struct Record));
    rewind(file);
    
    while (fread(record, sizeof(struct Record), 1, file)) {
        if (record->id == id) {
            return record;
        }
    }
    
    free(record);
    return NULL;
}
```

## 3. 网络聊天程序

### 3.1 项目描述
实现一个基于TCP/IP的简单聊天程序。

### 3.2 核心代码
```cpp
// 服务器端代码
void startServer(int port) {
    int server_fd, new_socket;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    
    // 创建socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }
    
    // 设置socket选项
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT,
                   &opt, sizeof(opt))) {
        perror("setsockopt");
        exit(EXIT_FAILURE);
    }
    
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(port);
    
    // 绑定socket
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }
    
    // 监听连接
    if (listen(server_fd, 3) < 0) {
        perror("listen");
        exit(EXIT_FAILURE);
    }
}
```

## 4. 图形界面计算器

### 4.1 项目描述
使用图形库实现一个带界面的计算器。

### 4.2 核心代码
```cpp
// 使用GTK+库
#include <gtk/gtk.h>

// 按钮点击回调函数
static void button_clicked(GtkWidget *widget, gpointer data) {
    const gchar *label = gtk_button_get_label(GTK_BUTTON(widget));
    // 处理按钮点击事件
}

// 创建主窗口
void create_window() {
    GtkWidget *window;
    GtkWidget *grid;
    GtkWidget *button;
    
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "计算器");
    
    grid = gtk_grid_new();
    gtk_container_add(GTK_CONTAINER(window), grid);
    
    // 添加按钮
    button = gtk_button_new_with_label("1");
    g_signal_connect(button, "clicked", G_CALLBACK(button_clicked), NULL);
    gtk_grid_attach(GTK_GRID(grid), button, 0, 0, 1, 1);
    
    // 其他按钮类似...
}
```

## 5. 注意事项
- 项目开发前要做好设计
- 注意代码的模块化
- 做好错误处理
- 注意内存管理
- 编写详细注释
- 进行充分测试
