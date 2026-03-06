FROM ubuntu:22.04

LABEL org.opencontainers.image.source=https://github.com/y0ung3r/isolated-max

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install common utilities
RUN apt-get update && \
    apt-get install -y \
        curl \
        gpg && \
    rm -rf /var/lib/apt/lists/*

# Install MAX
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.max.ru/linux/deb/public.asc | gpg --dearmor -o /etc/apt/keyrings/max.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/max.gpg] https://download.max.ru/linux/deb stable main" > /etc/apt/sources.list.d/max.list && \
    apt-get update && \
    apt-get install -y max && \
    rm -rf /var/lib/apt/lists/*

# Install noVNC and their dependencies
RUN apt-get update && \
    apt-get install -y \
        xvfb \
        x11vnc \
        novnc \
        websockify \
        openbox \
        locales \
        gnome-keyring \
        libnss3 \
        libnspr4 \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libcups2 \
        libdrm2 \
        libxkbcommon0 \
        libxkbcommon-x11-0 \
        libxcomposite1 \
        libxdamage1 \
        libxrandr2 \
        libgbm1 \
        libxss1 \
        libasound2 \
        libpangocairo-1.0-0 \
        libpango-1.0-0 \
        libatspi2.0-0 \
        libwayland-egl1 \
        libwayland-client0 \
        libwayland-cursor0 \
        libwayland-server0 \
        x11-xserver-utils \
        dbus-x11 \
        pulseaudio \
        libpulse0 \
        libopengl0 \
        libegl1 \
        libxshmfence1 \
        libxcb-cursor0 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-render-util0 \
        libxcb-shape0 \
        libxcb-xinerama0 \
        libxcb-xkb1 \
        libxcb-randr0 \
        libxcb-xtest0 \
        libxcb-util1 \
        libx11-xcb1 \
        libpipewire-0.3-0 \
        libsecret-1-0 && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

WORKDIR max
COPY entrypoint.sh .
RUN chmod +x /max/entrypoint.sh

# Run MAX through noVNC
EXPOSE 8080
CMD ["/max/entrypoint.sh"]