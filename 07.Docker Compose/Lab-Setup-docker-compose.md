# Lab: Setup docker-compose

在 Windows Server 2016 手動下載與安裝 docker-componse.exe：

> 確認目前最新 docker-componse 版本號：https://github.com/docker/compose/releases/

## 手動下載

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -UseBasicparsing -Outfile docker-compose.exe "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-Windows-x86_64.exe"
```

複製到 `$Env:ProgramFiles\docker\` 目錄下。

## 直接安裝

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/docker/compose/releases/download/{version}/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\docker\docker-compose.exe
```

## 測試

```powershell
docker-compose -v
```
