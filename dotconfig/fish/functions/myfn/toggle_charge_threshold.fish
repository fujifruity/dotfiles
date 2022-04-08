function toggle_charge_threshold
    set f /sys/class/power_supply/BAT0/charge_control_end_threshold
    set v (grep -q 100 $f && echo 60 || echo 100)
    echo $v | sudo tee $f
end
