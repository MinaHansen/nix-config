{ ... }:
{
  programs.niri.enable = true;

  # Keep the compositor configuration intentionally small while providing
  # the essentials for a usable session.
  home-manager.users.mina.xdg.configFile."niri/config.kdl".text = ''
    prefer-no-csd

    layout {
        gaps 8
        center-focused-column "never"
    }

    binds {
        Mod+Return { spawn "kitty"; }
        Mod+Q { close-window; }
        Mod+O { toggle-overview; }
        Mod+Shift+E { quit; }
    }
  '';
}
