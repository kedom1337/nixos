{
  inputs,
  pkgs,
  system,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      # system
      gnomeExtensions.pop-shell
      lm_sensors
      # apps
      vesktop
      bitwarden-desktop
      vlc
      qbittorrent
      # dev tools
      nixfmt-rfc-style
      treefmt
      statix
      pnpm
    ]
    ++ (with inputs; [
      nvim.packages.${system}.default
    ]);

  programs = {
    home-manager.enable = true;
    firefox.enable = true;
    fastfetch.enable = true;
    lazygit.enable = true;
    eza.enable = true;
    zoxide.enable = true;
  };
}
