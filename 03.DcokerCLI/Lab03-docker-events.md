# Lab03: docker events

```powershell
docker events --since '10m'
docker events --since 2018-12-8
docker events --filter 'event=stop'
docker events --since 2018-12-8 --filter 'event=die'
docker events --since 2018-12-8 --filter 'event=exec_die'
docker events --filter 'scope=swarm'
```
