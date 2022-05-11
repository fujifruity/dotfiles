function swayidle_pause -d 'run swayidle which runs swayidle_compatible when resume'
    dunstify swayidle pause
    killall swayidle
    swayidle -w \
      timeout 1 true \
      resume 'fish -c "killall swayidle ; swayidle_compatible ; dunstify -u low swayidle resume"' &
    disown
end
