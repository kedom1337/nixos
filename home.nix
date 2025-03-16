{ pkgs, homeStateVersion, user, ... }:
{
  imports = [
    ./modules/home
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;

    packages = with pkgs; [
      vesktop
      bitwarden-desktop
      gnomeExtensions.pop-shell
      nerd-fonts.jetbrains-mono
    ];
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
  };

  programs = {
    home-manager.enable = true;
    fastfetch.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    eza.enable = true;
  };
}
