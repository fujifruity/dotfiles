function current_sink_id
    pactl list short sink-inputs | tail -1 | string match -ra '\d+' | nth 2
    pipefailed && pactl list short sinks | tail -1 | string match -r '\d+'
end

