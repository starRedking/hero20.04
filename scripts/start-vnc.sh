#!/usr/bin/env bash

for i in $(seq 1 10)
do
    sleep 1
    xdpyinfo -display ${DISPLAY} >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        break
    fi
    echo "Waiting for Xvfb..."
done
x11vnc -storepasswd $VNC_PASS /etc/xpass && x11vnc -usepw -rfbport 5900 -rfbauth /etc/xpass -geometry $VNC_RESOLUTION -forever -alwaysshared -permitfiletransfer -bg -desktop $VNC_TITLE
