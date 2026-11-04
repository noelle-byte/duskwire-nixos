{ pkgs, inputs, ... }:

let
  chatgptPkgs = import inputs.chatgpt-nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

  qrookie = inputs.glaumar_repo.packages.${pkgs.stdenv.hostPlatform.system}.qrookie;
in
{
  environment.systemPackages =
    (with pkgs; [
      obsidian
      # ludusavi
      godot
      proton-vpn
      github-desktop
      gh
      prismlauncher
      davinci-resolve
    ])
    ++ [
      chatgptPkgs.chatgpt
      qrookie
    ];
}