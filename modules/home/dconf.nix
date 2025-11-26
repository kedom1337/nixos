{pkgs, ...}: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        favorite-apps = [];
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          paperwm.extensionUuid
          tailscale-qs.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        show-battery-percentage = true;
      };
      "org/gnome/desktop/input-sources".xkb-options = [
        "terminate:ctrl_alt_bksp"
        "caps:swapescape"
      ];
      "org/gnome/mutter" = {
        workspaces-only-on-primary = false;
        dynamic-workspaces = false;
      };
      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 4;
        focus-mode = "sloppy";
      };
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
      "org/gnome/shell/extensions/paperwm" = {
        default-focus-mode = 2; # edge
        show-workspace-indicator = false;
      };
    };
  };
}
