# Lab03: docker save and docker load

```powershell
docker save -o <username>_hello_latest.tar <username>/hello:latest
```

```powershell
docker rmi <username>/hello:latest
docker rmi <username>/hello:1.0
```

```powershell
docker images
docker load -i .\<username>_hello_latest.tar
docker images
```

> 注意載入的分層。已有的分層不會重覆載入。