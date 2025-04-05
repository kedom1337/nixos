{
  programs.git = {
    enable = true;
    userName = "noah";
    userEmail = "kedom@vmcall.net";
    lfs.enable = true;
    extraConfig = {
      pull.rebase = false;
    };
  };
}
