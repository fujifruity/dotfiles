function statusline -d '-u to update'
    argparse 'u/update' -- $argv || return

    if set -lq _flag_u  # Update statusline
        set -q statusline_update
        and set -U statusline_update (math "bitxor(1,"$statusline_update")")
        or  set -U statusline_update 0
    end

    # Use --on-variable because events cannot be used as IPC.
    function on_update_event --on-variable statusline_update
        print_msg
    end

    function print_msg
        set msg (date "+%a %b %d %H:%M") 

        # Show battery status if it exists.
        if test -d '/sys/class/power_supply/BAT0/'
            set -l batt (acpi | awk -F ',' '{ print $2 }' | tr -d ' ')
            set -p msg ' '$batt
        end

        is_mute && set -p msg ' mute'
        string join ' / ' $msg
    end

    # Start loop
    while true
        print_msg
        for n in (seq 30)
            sleep 0.1
        end
    end

end
