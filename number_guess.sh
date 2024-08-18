#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read username
old_user=$($PSQL "select username from users where username='$username'")
if [[ -z $old_user ]]
then
echo "Welcome, $username! It looks like this is your first time here."
new_user=$($PSQL "insert into users (username,games_played) values('$username',0)")
else
games_played=$($PSQL "select games_played from users where username='$username'")
best_game=$($PSQL "select best_game from users from users where username='$username'")
echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi
secret=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000"
guess=0
while read guess
do
if [[ ! $guess =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
else
((guess++))
if [[ $guess -eq $secret ]]
then
echo "You guessed it in $guess tries. The secret number was $secret. Nice job!"
break
elif [[ $guess -lt $secret ]]
then
echo "It's higher than that, guess again:"
else
echo "It's lower than that, guess again:"
fi
fi
done
if [[ -z $old_user ]]
then
update=$($PSQL "update users set games_played = 1,best_game=$guess where username='$username'")
else
update=$($PSQL "update users set games_played = games+played + 1 where username='$username'")
if [[ $guess -lt $best_game || -z $best_game ]]
then
update=$($PSQL "update users set best_game = $guess where username='$username'")
fi
fi