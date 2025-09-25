{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings

      bind -M insert \cf accept-autosuggestion
      bind -M insert \cr history-pager

      abbr -a lgit "lazygit"
      abbr -a y "yazi"
    '';
  };
}
