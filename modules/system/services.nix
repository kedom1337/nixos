{
  config = {
    services = {
      printing.enable = true;
      pulseaudio.enable = false;
      postgresql.enable = true;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
