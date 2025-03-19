{ inputs, homeStateVersion, user, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs homeStateVersion user; };
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
}
