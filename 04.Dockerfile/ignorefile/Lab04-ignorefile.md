# Lab04: .dockerignore file

建立兩個目錄與檔案

1. /temp/temp.txt
2. /test/test.cmd

test.cmd 加入以下腳本：

```dos
echo 'Hi, I am test.cmd'
```

於 Context 的根目錄，新增 .dockerignore 檔，並加入：

```dockerfile
temp/
Lab04-ignorefile.md
```

於 Context 的根目錄，新增 Dockerfile 檔，並加入：

```dockerfile
FROM mcr.microsoft.com/windows/nanoserver:1809
COPY . .
WORKDIR /test
CMD test.cmd
```

建置

```powershell
docker build -t <username>/ignoretest:<tag> .
```

測試

```powershell
docker run --rm <username>/ignoretest:1.0
```

查詢 C:\

```powershell
docker run -it --rm <username>/ignoretest:1.0 cmd.exe
```

