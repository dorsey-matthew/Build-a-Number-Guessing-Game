#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
secret=$(($RANDOM % 1000 + 1))
echo "Enter your username:"
read username
old_user=$($PSQL "select username from users where username=$username")
if [[ -z $old_user ]]
then
new_user=$($PSQL "insert into users (username) values('$username')")
echo "Welcome, $username! It looks like this is your first time here."


else
games_played=$($PSQL "select count(*) from games inner join using(user_id) where user_id=$username"
best_game=$($PSQL "select min(number_of_guesses) from games inner join using(user_id) where user_id=$username"
echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."

fi




echo "Guess the secret number between 1 and 1000"
read guess
attempts=1
while [ ! $guess -eq $secret ]
do
attempts=$attempts+1
if [[ ! $guess =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
read guess
else
if [[ guess -gt $secret ]]
then
echo "It's higher than that, guess again:"
read guess
elif [[ guess -lt $secret ]]
then
echo "It's lower than that, guess again:"
read guess
fi
fi
done
echo "You guessed it in $attempts tries. The secret number was $secret. Nice job!"