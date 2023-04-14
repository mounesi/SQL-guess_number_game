#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
# sample
## SELECT * FROM user_info FULL JOIN game_info USING(user_id);
## user_id | username | game_id | secret_number | guesses 

NUMBER=$((1 + $RANDOM % 1000))
echo $NUMBER

echo -e "Enter your username:"
read USERNAME

function display_user_info {
  local user_name=$1
  local games_played=$2
  local best_game=$3

  echo "Welcome back, $user_name! You have played $games_played games, and your best game took $best_game guesses."
}

# run the username against the database