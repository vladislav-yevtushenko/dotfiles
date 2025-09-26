#!/usr/bin/env zsh
set -euo pipefail

# Auto-apply Gruvbox theme based on macOS appearance

# Prefer an explicit Kitty config directory if set; otherwise use standard path
CONFIG_DIR="${KITTY_CONFIG_DIRECTORY:-${XDG_CONFIG_HOME:-$HOME/.config}/kitty}"
DARK_FILE="$CONFIG_DIR/themes/gruvbox-dark.conf"
LIGHT_FILE="$CONFIG_DIR/themes/gruvbox-light.conf"
CURRENT_LINK="$CONFIG_DIR/themes/current-theme.conf"

# Detect macOS appearance (true/false)
is_dark=$(osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode' 2>/dev/null || echo false)

if [[ "$is_dark" == "true" ]]; then
  target="$DARK_FILE"
else
  target="$LIGHT_FILE"
fi

# Update the current-theme.conf to include the chosen theme
# current-theme.conf is inside "$CONFIG_DIR/themes", so write a path relative to that dir
cat > "$CURRENT_LINK" <<EOF
include ${target#$CONFIG_DIR/themes/}
EOF

# Live-update all running kitty instances (requires allow_remote_control yes)
if command -v kitty >/dev/null 2>&1; then
  kitty @ set-colors --all "$target" >/dev/null 2>&1 || true
fi

echo "Applied theme: ${target:t}"
