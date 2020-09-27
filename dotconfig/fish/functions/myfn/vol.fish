function vol --description 'Adjusts audio volume. Takes an argument: (mute | up | down)'
  function volume
    # checks running sink first
    echo (pactl list sinks) | string replace -rf '.*(?<=RUNNING).*?(\d+)%.*' '$1'
    or echo (pactl list sinks) | string match -r '\d+(?=%)'
  end

  if test $argv[1] = 'mute' ^ /dev/null
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    simplestatus send (pul icon)

  else if test $argv[1] = 'up' ^ /dev/null
    pactl set-sink-mute @DEFAULT_SINK@ 0
    set vol ( min (math -s0 (volume)' * 1.1 + 1') 150 )
    eval 'pactl set-sink-volume @DEFAULT_SINK@ '$vol'%'
    #simplestatus send (string sub --length 1 (pul icon))$vol'%'
    simplestatus send (pul icon)$vol'%'

  else if test $argv[1] = 'down' ^ /dev/null
    pactl set-sink-mute @DEFAULT_SINK@ 0
    set vol (math -s0 (volume) / 1.1 )
    eval 'pactl set-sink-volume @DEFAULT_SINK@ '$vol'%'
    #simplestatus send (string sub --length 1 (pul icon))$vol'%'
    simplestatus send (pul icon)$vol'%'

  else
    echo 'Give an argument: (mute | up | down)'
    false
  end
end
