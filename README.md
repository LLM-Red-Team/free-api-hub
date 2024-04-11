# free-api-hub
[free-api系列项目](https://github.com/orgs/LLM-Red-Team/repositories?q=free-api) 集合共享资源

如果您对 [free-api系列项目](https://github.com/orgs/LLM-Red-Team/repositories?q=free-api) 感兴趣，欢迎PR分享的内容到本仓库。

使用说明和URL链接分享PR在本 `README.md` 中

文档类PR在 `/docs` 目录中，并在 `/docs/README.md` 说明

脚本类PR在 `/scripts` 目录中，并在 `/scripts/README.md` 说明

非常感谢您的关注和支持！

![demo](https://github.com/LLM-Red-Team/free-api-hub/assets/20235341/5ce7c71d-3a4d-4469-9e4a-24ac9d78cc76)

## 核心资源

### all-free-api.yml

docker-compose一键启动所有free-api的脚本，运行以下命令启动。

```shell
docker-compose -f all-free-api.yml up -d
```

### Render容器保活

使用Render部署free-api时，容器在一段时间不活动后会自动回收，导致下次调用响应有近1分钟的延迟，你可以用以下方案保活容器。

#### 方案1：通过任意监控服务调用保活

1. 在你支持监控服务的框架或程序上面配置在Render的free-api地址，如 `https://kimi-free-api-nut5.onrender.com` 就是 `https://kimi-free-api-nut5.onrender.com/ping`，需要使用GET请求方法。

2. 配置探测频率，建议5分钟一轮。

#### 方案2：通过脚本curl调用保活

命令仅适用于Linux系统。

1. 改写 scripts/render_keeplive.sh 文件，将循环遍历的ping地址换成你部署在Render的free-api地址，如 `https://kimi-free-api-nut5.onrender.com` 就是 `https://kimi-free-api-nut5.onrender.com/ping`。

2. 运行 `crontab -e` 命令，在打开的编辑器中添加如下内容（/path/to/render_keeplive.sh 替换为你的脚本路径）：

```shell
*/5 * * * * /path/to/render_keeplive.sh
```

3. 保存并退出编辑器，可以通过 `tail -f /var/log/cron` 查看脚本被调用的日志。