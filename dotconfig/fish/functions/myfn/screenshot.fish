function screenshot -d '-s to select region'
    argparse 's/selection' -- $argv || return

    set -l f /tmp/screenshot-(date +'%Y%m%d-%H%M%S').png

    if set -lq _flag_s
        import $f
    else
        import -window root $f
    end

    dunstify -u low $f
end
