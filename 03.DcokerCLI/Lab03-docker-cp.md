# Lab03: docker cp

```powershell
#docker stop helloExec  #Windows 10

echo "Hello docker cp" > helloCP.txt

docker cp .\helloCP.txt helloExec:"C:\"

docker cp helloExec:"C:\hello.txt" c:\

Get-Content .\hello.txt

#docker start helloExec #Windows 10

docker exec helloExec powershell Get-Content .\helloCP.txt
```
