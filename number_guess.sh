#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
else
  TIMES=$($PSQL "SELECT times FROM games WHERE user_id = "$USER_ID"")
  COUNT=$($PSQL "SELECT count(*) from games WHERE user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $COUNT games, and your best game took $TIMES guesses."
fi
echo "Guess the secret number between 1 and 1000:"
GUESS=$(( RANDOM % 1000 + 1 ))
BEST=0
while read NUM
do
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
  (( BEST++ ))
  if [[ $NUM -gt $GUESS ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $NUM -lt $GUESS ]]
  then
    echo "It's higher than that, guess again:"
  else
    INSERT_GAMES=$($PSQL "INSERT INTO games(user_id, times) VALUES($USER_ID, $BEST)")
    echo "You guessed it in $BEST tries. The secret number was $NUM. Nice job!"
    break
  fi
done
