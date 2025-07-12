{
  hostname,
  pkgs,
  ...
}: {
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
    extraHosts = ''
      127.0.0.1 app.kedom.dev.viaptic.com
      127.0.0.1 app.kedom.dev.k3stack.com
      127.0.0.1 app.kedom.dev.tourenheld.com
    '';
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
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
