{hostname, ...}: {
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
      127.0.0.1 app.kedom.dev.tourenheld.com
    '';
  };
  security = {
    rtkit.enable = true;
    sudo.extraRules = [
      {
        users = ["kedom"];
        commands = [
          {
            command = "/opt/sst/sst1 tunnel start *";
            options = [
              "NOPASSWD"
              "SETENV"
            ];
          }
        ];
      }
    ];
  };
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
