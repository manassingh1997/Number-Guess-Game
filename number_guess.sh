#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_NUMBER() {
  echo Guess the secret number between 1 and 1000:
  COUNT=0
  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
  while true; do
    read GUESSED
    ((COUNT++))
    if [[ $GUESSED =~ ^[0-9]+$ ]]
    then
      if [[ $GUESSED -eq $SECRET_NUMBER ]]; then
        echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
      elif [[ $GUESSED -lt $SECRET_NUMBER ]]; then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
    else
      echo That is not an integer, guess again:
    fi
  done

  UPDATE_DATA=$($PSQL "INSERT INTO games(playerid, score) VALUES($1, $COUNT)")
}

echo Enter your username:
read USERNAME

PLAYER_ID=$($PSQL "SELECT playerid  FROM players WHERE playername = '$USERNAME';")

if [[ -z $PLAYER_ID ]] 
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  CREATE_USER=$($PSQL "INSERT INTO players(playername) VALUES('$USERNAME')")
  PLAYER_ID=$($PSQL "SELECT playerid FROM players WHERE playername = '$USERNAME'")
  GUESS_NUMBER $PLAYER_ID
else
  GAME_DATA=$($PSQL "SELECT COUNT(gameid), MIN(score) FROM games WHERE playerid = $PLAYER_ID;")
  IFS="|" read NO_OF_GAMES BEST_SCORE <<< "$GAME_DATA"
  echo Welcome back, $USERNAME! You have played $NO_OF_GAMES games, and your best game took $BEST_SCORE guesses.
  GUESS_NUMBER $PLAYER_ID
fi

