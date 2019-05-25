# Lab08: Web and Redis

docker-compose-redis.yml

```dockerfile
version: '3.7'

services:

  redis:
    image: kkbruce/redis-windows
```

docker-compose-web.yml

```dockerfile
version: '3.7'

services:

  web:
    image: kkbruce/aspnetmvcapp:health
```

```powershell
docker-compose -f docker-compose-redis.yml -f docker-compose-web.yml up -d
```
