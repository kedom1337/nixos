{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    bitwarden-desktop
    gnomeExtensions.pop-shell
  ];

  programs = {
    home-manager.enable = true;
    fastfetch.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    eza.enable = true;
    zoxide.enable = true;
  };
}
