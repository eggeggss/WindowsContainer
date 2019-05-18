# Lab04: Dockerfile - Volume

```powershell
mkdir -p c:\app\config
echo "Mode=Debug" > c:\app\config\Runtime.config
```

```powershell
docker run `
  --volume c:\app\config\:c:\app\config `
  kkbruce/appdata `
  cat c:\app\config\Runtime.config
```
