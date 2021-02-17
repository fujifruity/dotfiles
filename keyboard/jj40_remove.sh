#!/usr/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export DISPLAY=:0

# su fuji -c "setxkbmap -layout us"
# su fuji -c "xkbcomp /home/fuji/.keymap.xkb $DISPLAY"
# su fuji -c "killall xcape"
# su fuji -c "xcape -e 'Mode_switch=Escape'"
# su fuji -c "notify-send 'jj40 removed'"

su fuji -c "fish -c jj40_remove"
