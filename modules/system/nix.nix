{
  inputs,
  system,
  homeStateVersion,
  user,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs = {
    config = {
      allowAliases = false;
      allowUnfree = true;
    };
    overlays = [
      (final: prev: {
        mutter = prev.mutter.overrideAttrs (old: {
          src = inputs.mutter-triple-buffering-src;
          preConfigure = ''
            cp -a "${inputs.gvdb-src}" ./subprojects/gvdb
          '';
        });
      })
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        system
        homeStateVersion
        user
        ;
    };
    users.${user} = import ../../home.nix;
    backupFileExtension = "backup";
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d --keep 3";
    };
    flake = "/home/${user}/nixos";
  };
}
