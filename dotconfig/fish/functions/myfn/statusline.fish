
function statusline 

    # show battery status if it exists
    set bat_dir /sys/class/power_supply/BAT0/

    while true
        if test -d "$bat_dir"
			# looks like "64% / "
            set bat_slash ""(acpi | awk -F ',' '{ print $2 }' | tr -d ' ')" / "
        end

        echo $bat_slash(date "+%a %b %d %H:%M") 

        sleep 3
    end
end
