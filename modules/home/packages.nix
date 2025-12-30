{
  inputs,
  pkgs,
  system,
  ...
}: {
  home.packages = with pkgs;
    [
      # packages
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_DE
      pavucontrol
      lm_sensors
      mkcert
      unzip
      p7zip
      jq
      sqlite
      lsof
      ffmpeg
      imagemagick
      awscli2
      pnpm
      nodejs
      typst
      mitmproxy
      tokei
      texliveFull
      postgresql
      inetutils
      dnsutils
      openssl
      nix-prefetch-docker
      kubectl
      kubernetes-helm
      kind
      k9s
      python3
      # desktop apps
      discord
      bitwarden-desktop
      _1password-gui
      vlc
      qbittorrent
      spotify
      libreoffice-fresh
      darktable
      poedit
      yaak
      calibre
      nextcloud-talk-desktop
      projectlibre
      meld
    ]
    ++ (with pkgs.gnomeExtensions; [
      paperwm
      tailscale-qs
    ])
    ++ (with inputs; [
      nvim.packages.${system}.default
      llm-agents.packages.${system}.opencode
    ]);

  programs = {
    home-manager.enable = true;
    firefox.enable = true;
    fastfetch.enable = true;
    lazygit.enable = true;
    eza.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    obsidian.enable = true;
    vscode.enable = true;
    gh.enable = true;
  };
}
