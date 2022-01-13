function set_keybind

    setxkbmap -layout us
    xkbcomp ~/.keymap.xkb $DISPLAY

    # Escape as extra modifier key
    killall xcape ^ /dev/null
    xcape -e "Mode_switch=Escape"

    # repeat rate
    exec xset r rate 190 20

end

