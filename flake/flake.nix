{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        vm = nixpkgs.lib.nixosSystem {
        system      = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules     = [ ./hosts/vm.nix ];
      };
    };
  };
}
