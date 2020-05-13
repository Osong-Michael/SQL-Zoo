/* 1 */
 SELECT
    count(name)
FROM
    stops
    
/* 2 */
SELECT id
FROM stops
WHERE name = 'Craiglockhart'

/* 3 */
SELECT id, name
FROM stops JOIN route ON id = route.stop
WHERE route.num = '4' AND route.company = 'LRT'


/* 4 */
SELECT company, num, COUNT(*) 'stops' 
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING stops > 1

/* 5 */
SELECT a.company, a.num, a.stop AS stop_A, b.stop AS stop_B
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

/* 6 */
SELECT a.company, a.num, stopa.name AS name_A, stopb.name AS name_B
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE LOWER(stopa.name)='Craiglockhart' AND LOWER(stopb.name) = 'london road'

/* 7 */
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop = 137 OR b.stop=115 AND b.stop = 137

/* 8 */
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops aas on aas.id = a.stop
JOIN stops bs on bs.id = b.stop
WHERE (aas.name = 'Craiglockhart' AND bs.name = 'Tollcross') or
(bs.name = 'Craiglockhart' AND aas.name = 'Tollcross')

/* 9 */
SELECT s2.name, r1.company, r1.num
FROM route r1 
JOIN route r2 ON (r1.company=r2.company AND r1.num=r2.num)
JOIN stops s1 ON (r1.stop = s1.id)
JOIN stops s2 ON (r2.stop = s2.id)
WHERE LOWER(s1.name) = 'craiglockhart'

/* 10 */
SELECT DISTINCT S.num, S.company, stops.name, E.num, E.company
    FROM
        (SELECT a.company, a.num, b.stop
        FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
        WHERE a.stop=(SELECT id FROM stops WHERE name= 'Craiglockhart')
        ) AS S
    JOIN
        (SELECT a.company, a.num, b.stop
        FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
        WHERE a.stop=(SELECT id FROM stops WHERE name= 'Lochend')
        ) AS E
    ON (S.stop = E.stop)
    JOIN stops ON(stops.id = S.stop)
    ORDER BY S.num, stops.name, E.num
