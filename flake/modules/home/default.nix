{ pkgs, config, ... }:
{
  home-manager.useGlobalPkgs   = true;
  home-manager.useUserPackages = true;

  fonts.fontconfig.enable = true;

  home-manager.users.mina = {
    home.stateVersion = "25.11";

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
          # Core shell
          quickshell
          matugen

          # Hyprland ecosystem
          hyprlock
          hypridle
          hyprpicker
          hyprsunset
          hyprpolkitagent

          # Wallpaper / display
          swww

          # Clipboard
          cliphist
          wl-clipboard

          # Notification
          libnotify
          swaynotificationcenter

          # Media / audio control
          playerctl
          pavucontrol

          # GTK theming (Material You integration)
          adw-gtk3
          gradience

          # Network management (used by Quickshell widgets)
          networkmanagerapplet

          # Browser
          brave-origin

          # Utilities used by dot scripts
          fd
          ripgrep
          jq
          python3
          socat             # used for IPC scripts
          inotify-tools

          # Utilities
          kdePackages.ark
        ];

    programs.home-manager.enable = true;

    programs.fish = {
      enable = true;
        interactiveShellInit = ''
          set -gx EDITOR hx  # adjust to your preference
        '';
        plugins = [
          # Tide is a fast, feature-rich fish prompt
          { name = "tide"; src = pkgs.fishPlugins.tide.src; }
          { name = "z";    src = pkgs.fishPlugins.z.src; }
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

    # The dots themselves live here as mutable config for easy iteration.
    # Symlink to your cloned/forked dots-hyprland:
    xdg.configFile."hypr".source =
      config.lib.file.mkOutOfStoreSymlink
        "/home/mina/.local/share/dots-hyprland/hypr";

    xdg.configFile."quickshell".source =
      config.lib.file.mkOutOfStoreSymlink
        "/home/mina/.local/share/dots-hyprland/quickshell";
  };
}
