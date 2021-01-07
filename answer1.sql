SELECT winner, yr, subject
FROM nobel
  WHERE winner LIKE 'Sir%'

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
CASE WHEN
subject IN ('Physics','Chemistry')
THEN 1 ELSE 0 END,
subject, winner;

/* nobel Quiz */

SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

/* Select tutorials */

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name
FROM world
  WHERE continent = 'Europe' 
    AND gdp/population > (SELECT gdp/population FROM world
WHERE name = 'United Kingdom')

SELECT name, continent
FROM world
WHERE continent =
     (SELECT continent
    FROM world
    WHERE name = 'Argentina')
    OR continent =
     (SELECT continent
    FROM world
    WHERE name = 'Australia')
ORDER BY name;

SELECT name, population
FROM world
WHERE population >
     (SELECT population
    FROM world
    WHERE name = 'Canada')
    AND population <
     (SELECT population
    FROM world
    WHERE name = 'Poland');

SELECT name , CONCAT(ROUND((population/(SELECT population
    FROM world
    WHERE name = 'germany')) * 100, 0), '%') AS percentage
FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
where gdp > (SELECT MAX(gdp)
FROM world
where continent = 'Europe');

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
FROM world y
WHERE y.continent=x.continent
    AND area>0);

SELECT continent, name
FROM world x
WHERE name = 
    (SELECT name
FROM world y
WHERE y.continent=x.continent
ORDER BY name
           LIMIT 1);

SELECT name
, continent,  population FROM world x
  WHERE 25000000>= ALL
(SELECT population
FROM world y
WHERE y.continent=x.continent);

SELECT name, continent
FROM world x
WHERE population/3 > ALL
    (SELECT population
FROM world y
WHERE y.continent = x.continent
    AND y.population <> x.population
    AND population>0);
