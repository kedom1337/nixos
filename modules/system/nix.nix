{ inputs, ... }:
{
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
