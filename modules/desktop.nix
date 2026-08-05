{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  # UWSM and Git
  environment.systemPackages = [
    pkgs.uwsm
    pkgs.git
  ];

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
     hyprland = {
       prettyName = "Hyprland";
       comment = "Hyprland compositor managed by UWSM";
       binPath = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprland";
     };
    };
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
