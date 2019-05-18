# Lab04: ENV

```powershell
docker build -t <username>/env:v1 .
```

```powershell
docker build -t <username>/env:v2 -f dockerfile2 .
```

```powershell
docker run -it --rm kkbruce/env:v2 powershell
Get-ChildItem env:
```
