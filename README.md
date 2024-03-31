# asciinema

Ich biete hier eine Docker-Server installation und ein Script für eine Clientseitige Installation an




## asciinema Server

Zur komfortablen Bereitstellung des asciinema Servers stelle ich euch eine speziell vorbereitete Docker-Kompositionsdatei zur Verfügung. Diese `docker-compose.yaml` beinhaltet präzise definierte Einstellungen und Umgebungsvariablen, um den asciinema Server als Container-Dienst einzurichten.


1. **Download und Vorbereitung**: Ladet die `docker-compose.yaml`-Datei herunter und speichert sie in einem passenden Verzeichnis auf eurem Server.

2. **Erzeugung eines Secret-Keys**: Generiert einen sicheren Schlüssel für eure Installation mit folgendem Befehl:
`tr -dc A-Za-z0-9 </dev/urandom | head -c 64; echo`

3. **Anpassung der Konfigurationsdatei**: Öffnet die `docker-compose.yaml` und ersetzt den Platzhalter bei `SECRET_KEY_BASE` mit dem erzeugten Schlüssel. Passt die weiteren Umgebungsvariablen wie `URL_HOST`, `SMTP_HOST` und so weiter gemäß eurer Infrastruktur an.

4. **Deployment**: Startet euren asciinema Server mit dem Kommando:
`docker-compose up -d`
Dadurch werden die Docker Container im Hintergrund hochgefahren.


### Hinweise zur Konfiguration:

-   Der Dienst `asciinema-app` wird als Webapplikation konfiguriert, die auf Port `80` eures Hosts und intern auf Port `4000` des Containers lauscht.
-   Die Datenbankverbindung für `asciinema-app` erfolgt über einen separaten Postgres-Container, genannt `asciinema-db`.
-   Netzwerkeinstellungen innerhalb des `dockernet` sorgen für eine abgeschottete und sichere Kommunikation zwischen den Services.
-   Ich verwende Diesen Docker hinter einem eigenen ReverseProxy. Das bedeutet, diese Konfiguration ist für den Betrieb hinter einem ReverseProxy konfiguriert




## asciinema Client

Der Client Installer ist relativ einfach gehalten.
Das Script wird mit `bash asciinema-client-installer.v1.sh` ausgeführt und dann passiert folgendes:


1.  **Installation von asciinema**: Das Skript aktualisiert zuerst die Paketlisten des Systems mit `sudo apt update` und installiert dann asciinema über `sudo apt install asciinema -y`.
    
2.  **Erkennung der Shell-Konfigurationsdatei**: Es wird geprüft, ob eine `.zshrc`-Datei (für oh-my-zsh) im Root-Verzeichnis existiert. Falls ja, wird diese als Konfigurationsdatei (`CONFIG_FILE`) verwendet, ansonsten wird `.bashrc` verwendet.
    
3.  **Konfiguration der Umgebungsvariablen**: Das Skript fügt der erkannten Konfigurationsdatei die Umgebungsvariable `ASCIINEMA_API_URL` hinzu, wobei die URL standardmäßig auf `https://asciinema.techniverse.net` gesetzt wird. Diese Einstellung ist spezifisch für eure API.
    
4.  **Informationen für den Benutzer**: Nach der Konfiguration zeigt das Skript eine Nachricht an, die den Benutzer auffordert, das Terminal neu zu starten, um die Änderungen zu übernehmen.
    
5.  **Nützliche asciinema-Befehle**: Zum Abschluss listet das Skript verschiedene asciinema-Befehle auf, die nach der Installation verwendet werden können, wie `asciinema auth`, `asciinema rec`, `asciinema upload` und weitere, zur Aufnahme, Bearbeitung, Wiedergabe und Verwaltung von Terminal-Sitzungen.
