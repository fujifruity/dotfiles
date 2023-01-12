function nixuninstall
    set -l name (nix-env -qa --installed "*" | fzf -m --height 70%)
    test -n "$name"
    and nix-env --uninstall $name
end
