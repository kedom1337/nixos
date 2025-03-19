{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      # General gnome config
      "org/gnome/shell" = {
        disable-user-extensions = false;
	enabled-extensions = with pkgs.gnomeExtensions; [
	  pop-shell.extensionUuid
	];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
	enable-hot-corners = false;
      };

      # X11 xkb options
      "org/gnome/desktop/input-sources".xkb-options = [
        "terminate:ctrl_alt_bksp" 
	"caps:swapescape"
      ];

      # Pop shell configuration
      "org/gnome/mutter".workspaces-only-on-primary = false;
      "org/gnome/shell/extensions/pop-shell".tile-by-default = true;
      "org/gnome/mutter/wayland/keybindings".restore-shortcuts = [];
      "org/gnome/desktop/wm/keybindings" = {
        maximize = [];
        unmaximize = [];
        toggle-maximized = [ "<Super>m" ];
        minimize = [ "<Super>comma" ];
        switch-to-workspace-left = [];
        switch-to-workspace-right = [];
        move-to-monitor-up = [];
        move-to-monitor-down = [];
        move-to-monitor-left = [];
        move-to-monitor-right = [];
        move-to-workspace-down = [];
        move-to-workspace-up = [];
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
      };
      "org/gnome/shell/keybindings" = {
        open-application-menu = [];
        toggle-overview = [];
        toggle-message-tray = [ "<Super>v" ];
      };
      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [];
        toggle-tiled-right = [];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        rotate-video-lock-static = [];
        screensaver = [ "<Super>Escape" ];
        home = [ "<Super>f" ];
        email = [ "<Super>e" ];
        www = [ "<Super>b" ];
        terminal = [ "<Super>t" ];
      };
    };
  };
}
