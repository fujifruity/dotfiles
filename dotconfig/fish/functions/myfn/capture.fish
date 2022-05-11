function capture --description 'Takes screen (shot|record). `capture record` toggles recording.'
    argparse --name=screen 's/selection' -- $argv
    or return

    set dir_date /tmp/(date +'%Y%m%d_%H%M%S')
	set pic_ext 'png'
	set mov_ext 'mp4'

    if test $argv[1] = 'shot'
        function show_msg ; dunstify -u low captured ; end
        if set -lq _flag_s
            # grim -g (slurp) $dir_date'.png'
            scrot --select $dir_date.$pic_ext
            show_msg
        else
            # grim $dir_date'.png'
            scrot $dir_date.$pic_ext
            show_msg
        end
    else if test $argv[1] = 'record' ; and type -q wf-recorder
        if killall wf-recorder ^/dev/null
            dunstify -u low 'stop recording'
        else
            function show_msg ; dunstify -u low start recording ; end
            if set -lq _flag_s
                wf-recorder -g (slurp) -f $dir_date.$mov_ext &
                show_msg
            else
                wf-recorder -f $dir_date.$mov_ext &
                show_msg
            end
        end
    else
        echo 'subcommands: (shot|record)'
        false
        return
    end
end
