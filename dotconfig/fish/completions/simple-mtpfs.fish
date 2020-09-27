function __device_list
    string replace -r '(\d+): (.*)' '$1\t$2' (simple-mtpfs -l)
    or echo -n $list
end

complete -c simple-mtpfs -f -l device -a '(__device_list)' -- description 'select device no.  to mount.'
complete -c simple-mtpfs -f -s o -a 'enable-move'          -- description 'mount options.'
complete -c simple-mtpfs -s h -l help                      -- description 'print help.'
complete -c simple-mtpfs -s V -l version                   -- description 'print version . SS "SIMPLE-MTPFS options:".'
complete -c simple-mtpfs -s l -l list-devices              -- description 'list available MTP devices.  Supports <device> option.'
