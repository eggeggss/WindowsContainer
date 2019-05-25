# Lab05: New-SmbShare

## SmbShare

分享方：

```powershell
mkdir c:\Public

New-SmbShare -Name "Public" `
-Path "C:\Public" `
-FullAccess  Everyone `
-Description "Public Read Folder"
```

## New-PSDrive

> 請指定為對方 IP 或 kklab? 名稱。
> - 查詢主機名稱 `hostname`

連線方：

```powershell
New-PSDrive –Name "P" –PSProvider FileSystem –Root "\\<hostname>\Public" –Persist
Get-PSDrive
p:
echo "Hi, I'm kklab0" > hi.txt
dir
```

分享方：

```powershell
cd c:\Public
dir
cat .\hi.txt
```

### 取得目前 `SmbShare` 的權限資訊：

```powershell
Get-SmbShareAccess -Name "Public"
```

為使用者套用新的權限：

```powershell
Grant-SmbShareAccess -Name "Public" -AccountName "Users" -AccessRight Change
```

> `AccessRight` 的值有 Full, Change, Read。

觀察目前網路資料夾的連線使用狀態：

```powershell
Get-SmbSession
Close-SmbSession -SessionId <SessionId> -Force
```

### 刪除分享

連線方：

```powershell
Remove-PSDrive -Name "P"
Get-PSDrive
```

分享方：：

```powershell
Remove-SmbShare -Name "Public"
```


