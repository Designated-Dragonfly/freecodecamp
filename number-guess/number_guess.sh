#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
SECRET_NUMBER=$((1 + $RANDOM % 1000))

echo "Enter your username:"

read USERNAME

USER_SEARCH_RESULT=$($PSQL "SELECT * FROM number_guess WHERE username='$USERNAME'")

if [[ -z $USER_SEARCH_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USER_RESULT=$($PSQL "INSERT INTO number_guess(username) VALUES ('$USERNAME')")
  GAMES_PLAYED=0
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

read USER_GUESS

GUESSES_NUMBER=1

while [[ $USER_GUESS -ne $SECRET_NUMBER ]]; do

  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read  USER_GUESS 
  else
    if [[ $USER_GUESS > $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read USER_GUESS
      ((GUESSES_NUMBER++))
    else
      echo "It's higher than that, guess again:"
      read USER_GUESS
      ((GUESSES_NUMBER++))
    fi
  fi
done

((GAMES_PLAYED++))
echo "You guessed it in $GUESSES_NUMBER tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ $GAMES_PLAYED -eq 1 ]]
then
  UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED, best_game=$GUESSES_NUMBER WHERE username='$USERNAME'")
else
  if [[ $GUESSES_NUMBER < $BEST_GAME ]]
  then
    UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED, best_game=$GUESSES_NUMBER WHERE username='$USERNAME'")
  else
    UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
  fi
fi