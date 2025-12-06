{
  programs.git = {
    enable = true;
    lfs.enable = true;
    signing = {
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKu4aqjfTRLu3DTl/YzgObwinrPKKFx9/yPNWvaAFEWv kedom@desktop";
      signByDefault = true;
    };
    settings = {
      pull.rebase = false;
      user = {
        name = "kedom";
        email = "kedom@vmcall.net";
      };
    };
  };
}
