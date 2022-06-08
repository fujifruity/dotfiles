function statusline 

    # Use --on-variable because events cannot be used as IPC.
    function on_update_event --on-variable statusline_update
        print_msg
    end

    function print_msg
        set msg (date "+%a %b %d %H:%M") 

        # Show battery status if it exists.
        if test -d '/sys/class/power_supply/BAT0/'
			# Looks like "64% / "
            set -p msg ' '(acpi | awk -F ',' '{ print $2 }' | tr -d ' ')
        end

        if is_mute
            set -p msg ' mute'
        end

        string join ' / ' $msg
    end

    while true
        print_msg
        for n in (seq 30)
            sleep 0.1
        end
    end
end
