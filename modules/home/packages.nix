{
  inputs,
  pkgs,
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
      nvim.packages.x86_64-linux.default
    ]);

  programs = {
    home-manager.enable = true;
    fastfetch.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    eza.enable = true;
    zoxide.enable = true;
  };
}
