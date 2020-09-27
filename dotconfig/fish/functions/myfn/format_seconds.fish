function format_seconds -d "Takes an argument as seconds, format it as `xm ys`"
    set seconds $argv[1]
    set m (math -s0 $seconds/60)m
    set s (math -s0 $seconds%60)s
    set q
    test $m != "0m"
    and set -a q $m
    set -a q $s
    echo $q
end
