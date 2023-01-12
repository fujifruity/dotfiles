function toggle_btdevice

    # set dev 'EC:9A:4F:7F:D8:35' # btdongle
    set dev 'D8:37:3B:6D:4B:7B' # flip5

    if bluetoothctl info $dev | grep -q 'Connected: yes'
        # if connected:
        bluetoothctl disconnect $dev
        sleep 1s
        bluetoothctl power off
    else
        bluetoothctl power on
        sleep 1s
        bluetoothctl connect $dev
        set_bt_audio
    end

    or dunstify 'toggle_btdevice failed'

end
