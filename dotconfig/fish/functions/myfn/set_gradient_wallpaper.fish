function set_gradient_wallpaper
    set file /tmp/wallpaper.png
    gradient $file
    # swaybg -i $file
    feh --bg-scale $file
end

function gradient -a file -d 'Generates a gradient picture'

    set colors '#90caf9' '#f48fb1' '#ce93d8' '#ffab91' '#fff59d' '#a5d6a7'
    #          blue      pink      purple    orange    yellow    green
    
    # Pick up different two colors.
    set size (count $colors)
    set pairs (echo (seq 1 $size)(seq 1 $size) | tr ' ' '\n' | awk '{if($1%11!=0) print $1 }')
    random choice $pairs | string split '' | read -L a b

    convert -size 100x56 \
        gradient:"$colors[$a]-$colors[$b]" \
        -append -blur 0x1 \
        -resize (get_display_size) $file

end

