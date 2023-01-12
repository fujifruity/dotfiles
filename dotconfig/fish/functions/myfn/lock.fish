function lock

    logger lock
    set img '/tmp/lock.fish.blurred.png'
    # Take a screenshot for our background
    import -window root $img
    # Pixelate the background
    convert $img -scale 10% -scale 1000% $img
    # Lock screen
    i3lock --image $img #& sleep 5 && xset dpms force of

end
