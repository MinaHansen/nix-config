{ inputs, config, lib, ... }:
let
  cfg = config.my.desktop;
in
{
  options.my.desktop = {
    type = lib.mkOption { type = lib.types.str; };
  };

  imports = [inputs.silentSDDM.nixosModules.default];
  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  services.displayManager.defaultSession = cfg.type;
}
