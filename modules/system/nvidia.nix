{
  config,
  pkgs,
  lib,
  ...
}: {
  options.enableNvidia = lib.mkEnableOption "Enable NVIDIA support";

  config = lib.mkIf config.enableNvidia {
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
