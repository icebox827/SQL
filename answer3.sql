-- More join quiz

SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

SELECT *
  FROM actor JOIN casting ON actor.id = actorid
   JOIN movie ON movie.id = movieid

SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget