{ pkgs, ... }:
{
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.stateVersion = "26.05";

  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
        patch:
          schema_list:
            - schema: terra_pinyin
  '';

  home.file.".local/share/fcitx5/rime/terra_pinyin.custom.yaml".text = ''
        patch:
          switches:
            - name: simplification
              reset: 1
  '';

  home.packages = with pkgs; [
      kitty
      wl-clipboard
      libnotify
      playerctl
      pavucontrol
      adw-gtk3
      networkmanagerapplet
      brave-origin
      fd
      ripgrep
      jq
      python3

      kdePackages.ark
      gitkraken
    ];

  programs.fish = {
    enable = true;
      interactiveShellInit = ''
        set -gx EDITOR hx
      '';
      plugins = [
        { name = "tide"; src = pkgs.fishPlugins.tide.src; }
        { name = "z"; src = pkgs.fishPlugins.z.src; }
      ];
  };

  programs.starship = {
    enable                = true;
    enableFishIntegration = true;
  };

  home.sessionVariables = {
     GTK_IM_MODULE  = "fcitx";
     QT_IM_MODULE   = "fcitx";
     XMODIFIERS     = "@im=fcitx";
     SDL_IM_MODULE  = "fcitx";
  };

}
