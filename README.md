# README

## 开发配置

### 数据库创建

```bash
docker run -d --name db-for-mangosteen -e POSTGRES_USER=mangosteen -e POSTGRES_PASSWORD=123456 -e POSTGRES_DB=mangosteen_dev -e PGDATA=/var/lib/postgresql/data/pgdata -v mangosteen-data:/var/lib/postgresql/data --network=network1 postgres:14
```

## 部署远程服务器

### 添加可执行权限

```bash
chmod +x bin/pack_for_remote.sh bin/setup_remote.sh
```

## 常见问题

### 1. 部署远程服务器时，数据库连接失败

1. 检查数据库是否启动
2. docker ps -a 查看数据库容器是在运行
3. docker logs db-for-mangosteen 查看数据库容器日志，是否有报错
4. docker exec -it db-for-mangosteen bash 进入数据库容器，查看数据库是否创建成功
5. docker network create network1 创建网络
