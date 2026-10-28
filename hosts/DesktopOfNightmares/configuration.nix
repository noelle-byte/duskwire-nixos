{ lib, pkgs, ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix
    ../../modules/profiles/nightmares-desktop.nix
    ../../modules/hardware/drives
    ../../modules/hardware/video/${vars.videoDriver}.nix
  ];

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/273f4311-e33d-4a9c-8ffd-da6c85a387e1";
    fsType = "ext4";
  };

  boot.loader.timeout = lib.mkForce 3;
  boot.loader.grub.enable = lib.mkForce false;
  boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  services.ollama.package = pkgs.ollama-cuda;
}
