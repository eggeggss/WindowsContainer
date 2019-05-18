# Lab03: Hello Container

```powershell
docker run -it mcr.microsoft.com/powershell:nanoserver-1809
```

```powershell
mkdir app
cd .\app
Add-Content hello.ps1 'Write-Host "Hello Container"'
exit
```

```powershell
docker ps
docker ps -a
docker commit <containerid> <username>/Hello:1.0
docker commit <containerid> <username>/hello:1.0
```

```powershell
docker images
docker run -it --rm <username>/hello:1.0 pwsh.exe .\app\hello.ps1
```
