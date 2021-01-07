/* Aggregate Quiz */

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

SELECT COUNT(name) FROM bbc WHERE population < 150000