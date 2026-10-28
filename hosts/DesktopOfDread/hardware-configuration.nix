# Placeholder: replace this entire file with the target machine's generated config.
# Never copy DesktopOfNightmares disk UUIDs, CPU modules, or microcode settings.
{ lib, ... }:
{
  # Provisional desktop platform; replaced with the generated hardware config.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  assertions = [
    {
      assertion = false;
      message = "DesktopOfDread: replace hosts/DesktopOfDread/hardware-configuration.nix with hardware configuration generated on that machine before building.";
    }
  ];
}
