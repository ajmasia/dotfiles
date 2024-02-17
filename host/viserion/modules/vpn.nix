{ ... }:

{
  # enables Mullvad VPN daemon. 
  # this sets networking.firewall.checkReversePath to “loose”, which might be undesirable for security.
  services.mullvad-vpn.enable = true;
}
