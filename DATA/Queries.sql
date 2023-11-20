
USE WINE;

-- PROJECT

-- 1. Wine Production Countries total

select country, count(country) as wines_per_country
from wine
group by country
order by wines_per_country desc;

-- 2. Wine Production White

select country, count(country) as whites_per_country
from wine
where variety = "white"
group by country
order by whites_per_country desc;

-- 3. Wine Production Red

select country, count(country) as whites_per_country
from wine
where variety = "red"
group by country
order by whites_per_country desc;

-- 4. Regions production Germany white

select region, count(country) as White_per_region
from wine
where variety = "white" and region in ( "Ahr", "Baden", "Franken", "Mosel", "Nahe", "Pfalz", "Rheingau", "rheinhessen", "wehlen", "wiltingen")
group by region
order by whites_per_country desc;


-- 5. Regions production Italy red:

select region, count(country) as Red_per_region
from wine
where variety = "red" and region in ( "Toscana", "Barolo", "brunello di montalcino", "chianti classico", "puglia", "salento", 
										"südtirol - alto adige","terre siciliane", "toscana")
group by region
order by Red_per_region desc;


-- 6. Evolution white Germany

select year, count(name) as total_wines
from wine
where variety = "white" and country = "germany" and year in ( 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018)
group by year
order by year desc;


-- 7. Evolution red Italy

select year, count(name) as total_wines
from wine
where variety = "red" and country = "italy" and year in ( 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018)
group by year
order by year desc; 

-- 8. price rating wineries white wines Germany

SELECT WINERY, AVG(rating) as Rating, round(avg(price), 2) as Price
FROM wine
WHERE variety = 'white'
  AND country = 'Germany'
  AND rating BETWEEN 3.65 AND 3.75 
group by winery
order by price desc;
  
-- 9. price rating wineries red wineries Italy

SELECT WINERY, round(AVG(rating),1) as Rating, round(avg(price), 2) as Price
FROM wine
WHERE variety = 'red'
  AND country = 'italy'
  AND rating BETWEEN 3.75 AND 3.85 
group by winery
order by price desc;

--------------------------------------------

-- GENERAL QUERIES NOT USED IN THE PROJECT

-- 1. Wine rate per winery in Spain

SELECT winery, round(avg(rating), 2) as average_rating
from wine
where country = "spain"
group by winery
order by average_rating desc;


-- 3 Wine price per country

Select country, round(avg(price), 2) as avg_price 
from wine
group by country
order by avg_price desc;

-- RED avg price per country

SELECT country, variety, round(AVG(price), 2) AS avg_price
FROM wine
WHERE variety = 'red'  
GROUP BY country, variety
order by avg_price desc;

-- WHITE avg price per country

SELECT country, variety, round(AVG(price), 2) AS avg_price
FROM wine
WHERE variety = 'WHITE'  
GROUP BY country, variety
order by avg_price desc;

-- EVOLUTION RATING PER YEAR total wine --> we can see that quality has gone down through years

SELECT year, round(avg(rating),2) as Rating_Evolution
from wine
group by year
order by year asc;

-- EVOLUTION PRICE PER YEAR total wine

select avg(rating) 
from wine
where year = 1990;

-- DIFFERENCE PRICE Country
SELECT Country, round(avg(price),2) as Avg_Price
from wine
Group by country
order by avg_price desc;

-- EVOLUTION OF YEAR/RATE/REGION --
SELECT year, round(avg(rating),2) as Evolution_rating, Country
from wine
Group by year, country
order by year asc;

-- WHITE RED PRICE COMPARISON per region

SELECT country,
    round(AVG(CASE WHEN variety = 'red' THEN price END),2) AS avg_red_price,
    round(AVG(CASE WHEN variety = 'white' THEN price END), 2) AS avg_white_price
FROM wine
WHERE variety IN ('red', 'white')
GROUP BY country
order by country asc;

-- WHITE RED PER COUNTRY

SELECT country,
    SUM(CASE WHEN variety = 'red' THEN 1 ELSE 0 END) AS red_wine_count,
    SUM(CASE WHEN variety = 'white' THEN 1 ELSE 0 END) AS white_wine_count
FROM wine
WHERE variety IN ('red', 'white')
GROUP BY country
order by country asc;


-- WHITE/RED RATING PER REGION (Europe)

SELECT country, round(avg(rating),2) as Avg_Rating_Europe,
    SUM(CASE WHEN variety = 'red' THEN 1 ELSE 0 END) AS red_wine_count,
    SUM(CASE WHEN variety = 'white' THEN 1 ELSE 0 END) AS white_wine_count
FROM wine
WHERE variety IN ('red', 'white') and country in ("Austria", "bulgaria", "Croatia", "Czech Republic", 
"FRANCE", "germany", "greece", "hungary", "italy", "luxemburg", "portugal", "romania", "slovakia", "slovenia",
"spain", "switzerland", "turkey")

GROUP BY country
order by country asc;


-- Europe wineries avg rating and number of wines

SELECT winery, country, round(avg(rating),2) as Avg_Rating_Winery, count(winery) as Number_of_Wines
FROM wine
WHERE country in ("Austria", "bulgaria", "Croatia", "Czech Republic", 
"FRANCE", "germany", "greece", "hungary", "italy", "luxemburg", "portugal", "romania", "slovakia", "slovenia",
"spain", "switzerland", "turkey")
GROUP BY winery, country
order by Avg_Rating_Winery desc;

-- Wines most popular - more rated

SELECT name, numberofratings, country
from wine
order by numberofratings desc;

-- Country with more wines rated

SELECT country, sum(numberofratings) as Most_Ranked_Country
from wine
group by country
order by Most_Ranked_Country desc;

-- wineries that produce red wine
SELECT winery, country, count(winery) as number_of_wines
from wine
where variety = "Red" 
group by winery, country
order by number_of_wines desc;

-- wineries that produce white wine

SELECT winery, country, count(winery) as number_of_wines, variety
from wine
where variety = "white" 
group by winery, country
order by number_of_wines desc;


-- Wineries that produce both, and how many red/white: 

WITH WineryRedWhite AS (
    SELECT winery,
           SUM(CASE WHEN variety = 'red' THEN 1 ELSE 0 END) AS red_count,
           SUM(CASE WHEN variety = 'white' THEN 1 ELSE 0 END) AS white_count
    FROM wine
    WHERE variety IN ('red', 'white')
    GROUP BY winery
    HAVING red_count > 0 AND white_count > 0  -- Filtering wineries producing both red and white wines
)
SELECT winery, red_count AS number_of_red_wines, white_count AS number_of_white_wines
FROM WineryRedWhite
order by winery asc;

-- wines per region

select region, avg(rating)
from wine
group by region
order by region asc;

select name
from wine
where year = 2017 and rating = 4.3 and variety = "red" and country = "spain"
order by name;

select region
from wine
where country = "germany"
group by region;

-------------------





