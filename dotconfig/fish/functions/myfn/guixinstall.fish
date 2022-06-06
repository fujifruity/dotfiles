function guixinstall -a query
    set -l combined (guix search "$query" | string split0)
    set -l split (string split \n\n $combined)
    set -l names (echo $combined | grep -oP '(?<=^name: ).*' | fzf -m --height 70% --preview "guix show {}")
    test -n "$name"
    and guix install "$name"
end
