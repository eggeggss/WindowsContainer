# Lab03: Docker Login

```powershell
docker events
```

> 另開一個的 Shell 視窗。

登入 Docker Hub

```powershell
docker login -u <username> -p <password>
```

```powershell
docker logout
```

```powershell
docker login -u <username> -p <password>
docker images
```

```powershell
docker push <username>/hello:1.0
```

```powershell
docker tag kkbruce/hello:1.0 kkbruce/hello:latest
```

```powershell
docker push <username>/hello
```

> 此次沒有 [:tag]

回 `docker events` 視窗，按 `Ctrl+C`。