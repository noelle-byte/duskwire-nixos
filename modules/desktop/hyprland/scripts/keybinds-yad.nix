{ pkgs, ... }:

pkgs.writeShellScriptBin "keybinds-yad" ''
  if ${pkgs.procps}/bin/pidof yad >/dev/null; then
    ${pkgs.procps}/bin/pkill yad
    exit 0
  fi

  rows=()

  while IFS=$'\t' read -r key description command; do
    rows+=("$key" "$description" "$command")
  done < <(
    hyprctl -j binds |
      ${pkgs.jq}/bin/jq -r '
        def hasbit($bit):
          (((.modmask / $bit) | floor) % 2) == 1;

        def modifiers:
          [
            if hasbit(64) then "SUPER" else empty end,
            if hasbit(4)  then "CTRL"  else empty end,
            if hasbit(8)  then "ALT"   else empty end,
            if hasbit(1)  then "SHIFT" else empty end
          ];

        .[] |
        select((.key // "") != "") |

        [
          ((modifiers + [.key]) | join(" + ")),

          (
            if (.description // "") != ""
            then .description
            else "-"
            end
          ),

          (
            (.dispatcher // "")
            +
            if (.arg // "") != ""
            then " " + .arg
            else ""
            end
          )
        ] |

        @tsv
      '
  )

  ${pkgs.yad}/bin/yad \
    --center \
    --title="Hyprland Keybinds" \
    --no-buttons \
    --list \
    --width=850 \
    --height=920 \
    --column="Key" \
    --column="Description" \
    --column="Action" \
    "''${rows[@]}"
''