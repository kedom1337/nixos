{ config, lib, ... }:
{
  options.services = {
    enableLaptopServices = lib.mkEnableOption "Enable laptop-specific services";
  };

  config = {
    services = {
      thermald.enable = config.services.enableLaptopServices;

      printing.enable = true;
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      xserver = {
        enable = true;
        desktopManager.gnome.enable = true;
        displayManager.gdm = {
          enable = true;
          wayland = false;
        };
        xkb = {
          layout = "us";
          variant = "";
          options = "caps:swapescape";
        };
      };
    };
  };
}
