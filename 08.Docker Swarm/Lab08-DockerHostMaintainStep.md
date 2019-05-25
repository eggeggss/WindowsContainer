# Lab08: Docker Host Maintain Step

當 Docker Host 需要進行主機維護、安裝更新、軟體升級或問題排除時，可能需要進行主機的重開機等動作。尤其是，主機進入 Swarm Mode 之後，不建議直接重開機，以下是建議重開機流程。

## Step 1: 非 Swarm Mode 維護流程

確認 docker 是否為 Swarm 狀態

```powershell
docker info
```

非 Swarm Mode 最簡單，將 Docker Host 的 Container 進行 `docker stop` 然後重開機。

```powershell
docker stop $(docker ps -a -q)
```

> 如果當初的 `docker run` 有設定 Restart policies，例如：`--restart=always`，那麼重開機後 Container 會自己進入 Running 狀態。

```powershell
Restart-Computer -Force
```

結束非 Swarm Mode 的 Host 維護。

## Step 2: Swarm Mode 維護流程

查詢節點狀態：

```powershell
docker node ls
```

更新維護節點狀態為 `drain`：

```powershell
docker node update --availability drain <HOSTNAME>
```

> 此時請等待一會兒，讓 Docker Swarm 將此 Node 上的 Task 轉移至其他 Swarm Host。

停用 `docker` Service

```powershell
Stop-Service docker
```

> 開始進行維護或升級作業。

進行重開機作業：

```powershell
Restart-Computer -Force
```

> 如果有使用 `docker run` 或 docker-compose 啟動的執行個體容器，最好一併先進行 `docker stop` 等再關機。

### 重啟動 Swarm Mode

當 Host 完成重開機後。如果 `docker` Service 沒有起來，可執行以下指令來啟動 `docker` Service：

```powershell
Start-Service docker
```

使用 `docker images` 或 `docker ps` 確定 `docker` Service 啟動完成。

更新節點狀態為 `active`：

```powershell
docker node update --availability active <HOSTNAME>
```

這樣 Host 的 Swarm Mode 就會加入可服務清單中。

> 如果 `docker run` 或 docker-compose 未使用 `restart` 參數，那麼需要手動啟動。