#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# ask for username
echo "Enter your username:"
read USERNAME

# get user id 
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# if username doesn't exist
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  # insert new user
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # get new user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

else
  # get existing user's game info
  GAMES_INFO=$($PSQL "SELECT COUNT(*), MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID")
  echo "$GAMES_INFO" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# generate a random secret between 1 and 1000
SECRET_NUMBER=$(( RANDOM %1000 + 1 ))

# guess the secret number
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1

until [[ $GUESS -eq $SECRET_NUMBER ]]
do
  # if guess is not numeric
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  # if guess > secret
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read GUESS
  else
  # if guess < secret
    echo -e "\nIt's higher than that, guess again:"
    read GUESS
  fi
  # increment number of guesses
  ((NUMBER_OF_GUESSES++))
done

# insert game
INSERT_GAME=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES('$NUMBER_OF_GUESSES', $USER_ID)")

# end this game
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
