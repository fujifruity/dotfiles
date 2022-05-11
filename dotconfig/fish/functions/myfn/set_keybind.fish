function set_keybind

    setxkbmap -layout us
    xkbcomp ~/.keymap.xkb $DISPLAY

    # Escape as extra modifier key
    killall xcape
    xcape -e "Mode_switch=Escape"

    # repeat rate
    xset r rate 190 20

end

