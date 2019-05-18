# Lab02: New-NetFirewallRule

## 新增 Web Port

```powershell
New-NetFirewallRule -DisplayName "Allow Outbound Port 80, 443, 8080" -Direction Inbound -LocalPort 80, 443, 8080 -Protocol TCP -Action Allow
```

## 設定檔案分享

```powershell
Set-NetFirewallRule -DisplayGroup "File And Printer Sharing" -Enabled True
```

## 新增 ICMP by v4 v6

> 設定前，先 `ping 10.0.0.x`

```powershell
New-NetFirewallRule -DisplayName "Allow inbound ICMPv4" -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow
New-NetFirewallRule -DisplayName "Allow inbound ICMPv6" -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Protocol ICMPv6 -IcmpType 8 -Action Allow
```

> 設定後，再 `ping 10.0.0.x`

## 新增 Docker Port

```powershell
New-NetFirewallRule -DisplayName "Docker Remote (SSL) Port" -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Action Allow -Protocol TCP -LocalPort 2375-2376 -Name docker-remote-port
```

## 查詢、刪除

```powershell
Get-NetFirewallRule -Name *docker*
Get-NetFirewallRule -DisplayName *docker*
Remove-NetFirewallRule -Name 'docker-remote-port'
```

## 停用與啟用

停用 Firewall：

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
```

> 請非常小心。應該只有在進行問題排除時使用。

啟用 Firewall：

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```