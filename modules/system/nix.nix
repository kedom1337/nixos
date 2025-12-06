{
  pkgs,
  inputs,
  system,
  homeStateVersion,
  user,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  home-manager = {
    users.${user} = import ../../home.nix;
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        system
        homeStateVersion
        user
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
