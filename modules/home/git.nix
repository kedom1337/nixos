{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      pull.rebase = false;
      user = {
        name = "kedom";
        email = "kedom@vmcall.net";
      };
    };
  };
}
