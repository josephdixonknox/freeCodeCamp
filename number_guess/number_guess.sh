#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

# generate random number
NUMBER=$(( RANDOM % 1000 + 1 ))
echo TEST: the random number is $NUMBER

# prompt user for username
echo Enter your username:
read USERNAME

# check if username already exists
USERNAME_CHECK=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
if [[ -z $USERNAME_CHECK ]] # if no
then
  # add new user
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # print message
  echo Welcome, $USERNAME! It looks like this is your first time here.
else # if yes
  # get info about user
  USER_DETAILS=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
  # print message
  echo "$USER_DETAILS" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  done
fi

# set counter for attempts
ATTEMPTS=1

# ask for secret number
echo Guess the secret number between 1 and 1000:
# read guess
read GUESS

# start loop, break when guess=NUMBER
while [[ "$GUESS" -ne "$NUMBER" ]]
do 
  if [[ "$GUESS" =~ ^[0-9]+$ ]] # check that GUESS is a number
  then # if GUESS is a number
    if [[ "$GUESS" -gt "$NUMBER" ]] # if GUESS is larger
    then
      echo It\'s lower than that, guess again:
      read GUESS
    elif [[ "$GUESS" -lt "$NUMBER" ]] # if GUESS is smaller
    then
      echo It\'s higher than that, guess again:
      read GUESS
    fi
  else # if GUESS is not a number
    echo That is not an integer, guess again:
    read GUESS
  fi
  ATTEMPTS=$((ATTEMPTS+1))
done

# print victory message
echo You guessed it in $ATTEMPTS tries. The secret number was $NUMBER. Nice job!

# get best_game
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

# update best_game
if [[ "$ATTEMPTS" -lt "$BEST_GAME" ]] # if new best_game
then
  # set new best_game
  UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$ATTEMPTS WHERE username='$USERNAME'")
fi

# increment games_played
UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME'")