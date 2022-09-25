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
