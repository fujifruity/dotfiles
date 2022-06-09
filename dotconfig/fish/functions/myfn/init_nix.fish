function init_nix
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
    and nix-channel --update
    and nix-env --upgrade
    and ln -s ~/.guix-profile/share/fonts ~/.local/share/
end
