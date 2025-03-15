{ pkgs, inputs, stateVersion, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    inputs.home-manager.nixosModules.default
  ];

  system.stateVersion = stateVersion;

  boot.initrd.luks.devices."luks-e6238f3f-e9e0-401d-9b18-370e16b4ec4e".device =
     "/dev/disk/by-uuid/e6238f3f-e9e0-401d-9b18-370e16b4ec4e";
}
