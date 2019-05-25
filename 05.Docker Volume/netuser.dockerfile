FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN net user /add kkbruce
USER kkbruce