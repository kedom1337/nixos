{
  pkgs,
  inputs,
  system,
  homeStateVersion,
  user,
  hostName,
  ...
}: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  home-manager = {
    users.${user} = import ./home.nix;
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        system
        homeStateVersion
        user
        hostName
        ;
    };
  };
  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 30d --keep 3";
      };
      flake = "/home/${user}/nixos";
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
      ];
    };
  };
}
