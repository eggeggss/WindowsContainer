# Lab08: docker stack 

> 講師做。

複製 redis\docker-compose.yml 到 VM：`notepad docker-compose.yml`

```powershell
docker stack deploy --with-registry-auth -c docker-compose.yml redis
docker service ls
docker network ls
```

```powershell
docker service rm redis_redis
docker network ls
docker network rm redis_default
```

---

複製 redis\stack\docker-compose.yml 到 VM：`notepad docker-compose-stack.yml`

> Add **deploy:** Configuration.

```powershell
docker stack deploy --with-registry-auth -c docker-compose-stack.yml <hostname>redis
docker service ls
docker network ls
```