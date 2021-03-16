# Defined in - @ line 2
function random_wallpaper
    set path_to_wallpapers ~/Dropbox/MinimalPure/Minimal-Pure-by-feridun-akgungor-Horiz/
    set wallpapers (ls $path_to_wallpapers)
    set n (random 1 (count $wallpapers ))
    ln -sf $path_to_wallpapers$wallpapers[$n] /tmp/todays_wallpaper.png
	feh --bg-scale /tmp/todays_wallpaper.png
end
