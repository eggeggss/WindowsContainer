FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV REDIS_VERSION=3.2.100
ENV REDIS_DIR="C:\Redis"

RUN Write-Host "REDIS_DIR: " ${REDIS_DIR}; \
    Write-Host "REDIS_VERSION: " $REDIS_VERSION