# Defined in - @ line 1
function pul --description 'Rotates output of pulseaudio; Prints an icon of current output. Takes an argument: (toggle|icon)'

    function bluetooth-is-enable
        pactl info | string match -rq 'Default Source: bluez_sink.*'
    end
    function bluez-sink
        pactl list short sinks | string match -r '^\d+(?=.*bluez_sink.*)'
    end
    function alsa-sink
        pactl list short sinks | string match -r '^\d+(?=.*alsa_output.*)'
    end
    function current-sink
        pactl list short sinks | string match -r '^\d+(?=.*RUNNING)'
    end
    function sink-inputs
        pactl list short sink-inputs | string match -r '^\d+'
    end
    function move-all-sink-inputs-to # (alsa-sink|bluez-sink)
        for input_id in (sink-inputs)
            pactl move-sink-input $input_id $argv
        end
    end
    function bluetooth-is-active
        bluetooth-is-enable
        and test ( current-sink ) = ( bluez-sink )
    end
    function profile-is-analog
        pactl info | string match -r 'Default Sink.*analog.*$' >/dev/null
    end
    function profile-to-analog
        pactl set-card-profile 0 output:analog-stereo
    end
    function profile-to-hdmi
        pactl set-card-profile 0 output:hdmi-stereo
    end

    function icon
        if bluetooth-is-active
            set icon ''
        else
            set activeport (pactl list sinks |string match '*Active Port*')
            if string match '*speaker' $activeport >/dev/null
                set icon ''
            else if string match '*headphones' $activeport >/dev/null
                set icon ''
            else
                set icon ''
            end
        end

        function is-mute
            set sink_list ( echo (pactl list sinks) )
            set mute (
          string match -r '(?<=RUNNING).*?Mute: (\w+)' $sink_list
          or string match -r '(?<=Mute: )(\w+)' $sink_list
          )[2]
            string match 'yes' $mute >/dev/null
        end

        if is-mute
            set icon $icon'mute'
        end

        echo $icon
    end
    function toggle
        # laptop speaker -> hdmi -> bluetooth -> laptop speaker -> ...
        if bluetooth-is-enable
            if bluetooth-is-active
                move-all-sink-inputs-to (alsa-sink)
                profile-to-analog
                echo 'analog output'
            else
                if profile-is-analog
                    profile-to-hdmi
                    echo 'hdmi output'
                else
                    move-all-sink-inputs-to (bluez-sink)
                    echo 'bluetooth output'
                end
            end
        else
            if profile-is-analog
                profile-to-hdmi
                echo 'hdmi output'
            else
                profile-to-analog
                # echo 'analog output'
            end
        end

        notify-send -u low (icon)
    end

    if test $argv[1] = 'toggle' ^/dev/null
        toggle
    else if test $argv[1] = 'icon' ^/dev/null
        icon
    else
        echo 'Give an argument: (toggle|icon)'
        false
    end
end

