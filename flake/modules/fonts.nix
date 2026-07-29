{ pkgs, lib, ... }:
let
  # BIZ UD Mincho derivation
  biz-ud-mincho = pkgs.stdenvNoCC.mkDerivation {
    pname = "biz-ud-mincho";
    version = "1.06";
    src = pkgs.fetchzip {
      url    = "https://github.com/googlefonts/morisawa-biz-ud-mincho"
             + "/releases/download/v1.06/morisawa-biz-ud-mincho-fonts.zip";
      hash   = ""; # Change me
    };
    nativeBuildInputs = [ pkgs.installFonts ];
    sourceRoot        = "morisawa-biz-ud-mincho-fonts/fonts/ttf";
    meta = {
      description = "Morisawa BIZ UD Mincho typeface";
      license     = lib.licenses.ofl;
    };
  };
in
{
  fonts.packages = with pkgs; [
    # CJK
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    biz-ud-mincho
    biz-ud-gothic
    lxgw-wenkai

    # Monospace / UI
    nerd-fonts.jetbrains-mono
    material-symbols
  ];

  fonts.fontconfig = {
      enable = true;
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>

          <!-- ===== Serif ===== -->
          <alias>
            <family>serif</family>
            <prefer>
              <family>Noto Serif</family>
              <family>Noto Serif CJK JP</family>
              <family>Noto Serif CJK SC</family>
            </prefer>
          </alias>

          <match target="pattern">
            <test name="lang" compare="contains"><string>ja</string></test>
            <test name="family"><string>serif</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>BIZ UD Mincho</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang" compare="contains"><string>zh-cn</string></test>
            <test name="family"><string>serif</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>LXGW WenKai</string>
            </edit>
          </match>

          <!-- ===== Sans-serif ===== -->
          <alias>
            <family>sans-serif</family>
            <prefer>
              <family>Noto Sans</family>
              <family>Noto Sans CJK JP</family>
              <family>Noto Sans CJK SC</family>
            </prefer>
          </alias>

          <!-- ===== Monospace ===== -->
          <alias>
            <family>monospace</family>
            <prefer>
              <family>Noto Sans Mono</family>
              <family>Noto Sans Mono CJK JP</family>
              <family>Noto Sans Mono CJK SC</family>
            </prefer>
          </alias>

          <!-- ===== Light weight for Noto Sans at small sizes ===== -->
          <match target="font">
            <test name="pixelsize" compare="less_eq"><double>12</double></test>
            <test name="family" compare="contains"><string>Noto Sans</string></test>
            <edit name="weight" mode="assign"><const>light</const></edit>
          </match>

          <!-- ===== Hinting for CJK ===== -->
          <match target="font">
            <or>
              <test name="lang" compare="contains"><string>zh</string></test>
              <test name="lang" compare="contains"><string>ja</string></test>
            </or>
            <edit name="autohint" mode="assign"><bool>false</bool></edit>
            <edit name="hinting"  mode="assign"><bool>true</bool></edit>
          </match>

      </fontconfig>
    '';
  };
}
