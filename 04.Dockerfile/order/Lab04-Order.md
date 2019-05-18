# Lab04: Dockerfile - Order

建立兩個 Dockerfile，並 `docker build` 產生兩個映像檔。

```dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN mkdir skilltree-1
RUN mkdir skilltree-2
RUN mkdir skilltree-3
RUN mkdir skilltree-4
```

```dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN mkdir skilltree-1
RUN mkdir skilltree-2
RUN mkdir skilltree-5
RUN mkdir skilltree-4
```

使用兩個 `docker history` 觀察分層資訊。