# Deploy All Free API

一键部署所有的 Free API 项目: [LLM Red Team](https://github.com/LLM-Red-Team)

每次部署之前会停止并删除容器和镜像，然后重新拉取、运行。



### 部署

```
./deploy.sh
```

> 如果没办法运行，自己加个权限 `chmod 777 ./deploy.sh`



![image-20240429152513832](https://qn.huat.xyz/mac/202404291525908.png)



### 修改端口

```bash
#!/bin/bash

# 容器名称和端口配置
containers=("kimi-free-api" "glm-free-api" "qwen-free-api" "step-free-api" "metaso-free-api" "spark-free-api" "emohaa-free-api")

# 在这里修改端口
ports=(8000 8001 8002 8003 8004 8005 8006)
```



### 参数

`-del` : 只停止、删除容器和镜像，不再重新拉去和运行，使用示例: `./deploy -del`


原仓库: https://github.com/SuYxh/deploy-all-free-api