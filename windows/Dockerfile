FROM ubuntu:22.04

LABEL org.opencontainers.image.source=https://github.com/y0ung3r/isolated-max

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install common utilities
RUN apt-get update && \
    apt-get install -y \
        # Utils \
        curl \
        gpg \
        locales \
        gnome-keyring && \
    rm -rf /var/lib/apt/lists/*

# Install MAX
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.max.ru/linux/deb/public.asc | gpg --dearmor -o /etc/apt/keyrings/max.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/max.gpg] https://download.max.ru/linux/deb stable main" > /etc/apt/sources.list.d/max.list && \
    apt-get update && \
    apt-get install -y max --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install MAX dependencies
RUN apt-get update && \
    apt-get install -y \
        # X11/XCB \
        libxcb-cursor0 \
        libx11-xcb1 \
        libxcb-xkb1 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-render-util0 \
        libxcb-shape0 \
        libxcb-xinerama0 \
        libxkbcommon-x11-0 \
        libxkbfile1 \
        libdbus-1-3 \
        dbus-x11 \
        # Network \
        libnss3 \
        libnspr4 \
        # OpenGL \
        libopengl0 \
        libglx0 \
        libglvnd0 \
        libegl1 \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        libglx-mesa0 \
        libgbm1 \
        libdrm2 \
        # Media \
        libspa-0.2-modules \
        libpipewire-0.3-0 \
        pulseaudio \
        libasound2 \
        libpulse0 \
        --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Configure audio streaming
RUN mkdir -p /etc/pulse && \
    echo "default-server = unix:/mnt/wslg/PulseServer" > /etc/pulse/client.conf && \
    echo "autospawn = no" >> /etc/pulse/client.conf

CMD ["max", "--no-sandbox"]