{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        favorite-apps = [ ];
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          pop-shell.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };
      "org/gnome/desktop/input-sources".xkb-options = [
        "terminate:ctrl_alt_bksp"
        "caps:swapescape"
      ];
      "org/gnome/mutter".workspaces-only-on-primary = false;
      "org/gnome/shell/extensions/pop-shell".tile-by-default = true;
      "org/gnome/mutter/wayland/keybindings".restore-shortcuts = [ ];
      "org/gnome/desktop/wm/keybindings" = {
        maximize = [ ];
        unmaximize = [ ];
        toggle-maximized = [ "<Super>m" ];
        minimize = [ "<Super>comma" ];
        switch-to-workspace-left = [ ];
        switch-to-workspace-right = [ ];
        move-to-monitor-up = [ ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-workspace-down = [ ];
        move-to-workspace-up = [ ];
        switch-to-workspace-down = [
          "<Primary><Super>Down"
          "<Primary><Super>j"
        ];
        switch-to-workspace-up = [
          "<Primary><Super>Up"
          "<Primary><Super>k"
        ];
        close = [
          "<Super>q"
          "<Alt>F4"
        ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        move-to-workspace-1 = [ "<Super><Shift>1" ];
        move-to-workspace-2 = [ "<Super><Shift>2" ];
        move-to-workspace-3 = [ "<Super><Shift>3" ];
        move-to-workspace-4 = [ "<Super><Shift>4" ];
      };
      "org/gnome/shell/keybindings" = {
        open-application-menu = [ ];
        toggle-overview = [ ];
        toggle-message-tray = [ "<Super>v" ];
      };
      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        rotate-video-lock-static = [ ];
        screensaver = [ "<Super>Escape" ];
        home = [ "<Super>f" ];
        email = [ "<Super>e" ];
        www = [ "<Super>b" ];
        terminal = [ ];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>t";
        command = "kitty";
        name = "Open kitty";
      };
    };
  };
}
