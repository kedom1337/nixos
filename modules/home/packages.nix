{
  inputs,
  pkgs,
  system,
  ...
}: {
  home.packages = with pkgs;
    [
      # packages
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
      lsof
      ffmpeg
      imagemagick
      pgweb
      awscli2
      pnpm
      nodejs
      claude-code
      # desktop apps
      discord
      bitwarden-desktop
      vlc
      qbittorrent
      spotify
      libreoffice-fresh
      darktable
      poedit
      obsidian
      yaak
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
