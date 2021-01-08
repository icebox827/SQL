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

-- More Join answer

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id
FROM actor
WHERE name = 'Glenn Close';

SELECT id
FROM movie
WHERE title = 'Casablanca';

SELECT name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE movieid = 11768;

SELECT name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE title = 'Alien';

SELECT title
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE name = 'Harrison Ford' AND ord != 1;

SELECT name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE title = 'Alien';

SELECT title, name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE yr = 1962 AND ord = 1;

SELECT yr, COUNT(title)
FROM
    movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT title, name
FROM movie JOIN casting ON (movie.id=movieid AND ord = 1)
    JOIN actor ON actorid=actor.id
WHERE movieid  IN (
SELECT movieid
FROM casting
WHERE actorid IN (
  SELECT id
FROM actor
WHERE name='Julie Andrews'));

SELECT name
FROM actor JOIN casting ON (actor.id = actorid AND ord = 1)
GROUP BY name
HAVING COUNT(name) > 14
ORDER BY name;

SELECT title, COUNT(name)
FROM movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC, title

SELECT name
FROM movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE title IN (SELECT title
    FROM movie JOIN casting ON movie.id=movieid
        JOIN actor ON actorid=actor.id
    WHERE name =  'Art Garfunkel') AND name != 'Art Garfunkel'