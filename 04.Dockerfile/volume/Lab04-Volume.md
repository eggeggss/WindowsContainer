# Lab04: Dockerfile - Volume

```powershell
docker build -t <username>/appdata .
```

```powershell
docker run --name appdata <username>/appdata "echo 'start' > c:\app\config\log.txt"
docker ps -a
```

- 由 Dockerfile 建置映像檔，並使用 `docker inspect` 觀察 Mounts 段落。預設會對應到 Docker Host 的 *C:\ProgramData\docker\volumes* 之下。

```powershell
docker run -it --volumes-from appdata <username>/appdata
```

> `--volumes-from appdata:ro` 只能唯讀。