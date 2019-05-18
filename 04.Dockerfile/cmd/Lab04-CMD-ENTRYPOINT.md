# Lab04: CMD, ENDTRYPOINT

## CMD

```powershell
docker build -t <username>/cmdtest .
```

```powershell
docker run <username>/cmdtest
```

## ENTRYPOINT

```powershell
docker build -t <username>/entrypointtest -f Dockerfile.Entrypoint .
```

```powershell
docker run <username>/entrypointtest
docker run <username>/entrypointtest www.pchome.com.tw
docker run <username>/entrypointtest -n 1 www.pchome.com.tw
```
