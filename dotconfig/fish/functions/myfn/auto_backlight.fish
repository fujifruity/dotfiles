function auto_backlight
    # brightness ∝ factor  
    set factor 80

    set mean (camera_pixels_mean)
    set level (math $mean' * '$factor)
	brightnessctl set $level

end
