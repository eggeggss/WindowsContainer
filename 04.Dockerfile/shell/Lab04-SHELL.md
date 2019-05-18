# Lab: Dockerfile - SHELL 指令 

```dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# 預設執行 cmd /S /C echo
RUN echo default

# 執行 cmd /S /C powershell -command Write-Host default
RUN powershell -command Write-Host default

# 執行 powershell -command Write-Host hello
SHELL ["powershell", "-command"]
RUN Write-Host hello

# 執行 cmd /S /C echo hello
SHELL ["cmd", "/S", "/C"]
RUN echo hello
```

---

```dockerfile
# escape=`

FROM mcr.microsoft.com/powershell:nanoserver-1803
SHELL ["pwsh","-command"]
RUN New-Item -ItemType Directory C:\Example
ADD helloworld.ps1 c:\example\
RUN c:\example\helloworld.ps1
```
