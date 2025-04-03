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
      pavucontrol
      # apps
      vesktop
      bitwarden-desktop
      vlc
      qbittorrent
      # dev tools
      ripgrep
      nixfmt-rfc-style
      treefmt
      statix
      pnpm
      nodejs
      awscli2
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
