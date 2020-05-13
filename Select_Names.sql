/* You can use WHERE name LIKE 'B%' to find the countries that start with "B".
The % is a wild-card it can match any characters
Find the country that start with Y */

SELECT name FROM world
  WHERE name LIKE 'Y%'

  /* Find the countries that end with y */

  SELECT name FROM world
  WHERE name LIKE '%Y'

  /* Luxembourg has an x - so does one other country. List them both. */

  SELECT name FROM world
  WHERE name LIKE '%x%'

  /* Iceland, Switzerland end with land - but are there others? */

  SELECT name FROM world
  WHERE name LIKE '%land'

  /* Columbia starts with a C and ends with ia - there are two more like this. */

  SELECT name FROM world
  WHERE name LIKE 'C%ia'

  /* Greece has a double e - who has a double o? */

  SELECT name FROM world
  WHERE name LIKE '%oo%'

  /* Bahamas has three a - who else? */

  SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  /* India and Angola have an n as the second character. You can use the underscore as a single character wildcard. */

  SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

/* Lesotho and Moldova both have two o characters separated by two other characters.*/

SELECT name FROM world
 WHERE name LIKE '%o__o%'

 /* Cuba and Togo have four characters names. */

 SELECT name FROM world
 WHERE LENGTH(name) = 4

 /* The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country
Find the country where the name is the capital city. */

SELECT name
  FROM world
 WHERE name = capital

 /* The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".
Find the country where the capital is the country plus "City". */

SELECT name
  FROM world
 WHERE capital = concat(name, " City")

 /* Find the capital and the name where the capital includes the name of the country.
*/

SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%')

/* Find the capital and the name where the capital is an extension of name of the country.
You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country. */

SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%')  AND capital NOT LIKE name

/* For Monaco-Ville the name is Monaco and the extension is -Ville.
Show the name and the extension where the capital is an extension of name of the country.
You can use the SQL function REPLACE. */

SELECT name, REPLACE(capital, name, '') FROM world WHERE capital LIKE concat(name, '%') AND capital NOT LIKE name
