# Day1 - Homework

## Buddha Plus

> From 實務需求：修改容器內的組態檔(例如，web.config)以快速進行測試。

```powershell
docker run -it --name buddha <username>/buddha cmd.exe
```

在 ascii-Buddha.txt 最後加一行 `PowerBy: https://skilltree.my, <username>`

commit 之後 tag:`<username>/buddha:skilltree`

## Dockerfile

1. http://nginx.org
2. 取得 nginx-{version}.zip 檔案與下載連結
3. 撰寫以下兩個版本的 Dockerfile

- nginx for mcr.microsoft.com/windows/nanoserver:1809
    - 使用 cmd.exe 的解決方案

- nginx for mcr.microsoft.com/windows/servercore:ltsc2019
    - 使用 PowerShell 的解決方案

tag: `<username>/nginx-windows:nanoserver-<version>`
tag: `<username>/nginx-windows:servercore-<version>`

> 沒有 1803 的主機，請上 Docker Hub 選擇任何能在你主機執行 Tag 版本。例如，1709。