{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = 3;
    };
    keybindings = builtins.listToAttrs (
      map (i: {
        name = "alt+${toString i}";
        value = "goto_tab ${toString i}";
      }) (lib.range 1 5)
    );
  };
}
