{
  config,
  lib,
  ...
}: {
  options.enableLaptopServices = lib.mkEnableOption "Enable laptop-specific services";

  config = lib.mkIf config.enableLaptopServices {
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
