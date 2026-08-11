{ inputs, config, ... }:
{
  imports = [inputs.silentSDDM.nixosModules.default];
  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  services.displayManager.defaultSession = config.my.desktop.type;
}
