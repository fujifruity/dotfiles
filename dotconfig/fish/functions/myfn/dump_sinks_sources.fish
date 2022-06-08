function dump_sinks_sources
    for v in sinks sources
        echo $v:
        printf '  '
        pactl list short $v
    end
end
