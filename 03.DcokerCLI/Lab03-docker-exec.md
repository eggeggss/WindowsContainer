# Lab03: docker exec

```powershell
docker run -it mcr.microsoft.com/windows/servercore:ltsc2019 cmd.exe
echo "hello container" > hello.txt
```

開一個新 Shell 視窗。

```powershell
docker ps
docker rename CONTAINERID helloExec
docker exec helloExec ping localhost
docker exec helloExec powershell Get-Content hello.txt
```

---

## Tracing 技巧

```powershell
docker exec helloExec powershell Get-Content hello.txt -wait
```

回第一個 Shell：

```powershell
echo "Hello Tracing log" > hello.txt
```

回第二個 Shell。

---

## 進入執行中的容器

```powershell
docker exec -it helloExec powershell
cat .\hello.txt
Add-Content -Value "New Tracing log" -Path .\hello.txt
cat .\hello.txt
exit
```
