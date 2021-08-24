function backlight --description 'Adjusts backlight brightness. Subcommands: (up | down)'

    if test $argv[1] = 'up'
        set level (math -s0 (brightnessctl get)' * 1.7 + 1')
        brightnessctl set $level
    else if test $argv[1] = 'down'
        set level (math -s0 (brightnessctl get)' / 1.7')
        brightnessctl set $level
    else
        echo 'Give an argument: (up | down)'
        false
    end
end
