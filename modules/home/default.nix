{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland.systemd.enable = false;
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
      quickshell
      matugen
      hyprlock
      hypridle
      hyprpicker
      hyprsunset
      hyprpolkitagent
      awww
      cliphist
      wl-clipboard
      libnotify
      swaynotificationcenter
      playerctl
      pavucontrol
      adw-gtk3
      networkmanagerapplet
      brave-origin
      fd
      ripgrep
      jq
      python3
      socat             # used for IPC scripts
      inotify-tools

      kdePackages.ark
      gitkraken
    ];

    environment.etc."brave/policies/GroupPolicy.json".text = ''
      {
        "BraveRewardsEnabled": false,
        "BraveWalletDisabled": true,
        "BraveVPNDisabled": true,
        "BraveTalkDisabled": true,
        "BraveNewsDisabled": true,
        "BraveAIChatEnabled": false,

        "MetricsReportingEnabled": false,
        "TelemetryEnabled": false,
        "BackgroundModeEnabled": false,

        "PasswordManagerEnabled": false,
        "AutofillAddressEnabled": false,
        "AutofillCreditCardEnabled": false,

        "DefaultSearchProviderEnabled": true,
        "DefaultSearchProviderName": "Kagi",
        "DefaultSearchProviderSearchURL": "https://kagi.com/search?q={searchTerms}",
        "DefaultSearchProviderSuggestURL": "https://kagi.com/api/autosuggest?q={searchTerms}",
        "DefaultSearchProviderIconURL": "https://kagi.com/favicon.ico",
        "DefaultSearchProviderKeyword": "kagi",

        "DNSOverHTTPSMode": "secure",
        "BuiltInDnsClientEnabled": true,

        "BlockThirdPartyCookies": true,
        "DefaultCookiesSetting": 1,

        "BraveShieldsEnabled": true,
        "BraveShieldsDefaultAdsSetting": "block",
        "BraveShieldsDefaultTrackersSetting": "block",
        "BraveShieldsDefaultFingerprintingSetting": "standard",

        "DefaultGeolocationSetting": 2,
        "DefaultNotificationsSetting": 2,
        "DefaultMediaStreamCameraSetting": 2,
        "DefaultMediaStreamMicSetting": 2,

        "WebRtcIPHandlingPolicy": "disable_non_proxied_udp",

        "SafeBrowsingEnabled": true,
        "SafeBrowsingExtendedReportingEnabled": false
      }
    '';

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

  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink
      "/home/mina/.local/share/dots-hyprland/hypr";

  xdg.configFile."quickshell".source =
    config.lib.file.mkOutOfStoreSymlink
      "/home/mina/.local/share/dots-hyprland/quickshell";
}
