{ inputs, ... }:
{
  imports = [
    ../modules/sddm.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland;
  };
}
