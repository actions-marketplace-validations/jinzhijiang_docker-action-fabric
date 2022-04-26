# Docker Action Fabric
![GitHub release (latest by date)](https://img.shields.io/github/v/release/jinzhijiang/docker-action-fabric)

Docker action配合fabric，自动部署网页，后台程序等到服务器

## 输入

|字段|是否必传|值描述|
|:-|-|:-|
|`rsakey`|和`password`互斥必传|SSH秘钥连接方式，传入私钥字符串|
|`password`|和`rsakey`互斥必传|SSH密码连接方式，传入登录密码|
|`port`|必传|SSH连接端口号|
|`ip`|必传|SSH连接到的IP地址|
|`user`|必传|SSH登录的用户|
|`run`|必传|执行Fabric命令|

### Fabric 命令基本说明

1. `local()` 执行本地命令（在这里执行的就是docker容器中的命令，可以对项目代码进行操作等）
2. `put(参数1, 参数2)`将本地文件推到远程服务器，`参数1`本地文件，`参数2`远程文件
3. `run()`执行当前用户的远程服务器命令
4. `sudo()`执行root账户命令

## 使用案例

当前版本：![GitHub release (latest by date)](https://img.shields.io/github/v/release/jinzhijiang/docker-action-fabric)

```
- name: Action Fabric Deploy
  uses: jinzhijiang/docker-action-fabric@当前版本
  with:
    rsakey: ${{ secrets.SSH_RSA }}
    # password: ${{ secrets.SSH_PASSWORD }}
    port: ${{ secrets.SSH_PORT }}
    ip: ${{ secrets.SSH_IP }}
    user: ${{ secrets.SSH_USR }}
    run: |
      local('pwd')
      local('ls')
      put('README.md', "/home/README2.md")
      run('pwd')
```

# Apache 2.0 License
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)