{
  config,
  lib,
  ...
}: let
  cfg = config.modules.system.laptopPowerManagement;
in {
  options.modules.system.laptopPowerManagement = {
    enable = lib.mkEnableOption "Enable laptop power management services";
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
