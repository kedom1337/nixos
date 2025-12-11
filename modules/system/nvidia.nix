{
  config,
  pkgs,
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
      nvidia = {
        open = true;
        powerManagement = {
          enable = true;
          finegrained = true;
        };
      };
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
        ];
      };
    };
    services.xserver.videoDrivers = ["nvidia"];
    # This is a workaround for a bug where gnome shell has graphical corruption
    # upon waking from suspend and causes the system to go back to sleep ~20-30 seconds after wakeup.
    # https://discourse.nixos.org/t/suspend-resume-cycling-on-system-resume/32322/12 for more details.
    systemd.services = {
      "gnome-suspend" = {
        description = "suspend gnome shell";
        before = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
          "nvidia-suspend.service"
          "nvidia-hibernate.service"
        ];
        wantedBy = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''${pkgs.procps}/bin/pkill -f -STOP ${pkgs.gnome-shell}/bin/gnome-shell'';
        };
      };
      "gnome-resume" = {
        description = "resume gnome shell";
        after = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
          "nvidia-resume.service"
        ];
        wantedBy = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''${pkgs.procps}/bin/pkill -f -CONT ${pkgs.gnome-shell}/bin/gnome-shell'';
        };
      };
    };
  };
}
