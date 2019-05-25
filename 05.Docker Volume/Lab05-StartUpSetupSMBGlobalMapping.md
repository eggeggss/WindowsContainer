# Lab05- Start Up Setup SMBGlobalMapping

新增 Set-SMBGlobalMapping.ps1

```powershell
$secpasswd = ConvertTo-SecureString <yourpassword> -AsPlainText -Force;
$creds = New-Object System.Management.Automation.PSCredential ("domain\user", $secpasswd);
New-SmbGlobalMapping -RemotePath 'RemotePath' -Credential $creds -LocalPath X:;
```

加入排程器：

```powershell
$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-file C:\data\Set-SMBGlobalMapping.ps1" -WorkingDirectory "C:\data";
$Trigger = New-ScheduledTaskTrigger -AtStartup;
$Settings = New-ScheduledTaskSettingsSet -DontStopOnIdleEnd -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 10 -StartWhenAvailable;
$Settings.ExecutionTimeLimit = "PT0S";
$SecurePassword = ConvertTo-SecureString <yourpassword> -AsPlainText -Force;
$UserName = "domain\user";
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword;
$Password = $Credentials.GetNetworkCredential().Password;
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings;
$Task | Register-ScheduledTask -TaskName 'SMBGlobalShare' -User "domain\user" -Password $Password;
```
