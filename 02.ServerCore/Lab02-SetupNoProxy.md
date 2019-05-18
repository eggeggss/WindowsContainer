# Lab02: Setup No Proxy

第三種

```powershell
[Environment]::SetEnvironmentVariable("NO_PROXY", "http://proxy.hinet.net:80/", [EnvironmentVariableTarget]::Machine)
```

> 注意，名稱會區分IP、短名稱與全名稱。

例如：`172.17.88.179,skilltree.my,www.skilltree.my` 都是指向同一台 Host 的話，那麼建議三個值都設定至 NO_PROXY 裡。