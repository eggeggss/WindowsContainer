# Lab05: docker volume (2)

```powrshell
docker run -d `
  -p 8080:80 `
  --platform linux `
  --name=webtest2 `
  --mount source=nginx-vol,destination=/usr/share/nginx/html `
  nginx:latest
```

如果因為某些原因，僅希望容器僅能唯讀 Volume：

```powershell
docker run -d `
  -p 8081:80
  --platform linux `
  --name=webtest2 `
  --mount source=nginx-vol,destination=/usr/share/nginx/html,readonly `
  nginx:latest
```

> IIS 預設路徑：**C:\inetpub\wwwroot**。

```powershell
docker run -d `
  -p 8082:80 `
  --name=webtest3 `
  --mount source=iisvol,destination=C:\inetpub\wwwroot `
  mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019
```