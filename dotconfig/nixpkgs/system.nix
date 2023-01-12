# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  kmonad = import /home/fuji/.config/nixpkgs/kmonad-adhoc.nix;
in
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 1;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixpad"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Asia/Tokyo";
  time.timeZone = "Asia/Manila";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # earlySetup = true;
    packages = with pkgs; [ tamsyn ];
    font = "${pkgs.tamsyn}/share/consolefonts/Tamsyn10x20r.psf.gz";  # Large TTY font
    # keyMap = "us";
    # useXkbConfig = true; # use xkbOptions in tty.
  };

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  fonts.fonts = with pkgs; [
    source-han-serif-japanese
    source-han-sans-japanese
    source-han-code-jp
    font-awesome
  ];

  systemd.services.lock-before-suspend = { 
    description = "lock-before-suspend";
    wantedBy = [ "suspend.target" ];
    before = [ "suspend.target" ];
    environment = { DISPLAY=":0"; };
    script = ''
      /run/current-system/sw/bin/i3lock -i /tmp/wallpaper.png
    '';
    serviceConfig.User = "fuji";
    serviceConfig.Type = "forking";
  };

  # Error: Impossible to enroll: GDBus.Error:net.reactivated.Fprint.Error.NoSuchDevice: No devices available
  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;
  security.pam.services.xscreensaver.fprintAuth = true;
  security.pam.services.i3lock.fprintAuth = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager = {
      startx.enable = true;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups = { uinput = {}; };  # kmonad
  users.users.fuji = {
    initialPassword = "mememe";
    isNormalUser = true;
    extraGroups = [
       "wheel" # Enable ‘sudo’ for the user.
       "video" # brightnessctl
       "input" # brightnessctl
       "uinput" # kmonad
       "kvm" # android emulator
       "adbusers" # adb
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    variables = { EDITOR = "vim"; };
    systemPackages = with pkgs; [
      wget
      git
      vim_configurable # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      fzf # vim
      kmonad
      home-manager
    ];
    pathsToLink = [ "/libexec" ]; # (for i3) links /libexec from derivations to /run/current-system/sw
  };

  services.udev.extraRules =
    ''
      # KMonad user access to /dev/uinput
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;  # android emulator acceleration
  programs.adb.enable = true;  # add adb to PATH
  programs.sway.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

