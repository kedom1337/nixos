{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    extraPackages = with pkgs; [
      nixd
      nil
    ];
    userSettings = {
      telemetry.metrics = false;
      vim_mode = true;
    };
  };
}
