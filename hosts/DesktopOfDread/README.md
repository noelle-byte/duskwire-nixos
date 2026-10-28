# DesktopOfDread

Shares the desktop modules, services and host packages with DesktopOfNightmares
through `modules/profiles/nightmares-desktop.nix` and `nightmares-packages.nix`.
`variables.nix` starts with the same preferences but can be edited independently.
Both installer host menus discover this directory automatically; the flake exports
`nixosConfigurations.DesktopOfDread`.

Before installation on the target machine:

1. Mount its intended root filesystem at `/mnt` and any separate boot/home filesystems
   beneath it, then generate its configuration:
   `sudo nixos-generate-config --root /mnt`.
2. Copy `/mnt/etc/nixos/hardware-configuration.nix` into
   `hosts/DesktopOfDread/hardware-configuration.nix`, replacing the placeholder.
   The placeholder deliberately prevents a system build until replaced.
3. Set `videoDriver` in `variables.nix` for its actual GPU, and review Bluetooth
   support and `nvidiaChannel` if applicable. No GPU-specific module is selected
   while `videoDriver = null`. Hardware generation does not select these settings.
4. Review the UEFI/systemd-boot settings in `configuration.nix`; change them if the
   target uses a different boot method. Add only this machine's extra disk mounts.
5. Add the new files to Git before using a Git-backed flake. Install from the live
   environment with `sudo nixos-install --flake .#DesktopOfDread` after the above
   preparation, or rebuild an existing installation using
   `sudo nixos-rebuild switch --flake .#DesktopOfDread`.

Nightmares retains its own disk mounts, NVIDIA module, CUDA Ollama package and
kernel/boot overrides. Dread uses ordinary Ollama without assuming CUDA, and the
shared default kernel until a machine-specific override is needed. No Nightmares
UUIDs, CPU settings or extra drive mounts are inherited.
