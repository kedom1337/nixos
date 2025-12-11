{
  config,
  lib,
  ...
}: let
  cfg = config.modules.system.laptopServices;
in {
  options.modules.system.laptopServices = {
    enable = lib.mkEnableOption "Enable services for laptop devices";
  };

  config = lib.mkIf cfg.enable {
    services = {
      thermald.enable = true;
      power-profiles-daemon.enable = false;
      tlp = {
        enable = true;
        settings.DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
      };
    };
  };
}
