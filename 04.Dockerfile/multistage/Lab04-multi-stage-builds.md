# Lab04: Multi Stage Builds

> 在本機完成開發。

```powershell
mkdir msb
```

請先使用 Visual Studio 建立一個 ASP.NET MVC 應用程式，目錄 msb，取消「為方案建立目錄」，名稱：**aspnetmvcapp**，建置與執行，確定專案運作正常。

.dockerignore

```dockerignore
# directories
**/bin/
**/obj/
packages/

# files
Dockerfile*
*.md
```

Dockerfile

```dockerfile
FROM microsoft/dotnet-framework:4.7.2-sdk-windowsservercore-1803 AS build

WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY aspnetmvcapp/*.csproj ./aspnetmvcapp/
COPY aspnetmvcapp/*.config ./aspnetmvcapp/
RUN nuget restore

# copy everything else and build app
COPY aspnetmvcapp/. ./aspnetmvcapp/
WORKDIR /app/aspnetmvcapp
RUN msbuild /p:Configuration=Release


FROM microsoft/aspnet:4.7.2-windowsservercore-1803 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/aspnetmvcapp/. ./
```

build：

```powershell
docker build -t <username>/aspnetmvcapp .
docker run --name myapp --rm -it -p 80:80 <username>/aspnetmvcapp
```

應該會看到下列訊息：

```dos
Service 'w3svc' has been stopped

Service 'w3svc' started
```

另開一個 Terminal，取得 Container IP：

```powershell
1. docker inspect <ContainerIPorName>
2. docker exec aspnetmvc_sample ipconfig
```

> - `docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" myapp`
> - 這大概只有寫 Script 才會用到。


使用 `http://yourIP` 測試連線。