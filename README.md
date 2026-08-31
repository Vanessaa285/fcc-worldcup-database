# World Cup Database

Dieses Projekt ist Teil der **freeCodeCamp Zertifizierung für relationale Datenbanken**. Es zeigt, wie man eine relationale Datenbank mit PostgreSQL von Grund auf aufbaut und den Import sowie die Abfrage von Daten mithilfe von Bash-Skripten automatisiert.

## Verwendete Technologien
* **PostgreSQL:** Datenbankerstellung, Tabellendesign (Primär- und Fremdschlüssel, Constraints) und komplexe Abfragen (JOINs, UNIONs, Aggregatfunktionen).
* **Bash / Shell Scripting:** Zeilenweises Auslesen einer CSV-Datei und direkte Interaktion mit der Datenbank über das Terminal.
* **Linux-Kommandozeile:** Verwalten von Dateiberechtigungen und Ausführen von Skripten.

## Projektübersicht
* **`insert_data.sh`:** Ein Bash-Skript, das die Rohdaten aus der `games.csv` einliest und automatisch 24 einzigartige Teams sowie 32 Spielergebnisse in die Datenbank einfügt, ohne dass es zu Duplikaten kommt.
* **`queries.sh`:** Ein Bash-Skript, das fortgeschrittene SQL-Befehle nutzt, um gezielte Statistiken und Teaminformationen aus den verknüpften Tabellen der Datenbank zu extrahieren.

## Lokale Installation & Nutzung

Um dieses Projekt auf deinem eigenen Rechner zum Laufen zu bringen, benötigst du ein Terminal (Bash) und eine lokal installierte **PostgreSQL**-Datenbank.

### 1. Repository klonen
```bash
git clone https://github.com/VanessaPoehl/fcc-worldcup-database
cd fcc-worldcup-database
```

### 2. Datenbank wiederherstellen
Nutze die bereitgestellte `.sql`-Datei, um die Datenbankstruktur samt Daten zu laden.

**Linux / macOS / Git Bash:**
Im Idealfall hast du den Pfad zu PostgreSQL in deinen System-Umgebungsvariablen hinterlegt. Dann funktioniert dieser Standardbefehl:
```bash
psql -U postgres -f worldcup.sql
```

**Windows (PowerShell):**
Falls `psql` nicht direkt gefunden wird, nutze den absoluten Pfad zur PostgreSQL-Installation (passe die Versionsnummer – z. B. 15, 16, 17 oder 18 – entsprechend an):
```powershell
& "C:\Program Files\PostgreSQL\<DEINE_VERSION>\bin\psql.exe" -U postgres -f worldcup.sql
```

### 3. Skripte ausführen
Mache die Skripte zunächst ausführbar. Führe (optional) zuerst das Import-Skript aus, falls du die CSV-Daten neu einlesen willst. Nutze danach das Abfrage-Skript, um die Statistiken auszugeben.

**Unter Linux / macOS / Git Bash:**
```bash
chmod +x insert_data.sh queries.sh
./insert_data.sh
./queries.sh
```

---

## Troubleshooting für lokale Setups (Windows)

**1. Das Skript fragt ununterbrochen nach dem Datenbank-Passwort**
Wenn deine lokale PostgreSQL-Installation passwortgeschützt ist, pausiert das Skript bei jeder Schleife, um nach dem Passwort zu fragen.
*Lösung:* Speichere das Passwort temporär für deine aktuelle Terminal-Sitzung. Führe dazu (z.B. in der Git Bash) aus:
```bash
export PGPASSWORD="dein_passwort"
