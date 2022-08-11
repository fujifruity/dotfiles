function get_display_size
    xrandr | grep '*' | awk '{print $1}'
end

