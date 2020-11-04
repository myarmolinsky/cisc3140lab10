-- 0.1
SELECT population FROM world -- select the population column from the table world
  WHERE name = 'Germany' -- where name is equal to "Germany"

-- 0.2
SELECT name, population FROM world -- select the name and population columns from the table world
  WHERE name IN ('Sweden', 'Norway', 'Denmark'); -- where name matches one of the given names ("Sweden", "Norway", "Denmark")

-- 0.3
SELECT name, area FROM world -- select the name and area columns from the table world
  WHERE area BETWEEN 200000 AND 250000 -- where the area is between 200,000 and 250,000

-- 1.1
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE 'Y%' -- where the name matches the given name (in this case "Y%" (% is a wildcard, meaning that LIKE 'Y%' will look for names that start with the letter Y and anything can follow after it))

-- 1.2
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE '%y' -- where the name matches the given name "%y" (meaning the name can start with anything but it HAS to end with the letter y)

-- 1.3
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE '%x%' -- where the name matches the given name "%x%" (meaning the name must contain the letter x)

-- 1.4
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE '%land' -- where the name ends with "land"

-- 1.5
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE 'C%ia' -- where the name starts with the letter C and ends with "ia"

-- 1.6
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE '%oo%' -- where the name contains "oo"

-- 1.7
SELECT name FROM world -- select the name column from the table world
  WHERE name LIKE '%a%a%a%' -- where the name has at least 3 'a's in it

-- 1.8
SELECT name FROM world -- select the name column from the table world
 WHERE name LIKE '_t%' -- where the second letter of the name is t (while % is a wildcard, _ is a single character wildcard.  In this example, I use it to say the first letter doesn't matter, but the second letter has to be t, I'm not looking for t to be in just any position in the word)
ORDER BY name -- order the results alphabetically by name

-- 1.9
SELECT name FROM world -- select the name column from the table world
 WHERE name LIKE '%o__o%' -- where the name contains two 'o's seperated by exactly 2 letters

-- 1.10
SELECT name FROM world -- select the name column from the table world
 WHERE name LIKE '____' -- where the name contains 4 letters (I used four underscores here)

-- 1.11
SELECT name FROM world -- select the name column from the table world
 WHERE name LIKE capital -- where the name of the country matches its capital

-- 1.12
SELECT name FROM world -- select the name column from the table world
 WHERE capital LIKE concat(name, ' City') -- where the capital is the name of the country followed by " City" (I accomplished this by using concat, which is an sql function into which you pass strings you want to concatenate.  In this case I passed name and " City")

-- 1.13
SELECT capital, name FROM world -- select the capital and name columns from the table world
 WHERE capital LIKE concat('%', name, '%') -- where the capital contains the name of the country

-- 1.14
SELECT capital, name FROM world -- select the capital and name columns from the table world
 WHERE capital LIKE concat(name, '_%') -- where the capital starts with the name of the country and is follwed by an extension of it (I accomplished this by using an underscore before the % to say that there must be at least one character after the country name to avoid cases like Luxembourg)

-- 1.15
SELECT name, REPLACE(capital, name, '') AS ext FROM world -- select the name and capital columns from the table world, except for the capital column, only use the extensions of each capital's name to the country's name and name the column "ext"
 WHERE capital LIKE concat(name, '_%') -- where the capital starts with the name of the country and is followed by an extension of it

-- 2.1
SELECT name, continent, population FROM world -- select the name, continent, and population columns from the table world

-- 2.2
SELECT name FROM world -- select the name column from the table world
WHERE population > 200000000 -- where the population is greater than 200,000,000

-- 2.3
SELECT name, gdp/population AS "per capita GDP" FROM world -- select the name column and show the per capita GDP from the table world 
WHERE population >= 200000000 -- where the country's population is at least 200,000,000

-- 2.4
SELECT name, population/1000000 AS "population in millions" FROM world -- select the name column and show the population in millions from the table world
WHERE continent LIKE 'South America' -- where the country's continent is South America

-- 2.5
SELECT name, population FROM world -- select the name and population columns from the table world
WHERE name IN ('France', 'Germany', 'Italy') -- where the country's name is France, Germany, or Italy

-- 2.6
SELECT name FROM world -- select the name column from the table world
WHERE name LIKE '%United%' -- where the name includes United

-- 2.7
SELECT name, population, area FROM world -- select the name, population, and are columns from the table world
WHERE area > 3000000 OR population > 250000000 -- where the area is greater than 3,000,000 square km or the population is greater than 250,000,000

