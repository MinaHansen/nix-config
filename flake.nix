{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, ... }:
  let
    inherit (nixpkgs) lib;
    hosts = import ./hosts { inherit inputs lib; };
  in
  {
    nixosConfigurations = hosts.nixosConfigurations;
  };
}
