#!/bin/bash
# Frog Bot installer for Linux (64-bit Intel/AMD).
#   curl -fsSL https://sayeemkabir.github.io/frogbot/install-linux.sh | bash
set -euo pipefail

REPO="sayeemkabir/frogbot"
if [ "$(uname -m)" != "x86_64" ]; then
  echo "Sorry, Frog Bot for Linux is only built for 64-bit Intel/AMD (x86_64) right now."
  exit 1
fi
URL="https://github.com/$REPO/releases/latest/download/FrogBot-Linux-x64.tar.gz"
DEST="$HOME/.local/share/frogbot"
BIN="$HOME/.local/bin"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo ""
echo "  🐸  Installing Frog Bot for Linux"
echo ""
curl -fL --progress-bar "$URL" -o "$TMP/frogbot.tar.gz"

echo "  Unpacking to $DEST…"
pkill -f "$DEST/frog-bot" >/dev/null 2>&1 || true
rm -rf "$DEST"
mkdir -p "$DEST" "$BIN" "$HOME/.local/share/applications"
tar -xzf "$TMP/frogbot.tar.gz" -C "$DEST" --strip-components=1

# Files packed on another system may lose their "executable" flag.
chmod +x "$DEST/frog-bot" "$DEST/chrome_crashpad_handler" 2>/dev/null || true
find "$DEST/resources/app.asar.unpacked" -path "*claude-agent-sdk-*" -name claude -exec chmod +x {} \; 2>/dev/null || true

# Chromium's sandbox helper must be owned by root. If we can't do that, run without it.
FLAGS="--no-sandbox"
if command -v sudo >/dev/null 2>&1; then
  echo "  Your password may be asked once to set up Chromium's security sandbox."
  if sudo chown root:root "$DEST/chrome-sandbox" && sudo chmod 4755 "$DEST/chrome-sandbox"; then FLAGS=""; fi
fi

cat > "$BIN/frogbot" <<EOF
#!/bin/bash
exec "$DEST/frog-bot" $FLAGS "\$@"
EOF
chmod +x "$BIN/frogbot"

cat > "$HOME/.local/share/applications/frogbot.desktop" <<EOF
[Desktop Entry]
Name=Frog Bot
Comment=Your team of AI agents
Exec=$BIN/frogbot %U
Icon=$DEST/resources/icon.png
Terminal=false
Type=Application
Categories=Office;Utility;
StartupWMClass=Frog Bot
EOF

echo "  ✅ Done! Open Frog Bot from your apps menu, or run: frogbot"
echo "  Then create your account and paste your Claude or OpenAI API key."
echo "  (No Chrome? Frog Bot downloads a browser for the agents on first launch.)"
nohup "$BIN/frogbot" >/dev/null 2>&1 &
