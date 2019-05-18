# Lab03: Container action control

```powershell
docker create -it --name srv2019 mcr.microsoft.com/windows/servercore:ltsc2019
```

```powershell
docker ps -a
```

```powershell
docker start srv2019
```

```powershell
docker ps
```

```powershell
docker stop srv2019
```

```powershell
docker start -i srv2019
```

```powershell
exit
```

---

```powershell
docker stop srv2019
docker ps -a
docker start srv2019
docker kill srv2019
docker ps -a
```