{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      stdenv = prev.stdenv.adapters.withCFlags
        [ "-fomit-frame-pointer" "-O2" ]
        prev.stdenv;
    })
  ];
}
