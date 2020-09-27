function toggle_btdongle

    set btdongle 1C:53:34:BB:8F:76

    if bluetoothctl info $btdongle | grep "Connected: yes" > /dev/null
        # if connected:
        bluetoothctl disconnect $btdongle
        sleep 1s
        bluetoothctl power off
    else
        bluetoothctl power on
        sleep 1s
        bluetoothctl connect $btdongle
    end

    or simplestatus send "toggle_btdongle failed"

end
