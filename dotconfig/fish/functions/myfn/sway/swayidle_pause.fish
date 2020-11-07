function swayidle_pause -d 'run swayidle which runs swayidle_compatible when resume'
    notify-send swayidle pause
    killall swayidle
    swayidle -w \
      timeout 1 true \
      resume 'fish -c "killall swayidle ; swayidle_compatible ; notify-send -u low swayidle resume"' ^/dev/null &
    disown
end
