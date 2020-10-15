function auto_backlight
    # brightness ∝ factor  
    set factor 60

    set intel_bl /sys/class/backlight/intel_backlight
    set max (cat $intel_bl'/max_brightness')
    set now (cat $intel_bl'/brightness')
    set path_to_now $intel_bl'/brightness'
    set mean (camera_pixels_mean)
    set new_brightness (math $mean' * '$factor)

    echo brightness=$now new_brightness=$new_brightness camera_pixels_mean=$mean

    echo $new_brightness >$path_to_now
    # set -x ENABLE_SYSTEMD 1
    # brightnessctl set $new_brightness
end
