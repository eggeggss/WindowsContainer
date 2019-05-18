# Lab04: Dockerfile - RUN - Installer

以下將使用 dism.exe 來安裝 IIS 角色。

```dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019
LABEL maintainer="kkbruce"
RUN dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart
RUN echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html
CMD [ "cmd" ]
```

---

此範例會安裝 Visual Studio 可轉散發套件。

注意：`Start-Process` 及 `-Wait` 參數的用途在於執行安裝程式。這可確保安裝確實完成之後，才會繼續執行 Docerkfile 中的下一個步驟。否則，處理程序會提前結束，而不會安裝任何項目。

```dockerfile
RUN powershell.exe -Command Start-Process c:\vcredist_x86.exe -ArgumentList '/quiet' -Wait
```

