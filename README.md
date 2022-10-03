# README

## 开发配置

### 数据库创建

> 请在其他终端运行这行命令，不要在此目录下运行

```zsh
docker run -d      --name db-for-mangosteen      -e POSTGRES_USER=mangosteen      -e POSTGRES_PASSWORD=123456      -e POSTGRES_DB=mangosteen_dev      -e PGDATA=/var/lib/postgresql/data/pgdata      -v mangosteen-data:/var/lib/postgresql/data      --network=network1      postgres:14
```

### 启动服务

> 在此目录下运行

```zsh
bin/rails s
```

## 部署

### 密钥管理

```zsh
EDITOR="code --wait" bin/rails credentials:edit # 复制key
EDITOR="code --wait" bin/rails credentials:edit --env production # 粘贴key
EDITOR="code --wait" bin/rails credentials:edit # 直接关闭
```

## 生产环境

### 创建数据表

> 如果 curl 没有返回，说明数据库没有启动,需要运行以下命令

```zsh
docker exec -it mangosteen-prod-1 bin/rails db:create db:migrate
```
