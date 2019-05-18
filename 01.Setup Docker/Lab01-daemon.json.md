# Lab01: daemon.json

進入組態目錄：

```powershell
cd $env:ProgramData\Docker\config\
```

並新增 daemon.json

新增以下組態：

```json
{
    "hosts": ["tcp://0.0.0.0:2375", "npipe://"],
    "data-root": "d:\\docker",
    "experimental": true
}
```

> - docker 映像檔會佔用大量的空間，建議獨立一個大一些的磁碟專門提供映像檔的存取。
> - 在 Docker CE (Windows 10) 請改用 `"graph":"D:\\docker"` 來設定儲存路徑。

最後重啟服務：`Restart-Service docker`

`docker info` 確認。