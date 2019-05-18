# Windows 10 安裝 Docker CE

安裝 **Hyper-V**：

```powershell
Get-WindowsOptionalFeature -Online -FeatureName Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Restart-Computer -Force
```

安裝 **Containers**，以支援 Windows Container 功能：

```powershell
Get-WindowsOptionalFeature -Online -FeatureName Containers
Enable-WindowsOptionalFeature -Online -FeatureName containers -All
Restart-Computer -Force
```

下載：<a href="https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe" target="_blank">https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe</a> 並進行安裝。

> 如下載連結有變，請參考：<a href="https://store.docker.com/" target="_blank">https://store.docker.com/</a> 重新下載。

---

安裝完成後，在工作列會看到 ![whale-x-win.png](https://d1q6f0aelx0por.cloudfront.net/icons/whale-x-win.png) 圖示。

請開啟 Windows PowerShell 並輸入：

```powershell
docker version
docker info
```

確認 Docker 已安裝成功。在 ![whale-x-win.png](https://d1q6f0aelx0por.cloudfront.net/icons/whale-x-win.png) 圖示按右鍵，選擇「**Switch to Windows containers...**」可切換至 Windows Container。