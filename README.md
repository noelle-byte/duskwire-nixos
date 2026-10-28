# Duskwire

My personal NixOS configuration for a desktop and laptop, built around
Hyprland, a dark desktop, gaming, and everyday creative and development work.

Duskwire started from [Sly-Harvey's NixOS configuration](https://github.com/Sly-Harvey/NixOS)
and has grown into a setup for my own machines. It uses Nix flakes and integrated
Home Manager modules to keep the system and user environment together.

## The desktop

Both published hosts currently select:

- **Hyprland**, with Lua configuration for monitors, keybindings, window rules,
  animations, and desktop behavior.
- **Waybar** with the minimal layout, **Rofi**, **SwayNC**, **Hyprlock**,
  **Hypridle**, and **wlogout**.
- The **Duskwire theme module**, currently using Catppuccin Mocha with a red
  accent for GTK and Kvantum, alongside Papirus-Dark icons and a Duskwire wallpaper.
- **Kitty**, **Zsh**, **Firefox**, **VS Code**, and **Thunar** as the selected
  terminal, shell, browser, editor, and file manager.
- **PipeWire** for audio and **SDDM** with the Astronaut theme for login.
- British English, a UK keyboard layout, and the Europe/London time zone.

Gaming is enabled on both hosts: Steam with Proton GE, Wine staging, Bottles,
Gamescope, GameMode, and MangoHud. Host packages also include Obsidian, Godot,
Proton VPN, GitHub Desktop, and GitHub CLI.

The main desktop enables Syncthing and Jellyfin. The laptop keeps its own
service selection and enables the Flatpak module. Available modules are not
necessarily enabled on every host; each host's imports are the source of truth.

## Hosts

| Host | Role | Graphics | Hardware notes |
| --- | --- | --- | --- |
| `DesktopOfNightmares` | Main desktop | NVIDIA | No battery or Bluetooth support selected |
| `LaptopOfDreams` | Laptop | AMD | Battery and Bluetooth support enabled |

**DesktopOfDread is being prepared separately.** It is intended to share the main
desktop's general configuration and packages while keeping its own hardware
configuration. Its local setup changes are not included in this documentation
PR; the two hosts above are the ones exported by the current published flake.

## Finding and changing things

```text
hosts/
  DesktopOfNightmares/
  LaptopOfDreams/
modules/
  core/                  System services, packages, boot, users, and gaming
  desktop/               Hyprland and alternative desktop modules
  hardware/              GPU drivers and additional drive mounts
  programs/              Browsers, terminals, editors, and other applications
  scripts/               Rebuild, rollback, and desktop helpers
  themes/                Duskwire and other theme modules
overlays/                Package customizations
pkgs/                    Locally defined packages
dev-shells/              Development environment templates
flake.nix                Inputs, host selection, formatter, and templates
flake.lock               Pinned input revisions
```

Each host has four main files:

| File | What it controls |
| --- | --- |
| `variables.nix` | Username, hostname, desktop, bar, applications, GPU selection, locale, and other preferences |
| `configuration.nix` | Enabled modules and additional host-specific settings |
| `host-packages.nix` | Packages added specifically for that host |
| `hardware-configuration.nix` | Generated filesystems, platform, CPU, and boot-time hardware settings |

Start with `hosts/<HOST>/variables.nix` for everyday choices. For example,
`games` controls the gaming module, while `desktop`, `bar`, `browser`, and
`terminal` select modules. Hyprland also has Noctalia and Wayle bar modules;
i3, GNOME, and Plasma 6 modules are present as alternative desktops.

Hyprland configuration lives in `modules/desktop/hyprland/lua/`. Review
`monitors.lua` when changing displays and `binds.lua` for the actual shortcuts.
Application configuration lives under `modules/programs/`; desktop theme
integration is in `modules/themes/duskwire/`.

## Using this configuration

This repository contains personal machine settings. Before applying it to
another computer, review the username, GPU driver, disk mounts, boot method,
monitor layout, and enabled network services. In particular,
`modules/hardware/drives/` contains mounts for the main desktop's extra disks.
Generating a new hardware file does not remove mounts imported elsewhere.

Clone this fork into the location used by the rebuild helpers:

```bash
git clone https://github.com/noelle-byte/duskwire-nixos.git ~/NixOS
cd ~/NixOS
```

### Existing NixOS installation

After reviewing the selected host and replacing its hardware configuration with
one generated for the target machine, apply it explicitly:

```bash
sudo nixos-rebuild switch --flake ~/NixOS#DesktopOfNightmares
```

Use `LaptopOfDreams` instead for the laptop. Keep new files tracked by Git so
they are included when Nix evaluates a Git-backed flake.

The interactive `./install.sh` helper can select a host and update its user,
driver, and hardware settings. Run it as your normal user on an installed
NixOS system; it requests elevated privileges for the steps that need them.

### Fresh installation

Boot a NixOS live environment, clone the repository, and review
`live-install.sh` before running the interactive installer:

```bash
sudo ./live-install.sh
```

The live installer includes disk preparation and installation steps. Choose the
target disk deliberately and back up anything you intend to keep before using
its partitioning options.

### Rebuilds and rollback

The installed `rebuild` command selects the host it was built for. It also
rewrites the username, refreshes the host's hardware configuration from
`/etc/nixos` or hardware detection, and stages that hardware file before
rebuilding. Use an explicit `nixos-rebuild` command when you want to control
those preparatory steps yourself.

To list generations and select one using the included helpers:

```bash
list-gens
rollback <GENERATION>
```

A previous generation can also be selected from the boot menu.

## Development shells

The flake exposes language and toolchain templates from `dev-shells/`, including
Python, Node.js, Rust, Go, C/C++, and LaTeX. For example:

```bash
nix flake new -t ~/NixOS#python my-project
cd my-project
nix develop
```

Use `nix flake init -t ~/NixOS#python` inside an existing project. Templates with
an `.envrc` can also be used with direnv after reviewing and allowing the file.
See `dev-shells/default.nix` for the template names.

## Credits and license

- [Sly-Harvey/NixOS](https://github.com/Sly-Harvey/NixOS) — the original configuration this fork builds on.
- [JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots) — scripts and Waybar templates.
- [HyDE](https://github.com/HyDE-Project/HyDE) — additional scripts.
- [adi1090x/rofi](https://github.com/adi1090x/rofi) — launcher styles.
- [the-nix-way/dev-templates](https://github.com/the-nix-way/dev-templates) — development templates.
- [Catppuccin](https://github.com/catppuccin) — the GTK and Qt theme foundation.

Licensed under the [MIT license](LICENSE), with the original copyright notice retained.
