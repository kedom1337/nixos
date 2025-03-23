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
      vesktop
      bitwarden-desktop
      gnomeExtensions.pop-shell
      nixfmt-rfc-style
      treefmt
      statix
      lm_sensors
      pnpm
    ]
    ++ (with inputs; [
      nvim.packages.${system}.default
    ]);

  programs = {
    home-manager.enable = true;
    fastfetch.enable = true;
    lazygit.enable = true;
    eza.enable = true;
    zoxide.enable = true;
  };
}
