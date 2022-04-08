function statusline 
    while true
        set msg (date "+%a %b %d %H:%M") 

        # show battery status if it exists
        if test -d '/sys/class/power_supply/BAT0/'
			# looks like "64% / "
            set -p msg ' '(acpi | awk -F ',' '{ print $2 }' | tr -d ' ')
        end

        if is_mute
            set -p msg ' mute'
        end

        string join ' / ' $msg

        sleep 3
    end
end
