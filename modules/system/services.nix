{pkgs, ...}: {
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        hplip
        splix
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    tailscale = {
      enable = true;
      openFirewall = true;
    };
  };
}
