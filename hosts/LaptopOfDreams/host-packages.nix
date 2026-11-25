{ pkgs, inputs, ... }:

let
  chatgptPkgs = import inputs.chatgpt-nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
  athenaStudentPkgs = import ./athena-student-packages.nix { inherit pkgs; };
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
    ++ athenaStudentPkgs;
}