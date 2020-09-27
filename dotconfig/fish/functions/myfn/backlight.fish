function backlight --description 'Adjusts backlight brightness. Subcommands: (up | down)'
    # set intel_bl /sys/class/backlight/intel_backlight
    # set max (cat $intel_bl'/max_brightness')
    # set now (cat $intel_bl'/brightness')
    # set path_to_now $intel_bl'/brightness'

    if test $argv[1] = 'up' ^/dev/null
        # echo (min (math -s0 $now' * 1.7 + 1') $max) >$path_to_now
        set level (math -s0 (brightnessctl get)' * 1.7 + 1')
        brightnessctl set $level
    else if test $argv[1] = 'down' ^/dev/null
        # echo (math -s0 $now / 1.7) >$path_to_now
        set level (math -s0 (brightnessctl get)' / 1.7')
        brightnessctl set $level
    else
        echo 'Give an argument: (up | down)'
        false
    end
end
