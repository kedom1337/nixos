{ hostname, ... }:
{
  boot.loader = {
    timeout = 0;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  security.rtkit.enable = true;
}
