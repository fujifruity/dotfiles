function toggle_btdongle

    set btdongle EC:9A:4F:7F:D8:35

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
