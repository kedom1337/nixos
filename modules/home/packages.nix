{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    bitwarden-desktop
    gnomeExtensions.pop-shell
    nixfmt-rfc-style
    treefmt
    lm_sensors
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
