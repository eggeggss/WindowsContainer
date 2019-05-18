# Lab04: Dockerfile - RUN

建置以下兩個映像檔，並使用 `docker history <image>` 觀察輸出：

Exec form:

```dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN ["powershell", "New-Item", "c:\test"]
```

Shell form:

```dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell New-Item c:\test
```
