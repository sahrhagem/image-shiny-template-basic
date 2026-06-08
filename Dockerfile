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
    libwebp-dev \
    make \
    g++ \
    git \
    chromium  \
    chromium-driver \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    chromium-driver \
    && if command -v chromium; then \
         ln -sf "$(command -v chromium)" /usr/bin/google-chrome; \
         ln -sf "$(command -v chromium)" /usr/bin/chromium-browser; \
       elif command -v chromium-browser; then \
         ln -sf "$(command -v chromium-browser)" /usr/bin/chromium; \
         ln -sf "$(command -v chromium-browser)" /usr/bin/google-chrome; \
       else \
         echo "No chromium binary found"; exit 1; \
       fi \
    && command -v chromedriver \
    && /usr/bin/chromium --version \
    && chromedriver --version \
    && rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER=/usr/bin/chromedriver
COPY DESCRIPTION /tmp/app-deps/DESCRIPTION

RUN R -e "install.packages('pak', repos='https://cloud.r-project.org')" && \
    R -e "pak::local_install_deps('/tmp/app-deps')"

RUN ln -sf /usr/bin/chromium /usr/bin/google-chrome
