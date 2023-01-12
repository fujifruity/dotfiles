# /etc/nixos/configuration.nix
{
  imports =
    [ 
      ./hardware-configuration.nix
      /home/fuji/dotfiles/dotconfig/nixpkgs/system.nix
      /home/fuji/dotfiles/dotconfig/nixpkgs/home.nix
    ];
}

