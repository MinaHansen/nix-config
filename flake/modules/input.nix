{ pkgs, config, lib, ... }:
let
  cfg = config.my.input;
  keyboardLayoutShort = cfg.keyboardLayoutShort;
  keyboardLayout      = cfg.keyboardLayout;
in
{
  options.my.input = {
    keyboardLayoutShort = lib.mkOption {
      type = "str";
      default = "jp";
      description = "Keyboard layout short name (e.g. 'jp' for Japanese)";
    };
    keyboardLayout = lib.mkOption {
      type = "str";
      default = "jp106";
      description = "Keyboard layout (e.g. 'jp106' for Japanese)";
    };
  };

  # Input method configuration
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-mozc
        (fcitx5-rime.override {
          rimeDataPkgs = [ rime-data ];
        })
        fcitx5-gtk
        fcitx5-configtool
      ];

      settings.inputMethod = {
        "Groups/0" = {
          Name = "Japanese";
          "Default Layout" = "${keyboardLayout}";
          DefaultIM = "mozc";
        };
        "Groups/0/Items/0".Name = "keyboard-${keyboardLayoutShort}";
        "Groups/0/Items/1".Name = "mozc";

        "Groups/1" = {
          Name = "Mandarin";
          "Default Layout" = "${keyboardLayoutShort}";
          DefaultIM = "rime";
        };
        "Groups/1/Items/0".Name = "keyboard-${keyboardLayoutShort}";
        "Groups/1/Items/1".Name = "rime";

        "Groups/2" = {
          Name = "Norwegian";
          "Default Layout" = "no";
          DefaultIM = "keyboard-no";
        };
        "Groups/2/Items/0".Name = "keyboard-no";

        GroupOrder."0" = "Japanese";
        GroupOrder."1" = "Mandarin";
        GroupOrder."2" = "Norwegian";
      };
    };
  };

  console.keyMap = "${keyboardLayout}";
  services.xserver.xkb.layout = "${keyboardLayoutShort}";
}
