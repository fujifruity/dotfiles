function __help
    bluetoothctl help|tail -n33|string replace -r '[[:cntrl:]].*?[[:cntrl:]].*?[[:cntrl:]](.*?)\s(.*)' '$1\t$2'
end
function __devices
    bluetoothctl devices | string replace -r 'Device (.+?) (.+?)' '$1\t$2'
end

complete -f -c bluetoothctl -n "test (count (commandline -opc)) -lt 2" -a "(__help)"
complete -f -c bluetoothctl \
         -n "test (count (commandline -opc)) -eq 2; and contains -- (commandline -opc)[2] connect" \
         -a '(__devices)'
