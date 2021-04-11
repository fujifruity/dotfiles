
function statusline 

    # show battery status if it exists
    set bat_dir /sys/class/power_supply/BAT0/

    while true
        if test -d $bat_dir
			set energy_now (cat $bat_dir/energy_now)
			set energy_full (cat $bat_dir/energy_full)
			set bat (math --scale=0 $energy_now/$energy_full \* 100 / 1)
            set bat_slash "$bat% / "
        end

        echo $bat_slash(date "+%a %b %d %H:%M") 

        sleep 3
    end
end
