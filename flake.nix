{
  description = "NixOS configuration of kedom";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim.url = "github:kedom1337/nvim";
  };
  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      user = "kedom";
      homeStateVersion = "24.11";
      hosts = [
        {
          hostname = "t480";
          stateVersion = "24.11";
        }
        {
          hostname = "desktop";
          stateVersion = "24.11";
        }
      ];
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = host.hostname;
          value = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit
                inputs
                system
                homeStateVersion
                user
                ;
              inherit (host) hostname stateVersion;
            };
            modules = [ ./hosts/${host.hostname}/configuration.nix ];
          };
        }) hosts
      );
    };
}
