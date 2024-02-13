{ pkgs, ... }:

{
  services = {
    # LAN discovery protocol with zeroconf support service 
    avahi = {
      enable = true;

      nssmdns4 = true;
      publish = {
        enable = true;

        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };
    };
  };

  # easy external devices management
  services.udisks2.enable = true;

  # GNOME Virtual File System
  # allow applications on your system to interact seamlessly with devices and network resources as if they were local files
  services.gvfs.enable = true;

  # SSD trim support
  # free unused blocks on the device, helps to maintain performance and reduce wear on SSDs and NVMe drives
  services.fstrim.enable = true;

  # service to access the system remotely using SSH
  services.openssh.enable = false;

  # printer service
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [ hplip ];

  # enables the system to handle power-related events efficiently through ACPI
  # ACPI is a standard for power management and device configuration across operating systems
  services.acpid.enable = true;
}
