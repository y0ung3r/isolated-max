#!/bin/bash

rm -f /tmp/.X1-lock /tmp/.X11-unix/X1 /var/run/dbus/pid
mkdir -p /var/run/dbus
dbus-daemon --system --fork

eval $(echo -n \"password\" | gnome-keyring-daemon --daemonize --login)
gnome-keyring-daemon --start --components=secrets &

Xvfb :1 -screen 0 1280x1024x24 &
export DISPLAY=:1
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:\$LD_LIBRARY_PATH
export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p \$XDG_RUNTIME_DIR && chmod 700 \$XDG_RUNTIME_DIR

openbox-session &
x11vnc -display :1 -nopw -forever -shared -noxdamage -bg -xkb &
/usr/share/novnc/utils/launch.sh --vnc localhost:5900 --listen 8080 &

sleep 5

max --no-sandbox --disable-gpu --password-store=basic