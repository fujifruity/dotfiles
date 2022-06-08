function vol -a mode -d'Set audio volume. Argument: (mute|up|down)'

    set -g volmsgid 123

    function current_sink_volume
        pactl get-sink-volume (current_sink_id) | string match -r '\d+(?=%)'
    end

    function set_volume -a volume
        pactl set-sink-mute (current_sink_id) 0
        pactl set-sink-volume (current_sink_id) $volume'%'
        # Show the volume notification
        dunstify -a "changeVolume" -u low -i audio-volume-high -r "$volmsgid" -h int:value:"$volume" (audio_icon)' '$volume'%'
    end

    if test $mode = mute
        pactl set-sink-mute (current_sink_id) toggle
        is_mute
        and set msg (audio_icon)
        or set msg (audio_icon)' '(current_sink_volume)'%'
        # Show the sound muted notification
        dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$volmsgid" "$msg"
    else if test $mode = up
        set vol (min (math -s0 (current_sink_volume)' * 1.1 + 1') 150)
        set_volume $vol
    else if test $mode = down
        set vol (math -s0 (current_sink_volume) / 1.1)
        set_volume $vol
    else
        echo 'Argument: (mute|up|down)'
        false
    end

end
