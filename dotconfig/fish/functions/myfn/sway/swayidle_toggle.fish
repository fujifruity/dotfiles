function swayidle_toggle
    if killall swayidle ^/dev/null
        simplestatus send kill swayidle
    else
        swayidle_compatible
        simplestatus send run swayidle
    end
end
