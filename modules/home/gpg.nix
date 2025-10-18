{pkgs, ...}: {
  home.packages = with pkgs; [
    gcr
  ];
  programs = {
    gpg.enable = true;
  };
  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
