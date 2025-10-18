{
  pkgs,
  user,
  ...
}: {
  # For vendor completions we need to enable the fish shell
  # here ontop of enabling it in home-manager.
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    users.${user} = {
      isNormalUser = true;
      description = user;
      extraGroups = [
        "networkmanager"
        "wheel"
        "kvm"
      ];
    };
  };
}
