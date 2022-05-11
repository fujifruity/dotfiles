function swayidle_toggle
    if killall swayidle ^/dev/null
        dunstify -u low kill swayidle
    else
        swayidle_compatible
        dunstify -u low run swayidle
    end
end