-- 2.8
SELECT name, population, area FROM world -- select the name, population, and are columns from the table world
WHERE area > 3000000 XOR population > 250000000 -- where the area is greater than 3,000,000 square km or the population is greater than 250,000,000, but not both

-- 2.9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world -- select the name column, population in millions rounded to 2 decimal places, and gdp in billion rounded to 2 decimal places from table world
WHERE continent LIKE 'South America' -- where the country's continent is South America

-- 2.10
SELECT name, ROUND(gdp/population, -3) FROM world -- select the name column and per capita gdp rounded to the nearest thousand from the table world
WHERE gdp >= 1000000000000 -- where the country's gdp is at least 3,000,000,000,000

-- 2.11
SELECT name, capital FROM world -- select the name and capital columns from the table world
 WHERE LENGTH(name) = LENGTH(capital) -- where the length of the country's name equals the length of its capital's name

-- 2.12
SELECT name, capital FROM world -- select the name and capital columns from the table world
WHERE LEFT(name, 1) = LEFT(capital, 1) && name <> capital -- where the first letter of the country's name is the same as the first letter of it's capital and the country's name is not the same as its capital's name

-- 2.13
SELECT name FROM world -- select the name column from the table world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' -- where the country's name contains every vowel
  AND name NOT LIKE '% %' -- and the country's name does not contain any spaces

-- 3.1
SELECT yr, subject, winner FROM nobel -- select the yr, subject, and winner columns from the table nobel
 WHERE yr = 1950 -- where the year is 1950

-- 3.2
SELECT winner FROM nobel -- select the winner column from the table nobel
 WHERE yr = 1962 -- where the year is 1962
   AND subject = 'Literature' -- and the subject is Literature

-- 3.3
SELECT yr, subject FROM nobel -- select the yr and subject columns from the table nobel
 WHERE winner = 'Albert Einstein' -- where the winner is Albert Einstein

-- 3.4
SELECT winner FROM nobel -- select the winner column from the table nobel
 WHERE yr >= 2000 AND subject LIKE 'Peace' -- where the year is at least 2000 and the subject is Peace

-- 3.5
SELECT yr, subject, winner FROM nobel -- select the yr, subject, and winner columns from the table nobel
 WHERE yr >= 1980 AND yr <= 1989 AND subject LIKE 'Literature' -- where the year is 1980-1989 inclusive and the subject is Literature

-- 3.6
SELECT * FROM nobel -- select all columns from the table nobel
 WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama') -- where the winner was Theodore Roosevelet, Woodrow Wilson, Jimmy Carter, or Barack Obama

-- 3.7
SELECT winner FROM nobel -- select the winner column from the table nobel
 WHERE winner LIKE ('John_%') -- where the winner's first name was John

-- 3.8
SELECT * FROM nobel -- select all columns from the table nobel
 WHERE (subject LIKE ('Physics') AND yr = 1980) OR (subject LIKE ('Chemistry') AND yr = 1984) -- where the winner won for Physics in 1980 or for Chemistry in 1984

-- 3.9
 SELECT * FROM nobel -- select all columns from the table nobel
 WHERE subject NOT LIKE ('Chemistry') AND subject NOT LIKE ('Medicine') AND yr = 1980 -- where the winner did not win for Chemistry and Medicine in 1980

-- 3.10 
SELECT * FROM nobel -- select all columns from the table nobel
 WHERE (subject LIKE ('Medicine') AND yr < 1910) OR (subject LIKE ('Literature') AND yr >= 2004) -- where the winner won for Medicine before 1910 or the winner won for Literature during or after 2004

-- 3.11
 SELECT * FROM nobel -- select all columns from the table nobel
 WHERE winner LIKE 'Peter Grünberg' -- where the winner's name was Peter Grünberg

