# Athena OS Student role package selection.
# Upstream: https://github.com/Athena-OS/athena-nix/blob/781c77432ced2882cff1f8c5b899804096ae852d/nixos/modules/cyber/roles/student.nix
# Snapshot deliberately kept local to avoid importing Athena's operating-system
# configuration or introducing an unlocked flake input. Review upstream when updating.

{ pkgs, ... }:

with pkgs;

[
  aircrack-ng
  binwalk
  burpsuite
  caido
  cewl
  crunch
  dirb
  dnsmasq
  edb
  enum4linux
  enum4linux-ng
  evil-winrm
  exploitdb
  ffuf
  fierce
  ghidra
  gobuster
  hashcat
  hashcat-utils
  hcxtools
  john
  kismet
  medusa
  metasploit
  mitmproxy
  nasm
  nikto
  nmap
  proxychains-ng
  pwncat
  python313Packages.pypykatz
  radare2
  responder
  social-engineer-toolkit
  sqlmap
  thc-hydra
  theharvester
  wafw00f
  wfuzz
  wifite2
  wireshark
  wpscan
  ### payloads and wordlists
  payloadsallthethings
  seclists
]
