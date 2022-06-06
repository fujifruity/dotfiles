function nixinstall -a query
    set -l json '/tmp/nixinstall.fish.json'
    nix search --json nixpkgs "$query" > $json
    set -l name (jq -r 'keys[]' $json | string split -m2 -f3 '.' | fzf -m --height 70% --preview 'nixinstall_preview {}')
    test -n "$name"
    and nix-env -iA nixpkgs."$name"
end
