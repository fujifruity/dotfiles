
function statusline 

    # show battery status if it exists
    set bat_dir /sys/class/power_supply/BAT0/

    while true
        if test -d $bat_dir
            and set bat (math --scale=0 (cat $bat_dir/energy_now)/(cat $bat_dir/energy_full)\*100/1)
        end

        set datetime (date "+%a %b %d %H:%M")

        echo $bat% / $datetime 

        sleep 3
    end
end
