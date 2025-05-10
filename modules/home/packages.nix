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
      # system packages
      gnomeExtensions.pop-shell
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_DE
      pavucontrol
      lm_sensors
      mkcert
      unzip
      p7zip
      ripgrep
      fd
      sqlite
      # desktop apps
      vesktop
      bitwarden-desktop
      vlc
      qbittorrent
      spotify
      libreoffice-fresh
      darktable
      poedit
      obsidian
      yaak
      # dev cli tools
      nixfmt-rfc-style
      treefmt
      statix
      pnpm
      nodejs
      awscli2
      prettierd
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
