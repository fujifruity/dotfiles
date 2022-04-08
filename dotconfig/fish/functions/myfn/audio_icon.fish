# Defined in - @ line 1
function audio_icon --description 'Prints an icon of current output.'

    function is-bt-active
        set btsinkid ( pactl list short sinks | string match -r '^\d+(?=\s+bluez)' )
        and test "$btsinkid" = (current_sink_id)
    end

    if is_mute
        set icon ' mute'
    else if is-bt-active
        set icon ''
    else
        set activeport (pactl list sinks | string match '*Active Port*')
        if string match -q '*speaker' $activeport
            set icon ''
        else if string match -q '*headphones' $activeport
            set icon ''
        else
            set icon ''
        end
    end

    echo $icon

end

