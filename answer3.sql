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

-- Usin null answer

SELECT name
FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)


SELECT name, COALESCE(mobile, '07986 444 2266') as mobile
FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
    ON (teacher.dept=dept.id);

SELECT COUNT(name) as Teachers, COUNT(mobile) as Numbers
FROM teacher;

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
    ON (teacher.dept=dept.id)
GROUP BY dept.name;

SELECT name,
    CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' 
    ELSE 'Art' END
FROM teacher;

SELECT name,
    CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' 
    WHEN dept = 3 THEN 'Art' 
    ELSE 'None' END
FROM teacher;