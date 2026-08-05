{ inputs, lib }:
let
  mkHost =
    name:
    {
      system ? "x86_64-linux",
      modules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ../modules/nixos
        ./common.nix
        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.mina = ../modules/home/default.nix;
          };
        }
      ] ++ modules;
    };
in
{
  nixosConfigurations = lib.mapAttrs mkHost {
    vm.modules = [ ./vm ];
  };
}
