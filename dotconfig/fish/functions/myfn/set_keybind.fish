function set_keybind

    logger set_keybind

    setxkbmap -layout us

    set keymap (is_laptop ; and echo ~/.keymap.xkb ; or echo ~/.keymap-xrdp.xkb)
    # set keymap ~/.keymap.xkb

    xkbcomp $keymap $DISPLAY
    killall xcape ^ /dev/null
    xcape -e "Mode_switch=Escape"

end

