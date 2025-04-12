{ hostname, ... }:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 app.kedom.dev.viaptic.com
      127.0.0.1 app.kedom.dev.k3stack.com
    '';
  };

  security.rtkit.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
