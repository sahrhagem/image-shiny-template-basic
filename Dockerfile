FROM rocker/shiny:4.5.3

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libcairo2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff5-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libgit2-dev \
    libpq-dev \
    unixodbc-dev \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libxkbcommon0 \
    libgbm1 \
    libasound2t64 \
    libxshmfence1 \
    libuv1-dev \
    pkg-config \
    build-essential \
    zlib1g-dev \
    libgit2-dev \
    libfontconfig1-dev \
    libwebp-dev    
    make \
    g++ \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#Install Chrome
RUN apt-get install -y --no-install-recommends \
    chromium  \
    chromium-driver 

RUN export CHROME_BIN=/usr/bin/chromium
