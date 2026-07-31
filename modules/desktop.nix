{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # XDG portals (file picker, screen share, etc.)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Required system services
  security.polkit.enable = true;
  services.dbus.enable = true;
  security.rtkit.enable = true;

  # Wayland session env hints for Electron/Qt apps
  environment.sessionVariables = {
    NIXOS_OZONE_WL  = "1";
    QT_QPA_PLATFORM = "wayland";
  };
}
