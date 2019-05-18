# Lab04: healthcheck

點擊上一個 msb 目錄下的 .sln 方案檔，加入一個空白 MVC Controll，名稱：Diagnostics。

```csharp
public class DiagnosticsController : Controller
{
    [HttpGet]
    [Route("diagnostics")]
    public ActionResult Index()
    {
            return Content("OK");
    }
}
```

啟動與測試：`http://localhost:port/diagnostics`

修改multistagetest 目錄 Dockerfile：

```dockerfile
#escape=`

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

# healthcheck
HEALTHCHECK --interval=30s `
 CMD powershell -command `
    try { `
     $response = iwr http://localhost/diagnostics -UseBasicParsing; `
     if ($response.StatusCode -eq 200) { return 0} `
     else {return 1}; `
    } catch { return 1 }

WORKDIR /inetpub/wwwroot
COPY --from=build /app/aspnetmvcapp/. ./
```

build：

```powershell
docker build -t <username>/aspnetmvcapp:health .
docker run --name myapp --rm -d -p 80:80 <username>/aspnetmvcapp:health
```

請使用 `docker ps` 觀察 `STATUS`。

> 不同專案及軟硬體，進入 `healthy` 會時間會有所不同。






