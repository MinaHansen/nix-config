{ inputs, lib, dots-hyprland }:
let
  mkHost =
    name:
    {
      system ? "x86_64-linux",
      modules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs dots-hyprland; };
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

          modules = [
            dots-hyprland.homeManagerModules.default {
              home.username = "mina";
              home.homeDirectory = "/home/mina";
              home.stateVersion = "26.05";

              programs.dots-hyprland = {
                enable = true;
                source = dots-hyprland + "/configs";
                packageSet = "essential";
                mode = "declarative";

                quickshell = {
                  appearance.transparency = false;
                  bar.workspaces.shown = 10;
                  bar.workspaces.variant = "hefty";
                };

                hyprland = {
                  general.gapsIn = 4;
                  general.gapsOut = 7;
                  decoration.rounding = 16;
                  decoration.blurEnabled = true;
                  night.colorTemperature = 4500;
                };
              };
            }
          ];
        }
      ] ++ modules;
    };
in
{
  nixosConfigurations = lib.mapAttrs mkHost {
    desktop.modules = [ ./desktop ];
    vm.modules = [ ./vm ];
  };
}
