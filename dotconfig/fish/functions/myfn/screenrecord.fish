function screenrecord -d '-s,--selection; deps:dunst,ffmpeg,slop'
    argparse 's/selection' -- $argv || return

    if set -q screenrecord_running_pid
        # Stop recording
        kill (pgrep -P $screenrecord_running_pid)
        set -e screenrecord_running_pid
        return
    end

    if set -lq _flag_s  # Select region
        set -l slop (slop -f "%x %y %w %h %g %i") || return
        echo $slop | read X Y W H G ID

        # Prevent ffmpeg's "not divisible by 2" error
        set -l W (math (math -s0 $W/2)'*2')
        set -l H (math (math -s0 $H/2)'*2')

        set WH "-video_size" "$W"x"$H"
        set XY "+$X,$Y"
    end

    dunstify -u low 'in 3...'
    sleep 3

    set -U screenrecord_running_pid $fish_pid
    set -l name /tmp/screenrecord-(date +'%Y%m%d-%H%M%S')
    # Save as mkv to prevent firefox's "file is corrupt" error
    ffmpeg -f x11grab $WH -framerate 25 -i :0.0"$XY" -c:v libx264 -preset ultrafast $name.mkv
    # Convert to mp4
    ffmpeg -i $name.mkv -vcodec libx264 -pix_fmt yuv420p $name.mp4
    # Notify filename
    and dunstify -u low $name.mp4

end
