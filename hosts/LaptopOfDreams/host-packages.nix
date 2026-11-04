{ pkgs, inputs, ... }:

let
  chatgptPkgs = import inputs.chatgpt-nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
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
      # pokego # Overlayed
    ])
    ++ [
      inputs.glaumar_repo.packages.${pkgs.stdenv.hostPlatform.system}.qrookie
      chatgptPkgs.chatgpt
    ];
}