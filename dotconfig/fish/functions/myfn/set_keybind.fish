function set_keybind

    setxkbmap -layout us
    set keymap (test -f .keymap-xrdp.xkb ; and echo ~/.keymap-xrdp.xkb ; or echo ~/.keymap.xkb)
    xkbcomp $keymap $DISPLAY
    killall xcape ^ /dev/null
    xcape -e "Mode_switch=Escape"

end

