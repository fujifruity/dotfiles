{
  imports = [ <home-manager/nixos> ];

  nixpkgs.config.allowUnfree = true;

  home-manager.users.fuji = { pkgs, ... }: {

    home.packages = [ pkgs.cowsay ];

    programs = {
      # vscode = {
      #   enable = true;
      #   extensions = with pkgs.vscode-extensions; [
      #     vscodevim.vim
      #     yzhang.markdown-all-in-one
      #   ];
      # };
      git = {
        enable = true;
        userName  = "fujifruity";
        userEmail = "fujifruity@gmail.com";
      };

      vim = {
        enable = true;
        extraConfig = builtins.readFile /home/fuji/dotfiles/.vimrc;
        plugins = with pkgs.vimPlugins; [
          vim-sensible
          fzf-vim
          # Git
          vim-gitgutter
          vim-fugitive
          # Beauty
          vim-colorschemes
          vim-polyglot
          # Finger friendliness
          vim-sneak
          vim-surround
          vim-commentary
          vim-easy-align
        ];
      };

      tmux = {
        enable = true;
        extraConfig = builtins.readFile /home/fuji/dotfiles/.tmux.conf;
      };

      bash = {
        enable = true;
        bashrcExtra = builtins.readFile /home/fuji/dotfiles/.bashrc;
        profileExtra = ''
          kmonad ~/dotfiles/dotconfig/kmonad/config.kbd &
        '';
      };

    };

    ## Examples:
    # xdg.configFile."kmonad/config.kbd".source = /home/fuji/dotfiles/dotconfig/kmonad/config.kbd;
    # home.file.".gdbinit".text = ''
    #     set auto-load safe-path /nix/store
    # '';


    # services.screen-locker = {
    #   enable = true;
    #   # lockCmd = "${pkgs.i3lock}/bin/i3lock -c 000000";
    #   lockCmd = ''
    #     fish -c lock
    #   '';
    #   xautolock.extraOptions = ["-time 7 -notify 10 -notifier \"dunstify zzz\" -locker \"fish -c lock\" -lockaftersleep -detectsleep -corners 000-"];
    # };


  };
}
