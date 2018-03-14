dagger
======

老虎证券跳板机自动登陆脚本

## 安装使用

```bash
brew install node
npm install -g @tigerbrokers/dagger

# Google Auth Token Secret
export DAGGER_GAUTH_SECRET=xxxx

# SSH 登陆
export DAGGER_SSH_LOGIN="liyi@172.28.xx.xx"

# 第二个密码, 注意特殊符号的转义
export DAGGER_SSH_PASSWORD=""

# 输入dagger命令即可自动登陆跳板机
dagger
```

