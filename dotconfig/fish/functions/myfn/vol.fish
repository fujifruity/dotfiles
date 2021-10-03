function vol --description 'Set audio volume. Argument: (mute|up|down)'

    # for debug
    function dump-sinks-sources
        for v in sinks sink-inputs sources source-outputs
            echo $v
            pactl list short $v
        end
    end

    function current-sink-volume
        pactl get-sink-volume (current_sink_id) | string match -r '\d+(?=%)'
    end

    function set-volume # (argv[1]: int)
        pactl set-sink-mute (current_sink_id) 0
        pactl set-sink-volume (current_sink_id) $argv[1]'%'
        notify-send -u low (audio_icon)$argv[1]'%'
    end

    function is-mute
        pactl get-sink-mute (current_sink_id) | grep -q yes
    end

    if test $argv[1] = mute
        pactl set-sink-mute (current_sink_id) toggle
        if is-mute
            notify-send -u low (audio_icon)'mute'
        else
            notify-send -u low (audio_icon)(current-sink-volume)'%'
        end
    else if test $argv[1] = up
        set vol (min (math -s0 (current-sink-volume)' * 1.1 + 1') 150)
        set-volume $vol
    else if test $argv[1] = down
        set vol (math -s0 (current-sink-volume) / 1.1)
        set-volume $vol
    else
        echo 'Argument: (mute|up|down)'
        false
    end

end
