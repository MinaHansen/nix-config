{ inputs, pkgs, dots-hyprland, ... }:
{
  imports = [
    ../modules/sddm.nix
    dots-hyprland.nixosModules.default
  ];

  nixpkgs.overlays = [ dots-hyprland.overlays.default ];

  home-manager.users.mina = {
    imports = [
      dots-hyprland.homeManagerModules.default
    ];

    programs.dots-hyprland = {
      enable = true;
      source = dots-hyprland + "/configs";
      packageSet = "essential";
      mode = "hybrid";

      configuration.copyFishConfig = false;

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
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  hardware.graphics = {
    package = pkgs.mesa;
    enable32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa;
  };

  # Hyprland specific dotfiles
  home-manager.users.mina = {
    xdg.configFile."hypr".source = ../assets/hypr;
    xdg.configFile."hypr".recursive = true;

    xdg.configFile."kitty".source = ../assets/kitty;
    xdg.configFile."kitty".recursive = true;

    xdg.configFile."fish".source = ../assets/fish;
    xdg.configFile."fish".recursive = true;
  };
}
