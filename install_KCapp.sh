#!/usr/bin/env bash
# Simple installer for KCapp
# Usage: bash <(curl -sSL https://raw.githubusercontent.com/YOURUSER/YOURREPO/main/install_KCapp.sh)

set -euo pipefail

REPO_URL="https://raw.githubusercontent.com/OS25DT/dehlen/main"
SRC="KCapp.c"
BIN="KCapp"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

echo "[*] Downloading $SRC..."
curl -sSL "$REPO_URL/$SRC" -o "$workdir/$SRC"

echo "[*] Compiling..."
gcc "$workdir/$SRC" -o "$workdir/$BIN"

echo "[*] Installing to /usr/local/bin (sudo password may be required)…"
sudo mv "$workdir/$BIN" /usr/local/bin/
sudo chmod 755 /usr/local/bin/$BIN

echo "[✓] KCapp installed. Run it by typing: KCapp"
