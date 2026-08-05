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
  nixosConfigurations = lib.mapAttrs mkHost {
    desktop.modules = [ ./desktop ];
    vm.modules = [ ./vm ];
  };
in
{
  inherit nixosConfigurations;

  nixosInstallMedia = lib.mapAttrs (_: host: host.extendModules {
    modules = [
      ({ modulesPath, ... }: {
        imports = [
          (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
        ];
      })
    ];
  }) nixosConfigurations;
}
