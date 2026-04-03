#!/bin/bash

set -euo pipefail

# Verzeichnis des Skripts ermitteln (egal von wo es gestartet wird)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BINARY_DIR="$SCRIPT_DIR/binary"
SOURCE_FILE="$BINARY_DIR/get_buddah"
TARGET_FILE="/bin/get_buddah"
BASHRC_FILE="$HOME/.bashrc"

# Prüfen ob Datei existiert
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Fehler: $SOURCE_FILE nicht gefunden."
    exit 1
fi

echo "Kopiere get_buddah nach /bin/ (sudo benötigt)..."
sudo cp "$SOURCE_FILE" "$TARGET_FILE"
sudo chmod +x "$TARGET_FILE"

# Eintrag für .bashrc vorbereiten
BASHRC_ENTRY=$'\n# Get Buddah in your terminal\nget_buddah\n'

# Prüfen ob Eintrag schon existiert
if ! grep -q "get_buddah" "$BASHRC_FILE"; then
    echo "Füge Eintrag zu ~/.bashrc hinzu..."
    printf "%s" "$BASHRC_ENTRY" >> "$BASHRC_FILE"
else
    echo "Eintrag in ~/.bashrc existiert bereits. Überspringe."
fi

echo "Fertig. Öffne ein neues Terminal oder führe 'source ~/.bashrc' aus."
