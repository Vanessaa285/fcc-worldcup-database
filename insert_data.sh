#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Tabellen bei jedem Neustart leeren
echo $($PSQL "TRUNCATE TABLE games, teams")

# CSV-Datei einlesen
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Überschrift überspringen
  if [[ $WINNER != "winner" ]]
  then
    
    # ==========================================
    # 1. TEAMS EINFÜGEN (Dein vorheriger Code)
    # ==========================================
    
    # Gewinner prüfen und ggf. einfügen
    TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID_W ]]
    then
      INSERT_TEAM_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi

    # Verlierer prüfen und ggf. einfügen
    TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID_O ]]
    then
      INSERT_TEAM_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi


    # ==========================================
    # 2. SPIELE (GAMES) EINFÜGEN (Der neue Teil)
    # ==========================================
    
    # Da wir oben Teams neu eingefügt haben, müssen wir uns jetzt 
    # die endgültigen, korrekten IDs aus der Datenbank holen:
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # Jetzt haben wir alle Variablen zusammen und fügen das Spiel in die games-Tabelle ein
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    
    # Optional: Ausgabe für das Terminal
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Spiel hinzugefügt: $YEAR $ROUND - $WINNER vs $OPPONENT"
    fi

  fi
done