# Lab08: Web and Redis

docker-compose.yml

```dockerfile
version: '3.7'

services:

  web:
    image: kkbruce/aspnetmvcapp:health
    depends_on:
      - redis

  redis:
    image: kkbruce/redis-windows

  # db:
  #   image: microsoft/mssql-server-windows-developer
```

---

將 PowerShell 切換至 docker-compose.yml 所在目錄：

```dockerfile
docker-compose.exe up
```

```dockerfile
docker-compose.exe down
```
