function swayidle_compatible -d 'run swayidle according to whether the machine is laptop or desktop'
    set sec_to_dimmer  600
    set sec_to_suspend 610

    killall swayidle
    if is_laptop
        swayidle -w \
          timeout $sec_to_dimmer 'fish -c "backlight down"' \
          resume 'fish -c "backlight up"' \
          timeout $sec_to_suspend 'systemctl suspend' \
          before-sleep 'swaylock -f -i /tmp/todays_wallpaper' \
          # after-resume 'fish -c auto_backlight; connmanctl disable wifi; sleep 1; connmanctl enable wifi' ^/dev/null &
          after-resume 'fish -c auto_backlight' ^/dev/null &
    else
        swayidle -w \
          timeout $sec_to_dimmer 'dunstify sleepy' \
          timeout $sec_to_suspend 'systemctl suspend' \
          before-sleep 'swaylock -f -i /tmp/todays_wallpaper' ^/dev/null &
    end
    disown
end
