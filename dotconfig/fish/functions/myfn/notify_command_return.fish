function notify_command_return -d "Notify if finished command took time."
    if test $CMD_DURATION
        if test $CMD_DURATION -gt (math "1000 * 9")
            set secs (math -s0 "$CMD_DURATION / 1000")
            notify-send -u low $history[1] "time="$secs"s"
        end
    end
end
