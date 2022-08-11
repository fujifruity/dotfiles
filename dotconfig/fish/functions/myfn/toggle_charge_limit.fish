function toggle_charge_limit
    set f /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    set v (grep -q 0 $f && echo 1 || echo 0)
    echo $v | sudo tee $f
end
