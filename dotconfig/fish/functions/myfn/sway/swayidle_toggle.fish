function swayidle_toggle
    if killall swayidle ^/dev/null
        notify-send kill swayidle
    else
        swayidle_compatible
        notify-send run swayidle
    end
end
