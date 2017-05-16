CREATE TABLE restaurant (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR,
  distance INTEGER,
  stars INTEGER DEFAULT 0 CHECK (stars >=0 AND stars <=5),
  category VARCHAR,
  favorite_dish VARCHAR,
  does_takeout BOOLEAN,
  last_time_ate_here DATE
);

-- SQL QUERIES
-- 1. The names of the restaurants that you gave a 5 stars to
  SELECT * FROM restaurant WHERE stars = 5;
-- 2. The favorite dishes of all 5-star restaurants
  SELECT id, favorite_dish FROM restaurant WHERE stars = 5;
-- 3. The the id of a restaurant by a specific restaurant name, say 'Moon Tower'
SELECT id, name FROM restaurant WHERE name = 'Moon Tower';
-- 4. restaurants in the category of 'greek'
SELECT id, name FROM restaurant WHERE category = 'greek';
-- 5. restaurants that do take out
SELECT id, name FROM restaurant WHERE does_takeout = TRUE;
-- 6. restaurants that do take out and is in the category of 'BBQ'
SELECT id, name FROM restaurant WHERE does_takeout = TRUE AND category ILIKE '%Greek%';
-- 7. restaurants within 2 miles
SELECT id, name FROM restaurant WHERE distance <= 2;
-- 8. restaurants you haven't ate at in the last week
SELECT * FROM restaurant WHERE last_time_ate_here < '2017-05-08';
-- 9. restaurants you haven't ate at in the last week and has 5 stars


-- Aggregation and Sorting Queries
--
-- 1. list restaurants by the closest distance.
SELECT * FROM restaurant ORDER BY distance;
-- 2. list the top 2 restaurants by distance
SELECT * FROM restaurant ORDER BY distance LIMIT 2;
-- 3.list the top 2 restaurants by stars.
SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;
-- 4. list the top 2 restaurants by stars where the distance is less than 2 miles.
SELECT * FROM restaurant WHERE distance <=2 ORDER BY stars DESC  LIMIT 2;
-- 5. count the number of restaurants in the db.
SELECT COUNT(*) FROM restaurant;
-- 6. count the number of restaurants by category.
SELECT category,
  COUNT(*) AS num_restauraunts
FROM restaurant GROUP BY category;
-- 7. get the average stars per restaurant by category.
SELECT category,
  AVG(stars) AS average_stars
FROM restaurant GROUP BY category;
-- 8. get the max stars of a restaurant by category.
SELECT category,
  MAX(stars) AS max_stars
FROM restaurant GROUP BY category;
