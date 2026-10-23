#!/bin/bash
# Frog Bot installer for macOS.
#   curl -fsSL https://sayeemkabir.github.io/frogbot/install-mac.sh | bash
set -euo pipefail

REPO="sayeemkabir/frogbot"
if [ "$(uname -m)" = "arm64" ]; then ARCH="arm64"; KIND="Apple Silicon"; else ARCH="x64"; KIND="Intel"; fi
URL="https://github.com/$REPO/releases/latest/download/FrogBot-Mac-$ARCH.zip"
APP="/Applications/Frog Bot.app"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo ""
echo "  🐸  Installing Frog Bot for Mac ($KIND)"
echo ""
curl -fL --progress-bar "$URL" -o "$TMP/frogbot.zip"

echo "  Putting it in your Applications folder…"
osascript -e 'quit app "Frog Bot"' >/dev/null 2>&1 || true
rm -rf "$APP"
ditto -x -k "$TMP/frogbot.zip" /Applications/

# The app is not signed with an Apple developer certificate, so macOS would
# block it. Clear the download flag and give it a local signature instead.
xattr -cr "$APP"
codesign --force --deep --sign - "$APP" >/dev/null 2>&1 || true

echo "  ✅ Done! Frog Bot is in Applications. Opening it now…"
open "$APP"
