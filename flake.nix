{
  description = "NixOS configuration of kedom";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mutter-triple-buffering-src = {
      url = "gitlab:vanvugt/mutter?ref=triple-buffering-v4-47&host=gitlab.gnome.org";
      flake = false;
    };
    gvdb-src = {
      url = "gitlab:GNOME/gvdb?ref=main&host=gitlab.gnome.org";
      flake = false;
    };
  };
  outputs = { nixpkgs, home-manager, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    user = "kedom";
    homeStateVersion = "24.11";
    hosts = [
      { hostname = "t480"; stateVersion = "24.11"; }
    ];
  in {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs user;
          inherit (host) hostname stateVersion;
        };
        modules = [ ./hosts/${host.hostname}/configuration.nix ];
      };
    }) hosts);

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit inputs homeStateVersion user;
      };
      modules = [ ./home.nix ];
    };
  };
}
