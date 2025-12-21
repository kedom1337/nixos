{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.modules.system.nvidia;
in {
  options.modules.system.nvidia = {
    enable = lib.mkEnableOption "Enable NVIDIA support";
  };

  config = lib.mkIf cfg.enable {
    hardware = {
      nvidia = {
        open = true;
        powerManagement.enable = true;
      };
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
        ];
      };
    };
    services.xserver.videoDrivers = ["nvidia"];
  };
}
