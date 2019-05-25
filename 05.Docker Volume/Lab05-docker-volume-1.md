# Lab05: docker volume (1)

```powershell
docker volume create my-vol
docker volume ls
docker volume inspect my-vol
docker volume rm my-vol
```

## Start a container with a volume (`-v`)

```powershell
docker volume create mydata
docker run -it --name test1 -v mydata:c:\data mcr.microsoft.com/windows/nanoserver:1809
```

在容器內寫些資料進 c:\data 之內，之後停止 test1。

```powershell
docker run -it --name test2 -v mydata:c:\data2 mcr.microsoft.com/windows/nanoserver:1809
dir c:\data2
```

## Start a container with a volume (`--mount`)

```powershell
docker run -it --rm `
--name test3 `
--mount source=mydata2,target=c:\data3 `
mcr.microsoft.com/windows/nanoserver:1809
```

使用 `docker inspect test3` 來觀察 "**Mounts**"。