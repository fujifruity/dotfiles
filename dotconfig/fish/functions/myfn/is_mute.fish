function is_mute
    pactl get-sink-mute (current_sink_id) | grep -q yes
end


