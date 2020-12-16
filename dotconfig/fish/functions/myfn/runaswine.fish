function runaswine --description "run wine as a user `wineuser`"
	xhost +SI:localuser:wineuser

	set -x HOME /home/wineuser
	set -x USER wineuser
	set -x USERNAME wineuser
	set -x LOGNAME wineuser
	sudo -u wineuser wine $argv
end
