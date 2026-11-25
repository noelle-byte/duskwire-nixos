{ pkgs, inputs, ... }:

let
  chatgptPkgs = import inputs.chatgpt-nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
  athenaStudentPkgs = import
    "${inputs.athena-nix}/nixos/modules/cyber/roles/student.nix"
    { inherit pkgs; };
  
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
      
    ])
    ++ [
      chatgptPkgs.chatgpt
    ]
    ++ analysisPkgs;
}