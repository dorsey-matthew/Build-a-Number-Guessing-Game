#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read username
old_user=$($PSQL "select username from users where username=$username")
if [[ -z $old_user ]]
then
new_user=$($PSQL "insert into users (username) values('$username')")
else
games_played=$($PSQL "select count(*) from games inner join using(user_id) where user_id=$username"
best_game=$($PSQL "select min(number_of_guesses) from games inner join using(user_id) where user_id=$username"
echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
echo $(($RANDOM % 1000 + 1))
