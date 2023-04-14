#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
# sample
## SELECT * FROM user_info FULL JOIN game_info USING(user_id);
## user_id | username | game_id | secret_number | guesses 

SECRET_NUMBER=$((1 + $RANDOM % 1000))
echo $SECRET_NUMBER

function get_username {
  echo -e "Enter your username:"
  read USERNAME
}

get_username

function display_user_info {
  local user_name=$1
  local games_played=$2
  local best_game=$3

  echo "Welcome back, $user_name! You have played $games_played games, and your best game took $best_game guesses."
}

# run the username against the database
RESULT_USERNAME=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME'")

echo $RESULT_USERNAME
# if the result username is not empty then
if [ ! -z "$RESULT_USERNAME" ];
then
  USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME'")
  echo $UESR_ID
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM game_info WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM game_info WHERE user_id = $USER_ID")


  display_user_info $USERNAME $GAMES_PLAYED $BEST_GAME
else
  # Welcome username! message
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_USER_RESULT=$($PSQL "INSERT INTO user_info(username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME'")
fi

GUESSES_TRIES=0
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS_NUMBER

  if [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]; then
    GUESSES_TRIES=$((GUESSES_TRIES + 1))

    if [ $GUESS_NUMBER -gt $SECRET_NUMBER ]; then
      echo "It's lower than that, guess again:"
    elif [ $GUESS_NUMBER -lt $SECRET_NUMBER ]; then
      echo "It's higher than that, guess again:"
    else
      echo -e "You guessed it in $GUESSES_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done

INSERT_NEW_GAME_RESULT=$($PSQL "INSERT INTO game_info (user_id, secret_number, guesses) VALUES ($USER_ID, $SECRET_NUMBER, $GUESSES_TRIES)")
