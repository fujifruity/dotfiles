function swayidle_toggle
    if killall swayidle ^/dev/null
        notify-send -u low kill swayidle
    else
        swayidle_compatible
        notify-send -u low run swayidle
    end
end
