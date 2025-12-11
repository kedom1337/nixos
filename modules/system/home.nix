{
  homeStateVersion,
  user,
  ...
}: {
  imports = [
    ../home
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
