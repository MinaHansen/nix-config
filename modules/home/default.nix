{ pkgs, ... }:
{
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.username = "mina";
  home.homeDirectory = "/home/mina";
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
      brave-origin

      nil
      nixd
      nixfmt

      kdePackages.ark
      gitkraken
    ];

  home.sessionVariables = {
     GTK_IM_MODULE  = "fcitx";
     QT_IM_MODULE   = "fcitx";
     XMODIFIERS     = "@im=fcitx";
     SDL_IM_MODULE  = "fcitx";
  };

}
