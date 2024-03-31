#!/bin/bash
# Script Name:  asciinema-client-installer.v1.sh
# Beschreibung: Installiert die asciinema Software Clientseitig und konfiguriert die Bash-Umgebung
#               unterstützte Bash: /bin/bash & /bin/zsh
# Aufruf:       ./asciinema-client-installer.v1.sh
# Autor:        Patrick Asmus
# Web:          https://www.techniverse.net
# Git-Reposit.: https://git.techniverse.net/scriptos/asciinema.git
# Version:      1.2
# Datum:        31.03.2024
# Modifikation: Umstellung auf neue Domain
#####################################################

ASCIINEMA_API_URL="https://asciinema.techniverse.net"

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
