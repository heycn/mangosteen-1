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

### 2. 重要：pack_for_remote.sh 参数更新

第一次部署到生产环境时，一定要加 `need_migrate=1` 前缀，如下：

```bash
need_migrate=1 bin/pack_for_remote.sh
```

### 3. 启动容器时报错

如果你的报错内容含有

```bash
ActiveSupport::MessageEncryptor::InvalidMessage (ActiveSupport::MessageEncryptor::InvalidMessage)
```

那么大概率是你的生产环境的 `config/credentials/production.yml.enc` 与 `config/credentials/production.key` 不匹配，要确定是不是不匹配，只需要运行

```bash
EDITOR="code --wait" bin/rails credentials:edit --environment production
```

如果报错，则说明确实不匹配，此时你只能删除 `config/credentials/production.yml.enc` 与 `config/credentials/production.key` 然后重新运行

```bash
EDITOR="code --wait" bin/rails credentials:edit --environment production
```

这样一来，就能得到两个全新的、匹配的 `config/credentials/production.yml.enc` 与 `config/credentials/production.key` 文件。

然后你需要手动将 `config/credentials/production.key` 的内容更新到远程服务器的 `bashrc` 中。
