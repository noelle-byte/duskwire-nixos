{ pkgs, inputs, ... }:

let
  chatgptPkgs = import inputs.chatgpt-nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
  
  analysisPkgs = with pkgs; [
    binwalk
    ghidra
    radare2
    nasm
    wireshark
  ];
  
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
      yetris
      kdePackages.kdenlive
      
    ])
    ++ [
      chatgptPkgs.chatgpt
    ]
    ++ analysisPkgs;
}