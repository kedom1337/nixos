{
  programs.git = {
    enable = true;
    userName = "kedom";
    userEmail = "kedom@vmcall.net";
    lfs.enable = true;
    extraConfig = {
      pull.rebase = false;
    };
  };
}
