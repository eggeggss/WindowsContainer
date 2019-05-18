# Lab04: Buddha

於 PowerShell 執行：

```powershell
mkdir lab04\buddha
cd lab04\buddha
notepad Dockerfile
```

貼上：

```powershell
FROM mcr.microsoft.com/windows/nanoserver:1809
COPY ascii-Buddha.txt .
CMD type ascii-Buddha.txt
```

名稱指定 `Dockerfile`。

> - 不要有副名。
> - 小技巧：存檔時可用 "Dockerfile" (雙引號)。
> - 或使用下面指令修改。

```powershell
cmd.exe
rename Dockerfile.txt Dockerfile
exit
```

---

```powershell
notepad ascii-Buddha.txt
```

貼上 Lab 裡的 ascii-Buddha.txt 內容。

Save As &rarr; Encoding &rarr; UTF-8

---

```powershell
docker build -t <username>/buddha .
docker run --rm <username>/buddha
```
