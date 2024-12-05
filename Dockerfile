FROM mcr.microsoft.com/dotnet/sdk:8.0

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

RUN if [ ! -f /etc/apt/sources.list ]; then \
    echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib" > /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib" >> /etc/apt/sources.list; \
    fi \
    && apt-get update \
    && apt-get install -y \
    zip \
    curl \
    git \
    openssh-client \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*