{ lib, ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix
    ../../modules/profiles/nightmares-desktop.nix
  ] ++ lib.optional (vars.videoDriver != null)
    ../../modules/hardware/video/${vars.videoDriver}.nix;

  # Review the boot method on the target machine before installation.
  boot.loader.timeout = lib.mkForce 3;
  boot.loader.grub.enable = lib.mkForce false;
  boot.loader.systemd-boot.enable = true;
}
