{ ... }:
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    dots-hyprland.url = "github:celesrenata/end-4-flakes/upstream-sync-2026";
  };

  outputs = inputs @ { nixpkgs, dots-hyprland, ... }:
  let
    inherit (nixpkgs) lib;
    hosts = import ./hosts { inherit inputs lib; };
  in
  {
    nixosConfigurations = hosts.nixosConfigurations;
  };
}
