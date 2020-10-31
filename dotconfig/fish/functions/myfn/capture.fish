function capture --description 'Takes screen (shot|record). `capture record` toggles recording.'
    argparse --name=screen 's/selection' -- $argv
    or return

    set dir_date /tmp/(date +'%Y%m%d_%H%M%S')

    if test $argv[1] = 'shot'
        function show_msg ; notify-send captured ; end
        if set -lq _flag_s
            # grim -g (slurp) $dir_date'.png'
            scrot --select $dir_date'.png'
            show_msg
        else
            # grim $dir_date'.png'
            scrot $dir_date'.png'
            show_msg
        end
    else if test $argv[1] = 'record' ; and type -q wf-recorder
        if killall wf-recorder ^/dev/null
            notify-send 'stop recording'
        else
            function show_msg ; notify-send start recording ; end
            if set -lq _flag_s
                wf-recorder -g (slurp) -f $dir_date'.mp4' &
                show_msg
            else
                wf-recorder -f $dir_date'.mp4' &
                show_msg
            end
        end
    else
        echo 'subcommands: (shot|record)'
        false
        return
    end
end
