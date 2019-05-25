# Lab05: Volume Permissions

## 相同 Base 映像檔

```powershell
docker run -it --rm --name ima -v c:\temp\:c:\temp mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
docker run -it --rm --name imb -v c:\temp\:c:\temp mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
```

> 使用 `echo "ima|b" > hi.txt` 在 volume 對同一檔案進行寫入作業。

## 不同 Base 映像檔

```powershell
docker run -it --rm --name ima -v c:\temp\:c:\temp mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
docker run -it --rm --name imb -v c:\temp\:c:\temp mcr.microsoft.com/windows/servercore:ltsc2019 cmd.exe
```

ima &rarr; 新增一個 FromNano.txt
imb &rarr; 新增一個 FromCore.txt

> 使用 `echo "ima" > FromCore.txt` 去寫入對方的檔案。

回到 Host：

```powershell
Get-Acl .\FromNano.txt | fl
Get-Acl .\FromCore.txt | fl
```

> 「S-1-5-93-2-1」「S-1-5-93-2-2」身份是跟著基礎映像檔來產生的，也就是說，使用同一個映像檔來產生 10 個容器，這 10 個容器會拿到同一個 S-x-x 的身份。

## 不同映像檔容器，取得相同身分

Docker for Windows 無法讓容器在啟動設定 Host 本身 LocalAccount。

> 解法來源：<a href="https://github.com/moby/moby/issues/28585" target="_blank">moby #28585</a>

```powershell
docker run -it --rm -v c:\temp\:c:\temp --user "NT AUTHORITY\SYSTEM" mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
docker run -it --rm -v c:\temp\:c:\temp --user "NT AUTHORITY\SYSTEM" mcr.microsoft.com/windows/servercore:ltsc2019 cmd.exe
```

使用 `--user` 指定身份。

---

```powershell
docker run -it --rm --name imc -v c:\temp\:c:\temp --user "NT AUTHORITY\SYSTEM" mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
docker run -it --rm --name imc -v c:\temp\:c:\temp --user "NT AUTHORITY\SYSTEM" mcr.microsoft.com/windows/servercore:ltsc2019 cmd.exe
```

ima &rarr; 新增一個 FromNanoUser.txt
imb &rarr; 新增一個 FromCoreUser.txt

> 使用 `echo "imc" > FromCore.txt` 去寫入對方的檔案。

回到 Host：

```powershell
Get-Acl .\FromNanoUser.txt | fl
Get-Acl .\FromCoreUser.txt | fl
```

---

docker-compose.yml

```compose
version: '3'
services:

  nano:
    image: mcr.microsoft.com/windows/nanoserver:1809
    user: 'NT AUTHORITY\SYSTEM'
    volumes:
      - c:\temp\:c:\temp
    stdin_open: true
    tty: true

  core:
    image: mcr.microsoft.com/windows/servercore:ltsc2019
    user: 'NT AUTHORITY\SYSTEM'
    volumes:
      - c:\temp\:c:\temp
    stdin_open: true
    tty: true
```
