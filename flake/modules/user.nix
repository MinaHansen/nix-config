{ pkgs, ... }:
{
  users.users.mina = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    shell = pkgs.fish;
  };

  security.sudo.wheelNeedsPassword = true;

  programs.fish.enable = true;
}
