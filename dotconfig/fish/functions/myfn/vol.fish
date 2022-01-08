function vol --description 'Set audio volume. Argument: (mute|up|down)'

    set -g volmsgid 123 

    # for debug
    function dump_sinks_sources
        for v in sinks sink-inputs sources source-outputs
            echo $v
            pactl list short $v
        end
    end

    function current_sink_volume
        pactl get-sink-volume (current_sink_id) | string match -r '\d+(?=%)'
    end

    function set_volume # (argv[1]: int)
        set volume $argv[1]
        pactl set-sink-mute (current_sink_id) 0
        pactl set-sink-volume (current_sink_id) $volume'%'
        # Show the volume notification
        dunstify -a "changeVolume" -u low -i audio-volume-high -r "$volmsgid" -h int:value:"$volume" (audio_icon)' '$volume'%'
    end

    function is_mute
        pactl get-sink-mute (current_sink_id) | grep -q yes
    end

    if test $argv[1] = mute
        pactl set-sink-mute (current_sink_id) toggle
        is_mute
        and set msg 'mute'
        or set msg (current_sink_volume)'%'
        # Show the sound muted notification
        dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$volmsgid" "$msg"
    else if test $argv[1] = up
        set vol (min (math -s0 (current_sink_volume)' * 1.1 + 1') 150)
        set_volume $vol
    else if test $argv[1] = down
        set vol (math -s0 (current_sink_volume) / 1.1)
        set_volume $vol
    else
        echo 'Argument: (mute|up|down)'
        false
    end

end
