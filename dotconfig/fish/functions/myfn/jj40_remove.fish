function jj40_remove

	# set -x DBUS_SESSION_BUS_ADDRESS "unix:path=/run/user/1000/bus"
	# set -x DISPLAY :0

	# su -p -c "dunstify jj40_plugged" fuji 
	# su fuji -c "dunstify jj40_plugged" 
	# su fuji -c "xset r rate 200 20"
	# su fuji -c "fish -c unset_keybind"

	dunstify "jj40 removed"
	set_keybind

end
