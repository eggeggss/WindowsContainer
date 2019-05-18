# Lab03: docker logs

Linux:

```powershell
docker pull --platform linux busybox
```

```powershell
docker run --name test -d --rm busybox sh -c "while true; do $(echo date); sleep 1; done"
```

Windows:

```powershell
docker run -it --rm <username>/hello:1.0 pwsh.exe -Command 
```

docker log:

```powershell
docker logs test
docker logs --tail 10
docker logs -f
docker stop test
```
