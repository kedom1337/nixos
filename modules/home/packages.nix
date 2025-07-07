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
      fd
      sqlite
      lsof
      ffmpeg
      imagemagick
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
      yaak
      opencode
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
    ripgrep.enable = true;
    obsidian.enable = true;
  };
}
