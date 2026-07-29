{ config, pkgs, lib, ... }:
let
  cfg = config.my.features;
in
{
  options.my.features = {
    steam = lib.mkEnableOption "Steam gaming platform";
    discord = lib.mkEnableOption "Discord";
    devTools = lib.mkEnableOption "Development tools";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.steam {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        gamescopeSession.enable = true;
      };
      hardware.graphics.enable32Bit = true;
    })

    (lib.mkIf cfg.discord {
      environment.systemPackages = [ pkgs.vesktop ];
    })

    (lib.mkIf cfg.devTools {
      environment.systemPackages = with pkgs; [
        # Zig
        zig
        zls

        # Rust
        rustup

        # C
        gcc
        clang
        cmake
        ninja
        pkg-config

        # C#
        dotnet-sdk

        # General
        gdb
        lldb
        helix

        # Editors
        zed-editor
        jetbrains-mono
        clion
        rider
        rust-rover
      ];
    })
  ];
}
