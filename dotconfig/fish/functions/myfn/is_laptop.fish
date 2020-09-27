function is_laptop
    test -e /sys/class/power_supply/BAT0/device/status
end
