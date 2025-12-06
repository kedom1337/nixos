{hostName, ...}: let
  signKeys = {
    desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKu4aqjfTRLu3DTl/YzgObwinrPKKFx9/yPNWvaAFEWv kedom@desktop";
    t480 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINclt0A84Dn613MpK68mxlpaK6q3uLhB/SFKidaygRta kedom@t480";
  };
  signKey =
    if builtins.hasAttr hostName signKeys
    then signKeys.${hostName}
    else throw "No SSH signing key for hostname: ${hostName}";
in {
  home.file.".ssh/allowed_signers".text = ''
    * ${signKey}
  '';
  programs.git = {
    enable = true;
    lfs.enable = true;
    signing = {
      format = "ssh";
      key = signKey;
      signByDefault = true;
    };
    settings = {
      user = {
        name = "kedom";
        email = "kedom@vmcall.net";
      };
      pull.rebase = false;
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
  };
}
