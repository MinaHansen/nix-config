{
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        "2620:fe::fe#dns.quad9.net"
        "2620:fe::9#dns.quad9.net"
        "9.9.9.9#dns.quad9.net"
        "149.112.112.112#dns.quad9.net"
      ];
      DNSOverTLS = "yes";
    };
  };

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  imports = [
    ../boot.nix
    ../features.nix
    ../input.nix
    ../kernel.nix
    ../nix.nix
    ../user.nix
    ../bravepolicy.nix
  ];
}
