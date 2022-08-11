function show_keypress
    dunstify  -u low 'Drag to select region'
    screenkey -p fixed -g (slop -n -f '%g')
end
