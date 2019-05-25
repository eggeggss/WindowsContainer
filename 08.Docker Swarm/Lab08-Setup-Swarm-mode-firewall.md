# Lab: Setup Swarm mode - firewall

TCP：

```powershell
New-NetFirewallRule -DisplayName "Docker Swarm TCP Port" -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Allow -Protocol TCP -LocalPort @('2377', '7946') -Name docker-swarm-tcp-port
```

UDP：

```powershell
New-NetFirewallRule -DisplayName "Docker Swarm UDP Port" -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Allow -Protocol UDP -LocalPort @('4789', '7946') -Name docker-swarm-udp-port
```

---

```powershell
New-NetFirewallRule -DisplayName 'Docker Swarm Port' -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Action Allow -Protocol TCP -LocalPort 2377 -Name docker-swarm-port

New-NetFirewallRule -DisplayName 'Docker Swarm Node TCP Port' -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Action Allow -Protocol TCP -LocalPort 7946 -Name docker-swarm-node-tcp-port

New-NetFirewallRule -DisplayName 'Docker Swarm Node UDP Port' -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Action Allow -Protocol UDP -LocalPort 7946 -Name docker-swarm-node-udp-port

New-NetFirewallRule -DisplayName 'Docker Swarm Overlay Port' -Profile @('Domain', 'Public', 'Private') -Direction Inbound -Action Allow -Protocol UDP -LocalPort 4789 -Name docker-swarm-overlay-port
```
