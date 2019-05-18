# Cmder

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -UseBasicParsing -OutFile cmder.zip https://github.com/cmderdev/cmder/releases/download/v1.3.8/cmder_mini.zip

Expand-Archive cmder.zip -DestinationPath "$Env:ProgramFiles\cmder"

$newCmPath = "$env:ProgramFiles\cmder;" + [Environment]::GetEnvironmentVariable("PATH",[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $newCmPath,[EnvironmentVariableTarget]::Machine)
```

```powershell
logoff
```

```powershell
cmder
```

### 新增分割畫面快速鍵

Keys & Macro：

&rarr; Split: Duplicate active ‘shell’ split to bottom: Split(0,0,50) &rarr; `O + Ctrl + Shift`
&rarr; Split: Duplicate active ‘shell’ split to right: Split(0,50,0) &rarr; `E + Ctrl + Shift`

> 快速鍵參考 ConEmu 而來。

### 修改 PowerShell 啟動後預設路徑

PowerShell (Admin) 預設啟動後的路徑是 *C:\WINDOWS\system32*，在 Startup &rarr; Tasks 找到 PowerShell (Admin)

```powershell
*PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''"
```

新增 `-new_console:{your path}` 參數：

```powershell
*PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''" -new_console:a:d:c:\
```

> 參考：<a href="https://conemu.github.io/en/NewConsole.html" target="_blank">Switches -new_console</a>

#### 載入 $profile 選項

cmder 預設不載入 `$profile` 選項，如果要載入 `$profile` 組態，可移除 `-NoProfile` 參數。

### 雙擊關閉視窗

General &rarr; Tab bar &rarr; Tab double click actions &rarr; 選擇 Close tab。

### new console 提示

預設點擊分頁會進行 `Ctrl + T` 新增分頁視窗，如果要直接進行預設 Shell 分頁：

General &rarr; Confirm &rarr; 取消「Confirm creating new console/tab (Win+W, toolbar[+])」選項。

## 設定為 Server Core 預設 Shell

```powershell
Set-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name Shell -Value Cmder.exe
```