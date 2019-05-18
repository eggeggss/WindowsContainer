# Lab02: 查詢環境變數

```powershell
Get-ChildItem env:
Get-ChildItem variable:
```

查詢某一個環境變數值：

```powershell
Get-ChildItem env:Path
Get-ChildItem env:Path | fl
```

---

`$Name:Item` 可以取出變數值。

```powershell
cd $env:programdata
cd $env:grogramfile
$env:clientname
```

