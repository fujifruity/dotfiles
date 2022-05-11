function jj40

	# set -x DBUS_SESSION_BUS_ADDRESS "unix:path=/run/user/1000/bus"
	# set -x DISPLAY :0

	# su -p -c "dunstify jj40_plugged" fuji 
	# su fuji -c "dunstify jj40_plugged" 
	# su fuji -c "xset r rate 200 20"
	# su fuji -c "fish -c unset_keybind"

	dunstify "jj40 plugged"
	xset r rate 200 20
	unset_keybind

end
