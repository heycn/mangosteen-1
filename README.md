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
