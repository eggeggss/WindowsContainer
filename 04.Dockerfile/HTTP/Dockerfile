FROM mcr.microsoft.com/windows/servercore:ltsc2019

# 將 $ProgressPreference 設定成 SilentlyContinue 以更快速的下載。
RUN powershell.exe -Command \
  $ErrorActionPreference = 'Stop'; \
  $ProgressPreference = 'SilentlyContinue'; \
  Invoke-WebRequest https://www.python.org/ftp/python/3.5.1/python-3.5.1.exe -OutFile c:\python-3.5.1.exe ; \
  Start-Process c:\python-3.5.1.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
  Remove-Item c:\python-3.5.1.exe -Force

# 採用 .NET WebClient 進行 HTTP 呼叫
# FROM mcr.microsoft.com/windows/servercore:ltsc2019

# RUN powershell.exe -Command \
#   $ErrorActionPreference = 'Stop'; \
#   (New-Object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.5.1/python-3.5.1.exe','c:\python-3.5.1.exe') ; \
#   Start-Process c:\python-3.5.1.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
#   Remove-Item c:\python-3.5.1.exe -Force