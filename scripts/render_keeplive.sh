#!/bin/bash

# 定义一个函数，用于请求网址
request_url() {
    url=$1
    echo "正在请求: $url"
    curl -s $url > /dev/null
    # 这里使用curl -s将输出静默，并将输出重定向到/dev/null，因为我们不关心输出内容
    # 如果需要记录输出或检查结果，可以去掉-s参数，或者将输出重定向到文件
    echo "请求完成: $url"
}

# 循环遍历所有ping地址，并调用函数请求
urls=(
    "https://kimi-free-api-nut5.onrender.com/ping"
    "https://step-free-api.onrender.com/ping"
    "https://qwen-free-api.onrender.com/ping"
    "https://glm-free-api-ij4o.onrender.com/ping"
    "https://emohaa-free-api.onrender.com/ping"
)

for url in "${urls[@]}"; do
    request_url $url
done