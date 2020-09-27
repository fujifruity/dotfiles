function swayidle_pause -d 'run swayidle which runs swayidle_compatible when resume'
    simplestatus send swayidle pause
    killall swayidle
    swayidle -w \
      timeout 1 true \
      resume 'fish -c "killall swayidle ; swayidle_compatible ; simplestatus send swayidle resume"' ^/dev/null &
    disown
end
