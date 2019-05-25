# Lab08: Enable Swarm Mode

```powershell
ipconfig
docker swarm init --advertise-addr=<IPAddress> --listen-addr=<IPAddress>:2377
```

To Worker Host: 

```powershell
docker swarm join --token <token> <IPAddress>:2377
```

如果事後忘記 token，可以在 Manager 執行：

```powershell
docker swarm join-token worker
```

如果要取得加入 Manager 身份的 Token，按照說明，執行：

```powershell
docker swarm join-token manager
```

> - 網路組態有異動，遠端桌面會斷線正常。
> - 如果加入 manager 時發生 `manager stopped: can't initialize raft node: rpc error: code = Unavailable desc = grpc: the connection is unavailable` 的錯誤。如果網路埠與防火牆沒有問題，那麼再確認環境變數的"NO_PROXY"是否**包含 IP 位址**設置。

在 manager 執行 `docker info`，確認 Swarm: 段落。
