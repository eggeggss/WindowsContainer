# Lab05:  SMB Global Mapping

> 身分要用要分享方的帳號。

```powershell
$creds = Get-Credential

New-SmbGlobalMapping `
-RemotePath \\svr01\Public `
-Credential $creds `
-LocalPath G:
```

```powershell
g:
dir
mkdir files
echo "hi" > file.txt
c:
```

```powershell
docker run -it --rm --name smbdemo -v G:\files\:c:\data mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
```

---

過程有碰到 `Access is denied`：

```powershell
docker run -it --rm --name smbdemo -v G:\files:c:\data --user "NT AUTHORITY\SYSTEM" mcr.microsoft.com/windows/nanoserver:1809 cmd.exe
```

```DOS
echo "from container" > container.txt
```

---

```powershell
docker run -d --name smbiis `
-p 80:80 `
-v G:\files:c:\inetpub\wwwroot\data `
--user "NT AUTHORITY\SYSTEM" `
mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019
```

去公開網路瀏覽：http://ip/hi.txt。

> 放著 5 分鐘。