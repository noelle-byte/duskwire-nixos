{ host, inputs, ... }:
let
  inherit (import ../hosts/${host}/variables.nix) sddmTheme;
in
{
  # Overlay custom derivations into nixpkgs so you can use pkgs.<name>
  additions =
    final: _prev:
    import ../pkgs {
      pkgs = final;
      inherit host;
    };

  # https://wiki.nixos.org/wiki/Overlays
  modifications = final: prev: {
    nur = inputs.nur.overlays.default;

    stable = import inputs.nixpkgs-stable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };

    github-desktop = prev.github-desktop.overrideAttrs (old: {
      postPatch = (old.postPatch or "") + ''
        substituteInPlace app/src/main-process/main.ts \
          --replace-fail \
            "  // Desktop registers it's protocol handler callback on Windows as" \
            "  // Linux protocol handling
    if (!__DARWIN__ && !__WIN32__) {
      const prefixes = Array.from(possibleProtocols, p => \`\${p}://\`)
      const matchingUrl = argv.find(arg => {
        if (prefixes.some(p => arg.startsWith(p))) {
          try {
            new URL(arg)
            return true
          } catch (e) {
            log.error(\`Unable to parse argument as URL: \${arg}\`)
          }
        }
        return false
      })

      if (matchingUrl) {
        handleAppURL(matchingUrl)
        return
      }
    }

    // Desktop registers it's protocol handler callback on Windows as"
      '';
    });
  };
}