-- 3.12
SELECT * FROM nobel -- select all columns from the table nobel
 WHERE winner LIKE 'Eugene O\'Neill' -- where the winner's name is Eugene O'Neill (I used \ as an escape character so that I can ue the ' in his name)

-- 3.13
SELECT winner, yr, subject FROM nobel -- select the winner, yr, and subject columns from the table nobel
 WHERE winner LIKE 'Sir%' -- where the winner's name starts with Sir
ORDER BY yr DESC -- sorted by year in descending order

-- 3.14
SELECT winner, subject FROM nobel -- select the winner and subject columns from the table nobel
 WHERE yr = 1984 -- where the year is 1984
 ORDER BY CASE WHEN subject IN ('Chemistry', 'Physics') THEN 1 ELSE 0 END, subject, winner -- ordered by subject and winner name, with Chemistry and Physics subjects coming last

-- 4.1 
SELECT name FROM world -- select the name column from the table world
  WHERE population > -- where population is greater than
     (SELECT population FROM world -- select the population column from the table world
      WHERE name='Russia') -- where the name of the country is Russia (so where population > Russia's population)

-- 4.2
SELECT name FROM world -- select the name column from the table world
  WHERE continent LIKE 'Europe' AND gdp/population > -- where the continent is Europe and the per capita GDP
     (SELECT gdp/population FROM world -- is greater than the per capita GDP
      WHERE name = 'United Kingdom') -- of the United Kingdom

-- 4.3
SELECT name, continent FROM world -- select the name and continent from the table world
  WHERE continent IN ((SELECT continent FROM world -- where the continent is either the continent in which
      WHERE name = 'Argentina'), (SELECT continent FROM world -- Argentina is located or the continent in which
      WHERE name = 'Australia')) -- Australia is located
ORDER BY name -- order by the country's name

-- 4.4
SELECT name, population FROM world -- select the name and population columns from the table world
  WHERE population > (SELECT population FROM world -- where the population is greater than the population of
      WHERE name = 'Canada') AND population < (SELECT population FROM world -- Canada and the population is less than the population of
      WHERE name = 'Poland') -- Poland

-- 4.5
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany')), '%') AS 'percentage' FROM world -- select the name column and the population of the country  divided by the population of germany as a percentage in a column called percentage from table world
  WHERE continent = 'Europe' -- where the continent the country is in is Europe

-- 4.6
SELECT name FROM world -- select the name column from the table world
  WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0) -- where the gdp is greater than the gdp of all European countries, accounting for null gdps

-- 4.7
SELECT continent, name, area FROM world x -- select the continent, name, and area columns from the table world, lets call this table x
  WHERE area >= ALL -- where the area is greater than or equal to
    (SELECT area FROM world y -- the area of all the countries in the table world, lets call this table y
        WHERE y.continent=x.continent -- where the continent is the same as the continent of the country it's being compared to in the first table
          AND y.area > 0) -- and the area is not null

-- 4.8
SELECT continent, name FROM world x -- select the continent and name columns from the table world, lets call this table x
 WHERE name = (SELECT name FROM world y -- where the country's name is the name from the table world, lets call this table y
WHERE y.continent = x.continent -- where the continent is the same as the continent of the country it's being compared to in the first table
ORDER BY name LIMIT 1) -- ordered by name and limited to 1 result

-- 4.9
SELECT name, continent, population FROM world x -- select the name, continent, and population columns from the table world, lets call this table x
WHERE 25000000 > ALL(SELECT population FROM world y WHERE x.continent = y.continent AND y.population > 0) -- where 25000000 is greater than all of the results from select the population column from table world (lets call this table y) where the continent is the same as the continent of the country it's being compared to in the first table and the population is not null

-- 4.10
SELECT name, continent FROM world x -- select the name and continent columns from the table world, lets call this table x
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND y.population > 0 AND y.name <> x.name) -- where the population is greater than all of the results from select the population column from table world (lets call this table y) where the continent is the same as the continent of the country it's being compared to in the first table and the population is not null and the name of the countries being compared are not equal

-- 5.1
SELECT SUM(population) FROM world -- select the total of all the values in the population column in the table world

-- 5.2
SELECT DISTINCT continent FROM world -- select the continent column of the table world but do not show any duplicate values

-- 5.3
SELECT SUM(gdp) FROM world -- select the total of all the values in the gdp column in the table world
WHERE continent = 'Africa' -- where the country's continent is Africa

-- 5.4
SELECT COUNT(name) FROM world -- select the amount of countries from the table world
WHERE area >= 1000000 -- where the country's area is greater than or equal to 1000000

-- 5.5
SELECT SUM(population) FROM world -- select the total of all the values in the population column in the table world
WHERE name IN ('Estonia','Latvia','Lithuania') -- where the name of the country is Estonia, Latvia, or Lithuania

-- 5.6
SELECT continent, COUNT(name) FROM world -- select the continent column and the total amount of countries in that continent in the table world
GROUP BY continent -- grouped by continent

-- 5.7
SELECT continent, COUNT(name) FROM world -- select the continent column and the total amount of countries in that continent in the table world
WHERE population >= 10000000 -- where the population is greater than or equal to 10,000,000
GROUP BY continent -- grouped by continent

-- 5.8
SELECT continent FROM world -- select the continent column in the table workd
GROUP BY continent -- grouped by continent
HAVING SUM(population) > 100000000 -- having a total population of greater than 10,000,000