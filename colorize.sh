#!/bin/bash
cat <<EOF

Usage (always shown):
  $0 [color]
  Call with a color name (e.g. '#0f0', 'red') to set that color.
  Call $0 without parameters (or an invalid color) to remove all effects.
  Remember that # is a shell metacharacter (escape your color).

Examples:
  $0 '#0f0'
  $0 red
  $0

EOF

COL=$(echo "$1" | tr -d '\n' | jq -R .)

if [[ -n "$COL" ]]; then
  echo "Escaped color name: $COL"
  gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "Main.uiGroup.clear_effects(); const e = new imports.gi.Clutter.ColorizeEffect(); const c = imports.gi.Clutter.Color.from_string($COL); if (c[0]) { e.set_tint(c[1]); Main.uiGroup.add_effect(e); }"
else
  echo "No color given, clearing effects."
  gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "Main.uiGroup.clear_effects();"
fi

