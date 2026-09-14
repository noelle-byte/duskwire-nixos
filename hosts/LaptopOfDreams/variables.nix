{
  username = "noelle"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "hyprland"; # hyprland, i3, gnome, plasma6

  # Theme & Appearance
  bar = "waybar"; # waybar, noctalia, wayle
  waybarTheme = "minimal"; # stylish, minimal
  sddmTheme = "astronaut"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "evening-sky.webp"; # Change with SUPER + SHIFT + W (Hyprland)
  hyprlockWallpaper = "kurzgesagt-galaxies.webp";

  # Default Applications
  terminal = "kitty"; # kitty, alacritty, wezterm
  editor = "vscode"; # nixvim, vscode, helix, doom-emacs, nvchad, neovim
  browser = "zen-beta"; # zen-beta, firefox, floorp
  fileManager = "thunar"; # yazi, lf, thunar
  shell = "zsh"; # bash, zsh
  games = true; # Enable/Disable gaming module

  # Hardware
  hostname = "LaptopOfDreams";
  videoDriver = "amdgpu"; # nvidia, amdgpu, intel
  nvidiaChannel = "stable"; # stable, latest, beta, legacy_xxx
  bluetoothSupport = true; # Whether your motherboard supports bluetooth
  batterySupport = true; # Whether device has a battery (laptop)

  # Localization
  timezone = "Europe/London";
  locale = "en_GB.UTF-8";
  clock24h = true;
  kbdLayout = "gb";
  kbdVariant = "extd";
  consoleKeymap = "uk";
  capslockAsESC = false;
}
