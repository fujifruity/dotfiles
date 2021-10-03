# Defined in - @ line 1
function set_bt_audio --description 'Set audio output to bluetooth.'

    function bluez-sink
        pactl list short sinks | string match -r '^\d+(?=.*bluez_sink.*)'
    end
    function sink-inputs
        pactl list short sink-inputs | string match -r '^\d+'
    end

    for input_id in (sink-inputs)
        pactl move-sink-input $input_id (bluez-sink)
    end

end

