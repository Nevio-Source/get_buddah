#bin/bas

sudo rm /bin/get_buddah

# Pfad zur .bashrc
BASHRC="$HOME/.bashrc"

# Backup erstellen
cp "$BASHRC" "$BASHRC.bak"

# Zeilen entfernen, die '# Get Buddah in your terminal' oder 'get_buddah' enthalten
sed -i '/# Get Buddah in your terminal/d' "$BASHRC"
sed -i '/get_buddah/d' "$BASHRC"

echo "everthing removed :) all done!"
