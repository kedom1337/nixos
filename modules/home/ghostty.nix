{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Oxocarbon";
      font-size = 11;
      shell-integration-features = "ssh-terminfo";
      keybind = [
        "ctrl+shift+h=goto_split:left"
        "ctrl+shift+j=goto_split:down"
        "ctrl+shift+k=goto_split:up"
        "ctrl+shift+l=goto_split:right"
      ];
    };
  };
}
