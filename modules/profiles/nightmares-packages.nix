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
      prismlauncher
      davinci-resolve
    ])
    ++ [
      chatgptPkgs.chatgpt
    ];
}
