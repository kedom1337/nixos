{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      bind -M insert \cf accept-autosuggestion
      alias ls "eza -al"
      abbr -a nb "nixos-rebuild switch --flake /etc/nixos#"
    '';
  };
}
