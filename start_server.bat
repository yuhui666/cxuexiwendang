@echo off
chcp 65001 > nul
echo [32m正在检查服务状态...[0m

:: 检查8080端口是否被占用
netstat -ano | findstr ":8080" > nul
if %errorlevel% equ 0 (
    :: 端口被占用，自动关闭并重启
    echo [33m发现8080端口已被占用，正在关闭现有服务...[0m
    
    :: 查找并关闭占用端口的进程
    for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":8080"') do (
        taskkill /f /pid %%a
    )
    
    :: 等待进程完全关闭
    timeout /t 2 > nul
    echo [32m现有服务已关闭[0m
    goto :start_server
) else (
    :: 端口未被占用，启动新服务
    goto :start_server
)

:start_server
echo [32m正在启动HTTP服务器...[0m
echo [32m请确保已安装Python...[0m

:: 检查Python是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo [31mPython未安装！[0m
    echo [33m请访问 https://www.python.org/downloads/ 下载并安装Python[0m
    echo.
    pause
    exit /b
)

:: 获取本机IP地址
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /R "IPv4.*[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"') do (
    set ip=%%a
)
set ip=%ip:~1%

:: 启动HTTP服务器
echo [32m启动服务器在端口8080...[0m
echo [32m本地访问地址: http://%ip%:8080/index.html[0m
echo [32m局域网访问地址: http://%ip%:8080/index.html[0m
echo [33m按Ctrl+C可以停止服务器[0m
echo.

:: 等待2秒让服务器启动
timeout /t 2 > nul

:: 使用默认浏览器打开页面
start http://%ip%:8080/index.html

:: 启动服务器（绑定到0.0.0.0以允许局域网访问）
python -m http.server 8080 --bind 0.0.0.0

pause