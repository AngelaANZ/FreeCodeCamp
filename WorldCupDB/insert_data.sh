#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get team id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams where name = '$WINNER'")
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams where name = '$OPPONENT'")
    
    # if winner not found
    if [[ -z $WINNER_TEAM_ID ]]
    then
      # insert winner team
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      # get winner team id
      WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams where name = '$WINNER'")

      echo "Inserted winner $WINNER id $WINNER_TEAM_ID"

    fi

    # if opponent not found
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert opponent team
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      # get opponent team id
      OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams where name = '$OPPONENT'")

      echo "Inserted opponent $OPPONENT id $OPPONENT_TEAM_ID"

    fi

  # insert game
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  fi
done
