# World Cup Database

Dieses Projekt ist Teil der **freeCodeCamp Zertifizierung für relationale Datenbanken**. Es zeigt, wie man eine relationale Datenbank mit PostgreSQL von Grund auf aufbaut und den Import sowie die Abfrage von Daten mithilfe von Bash-Skripten automatisiert.

## Verwendete Technologien
* **PostgreSQL:** Datenbankerstellung, Tabellendesign (Primär- und Fremdschlüssel, Constraints) und komplexe Abfragen (JOINs, UNIONs, Aggregatfunktionen).
* **Bash / Shell Scripting:** Zeilenweises Auslesen einer CSV-Datei und direkte Interaktion mit der Datenbank über das Terminal.
* **Linux-Kommandozeile:** Verwalten von Dateiberechtigungen und Ausführen von Skripten.

## Projektübersicht
* **`insert_data.sh`:** Ein Bash-Skript, das die Rohdaten aus der `games.csv` einliest und automatisch 24 einzigartige Teams sowie 32 Spielergebnisse in die Datenbank einfügt, ohne dass es zu Duplikaten kommt.
* **`queries.sh`:** Ein Bash-Skript, das fortgeschrittene SQL-Befehle nutzt, um gezielte Statistiken und Teaminformationen aus den verknüpften Tabellen der Datenbank zu extrahieren.

## Wie man das Projekt lokal ausführt

Um dieses Projekt auf deinem eigenen Rechner zum Laufen zu bringen, benötigst du eine installierte Version von PostgreSQL und ein Bash-Terminal.

**1. Datenbank wiederherstellen:**
Nutze die bereitgestellte `.sql`-Datei, um die Datenbankstruktur samt Daten zu laden:
\`\`\`bash
psql -U postgres < worldcup.sql
\`\`\`

**2. Skripte ausführbar machen:**
Gib den Bash-Skripten die nötigen Rechte, damit sie im Terminal ausgeführt werden können:
\`\`\`bash
chmod +x insert_data.sh
chmod +x queries.sh
\`\`\`

**3. Skripte testen:**
(Optional) Falls du die Datenbank vorher leeren und die CSV-Daten neu importieren möchtest, führe das Import-Skript aus:
\`\`\`bash
./insert_data.sh
\`\`\`
Um die SQL-Abfragen zu starten und die Ergebnisse zu sehen, führe das Abfrage-Skript aus:
\`\`\`bash
./queries.sh
\`\`\`
