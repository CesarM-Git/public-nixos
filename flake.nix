{
  description = "NixOS Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    ip-whitelist.url = "github:Oak-Digital/nixos-ip-whitelist-firewall";
  };
  outputs = { self, nixpkgs, sops-nix, ... }@inputs: {
    nixosConfigurations.nix-home = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        sops-nix.nixosModules.sops
        ./modules/sops.nix
      ];
    };
  };
