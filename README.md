# World Cup Database ⚽

Dieses Projekt ist Teil der **freeCodeCamp Zertifizierung für relationale Datenbanken**. Es zeigt, wie man eine relationale Datenbank mit PostgreSQL von Grund auf aufbaut und den Import sowie die Abfrage von Daten mithilfe von Bash-Skripten automatisiert.

## Verwendete Technologien
* **PostgreSQL:** Datenbankerstellung, Tabellendesign (Primär- und Fremdschlüssel, Constraints) und komplexe Abfragen (JOINs, UNIONs, Aggregatfunktionen).
* **Bash / Shell Scripting:** Zeilenweises Auslesen einer CSV-Datei und direkte Interaktion mit der Datenbank über das Terminal.
* **Linux-Kommandozeile:** Verwalten von Dateiberechtigungen und Ausführen von Skripten.

## Projektübersicht
* **`insert_data.sh`:** Ein Bash-Skript, das die Rohdaten aus der `games.csv` einliest und automatisch 24 einzigartige Teams sowie 32 Spielergebnisse in die Datenbank einfügt, ohne dass es zu Duplikaten kommt.
* **`queries.sh`:** Ein Bash-Skript, das fortgeschrittene SQL-Befehle nutzt, um gezielte Statistiken und Teaminformationen aus den verknüpften Tabellen der Datenbank zu extrahieren.
