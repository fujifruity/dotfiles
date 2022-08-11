function lock

    logger lock
    set img '/tmp/blurred.png'
    # Take a screenshot for our background
    scrot --overwrite $img
    # Pixelate the background
    convert $img -scale 10% -scale 1000% $img
    # Lock screen
    i3lock --image $img

end
