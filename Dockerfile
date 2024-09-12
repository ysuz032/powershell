ARG PS_VER=7.3.6

FROM arm64v8/ubuntu:latest
# Install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl wget tar sudo && \
    apt-get install -y libicu-dev
# Download powershell
RUN wget -O /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v${PS_VER}/powershell-7.3.6-linux-arm64.tar.gz
# Install
RUN mkdir -p /usr/local/microsoft/powershell/${PS_VER} && \
    tar zxf /tmp/powershell.tar.gz -C /usr/local/microsoft/powershell/${PS_VER} && \
    chmod +x /usr/local/microsoft/powershell/${PS_VER}/pwsh && \
    ln -s /usr/local/microsoft/powershell/${PS_VER}/pwsh /usr/local/bin/pwsh