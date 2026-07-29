{ ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = false;

  # Automatic updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "daily";

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;
}
