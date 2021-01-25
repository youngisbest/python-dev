FROM ubuntu:18.04

WORKDIR /root
ADD ./tools /root/

RUN cp /root/chromedriver /usr/bin/ \
 && rm /root/sources.list /root/chromedriver \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    openssh-server \
    python3 \
    python3-pip \
    python3-setuptools \
    wget \
    libxss1 \
    libappindicator1 \
    libindicator7 \
    libpsl5 \
    publicsuffix \
    libxss1 \
    libappindicator1 \
    libindicator7 \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatspi2.0-0 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxtst6 \
    xdg-utils \
 && chmod 755 /usr/bin/chromedriver \
 && touch /etc/default/google-chrome \
 && dpkg -i /root/google-chrome-stable_current_amd64.deb \
 && update-alternatives --install /usr/bin/python python /usr/bin/python3 1 \
 && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 \
 && python -m pip install --upgrade pip \
 && pip install selenium bs4 pyquery requests virtualenv \
 && /etc/init.d/ssh start \
 && rm /root/google-chrome-stable_current_amd64.deb \
 && rm -rf /var/lib/apt/lists
  