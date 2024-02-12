{ ... }:

{
  networking = {
    hostName = "viserion";
    useDHCP = false;
    defaultGateway = "192.168.4.1";
    nameservers = [
      "192.168.4.102"
      "1.1.1.1"
    ];

    networkmanager.enable = true;

    interfaces = {
      eno1.ipv4.addresses = [
        {
          address = "192.168.4.198";
          prefixLength = 24;
        }
      ];
    };
  };
}
