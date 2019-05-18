# Lab04: Redis on Nano server

下載最新版 <a href="https://github.com/MSOpenTech/redis/releases" target="_blank">Redis on Windows</a> ZIP 檔，解壓縮並將目錄改名為 **Redis**。

Windows 容器的 Redis 需要修改一些組態：

```powershell
cd Redis

(Get-Content .\redis.windows.conf) -Replace '^(bind)\s+.*$', '$1 0.0.0.0' -Replace '^(protected-mode)\s+.*$', '$1 no' | Set-Content .\redis.windows-docker.conf
```

```dockerfile
# escape=`

FROM  mcr.microsoft.com/windows/nanoserver:1809
LABEL maintiner="kkbruce" redis.version=3.2.100

COPY Redis /Redis
WORKDIR /Redis
EXPOSE 6379

CMD ["redis-server.exe", "redis.windows-docker.conf"]
```

```powershell
docker build -t <username>/redis-windows:nanoserver-1803 .
```

```powershell
docker run --rm <username>/redis-windows:nanoserver-1803
```
