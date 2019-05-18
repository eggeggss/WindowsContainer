FROM mcr.microsoft.com/windows/servercore:ltsc2019
LABEL Maintainer="kkbruce" Description="IIS" Vendor="Microsoft" Version="1803"
RUN powershell -Command Add-WindowsFeature Web-Server
# Todo: add some test HTML page.
RUN echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html
# or
# COPY index.html /inetpub/wwwroot
# COPY index.html c:/inetpub/wwwroot
# COPY index.html c:\inetpub\wwwroot will not work.
EXPOSE 80
CMD [ "ping localhost -t" ]