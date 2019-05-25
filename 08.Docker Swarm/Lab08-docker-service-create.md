# Lab08: docker service create

## create service

> 𧪸師做。

```powershell
docker service create `
--name db `
--constraint "node.labels.myname=<host_name>" `
kkbruce/redis-windows
```

> 錯誤是故意的。

```powershell
docker service ls
docker service ps <service_name>
docker service inspect <service_name>
docker service rm <service_name>
```

## 1 db - 1 web

> - 加上 `--constraint "node.labels.myname=<your_name>"`，才能每個人都練習到。
> - node.hostname==<host_name> 也行。

```powershell
docker service create `
--name <host_name>db `
--network skynet `
--constraint "node.labels.os==windows" `
--constraint "node.hostname==<host_name>"
kkbruce/redis-windows
```

```powershell
docker service create `
--name <host_name>web `
--network skynet `
--constraint "node.labels.os==windows" `
<username>/aspnetmvcapp:health
```

> mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

```powershell
docker service ls
docker service ps <service-name>
```

> - Invoke-WebRequest -Uri http://10.0.0.x -UseBasicParsing
> - 不能自己請求自己的 IP。

## 2 db - 3 web

```powershell
docker service scale <host_name>db=2 <host_name>web=3
```

另一種是用更新組態的方式：

```powershell
docker service update --replicas=2 <host_name>web
```

```powershell
docker service ls
docker service ps <service-name>
```
## update

更新 service 的組態：

```powershell
docker service update `
--force `
--update-parallelism 1 `
--update-delay 10s `
<host_name>web
```

## roll back

> - 加上 `--constraint "node.labels.myname=<your_name>"`，才能每個人都練習到。
> - node.hostname==<host_name> 也行。

```powershell
docker service create `
--name <host_name>roll `
--constraint "node.hostname==<host_name>" `
mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

docker service ls
```

```powershell
docker service update --replicas=2 <host_name>roll
docker service ls
```

```powershell
docker service rollback <host_name>roll
docker service ls
```

## --env

> - 請加上 `--constraint "node.labels.myname=<your_name>"`，才能每個人都練習到。
> - node.hostname==<host_name> 也行。

```powershell
docker service create `
--name <host_name>env `
--env Mode=Debug `
--constraint "node.hostname==<host_name>" `
mcr.microsoft.com/windows/nanoserver:1809
```

## --replicas, --update-*

```powershell
docker network create -d overlay webnet
docker network ls
```

> - 請加上 `--constraint "node.labels.myname=<your_name>"`，才能每個人都練習到。
> - node.hostname==<host_name> 也行。

```powershell
docker service create `
--name <host_name>myiis `
--replicas=3 `
--network webnet `
--update-delay 10s `
--update-parallelism 3 `
--constraint "node.labels.os==windows" `
--constraint "node.hostname==<host_name>" `
mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019
```

## --mode

> 講師做就好。

```powershell
docker service create`
--name buddha `
--mode global `
kkbruce/buddha
```

> 注意，它不是背景式應用程式造成的影響。

```powershell
--mode replicated
--mode global
```

- `replicated` Service 以複本為單位，簡單說，你要產生幾份容器的複本。
- `global` 在會每個 node (狀態 active) 都執行一份此 service。

```powershell
docker service rm buddha
```

## --publish 

> 講師做。

```powershell
docker service create `
--name kkweb `
--replicas 2 `
--publish 80:80 `
--constraint "node.hostname==<host_name>" `
mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019
```

```powershell
docker service ls
docker service ps kkweb
```

> - Invoke-WebRequest -Uri http://10.0.0.x -UseBasicParsing
> - 不能自己請求自己的 IP。

注意，在未支援 `Ingress` Mode (routing mesh) 的 Windows Docker Host，需改用 `mode=host` 方式，並且會配合 `--endpoint-mode=dnsrr`

```powershell
--endpoint-mode=dnsrr
--publish published=8080,target=80,mode=host
```

## --publish (學員)

```powershell
New-NetFirewallRule -DisplayName "Docker Swarm Web Lab Port" -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9000-9099 -Name docker-swarm-weblab-port
```

> - 請加上 `--constraint "node.labels.myname=<your_name>"`，才能每個人都練習到。
> - node.hostname==<host_name> 也行。

```powershell
docker service create `
--name <host_name>kkweb `
--replicas 2 `
--publish 900?:80 `
--constraint 'node.hostname==<host_name>' `
mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019
```

- kklab1 &rarr; 9001
- kklab2 &rarr; 9002

以此類推。

> - Invoke-WebRequest -Uri http://10.0.0.x:900? -UseBasicParsing
> - 不能自己請求自己的 IP。