{
  config,
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
      graphics.enable = true;
      nvidia = {
        open = true;
        powerManagement.enable = true;
      };
    };
    services.xserver.videoDrivers = ["nvidia"];
  };
}
