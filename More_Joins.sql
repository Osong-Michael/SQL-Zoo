/* 1 */
SELECT id, title
FROM movie
WHERE yr=1962

/* 2 */
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

/* 3 */
SELECT id, title, yr
FROM movie
WHERE  title LIKE '%Star Trek%'

/* 4 */
SELECT id
FROM actor
WHERE name = 'Glenn Close'

/* 5 */
SELECT id
FROM movie
WHERE title = 'Casablanca'

/* 6 */
SELECT name
FROM actor JOIN casting ON id = casting.actorid JOIN movie ON movieid = movie.id
WHERE title = 'Casablanca'

/* 7 */
SELECT name
FROM actor
    JOIN casting ON id = casting.actorid
    JOIN movie ON movieid = movie.id
WHERE title = 'Alien'

/* 8 */
SELECT title
FROM movie
    JOIN casting ON id = casting.movieid
    JOIN actor ON actorid = actor.id
WHERE name = 'Harrison Ford'

/* 9 */
SELECT title
FROM movie
    JOIN casting ON id = casting.movieid
    JOIN actor ON actorid = actor.id
WHERE name = 'Harrison Ford' AND casting.ord <> 1

/* 10 */
SELECT title, name
FROM movie JOIN casting ON id = casting.movieid JOIN actor ON actorid = actor.id
WHERE ord = 1 AND yr = 1962

/* 11 */
SELECT yr, COUNT(title)
FROM
    movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

/* 12 */
SELECT title, name
FROM movie
    JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE movie.id IN (SELECT casting.movieid
    FROM casting
    WHERE actorid = (SELECT id
    FROM actor
    WHERE name = 'Julie Andrews')) AND ord = 1

/* 13 */
SELECT name
FROM actor JOIN casting ON id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(name) >= 15
ORDER BY name

/* 14 */
SELECT title, COUNT(name)
FROM movie JOIN casting ON id = casting.movieid JOIN actor ON actorid = actor.id
WHERE  movie.yr = 1978
GROUP BY title
ORDER BY COUNT(actor.name) DESC, movie.title

/* 15 */
SELECT name
FROM actor
    JOIN casting ON id = casting.actorid
WHERE movieid IN
(SELECT movieid
    FROM casting
    WHERE actorid =
(SELECT id
    FROM actor
    WHERE name = 'Art Garfunkel')) AND name <> 'Art Garfunkel'
ORDER BY name
