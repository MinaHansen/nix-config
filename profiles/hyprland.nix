{ inputs, pkgs, ... }:
{
  imports = [
    ../modules/sddm.nix
  ];

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
}
