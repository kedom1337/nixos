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
      mkcert
      unzip
      p7zip
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_DE
      # apps
      vesktop
      bitwarden-desktop
      vlc
      qbittorrent
      spotify
      libreoffice-fresh
      darktable
      poedit
      obsidian
      # dev tools
      ripgrep
      nixfmt-rfc-style
      treefmt
      statix
      pnpm
      nodejs
      awscli2
      prettierd
      yaak
      uv
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
