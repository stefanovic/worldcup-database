#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo

echo -e "\nAverage number of goals in all games from the winning teams:"
echo

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo

echo -e "\nAverage number of goals in all games from both teams:"
echo

echo -e "\nMost goals scored in a single game by one team:"
echo

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo

echo -e "\nWinner of the 2018 tournament team name:"
echo

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo

echo -e "\nList of unique winning team names in the whole data set:"
echo

echo -e "\nYear and team name of all the champions:"
echo

echo -e "\nList of teams that start with 'Co':"
echo

#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

# 1. Total number of goals in all games from winning teams
echo $($PSQL "SELECT SUM(winner_goals) FROM games")

# 2. Total number of goals in all games from both teams combined
echo $($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games")

# 3. Average number of goals in all games from the winning teams
echo $($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")

# 4. Average number of goals in all games from both teams
echo $($PSQL "SELECT ROUND(AVG(winner_goals + opponent_goals), 2) FROM games")

# 5. Most goals scored in a single game by one team
echo $($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games")

# 6. Number of games where the winning team scored more than two goals
echo $($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")

# 7. Winner of the 2018 tournament team name
echo $($PSQL "
  SELECT t.name
  FROM games g
  JOIN teams t ON g.winner_id = t.team_id
  WHERE g.round = 'Final' AND g.year = 2018
")

# 8. List of teams who played in the 2014 'Eighth-Final' round
echo $($PSQL "
  SELECT DISTINCT t.name
  FROM games g
  JOIN teams t ON t.team_id = g.winner_id OR t.team_id = g.opponent_id
  WHERE g.round = 'Eighth-Final' AND g.year = 2014
  ORDER BY t.name
")

# 9. List of unique winning team names in the whole data set
echo $($PSQL "SELECT DISTINCT t.name FROM games g JOIN teams t ON g.winner_id = t.team_id ORDER BY t.name")

# 10. Year and team name of all the champions
echo $($PSQL "
  SELECT g.year, t.name
  FROM games g
  JOIN teams t ON g.winner_id = t.team_id
  WHERE g.round = 'Final'
  ORDER BY g.year
")

# 11. List of teams that start with 'Co'
echo $($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ORDER BY name")
