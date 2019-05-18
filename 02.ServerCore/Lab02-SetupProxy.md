# Lab02: Setup Proxy

## netsh /?

這是 OS 層的設定：

```dos
netsh winhttp show proxy
netsh winhttp set proxy proxy-server="proxy.hinet.net:80" bypass-list="*.skilltree.my"
netsh winhttp reset proxy
```

## Env for Docker

```powershell
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://proxy.hinet.net:80/", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("HTTPS_PROXY", "http://proxy.hinet.net:80/", [EnvironmentVariableTarget]::Machine)
```

```powershell
Restart-Service docker
docker info
```

```powershell
[Environment]::SetEnvironmentVariable("HTTP_PROXY", $null, [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("HTTPS_PROXY", $null, [EnvironmentVariableTarget]::Machine)
```

```powershell
Restart-Service docker
docker info
```