#!/usr/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export DISPLAY=:0

# su fuji -c "notify-send 'jj40 plugged'"
# su fuji -c "xset r rate 200 20"
# su fuji -c "setxkbmap -layout us"
# su fuji -c "killall xcape"

su fuji -c "fish -c jj40"
	
