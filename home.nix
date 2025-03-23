{ homeStateVersion, user, ... }:
{
  imports = [
    ./modules/home
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
