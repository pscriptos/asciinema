#!/bin/bash
# Script Name:  asciinema-installer.v1.sh
# Beschreibung: Installiert die asciinema Software und konfiguriert die Bash-Umgebung
# Aufruf:       ./asciinema-installer.v1.sh
# Autor:        Patrick Asmus
# Web:          https://www.media-techport.de
# Git-Reposit.: -
# Version:      1.0
# Datum:        02.01.2024
# Modifikation: Initial
#####################################################

ASCIINEMA_API_URL="https://asciinema.media-techport.de"

# Software installieren
sudo apt update && sudo apt install asciinema -y

# Überprüfen, ob die Oh-my-ZSH-Konfigurationsdatei '.zshrc' existiert
if [ -f "/root/.zshrc" ]; then
    CONFIG_FILE="/root/.zshrc"
else
    CONFIG_FILE="/root/.bashrc"
fi

# Konfigurationsdatei bearbeiten
echo "export ASCIINEMA_API_URL=$ASCIINEMA_API_URL" >> $CONFIG_FILE

# Info an Benutzer
echo "----------------------------------------------------"
echo "Bitte starte das Terminal neu, um die Änderungen zu übernehmen."

# Weitere Befehle für die Verwendung von asciinema
echo "----------------------------------------------------"
echo "Folgende Befehle stehen anschließend zur Verfügung:"
echo ""
echo "asciinema auth                Startet die Authentifizierung über die API der eigenen Instanz"
echo "asciinema rec 'name'          Startet die Aufnahme mit dem angegebenen Namen"
echo "asciinema upload 'name'       Lädt das File auf die Instanz $ASCIINEMA_API_URL hoch"
echo "asciinema play 'name'         Spielt eine aufgezeichnete Sitzung ab."
echo "asciinema ls                  Listet alle lokalen Aufzeichnungen auf."
echo "asciinema cat 'name'          Zeigt den Inhalt einer aufgezeichneten Sitzung an."
echo "asciinema edit 'name'         Bearbeitet eine vorhandene Aufzeichnung."
echo "asciinema rm 'name'           Löscht eine lokale Aufzeichnung."

exit 0
