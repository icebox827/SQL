/* Aggregate Quiz */

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

SELECT COUNT(name) FROM bbc WHERE population < 150000

-- JOIN answers 

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
    WHERE id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
    WHERE teamid = 'GER'

SELECT team1, team2, player 
  FROM game JOIN goal ON (id=matchid)
    WHERE player like 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (id=teamid)
WHERE gtime<=10;

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos' ;

SELECT player
FROM game JOIN goal ON (id=matchid)
WHERE stadium =  'National Stadium, Warsaw';

SELECT DISTINCT(player)
FROM game JOIN goal ON matchid = id
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER';

SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname;

SELECT stadium, COUNT(player)
FROM game JOIN goal ON id=matchid
GROUP BY stadium
ORDER BY stadium;

SELECT stadium, COUNT(player)
FROM game JOIN goal ON id=matchid
GROUP BY stadium
ORDER BY stadium;

-- Join Quiz

SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

SELECT DISTINCT player, teamid 
FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'

SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

