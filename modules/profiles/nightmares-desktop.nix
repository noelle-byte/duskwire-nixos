{ lib, pkgs, host, ... }:
let
  vars = import ../../hosts/${host}/variables.nix;
in
{
  imports = [

    # Core Modules (Don't change unless you know what you're doing)
    ../../modules/scripts
    ../../modules/core/boot.nix
    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/starship.nix
    ../../modules/core/fonts.nix
    ../../modules/core/hardware.nix
    ../../modules/core/network.nix
    ../../modules/core/dns.nix
    ../../modules/core/nh.nix
    ../../modules/core/packages.nix
    ../../modules/core/printing.nix
    ../../modules/core/sddm.nix
    ../../modules/core/security.nix
    ../../modules/core/services.nix
    ../../modules/core/system.nix
    ../../modules/core/users.nix
    ../../modules/core/syncthing.nix
    ../../modules/core/jellyfin.nix
    # ../../modules/core/dlna.nix
    # ../../modules/core/flatpak.nix
    # ../../modules/core/virtualisation.nix

    # Optional
    ../../modules/desktop/${vars.desktop} # Set window manager defined in variables.nix
    ../../modules/programs/browser/${vars.browser} # Set browser defined in variables.nix
    ../../modules/programs/terminal/${vars.terminal} # Set terminal defined in variables.nix
    ../../modules/programs/editor/${vars.editor} # Set editor defined in variables.nix
    ../../modules/programs/file-manager/${vars.fileManager} # Set file-manager defined in variables.nix
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/cava
    # ../../modules/programs/cli/fastfetch
    ../../modules/programs/cli/btop
    ../../modules/programs/media/discord
    ../../modules/programs/media/spicetify
    # ../../modules/programs/media/youtube-music
    ../../modules/programs/media/thunderbird
    # ../../modules/programs/media/obs-studio
    ../../modules/programs/media/mpv
    ../../modules/programs/misc/tlp
    ../../modules/programs/misc/lact # GPU fan, clock and power configuration
  ]
  ++ lib.optional (vars.games == true) ../../modules/core/games.nix;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      mfcj6510dwlpr
      mfcj6510dw-cupswrapper
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.ollama = {
    enable = true;
    package = lib.mkDefault pkgs.ollama;
    host = "127.0.0.1";
    port = 11434;

    loadModels = [
      "qwen2.5:1.5b"
    ];
  };

  services.litellm = {
    enable = true;
    host = "127.0.0.1";
    port = 4000;
    openFirewall = false;

    settings = {
      model_list = [
        {
          model_name = "ollama/qwen2.5:1.5b";

          litellm_params = {
            model = "ollama/qwen2.5:1.5b";
            api_base = "http://127.0.0.1:11434";
          };
        }
      ];
    };
  };

  services.open-webui = {
    enable = true;
    host = "127.0.0.1";
    port = 8080;

    environment = {
      OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      WEBUI_AUTH = "False";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
